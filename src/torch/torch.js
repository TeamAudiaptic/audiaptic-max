autowatch = 1;
inlets = 1;
outlets = 1;

var durationMs = 250;

function duration(value) {
    if (!isFinite(value) || value < 0 || Math.floor(value) !== value) {
        error("Torch duration must be a non-negative integer in ms.\n");
        return;
    }

    durationMs = value;
}

function bang() {
    var event = {
        schemaVersion: "1.0",
        type: "torch",
        sentTimestamp: new Date().getTime(),
        execTimestamp: null,
        payload: {
            durationMs: durationMs,
            transitionMs: 0
        }
    };

    outlet(0, JSON.stringify(event));
}