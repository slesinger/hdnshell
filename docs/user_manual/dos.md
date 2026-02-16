# Navigating Disk Drives and Directories

This guide explains how to navigate disk drives and directories in the HDN Shell. It is inspired by modern command-line environments but tailored for the Commodore 64.

There are following devices available:

- `8` — First disk drive (e.g. 1541)
- `9` — Second disk drive (e.g. 1541)
- `h` — Home directory in Ultimate storage
- `f` — Flash storage in Ultimate (SD card, USB, Temp)
- `t` — Temp folder in Ultimate storage
- `s` — SoftIEC device (like SD2IEC) emulation storage in Ultimate
- `c` — CSDB.dk API navigation

## Current Device

`#` — Print the current device. Simply type hash and press enter, it will populate the device letter next to it.

`#<device letter>` — Change the current device to the specified device. Example: `` `#s` `` will switch to the SD card storage.

In some commands you can use `:` notation to avoid necessity to switch devices. For example, `c:find hondani` will search for string hondani on CSDB virtual device while you can have #8 as the current device.

## Listing Files (Directory Listing)

`ll` — List files on the default device.

`dir` — List files on the default device.

`<device letter>:dir` — List files on a specific device.

## Navigating Directories

The `cd` command is used to change directories, similar to Linux/Windows shells.

To show the current directory, simply type `pwd`.

`cd /` — Change to the root directory

`cd mydir` — Enter directory "mydir" (relative)

`cd /mydir/` — Enter directory "mydir" (absolute from root)

`cd ..` — Go up one level (parent directory)

## Loading Programs

`l <name with wildcards> [<to address>]` — Load file from current device.

The `to address` is optional, if not provided, it will load to the default address specified in the file header. The address is assumed to be in hexadecimal.

Examples:
`l demo*` — Load files matching 'demo*' from current device. `*` fits any string, so it will load the first file starting with 'demo'.

`l music.prg 2000` — Load 'music.prg' from current device to address $2000 (8192).


## Mounting and Unmounting Disk Images

The `mount` command can mount disk images (D64/D71/D81) to a device 8 or 9. This allows you to use the contents of the disk image as if it were a real disk drive.

- `mount myimage.d64` — Mount image in current directory
- `mount mydir/myimage.d64` — Mount image in subdirectory
- `mount /mydir/myimage.d64` — Mount image absolute from root
- `unmount` — Unmount disk image (return to SD card directory)

## SoftIEC (SD2IEC Emulation)

Software IEC emulation was popularized by [SD2IEC](https://www.c64-wiki.com/wiki/SD2IEC) project. You can [build your own easily](https://randomnerdtutorials.com/esp32-microsd-card-arduino/) but the good thing on C64U is that you do not need to. You can enable SoftIEC in the menu and you will see it as device #s (IEC device 10).

Refere to very detailed [documentation in C64OS post](https://c64os.com/post/sd2iecdocumentation#filemanagement). Kudos to Greg for his amazing work on all the documentation pages.

---



For more disk operation commands, see the [File Operations](file-operations.md) chapter.

## Last Status

`@` — Print the status string of the last operation on network or Ultimate DOS, etc.