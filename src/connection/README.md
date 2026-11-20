# Connection patch

This directory contains the max patch for the connection to the DAVHI websocket. 

Send events to the connection patch as a JSON string so they can be sent to the server and distributed to the connected devices. 

See event reference [here](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events).

See [connection.maxhelp](connection.maxhelp) for more details on how to use the patch.

## Clock sync

Every timestamp the connection patch sends is on the DAVHI server's clock, not this computer's. The patch measures the difference between the two clocks and applies it when sending. The algorithm is described in the [Time Synchronization spike](https://teamaudiaptic.github.io/audiaptic-docs/docs/spikes/time-sync).

- **When it syncs:** on connect, every 60 seconds while connected, and within about 5 seconds of the computer's clock being changed or the computer waking from sleep. Send `sync` (the "Sync" button or the sixth inlet) to sync immediately.
- **What it changes:** `sentTimestamp`, the fallback `epochTimestamp` (current time + universal delay), and any `epochTimestamp` an event already carries. Supply `epochTimestamp` in this computer's clock time; the patch converts it. `relativeTimestamp` and durations are never changed.
- **Status:** the outlet reports `sync <state> <offsetMs> <errorMs> <ageMs>` after every sync and in reply to `getSync`. `state` is `synced` or `unsynced`, `offsetMs` is how far the server's clock is ahead of this computer's, `errorMs` is the worst-case error of that measurement, and `ageMs` is the time since it was taken. A failed sync also reports `error sync - <message>`.
- **If it has never synced:** events still send using this computer's clock, and a warning is posted to the Max console.

The time endpoint is derived from `DAVHI_WEBSOCKET_URL` (`ws://host/api/performer` becomes `http://host/api/time`). Set `DAVHI_TIME_URL` in `.env` only if the endpoint is somewhere else.

`timeSync.js` holds the algorithm and has no dependencies. Run its tests with `npm test` in this directory; Max is not needed. `timeSync.vectors.json` holds the expected results that any other implementation of the algorithm, such as the mobile client's, should also produce.

## Start cue

The [`start` event](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events/start) anchors every `relativeTimestamp` in a performance. Whatever plays the performance's audio in Max needs to begin at the moment devices execute it.

- **Timing:** a `start` without an `epochTimestamp` is set to the current time plus the universal delay. This applies whether it is sent alone or in a list, such as the one the [timeline patch](../timeline/README.md) sends. Other events in a list keep their own timing.
- **Cue:** every time a `start` is sent, the patch outputs `start <msUntilStart> <epochTimestamp>` from its outlet and to `[send davhi_start]`. Any patch can use `[receive davhi_start]` and pass `msUntilStart` to `[delay]` to act when the `start` executes. Max and the devices convert the same server-clock `epochTimestamp` with their own clock offsets, so the cue does not wait for the server's acknowledgement. `epochTimestamp` is on the server's clock.
- **Sending another start:** a later `start` restarts the timeline. On the devices, it cancels the relative events that haven't played yet, and relative events sent after it count from it. Max is cued again, and `[delay]` replaces a pending delay with the new one. If one frame holds more than one `start`, the last one cues Max.
- **Status:** the Start row shows `not started`, or the local time the latest `start` executes.
- **Warnings:** if the start time is reached before the cue is sent, the cue's `msUntilStart` is 0 and a warning asks for a longer universal delay. A `start` timed before the clock has synced also posts a warning, because Max and the devices may disagree on when it executes.

## Local Setup
Follow these instructions to test the websocket connection locally. 

### 1. Clone the server
Clone [audiaptic-server](https://github.com/TeamAudiaptic/audiaptic-server) if not done already. 

### 2. Run the server
The easiest way to run the server locally is by running the run_me.bat file. `./run_me.bat`

Docker needs to be running and this will run the performer and portal APIs in separate terminal windows. 

If there are any issues with the script, just cd into api/ and then run `npm run dev`

### 3. Update .env
Copy the [.env.example](.env.example) into a new .env file. The example already sets DAVHI_WEBSOCKET_URL="ws://localhost/api/performer" (use localhost:3000 if localhost isn't working for some reason) and DAVHI_PERFORMANCE_TOKEN="dev", which is the token the dev server accepts.

The connection appends the token to the WebSocket URL as `?token=<token>`; the server's Caddy proxy checks it before the request reaches the API. For production, set DAVHI_WEBSOCKET_URL to `wss://davhi.se.rit.edu/api/performer` and DAVHI_PERFORMANCE_TOKEN to the server's `PERFORMER_TOKEN`.
