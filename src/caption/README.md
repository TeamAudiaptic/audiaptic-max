# Caption patch

`caption.maxpat` packages a caption payload, user-supplied `execTimestamp`, `type: "caption"`, and
`schemaVersion: "1.0"` as a JSON string. Connect its outlet to the event inlet
of `[connection]` to complete and send the event.

Like the color patch, caption sends serialized JSON through a message box to
its outlet. `dict.serialize @mode json` feeds `t b s`, which first stores the
latest JSON in the message box's right inlet, then bangs its left inlet to emit
it. The output is JSON text, not a `dictionary <name>` reference. The payload
keeps `text` and `durationMs` (case-sensitive); `execTimestamp` remains at the
event's top level. `caption-ui.maxpat` forwards this output unchanged.

Use `s` here because JSON serialization outputs a single symbol. In Max,
`a` is a constant symbol, so `t b a` replaces the JSON with the literal `a`.

## Inlets

The abstraction has two inlets:

1. A payload dictionary containing the required `text` string and optional
   non-negative integer `durationMs`. Sending the dictionary triggers the output.
2. `execTimestamp`: the user-supplied execution time in Unix epoch milliseconds.
   Set this before sending the payload.

Build the payload with `dict.pack text: durationMs:`, or `dict.pack text:`
when omitting duration. An empty text string clears the current caption.

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

Open [caption.maxhelp](caption.maxhelp) for a demo, or embed
[caption-ui.maxpat](caption-ui.maxpat) in another patcher. Both offer caption
text, non-negative duration, non-negative execution time, and a **Send caption** button.

Click Send caption to print the caption JSON to the Max console. This preview
includes the chosen execution time and precedes the identity and sent time added
by connection. The UI patch also
emits the JSON through its outlet; connect that outlet to `[connection]`.

For programmatic use, set execution time through the second inlet and send a
payload dictionary into the first inlet of `[caption]`, then connect
its outlet to the event inlet of `[connection]`. Existing patches using the
former five-inlet caption interface must remove the event ID, sequence, and sent-time connections.
Ensure Max can resolve `src/caption/` and `src/connection/`.
