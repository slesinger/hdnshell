# TODO

```
Ask me any questions before you proceed to ensure you understand the task well.
```

```
There are places where SD card is mentioned where some people if they do not have SD card and they only have USB, they would hit a wall. I can only think of /sd/home is a problem. First scan the wedge and server code and try to identify all places where SD card is mentioned and then we can discuss how to fix it. I think the wedge is the main place where this is a problem, but there might be other places too. For places confirmed I will ask you to make a logic that if /sd is not present, use /usb0 instead and if /usb0 is not present, use /flash/home. Do an analysis first.
Use Opus or Fable5 subagents should you need an advice. All changes in wedge need to be done very carefully, step by step and always hw tested.



------
QUEUE









AZ UPLOADUJI crt na GIHUB
The UI also allows to easily enable/dasable the ROM/cartridge. The UI button Download&Update must work with the crt and cfg in the cart filder. Adjust the procedure.
Server UI has Enable and Disable buttons who need to influence if HDN shell cartridge is inserted or is empty slot. Previously these buttons worked but instead of manipulating cartridge slot, it was manipulating BASIC ROM.
Ask me any questions before you proceed to ensure you understand the task well.



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
