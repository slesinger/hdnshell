# Web Browser (Console 4)

The Web Browser is a full text-mode browser that runs as a server-side console (Console 4). Press **`C=+CTRL+4`** to switch to it at any time.

On the server, a headless Chromium instance (Playwright) fetches and fully renders web pages — including JavaScript-heavy sites. The rendered content is converted to PETSCII screen codes and displayed on the C64's 40×25 screen. Links, headings, images (as placeholders), and page colours are all represented.

The same address bar also doubles as a **web search box** — type a phrase instead of a URL and get real Google search results, right there on the C64 screen. See [Web Search](#web-search) below.

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

## Web Search

You don't need to know a URL to browse the web — the same input field used for
addresses also runs a **real Google search** (via SerpAPI) when what you type
doesn't look like a URL.

Open the URL bar (`F7`, `RUN/STOP`, or the field shown when the browser starts
with no home page) and just type what you're looking for:

```
URL or google search phrase
commodore 64 vic-ii chip_
```

Press `RETURN` and a normal-looking page comes back: a title, a horizontal
rule, and up to 10 results — each a clickable `[link]` with a text snippet
underneath, exactly like any other page in this browser. Cycle results with
`SPACE`, follow one with `RETURN`, scroll with `↑`/`↓`, go back with
`LEFT ARROW`. Search results can be bookmarked and appear in history just
like any page you visit.

**How it decides URL vs. search:** if what you typed looks like a domain or
address — contains a dot (`csdb.dk`), is `localhost`, or is a bare IP
(`192.168.1.50`), optionally with a port or path — it's treated as a URL and
`https://` is added automatically if missing. Anything else — including any
input containing a space (`weather london`, `best sid tunes 1987`) — is run
as a web search instead.

**Requirements:** the HDN Server needs a SerpAPI key configured
(`SERPAPI_API_KEY` in Settings / `hdnsh.cfg`). Without one, searching shows a
normal error page telling you to set it up — browsing regular URLs is
unaffected either way.

---

## Modes

| Mode | How to enter | Description |
|------|-------------|-------------|
| Browse | Default | Scroll page, navigate links |
| URL Input | `F7` or `RUN/STOP` | Type a URL to navigate, or a search phrase to [web search](#web-search) |
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
| Type URL or phrase | Enter an address, or a [search phrase](#web-search) |
| `RETURN` | Navigate to URL, or run web search |
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
