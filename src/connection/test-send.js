const maxAPI = require("max-api");

/**
 * Node for Max test-event generator.
 *
 * Send one of these messages to [node.script test-send.js]:
 * haptic, torch, color, caption, image, audio, or video.
 *
 * The left outlet emits one serialized event JSON string, suitable for the
 * event inlet of connection.maxpat. The connection script assigns the final
 * eventId and sequence when it sends the event.
 */

let nextSequence = 0;

function createEnvelope(type, payload) {

	return {
		schemaVersion: "1.0",
		eventId: null,
		type,
		sequence: null,
		// The published envelope includes timestamp; null requests immediate execution.
		sentTimestamp: null,
		execTimestamp: null,
		payload
	};
}

const mockPayloads = {
	haptic: {
		intensity: 0.75,
		sharpness: 0.4,
		durationMs: 600,
		transitionMs: 100
	},
	torch: {
		durationMs: 250,
		intensity: 1,
		transitionMs: 100
	},
	color: {
		color: "#0057FF",
		durationMs: 1500,
		transitionMs: 250
	},
	caption: {
		text: "Follow the lights",
		durationMs: 3000
	},
	image: {
		assetAlias: "example.jpg",
		durationMs: 8000,
		transitionMs: 250
	},
	audio: {
		assetAlias: "low-drone.mp3",
		startOffsetMs: 12000,
		durationMs: 5000,
		transitionMs: 250
	},
	video: {
		assetAlias: "opening-loop.mp4",
		startOffsetMs: 0,
		durationMs: 10000,
		loop: true,
		transitionMs: 250
	}
};

async function emitMockEvent(type) {
	await maxAPI.outlet(JSON.stringify(createEnvelope(type, mockPayloads[type])));
}

maxAPI.addHandlers({
	haptic: () => emitMockEvent("haptic"),
	torch: () => emitMockEvent("torch"),
	color: () => emitMockEvent("color"),
	caption: () => emitMockEvent("caption"),
	image: () => emitMockEvent("image"),
	audio: () => emitMockEvent("audio"),
	video: () => emitMockEvent("video")
});

maxAPI.post("Test sender ready. Send haptic, torch, color, caption, image, audio, or video.");
