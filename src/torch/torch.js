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
    outlet(0, "schemaVersion", "1.0");
    outlet(0, "type", "torch");
    outlet(0, "sentTimestamp", new Date().getTime());
    outlet(0, "execTimestamp", execTimestamp === null ? "null" : execTimestamp);
    outlet(0, "durationMs", durationMs);
    outlet(0, "transitionMs", transitionMs);
}
