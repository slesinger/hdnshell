# TODO

```
dat dokumentaci jako AI help
dat html napovedu do UI (ne jen link na github)
screen roll - taky s D800
instalace serveru linux/win/macos
Create Ultimage cfg file
nastavovani ip serveru
tutorial pres input keys
tut1 prchazt disk, mount disk, run game
tut2 jak na help
tut3 ask me anything
tut4 jak najit demo
tut5 complete migrate to C64
cp, mv v ramci ultimate fs
csdb - mount disk, run prg
integration disablable BASIC ROM
integration disablable fastloader
#s works for SD card only, what if someone is using USB1|2?
# TODO add `help topics` command to print out available topics
#t se zatim chova jako sd karta
#h se zatim chova jako sd karta
Je toto validni jen pro IEC? - `cd:←` — Go up one level (like `cd ..`)
funguje unmount?
pridat odkaz na dokumentaci do UI
fetchovat a ukazovat posledni release verzi v UI
```

Clip board works by pressing C=+C which will freeze the screen and let you select text with SHIFT+cursor and commiting with RETURN. Paste works by pressing C=+V which will paste from clip board to current cursor position.

Screen buffer switching is possible by pressing C=+[1,2,3,4] to switch to one of 4 screen buffers. This is useful for having multiple screens loaded in memory and switching between them quickly.

## Memory Operations

```stash <from> <to> <name>``` - store memory block to REU
```fetch <name> <to>``` - retrieve memory block from REU
```drop <name>``` - delete memory block from REU
```stash list``` - list stored memory blocks in REU

## PRGlets Operations

PRGlets are small programs that are loaded into memory and executed on demand. The code has to be relocatable and conform to PRGlet calling conventions. They can compile on cloud on demand from high-level language (e.g. C) or assembly.

There can always be only one PRGlet loaded at a time. It can receive data from stdin and return data to stdout which is always a dedicated buffer in memory (C64 RAM is swapped out to REU to free space for stdin/out data and then swapped back to C64 RAM). You can imagine PRGlet as always available, like being on a PATH in Linux.

```prglet load "<filename>"``` - load PRGlet from disk
```prglet run <name> [args...]``` - run loaded PRGlet with optional arguments
```prglet list``` - list loaded PRGlets
```prglet unload <name>``` - unload PRGlet from memory

## Residential Programs

Residential programs are tiny programs loaded into memory and remain there for quick access. They can be used to extend the functionality of the system or provide commonly used utilities. Multiple residential programs can be loaded simultaneously. Residential can handle exution from an interrupt on every frame.

```resident load "<filename>"``` - load a program to stay resident in memory
```resident list``` - list resident programs
```resident unload <name>``` - unload resident program from memory

## SMON Commands

### A xxxx — Assemble

Assemble code starting at `xxxx`. It is possible to use markers (a simple form of symbolic labels) in the form `Mxx`. A single `X` ends the assembly.

### C xxxx yyyy zzzz aaaa bbbb — Convert Program

The memory block from `xxxx` to `yyyy` is moved to `zzzz`. All absolute addresses in the code between `aaaa` and `bbbb` that pointed into the moved range are adjusted.

### D xxxx (yyyy) — Disassemble

Disassemble the program starting at `xxxx` (and ending at `yyyy`). Changes to the code are possible by overwriting the opcodes.

### F aa bb cc ..., xxxx yyyy — Find Bytes

Find all occurrences of the byte sequence `aa bb cc ...` in the memory range `xxxx` to `yyyy`.  
It is possible to specify some nybbles of the search pattern as don't-care by using the wild card `*`.

> **Note:** Unlike most other SMON-commands, the Find commands are very picky about syntax. There must be no space between the command name and the arguments to be found (exception: the Find Byte command requires exactly one space), and a comma before the range.

#### FAaaaa, xxxx yyyy — Find Absolute Address

Find all references to the absolute address `aaaa` within the memory range `xxxx` to `yyyy`.  
Note that there is no space between `FA` and `aaaa`.

#### FRaaaa, xxxx yyyy — Find Relative

Find branch statements that point to address `aaaa` within the memory range `xxxx` to `yyyy`.  
Note that there is no space between `FR` and `aaaa`.

#### FTxxxx yyyy — Find Table

Find all tables in the memory range from `xxxx` to `yyyy`. SMON defines a table as any information that cannot be disassembled.

#### FZaa, xxxx yyyy — Find Zero-Page

Find all references to the zero-page address `aa` within the memory range `xxxx` to `yyyy`.  
Note that there is no space between `FZ` and `aa`.

#### FIaa, xxxx yyyy — Find Immediate

Find all statements in the memory range from `xxxx` to `yyyy` that use `aa` as immediate operand.  
Note that there is no space between `FI` and `aa`.

### G (xxxx) — Go

Execute the machine program at `xxxx` or the current PC. If the code ends with `RTS`, SMON is terminated. To jump back to SMON after the code is executed, the program must end with `BRK`.

### L "filename" (xxxx) — Load

Load a file from the standard I/O device (see command I) at the standard address or `xxxx`.

### M xxxx (yyyy) — Memory Dump

Display the memory contents from `xxxx` to `yyyy` as hex-values and ASCII-characters. Changes are possible by overwriting the hex-values.

### O xxxx yyyy zz — Occupy

Fill the memory range `xxxx` to `yyyy` with the value `zz`.

### P xxxx yyyy aaaa ... — Copy Bytes

Copy the bytes from the memory range `xxxx` to `yyyy` to a new location starting at `aaaa`.

### R — Register

Display the contents of the CPU registers. Changes are possible by overwriting the values.

### S ("filename" xxxx yyyy) — Save

Save the memory contents from `xxxx` to `yyyy` to a file. If the file has been loaded using the command L then the parameters for save are optional.

### V xxxx yyyy zzzz aaaa bbbb — Move Addresses

All absolute addresses in the code between `aaaa` and `bbbb` that pointed into the range `xxxx` to `yyyy` are adjusted to point into the range starting at `zzzz`.

### W xxxx yyyy zzzz — Write

Copy the memory contents between `xxxx` and `yyyy` to `zzzz`. No address or other transformations are performed. Works correctly even if source and destination range overlap.

### = xxxx yyyy — Check Equality

The memory ranges starting at `xxxx` and `yyyy` are compared for equality. The address of the first different byte is displayed.


## Disk Monitor Commands

### Z — Start Disk Monitor (Equivalent Command: H)

SMON features a built-in disk monitor for floppy disk #8. To avoid confusion in terms of command names, the disk monitor must be explicitly started and terminated. While SMON is in disk monitor mode, only the following commands are available.

> **Note:** It is not possible to examine a device other than a floppy disk (i.e. not a folder of a Mac hard disk or a tape) mounted on drive #8.

- **R (tt ss) — Read Sector**  
	Read track `tt` sector `ss` into memory. If `tt` and `ss` are missing, the next logical (not physical!) sector is read.

- **W (tt ss) — Write Sector**  
	Write track `tt` sector `ss` to disk. If `tt` and `ss` are missing, the parameters from the last Read Sector command are used.

- **M — Memory Dump**  
	Display the disk sector in memory on the screen. The Shift-keys can be used to interrupt/continue the display of data.

- **@ — Floppy Error Status**  
	Displays the current Floppy Error Message. If no error occurred, then no message is printed (i.e. the message `00, OK,00,00` is suppressed).

- **X — Exit the Disk-Monitor / Return to SMON proper.**


