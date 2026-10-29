autowatch = 1;
inlets = 1;
outlets = 1;

var durationMs = 250;
var execTimestamp = 0;
var transitionMs = 0;
var intensityValue = 0;
var strobeEnabledValue = 0;
var strobeHzValue = 0;
var dutyCycleValue = 0.5;

function strobeEnabled(value) {
    if (value !== 0 && value !== 1) {
        error("Torch strobeEnabled must be 0 or 1.\n");
        return;
    }
    strobeEnabledValue = value;
}

function strobeHz(value) {
    if (typeof value !== "number" || !isFinite(value)) {
        error("Torch strobeHz must be a finite number.\n");
        return;
    }
    strobeHzValue = Math.max(0, Math.min(20, value));
}

function dutyCycle(value) {
    if (typeof value !== "number" || !isFinite(value)) {
        error("Torch dutyCycle must be a finite number.\n");
        return;
    }
    dutyCycleValue = Math.max(0.05, Math.min(0.95, value));
}

function isInteger(value) {
    return typeof value === "number" && isFinite(value) && Math.floor(value) === value;
}

function duration(value) {
    if (!isInteger(value)) {
        error("Torch duration must be an integer in ms.\n");
        return;
    }

    durationMs = Math.max(0, value);
}

function timestamp(value) {
    if (!isInteger(value)) {
        error("Torch timestamp must be an integer in ms.\n");
        return;
    }

    execTimestamp = Math.max(0, value);
}

function transition(value) {
    if (!isInteger(value)) {
        error("Torch transition must be an integer in ms.\n");
        return;
    }

    transitionMs = Math.max(0, value);
}

function intensity(value) {
    if (!isInteger(value)) {
        error("Torch intensity must be an integer.\n");
        return;
    }

    intensityValue = Math.max(0, value);
}

function bang() {
    outlet(0, "schemaVersion", "1.0");
    outlet(0, "type", "torch");
    outlet(0, "execTimestamp", execTimestamp);
    outlet(0, "durationMs", durationMs);
    outlet(0, "intensity", intensityValue);
    // Select the payload branch and finish the nested dictionary before sending.
    outlet(0, "strobeEnabled", strobeEnabledValue);
    outlet(0, "strobeHz", strobeHzValue);
    outlet(0, "dutyCycle", dutyCycleValue);
    outlet(0, "transitionMs", transitionMs);
}
