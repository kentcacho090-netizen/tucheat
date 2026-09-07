# TUCheat

Touch U Touch Me client research workspace.

## Scope

This repository is organized for static client analysis, documentation, and controlled testing.

## Structure

- `docs/` — architecture and findings
- `tools/` — local analysis utilities
- `research/` — extracted artifacts and notes
- `src/` — controlled prototypes

## Research workflow

1. Record the client version and installer hashes.
2. Extract the installer into an isolated analysis directory.
3. Inventory executables, DLLs, resources, and configuration files.
4. Record imports, strings, and version metadata.
5. Document observations in `docs/findings.md`.
6. Keep experimental builds separate from the original client.

Do not commit proprietary game binaries, credentials, or generated secrets.
