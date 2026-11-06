/**
 * Validation for Audiaptic's baseline event schemas.
 *
 * These validators mirror the published event documentation. Zone targeting
 * and keyframes are planned extensions and are intentionally rejected until
 * the server and mobile client support them.
 */
const SCHEMA_VERSION = "1.0"

function isPlainObject(value) {
	return value !== null && typeof value === "object" && !Array.isArray(value);
}

function isNonNegativeInteger(value) {
	return Number.isSafeInteger(value) && value >= 0;
}

function isNormalizedNumber(value) {
	return typeof value === "number" && Number.isFinite(value) && value >= 0 && value <= 1;
}

function requirePlainObject(value, field) {
	if (!isPlainObject(value)) {
		throw new Error(`${field} must be an object and is ${value}`);
	}
}

function requireString(value, field) {
	if (typeof value !== "string" || value.length === 0) {
		throw new Error(`${field} must be a non-empty string and is ${value}`);
	}
}

function requireDuration(value, field) {
	if (!isNonNegativeInteger(value)) {
		throw new Error(`${field} must be a non-negative integer in milliseconds and is ${value}`);
	}
}

function requireNullOrNonNegativeInt(value, field) {
	if (value !== undefined && value !== null && !isNonNegativeInteger(value)) {
		throw new Error(`${field} must be null or non-negative integer in milliseconds and is ${value}`);
	}
}

function validateOptionalDuration(payload, field) {
	if (payload[field] !== undefined) {
		requireDuration(payload[field], `payload.${field}`);
	}
}

function validateOptionalTransition(payload) {
	if (payload.transitionMs !== undefined && payload.transitionMs !== null) {
		requireDuration(payload.transitionMs, "payload.transitionMs");
	}
}

function validateHapticPayload(payload) {
	requirePlainObject(payload, "payload");
	if (!isNormalizedNumber(payload.intensity)) {
		throw new Error("payload.intensity must be a number from 0 through 1 and is ${value}");
	}
	if (payload.sharpness !== undefined && !isNormalizedNumber(payload.sharpness)) {
		throw new Error("payload.sharpness must be a number from 0 through 1 and is ${value}");
	}
	requireDuration(payload.durationMs, "payload.durationMs");
	validateOptionalTransition(payload);
}

function validateTorchPayload(payload) {
	requirePlainObject(payload, "payload");
	requireDuration(payload.durationMs, "payload.durationMs");
	if (payload.intensity !== undefined && !Number.isSafeInteger(payload.intensity)) {
		throw new Error("payload.intensity must be an integer and is ${value}");
	}
	validateOptionalTransition(payload);
}

function validateColorPayload(payload) {
	requirePlainObject(payload, "payload");
	if (typeof payload.color !== "string" || !/^#[0-9A-Fa-f]{6}$/.test(payload.color)) {
		throw new Error(`payload.color must be a six-digit sRGB hex string and is ${value}`);
	}
	requireDuration(payload.durationMs, "payload.durationMs");
	validateOptionalTransition(payload);
}

function validateCaptionPayload(payload) {
	requirePlainObject(payload, "payload");
	if (typeof payload.text !== "string") {
		throw new Error(`payload.text must be a string and is ${typeof payload.text}`);
	}
	validateOptionalDuration(payload, "durationMs");
}

function validateImagePayload(payload) {
	requirePlainObject(payload, "payload");
	requireString(payload.assetAlias, "payload.assetAlias");
	validateOptionalDuration(payload, "durationMs");
	validateOptionalTransition(payload);
}

function validateAudioPayload(payload) {
	requirePlainObject(payload, "payload");
	requireString(payload.assetAlias, "payload.assetAlias");
	validateOptionalDuration(payload, "startOffsetMs");
	validateOptionalDuration(payload, "durationMs");
	validateOptionalTransition(payload);
}

function validateVideoPayload(payload) {
	requirePlainObject(payload, "payload");
	requireString(payload.assetAlias, "payload.assetAlias");
	validateOptionalDuration(payload, "startOffsetMs");
	validateOptionalDuration(payload, "durationMs");
	if (payload.loop !== undefined && typeof payload.loop !== "boolean") {
		throw new Error("payload.loop must be a boolean");
	}
	validateOptionalTransition(payload);
}

const payloadValidators = {
	haptic: validateHapticPayload,
	torch: validateTorchPayload,
	color: validateColorPayload,
	caption: validateCaptionPayload,
	image: validateImagePayload,
	audio: validateAudioPayload,
	video: validateVideoPayload,
	ping: () => null
};

function validatePayload(type, payload) {
	const validate = payloadValidators[type];
	if (validate === undefined) {
		throw new Error(`Unsupported event type: ${type}`);
	}
	validate(payload);
}

function validateEvent(event) {
	requirePlainObject(event, "Event");
	if (event.target !== undefined) {
		throw new Error("target is not supported yet");
	}
	if (event.schemaVersion !== SCHEMA_VERSION) {
		throw new Error(`schemaVersion must be \"${SCHEMA_VERSION}\"`);
	}
	requireString(event.eventId, "eventId");
	if (!Number.isSafeInteger(event.sequence)) {
		throw new Error("sequence must be an integer");
	}
	requireString(event.type, "type");
	requireDuration(event.sentTimestamp, "sentTimestamp");
	requireNullOrNonNegativeInt(event.epochTimestamp, "epochTimestamp");
	requireNullOrNonNegativeInt(event.realativeTimestamp, "relativeTimestamp");
	validatePayload(event.type, event.payload);
}

module.exports = {
	SCHEMA_VERSION,
	validateHapticPayload,
	validateTorchPayload,
	validateColorPayload,
	validateCaptionPayload,
	validateImagePayload,
	validateAudioPayload,
	validateVideoPayload,
	validatePayload,
	validateEvent
};
