# Filesystem Operations

Commands for creating directories, copying files, and moving raw memory blocks. For navigating devices and directories, listing, mounting disk images, and drive status, see [Navigating Disk Drives and Directories](dos.md).

## Creating Directories

`mkdir <name>` — Create a directory in the current location. Only supported on the Ultimate filesystem (`t`/`f`/`h`/`u`/`v`). A relative `<name>` is created inside the current directory; an absolute `/path/name` works too.

## Copying Files (`cp`)

`cp <name>` — Copy a file between the Ultimate filesystem's `/temp` folder and whichever server-backed device is currently active:

- On `n` (network drive): downloads `<name>` from the current network-drive directory into `/temp`.
- On `c` (CSDB): downloads `<name>` (e.g. a release's `.zip`) into `/temp` — see [CSDB](csdb.md) for the full workflow.
- On `t`/`f`/`h`/`u`/`v` (Ultimate storage): uploads `<name>` from `/temp` into the current directory of whichever server-backed device (`n` or `c`) you last had active.
- Not supported on `8`/`9`/`s` (no server-side session to bridge to).

## Saving and Loading Arbitrary Memory

To save or restore a block of memory (not a whole file that's already on a device), use `memcpy` — see [Memory Operations](memory-operations.md#saving-and-restoring-memory-blocks-memcpy).

## Deleting Files (`del`)

`del <pattern>` — Delete one or more files matching `<pattern>`. The pattern's directory part resolves against the current directory (like `mkdir`), and the filename part may contain the usual glob wildcards `*` and `?`. Only files are deleted — directories are always left untouched.

- `del old.prg` — delete a single named file in the current directory
- `del *.prg` — delete every `.prg` file in the current directory
- `del temp?.d64` — delete `temp0.d64`, `temp1.d64`, … (single-character wildcard)
- `del /usb0/games/*.tmp` — delete matching files at an absolute path

`del` operates on whichever drive you are currently on:

- On `t`/`f`/`h`/`u`/`v` (Ultimate storage): deletes on the Ultimate filesystem.
- On `n` (network drive): deletes within the current network-drive directory (sandboxed to the server workspace).

**There is no confirmation prompt** — a matching file is deleted immediately, so double-check your pattern. `del` reports how many files it removed (`OK: deleted 3 file(s)`), or `?NOTHING MATCHED` when the pattern matches nothing. Deleting files requires the HDN Server to be running. On IEC-only drives (`8`/`9`/`s`, no server session), use the Retro Replay cartridge's own BASIC `DELETE` command or the drive command channel (`@s:name`) instead. You can also delete via the web UI's [File Manager](file-manager.md).
