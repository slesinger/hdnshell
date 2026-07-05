# Filesystem Operations

## Ultimate Storage

`mkdir <name>` — Create a new directory with the specified name. Ultimate filesystem only (`h`/`t`/`f`).

`cp <name>` — Copy a file between `/temp` on the Ultimate filesystem and the currently active server-backed device (`n` network drive or `c` CSDB). See [Navigating Disk Drives and Directories](dos.md#copying-files-cp) for the full device matrix, or [CSDB](csdb.md) for the CSDB-specific workflow.

## Saving and Loading Arbitrary Memory

To save or restore a block of memory (not a whole file that's already on a device), use `memcpy` — see [Memory Operations](memory-operations.md#saving-and-restoring-memory-blocks-memcpy).

## Deleting Files

Deleting files on IEC drives is handled by the Retro Replay cartridge's own BASIC toolkit `DELETE` command, or classically via the drive command channel (`@s:name`). On the Ultimate storage, use the web UI's [File Manager](file-manager.md) to delete files and folders.
