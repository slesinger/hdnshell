# Coding Agent (Console 3)

The Coding Agent is an AI-powered coding assistant that runs as a server-side console (Console 3). Press **`C=+CTRL+3`** to switch to it at any time.

You chat with the agent in plain language. It is specialized for **Oscar64 C/C++ projects** targeting the Commodore 64 and C64 Ultimate. In normal coding mode it can inspect files, update `.c` and `.h` files, compile the project, and upload the resulting `.prg` to your C64 Ultimate. You observe the result on the real hardware and give feedback in the chat.

The Coding Agent also has **read-only planning and exploration modes** for design work, codebase analysis, and project discovery without changing files.

> **Requires:** An LLM API key configured in the server settings. See [Cloud Integration](cloud-integration.md).

---

## Layout

```
 Row  0 │ /myproject                           4f idle │  ← status bar
 Row  1 │ > write a sprite demo                         │  ← chat area
   ...  │   Mode: code                                 │
 Row 22 │   thinking...                                │
 Row 23 │ ─────────────────────────────────────────  │  ← separator
 Row 24 │ > _                                        │  ← input line
```

| Area | Rows | Description |
|------|------|-------------|
| Status bar | 0 | Current project directory, source-file count, and idle or thinking state |
| Chat area | 1–22 | Scrollable conversation history; shrinks temporarily if the input wraps to multiple lines |
| Separator | 23 | Horizontal rule |
| Input | 24 | Text input; long messages wrap to additional rows at the bottom |

**Colour coding in chat:**
- Light blue — your messages
- Light green — agent replies
- Yellow — thinking indicator and action-style progress output
- Cyan — system messages
- Red — errors

---

## Capabilities

The Coding Agent supports three working modes:

| Mode | Purpose | File changes | Compile / Run |
|------|---------|--------------|---------------|
| `code` | Normal coding mode for implementation and fixes | Yes | Yes |
| `plan` | Produce a grounded implementation plan | No | No |
| `explore` | Search the project and answer questions from code evidence | No | No |

In all modes, the agent is tuned for Oscar64 and C64 work:

- Understands multi-file `.c` and `.h` projects.
- Uses Oscar64 documentation and symbol lookup tools instead of guessing APIs.
- Uses C64 reference documentation for hardware, memory map, KERNAL, VIC, SID, and related topics.
- Knows the project's own **TUIkit** text-UI library for building interactive apps.
- Keeps sprite image index checks aligned with Oscar64 conventions.
- Can use **git** (when installed on the server) to inspect history and commit working milestones. Network operations (push/pull/fetch) are blocked unless you explicitly ask to sync a remote.
- Supports focused skills that bias the agent toward specific workflows.

### Built-in skills

The current harness exposes these togglable skills:

| Skill | Purpose |
|------|---------|
| `assistant_memory` | Keep and use persistent notes about the project across sessions |
| `build_debug_loop` | Bias toward small compile-fix-rebuild iterations |
| `memory_layout_checks` | Focus on fixed addresses, buffers, and memory overlaps |
| `multi_file_refactor` | Focus on coordinated `.c` / `.h` edits |
| `new_project` | Guide scaffolding of a fresh Oscar64 project |
| `sprite_workflow` | Focus on Oscar64 sprite APIs, data placement, and image index arithmetic |
| `performance_c` | Bias toward high-performance C: type widths, zero page, `__native`/`__striped`, optimizer pragmas |
| `tuikit_ui` | Build interactive text UIs with the project's TUIkit library |

Skills do not create a separate mode. They add extra guidance on top of the current mode.

---

## Guided tutorials

New to C on the C64 Ultimate? The [Coding Tutorials](coding-tutorials.md) walk you
through four hands-on projects with this agent — from a first program to sprites,
an assembler raster effect, and a TUIkit UI. Each has a ready-to-build reference
project under [`oscar/projects/`](../../oscar/projects/).

---

## Workflow

1. Press **`C=+CTRL+3`** to open the Coding Agent.
2. Press **`F3`** to browse the workspace and select a project directory.
3. Optional: switch mode with `/code`, `/plan`, or `/explore`.
4. Optional: enable a skill with `/skill <name>`.
5. Type what you want to create, change, analyze, or plan and press **`RETURN`**.
6. In `code` mode the agent edits files, compiles, and can run the result on your C64.
7. In `plan` or `explore` mode the agent stays read-only and responds with analysis instead of changing project files.
8. Give feedback in the chat to refine the result or switch back to another mode.

### Recommended usage patterns

- Use **`/code`** for “implement this”, “fix this bug”, or “add this feature”.
- Use **`/plan`** before a risky or multi-file change.
- Use **`/explore`** to ask “where is this implemented?”, “what uses this symbol?”, or “how does this subsystem work?”.
- Enable **`multi_file_refactor`** before signature or header changes.
- Enable **`sprite_workflow`** before sprite-memory or `spr_set()` work.

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
| `F8` | Open the help screen |
| `RUN/STOP` | Close help or cancel the file browser |

While the agent is thinking, the input line shows **`(waiting...)`** and the last chat line shows an animated **`thinking...`** indicator.

---

## Slash Commands

Type these commands at the input prompt and press `RETURN`:

| Command | Description |
|---------|-------------|
| `/clear` | Clear the chat history |
| `/mode` | Show the current agent mode |
| `/mode <code|plan|explore>` | Change the current agent mode |
| `/code [task]` | Switch to coding mode; if a task is provided, run it immediately |
| `/plan [task]` | Switch to planning mode; if a task is provided, run it immediately in read-only mode |
| `/explore [query]` | Switch to exploration mode; if a query is provided, run it immediately in read-only mode |
| `/skills` | List available skills and show which ones are active |
| `/skill <name>` | Toggle a skill on or off |
| `/skill clear` | Disable all active skills |
| `/files` | List all source files in the current project directory |
| `/compile [file]` | Compile the project (optionally specify the main `.c` file) |
| `/run` | Upload the last compiled `.prg` to the C64 Ultimate and run it |
| `/project` | Show the current working project directory |
| `/new-project <name>` | Scaffold a fresh Oscar64 project in the workspace and select it |
| `/status` | Show the current mode, active skills, and target file or directory |
| `/help` | Show the in-app help screen |

### Command examples

- `/plan refactor the sprite loader into separate .c and .h files`
- `/explore where is DMA screen upload handled`
- `/code add joystick input to the current project`
- `/skill sprite_workflow`
- `/status`

### Command behavior notes

- `/compile` and `/run` require a selected project directory.
- `/plan` and `/explore` do not enable file writes, compile, or run tools.
- `/code` restores the write, compile, and run toolchain.
- `/mode` changes the mode only; `/code`, `/plan`, and `/explore` can also submit a task immediately.

---

## File Browser

Press `F3` to open the workspace file browser. Navigate with cursor keys, press `RETURN` to enter a directory, and press `F5` to select the current directory as the active project. Press `RUN/STOP` to cancel.

If you press `RETURN` on a file, the Coding Agent selects that file’s **parent directory** as the active project directory.

The selected project directory is shown in the status bar. All agent file operations are scoped to this directory.

### Browser shortcuts

| Key | Action |
|-----|--------|
| `RETURN` on directory | Enter directory |
| `RETURN` on file | Select the file’s parent directory as the project |
| `F5` | Select the current directory as the project |
| `RUN/STOP` | Cancel and return to chat |

---

## Status And Feedback

The Coding Agent reports state in two places:

- **Status bar:** current project path, number of `.c` and `.h` files, and `idle` or `thinking...`
- **Chat messages:** mode changes, project selection, skill activation, file lists, compile requests, run requests, and agent responses

Use `/status` when you want the precise logical state of the agent, including:

- Current mode
- Active skills
- Current target file or project directory

---

## Practical Notes

- The agent is specialized for Oscar64 C/C++ work, not generic desktop development.
- Planning and exploration modes are useful when you want analysis without risking edits.
- Skills are optional overlays; if a skill is getting in the way, toggle it off.
- The selected project directory matters. If the wrong files are being considered, reselect the directory with `F3`.
- Long requests are fine; the input area expands to multiple rows automatically.
