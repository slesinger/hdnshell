# Using the HDN Shell

HDN Shell RR is a wedge inside a Retro Replay cartridge. You type at the ordinary BASIC `READY.` prompt; shell commands are recognized and executed by the cartridge, plain BASIC keeps working as always, and anything neither of them understands is forwarded to the HDN Server's AI chat.

## Commands

`status` — Display the firmware identify string, local IP/netmask/gateway, and whether the HDN Server is reachable.

`time` — Display the current time from the C64U RTC (Real Time Clock). It may take a moment to fetch the time from the NTP Internet time.

`reset` — Reset the C64, similar to pressing the reset button. Memory is preserved.

`menu` — Freeze the current state of the CLI and enter the Ultimate menu.

`info` — Print the Retro Replay firmware banner.

`help` — Ask the server a question, or (if unreachable) print a short local pointer.

For directory navigation (`cd`, `pwd`, `ll`/`dir`, `#<device>`), disk images (`mnt`/`umnt`), and file transfer (`mkdir`, `cp`), see [Navigating Disk Drives and Directories](dos.md). For saving/loading raw memory blocks, see [Memory Operations](memory-operations.md).

`ll` and `dir` accept a filter pattern, e.g. `ll outrun*` lists only entries whose name starts with `outrun` (case-insensitive prefix match; the trailing `*` is optional).

Switching to an Ultimate drive with `#t`/`#f`/`#h`/`#u`/`#v` also jumps to that drive's mount root (`/temp`, `/flash`, `/sd/home`, `/usb0`, `/usb1`) — see [Navigating Disk Drives and Directories](dos.md#current-device).

Anything typed that isn't one of the commands above (or valid BASIC) is forwarded to the AI chat automatically — there's no need to prefix it with anything. See [AI Assistance](ai-assistance.md).

## Retro Replay Toolkit

Because the shell lives inside a Retro Replay cartridge, all of the cartridge's own tools remain available at the prompt, among others:

- `/name` — fast-load a program (`/*` loads the first file), `%name` — load absolute, `^name` — load and run
- `$` — print the disk directory
- `@` — read the drive error channel / send a DOS command (classic DOS wedge)
- `MON` — enter the machine code monitor, `TASS` — start Turbo Macro Pro
- `DELETE`, `COPY`, `RENUM`, `AUTO`, `FIND`, `OLD` and more BASIC toolkit commands

The function keys are command macros: `F1` load & run first file(*1), `F2` load first file, `F3` directory, `F5` LIST, `F7` RUN, `F8` monitor.

> *1 — Known limitation: `F1` does not currently trigger the shell to step aside if console-switching is armed, and can garble the screen while loading. See [Executing Programs](executing_programs.md#the-shell-steps-aside) for the workaround (`LOAD"*",8,1`+`RUN` instead of `F1`).

## Game and Program Compatibility

The shell is designed to be invisible to the software you run. The moment you load anything (`LOAD`, the cartridge's `/`, `%`, `^` commands) or type `RUN`, `SYS`, `MON` or `TASS`, the shell steps completely out of the way — the machine the program sees is identical to a stock Retro Replay setup. The shell wakes up again automatically on the next line you type at the BASIC prompt.

One side effect: if you've typed `HONDANI` to arm the [console-switching keys](cloud-apps.md) (`C=+CTRL+1..7`), they go inactive right after a load or `RUN` — type `HONDANI` again to re-arm them.

> **Known limitation:** the `F1` fastload-and-autorun macro does not currently trigger this step-aside if console-switching is armed, and can garble the screen while loading. See [Executing Programs](executing_programs.md#the-shell-steps-aside) for the workaround (`LOAD"*",8,1`+`RUN` instead of `F1`).

## Special Keys

Pressing `CTRL` while listing directory or viewing long listings will slow down the output for better readability.

`SHIFT+RETURN` - move to next line without executing command on current line.
