autowatch = 1;
inlets = 1;
outlets = 1;

var durationMs = 250;
var execTimestamp = null;
var transitionMs = 0;
var intensityValue = 0;

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
    if (value === "null") {
        execTimestamp = null;
        return;
    }

    if (!isInteger(value)) {
        error("Torch timestamp must be null or an integer in ms.\n");
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
    outlet(0, "sentTimestamp", new Date().getTime());
    outlet(0, "execTimestamp", execTimestamp === null ? "null" : execTimestamp);
    outlet(0, "durationMs", durationMs);
    outlet(0, "intensity", intensityValue);
    outlet(0, "transitionMs", transitionMs);
}
