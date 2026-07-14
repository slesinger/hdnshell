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

## Deleting Files

Deleting files on IEC drives is handled by the Retro Replay cartridge's own BASIC toolkit `DELETE` command, or classically via the drive command channel (`@s:name`). On the Ultimate storage, use the web UI's [File Manager](file-manager.md) to delete files and folders.
