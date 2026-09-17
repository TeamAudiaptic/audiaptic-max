// davhi_server.js - local receiver and visualizer for davhi_connection.js.
//
// Start with: npm install && npm start
// Then open:  http://127.0.0.1:3000

const express = require("express");
const path = require("path");

const app = express();
const port = process.env.PORT || 3000;
const receivedMessages = [];
const maxMessages = 100;

app.use(express.json({ limit: "1mb" }));
app.use(express.static(path.join(__dirname, "public")));

// Matches the default URL in davhi_connection.js.
app.post("/messages", (request, response) => {
	const entry = {
		id: Date.now(),
		receivedAt: new Date().toISOString(),
		message: request.body
	};

	receivedMessages.unshift(entry);
	if (receivedMessages.length > maxMessages) receivedMessages.pop();

	console.log(`[${entry.receivedAt}] Received:`, entry.message);
	response.status(200).json({ success: true, id: entry.id, receivedAt: entry.receivedAt });
});

// The web page polls this small endpoint to keep the example dependency-free.
app.get("/api/messages", (request, response) => {
	response.json({ messages: receivedMessages });
});

app.listen(port, () => {
	console.log(`Davhi demo server listening at http://127.0.0.1:${port}`);
});
