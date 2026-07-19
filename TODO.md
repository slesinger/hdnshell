# TODO

```
Ask me any questions before you proceed to ensure you understand the task well.
```

```
Copy PRG file between D64 and UCI


Debug amica.prg DMA loading


HDN Server web browser can navigate to pages if you know the URL of the page. But it is not possible to use google search to find things. Recommend how to implement a simplified page (such that can be displayed in the HDN server browser text mode) where user can simply search and get results like if it is simplified google search. There should be a good search engine behind this. Either to proxy google.com search more so it actually works, or to use search API such as Tavily.


------
QUEUE






Kdyz nekdo nema sd, tak by se home melo brat v usb0/home








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
