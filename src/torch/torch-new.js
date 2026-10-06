autowatch = 1;
inlets = 1;
outlets = 1;

var durationMs = 250;
var execTimestamp = null;
var transitionMs = 0;

function isNonNegativeInteger(value) {
    return isFinite(value) && value >= 0 && Math.floor(value) === value;
}

function duration(value) {
    if (!isNonNegativeInteger(value)) {
        error("Torch duration must be a non-negative integer in ms.\n");
        return;
    }

    durationMs = value;
}

function timestamp(value) {
    if (value === "null") {
        execTimestamp = null;
        return;
    }

    if (!isNonNegativeInteger(value)) {
        error("Torch timestamp must be null or a non-negative integer in ms.\n");
        return;
    }

    execTimestamp = value;
}

function transition(value) {
    if (!isNonNegativeInteger(value)) {
        error("Torch transition must be a non-negative integer in ms.\n");
        return;
    }

    transitionMs = value;
}

function bang() {
    outlet(0, "torch", durationMs, execTimestamp === null ? "null" : execTimestamp, transitionMs);
}
