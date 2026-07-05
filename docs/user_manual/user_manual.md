# HDN Shell RR User Manual

HDN Shell RR turns a Retro Replay cartridge on your C64 Ultimate into an AI-enabled, network-connected shell that lives *alongside* BASIC. You keep typing at the familiar `READY.` prompt: recognized shell commands (`ll`, `cd`, `mnt`, `status`, `#<device>`, …) run instantly in the cartridge, and anything BASIC doesn't understand is forwarded to the **HDN Server** — a companion app running on your own PC or Mac — which answers with AI chat, manual search, CSDB scene access, virtual console apps, and an AI coding agent that can see the screen, press keys, and inject compiled programs into the real machine.

Two design principles follow from this:

- **BASIC stays.** Nothing is removed from your C64. The shell is a cartridge wedge, and it steps completely out of the way the moment you load or run a program.
- **Your machine, your server.** The HDN Server runs locally on your own computer. There is no hosted service and no account; LLM access is whatever endpoint you configure yourself.

> An earlier version of HDN Shell replaced the BASIC ROM entirely. That approach is now outdated and kept only as a [legacy alternative installation](installation_alternative.md).

For machine language work, the Retro Replay cartridge brings its own excellent freezer and machine code monitor (type `MON` or press `F8`), and HDN Shell RR adds [`memcpy`](memory-operations.md) for saving and restoring arbitrary memory ranges to files.

---
## Getting Help

As it is quite important to see if your C64U has connection to the HDN Server, you can use the `status` command to see the network state of your system. Depending on the connection state, you will get different help screens when you type `help`.

You can get various types of help:
- `help` will display how to connect to the HDN Server and what to do if you have no connection.
- `help` with connection already established will show how to get more help.
- `help <your question>` will show detailed help on a specific topic.
- `help topics` will show you a list of available help topics.
- AI assistance is a knowledge agent to help you in given situations, see [AI Assistance](ai-assistance.md) chapter for more details.
- The source code is available at <https://github.com/slesinger/hdnshell>. If you need more help than the manual or built-in help can provide, read the code.

> Since HDN Shell RR is in development, the help system may contain outdated information.
