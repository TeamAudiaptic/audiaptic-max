const path = require("path");
const { randomUUID } = require("crypto");
const WebSocket = require("ws");
const dotenv = require("dotenv");
const maxAPI = require("max-api");
const { validateEvent } = require("../shared/validation-utils");

const ENV_PATH = path.join(__dirname, ".env");

let socket = null;
let connecting = null;
let universalDelayMs = 0;
let nextSequence = 0;

function isNonNegativeInteger(value) {
	return Number.isSafeInteger(value) && value >= 0;
}

/**
 * Converts an event received from Max into a JavaScript value.
 *
 * Event patches normally send a serialized JSON event. Depending on how the
 * Max message is produced, that JSON can arrive as one string atom or several
 * whitespace-delimited atoms. Rejoining the latter with spaces preserves valid
 * JSON whitespace before parsing. A direct object is also accepted for
 * programmatic callers.
 *
 * @param {unknown[]} argumentsList The arguments received by the send handler.
 * @returns {*} The direct object or value parsed from the JSON input.
 * @throws {Error} If the serialized input is not valid JSON.
 */
function parseEvent(argumentsList) {
	if (argumentsList.length === 1 && argumentsList[0] !== null && typeof argumentsList[0] === "object" && !Array.isArray(argumentsList[0])) {
		return argumentsList[0];
	}

	const rawEvent = argumentsList.join(" ");
	try {
		return JSON.parse(rawEvent);
	} catch (error) {
		throw new Error(`send requires a JSON event object: ${error.message}`);
	}
}

function resolveExecTimestamp(event) {
	if (event.execTimestamp !== null || universalDelayMs === 0) {
		return event.execTimestamp;
	}
	return Date.now() + universalDelayMs;
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
	return identifiedEvent;
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

	return { url: parsedURL.toString(), token };
}

function socketIsOpen() {
	return socket !== null && socket.readyState === WebSocket.OPEN;
}

async function emitError(scope, eventId, message) {
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

	if (message === null || typeof message !== "object" || Array.isArray(message) || typeof message.type !== "string") {
		await emitError("protocol", "-", "Server message must include a string type");
		return;
	}

	if (message.type === "ack") {
		if (typeof message.eventId !== "string" || !Number.isInteger(message.status)) {
			await emitError("protocol", "-", "Acknowledgement requires eventId and integer status");
			return;
		}
		await maxAPI.outlet("ack", message.eventId, message.status, message.error || "");
		return;
	}

	// Future server-to-Max performance events and metadata messages route here.
	await maxAPI.outlet("inbound", message.type, JSON.stringify(message));
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

async function send(...argumentsList) {
	let event;
	try {
		event = assignEventIdentity(parseEvent(argumentsList));
		validateEvent(event);
	} catch (error) {
		await emitError("send", event && event.eventId, error.message);
		return;
	}

	if (!socketIsOpen()) {
		await emitError("send", event.eventId, "WebSocket is not connected");
		return;
	}

	const eventToSend = { ...event, execTimestamp: resolveExecTimestamp(event) };
	nextSequence += 1;
	try {
		await new Promise((resolve, reject) => {
			socket.send(JSON.stringify(eventToSend), error => (error ? reject(error) : resolve()));
		});
		await maxAPI.outlet("sent", eventToSend.eventId, eventToSend.execTimestamp === null ? "null" : eventToSend.execTimestamp);
	} catch (error) {
		await emitError("send", event.eventId, error.message);
	}
}

maxAPI.addHandlers({
	connect,
	disconnect,
	setDelay,
	getDelay: async () => maxAPI.outlet("delay", universalDelayMs),
	send
});

maxAPI.post("Audiaptic connection ready. Send connect to open the WebSocket.");
