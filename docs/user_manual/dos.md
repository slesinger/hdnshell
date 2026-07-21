# Navigating Disk Drives and Directories

This guide explains how to navigate disk drives and directories in the HDN Shell. It is inspired by modern command-line environments but tailored for the Commodore 64. Commands are in lowercase.

The shell's directory commands (`cd`, `pwd`, `ll`/`dir`, and typing a file's name to run it) operate on a **current device**, which you select with the `#` command. The available current devices are:

- `t` — Ultimate storage, jumps to `/temp`
- `f` — Ultimate storage, jumps to `/flash`
- `h` — Ultimate storage, jumps to `/sd/home`
- `u` — Ultimate storage, jumps to `/usb0` (first USB stick)
- `v` — Ultimate storage, jumps to `/usb1` (second USB stick)
- `w` — Ultimate storage, jumps to `/usb0/home`
- `c` — CSDB.dk API navigation
- `n` — Network drive: browse and transfer files from the HDN Server's own workspace folder, as if it were just another local drive

> `t`, `f`, `h`, `u`, `v` and `w` are all the same physical Ultimate drive (device 8) — they are simply **directory shortcuts**. Each one jumps straight to a fixed folder (`#t`→`/temp`, `#f`→`/flash`, `#h`→`/sd/home`, `#u`→`/usb0`, `#v`→`/usb1`, `#w`→`/usb0/home`), so a bare `#t` lands you in `/temp` with no manual `cd`. Every switch re-roots, so `#t` after you've `cd`'d elsewhere brings you back to `/temp`. From there `cd`/`pwd`/`ll` roam the whole Ultimate filesystem freely. `#c`/`#n` are different — they select a server-backed logical device and connect to the HDN Server.

### Real IEC drives (8, 9) and SoftIEC

Real disk drives (device 8, 9), disk images you `mnt`, and SoftIEC are **not** current devices and are **not** selected with `#`. You use them the classic way — through the Retro Replay cartridge's own commands (`$`, `@`, `^filename`) and standard BASIC (`LOAD"...",8`, `SAVE`) — and you put images on them with `mnt` (below). The shell's `cd`/`pwd`/`ll` and "type its name" shortcuts are Ultimate-filesystem features and do not apply to IEC drives. See [Retro Replay Toolkit](using-the-shell.md#retro-replay-toolkit) for `$`/`@`/`^` and [SoftIEC](#softiec-sd2iec-emulation) below.

## Current Device

`#` — Print the current device. Simply type hash and press enter; it shows the current device letter next to it (one of `t`/`f`/`h`/`u`/`v`/`w`/`c`/`n`).

`#<device letter>` — Change the current device. Example: `` `#f` `` jumps to the Ultimate's `/flash` folder; `` `#c` `` switches to CSDB navigation. Only the letters listed above are valid — `#8`, `#9`, `#s` and any other letter are **not** shell commands and report `?SYNTAX ERROR` (use BASIC/cartridge commands for IEC drives, see above).

In some commands you can use `:` notation to avoid switching devices. For example, `c:find hondani` searches for the string hondani on the CSDB virtual device no matter which device is current.

> **Default on a fresh boot:** the current device starts on Ultimate storage (UCI), positioned wherever the Ultimate's own DOS is (its root, `/`, right after power-on). This means `ll`, `pwd`, and `cd` all work immediately after boot, with no need to type `#h`/`#t`/`#f` first.

## Listing Files (Directory Listing)

`ll` — List files on the current device.

`dir` — List files on the current device (same as `ll`).

`ll <pattern>` — List only entries whose name **starts with** the pattern (case-insensitive prefix match). A trailing `*` is optional, so `ll outrun` and `ll outrun*` behave identically. On `#c`/`#n` the filter is applied by the server.

`ll`/`dir` list the Ultimate filesystem (or the server, on `#c`/`#n`). They do not reach IEC drives: a real floppy drive, a SoftIEC device, or a disk image mounted with `mnt` all present themselves as an ordinary IEC drive, which the shell does not browse.

To see the directory of a real or mounted IEC drive (device 8/9) or SoftIEC, use the Retro Replay cartridge's own `$` command instead (see [Retro Replay Toolkit](using-the-shell.md#retro-replay-toolkit)) — just type `$` and press RETURN. It prints the directory directly through the cartridge, which is both faster and non-destructive: unlike `LOAD"$",8` (which loads the directory as a fake BASIC program, wiping out whatever program was in memory), `$` leaves the current BASIC program untouched. `LOAD"$",8` then `LIST` still works as a classic-BASIC fallback, but `$` is preferred.

## Navigating Directories

The `cd` command is used to change directories, similar to Linux/Windows shells.

To show the current directory, simply type `pwd`.

`cd /` — Change to the root directory

`cd mydir` — Enter directory "mydir" (relative)

`cd /mydir/` — Enter directory "mydir" (absolute from root)

`cd ..` — Go up one level (parent directory)

**`cd`/`pwd` operate on the Ultimate filesystem** (or the server, on `#c`/`#n`). They do not reach a real IEC drive, a SoftIEC device, or a `mnt`-ed image — navigate those with the cartridge's `$`/`@` commands instead. Subdirectories on a SoftIEC drive still exist and can be navigated that way — see [Navigating Subdirectories on SoftIEC](#navigating-subdirectories-on-softiec) below.

## Loading Programs

Loading works the classic way — BASIC stays, so `LOAD"demo*",8,1` works exactly as always. The Retro Replay cartridge also adds fast-load shortcuts (`/`, `%`, `^`, `F1`) — see [Executing Programs](executing_programs.md) for the full list, including a known `F1` limitation while console-switching is armed.

On a **real IEC drive, SoftIEC, or a `mnt`-ed image**, the "just type its name" shortcut (see [Executing Programs](executing_programs.md#just-type-its-name)) does not apply — it is an Ultimate-filesystem feature. Instead use the Retro Replay cartridge's own load-and-run shortcut: `^filename` (e.g. `^greet2`), or `^*` to run the first file on the disk — see [Retro Replay Toolkit](using-the-shell.md#retro-replay-toolkit). Classic BASIC (`LOAD"filename",8` then `RUN`, or `LOAD"*",8,1` then `RUN`) still works too.

To load a file to an arbitrary memory address of your choice, use [`memcpy`](memory-operations.md#saving-and-restoring-memory-blocks-memcpy).

## Creating Disk Images (`mkdisk`)

The `mkdisk` command creates a new, empty disk image on the Ultimate filesystem. The image type is taken from the file extension: **d64**, **d71**, **d81**, or **dnp**. Like `mkdir`, a bare name is created in the current directory, and relative or absolute paths work too. Creating disk images requires the HDN Server to be running.

Syntax: `mkdisk <name>.<type>[,<tracks>][,<diskname>]`

- `mkdisk games.d64` — create a standard 35-track D64 in the current directory
- `mkdisk games.d64,40` — create a 40-track D64
- `mkdisk demos.d81` — create a D81 (800 KB, 3.5″)
- `mkdisk demos.d81,,MY DEMOS` — D81 with the disk header label `MY DEMOS` (leave the middle field empty)
- `mkdisk archive.dnp,128,BACKUP` — create a 128-track DNP (a DNP **requires** a track count, 1–255)
- `mkdisk /usb0/tools/util.d64` — create at an absolute path

Track counts apply only where the format allows them: D64 accepts 35 (default) or 40; D71 (70) and D81 (160) are fixed, so any track value is ignored; DNP requires one. When no disk label is given, the Ultimate uses the file's name. Once created, mount the image with `mnt` (below) — or skip mounting entirely and use `cp`/`mv` to put files straight into it, see [Copying Into and Out of Disk Images](file-operations.md#copying-into-and-out-of-disk-images).

## Mounting and Unmounting Disk Images

The `mnt` command can mount disk images (D64/D71/D81) to a drive 8 or 9. This allows you to use the contents of the disk image as if it were a real disk drive. Mounting works regardless of your current device (`#`) — the image path is resolved against the Ultimate filesystem.

- `mnt myimage.d64` — Mount image in current directory to drive 8 (default)
- `mnt myimage.d64 9` — Mount to drive 9 instead of 8 (automatically enables the Ultimate's second drive if it was off)
- `mnt mydir/myimage.d64` — Mount image in subdirectory
- `mnt /mydir/myimage.d64` — Mount image absolute from root
- `umnt` — Unmount the disk image on drive 8 (return to SD card directory)
- `umnt 9` — Unmount the disk image on drive 9

Mounting is only needed for the classic `LOAD`/`SAVE` workflow. To just move a PRG in or out of an image without mounting it anywhere, use `cp`/`mv` directly on the image — see [Copying Into and Out of Disk Images](file-operations.md#copying-into-and-out-of-disk-images).

## Creating Directories, Copying Files

To create directories (`mkdir`) and copy files between the Ultimate storage and the server-backed devices (`cp`), see the [File Operations](file-operations.md) chapter. To check a single file's type, size, and modification date without a full listing, see [`file`](file-operations.md#getting-file-info-file) in the same chapter.

## SoftIEC (SD2IEC Emulation)

Software IEC emulation was popularized by [SD2IEC](https://www.c64-wiki.com/wiki/SD2IEC) project. You can [build your own easily](https://randomnerdtutorials.com/esp32-microsd-card-arduino/) but the good thing on C64U is that you do not need to. You can enable SoftIEC in the menu and it appears as **IEC device 10**. Like a real drive, it is used through BASIC and the cartridge's `$`/`@` commands, not by switching to it with `#`.

Refere to very detailed [documentation in C64OS post](https://c64os.com/post/sd2iecdocumentation#filemanagement). Kudos to Greg for his amazing work on all the documentation pages.

### Navigating Subdirectories on SoftIEC

Unlike a real 1541, SoftIEC exposes the Ultimate's SD card with real subdirectories (CMD-style partitions). The shell's own `cd`/`ll` don't reach SoftIEC (see the note above), but the classic DOS wedge commands the cartridge already provides — `@` and `$`, documented in [Retro Replay Toolkit](using-the-shell.md#retro-replay-toolkit) — talk to the drive's DOS directly and work fine:

- `@cd:<name>` — descend into subdirectory `<name>` (sends the CMD-style `CD:` DOS command straight to the drive's command channel).
- `@cd:..` — go back up to the parent directory.
- `$:*` — list the current directory (the classic wedge `$` command, drive number and `:pattern` both optional — `*` matches everything).

Example, with SoftIEC (device 10) at the SD card root:

```
@ll
73,u64iec ultimate dos v1.1,00,00
ready.

$:*
0 "/sd/home/"         00 2a
0    "games"       dir
...
65535 blocks free.
00, ok,00,00
ready.

@cd:games

ready.

$:*
0 "/sd/home/games/" 00 2a
23   "digitalclock"    prg
...
65535 blocks free.
00, ok,00,00
ready.

@cd:..

ready.
```

`@ll` above is just an example of an unrecognized DOS command: SoftIEC ignores it, so reading the error channel returns the drive's power-up identification string (`73,u64iec ultimate dos v1.1,00,00`) rather than an actual error — it does **not** list files. Use `$:*` (or plain `$`) for that.

## Drive Status

`@` — Read the drive error channel of the current IEC drive (the classic DOS wedge command, provided by the Retro Replay cartridge). `@<command>` sends a DOS command to the drive.