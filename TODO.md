# TODO

```
----
TESTUJ v KLIDU

Review the coding agent harness. Improve it to provide high performance coding capabilities focused on C development for the C64 Ultimate. Review existing prompts, skills, tools, available documentation within this project, includeing the TUIkit library. The development is strictly focused on the C64 Ultimate. Enable most useful documentation sources from public sources and locally.
It should be able to use git cli command provided that it is installed in the server system.
Generate coding tutorials for C64 Ultimate development. The tutorials should be interactive and provide step by step instructions. The tutorials should be able to use the coding agent to provide hints and guidance. The tutorials should be able to use the coding agent to provide code snippets and examples. The tutorials should be able to use the coding agent to provide code reviews and feedback. Make example projects in the workspace oscar directory. Also expand on the docs/user_manual coding tutorials.
Suggest 3 coding tutorial videos with scripts and assets. I will then follow it and record it.
Ask me any questions before you proceed to ensure you understand the task well.


----
FEEDBACK

#fable
HDN Shell wedge System hangs in scenario: #h -> pwd -> F1 (to load giana sisters from mounted drive 8)
System works scenario: #h -> F1 (to load giana sisters from mounted drive 8) - intro shows, I can play game
Po resetu, #h -> "cd sd" nebo "cd /" dojde k divnemu zakousnuti (prepnuti fontu, protoze pismenka se zmeni v horizontalni cary) a skoku do freeze menu RR cartidge. Totez se deje po resetu i:hi -> zatuhne stejne.
Stejne zatuhnuti se stani i po resetu a prikazu "TASM".
These are maybe two different problems, but maybe related. Understand the history from wedge/wedge-analysis.md. I am affraid that these problems are related to quite recent changes. Do a deep analysis. It is critical to resolve these issues as they are critical success factors for the whole HDN Shell product.
Again, not sure if it is related but when I switch C=+CTRL+3 to coding agent and then C=+CTRL+2 to IDE server app, mostly it hangs. I can see an exclamation mark on the screen like if data are written to wrong address and the screen is by coincidence one such address. There is something very fishy in the modified Retro Replay cartridge and I am hoping that it has some common denominator that resolving one will improve others, too.
Make sure that the HDN shell operation as as much hidden and transparent as possible. It should enable bank5 only when needed and then it should be disabled again. From outside it, memory-vise, it should be as if the HDN shell is not there at all. The user should not be able to see any difference compared to Retro Replay. See the Retro Replay documentation https://wiki.icomp.de/wiki/Retro_Replay .
Ask me any questions before you proceed to ensure you understand the task well.


HDN UI Docs - make it searchable. Suggest solutions. Prefered is browser-side search.
Ask me any questions before you proceed to ensure you understand the task well.


Review the HDN UI Dcocs in docs/user_manual folder and mostly look for redundant information and structure of the documentation. It seems info is repeating and the structure is a bit confusing. Some pages are too long, some information is not at the right home and better should be moved. Check for links, some might be broken.
Ask me any questions before you proceed to ensure you understand the task well.


----
READY

#sonnet
In the wedge, create a new command that will work on the UCI and network drives:
mkdisk <image name>.d64 - instead of d64 there can be d81 and other supported image types. The command will create a new disk image with the given name and type.
Also update the user manual and the documentation to reflect this new command.
Ask me any questions before you proceed to ensure you understand the task well.




Integrate link to Retro Replay documentation in the HDN UI. The link should be visible and easy to find. The link should open in a new tab or window. The link should be labeled "Retro Replay Manual". The link should point to https://rr.c64.org/wiki/CyberpunX_Replay_Manual . Ask me any questions before you proceed to ensure you understand the task well.
Specifically mention in some section about key shortcuts also the Retro Replay F-keys:
F1 LOAD the first file on the disk to it's absolute address. (LOAD "0:*",8,1)
F2 LOAD the first file on the disk to the Basic program area. (LOAD "0:*",8)
F3 Display disk directory without corrupting memory
F4 Toggle available drives.
F5 LIST
F6 Freeze Menu
F7 RUN
F8 MON See here
Ask me any questions before you proceed to ensure you understand the task well.


scrollback section using server as memory using C=+F5 (previous screen) and C=+F6 (next screen) - make it work. It should be possible to scrollback through the entire session history. The scrollback should be persistent across resets and power cycles. The scrollback should be stored in a file on the server. The scrollback should be searchable. The scrollback should be able to be cleared. The principle is the same like .bash_history
Ask me any questions before you proceed to ensure you understand the task well.


C=+RUN/STOP executes command %0:* which is in most cases unwanted, fat finger mistake. Unbind the key combination.
Ask me any questions before you proceed to ensure you understand the task well.


#h works for SD card only, Introduce #u and #v devices that will be mapped to USB0 respectively USB1
Ask me any questions before you proceed to ensure you understand the task well.



Ask me any questions before you proceed to ensure you understand the task well.
------
QUEUE


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
