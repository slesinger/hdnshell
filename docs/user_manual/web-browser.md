# Web Browser (Console 4)

The Web Browser is a full text-mode browser that runs as a server-side console (Console 4). Press **`C=+4`** to switch to it at any time.

On the server, a headless Chromium instance (Playwright) fetches and fully renders web pages — including JavaScript-heavy sites. The rendered content is converted to PETSCII screen codes and displayed on the C64's 40×25 screen. Links, headings, images (as placeholders), and page colours are all represented.

---

## Layout

```
 Row  0 │ [1] Hacker News  [2] BBC News  [3]─────── │  ← tab bar
 Row  1 │                                            │
   ...  │   page content ...                         │  ← content area
 Row 23 │                                            │     (23 rows)
 Row 24 │ SPC=NextLink RET=Follow F7=URL F1=Tabs     │  ← status bar
```

| Area | Rows | Description |
|------|------|-------------|
| Tab bar | 0 | Open tabs (up to 10); active tab highlighted |
| Content | 1–23 | Page text, links, and images |
| Status bar | 24 | Context-sensitive key hints |

**Content markers:**
- `[link text]` — clickable link (blue)
- `link text` — currently highlighted / active link (light blue)
- `[IMG: alt text]` — image placeholder (cyan)
- Reversed text — headings
- `--------` — horizontal rule
- Cyan monospace text — preformatted / code blocks

---

## Modes

| Mode | How to enter | Description |
|------|-------------|-------------|
| Browse | Default | Scroll page, navigate links |
| URL Input | `F7` or `RUN/STOP` | Type a URL and navigate |
| Tab List | `F1` | Switch, open, or close tabs |
| Bookmarks | `F2` | Browse and manage saved bookmarks |
| History | `F4` | Browse recent URLs |
| Help | `F8` | Show keyboard reference |

---

## Keyboard Reference

### Browsing

| Key | Action |
|-----|--------|
| `↑` / `↓` | Scroll one line up / down |
| `F3` | Page up |
| `F5` | Page down |
| `SPACE` | Cycle through links visible on screen |
| `RETURN` | Follow the highlighted link |
| `LEFT ARROW` | Go back one page |

### URL Input

| Key | Action |
|-----|--------|
| `F7` | Open URL input |
| Type URL | Enter address |
| `RETURN` | Navigate to URL |
| `RUN/STOP` | Cancel |
| `←` / `→` | Move cursor within URL |
| `DEL` | Delete character (backspace) |
| `HOME` | Jump to start of URL |

### Tabs

| Key | Action |
|-----|--------|
| `F1` | Open tab switcher |
| `↑` / `↓` | Select tab in list |
| `RETURN` | Switch to selected tab |
| `CTRL+N` | Open a new empty tab |
| `CTRL+W` | Close the current tab |

### Bookmarks

| Key | Action |
|-----|--------|
| `F2` | Open bookmarks |
| `↑` / `↓` | Select bookmark |
| `RETURN` | Navigate to bookmark |
| `CTRL+N` | Add current page URL to bookmarks |
| `CTRL+W` | Delete selected bookmark |

### History

| Key | Action |
|-----|--------|
| `F4` | Open history |
| `↑` / `↓` | Select history entry |
| `RETURN` | Navigate to entry |
| `CTRL+W` | Delete history entry |
