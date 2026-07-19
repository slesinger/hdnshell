# Server Apps

HDN Shell RR includes six server-side console applications that run on your PC and render their output directly to the Commodore 64 screen via the DMA service. Each app occupies its own virtual console and is instantly accessible using the **C= (Commodore) key together with CTRL** and a number key.

The server renders a full 40×25 screen-code buffer which is transferred to the C64 over the network. From the C64's point of view each app behaves like a real console — keyboard input is sent to the server and the updated screen arrives back within milliseconds.

> **Requires:** HDN Server running on your PC and an Ultimate/1541 Ultimate cartridge with network access. See [Server Integration](cloud-integration.md) for setup details.

---

## Console Switching

Press **C=+CTRL** together with a digit to switch consoles at any time:

| Shortcut | Console | Description |
|----------|---------|-------------|
| `C=+CTRL+1` | Local shell | Return to the BASIC prompt with the HDN Shell — your screen is restored exactly as you left it. |
| `C=+CTRL+2` | [File Editor](server-file-editor.md) | A full-featured text editor that runs entirely on the server and streams its 40×25 display to the C64. Supports multiple open files (tabs), find & replace, block cut/copy/paste, split-pane view, a file browser, and an embedded shell console. |
| `C=+CTRL+3` | [Coding Agent](coding-agent.md) | A conversational AI coding assistant powered by a large language model. Describe what you want to build in plain language; the agent writes the C source code, compiles it with the oscar64 compiler, and uploads the resulting `.prg` directly to your C64 Ultimate to run — all without leaving the C64. |
| `C=+CTRL+4` | [Web Browser](web-browser.md) | A text-mode web browser that uses a headless Chromium browser (Playwright) on the server side to fetch and fully render pages — including JavaScript — then converts the result to PETSCII screen codes for the 40×25 display. The address bar doubles as a [web search](web-browser.md#web-search) box (Google results via SerpAPI) when you type a phrase instead of a URL. Supports multiple tabs, bookmarks, history, and link navigation. |
| `C=+CTRL+5` | [Telegram Chat](telegram-chat.md) | A Telegram client that connects to the Telegram network using the MTProto protocol (Telethon library). Browse your chat list, read messages, compose and send replies, and manage contacts — all from the C64 keyboard. |
| `C=+CTRL+6` | [RSS Reader](rss-reader.md) | An RSS/Atom feed reader that fetches, parses, and displays news articles in a clean 40-column layout. Comes pre-loaded with Hacker News, BBC News, and CSDb Releases feeds. You can add, remove, and enable/disable feeds from the built-in feed directory. |
| `C=+CTRL+7` | [Wikipedia Browser](wikipedia-browser.md) | A dedicated Wikipedia reader that strips pages down to essential text and links for the 40×25 PETSCII display. Supports multi-language search, link navigation, page history, and a table of contents overlay (Ctrl+T) for quick section jumping. |

Switching is instantaneous. The server keeps each console's state alive so you can freely jump between them and return to exactly where you left off. When you switch away from the shell, the server saves your C64 screen and restores it when you come back with `C=+CTRL+1`.

The same `C=+CTRL` chord also drives **scrollback**: `C=+CTRL+F5`/`F7` page back and forth through the local shell's screen history. See [Scrollback](using-the-shell.md#scrollback-screen-history).

## Good to Know

- The switching keys aren't live until you type `HONDANI` at the `READY.` prompt to arm them.
- While a server console is open, BASIC is paused (including the `TI$` clock) until you return to the shell.
- The switching keys go inactive right after a `LOAD` or `RUN` — the shell deliberately steps out of the way of running programs. Type `HONDANI` again to re-arm them. See [Game and Program Compatibility](using-the-shell.md#game-and-program-compatibility).
- **Known limitation:** if you launch a program with the `F1` fastload-and-autorun macro while the switching keys are armed, the screen can garble while loading. Use `LOAD"*",8,1`+`RUN` instead of `F1` when armed — see [Executing Programs](executing_programs.md#the-shell-steps-aside).
- If the server is unreachable, entering a console is refused and you stay at the local prompt.
