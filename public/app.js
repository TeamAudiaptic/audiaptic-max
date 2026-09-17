const messageList = document.querySelector("#messages");
const status = document.querySelector("#status");
const template = document.querySelector("#message-template");

let latestMessageID = null;

async function refreshMessages() {
	try {
		const response = await fetch("/api/messages", { cache: "no-store" });
		if (!response.ok) throw new Error(`Server returned ${response.status}`);
		const { messages } = await response.json();

		messageList.replaceChildren();
		messages.forEach(entry => {
			const item = template.content.cloneNode(true);
			item.querySelector("time").dateTime = entry.receivedAt;
			item.querySelector("time").textContent = new Date(entry.receivedAt).toLocaleTimeString();
			item.querySelector("pre").textContent = JSON.stringify(entry.message, null, 2);
			messageList.append(item);
		});

		if (messages.length) {
			status.textContent = latestMessageID !== messages[0].id
				? "Message received successfully."
				: `${messages.length} message${messages.length === 1 ? "" : "s"} received.`;
			latestMessageID = messages[0].id;
		} else {
			status.textContent = "Waiting for a message…";
		}
	} catch (error) {
		status.textContent = `Unable to reach the server: ${error.message}`;
	}
}

refreshMessages();
setInterval(refreshMessages, 1000);
