# Executing Programs

The most typical user path to run a game or a demo is by [navigating](dos.md#navigating-directories) to a D64 image, [mounting](dos.md#mounting-d64-images) it and run.

## Run

`run` — Run the currently loaded program. This is the same as typing `RUN` in BASIC.

There are some limitations as HDN Shell is not a full BASIC implementation. The `run` command will scan addresses starting from $0801, looking for `SYS` command which is very usual ways for starting a machine language program from BASIC. If found, it will execute it like if you use the `g` command.

## Go (Monitor Style)

`g <address>` — Start executing machine code from the specified address.

Examples:

`g 080d`

`g $080d`

The address is assumed to be a hex address. More on using different address formats in [Memory Operations and Monitor](memory-operations.md#note-on-using-addresses) chapter.
