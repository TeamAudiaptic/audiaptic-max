# Torch patch

Open [torch.maxpat](torch.maxpat) to use the torch controls in Presentation mode. Switch to Patching mode to inspect the event-building logic. The same patch can be embedded as a bpatcher or used as the `torch` abstraction with its existing five inlets and one outlet.

## Test with the local server

1. Follow [README.md](../connection/README.md)
2. Open `torch-ui-connection-test.maxpat` in Max. Both embedded interfaces should be visible in Presentation mode. If Max cannot resolve an abstraction or script, add `audiaptic-max/src` to Options > File Preferences with subfolders enabled, then reopen the patch.
3. Open the Max Console. On first use, click **Install Dependencies**, wait for npm to finish, then close and reopen the patch. Wait for `Audiaptic connection ready. Send connect to open the WebSocket.` before using the controls.
4. Click **Start Connection**. Expect status `connected` and `torch-server: connection connected` in the console. Set **Universal delay** to `0` for the first test.
5. In the torch UI, explicitly enter Duration `250`, Transition `0`, Intensity `0`, and Execution timestamp `0` (press Enter to commit each value). The connection replaces numeric `0` with the current time plus Universal delay.
6. Press **SEND**. In the console, inspect `torch-server: sent` and its JSON for `type: "torch"`, the selected payload values, a generated `eventId`, and a numeric execution timestamp. Look for an `ack` response and inspect its status/error fields to confirm server acceptance; `sent` alone only confirms the socket write. A connected device is required to check the physical flashlight effect.
   **Current local server limitation:** `audiaptic-server/api/src/sockets/handlers/performer/main.performer.handler.ts` returns acknowledgement status `422` with `Event torch is not yet implemented!` for torch events. That response confirms the server received and routed the event, but it does not mean the event was accepted for device execution. Physical flashlight testing requires server-side torch handling to be implemented. The connection's Ping button can be used for a separate supported-event connectivity check.
7. Click **Stop Connection**, wait for `disconnected`, and press SEND. Expect an `error send ... WebSocket is not connected` message. Start the connection again and resend to check recovery.
