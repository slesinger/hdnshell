# HDN Shell User Manual

HDN Shell is a replacement to C64 BASIC. The aim is to strip of mostly unused parts of BASIC, viewed as a DOS, and replace them with a mostly used features, viewed from modern perspective, while fitting into the same 8KB ROM space. The blueprint is Linux-like terminal user experience, AI enabled, utilizing C64 Ultimate and cloud computing services.

It also includes parts of SMON, which is one of the best (if not the best) machine language monitors for the Commodore 64. It features a wide range of functions to display and modify (including an assembler) the C64 memory. Furthermore, it permits tracing through programs in single step. There is even a small disk monitor included.

---
## Getting Help

As it is quite important to see if your C64U has connection to the cloud server, you can use `info` command to see detailed status of your system. Depending on the connection state, you will get different help screens when you type `help`.

You can get various types of help:
- `help` will display how to connect to the cloud server and what to do if you have no connection.
- `help` with connection already established will show how to get more help.
- `help <your question>` will show detailed help on a specific topic.
- `help topics` will show you a list of available help topics.
- AI assistance is a knowledge agent to help you in given situations, see [AI Assistance](ai-assistance.md) chapter for more details.

> Since the Hondani Shell is in development, the help system may contain outdated information.
