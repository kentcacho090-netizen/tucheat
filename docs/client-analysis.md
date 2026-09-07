# Client Analysis

## Target

Touch 4Games Express installer supplied for analysis.

## Initial observations

- Windows PE32 executable
- NSIS installer
- English installer build
- Installer is a wrapper; the game/client payload must be extracted before component analysis.

## Analysis checklist

- [ ] Extract NSIS payload
- [ ] Inventory EXE/DLL files
- [ ] Record file hashes
- [ ] Inspect PE headers and imports
- [ ] Extract strings and URLs
- [ ] Identify configuration/resources
- [ ] Map client components
- [ ] Document findings

## Working rule

Preserve the original installer and work on extracted copies.
