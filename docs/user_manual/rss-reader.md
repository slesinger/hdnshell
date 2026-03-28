# RSS Reader (Console 6)

The RSS Reader is a feed reader for RSS and Atom feeds that runs as a server-side console (Console 6). Press **`C=+6`** to switch to it at any time.

The server fetches and parses feeds using the feedparser library. Full article text is retrieved directly from source URLs using BeautifulSoup. The 40-column display shows article headlines, summaries, dates, and full article text.

---

## Default Feeds

The reader comes pre-loaded with three feeds:

| Feed | URL |
|------|-----|
| Hacker News | `https://news.ycombinator.com/rss` |
| BBC News | `https://feeds.bbci.co.uk/news/rss.xml` |
| CSDb Releases | `https://www.csdb.dk/rss/latestreleases.php` |

You can add, remove, and enable/disable feeds from the Feed Directory screen.

---

## Modes

| Mode | How to enter | Description |
|------|-------------|-------------|
| Article List | `F1` / startup | Scrollable list of articles from all enabled feeds |
| Article View | `RETURN` on article | Read full article text |
| Feed Directory | `F3` | Manage subscribed feeds |
| Feed Edit | `RETURN` on feed | Edit a feed URL |
| Settings | `F2` | Configure max articles and refresh interval |
| Help | `F8` | Show keyboard reference |

---

## Layout

```
 Row  0 │ RSS READER                                 │  ← title bar
 Row  1 │ ● Hacker News                              │
 Row  2 │   Show HN: C64 demoscene tools             │  ← article list
 Row  3 │   Great demo released at Revision 2026     │     (23 rows)
   ...  │   ...                                      │
 Row 24 │ F1=Articles F2=Settings F3=Feeds F8=Help   │  ← status bar
```

Each article entry shows the feed name (cyan), article title, summary (up to 2 lines), and publication date (dark grey).

---

## Keyboard Reference

### Article List

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select article |
| `F5` | Page down |
| `RETURN` | Read selected article |
| `SPACE` | Refresh all feeds |
| `F3` | Open feed directory |

### Article View

| Key | Action |
|-----|--------|
| `↑` / `↓` | Scroll article text |
| `F3` / `F5` | Page up / page down |
| `C=+C` | Copy article link to clipboard |
| `RUN/STOP` | Return to article list |

### Feed Directory

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select feed |
| `RETURN` | Edit selected feed URL |
| `CTRL+N` | Add a new feed |
| `CTRL+W` | Delete selected feed |
| `SPACE` | Enable / disable selected feed |
| `RUN/STOP` | Return to article list |

### Feed Edit

| Key | Action |
|-----|--------|
| `←` / `→` | Move cursor in URL |
| `HOME` | Jump to start of URL |
| `DEL` | Delete character (backspace) |
| `RETURN` | Save and close |
| `RUN/STOP` | Cancel without saving |

### Settings

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select setting |
| `RETURN` | Edit selected value |
| `RUN/STOP` | Return to article list |

| Setting | Description |
|---------|-------------|
| Max Articles | Maximum number of articles to keep per feed |
| Refresh (min) | Auto-refresh interval in minutes |
