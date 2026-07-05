# Wikipedia Browser (Console 7)

The Wikipedia Browser is a dedicated PETSCII Wikipedia reader running as a server-side console (Console 7). Press **`C=+CTRL+7`** to switch to it at any time.

The server fetches and strips Wikipedia pages down to essential text and links for the 40×25 display. Works across all Wikipedia language editions. Links are highlighted inline; headings appear in white.

---

## Layout

```
 Row  0 │ Article title                              │  ← title bar
 Row  1 │                                            │
   ...  │   article text and [links] ...             │  ← content area
 Row 23 │                                            │     (23 rows)
 Row 24 │ F7=Search  F8=Help                         │  ← status bar
```

**Content markers:**
- `[link text]` — internal link (cyan)
- `link text` — currently highlighted link (white)
- Reversed text — section headings

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
| `F1` | Go to wikipedia.org home |

### Search

| Key | Action |
|-----|--------|
| `F7` | Open search input |
| Type query | Enter search terms |
| `RETURN` | Search Wikipedia |
| `RUN/STOP` | Cancel |
| `←` / `→` | Move cursor in search field |
| `↑` / `↓` | Cycle the search language |
| `DEL` | Delete character (backspace) |
| `HOME` | Jump to start of input |

Search defaults to English (`en`). To search another language, press `↑`/`↓` while in the search input to cycle through the available Wikipedia language editions — the current language is shown next to the input.

### Table of Contents

| Key | Action |
|-----|--------|
| `CTRL+T` | Toggle TOC overlay |
| `↑` / `↓` | Select section in TOC |
| `RETURN` | Jump to selected section |
| `CTRL+T` | Close TOC |

### Help

| Key | Action |
|-----|--------|
| `F8` | Open / close help screen |
| `RUN/STOP` | Close help screen |
