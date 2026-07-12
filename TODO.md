# TODO

```

#sonnet

C=+RUN/STOP executes command %0:* which is in most cases unwanted, fat finger mistake. Unbind the key combination.
Ask me any questions before you proceed to ensure you understand the task well.



scrollback section using server as memory using C=+F5 (previous screen) and C=+F6 (next screen) - make it work. It should be possible to scrollback through the entire session history. The scrollback should be persistent across resets and power cycles. The scrollback should be stored in a file on the server. The scrollback should be searchable. The scrollback should be able to be cleared. The principle is the same like .bash_history. Create .history file on the server in .config directory.
Ask me any questions before you proceed to ensure you understand the task well.



create a new command that will work on the UCI and network drives:
mkdisk <image name>.d64 - instead of d64 there can be d81 and other supported image types. The command will create a new disk image with the given name and type.
It should accept default path (like the pwd is using GET_PATH) or accept relative and absolute path.
Use REST API of the C64 Ultimate, see reast_api_calls.md and the DMA API to create the disk image on the UCI or network drive.
Besides of mkdisk command, create `del <pattern>` command that will delete file or files on UCI drives or network drive.
Also update the user manual and the documentation to reflect this new command.
Ask me any questions before you proceed to ensure you understand the task well.



There is just one UCI drive interface on the C64 Ultimate. To make the work a bit more comfortable,  I want to have shortcuts.
#t will switch to the UCI drive (like it does already) and additionally it will change directory to /temp.
#f like #t but will change directory to /flash
#h will switch to the UCI drive and change directory to /sd/home
#u will switch to the UCI drive and change directory to /usb0
#v will switch to the UCI drive and change directory to /usb1
Ask me any questions before you proceed to ensure you understand the task well.
Before you attempt for any changed, estimate if there is enough space in the wedge and how much space will be left free.



Ask me any questions before you proceed to ensure you understand the task well.
------
QUEUE

'file'  is a new command that will print information about file. Use REAST API of DMA API.
remove csdb command. Only #c is valid.
Run prg file by typing its name.

ANNOYING
Nekdy nejde C=+RESTORE utlimate menu, musi se to vypnout, pak to nejde vypnout ani pres HDN UI




m:<dotaz> fungoval a bez jakekoliv zmenu crt nebo serveru to zacalo zatuhavat. ulozil jsem celou pamet do home/memory.d64

memcpy zatuhava


AZ UPLOADUJI crt na GIHUB
The UI also allows to easily enable/dasable the ROM/cartridge. The UI button Download&Update must work with the crt and cfg in the cart filder. Adjust the procedure.
Ask me any questions before you proceed to ensure you understand the task well.


Je to hotove? use FAISS for in memory similarity search, pickle embeddings to disk
tutorial pres input keys
tut1 prchazt disk, mount disk, run game
tut2 jak na help
tut3 ask me anything
tut4 jak najit demo
tut5 complete migrate to C64
cp, mv v ramci ultimate fs
csdb - mount disk, run prg
```


## PRGlets Operations

PRGlets are small programs that are loaded into memory and executed on demand. The code has to be relocatable and conform to PRGlet calling conventions. They can compile on cloud on demand from high-level language (e.g. C) or assembly.
PRGlets can be used in HTML pages with Hondani browser.
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
