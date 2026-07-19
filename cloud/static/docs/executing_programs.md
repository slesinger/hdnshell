# Executing Programs

Because BASIC stays in place with HDN Shell RR, running programs works exactly as on a stock machine — plus the Retro Replay cartridge's fast-load shortcuts. But the easiest way of all is new: **just type the program's name.**

## Just Type Its Name

The fastest way to run a program is to **type its name at the `READY.` prompt and press RETURN** — no `LOAD`, no `RUN`, no `/` or `↑` prefix. The shell finds the file, loads it into memory, and runs it for you, PC-DOS style:

```
outrun
```

If a file by that name exists, it loads and runs. A few things to know:

- **Case-insensitive.** `OUTRUN`, `outrun`, and `OutRun` all match the same file.
- **Type the exact filename, including any extension** — for example `game.prg`. (The shell does not guess extensions; type the name as it appears in the directory listing.)
- Works for both BASIC and machine-code programs — the shell reads each program's own load address and starts it correctly.
- Just a program name is a single word. If what you type has spaces (or isn't a real file), it's treated normally — as BASIC, or forwarded to [AI chat](ai-assistance.md).

### Where the shell looks

1. **The current directory** on the selected Ultimate drive (`#h`/`#t`/`#f`). Browse it first with [`cd`](dos.md#navigating-directories) and [`ll`](using-the-shell.md).
2. **`/flash/bin`** — a global "programs" folder on the Ultimate's flash. If the name isn't in the current directory, the shell looks in `/flash/bin` next, on **any** drive.

That second step is the genuinely handy part: copy your favourite tools and games into `/flash/bin` once, and you can launch them **by name from anywhere** — no mounting disk images, no navigating directories first. It works just like a command `PATH` on a PC. See [file operations](file-operations.md) for how to copy programs into `/flash/bin`.

If the name is found in neither place, nothing is loaded and the line is handled normally.

## The Classic Way

You can still run a game or demo the traditional way: [navigate](dos.md#navigating-directories) to a D64 image, [mount](dos.md#mounting-and-unmounting-disk-images) it, then load and run.

## Load and Run

Any of the following works after `mnt`-ing a disk image (or with a real drive):

- `LOAD"*",8,1` then `RUN` — the classic way, accelerated by the cartridge's fast loader.
- `/name` — fast-load a program (`/*` loads the first file), then `RUN`.
- `↑name` — fast-load and run in one step.
- `F1` — function key macro: load and run the first program on the disk.
- `F7` — function key macro: `RUN`.

## The Shell Steps Aside

The moment you load anything or type `RUN` or `SYS`, the shell disarms itself completely — the program runs on a bit-for-bit stock machine. See [Game and Program Compatibility](using-the-shell.md#game-and-program-compatibility).

> **Known limitation — `F1` while console-switching is armed.** If you've typed `HONDANI` to arm the `C=+CTRL+1..7` [console-switching keys](cloud-apps.md), using `F1` to fastload-and-autorun a program can garble the screen during loading. This is because `F1` (the cartridge's `%0:*` macro) jumps straight into the program without going through `LOAD` or `RUN`, so the shell doesn't get a chance to step aside first. `LOAD"*",8,1` then `RUN` — or `LOAD"*",8,1` then `MON` and `G <address>` — both work correctly and are unaffected. **Workaround: while console-switching is armed, launch programs with `LOAD"*",8,1`+`RUN` instead of `F1`.** Everything else (including plain `F1` when console-switching was never armed) is unaffected.

## Starting Machine Code at an Address

To jump to a machine-code entry point, use BASIC's `SYS <decimal address>` (e.g. `SYS 2061`), or enter the Retro Replay monitor with `MON` and use its `G` command with a hex address.
