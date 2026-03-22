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