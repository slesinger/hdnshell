# Ultimate DOS — Command Summary

- **Author:** Gideon Zweijtzer (Gideon's Logic Architectures)
- **Version:** 1.1, January 17th 2016
- **Source:** `ultimate_dos-1.1.pdf`
- **Copyright:** © 2013-2016 Gideon's Logic Architectures. All rights reserved.

## 1. Introduction

### 1.1. Context

"Ultimate DOS" provides programmatic access to the file system of the 1541 Ultimate-II module.
It is a **target** of the "Ultimate-II command interface" and is accessible from the cartridge
port through I/O registers. See the separate document "Ultimate-II Command Interface – Register
API" for how commands are physically sent over that interface (control/command/status registers
— see `UltimateNetworking.md` for a concrete register-level walkthrough of the same underlying
protocol, using the networking target as the example).

### 1.2. Purpose of this document

Describes the DOS commands sendable to this target, and their expected behavior/response.

## 2. Commands

As of firmware v2.6, "Ultimate-DOS" is accessible through **target `$01`** and **target `$02`**
— this is the first byte of every command. The two targets are independent *instances* of the
DOS, each with its own state (its own current directory and open file). This allows two
directories/files to be open simultaneously, one per target. Examples below use target `$01`.

Command byte layout in general: `[target] [command] [args...]`.

### Command index

| Command                     | Code   | Introduced |
|------------------------------|--------|------------|
| DOS_CMD_IDENTIFY              | `0x01` |            |
| DOS_CMD_OPEN_FILE             | `0x02` |            |
| DOS_CMD_CLOSE_FILE            | `0x03` |            |
| DOS_CMD_READ_DATA             | `0x04` |            |
| DOS_CMD_WRITE_DATA            | `0x05` |            |
| DOS_CMD_FILE_SEEK             | `0x06` |            |
| DOS_CMD_FILE_INFO             | `0x07` |            |
| DOS_CMD_FILE_STAT             | `0x08` |            |
| DOS_CMD_DELETE_FILE           | `0x09` | v1.1       |
| DOS_CMD_RENAME_FILE           | `0x0a` | v1.1       |
| DOS_CMD_COPY_FILE             | `0x0b` | v1.1       |
| DOS_CMD_CHANGE_DIR            | `0x11` |            |
| DOS_CMD_GET_PATH              | `0x12` |            |
| DOS_CMD_OPEN_DIR              | `0x13` |            |
| DOS_CMD_READ_DIR              | `0x14` |            |
| DOS_CMD_COPY_UI_PATH          | `0x15` | deprecated since fw 3.0 |
| DOS_CMD_CREATE_DIR            | `0x16` | v1.1       |
| DOS_CMD_COPY_HOME_PATH        | `0x17` | v1.1       |
| DOS_CMD_LOAD_REU              | `0x21` |            |
| DOS_CMD_SAVE_REU              | `0x22` |            |
| DOS_CMD_MOUNT_DISK            | `0x23` | v1.1       |
| DOS_CMD_UMOUNT_DISK           | `0x24` | v1.1       |
| DOS_CMD_SWAP_DISK             | `0x25` | v1.1       |
| DOS_CMD_ECHO                  | `0xF0` |            |

### 2.1. DOS_CMD_IDENTIFY (0x01)

**Format:** `$01 $01`

Returns an identification string, e.g. `"ULTIMATE-II DOS V1.0"`. Can be used to query which
targets exist / obtain version info.

**Status:** always `"00,OK"` (cannot fail).

### 2.2. DOS_CMD_OPEN_FILE (0x02)

**Format:** `$01 $02 [attrib] <filename>`

Opens a file. `attrib` is a flags byte:

| Attribute            | Value  |
|-----------------------|--------|
| `FA_READ`              | `$01`  |
| `FA_WRITE`              | `$02`  |
| `FA_CREATE_NEW`        | `$04`  |
| `FA_CREATE_ALWAYS`     | `$08`  |

- Read mode: `$01`.
- Write to existing file (no clear): `$02`.
- Write + create new (clears file to 0 bytes first): add `$04`.
- Write + may overwrite existing file: add `$08`.
- Write, always overwrite if exists: `$0E` (i.e. `$02|$04|$08`).

Filename is **not** null-terminated — its length is derived from the overall command length.

**Example:** `$01 $02 $01 MYFILE`

Never returns data. **Status:** `"00,OK"` or a filesystem status message.

### 2.3. DOS_CMD_CLOSE_FILE (0x03)

**Format:** `$01 $03`

Closes the last-opened file. No arguments, no data returned.

**Status:** `"00,OK"` or `"84,NO FILE TO CLOSE"`.

### 2.4. DOS_CMD_READ_DATA (0x04)

**Format:** `$01 $04 [len_lo] [len_hi]`

Starts a read transfer from the open file. `len_lo`/`len_hi` give total bytes to transfer (16-bit,
max 65,535). Data is always sent in chunks of max 512 bytes; the receiver must "accept" each
512-byte packet before the next is sent (data-queue message size limit).

If no file is open: empty data packet, status `"85,NO FILE OPEN"`.

**Status:** silent when OK; reports errors when something goes wrong.

### 2.5. DOS_CMD_WRITE_DATA (0x05)

**Format:** `$01 $05 [dummy] [dummy] [data ...]`

Writes to the currently open file. The two dummy bytes align the payload to a long-word boundary.
Suggested transfer chunk size: 512 bytes, for optimal performance within the max command size.

Never returns data.

**Status:** `"85,NO FILE OPEN"` if nothing open; `"ACCESS DENIED"` if file not opened for writing.

### 2.6. DOS_CMD_FILE_SEEK (0x06)

**Format:** `$01 $06 [posL] [posML] [posMH] [posH]`

Sets the file pointer to a 32-bit position (LSB first).

Never returns data. **Status:** `"00,OK"` on success, a filesystem message on failure, or
`"85,NO FILE OPEN"` if nothing open.

### 2.7. DOS_CMD_FILE_INFO (0x07)

**Format:** `$01 $07`

Returns a data packet describing the currently open file (effectively a `stat` on it):

```c
struct {
    DWORD size;        // File size
    WORD  date;        // Last modified date
    WORD  time;        // Last modified time
    char  extension[3];
    BYTE  attrib;       // Attribute (see DOS_CMD_READ_DIR bit layout)
    char  filename[];
};
```

**Status:** `"00,OK"`, `"85,NO FILE OPEN"`, or `"88,NO INFORMATION AVAILABLE"`.

### 2.8. DOS_CMD_FILE_STAT (0x08)

**Format:** `$01 $08 <filename>`

Same data packet format as `DOS_CMD_FILE_INFO` (0x07), but for an arbitrary named file rather
than the currently open one.

**Status:** `"00,OK"` or `"88,FILE NOT FOUND"`.

### 2.9. DOS_CMD_DELETE_FILE (0x09)

**Format:** `$01 $08 <filename>` *(as printed in the source doc — note this literally reuses the
`$08` command byte in the example; verify against firmware/other tooling before relying on it,
this may be a documentation typo for `$09`)*

Deletes the specified file. No data returned.

**Status:** `"00,OK"` or a filesystem error message.

*Introduced in v1.1.*

### 2.10. DOS_CMD_RENAME_FILE (0x0a)

**Format:** `$01 $0a <filename> $00 <newname>`

Renames `<filename>` to `<newname>`. No data returned.

**Status:** `"00,OK"` or a filesystem error message.

*Introduced in v1.1.*

### 2.11. DOS_CMD_COPY_FILE (0x0b)

**Format:** `$01 $0b <source> $00 <destination>`

Copies `<source>` to `<destination>`. No data returned.

**Status:** `"00,OK"` or a filesystem error message.

*Introduced in v1.1.*

### 2.12. DOS_CMD_CHANGE_DIR (0x11)

**Format:** `$01 $11 <directory name>`

Changes into a subdirectory. On DOS start, current directory is the SD card root. `.` and `..`
have the usual (current/parent) meaning. Sub-file-systems such as `.D64` files can also be
entered — subsequent commands (e.g. Open File) then operate on entries inside them.

Never returns data.

**Status:** `"00,OK"` or `"83,NO SUCH DIRECTORY"`.

### 2.13. DOS_CMD_GET_PATH (0x12)

**Format:** `$01 $12`

Returns the current path from the root, as a data packet.

**Status:** always `"00,OK"` (cannot fail).

### 2.14. DOS_CMD_OPEN_DIR (0x13)

**Format:** `$01 $13`

Begins reading the current directory. No data returned.

**Status:** `"00,OK"`, `"01,DIRECTORY EMPTY"`, or `"86,CAN'T READ DIRECTORY"`.

### 2.15. DOS_CMD_READ_DIR (0x14)

**Format:** `$01 $14`

Streams directory contents to the data channel — one data packet per entry. Each packet: 1
attribute byte followed by the filename.

Attribute byte layout (reused from the FAT directory-entry attribute byte, applied to non-FAT
filesystems too):

| Bit 7 | Bit 6 | Bit 5     | Bit 4 | Bit 3   | Bit 2  | Bit 1  | Bit 0    |
|-------|-------|-----------|-------|---------|--------|--------|----------|
| —     | —     | ARCHIVE   | DIR   | VOLUME  | SYSTEM | HIDDEN | READONLY |

### 2.16. DOS_CMD_COPY_UI_PATH (0x15)

**Format:** `$01 $15`

Continues using the path already opened in the file browser UI (enables relative paths from
software). Falls through to `DOS_CMD_GET_PATH` behavior, returning the current browser path.

**⚠ Deprecated since firmware v3.0** — now returns `"99,FUNCTION NOT IMPLEMENTED"`.

### 2.17. DOS_CMD_CREATE_DIR (0x16)

**Format:** `$01 $16 <dirname>`

Creates the named directory in the current path. No data returned.

**Status:** `"00,OK"` or a filesystem error message.

*Introduced in v1.1.*

### 2.18. DOS_CMD_COPY_HOME_PATH (0x17)

**Format:** `$01 $17`

Changes into the user-defined home directory (set under "User Interface Settings" → "Home
Directory"). Falls through to `DOS_CMD_GET_PATH` behavior, returning the current path.

**Status:** a filesystem error message if the home directory doesn't exist.

*Introduced in v1.1.*

### 2.19. DOS_CMD_LOAD_REU (0x21)

**Format:** `$01 $21 [addrL] [addrML] [addrMH] [addrH] [lenL] [lenML] [lenMH] [lenH]`

Reads data from the currently open file into REU memory. Two 32-bit LSB-first params:
- REU destination address
- number of bytes to read

Does **not** wrap around — truncated if `addr + len` exceeds the end of REU memory. Upper bytes
of both address and length are masked out (assumes a **16 MB REU** configuration — effectively
these upper bytes are dummy/ignored).

**Status:** `"00,OK"`, `"02,REQUEST TRUNCATED"`, or a filesystem message.

**Data returned:** human-readable detail string, e.g. `"$003000 BYTES LOADED TO REU $126800"`.

### 2.20. DOS_CMD_SAVE_REU (0x22)

**Format:** `$01 $22 [addrL] [addrML] [addrMH] [addrH] [lenL] [lenML] [lenMH] [lenH]`

Writes data to the currently open file, sourced from REU memory. Same 32-bit LSB-first param
layout as `LOAD_REU`: source REU address, byte count. Same truncation and 16 MB REU assumption.

**Status:** `"00,OK"`, `"02,REQUEST TRUNCATED"`, or a filesystem message.

**Data returned:** e.g. `"$008000 BYTES SAVED FROM REU $852000"`.

### 2.21. DOS_CMD_MOUNT_DISK (0x23)

**Format:** `$01 $23 <id> <filename>`

Mounts the disk image `<filename>` on the drive with IEC id `<id>` (single byte). If no drive has
that id, the last-mounted-on drive is used instead; if there's still no such drive:
`"90,DRIVE NOT PRESENT"`. If `<filename>` isn't a disk image: `"89,NOT A DISK IMAGE"`.

Never returns data. **Status:** `"00,OK"` on success.

*Introduced in v1.1.*

### 2.22. DOS_CMD_UMOUNT_DISK (0x24)

**Format:** `$01 $24 <id>`

Unmounts the disk on drive `<id>` (or the last-mounted-on drive, per the same fallback rule as
Mount). `"90,DRIVE NOT PRESENT"` if no such drive exists. Succeeds (`"00,OK"`) even if nothing
was mounted. Never returns data.

*Introduced in v1.1.*

### 2.23. DOS_CMD_SWAP_DISK (0x25)

**Format:** `$01 $25 <id>` *(source doc prints `$01 $0x25 <id>` — the `0x` is a typo; the actual
command byte is `$25`)*

Equivalent to the physical disk-swap function (holding the menu button >1s), applied to drive
`<id>` (same fallback rule as Mount/Umount if the id doesn't match a drive; `"90,DRIVE NOT
PRESENT"` if none exists at all).

Never returns data. **Status:** `"00,OK"` on success.

*Introduced in v1.1.*

### 2.24. DOS_CMD_ECHO (0xF0)

**Format:** `$01 $F0`

Echoes the command straight back as a data packet.

**Status:** always `"00,OK"` (cannot fail).
