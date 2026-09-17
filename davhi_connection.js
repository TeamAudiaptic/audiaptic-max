// davhi_connection.js - send messages from a node.script object to Davhi.
//
// In Max, send a JSON object as one symbol (for example with [tosymbol]):
//   send {"type":"gesture","value":0.75}
//
// The default target is local development. Change DAVHI_SERVER_URL in the
// node.script environment, edit the constant below, or send:
//   setServerURL http://localhost:3000/messages

const http = require('http');
const https = require('https');
const maxApi = require('max-api');

maxApi.post('Started connection');

let serverURL = process.env.DAVHI_SERVER_URL || "http://127.0.0.1:3000/messages";

function parseMessage(message) {
	if (typeof message !== "string") {
		return message;
	}

	try {
		return JSON.parse(message);
	} catch (error) {
		// Plain text is also useful for quick tests from a Max message box.
		return { message };
	}
}

function postJSON(urlString, payload) {
	return new Promise((resolve, reject) => {
		let url;
		try {
			url = new URL(urlString);
		} catch (error) {
			reject(new Error(`Invalid server URL: ${urlString}`));
			return;
		}

		const body = JSON.stringify(payload);
		const client = url.protocol === "https:" ? https : http;
		const request = client.request({
			protocol: url.protocol,
			hostname: url.hostname,
			port: url.port || undefined,
			path: `${url.pathname}${url.search}`,
			method: "POST",
			headers: {
				"Content-Type": "application/json",
				"Content-Length": Buffer.byteLength(body)
			}
		}, response => {
			let responseBody = "";
			response.setEncoding("utf8");
			response.on("data", chunk => { responseBody += chunk; });
			response.on("end", () => {
				if (response.statusCode >= 200 && response.statusCode < 300) {
					resolve({ status: response.statusCode, body: responseBody });
				} else {
					reject(new Error(`Server returned ${response.statusCode}: ${responseBody}`));
				}
			});
		});

		request.on("error", reject);
		request.write(body);
		request.end();
	});
}

const handlers = {
	// Usage: send <JSON string>. A non-JSON string is sent as { message: string }.
	send: async message => {
		try {
			const payload = parseMessage(message);
			const result = await postJSON(serverURL, payload);
			maxApi.outlet("sent", result.status, result.body);
		} catch (error) {
			maxApi.post(error.message, maxApi.POST_LEVELS.ERROR);
			maxApi.outlet("error", error.message);
		}
	},

	// Update the destination without restarting node.script.
	setServerURL: url => {
		try {
			serverURL = new URL(url).toString();
			maxApi.post(`Davhi server URL: ${serverURL}`);
			maxApi.outlet("serverURL", serverURL);
		} catch (error) {
			maxApi.post(error.message, maxApi.POST_LEVELS.ERROR);
		}
	},

	getServerURL: () => maxApi.outlet("serverURL", serverURL)
};

maxApi.addHandlers(handlers);
