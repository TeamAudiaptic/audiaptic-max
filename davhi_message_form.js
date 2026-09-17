// Encodes the visible controls in davhi_message_form.maxpat for node.script.
// The output is: send <one JSON symbol>

inlets = 1;
outlets = 1;

var messageType = "haptic";
var value = 0.75;

function words(argumentsObject) {
	return arrayfromargs(argumentsObject).join(" ");
}

function setMessageType() {
	messageType = words(arguments).trim() || "message";
}

function setValue() {
	var raw = words(arguments).trim();
	if (!raw) {
		value = "";
		return;
	}

	// Permit useful JSON values such as 0.75, true, [1, 2], or {"x": 1}.
	// Ordinary text remains a JSON string when the payload is encoded below.
	try {
		value = JSON.parse(raw);
	} catch (error) {
		value = raw;
	}
}

function bang() {
	outlet(0, "send", JSON.stringify({
		messageType: messageType,
		value: value
	}));
}
