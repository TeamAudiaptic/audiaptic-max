# Lifecycle and debugging

The rightmost outlet of `[node.script]` emits process lifecycle status. During development, connect it to `[node.debug]` or otherwise surface it. The principal lifecycle events are `start`, `loadstart`, `loadend`, `stop`, `terminated`, `restarting`, and `restarted`.

Do not treat `start success` as application readiness: it only confirms that the Node process and inter-process communication started. Treat `loadend` as the point at which the entry script is ready for normal messages.

`@watch 1` relaunches the process when its source changes. A reload may happen at any point in an asynchronous operation, so design startup and teardown to be repeatable:

- Create a single owner for each server, socket, timer, watcher, or subscription.
- Close/release an existing resource before replacing it.
- Keep configuration necessary to recreate state in a deliberate, validated form.
- Avoid module-level side effects that duplicate listeners every time initialization runs.

By default, `node.script` restarts after a Node code crash inside a handler. This is a guardrail, not a recovery plan. Inspect the status dictionary/error stack, reproduce the input, catch the expected failure locally, and retest start/stop/reload behavior. Persistent immediate crashes eventually require another `script start`.

For logs, use `maxAPI.post()` at appropriate `POST_LEVELS`; avoid emitting every high-frequency message. Use `maxAPI.outlet()` only for data the patcher is meant to consume.

For details on process status dictionaries, restart behavior, and arguments, consult the [`node.script` reference](https://docs.cycling74.com/reference/node.script) and the [lifecycle guide](https://docs.cycling74.com/legacy/max8/vignettes/08_n4m_lifecycle).
