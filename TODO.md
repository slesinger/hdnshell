# TODO

```
FEEDBACK



pysic syntax is what ever starts with ? will get executed in python on the server but ? is a BASIC equivalent of PRINT. Let's change the ? prefix to : prefix. Update the wedge, the server and the documentation.
Introduce pysic understanding of the following commands:
:print(ram[0400:0800]) - print memory from 0x0400 to 0x0800. Print is the python command, ram will be a lazy loaded memory view of the C64 RAM. The wedge will send the command to the server which will execute it and return the result to the wedge which will print it on the C64 screen.
The ram command will be also used to store values to memory. For example :ram[0400:0800] = [0,1,2,3,4,5,6,7] will store the values 0 to 7 in memory from 0x0400 to 0x0800. The wedge will send the command to the server which will execute it and return the result to the wedge which will print it on the C64 screen. Suggest improvements so that the syntax is nice and pythonic.
As example, this will set border to white color:
:ram[0xd020] = 1
Ask me any questions before you proceed to ensure you understand the task well.



----
READY

opus
Discontinue ROM v1 located in folder src and move it to src-discontinued. Look for the UI, it contains an easy install option where ROM is downloaded to /flash/roms in the C64U. Change the procedure to download like that, just place it /flash/carts. Ensure the new name of the cartridge will be hdn-rr38p-tmp12reu.crt. That is in the build.sh, in documentation, in all related places. The UI also allows to easily enable/dasable the ROM/cartridge. Adjust the procedure.
Update Makefile where the build-basic is no longer useful. Insted replace it by build-crt to do wedge/build.sh. Are there any other related changes needed in the Makefile? Also look to the release.ps1 which is similar but is used for windows build.
Ask me any questions before you proceed to ensure you understand the task well.


fable
Review the coding agent harness. Improve it to provide high performance coding capabilities focused on C development for the C64 Ultimate. Review existing prompts, skills, tools, available documentation within this project, includeing the TUIkit library. The development is strictly focused on the C64 Ultimate. Enable most useful documentation sources from public sources and locally.
It should be able to use git cli command provided that it is installed in the server system.
Ask me any questions before you proceed to ensure you understand the task well.


Sonnet
When dragging a file onto the UI Filemanager page, there is an area labeled  Drag and drop files here to upload. Make the area more visible. Make an animated background to attract the user to drop the file there.
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
