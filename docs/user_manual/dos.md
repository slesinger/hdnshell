# Navigating Disk Drives and Directories

This guide explains how to navigate disk drives and directories in the HDN Shell. It is inspired by modern command-line environments but tailored for the Commodore 64. Commands are in lowercase.

There are following devices available:

- `8` — First disk drive (e.g. 1541)
- `9` — Second disk drive (e.g. 1541)
- `h` — Home directory in Ultimate storage
- `f` — Flash partition in Ultimate storage
- `t` — Temp folder in Ultimate storage
- `s` — SoftIEC device (like SD2IEC) emulation storage in Ultimate
- `c` — CSDB.dk API navigation
- `n` — Network drive: browse and transfer files from the HDN Server's own workspace folder, as if it were just another local drive

> `h`, `t` and `f` are the same physical Ultimate drive (device 8) — switching between them only changes its current directory.

## Current Device

`#` — Print the current device. Simply type hash and press enter, it will populate the device letter next to it.

`#<device letter>` — Change the current device to the specified device. Example: `` `#s` `` will switch to the SD card storage.

In some commands you can use `:` notation to avoid necessity to switch devices. For example, `c:find hondani` will search for string hondani on CSDB virtual device while you can have #8 as the current device.

## Listing Files (Directory Listing)

`ll` — List files on the current device.

`dir` — List files on the current device (same as `ll`).

`ll <pattern>` — List only entries matching the pattern. A trailing `*` matches a prefix (`ll outrun*`); a pattern without `*` matches anywhere in the entry name.

## Navigating Directories

The `cd` command is used to change directories, similar to Linux/Windows shells.

To show the current directory, simply type `pwd`.

`cd /` — Change to the root directory

`cd mydir` — Enter directory "mydir" (relative)

`cd /mydir/` — Enter directory "mydir" (absolute from root)

`cd ..` — Go up one level (parent directory)

## Loading Programs

Loading works the classic way — BASIC stays, so `LOAD"demo*",8,1` works exactly as always, and the Retro Replay cartridge adds fast-load shortcuts: `/name` (fast load), `%name` (load absolute), `^name` (load and run), or simply the `F1` key to load and run the first file on the disk. See [Executing Programs](executing_programs.md).

To load a file to an arbitrary memory address of your choice, use [`memcpy`](memory-operations.md#saving-and-restoring-memory-blocks-memcpy).

## Mounting and Unmounting Disk Images

The `mnt` command can mount disk images (D64/D71/D81) to device 8. This allows you to use the contents of the disk image as if it were a real disk drive.

- `mnt myimage.d64` — Mount image in current directory
- `mnt mydir/myimage.d64` — Mount image in subdirectory
- `mnt /mydir/myimage.d64` — Mount image absolute from root
- `umnt` — Unmount disk image (return to SD card directory)

## Creating Directories

`mkdir <name>` — Create a directory in the current location. Only supported on the Ultimate filesystem (`h`/`t`/`f`).

## Copying Files (`cp`)

`cp <name>` — Copy a file between the Ultimate filesystem's `/temp` folder and whichever server-backed device is currently active:

- On `n` (network drive): downloads `<name>` from the current network-drive directory into `/temp`.
- On `c` (CSDB): downloads `<name>` (e.g. a release's `.zip`) into `/temp` — see [CSDB](csdb.md) for the full workflow.
- On `h`/`t`/`f`: uploads `<name>` from `/temp` into the current directory of whichever server-backed device (`n` or `c`) you last had active.
- Not supported on `8`/`9`/`s` (no server-side session to bridge to).

To save or load an arbitrary block of C64 memory (not a whole file already on a device), see [`memcpy`](memory-operations.md#saving-and-restoring-memory-blocks-memcpy) instead.

## SoftIEC (SD2IEC Emulation)

Software IEC emulation was popularized by [SD2IEC](https://www.c64-wiki.com/wiki/SD2IEC) project. You can [build your own easily](https://randomnerdtutorials.com/esp32-microsd-card-arduino/) but the good thing on C64U is that you do not need to. You can enable SoftIEC in the menu and you will see it as device #s (IEC device 10).

Refere to very detailed [documentation in C64OS post](https://c64os.com/post/sd2iecdocumentation#filemanagement). Kudos to Greg for his amazing work on all the documentation pages.

---



For more disk operation commands, see the [File Operations](file-operations.md) chapter.

## Drive Status

`@` — Read the drive error channel of the current IEC drive (the classic DOS wedge command, provided by the Retro Replay cartridge). `@<command>` sends a DOS command to the drive.