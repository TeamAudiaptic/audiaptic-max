const path = require("path");
const { randomUUID } = require("crypto");
const { performance } = require("perf_hooks");
const WebSocket = require("ws");
const dotenv = require("dotenv");
const maxAPI = require("max-api");
const { createTimeSync } = require("./timeSync");

const ENV_PATH = path.join(__dirname, ".env");
const TIME_REQUEST_TIMEOUT_MS = 2000;

let socket = null;
let connecting = null;
let universalDelayMs = 0;
let nextSequence = 0;
let timeURL = null;
let warnedUnsynced = false;

function isNonNegativeInteger(value) {
	return Number.isSafeInteger(value) && value >= 0;
}

/**
 * Converts a frame received from Max into a JavaScript value: either one event
 * or a list of events.
 *
 * Event patches normally send a serialized JSON event or list of events.
 * Depending on how the Max message is produced, that JSON can arrive as one
 * string atom or several whitespace-delimited atoms. Rejoining the latter with
 * spaces preserves valid JSON whitespace before parsing. A direct object or
 * array is also accepted for programmatic callers.
 *
 * @param {unknown[]} argumentsList The arguments received by the send handler.
 * @returns {*} The direct value or the value parsed from the JSON input.
 * @throws {Error} If the serialized input is not valid JSON.
 */
function parseFrame(argumentsList) {
	if (argumentsList.length === 1 && argumentsList[0] !== null && typeof argumentsList[0] === "object") {
		return argumentsList[0];
	}

	const rawFrame = argumentsList.join(" ");
	try {
		return JSON.parse(rawFrame);
	} catch (error) {
		throw new Error(`send requires a JSON event or list of events: ${error.message}`);
	}
}

/**
 * Reads the DAVHI server's clock once. The time sync controller measures the
 * round trip around this call.
 *
 * @returns {Promise<number>} The server's Unix-epoch milliseconds.
 */
async function fetchServerTime() {
	if (typeof fetch !== "function") {
		throw new Error("this Node version has no fetch; Node 18 or later is required");
	}
	if (timeURL === null) {
		timeURL = loadConfiguration().timeURL;
	}

	const response = await fetch(timeURL, {
		cache: "no-store",
		signal: AbortSignal.timeout(TIME_REQUEST_TIMEOUT_MS)
	});
	if (!response.ok) {
		throw new Error(`${timeURL} returned HTTP ${response.status}`);
	}
	const body = await response.json();
	if (body === null || typeof body !== "object" || !Number.isFinite(body.serverTimestamp)) {
		throw new Error(`${timeURL} did not return a serverTimestamp`);
	}
	return body.serverTimestamp;
}

function roundTenth(value) {
	return Math.round(value * 10) / 10;
}

/**
 * Reports the clock sync state: sync <state> <offsetMs> <errorMs> <ageMs>.
 * offsetMs is what is added to this machine's clock to get server time.
 */
async function emitSyncStatus() {
	const status = timeSync.status();
	await maxAPI.outlet(
		"sync",
		status.synced ? "synced" : "unsynced",
		roundTenth(status.offset),
		roundTenth(status.error),
		Math.round(status.age)
	);
}

const timeSync = createTimeSync({
	fetchServerTime,
	monotonicNow: () => performance.now(),
	wallNow: () => Date.now(),
	onResult: result => {
		if (result.accepted) {
			warnedUnsynced = false;
		}
		const report = result.reason === null
			? emitSyncStatus()
			: emitError("sync", "-", result.reason).then(emitSyncStatus);
		report.catch(error => {
			maxAPI.post(error.message, maxAPI.POST_LEVELS.ERROR);
		});
	}
});

/**
 * Current time on the server's clock (whole epoch ms).
 * - Offset already applied; don't add it again.
 * - For timestamps created here; patch-supplied ones use convertEpochTimestamp.
 * - Local clock until the first sync.
 */
function serverNow() {
	return Math.round(timeSync.serverNow());
}

function hasTimestamp(event, field) {
	return Object.hasOwn(event, field) && event[field] !== null && event[field] !== 0;
}

/**
 * Moves an epochTimestamp supplied by a patch from this machine's clock to
 * the DAVHI server's clock. Patches always work in local time; the offset is
 * applied here and nowhere else. Values that are not numbers are left for the
 * server to reject.
 *
 * @param {object} event An event that may carry an epochTimestamp.
 * @returns {object} The event with any epochTimestamp on the server clock.
 */
function convertEpochTimestamp(event) {
	if (!hasTimestamp(event, "epochTimestamp") || !Number.isFinite(event.epochTimestamp)) {
		return event;
	}
	return { ...event, epochTimestamp: Math.round(event.epochTimestamp + timeSync.wallOffset()) };
}

function resolveEpochTimestamp(event) {
	if (hasTimestamp(event, "epochTimestamp")) {
		return convertEpochTimestamp(event).epochTimestamp;
	}

	if (hasTimestamp(event, "relativeTimestamp")) {
		return null;
	}

	return serverNow() + universalDelayMs;
}

/**
 * Adds the connection-owned fields to an event. Event patches must not supply
 * these values: a UUID identifies this submission and sequence orders events
 * for the lifetime of this Node for Max process.
 *
 * @param {object} event The event payload supplied by Max.
 * @returns {object} The event with a generated eventId and sequence.
 */
function assignEventIdentity(event) {
	const identifiedEvent = {
		...event,
		eventId: randomUUID(),
		sequence: nextSequence
	};
	nextSequence += 1;
	return identifiedEvent;
}

/**
 * The time endpoint is GET /api/time on the same host as the performer
 * WebSocket (ws://host/api/performer -> http://host/api/time).
 * DAVHI_TIME_URL overrides it.
 */
function resolveTimeURL(webSocketURL) {
	const override = process.env.DAVHI_TIME_URL;
	if (typeof override === "string" && override.length > 0) {
		let parsedOverride;
		try {
			parsedOverride = new URL(override);
		} catch (error) {
			throw new Error(`DAVHI_TIME_URL is invalid: ${error.message}`);
		}
		if (parsedOverride.protocol !== "http:" && parsedOverride.protocol !== "https:") {
			throw new Error("DAVHI_TIME_URL must use http: or https:");
		}
		return parsedOverride.toString();
	}

	const derived = new URL("time", webSocketURL);
	derived.protocol = webSocketURL.protocol === "wss:" ? "https:" : "http:";
	derived.search = "";
	return derived.toString();
}

function loadConfiguration() {
	dotenv.config({ path: ENV_PATH, override: false, quiet: true });
	const url = process.env.DAVHI_WEBSOCKET_URL;
	const token = process.env.DAVHI_PERFORMANCE_TOKEN;

	if (typeof url !== "string" || url.length === 0) {
		throw new Error("DAVHI_WEBSOCKET_URL is required");
	}
	if (typeof token !== "string" || token.length === 0) {
		throw new Error("DAVHI_PERFORMANCE_TOKEN is required");
	}

	let parsedURL;
	try {
		parsedURL = new URL(url);
	} catch (error) {
		throw new Error(`DAVHI_WEBSOCKET_URL is invalid: ${error.message}`);
	}
	if (parsedURL.protocol !== "ws:" && parsedURL.protocol !== "wss:") {
		throw new Error("DAVHI_WEBSOCKET_URL must use ws: or wss:");
	}

	return { url: parsedURL.toString(), token, timeURL: resolveTimeURL(parsedURL) };
}

function socketIsOpen() {
	return socket !== null && socket.readyState === WebSocket.OPEN;
}

async function emitError(scope, eventId, message) {
	console.warn(`API Error in ${scope} with event id ${eventId}:${message}`);
	await maxAPI.outlet("error", scope, eventId || "-", message);
}

async function handleInboundMessage(rawMessage) {
	let message;
	try {
		message = JSON.parse(rawMessage.toString());
	} catch (error) {
		await emitError("protocol", "-", "Server sent invalid JSON");
		return;
	}

	// Acks are not validated here; the server owns their shape. See
	// https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events/acknowledgements
	if (message !== null && typeof message === "object" && message.type === "ack") {
		await maxAPI.outlet("ack", rawMessage.toString());
		return;
	}

	// Future server-to-Max performance events and metadata messages route here.
	await maxAPI.outlet("inbound", rawMessage.toString());
}

function attachSocketHandlers(nextSocket, url) {
	nextSocket.on("message", message => {
		handleInboundMessage(message).catch(error => {
			maxAPI.post(error.message, maxAPI.POST_LEVELS.ERROR);
		});
	});

	nextSocket.on("close", (code, reason) => {
		if (socket === nextSocket) {
			socket = null;
			timeSync.stop();
		}
		const detail = reason.toString();
		maxAPI.outlet("connection", "disconnected", code, detail).catch(error => {
			maxAPI.post(error.message, maxAPI.POST_LEVELS.ERROR);
		});
	});

	nextSocket.on("error", error => {
		maxAPI.post(`WebSocket error: ${error.message}`, maxAPI.POST_LEVELS.ERROR);
	});

	maxAPI.post(`Connecting to ${url}`);
}

function openConnection() {
	if (socketIsOpen()) {
		return Promise.resolve();
	}
	if (connecting !== null) {
		return connecting;
	}

	const configuration = loadConfiguration();
	timeURL = configuration.timeURL;
	connecting = new Promise((resolve, reject) => {
		const nextSocket = new WebSocket(configuration.url, {
			headers: { Authorization: `Bearer ${configuration.token}` },
			handshakeTimeout: 10000
		});
		attachSocketHandlers(nextSocket, configuration.url);

		const rejectConnection = error => {
			nextSocket.terminate();
			reject(error);
		};

		nextSocket.once("open", () => {
			socket = nextSocket;
			resolve();
		});
		nextSocket.once("unexpected-response", (_request, response) => {
			rejectConnection(new Error(`Server rejected the WebSocket upgrade with HTTP ${response.statusCode}`));
		});
		nextSocket.once("error", error => {
			if (!socketIsOpen()) {
				rejectConnection(error);
			}
		});
	}).finally(() => {
		connecting = null;
	});

	return connecting;
}

async function connect() {
	try {
		await openConnection();
		// One burst before anything timed is sent, then every 60 s until the
		// socket closes. A failed burst is reported but does not block sending.
		await timeSync.start();
		await maxAPI.outlet("connection", "connected");
	} catch (error) {
		await emitError("connection", "-", error.message);
	}
}

async function disconnect() {
	if (connecting !== null) {
		await connecting.catch(() => {});
	}
	if (socket === null) {
		await maxAPI.outlet("connection", "disconnected");
		return;
	}

	const closingSocket = socket;
	await new Promise(resolve => {
		closingSocket.once("close", resolve);
		closingSocket.close(1000, "Disconnected by Max");
	});
}

async function setDelay(value) {
	const parsedValue = Number(value);
	if (!isNonNegativeInteger(parsedValue)) {
		await emitError("configuration", "-", "Universal delay must be a non-negative integer in milliseconds");
		return;
	}

	universalDelayMs = parsedValue;
	await maxAPI.outlet("delay", universalDelayMs);
}

/**
 * Runs a clock sync burst now, in addition to the automatic ones. The result
 * is reported on the sync outlet, or as a sync error.
 */
async function sync() {
	await timeSync.syncNow();
}

/**
 * Prepares a parsed frame for the server. A single event gets an identity, a
 * resolved epochTimestamp, and a sentTimestamp. Each event in a list gets an
 * identity and a sentTimestamp, with sequences in list order; list events are
 * expected to carry their own timing, so no epochTimestamp is added.
 *
 * Every timestamp is on the DAVHI server's clock: sentTimestamp and the
 * fallback epochTimestamp are read from it, and an epochTimestamp supplied by
 * a patch is converted to it. relativeTimestamp is an offset and is unchanged.
 *
 * @param {*} frame A single event or a list of events.
 * @returns {object | object[]} The frame to send, in the same form it arrived.
 */
function prepareFrame(frame) {
	const sentTimestamp = serverNow();
	if (Array.isArray(frame)) {
		return frame.map(event => ({ ...convertEpochTimestamp(assignEventIdentity(event)), sentTimestamp }));
	}

	const event = assignEventIdentity(frame);
	return { ...event, epochTimestamp: resolveEpochTimestamp(event), sentTimestamp };
}

async function emitErrorForEach(events, message) {
	for (const event of events) {
		await emitError("send", event.eventId, message);
	}
}

async function send(...argumentsList) {
	let frame;
	try {
		frame = prepareFrame(parseFrame(argumentsList));
	} catch (error) {
		await emitError("send", "-", error.message);
		return;
	}
	const events = Array.isArray(frame) ? frame : [frame];

	if (!timeSync.isSynced() && !warnedUnsynced) {
		warnedUnsynced = true;
		maxAPI.post(
			"Clock is not synced with the DAVHI server; timestamps use this machine's clock.",
			maxAPI.POST_LEVELS.WARN
		);
	}

	if (!socketIsOpen()) {
		await emitErrorForEach(events, "WebSocket is not connected");
		return;
	}

	const serializedFrame = JSON.stringify(frame);
	try {
		console.log(`send: ${serializedFrame}`);
		await new Promise((resolve, reject) => {
			socket.send(serializedFrame, error => (error ? reject(error) : resolve()));
		});
		for (const event of events) {
			const epochTimestamp = event.epochTimestamp === undefined || event.epochTimestamp === null ? "null" : event.epochTimestamp;
			await maxAPI.outlet("sent", event.eventId, epochTimestamp);
		}
		await maxAPI.outlet("sent", serializedFrame);
	} catch (error) {
		await emitErrorForEach(events, error.message);
	}
}

maxAPI.addHandlers({
	connect,
	disconnect,
	setDelay,
	getDelay: async () => maxAPI.outlet("delay", universalDelayMs),
	sync,
	getSync: emitSyncStatus,
	send
});

maxAPI.post("Audiaptic connection ready. Send connect to open the WebSocket.");
