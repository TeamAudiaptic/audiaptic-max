# Timeline patch

This directory contains a Max patch for placing DAVHI events against an audio file and saving them as a JSON timeline. Each saved event has a `relativeTimestamp`: milliseconds from the start of the audio, which lines up with the performance's [Start event](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events/start).

See event reference [here](https://teamaudiaptic.github.io/audiaptic-docs/docs/category/events).

## Files

- `timeline.maxpat`: the patch. Audio is loaded into `[buffer~ davhi_timeline_audio]`. While the patch is open, the events are kept in `[dict davhi_timeline]` so they survive the script reloading.
- `timeline.js`: the `v8ui` script that draws the event lanes, handles selecting, moving, and removing events, and saves, loads, and sends the timeline.

## Using it

1. **Load Audio** and pick a sound file. Turn audio on with the speaker button to preview it with **Play** and **Stop**.
2. Set the position by clicking an empty spot in the lanes, selecting on the waveform, or typing in **Position (ms)**. Switch the waveform to **Zoom / scroll** to zoom (drag vertically) and scroll (drag horizontally); the lanes follow.
3. Connect an event patch to the timeline's inlet and send the serialized event while the desired position is selected.
4. Click an event to select it (shift-click to select more), drag to move, and **Remove Selected** to delete. To change an event's settings, select it, turn on the replace toggle (**Toggle on to replace the selected event instead of adding one**), and press **Send** on an event patch.
5. **Save Timeline** writes the timeline to a `.json` file. **Load Timeline** replaces the current timeline with one from a file; load its audio file again separately.
6. **Send Timeline** outputs the whole timeline from the patch's outlet as one JSON list. Connect the outlet to the [connection patch](../connection/README.md) to send it to the server as a single frame.

## Saved format

A timeline is saved as a JSON array of events, each in the [shared event envelope](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events/shared-envelope). This is the same list [frame](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events/shared-envelope#frames) that **Send Timeline** outputs, so a saved file can be sent as is. The audio file is not part of the timeline; load it separately.

```json
[
  {
    "schemaVersion": "1.0",
    "type": "haptic",
    "relativeTimestamp": 12500,
    "payload": { "intensity": 0.8, "durationMs": 400, "transitionMs": 0 }
  },
  {
    "schemaVersion": "1.0",
    "type": "caption",
    "relativeTimestamp": 12500,
    "payload": { "text": "Follow the lights", "durationMs": 3000 }
  }
]
```

- Events are sorted by `relativeTimestamp`; events at the same time keep the order they were added in. The connection patch assigns `sequence` in list order, so when two events at the same time control the same output, the later one in the list takes precedence.
- `eventId`, `sequence`, and `sentTimestamp` are left out, because the connection patch assigns them when the list is sent. Events have no `epochTimestamp`, and the connection patch does not add one to events in a list.
- Payloads are saved as the event patch produced them and are validated by the server when sent, not when saved.
- Non-ASCII text is written as `\u` escapes, which is still standard JSON.

## Sending a timeline

A device can only schedule a `relativeTimestamp` once it has received the performance's `start` event, and a performance has exactly one `start`. The timeline does not include it, so send `start` through the connection patch before **Send Timeline**, timed so it lines up with the start of the audio.

The server sets no limit on the number of events in a list, but a long list takes longer to validate, relay, and parse on each device. The server validates each event on its own, relays the valid ones, and reports any rejected events in its acknowledgement.
