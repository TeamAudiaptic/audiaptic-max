# Project layout and dependencies

Prefer a self-contained directory for a distributable Node-backed Max feature:

```text
my-feature/
├── my-feature.maxpat
├── index.js
├── package.json
├── package-lock.json
└── README.md                 # only when the feature is distributed independently
```

Keep the patcher's `node.script` entry point relative to that feature directory so Max can resolve the source reliably. The official examples commonly package a patch and its JavaScript source together; use the core examples for small patterns and the larger examples for integrations with packages or services.

Use the Node and npm bundled with Max unless a compatibility constraint makes a different executable necessary. Install declared dependencies through the `[node.script]` npm workflow (for example, `script npm install` during setup), commit the manifest and lockfile, and exclude `node_modules` from version control.

Never add `max-api` to `dependencies`: it is furnished by the `[node.script]` runtime. When choosing external packages, check that the package supports the Node version bundled with the target Max release and that it does not require a native build toolchain unavailable to users.

For examples that need credentials or service keys, make configuration explicit and keep secrets outside the repository and Max patcher metadata.
