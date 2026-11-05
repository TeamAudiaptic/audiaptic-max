# Torch patch

Open [torch.maxpat](torch.maxpat) to use the torch controls in Presentation mode. Switch to Patching mode to inspect the event-building logic. The same patch can be embedded as a bpatcher or used as the `torch` abstraction with eight inlets and one outlet.

Inlets, from left to right:

1. Duration (ms).
2. Execution timestamp (ms).
3. Intensity (integer).
4. Transition (ms).
5. Bang to send.
6. Strobe enabled (`0` = off, `1` = on).
7. Strobe frequency (Hz).
8. Strobe duty cycle.

Set the values before sending a bang to inlet 5. The strobe inlets update the
stored settings directly, like the other value inlets; they do not update the
Presentation controls.

## Optional strobe

Enable **Include strobe** to add `payload.strobe` with `strobeHz` and
`dutyCycle`. It is omitted by default and whenever the toggle is off.

| Field | Range | Default |
| --- | --- | --- |
| `strobeHz` | 0–20 | 0 |
| `dutyCycle` | 0.05–0.95 | 0.5 |

Strobe frequency uses whole Hz; fractional inlet values are truncated. Duty
cycle uses steps of 0.01; inlet values are rounded to the nearest hundredth.
Numeric values outside these ranges are clamped.
The duty-cycle control uses `live.numbox` with 91 selectable values from 0.05
to 0.95, spaced by 0.01 and displayed to two decimal places. This avoids
`flonum`'s mouse-position-dependent increments.
The fifth (Send) inlet also accepts `strobeEnabled 1` / `strobeEnabled 0`,
`strobeHz 5`, and `dutyCycle 0.5`; send a bang afterward to emit the event.
Changing settings does not send an event. Disabling strobe keeps the selected
values for the next time it is enabled.

## Test with the local server

1. Follow the [connection README](../connection/README.md).
2. Open [torch-ui-connection-test.maxpat](torch-ui-connection-test.maxpat) in Max. Both embedded interfaces should be visible in Presentation mode. If Max cannot resolve an abstraction or script, add [audiaptic-max/src](../) to Options > File Preferences with subfolders enabled, then reopen the patch.
3. Open the Max Console. On first use, click **Install Dependencies**, wait for npm to finish, then close and reopen the patch. Wait for `Audiaptic connection ready. Send connect to open the WebSocket.` before using the controls.
4. Click **Start Connection**. Expect status `connected` and `torch-server: connection connected` in the console. Set **Universal delay** to `0` for the first test.
5. In the torch UI, explicitly enter Duration `250`, Transition `0`, Intensity `0`, and Execution timestamp `0` (press Enter to commit each value). The connection replaces numeric `0` with the current time plus Universal delay.
6. Press **SEND**. In the console, inspect `torch-server: sent` and its JSON for `type: "torch"`, the selected payload values, a generated `eventId`, and a numeric execution timestamp. Look for an `ack` response and inspect its `status`, `rejected`, and `errors` fields to confirm server acceptance; `sent` alone only confirms the socket write. A connected device is required to check the physical flashlight effect.
7. Click **Stop Connection**, wait for `disconnected`, and press SEND. Expect an `error send ... WebSocket is not connected` message. Start the connection again and resend to check recovery.
