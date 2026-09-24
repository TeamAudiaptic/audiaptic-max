---
name: node-for-max-development
description: Build, modify, debug, and verify Node for Max integrations using node.script and max-api. Use for Max patchers that call Node.js; not for audio-rate DSP or ordinary embedded Max JavaScript.
---

# Node For Max Development

Use this skill for the boundary between a Max patcher and a Node.js process managed by `[node.script]`. Treat this boundary as an explicit, asynchronous message API.

## Choose the right execution layer

Use Node for Max when the feature needs Node packages, asynchronous filesystem or network I/O, web services, servers, sockets, or substantial non-realtime application logic. Keep audio-rate DSP in MSP or Gen and keep time-critical Max scheduling work small; Node messaging is control/event-oriented.

Use `[node.script]` to launch the script. Each object owns one Node process. The Node entry point loads Max's runtime-provided API:

```js
const maxAPI = require("max-api");
```

Never install `max-api` from npm: Node for Max supplies it dynamically, while the npm package is deliberately a placeholder that throws outside the Max runtime.

## Design the Max <-> Node contract first

Name each incoming selector as a small public command API (`configure`, `request`, `cancel`, `reset`), and document its arguments and the result/error messages that the patcher can receive. Prefer stable, descriptive selectors over positional messages whose meaning changes by context.

Use `maxAPI.addHandlers()` to make the full incoming protocol visible in one place. Validate messages at this boundary, including types, ranges, and required fields. For asynchronous operations, include a request ID in both the request and every result/error so Max can associate a response with the initiating event.

```js
const maxAPI = require("max-api");

maxAPI.addHandlers({
  configure: async (options) => {
    // Validate and retain JSON-compatible configuration.
  },
  request: async (requestId, query) => {
    try {
      const result = await performRequest(query);
      await maxAPI.outlet("result", requestId, result);
    } catch (error) {
      await maxAPI.outlet("error", requestId, error.message);
    }
  }
});
```

`maxAPI.outlet()` sends Node-originated data to the left outlet of `[node.script]`; `maxAPI.post()` is for diagnostics in the Max console. These API calls return promises, so await them when message ordering or error handling depends on completion.

Read [message-contract.md](references/message-contract.md) when defining a new public protocol, translating values between Max and Node, or using `dict`.

## Keep Node work asynchronous and bounded

- Do not perform synchronous network, filesystem, or CPU-heavy work inside a message handler.
- Throttle, debounce, or coalesce high-frequency UI/control messages before expensive work.
- Catch expected failures within each handler and emit a useful error message; do not rely on a process crash as error handling.
- Give requests that can hang an explicit timeout and cancellation path.
- Close timers, streams, sockets, servers, and subscriptions during shutdown or before replacing them on reload.

## Build the patcher boundary deliberately

During development, wire the first outlet of `[node.script]` to visible result/error handling and wire its rightmost status outlet to `[node.debug]` or a readable lifecycle/status display. Do not send application messages before the process has loaded.

Use lifecycle controls intentionally:

- Send `script start` and `script stop` when the patcher should control a process explicitly.
- Use `@autostart 1` only when launching on patch-open is safe and expected.
- Use `@watch 1` for rapid development, not by default in a released patch.
- Use `@args` with `@autostart` or `@watch` for startup configuration; read custom arguments as `process.argv.slice(2)`.
- Consider `@defer 1` when Node-to-Max output can safely move to Max's low-priority queue; accept its added latency rather than applying it blindly.

`node.script` may restart a crashed handler process by default. Ensure initialization is idempotent, then find and fix the underlying error. A successful `start` only proves that the process/IPC started; `loadend` marks that the user script has finished loading and is ready for application messages.

Read [lifecycle-and-debugging.md](references/lifecycle-and-debugging.md) for lifecycle interpretation, reload-safe resource management, and a debugging sequence.

## Organize dependencies for reproducible patches

Keep a Node integration self-contained with its patcher, entry point, package manifest, and lockfile together where practical. Use Max's bundled Node/npm by default. Commit `package.json` and its lockfile, but not `node_modules`. Do not override `node_bin_path` or `npm_bin_path` unless a specific compatibility requirement is documented and tested.

Read [project-layout.md](references/project-layout.md) when adding dependencies, a new Node-backed patcher, or an example/demo.

## Verify in Max

Static JavaScript checks are insufficient. Before handing off a Node for Max change:

1. Start the script in Max and confirm the lifecycle reaches `loadend`.
2. Exercise every new/changed handler with representative valid input.
3. Exercise invalid input and an expected downstream failure; verify a clear error reaches the patcher or console without crashing the process.
4. Confirm asynchronous outputs have the promised selector, argument order, and request ID.
5. Stop/start the script and, if using `@watch`, make a reload-safe edit; check that resources are not duplicated or left open.
6. If dependencies changed, verify they install and run from the declared manifest/lockfile.

## Authoritative sources

- [Node for Max API reference](https://docs.cycling74.com/apiref/nodeformax/) - exact `max-api` signatures and JSON/dictionary semantics.
- [`node.script` reference](https://docs.cycling74.com/reference/node.script) - attributes, lifecycle controls, and process management.
- [Node for Max core examples](https://github.com/Cycling74/n4m-core-examples) - minimal examples for handlers, message types, outlets, dynamic handlers, and dictionaries.
- [Node for Max examples](https://github.com/Cycling74/n4m-examples) - larger integrations, including HTTP, sockets, files, TypeScript, and external APIs.
- [Max tutorial series](https://docs.cycling74.com/learn/series/max-tutorials/) - foundational Max message ordering, lists, timing, data flow, debugging, and abstractions.
