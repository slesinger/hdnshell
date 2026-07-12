# Memory Operations and Monitor

The C64 offers its memory to the user to arbitrarily load into and save from. There are no useless memory protection mechanisms, no dynamic memory allocation, no virtual memory. You have 64KB of RAM, and you can do with it whatever you want.

## Machine Code Monitor

The Retro Replay cartridge that hosts HDN Shell RR ships with a full machine code monitor. Type `MON` (or press `F8`) at the `READY.` prompt to enter it. There you can display and modify memory, disassemble, assemble, jump to code, inspect registers, and more. Exit the monitor to return to the shell prompt.

On top of that, HDN Shell RR adds one command of its own for moving memory to and from files: `memcpy`.

## Saving and Restoring Memory Blocks (`memcpy`)

`memcpy $start-$end filename` — Save the memory range `$start` to `$end` (inclusive) to `filename` on the current device.

`memcpy filename $start` — Load `filename` back into memory starting at `$start`. This is a **relocatable** load: any load address stored inside the file itself is ignored, so you can save a block from one address and restore it somewhere else entirely.

Addresses are hexadecimal, with or without the `$` prefix.

Examples:

```
memcpy $c000-$cfff screendump.bin
memcpy screendump.bin $4000
```

The device follows the [current device](dos.md#current-device) (`#8`/`#9`/`#s`/`#h`/`#t`/`#f`), or you can target a specific device for just this one command by prefixing the filename with `#<device letter>:`, without switching your current device:

```
memcpy $1000-$2000 #t:backup.bin
```

`memcpy` is not available on the `c` (CSDB) or `n` (network drive) virtual devices — there is nothing on the server side for a raw memory range to be copied to or from there. Use `cp` (see [File Operations](file-operations.md)) to move whole files between those and the Ultimate filesystem instead.

## Reading Memory from the AI Assistant

The [AI assistant](ai-assistance.md) can also read, analyze, and modify C64 memory remotely over the network (including reading your screen), and the server web UI includes a memory inspector — see [Server Integration](cloud-integration.md).
