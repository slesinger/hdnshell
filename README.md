# HDN Shell RR — AI-Enabled Shell for the Commodore 64

> _Pronounced "Hondani Shell"_

HDN Shell RR turns a Retro Replay cartridge on your C64 Ultimate into an AI-enabled, network-connected shell that lives *alongside* BASIC. You keep typing at the familiar `READY.` prompt: recognized shell commands run instantly in the cartridge, and anything BASIC doesn't understand is forwarded to the **HDN Server** — a companion app you run on your own PC or Mac — for AI chat, manual search, CSDB scene access, virtual console apps, and an AI coding agent that can see the screen, press keys, and inject compiled programs into the real machine.

> An earlier version of HDN Shell replaced the BASIC ROM entirely. That approach is now outdated and kept only as a [legacy alternative installation](docs/user_manual/installation_alternative.md).

---

## 🚀 Key Benefits for C64 Users

- **BASIC stays.** Nothing is removed from your C64; the shell wedges into a Retro Replay cartridge and steps completely out of the way the moment you load or run a program.
- **Simplified commands:** Replace `LOAD "$",8,1` with `ll` or `dir`.
- **Fast file management:** Switch drives (`#9`), mount disk images (`mnt`), copy files (`cp`), and more.
- **SD2IEC support:** Use device `#s` (with Ultimate), including directory navigation.
- **Integrated machine code monitor & freezer:** courtesy of the Retro Replay cartridge itself, plus `memcpy` for saving/restoring arbitrary memory ranges to files.
- **HDN Server integration:** connect for AI chat, CSDB browsing, a network drive, and a set of full server-side console apps (file editor, coding agent, web browser, Telegram, RSS reader, Wikipedia browser) — switch between them instantly with `C=+CTRL+<digit>`.
- **Your machine, your server:** run the HDN Server locally on your own PC or Mac — no hosted service, no account, any OpenAI-compatible LLM endpoint (including local Ollama).
- **Open source:** all code, including the server and the cartridge wedge source, is available.
- **Searchable manual pages:** find help fast, including a dedicated `m:<phrase>` manual-search prefix.
- **AI chat:** get assistance and answers right at the prompt — no prefix required, just type.
- **Python expression execution:** run Python expressions on the server with `?<expr>`.

> *Ultimate/1541 Ultimate with networking required for HDN Server features.*

---

## 💡 Motivation

- C64 hardware is legendary; Ultimate makes it even better.
- Today, C64 can be a serious computer for creative projects, learning, and fun.
- Command line = power. HDN Shell RR brings that power to your C64 — without giving up BASIC.
- Focus on productivity, not just nostalgia.
- Fast program injection from CSDB or the AI coding agent means less waiting, more doing.
- Server integration and networking make your C64 feel modern.
- Discover all the features HDN Shell RR brings to your C64!

---

## 🔮 Future Features

- Multiple command line sessions (virtual consoles) — switch like Linux
- Clipboard between the server and the C64 (`C=+C` / `C=+V`)
- Prglets: relocatable small resident programs
- Resident programs handling frame interrupts
- SID/MOD background music streaming
- A community registry of third-party server apps and command handlers

---

## 🛠️ Installation & Quick Start

See the [Installation Guide](docs/user_manual/installation.md) for step-by-step instructions to set up the HDN Server on your PC and attach the HDN Shell RR cartridge to your C64 Ultimate.

---

## 📖 User Manual

- Type `help` at the command line for a list of available commands.
- Get help on any topic: `help <command>` or `help <your question>`.
- Search the manual directly: `m:<search phrase>`.
- Or, read the [User Manual](docs/user_manual/user_manual.md).

---

## 📝 License

This project is free to use and modify for educational and personal purposes.

---

## 👤 Author

Created by [Honza](https://csdb.dk/scener/?id=2588) with support from the [Hondani](https://csdb.dk/group/?id=901) gang.

Built with KickAssembler for the Commodore 64.

---
