# Server-Side File Editor (Console 2)

HDN Shell includes a full-featured text editor that runs server-side and displays on your Commodore 64's 40×25 screen. The editor is available on **Console 2** and is accessed from the shell by switching to the server console with the C64 Ultimate network interface.

The editor renders into a C64 screen-code buffer which is transferred to the C64 via the DMA service whenever the client requests a screen refresh — no BASIC or machine language editor code runs on the C64 itself.

---

## Layout

```
 Row  0 │ FILE  EDIT  VIEW  SEARCH  HELP       1/3 │  ← menu bar
 Row  1 │    1 ...text line 1...                   │  ← editing area
   ...  │    ...                                   │     (23 rows)
 Row 23 │   23 ...text line 23...                  │
 Row 24 │ *myfile.py  l42c17  512ln  edt           │  ← status bar
```

- **Menu bar** (row 0) — menus and open-file tab counter (`current/total`).
- **Editing area** (rows 1–23) — 5-character gutter with line numbers followed by 35 columns of text, optionally split into two panes.
- **Status bar** (row 24) — modified flag (`*`), filename, cursor position, total lines, current mode.

---

## Modes

The editor is always in one of the following modes displayed in the status bar:

| Status | Mode |
|--------|------|
| `edt` | Normal text editing |
| `mnu` | Menu navigation |
| `brw` | File browser |
| `fnd` | Find input |
| `rpl` | Replace input |
| `gto` | Go-to-line input |
| `tab` | Open-file list (tabs) |
| `hlp` | Help screen |
| `sh$` | Embedded console/shell |
| `?`   | Confirm dialog |

---

## Keyboard Reference

### Navigation

| Key | Action |
|-----|--------|
| Cursor keys | Move cursor one character / line |
| `CTRL` + ←/→ | Move one word left / right |
| `CTRL` + ↑/↓ | Scroll view without moving cursor |
| `HOME` | Move to start of line |
| `SHIFT` + `HOME` | Jump to top of file |
| `CLR` | Jump to end of file |

### Editing

| Key | Action |
|-----|--------|
| Printable keys | Insert character at cursor |
| `RETURN` | Insert new line |
| `DEL` | Delete character to the left (backspace) |
| `INS` | Insert a space at cursor |
| `TAB` | Insert 4 spaces |

### File Operations

| Key | Action |
|-----|--------|
| `F1` | New file (opens a new tab) |
| `F2` | Show open-file list |
| `F3` | Open file browser |
| `F5` | Save current file |
| `SHIFT` + `F5` | Save as… (prompts for path) |
| `C=` + `W` | Close current file |

### Clipboard & Block Operations

Mark a block by setting start and end anchors, then cut/copy it.

| Key | Action |
|-----|--------|
| `C=` + `B` | Set block start at cursor |
| `C=` + `E` | Set block end at cursor |
| `C=` + `A` | Select entire file |
| `C=` + `X` | Cut selection to clipboard |
| `C=` + `C` | Copy selection to clipboard |
| `C=` + `V` | Paste clipboard at cursor |
| `C=` + `Y` | Delete current line |

The selected block is highlighted in **yellow** on screen.

### Search & Replace

| Key | Action |
|-----|--------|
| `C=` + `F` | Find — enter a search pattern (regex supported) |
| `C=` + `N` | Find next occurrence |
| `C=` + `R` | Replace all — prompts for pattern then replacement text |
| `C=` + `G` | Go to line number |

Search matches are highlighted in **red** across the entire file.  Patterns follow Python regular-expression syntax (case-insensitive).

### View / Split Screen

| Key | Action |
|-----|--------|
| `C=` + `1` | Single pane (no split) |
| `C=` + `2` | Split horizontally (top/bottom) |
| `C=` + `3` | Split vertically (left/right) |

When split, the top/left pane shows the active document and the top/right or bottom pane shows a second open document.  Switch the active document with `F2`.

### Menus

| Key | Action |
|-----|--------|
| `ESC` | Open / close menu bar |
| ← / → | Move between menus |
| ↓ / ↑ | Open submenu / navigate items |
| `RETURN` | Execute highlighted menu item |
| `ESC` | Close menu, return to editing |

### Other

| Key | Action |
|-----|--------|
| `F7` | Toggle embedded console/shell |
| `F8` | Toggle help screen (key reference) |

---

## File Browser

Press **F3** (or *File → Open*) to enter the file browser.

```
 /home/user/projects
 [..]
 [src]
 [docs]
  main.py
  README.md
```

- Directories are shown in **green** surrounded by `[ ]`.
- Files are shown in **light blue**.
- `..` navigates to the parent directory.
- Press `RETURN` on a directory to enter it; on a file to open it in the editor.
- Press `ESC` to return to editing without opening a file.

---

## Open Files (Tabs)

Up to **8 files** can be open simultaneously.  Press **F2** to view the list:

```
 open files:
*1. main.py
 2. README.md
 3. config.json
```

- The active file is highlighted and prefixed with `*`.
- Use ↑/↓ to change the active file; `RETURN` or `ESC` to confirm.
- The menu bar always shows the current tab index, e.g. `2/3`.

---

## Embedded Console / Shell

Press **F7** to enter the embedded shell.  Commands are executed server-side (the machine running HDN Cloud) and their output is displayed in the editor window.

```
 console (esc=back)
 $ ls -la
 total 48
 drwxr-xr-x  4 user user 4096 Mar 12 2026 .
 ...
 $
```

- Type a command and press `RETURN` to execute.
- `DEL` deletes the last typed character.
- ↑/↓ scrolls the output history.
- Press **ESC** or **F7** to return to the editor.

This makes it easy to run `git`, `cp`, `grep`, or any other server-side tool without leaving the editor.

---

## Status Bar Reference

```
*myfile.py  l42c17  512ln  edt
```

| Field | Meaning |
|-------|---------|
| `*` | File has unsaved changes |
| `myfile.py` | Current filename (up to 15 chars) |
| `l42c17` | Cursor at line 42, column 17 |
| `512ln` | Total number of lines |
| `edt` | Current mode (see Modes table above) |

---

## Colour Guide

| Colour | Used for |
|--------|----------|
| Light blue | Normal text |
| Light grey | Line numbers |
| White | Menu bar, status bar, cursor |
| Yellow | Selected block |
| Red | Search match highlight |
| Green | File browser — directories, console output |
| Light blue | File browser — files |
| Cyan | Help screen, path in browser |

---

## Tips

- Use **regex** in Find/Replace for powerful text transformations, e.g. `^\s+` to find lines with leading whitespace.
- Open the same file in both split panes to compare different sections of a large file.
- Save frequently with **F5** — the `*` indicator in the status bar reminds you of unsaved changes.
- The console working directory defaults to the last directory visited in the file browser.
- When the cursor is at the beginning of a line, pressing `DEL` merges the line with the one above.
