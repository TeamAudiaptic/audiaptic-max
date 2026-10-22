# Caption patch

`caption.maxpat` packages a caption payload, user-supplied `execTimestamp`, `type: "caption"`, and `schemaVersion: "1.0"` 
as a JSON string. Connect its outlet to the event inlet of `[connection]` to complete and send the event.

`dict.serialize @mode json` sends the JSON directly to `print caption` for
logging in the Max Console and to the patch's outlet. The output is JSON text,
not a `dictionary <name>` reference. The payload keeps `text` and `durationMs`
(case-sensitive); `execTimestamp` remains at the event's top level.
`caption.maxpat` includes presentation controls

## Inlets

The abstraction has three inlets, from left to right:

1. `text`: caption text. Sending text triggers the output; multiword messages
   are converted to a single string internally.
2. `durationMs`: integer display duration in milliseconds. Set this before text.
3. `execTimestamp`: execution time in Unix epoch milliseconds. Set this before text.

The patch builds the payload internally with `dict.pack text: durationMs:`.

## Caption to Connection test

Open [caption-to-connection.maxpat](caption-to-connection.maxpat) to use
the caption subpatch and server connection together. 
