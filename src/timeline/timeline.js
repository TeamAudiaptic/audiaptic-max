/**
 * Event lanes for the DAVHI timeline patch (v8ui).
 *
 * Draws the timeline's events in one lane per event type, aligned with the
 * waveform~ display window, and handles selecting, moving, and removing them.
 * The timeline itself lives in the named dict DICT_NAME, so the patch saves and
 * loads it as JSON without going through this script.
 *
 * Every saved event carries a relativeTimestamp: milliseconds from the start
 * of the audio, which is aligned with the performance's start event.
 */
autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const DICT_NAME = "davhi_timeline";
const BUFFER_NAME = "davhi_timeline_audio";
const TIMELINE_TYPE = "timeline";
const SCHEMA_VERSION = "1.0";

const LANES = ["haptic", "torch", "color", "caption", "image", "audio", "video", "other"];
const LANE_COLORS = {
	haptic: [0.93, 0.55, 0.2],
	torch: [0.95, 0.85, 0.3],
	color: [0.6, 0.6, 0.6],
	caption: [0.4, 0.75, 0.95],
	image: [0.55, 0.8, 0.45],
	audio: [0.75, 0.5, 0.9],
	video: [0.9, 0.45, 0.6],
	other: [0.7, 0.7, 0.7]
};
const LABEL_WIDTH = 64;
const PADDING_RIGHT = 60;
const RULER_HEIGHT = 18;
const MARKER_WIDTH = 6;
const TICK_STEPS_MS = [10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 15000, 30000, 60000, 120000, 300000];

const store = new Dict(DICT_NAME);

let timeline = emptyTimeline();
// Length of the loaded audio, read from the buffer~. It limits where events can
// be placed and is not saved with the timeline.
let audioDurationMs = 0;
let selected = new Set();
let viewStartMs = 0;
let viewLengthMs = 10000;
let positionMs = 0;
let drag = null;

function emptyTimeline() {
	return { events: [] };
}

/**
 * Wraps the timeline in the shared event envelope with type "timeline". The
 * connection patch assigns eventId, sequence, and sentTimestamp when sending,
 * so they are left out here as they are for every event patch.
 */
function toDocument(state) {
	return {
		schemaVersion: SCHEMA_VERSION,
		type: TIMELINE_TYPE,
		payload: {
			events: state.events
		}
	};
}

function isPlainObject(value) {
	return value !== null && typeof value === "object" && !Array.isArray(value);
}

function isEvent(value) {
	return isPlainObject(value) && typeof value.type === "string" && value.type.length > 0 && isPlainObject(value.payload);
}

function toMs(value) {
	const ms = Math.round(Number(value));
	return Number.isFinite(ms) && ms > 0 ? ms : 0;
}

function sortEvents(events) {
	// Array sort is stable, so events at the same time keep their order, which
	// decides their sequence when sent.
	events.sort((a, b) => a.relativeTimestamp - b.relativeTimestamp);
}

function normalizeTimeline(raw) {
	const result = emptyTimeline();
	if (!isPlainObject(raw) || raw.type !== TIMELINE_TYPE || !isPlainObject(raw.payload)) {
		return result;
	}
	const content = raw.payload;

	// A Max dictionary can collapse a one-element array into a single object.
	let events = content.events === undefined || content.events === null ? [] : content.events;
	if (!Array.isArray(events)) {
		events = [events];
	}
	result.events = events.filter(isEvent).map(event => ({
		schemaVersion: event.schemaVersion || SCHEMA_VERSION,
		type: event.type,
		relativeTimestamp: toMs(event.relativeTimestamp),
		payload: event.payload
	}));
	sortEvents(result.events);
	return result;
}

function load() {
	try {
		timeline = normalizeTimeline(JSON.parse(store.stringify()));
	} catch (error) {
		report(`Could not read ${DICT_NAME}: ${error.message}`);
		timeline = emptyTimeline();
	}
	selected = new Set();
}

function save() {
	sortEvents(timeline.events);
	store.parse(JSON.stringify(toDocument(timeline)));
}

function commit() {
	save();
	outputSelection();
	mgraphics.redraw();
}

function report(message) {
	outlet(0, "error", message);
}

function parseIncoming(args) {
	let event;
	try {
		event = JSON.parse(args.join(" "));
	} catch (error) {
		report(`Event is not valid JSON: ${error.message}`);
		return null;
	}
	if (!isEvent(event)) {
		report("Event needs a type and a payload object");
		return null;
	}
	return event;
}

function outputSelection() {
	if (selected.size === 1) {
		const [event] = selected;
		outlet(0, "selected", JSON.stringify(event));
	} else if (selected.size === 0) {
		outlet(0, "selected", "No event selected");
	} else {
		outlet(0, "selected", `${selected.size} events selected`);
	}
}

function maxTimeMs() {
	return audioDurationMs > 0 ? audioDurationMs : Infinity;
}

function clampMs(ms) {
	return Math.min(Math.max(0, Math.round(ms)), maxTimeMs());
}

function movePosition(ms) {
	positionMs = clampMs(ms);
	outlet(0, "position", positionMs);
}

// Messages from the patch

function loadbang() {
	reload();
}

function bang() {
	mgraphics.redraw();
}

/** Re-reads the dict, for example after the patch loads a timeline file. */
function reload() {
	load();
	outputSelection();
	mgraphics.redraw();
}

/** Adds an event JSON string from an event patch at the current position. */
function add(...args) {
	const incoming = parseIncoming(args);
	if (incoming === null) {
		return;
	}
	const event = {
		schemaVersion: incoming.schemaVersion || SCHEMA_VERSION,
		type: incoming.type,
		relativeTimestamp: toMs(positionMs),
		payload: incoming.payload
	};
	timeline.events.push(event);
	selected = new Set([event]);
	commit();
}

/** Replaces the selected event's type and payload, keeping its time. */
function replace(...args) {
	if (selected.size !== 1) {
		report("Select exactly one event to replace");
		return;
	}
	const incoming = parseIncoming(args);
	if (incoming === null) {
		return;
	}
	const [event] = selected;
	event.schemaVersion = incoming.schemaVersion || SCHEMA_VERSION;
	event.type = incoming.type;
	event.payload = incoming.payload;
	commit();
}

function remove() {
	if (selected.size === 0) {
		return;
	}
	timeline.events = timeline.events.filter(event => !selected.has(event));
	selected = new Set();
	commit();
}

// Not named "position": that is a box attribute, so Max would move the v8ui
// itself instead of calling this function.
function playhead(ms) {
	positionMs = Math.max(0, Number(ms) || 0);
	mgraphics.redraw();
}

function displaystart(ms) {
	viewStartMs = Number(ms) || 0;
	mgraphics.redraw();
}

function displaylength(ms) {
	const lengthMs = Number(ms);
	if (lengthMs > 0) {
		viewLengthMs = lengthMs;
		mgraphics.redraw();
	}
}

/** Reads the loaded audio's length from the buffer~ once it finishes loading. */
function audioloaded() {
	const lengthMs = new Buffer(BUFFER_NAME).length();
	audioDurationMs = Math.round(lengthMs);
	if (lengthMs > 0) {
		viewStartMs = 0;
		viewLengthMs = lengthMs;
	}
	outlet(0, "duration", lengthMs);
	mgraphics.redraw();
}

// Geometry

function viewSize() {
	const size = mgraphics.size;
	if (size && size[0] > 0) {
		return [size[0], size[1]];
	}
	const rect = box.rect;
	return [rect[2] - rect[0], rect[3] - rect[1]];
}

function plotWidth(width) {
	return Math.max(1, width - LABEL_WIDTH - PADDING_RIGHT);
}

function msToX(ms, width) {
	return LABEL_WIDTH + (ms - viewStartMs) / viewLengthMs * plotWidth(width);
}

function xToMs(x, width) {
	return viewStartMs + (x - LABEL_WIDTH) / plotWidth(width) * viewLengthMs;
}

function laneHeight(height) {
	return (height - RULER_HEIGHT) / LANES.length;
}

function laneIndex(type) {
	const index = LANES.indexOf(type);
	return index >= 0 ? index : LANES.length - 1;
}

function eventRect(event, width, height) {
	const lane = laneHeight(height);
	const durationMs = Number(event.payload.durationMs) || 0;
	const eventWidth = durationMs > 0
		? Math.max(MARKER_WIDTH, durationMs / viewLengthMs * plotWidth(width))
		: MARKER_WIDTH;
	return [
		msToX(event.relativeTimestamp, width),
		RULER_HEIGHT + laneIndex(event.type) * lane + 2,
		eventWidth,
		lane - 4
	];
}

function hitTest(x, y, width, height) {
	for (let i = timeline.events.length - 1; i >= 0; i -= 1) {
		const event = timeline.events[i];
		const [left, top, eventWidth, eventHeight] = eventRect(event, width, height);
		if (x >= left && x <= left + eventWidth && y >= top && y <= top + eventHeight) {
			return event;
		}
	}
	return null;
}

// Mouse

function onclick(x, y, button, mod1, shift) {
	const [width, height] = viewSize();
	const hit = hitTest(x, y, width, height);
	if (hit !== null) {
		if (shift) {
			if (selected.has(hit)) {
				selected.delete(hit);
			} else {
				selected.add(hit);
			}
		} else if (!selected.has(hit)) {
			selected = new Set([hit]);
		}
		drag = {
			kind: "move",
			startX: x,
			origins: new Map([...selected].map(event => [event, event.relativeTimestamp])),
			moved: false
		};
	} else {
		if (!shift) {
			selected = new Set();
		}
		drag = { kind: "scrub" };
		if (x >= LABEL_WIDTH) {
			movePosition(xToMs(x, width));
		}
	}
	outputSelection();
	mgraphics.redraw();
}

function ondrag(x, y, button) {
	if (drag === null) {
		return;
	}
	const [width] = viewSize();
	if (!button) {
		if (drag.kind === "move" && drag.moved) {
			save();
			outputSelection();
		}
		drag = null;
		return;
	}
	if (drag.kind === "move") {
		const deltaMs = (x - drag.startX) / plotWidth(width) * viewLengthMs;
		for (const [event, originMs] of drag.origins) {
			event.relativeTimestamp = clampMs(originMs + deltaMs);
		}
		drag.moved = true;
	} else if (x >= LABEL_WIDTH) {
		movePosition(xToMs(x, width));
	}
	mgraphics.redraw();
}

function onresize() {
	mgraphics.redraw();
}

// Drawing

function setColor(rgb, alpha = 1) {
	mgraphics.set_source_rgba(rgb[0], rgb[1], rgb[2], alpha);
}

function fillRect(x, y, width, height) {
	mgraphics.rectangle(x, y, width, height);
	mgraphics.fill();
}

function hexToRgb(hex) {
	const match = /^#([0-9a-fA-F]{6})/.exec(String(hex));
	if (match === null) {
		return null;
	}
	const value = parseInt(match[1], 16);
	return [(value >> 16 & 255) / 255, (value >> 8 & 255) / 255, (value & 255) / 255];
}

function tickStepMs(width) {
	const rawStepMs = viewLengthMs * 80 / plotWidth(width);
	return TICK_STEPS_MS.find(step => step >= rawStepMs) || TICK_STEPS_MS[TICK_STEPS_MS.length - 1];
}

function darken(rgb, amount = 0.5) {
	return rgb.map(channel => channel * amount);
}


function formatTime(ms) {
	const total = Math.round(ms);
	const minutes = Math.floor(total / 60000);
	const seconds = Math.floor(total % 60000 / 1000);
	const millis = total % 1000;
	return `${minutes}:${String(seconds).padStart(2, "0")}.${String(millis).padStart(3, "0")}`;
}

function paint() {
	const [width, height] = viewSize();
	const lane = laneHeight(height);
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(10);

	setColor([0.12, 0.12, 0.13]);
	fillRect(0, 0, width, height);
	LANES.forEach((name, index) => {
		if (index % 2 === 1) {
			setColor([0.16, 0.16, 0.17]);
			fillRect(LABEL_WIDTH, RULER_HEIGHT + index * lane, width - LABEL_WIDTH, lane);
		}
	});

	const stepMs = tickStepMs(width);
	const firstTickMs = Math.ceil(viewStartMs / stepMs) * stepMs;
	setColor([1, 1, 1], 0.08);
	mgraphics.set_line_width(1);
	for (let ms = firstTickMs; ms <= viewStartMs + viewLengthMs; ms += stepMs) {
		const x = msToX(ms, width);
		mgraphics.move_to(x, RULER_HEIGHT);
		mgraphics.line_to(x, height);
	}
	mgraphics.stroke();

	if (audioDurationMs > 0) {
		const endX = Math.max(LABEL_WIDTH, msToX(audioDurationMs, width));
		if (endX < width) {
			setColor([0, 0, 0], 0.4);
			fillRect(endX, RULER_HEIGHT, width - endX, height - RULER_HEIGHT);
		}
	}

	for (const event of timeline.events) {
		const [x, y, eventWidth, eventHeight] = eventRect(event, width, height);
		if (x + eventWidth < LABEL_WIDTH || x > width) {
			continue;
		}
		const base = (event.type === "color" ? hexToRgb(event.payload.color) : null)
			|| LANE_COLORS[LANES[laneIndex(event.type)]];
		setColor(base, 0.85);
		fillRect(x, y, eventWidth, eventHeight);
		setColor(darken(base));

		mgraphics.set_line_width(2);
		mgraphics.rectangle(x, y, eventWidth, eventHeight);
		mgraphics.stroke();
		if (selected.has(event)) {
			setColor([1, 1, 1]);
			mgraphics.set_line_width(2);
			mgraphics.rectangle(x, y, eventWidth, eventHeight);
			mgraphics.stroke();
		}
	}

	setColor([0.09, 0.09, 0.1]);
	fillRect(0, RULER_HEIGHT, LABEL_WIDTH, height - RULER_HEIGHT);
	setColor([0.85, 0.85, 0.85]);
	LANES.forEach((name, index) => {
		mgraphics.move_to(6, RULER_HEIGHT + index * lane + lane / 2 + 4);
		mgraphics.show_text(name);
	});

	setColor([0.09, 0.09, 0.1]);
	fillRect(0, 0, width, RULER_HEIGHT);
	setColor([0.7, 0.7, 0.7]);
	for (let ms = firstTickMs; ms <= viewStartMs + viewLengthMs; ms += stepMs) {
		const x = msToX(ms, width);
		if (x >= LABEL_WIDTH && x < width - 20) {
			mgraphics.move_to(x + 2, 12);
			mgraphics.show_text(formatTime(ms));
		}
	}

	const positionX = msToX(positionMs, width);
	if (positionX >= LABEL_WIDTH && positionX <= width) {
		setColor([1, 0.3, 0.3]);
		mgraphics.set_line_width(1.5);
		mgraphics.move_to(positionX, 0);
		mgraphics.line_to(positionX, height);
		mgraphics.stroke();
	}
}
