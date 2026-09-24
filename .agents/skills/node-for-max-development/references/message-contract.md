# Message contracts

Define a Node for Max feature as a narrow, versionable protocol rather than a loose collection of messages. For each selector, record:

- selector name and intent;
- required argument order and accepted Max/JSON types;
- optional values and defaults;
- successful output selector and argument order;
- error selector and its argument order;
- whether multiple requests may be in flight.

For example:

```text
request <request-id:string> <query:string>
  → result <request-id:string> <payload:object>
  → error  <request-id:string> <message:string>
```

Keep command names verb-like and output names event-like. Reserve a consistent error selector (`error` or a feature-prefixed equivalent) and make it carry enough context for the patcher to recover. Avoid encoding JSON manually into quoted string atoms when normal Max lists or a `dict` can express the data.

## Handlers and output

Use `maxAPI.addHandlers({ selector: handler })` when a module owns a fixed command set. Use `addHandler` only where handlers are genuinely dynamic, and remove dynamically registered handlers when their owner is disposed. A handler may be asynchronous; handle errors inside it and use `maxAPI.outlet()` for application-visible results.

`outlet()` accepts JSON-compatible values. Keep messages shallow and predictable on hot paths. When an operation returns a large or nested data model, put it in a named Max `dict` with `setDict()`/`updateDict()` and emit the dictionary name or a lightweight notification. Use `getDict()` to retrieve a `dict` value into Node.

The exact accepted JSON types and API signatures are maintained in the [Node for Max API reference](https://docs.cycling74.com/apiref/nodeformax/). Consult it rather than guessing when a Max atom/list conversion matters.

## Validation

Validate at the Node boundary before starting work. Reject malformed messages with an actionable error that identifies the selector and invalid field. Do not pass unchecked file paths, URLs, ports, credentials, or shell arguments to Node libraries. Keep secrets out of `maxAPI.post()` and emitted error payloads.
