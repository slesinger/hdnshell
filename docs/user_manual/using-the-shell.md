# Using the HDN Shell

HDN Shell RR is a wedge inside a Retro Replay cartridge. You type at the ordinary BASIC `READY.` prompt; shell commands are recognized and executed by the cartridge, plain BASIC keeps working as always, and anything neither of them understands is forwarded to the HDN Server's AI chat.

> **Run a program by typing its name.** You don't need `LOAD`/`RUN` or the cartridge's `/`, `^` shortcuts — just type a program's name and press RETURN. The shell finds it (in the current directory, or in the global `/flash/bin` folder), loads it, and runs it. See [Executing Programs](executing_programs.md#just-type-its-name).

## Commands

`status` — Display the firmware identify string, local IP/netmask/gateway, and whether the HDN Server is reachable.

`time` — Display the current time from the C64U RTC (Real Time Clock). It may take a moment to fetch the time from the NTP Internet time.

`reset` — Reset the C64, similar to pressing the reset button. Memory is preserved.

`menu` — Freeze the current state of the CLI and enter the Ultimate menu.

`info` — Print the Retro Replay firmware banner.

`help` — Ask the server a question, or (if unreachable) print a short local pointer.

For directory navigation (`cd`, `pwd`, `ll`/`dir`, `#<device>`), disk images (`mkdisk`, `mnt`/`umnt`), and file management (`mkdir`, `cp`, `mv`, `del`), see [Navigating Disk Drives and Directories](dos.md). For saving/loading raw memory blocks, see [Memory Operations](memory-operations.md).

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

## Scrollback (Screen History)

The C64 screen only holds 25 lines, so a previous command or its output disappears the moment the screen rolls over. Scrollback lets you page back through everything that has scrolled off — like a terminal's scrollback buffer or `.bash_history`.

| Shortcut | Action |
|----------|--------|
| `C=+CTRL+F5` | Page **back** to the previous (older) screen |
| `C=+CTRL+F7` | Page **forward** to the next (newer) screen |
| any other key | Return to the live screen and resume typing |

The first `C=+CTRL+F5` snapshots your current screen and shows the most recent stored page (which looks almost identical to what was on screen) — press it again to reach genuinely older content. When you return to the live screen, your prompt and any half-typed line are restored exactly as you left them.

The history itself lives **on the HDN Server**, in `.config/.history`, so it survives resets and power cycles — you can scroll back through days or weeks of sessions. The file is capped at about 100 KB; the oldest lines are dropped as new ones arrive.

### Good to Know

- **Requires the HDN Server** and the `C=+CTRL` keys to be armed — the same conditions as the [console-switching keys](cloud-apps.md#console-switching). They are armed automatically at boot; if they went inactive after a `LOAD` or `RUN`, type `HONDANI` to re-arm them.
- Scrollback is **view-only** in this version: to re-run an old command, page back to the live screen first, then move the cursor onto the line you want (as usual) and press `RETURN`.
- History is captured when the shell handles a command and when you open scrollback. A single burst that scrolls **more than a full screen at once** (for example a very long `LIST`) may not record every line in the middle.
- If the server is unreachable, `C=+CTRL+F5`/`F7` do nothing and you stay at the local prompt.
