<!-- MIRROR: This file is duplicated at cloud/static/docs/cloud-apps.md (served by the cloud server). Any changes here must also be applied there. -->

# Cloud Server Apps

HDN Shell includes five server-side console applications that run on your PC and render their output directly to the Commodore 64 screen via the DMA service. Each app occupies its own virtual console and is instantly accessible using the **C= (Commodore) key** combined with a number key.

The server renders a full 40×25 screen-code buffer which is transferred to the C64 over the network. From the C64's point of view each app behaves like a real console — keyboard input is sent to the server and the updated screen arrives back within milliseconds.

> **Requires:** HDN Cloud Server running on your PC and an Ultimate/1541 Ultimate cartridge with network access. See [Cloud Integration](cloud-integration.md) for setup details.

---

## Console Switching

Press the **C= (Commodore)** key together with the digit to switch consoles at any time:

| Shortcut | Console | Description |
|----------|---------|-------------|
| `C=+1`   | Local shell | Return to the HDN Shell command prompt |
| `C=+2`   | [File Editor](server-file-editor.md) | Full-featured multi-tab text editor |
| `C=+3`   | [Coding Agent](coding-agent.md) | AI coding assistant that writes, compiles & runs C64 programs |
| `C=+4`   | [Web Browser](web-browser.md) | PETSCII web browser with JavaScript rendering |
| `C=+5`   | [Telegram Chat](telegram-chat.md) | Telegram client — chat list, messages, contacts |
| `C=+6`   | [RSS Reader](rss-reader.md) | RSS/Atom feed reader with article view |
| `C=+7`   | [Wikipedia Browser](wikipedia-browser.md) | PETSCII Wikipedia reader with TOC navigation |

Switching is instantaneous. The server keeps each console's state alive so you can freely jump between them and return to exactly where you left off.

---

## Server Apps at a Glance

### File Editor — `C=+2`

A full-featured text editor that runs entirely on the server and streams its 40×25 display to the C64. Supports multiple open files (tabs), find & replace, block cut/copy/paste, split-pane view, a file browser, and an embedded shell console.

→ [Full documentation](server-file-editor.md)

---

### Coding Agent — `C=+3`

A conversational AI coding assistant powered by a large language model. Describe what you want to build in plain language; the agent writes the C source code, compiles it with the oscar64 compiler, and uploads the resulting `.prg` directly to your C64 Ultimate to run — all without leaving the C64.

→ [Full documentation](coding-agent.md)

---

### Web Browser — `C=+4`

A text-mode web browser that uses a headless Chromium browser (Playwright) on the server side to fetch and fully render pages — including JavaScript — then converts the result to PETSCII screen codes for the 40×25 display. Supports multiple tabs, bookmarks, history, and link navigation.

→ [Full documentation](web-browser.md)

---

### Telegram Chat — `C=+5`

A Telegram client that connects to the Telegram network using the MTProto protocol (Telethon library). Browse your chat list, read messages, compose and send replies, and manage contacts — all from the C64 keyboard.

→ [Full documentation](telegram-chat.md)

---

### RSS Reader — `C=+6`

An RSS/Atom feed reader that fetches, parses, and displays news articles in a clean 40-column layout. Comes pre-loaded with Hacker News, BBC News, and CSDb Releases feeds. You can add, remove, and enable/disable feeds from the built-in feed directory.

→ [Full documentation](rss-reader.md)

---

### Wikipedia Browser — `C=+7`

A dedicated Wikipedia reader that strips pages down to essential text and links for the 40×25 PETSCII display. Supports multi-language search, link navigation, page history, and a table of contents overlay (Ctrl+T) for quick section jumping.

→ [Full documentation](wikipedia-browser.md)
