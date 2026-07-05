# TODO

```
FEEDBACK






----
READY


fable - night
Review the coding agent harness. Improve it to provide high performance coding capabilities focused on C development for the C64 Ultimate. Review existing prompts, skills, tools, available documentation within this project, includeing the TUIkit library. The development is strictly focused on the C64 Ultimate. Enable most useful documentation sources from public sources and locally.
It should be able to use git cli command provided that it is installed in the server system.
Generate coding tutorials for C64 Ultimate development. The tutorials should be interactive and provide step by step instructions. The tutorials should be able to use the coding agent to provide hints and guidance. The tutorials should be able to use the coding agent to provide code snippets and examples. The tutorials should be able to use the coding agent to provide code reviews and feedback. Make example projects in the workspace oscar directory. Also expand on the docs/user_manual coding tutorials.
Suggest 3 coding tutorial videos with scripts and assets. I will then follow it and record it.
Ask me any questions before you proceed to ensure you understand the task well.



#opus
The old BASIC ROM replacement (in the src folder) is having a good bootscreen finger print. It is using the lowercase font (please switch in the HDN RR impleemntation also to the lower case font). The old bootscreen looked like this:
```
    **** COMMODORE 64 SHELL V1 ****
 16M REU ultimate-ii dos v1.2, Hondani

READY.
```
I want this boot screen to be presented in the new HDN RR implementation. The new bootscreen should look like this:
```
	**** COMMODORE 64 SHELL V2 ****
 16M REU ultimate-ii dos v1.2, HDN/CPX
```
and then the READY. prompt.
Ask me any questions before you proceed to ensure you understand the task well.



#sonnet
Create a tool for the C64 server coding agent that will be able to peek C64 Ultimate memory with API like this: http://192.168.1.65/v1/machine:readmem?address=1000&length=16  (1000 is an example of 0x1000 address in hex, length is in bytes).
Check if the tools does not exist yet. I tested and it looks the tool is not there or it does not work.
Ask me any questions before you proceed to ensure you understand the task well.




#sonnet
In the wedge, create a new command that will work on the UCI and network drives:
mkdisk <image name>.d64 - instead of d64 there can be d81 and other supported image types. The command will create a new disk image with the given name and type.
Also update the user manual and the documentation to reflect this new command.
Ask me any questions before you proceed to ensure you understand the task well.




Ask me any questions before you proceed to ensure you understand the task well.
------
QUEUE


memcpy zatuhava


test deleting files


jak fubnguje ukladani home v c64u? se to vzdycky nejak resetuje


AZ UPLOADUJI crt na GIHUB
The UI also allows to easily enable/dasable the ROM/cartridge. The UI button Download&Update must work with the crt and cfg in the cart filder. Adjust the procedure.
Ask me any questions before you proceed to ensure you understand the task well.



Vymyslet ovladani: scrollback section using server as memory
Je to hotove? m: jako AI manual protoze pri i: to nepouziva vzdy ten spravny tool
Je to hotove? use FAISS for in memory similarity search, pickle embeddings to disk
tutorial pres input keys
nastavovani ip serveru
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
