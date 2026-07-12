# Executing Programs

The most typical user path to run a game or a demo is by [navigating](dos.md#navigating-directories) to a D64 image, [mounting](dos.md#mounting-and-unmounting-disk-images) it, loading and running it.

Because BASIC stays in place with HDN Shell RR, running programs works exactly as on a stock machine — plus the Retro Replay cartridge's fast-load shortcuts.

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
