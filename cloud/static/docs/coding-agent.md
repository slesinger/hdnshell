# Coding Agent (Console 3)

The Coding Agent is an AI-powered coding assistant that runs as a server-side console (Console 3). Press **`C=+3`** to switch to it at any time.

You chat with the agent in plain language. The agent writes complete C source files using the oscar64 C compiler toolchain, compiles the project, and uploads the resulting `.prg` to your C64 Ultimate cartridge — all automatically. You observe the result on the real hardware and give feedback in the chat.

> **Requires:** An LLM API key configured in the server settings. See [Cloud Integration](cloud-integration.md).

---

## Layout

```
 Row  0 │ [CODING AGENT]  project: myproject        │  ← status bar
 Row  1 │ > hello, write a sprite demo               │  ← chat area
   ...  │   agent: sure! writing sprite.c ...        │     (22 rows)
 Row 22 │   action: compiled ok  12 errors fixed     │
 Row 23 │ ─────────────────────────────────────────  │  ← separator
 Row 24 │ > _                                        │  ← input line
```

| Area | Rows | Description |
|------|------|-------------|
| Status bar | 0 | Current project directory and agent state |
| Chat area | 1–22 | Scrollable conversation history |
| Separator | 23 | Horizontal rule |
| Input | 24 | Text input — type your message and press `RETURN` |

**Colour coding in chat:**
- Light blue — your messages
- Light green — agent replies
- Yellow — agent actions (file written, compiled, etc.)
- Cyan — system messages
- Red — errors

---

## Workflow

1. Press **`C=+3`** to open the Coding Agent.
2. Press **`F3`** to browse the workspace and select a project directory.
3. Type what you want to create or change and press **`RETURN`**.
4. The agent writes code, calls the compiler, iterates on errors, and runs the program on your C64.
5. Give feedback in the chat to refine the result.

---

## Keyboard Reference

| Key | Action |
|-----|--------|
| Type + `RETURN` | Send message to agent |
| `↑` / `↓` | Scroll chat up / down one line |
| `C=+<` / `C=+>` | Page up / page down through chat |
| `HOME` | Scroll chat to top |
| `SHIFT+HOME` | Scroll chat to bottom (most recent) |
| `F3` | Open file browser to select project directory |
| `F8` | Toggle help screen |
| `RUN/STOP` | Close help / cancel browser |

---

## Slash Commands

Type these commands at the input prompt and press `RETURN`:

| Command | Description |
|---------|-------------|
| `/clear` | Clear the chat history |
| `/files` | List all source files in the current project directory |
| `/compile [file]` | Compile the project (optionally specify the main `.c` file) |
| `/run` | Upload the last compiled `.prg` to the C64 Ultimate and run it |
| `/project` | Show the current working project directory |
| `/help` | Show the in-app help screen |

---

## File Browser

Press `F3` to open the workspace file browser. Navigate with cursor keys, press `RETURN` to enter a directory, and press `F5` to select the current directory as the active project. Press `RUN/STOP` to cancel.

The selected project directory is shown in the status bar. All agent file operations (write, read, compile) are relative to this directory.
