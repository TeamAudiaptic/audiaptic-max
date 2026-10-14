# Connection patch

This directory contains the max patch for the connection to the DAVHI websocket. 

Send events to the connection patch as a JSON string so they can be sent to the server and distributed to the connected devices. 

See event reference [here](https://teamaudiaptic.github.io/audiaptic-docs/docs/dev-docs/events).

See [connection.maxhelp](connection.maxhelp) for more details on how to use the patch.

## Local Setup
Follow these instructions to test the websocket connection locally. 

### 1. Clone the server
Clone [audiaptic-server](https://github.com/TeamAudiaptic/audiaptic-server) if not done already. 

### 2. Run the server
The easiest way to run the server locally is by running the run_me.bat file. `./run_me.bat`

Docker needs to be running and this will run the performer and portal APIs in separate terminal windows. 

If there are any issues with the script, just cd into api/ and then run `npm run dev`

### 3. Update .env
Copy the [.env.example](.env.example) into a new .env file. The example already sets DAVHI_WEBSOCKET_URL="ws://localhost/api/performer" (use localhost:3000 if localhost isn't working for some reason) and DAVHI_PERFORMANCE_TOKEN="test-token" which should be all that's needed for local.

NOTE: Authentication with the DAVHI_PERFORMANCE_TOKEN is not actually implemented yet, but you still need to provide a string for validation. We will probably just keep test-token as the valid token by default for the local environment anyways when it's implemented.
