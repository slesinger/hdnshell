To BE INSERTED
IEC docs https://c64os.com/post/sd2iecdocumentation#realtimeclock
run
rU
g $080d
g 080d

# HDN Shell User Manual

HDN Shell is a replacement to C64 BASIC. The aim is to strip of mostly unused parts of BASIC, viewed as a DOS, and replace them with a mostly used features, viewed from modern perspective, while fitting into the same 8KB ROM space. The blueprint is Linux-like terminal user experience, AI enabled, utilizing C64 Ultimate and cloud computing services.

It also includes parts of SMON, which is one of the best (if not the best) machine language monitors for the Commodore 64. It features a wide range of functions to display and modify (including an assembler) the C64 memory. Furthermore, it permits tracing through programs in single step. There is even a small disk monitor included.

---
## Table of Contents
- [About the project](../README.md)
- [Getting Started](installation.md)
- [Using the Shell](using-the-shell.md)
- [Navigating Disk Drives and Directories](dos.md)
- [Executing Programs](executing_programs.md)
- [File Operations](file-operations.md)
- [Memory Operations, Machine Language Monitor](memory-operations.md)
- [PySIC Alternative to BASIC Programming](pysic.md)
- [Networking, Cloud Integration](cloud-integration.md)
- [AI Assistance](ai-assistance.md)
- [CSDB.dk Commodore 64 Scene Database](csdb.md)

## Getting Help

As it is quite imprtant to see if your C64U has connection to the cloud server, you can use `info` command to see detailed status of your system. Depending on the connection state, you will get different help screens when you type `help`:

Working without connection, you will get a local help screen with basic information

# TODO - add screenshots of help screens

If connection is available, you have few options.

`help` - a directory of available help topics

# TODO - add screenshots of help screens

`help <topic>` - printout of detailed help on a specific topic that is recognized by the server help system.

`help <whatever questions you have about the HDN Shell>` - will give you AI generated answer based on the user guide. It is like a search on steroids.

# TODO - add screenshots of help screens

## Help Topics

- `help` - General help
- `help chat` - Chat/AI help
- `help python` - Python eval help
- `help csdb` - CSDB query help
- `help commands` - Command list