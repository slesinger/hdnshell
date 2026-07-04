# Memory Operations and Monitor

The C64 offer memory to user to arbitrarily load into and save from. There are no useless memory protection mechanisms, no dynamic memory allocation, no virtual memory. You have 64KB of RAM, and you can do with it whatever you want. Many if the following commands are inspired be the powerful machine language monitor based on SMON. Thanks and credits go to Jim Butterfield. The general idea is to have the monitor tool integrated stright into the shell.


## Note on Using Address

All addresses are in hexadecimal format. For example, to display memory starting from address $0800, you would use the command `m 0800`.

You can still use following prefixes to specify addresses in different formats:
- `$` for hexadecimal (e.g. `$0800`)
- `+` for decimal (e.g. `@2048`) # TODO overit, jestli to funguje
- `%` for binary (e.g. `%0000100000000000`)


## Displaying Memory

`m <from address>` — Display memory contents in hexadecimal and ASCII format.

## Other Monitor Commands

`g <address>` — Start executing machine code from the specified address.

`r` — Display CPU registers (A, X, Y, PC, SP, P) and flags.

## Saving and Restoring Memory Blocks (`memcpy`)

`memcpy $start-$end filename` — Save the memory range `$start` to `$end` (inclusive) to `filename` on the current device.

`memcpy filename $start` — Load `filename` back into memory starting at `$start`. This is a **relocatable** load: any load address stored inside the file itself is ignored, so you can save a block from one address and restore it somewhere else entirely.

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