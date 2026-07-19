# TODO

```
Ask me any questions before you proceed to ensure you understand the task well.
```

```



The server (cloud directory) has an LLM agent that has a tool that can send key strokes to the C64. There is also tool to read the memory $0400-$07f8 and hence it can see what is on the screen. It makes the agent fully capable of controlling the c64, actually doing stuff. I can ask "list directory for me" and it should be able to do it. For some reason this tool is not being called. Investigate the description of the tool and the prompt around. In addition, suggest how to make the harness around this agent to get all capabilities of working with the C64 ultimate complete. There is documentation rest_api_calls that describes what is possible to control over API. Suggest improvments to existing tools and also you can suggest new tools and agent improvements. The goal is to have a fully capable agent that can control the C64 and do anything that a human can do on it, including reading the screen, sending keystrokes, and interacting with the file system.
Generate ideas of improvements, go wild, I will tell you what is good idea and what is not worth doing.
Ask me any questions before you proceed to ensure you understand the task well.
Use cheaper subagent when possible to save tokens.




I need to copy file from #n network drive to UCI and vice versa.
I tried this
#n
cd greet
ll
(there is a file called greet.prg)
cp greet.prg h:
cp greet.prg h:/sd/home/greet.prg
But none of these works now.
While doing this, also make support for mv.
If doing support for these is too complex or risky for wedge, it is ok to have it server supported only.
It should also be able to copy/move files from/to UCI drives and between UCI and network drives.




The command `cd` without parameter should bring to original directory for given drive
#h -> /sd/home
#f -> /flash
#t -> /temp
Also, I have noticed that UCI commands are different to those serving IEC. Hence let's make a change that UCI drive will be active by default and positioned at `/` root directory. That means that after fresh start I will be able to list IEC by `$` or `@9` changing to different drive and then `$`. But also I wil be able to do `ll` immediately after start. Hence the message `not supported on iec` will not be needed any more. I hope this will simplyfy thing withint the wedge RR cvartridge.



Whenever the server app outputs back tick (`) it is converted to $00 but it has to be converted to screencode $27.





------
QUEUE





HDN Server web browser can navigate to pages if you know the URL of the page. But it is not possible to use google search to find things. Recommend how to implement a simplified page (such that can be displayed in the HDN server browser text mode) where user can simply search and get results like if it is simplified google search. There should be a good search engine behind this. Either to proxy google.com search more so it actually works, or to use search API such as Tavily.






amica.prg

jak kopirovat prg z a do d64




DODELAT POPIS
F3 lists current IEC device, while ll lists UCI device indepenedently.



There is user experience issue. The users has to wait an extra second after some commands are executed. The scenario is: user types command, command is executed, user sees full output, user can only see READY prompt after a second.
Quick commands where the wait time is not observed:
- ll (after non-empty directory listing)
- cd
- pwd
- status
Slow commands where the wait time is observed:
- ll (after empty directory listing)
- tutorials
- i:hi
- m:dir
- unknown command that is to server will respond with ?ERROR immediately









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
