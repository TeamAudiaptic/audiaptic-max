# Timeline patch

This directory contains a Max patch for placing DAVHI events against an audio file and saving them as a JSON timeline. Each saved event has a `relativeTimestamp`: milliseconds from the start of the audio, which lines up with the performance's [Start event](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events/start).

See event reference [here](https://teamaudiaptic.github.io/audiaptic-docs/docs/category/events).

## Files

- `timeline.maxpat`: the patch. Audio is loaded into `[buffer~ davhi_timeline_audio]` and the timeline is kept in `[dict davhi_timeline]`.
- `timeline.js`: the `v8ui` script that draws the event lanes and handles selecting, moving, and removing events.

## Using it

1. **Load Audio** and pick a sound file. Turn audio on with the speaker button to preview it with **Play** and **Stop**.
2. Set the position by clicking an empty spot in the lanes, selecting on the waveform, or typing in **Position (ms)**. Switch the waveform to **Zoom / scroll** to zoom (drag vertically) and scroll (drag horizontally); the lanes follow.
3. Connect an event patch to the timeline's inlet and send the serialized event while the desired position is selected.
4. Click an event to select it (shift-click to select more), drag to move, and **Remove Selected** to delete. To change an event's settings, select it, tick **Send replaces the selected event**, and press **Send** on an event patch.
5. **Save Timeline** writes the timeline as JSON. **Load Timeline** reads one back; load its audio file again separately.

## Saved format

A timeline is saved as one event in the [shared event envelope](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events/shared-envelope) with type `timeline`. Its payload holds the list of events, each a full event in the same envelope. The audio file is not part of the timeline; load it separately.

```json
{
  "schemaVersion": "1.0",
  "type": "timeline",
  "payload": {
    "events": [
      {
        "schemaVersion": "1.0",
        "type": "haptic",
        "relativeTimestamp": 12500,
        "payload": { "intensity": 0.8, "sharpness": 0.5, "durationMs": 400, "transitionMs": 0 }
      }
    ]
  }
}
```

Events are sorted by `relativeTimestamp`; events at the same time keep the order they were added in. `eventId`, `sequence`, and `sentTimestamp` are left out, of both the timeline and its events, because the connection patch assigns them when an event is sent. Payloads are saved as the event patch produced them and are validated when sent, not when saved.

The `timeline` type is not part of the server's event contract yet, so a saved timeline cannot be sent to the server as is.

A Max dictionary can save a one-element array as a single object. The timeline reads either shape back, but check a saved file with one event before relying on it elsewhere.
