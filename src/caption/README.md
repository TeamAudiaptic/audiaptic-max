# Caption patch

`caption.maxpat` packages a caption payload, user-supplied `execTimestamp`, `type: "caption"`, and
`schemaVersion: "1.0"` as a JSON string. Connect its outlet to the event inlet
of `[connection]` to complete and send the event.

`dict.serialize @mode json` sends the JSON directly to `print caption` for
logging in the Max Console and to the patch's outlet. The output is JSON text,
not a `dictionary <name>` reference. The payload keeps `text` and `durationMs`
(case-sensitive); `execTimestamp` remains at the event's top level.
`caption.maxpat` includes presentation controls; `caption-ui.maxpat` is a
compatibility wrapper that forwards this output unchanged.

## Inlets

The abstraction has three inlets, from left to right:

1. `text`: caption text. Sending text triggers the output; multiword messages
   are converted to a single string internally.
2. `durationMs`: integer display duration in milliseconds. Set this before text.
3. `execTimestamp`: execution time in Unix epoch milliseconds. Set this before text.

The patch builds the payload internally with `dict.pack text: durationMs:`.

## Automatically assigned fields

The connection patch adds these fields before validation and transmission:

- `eventId`: a new UUID for each submission.
- `sequence`: an incrementing number starting at 0 for the Node process.
- `sentTimestamp`: the current Unix epoch time in milliseconds.

Connection always assigns identity, sequence, and sent time. It defaults
execution time when omitted, null, or zero; a supplied nonzero execution time
is preserved. Caption includes the user's execution time and omits the three
connection-owned fields above. Enter a positive epoch timestamp for an explicit
execution time, or 0 to use the connection's universal delay.

## Interactive controls

Open [caption-ui-to-connection.maxpat](caption-ui-to-connection.maxpat) to use
the caption UI and server connection together. Configure `src/connection/.env`,
install the connection dependencies if needed, then click **Start Connection**.
Once the status reads `connected`, click **Send caption** to send the caption
through the connection patch to the server. Connection responses and errors are
printed to the Max Console and forwarded through the combined patch's outlet.

Open [caption.maxpat](caption.maxpat) to use its presentation controls, or embed
it as a 590 x 240 bpatcher. It opens in presentation mode with caption text,
duration, execution time, and a **Send caption** button. The button sets the
execution time and duration before emitting the text. External inlet values
also update the controls. Switch to patching mode to inspect the JSON logic.

[caption.maxhelp](caption.maxhelp) demonstrates the three programmatic inlets.
[caption-ui.maxpat](caption-ui.maxpat) remains as a compatibility wrapper.

The caption patch prints each JSON event to the Max Console with the `caption` label. This preview
includes the chosen execution time and precedes the identity and sent time added
by connection. The combined caption patch emits JSON through its outlet;
connect that outlet to `[connection]`.

For programmatic use, set duration through the second inlet and execution time
through the third inlet, then send text into the first inlet of `[caption]`.
Connect its outlet to the event inlet of `[connection]`. Patches using the prior
payload-dictionary interface must send text and duration separately and move
execution time to the third inlet.
Ensure Max can resolve `src/caption/` and `src/connection/`.
