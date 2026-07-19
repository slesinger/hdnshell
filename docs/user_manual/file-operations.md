# Filesystem Operations

Commands for creating directories, copying files, and moving raw memory blocks. For navigating devices and directories, listing, mounting disk images, and drive status, see [Navigating Disk Drives and Directories](dos.md).

## Creating Directories

`mkdir <name>` — Create a directory in the current location. Only supported on the Ultimate filesystem (`t`/`f`/`h`/`u`/`v`). A relative `<name>` is created inside the current directory; an absolute `/path/name` works too.

## Copying and Moving Files (`cp` / `mv`)

`cp <src> <dst>` and `mv <src> <dst>` copy or move a single file (or, with a wildcard source, several) between the Ultimate filesystem and the `n` network drive, within the Ultimate filesystem itself, or (as a source only) out of CSDB.

Each of `<src>`/`<dst>` is one of:

- **A bare path** — the Ultimate DOS filesystem. `t`/`f`/`h`/`u`/`v` are all the *same* physical drive, just different starting directories, so there is no per-letter prefix: an absolute path (`/temp/game.prg`) works from anywhere, and a relative path (`game.prg`, `../tools`) resolves against whatever directory you're currently in on that drive. A relative path typed while you're on a *different* device (e.g. `#n`) is a usage error — it has no Ultimate-DOS directory to resolve against.
- **`n:<path>`** — the network drive. `n:` alone means the current network-drive directory; `n:/path` is root-relative *within* the network drive (not the real server filesystem); `n:path` is relative to the current network-drive directory.
- **`c:<pattern>`** — CSDB, **source only**. Reuses the release/zip browsing you last did with `#c` (see [CSDB](csdb.md)) regardless of which device you're on right now, and uploads the matched file(s) to `<dst>` instead of always landing in `/temp`. `c:` cannot be a destination (CSDB is read-only), and `mv` cannot use it as a source (use `cp`).
- **`8:`/`9:`/`s:`** — not supported; there is no server-side session to the real IEC drives.

Examples (typed while `#h` has taken you to `/sd/home`):

```
cp /temp/echo.prg .              copy /temp/echo.prg into the current dir, same name
cp /temp/echo.prg ../tools        copy into ../tools, same name
cp echo.prg /usb0/tools           copy the current dir's echo.prg to /usb0/tools
cp ../tools/echo.prg n:tools/new  copy to the network drive, renamed to "new"
mv echo.prg n:archive             move (not copy) into the network drive's archive dir
```

The destination follows the usual `cp`/`mv` convention: if it's an existing directory, the file lands inside it under its original name; otherwise the destination path is the exact new name/location.

A wildcard (`*`/`?`) source requires an existing directory as the destination — matching several files into one filename is ambiguous and rejected. Matching a single named source is case-insensitive as a fallback (an exact-case match always wins first, same as `del`/`file`); the destination name you type is always used exactly as typed, never case-folded.

`mv` renames in place (fast, atomic) when both sides are on the same filesystem (Ultimate DOS, or the network drive). Moving between the Ultimate filesystem and the network drive copies the file, verifies it arrived intact, and only then deletes the original — if anything goes wrong, the source is left untouched.

CSDB's own single-argument `cp <pattern>` (download straight to `/temp` while browsing a release) is unchanged — see [CSDB](csdb.md). Likewise the network drive's single-argument `cp <name>` (push straight to `/temp`) still works exactly as before; the two-argument forms above are additive.

Requires the HDN Server to be running; errors look like `?FTP FAILED: ...`, `?NO CLIENT IP - cannot reach C64U`, `?ACCESS DENIED - outside workspace`, or `?NOTHING MATCHED: <pattern>`.

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

## Getting File Info (`file`)

`file <name>` — Print the type, size, and modification date/time of a file. `<name>` resolves against the current directory exactly like `mkdir`/`del` — a relative name is looked up inside the current directory, an absolute `/path/name` also works.

```
NAME     game.prg
TYPE     PRG
SIZE     12345 BYTES
MODIFIED 2026-07-14 18:22:03
```

- The basename may be a glob, so `file *.d64` reports every match. Output is capped at 8 matches, after which `file` prints `...N more match(es)`.
- Matching is case-sensitive first; if nothing matches exactly, it retries case-insensitively, so `file game.prg` also finds `GAME.PRG`.
- TYPE is the uppercased file extension (`PRG`, `D64`, …), `FILE` when the name has no extension, or `DIR` for a directory. Directories show no SIZE line.
- SIZE is in bytes.
- MODIFIED is `YYYY-MM-DD HH:MM:SS`. Some entries — notably the pseudo-directories at the filesystem root (SD, Flash, Temp, USB0) — carry no real timestamp on the Ultimate; `file` prints `(not set)` for those instead of a misleading date.

Like `del`, `file` operates on whichever drive you are currently on:

- On `t`/`f`/`h`/`u`/`v` (Ultimate storage): reports on the Ultimate filesystem.
- On `n` (network drive): reports within the current network-drive directory (sandboxed to the server workspace).
- Not supported on `c` (CSDB), or on `8`/`9`/`s` (no server session).

`file` reports `?NOT FOUND: <name>` when nothing matches, `?FTP FAILED: ...` on an FTP error, and `?NO CLIENT IP - cannot reach C64U` when the shell can't reach the C64U. Requires the HDN Server to be running.
