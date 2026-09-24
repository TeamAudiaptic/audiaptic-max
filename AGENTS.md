# Audiaptic Max

## Node for Max work

For any work that builds, changes, debugs, or verifies a Node for Max integration - especially `[node.script]`, `max-api`, Node-backed patchers, or the server - read and follow the repository-local [`node-for-max-development` skill](.agents/skills/node-for-max-development/SKILL.md) before making changes. Read its linked reference notes when the task involves message contracts, lifecycle/debugging, or dependency layout.

## Event schemas

The Audiaptic server's accepted event schemas are defined in the [Audiaptic Events documentation](https://teamaudiaptic.github.io/audiaptic-docs/docs/category/events). This documentation is the source of truth for event names, fields, value types, and validation requirements. Consult it before creating, changing, or validating any event payload; do not infer a schema from existing client/server code when the documentation differs or is incomplete.

## Project routing

Current implementation work belongs in `src/`. The root-level demo files are proof-of-concept material and are out of scope unless a task explicitly names them.

- `src/connection/` contains the shared server-connection patch and its supporting resources. It is the home for connection configuration, including environment-based configuration.
- `src/haptic/`, `src/torch/`, `src/screen/`, `src/caption/`, `src/asset/`, `src/audio/`, and `src/video/` each contain the Max patch and supporting resources for that event type.
- `src/shared/` holds resources used by more than one source patch. It must not duplicate the server's authoritative event schemas.

The source structure is currently a scaffold. Add implementation files to the directory that owns the relevant patch rather than placing new patch code at the repository root.
