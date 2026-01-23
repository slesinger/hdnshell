# TODO

```
Create Ultimage cfg file
Verify installation steps
How to set cloud IP address in HDN Shell???
ngrok for testing cloud server from internet????
```

# HDN Shell - BASIC ROM Replacement for Commodore 64

_You want to pronounce HDN Shell as "Hondani Shell"_.

This project replaces the standard Commodore 64 BASIC ROM ($A000-$BFFF) with modern command line sporting new features. When the C64 is switched on, this ROM gets executed instead of the built-in BASIC interpreter. The HDN Shell provides modern command line capabilities inspired by Linux shell commands, enhancing productivity on the C64.

## Benefits for C64 Users
 
 - Simplifies frequently used commands (instead of `LOAD "*",8,1` you can just type `LS` or `DIR`),
 - Speeds up file management tasks (switching drives `#9`, copying `cp from to`, ...),
 - Use SD2IEC like device #14 (with Ultimate), including directories,
 - Command line inspired by Linux,
 - Command history,
 - Screen scrollback capability\*,
 - Integrated monitor for memory inspection,
 - Connects to HDN Cloud for extended functionality\*\*,
 - Fully open source, including cloud server code,
 - HDN Cloud can be run on your PC for fully transparent privacy,
 - or use free public HDN Cloud server for easier setup,
 - Searchable manual pages\*\*,
 - AI chat\*\*,  
 - Execute python expressions\*\*,
 - All the above by keeping all the memory free for your programs.

\* Requires at least REU  
\*\* Requires C64 Ultimate or 1541 Ultimate cartridge with networking capabilities

## Motivation
 
 - C64 is a great hardware C64 Ultimate makes it even better,
 - These days, C64 can be used as a serious computer for \<insert your favorite reason\>,
 - Command line is powerful, that is a fact, HDN Shell brings power of command line to C64,
 - Focus on productivity, not on nostalgia,
 - HDN Shell replaces BASIC ROM and hence all C64 memory remains free for your usage,
 - BASIC is mostly only used for loading programs, hence you will not miss it much,
 - Who wants to program in BASIC can plug in a cartridge with BASIC,
 - Mankind got impatient, HDN Shell uses fast methods for injecting programs into memory,
 - Use cloud services with C64, network like a modern computer.
 - See all the features HDN Shell brings to your C64.

 ## Future Features

 - Have multiple command line sessions (virtual consoles) and switch between them like in Linux (C=+1, C=+2, ...),
 - Allow for copy/paste on the screen, (maybe between cloud and C64 also?), 
 - Write your own program in the cloud and use it on the C64,
 - prglets support - relocatable small residential programs
 - SID/MOD background music playback,
 - Provide a simple file editor (like [speedscript](https://github.com/gillham/speedscript)),
 - Replace Ultimate web app by more integrated and powerful cloud solution,

## How do I Install it?

The sweet spot is to use C64 Ultimate or 1541 Ultimate cartridge with networking capabilities. However, if you do no have one there are other options. See below.

In a nutshell, for full functionality you need to:

1. Set BASIC ROM in the Ultimate menu.
2. Enable REU (recommended size 16MB) in the Ultimate menu.
3. Connect your Ultimate to the network (Ethernet or WiFi).

### Using C64 Ultimate or 1541 Ultimate

#### BASIC ROM Replacement

1. Download the latest `hdnsh.bin` from the [Releases](https://github.com/slesinger/hdnshell/releases) page. Then place it into the `roms` folder in Ultimate `flash` partition. Next, in the Ultimate menu, go to `Settings` -> `Memory & ROMs` and set the `BASIC ROM` to `hdnsh.bin`.

2. Enable REU (recommended size 16MB) in the Ultimate menu under `Settings` -> `Memory & ROMs` -> `RAM Expansion Unit` set to Enabled and set `Size` to 16MB.

3. Enable `Command Interace` in the same menu to give C64 access to Ultimate features like filesystem and networking.

4. Enter `Network Services & Timezone` menu and enable `Ultimate DMA Service` (for fast transfers from cloud). Do not forget to configure your network settings (Ethernet or WiFi) as needed.

5. Save the settings and reboot your C64.

### Alternative Options (without C64 Ultimate)

You can benefit from using a general RAM expansion unit (REU). Without Ultimate there is no alternative networking interface support as of now, so cloud features will not be available. Support the new Commodore by getting the C64U now 🙂 and continue the setup as described above.

### How do I Verify it Works?

After switching on your C64, you should see a command prompt like this:

```
    **** COMMODORE 64 SHELL V1 ****

 16M REU ULTIMATE-II DOS V1.2, HONDANI
```

If first line is displayed like this, the BASIC ROM has been enabled correctly.

The second line depends on your hardware configuration. If `Command Interace` has been enabled correctly, you should see `ULTIMATE-II DOS V1.2` part.

You can use `info` command to display more detailed information about your setup. The `@` command shows the status of the last operation, like connecting to cloud server.

## User Manual

You can type ```HELP``` in the command line to get a list of available commands. You can also get help on particular topic with ```HELP <command>``` or ```HELP <whatever is difficult for you>```.

Or, read the [User Manual](docs/user_manual.md).

## License

This project is free to use and modify for educational and personal purposes.

## Author

[Honza](https://csdb.dk/scener/?id=2588) with support of the [Hondani](https://csdb.dk/group/?id=901) gang.

Created with KickAssembler for the Commodore 64

