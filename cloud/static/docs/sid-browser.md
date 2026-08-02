# SID Browser (Console 10)

The SID Browser lets you search the entire **High Voltage SID Collection**
(~61,000 C64 tunes), read what the archive knows about each one, play tunes on
your real C64, save them into your workspace, and keep playlists.

Console 10 has no `C=+CTRL` chord — open it from the **Launcher** (`C=+CTRL+1`,
then select *SID Browser*).

Nothing is stored locally except a small search index: tunes are fetched from an
HVSC mirror the moment you play or save them.

---

## First run

On first open the console downloads two HVSC metadata files (`STIL.txt` and
`Songlengths.md5`) and builds a search index. It takes a few seconds and shows
progress on the status line. The index is rebuilt automatically when it gets
older than the configured max age (default 14 days), in the background — search
keeps working against the old index meanwhile.

---

## Modes

| Mode | How to enter | Description |
|------|--------------|-------------|
| Search | `F1` / startup | Type words, `RETURN` to search |
| Tune list | after a search | Results, 2 lines per tune |
| Tune detail | `RETURN` on a tune | STIL notes and PSID/RSID header |
| Now playing | `P` or `RETURN` in detail | Playback screen |
| Folder browser | `F4` | Walk `/MUSICIANS`, `/GAMES`, `/DEMOS`, `/CGSC` |
| Playlists | `F3` | Your playlists, plus Favorites |
| Save dialog | `S` on a tune | Pick a workspace folder to save into |
| Settings | `F2` | Mirror, index age, raster-time border |
| Help | `F8` | Keyboard reference |

---

## Searching

Search covers tune titles, composers and STIL comments. Composers work even for
the many tunes that have no STIL entry at all, because the composer is also read
from the HVSC path.

```
 hubbard          → everything by Rob Hubbard
 commando         → the tune, wherever it appears
 galway last ninja
```

`F5` cycles the sort order: relevance, shortest, longest, most subtunes.

---

## Keyboard

Global, from anywhere: `F1` search, `F2` settings, `F3` playlists, `F4` folder
browser, `F8` help, `STOP` back one screen.

| Key | Tune list | Tune detail |
|-----|-----------|-------------|
| `UP`/`DOWN` | Select tune | — |
| `C=+<` / `C=+>` | Page up / down | — |
| `<` / `>` | — | Previous / next subtune |
| `RETURN` | Open details | Play this subtune |
| `P` | Play right away | Play |
| `X` | Play a random tune | — |
| `S` | Save to a folder | Save to a folder |
| `L` | Like — add to Favorites | Like — add to Favorites |
| `A` | Add to a playlist | Add to a playlist |
| `C=+C` | Copy the HVSC path | Copy the HVSC path |
| `F5` | Cycle sort order | — |

`C=+C` puts the tune's HVSC path on the clipboard, so you can paste it into the
shell, an editor or a note.

---

## Playback — how it works

This is the part worth understanding, because it is unusual.

The Ultimate's own SID player takes the whole C64 over: the HDN console
disappears, the keyboard stops reaching the wedge, and the only way out is a
reset. So the SID Browser does **not** use it.

Instead it loads the tune into C64 RAM together with a ~48-byte player stub,
and hooks that stub onto **IGETIN (`$032A`)** — the KERNAL vector that the
console's own key loop already calls once per frame. The result:

* the tune plays **while the console stays on screen and interactive**
* switching to another console keeps the music playing
* `STOP` unhooks the player, silences the SID, and **puts back the exact RAM
  the tune borrowed** — no reset, nothing lost

Tempo comes from **CIA2 Timer A**, so the music runs at the right speed whether
the console is calling the vector once per frame or the BASIC prompt is calling
it in a tight loop.

### Keys while playing

| Key | Action |
|-----|--------|
| `STOP` | Stop and restore C64 memory |
| `N` | Next tune in the current list |
| `X` | Shuffle — play a random tune |
| `S` | Save this tune to the workspace |
| `RETURN` | Back to the detail screen (keeps playing) |

### Tunes that can't be played

Some tunes are refused, with the reason on the status line and **nothing
written to the C64**:

* the tune installs its own IRQ handler (`play address 0`) — it needs to own
  the machine, which is exactly what this player avoids
* the tune loads over the screen, zero page, the cartridge window or the player
  stub at `$C000`

These are a small minority of HVSC. Everything else plays.

---

## Raster time in the border

Settings has **Raster time border** (`yes`/`no`, default `no`). With it on, the
player brackets the tune's play call with `inc $D020` / `dec $D020`, so a
coloured band appears in the border for exactly the scanlines the music is
executing on. The height of the band **is** the tune's raster time.

This is the standard demo-coder measurement, and it is what you want when
choosing music for a demo or game: a tune that eats a third of the frame leaves
you a lot less to work with. It costs 12 cycles per frame while enabled.

---

## Tune detail

The detail screen shows the STIL notes (trivia, cover-version credits, sample
sources — HVSC has them for a minority of tunes) and the full PSID/RSID header:

| Field | Why you care |
|-------|--------------|
| Load / init / play addresses | Where the tune sits and what to call |
| Memory footprint | Whether it fits around your own code |
| SID model | 6581 vs 8580 — the tune may sound wrong on the other |
| Clock | PAL / NTSC |
| Subtunes | `<` and `>` step through them |

---

## Saving tunes

`S` opens the save dialog, rooted at your workspace. Pick a folder, press `S`
again, and you get two files:

* `<tune>.sid` — the original file, byte for byte
* `<tune>.sid.txt` — a companion note with title, composer, release, the STIL
  entry, the mirror it came from, and a licensing reminder

**Read that reminder before you ship anything.** HVSC tunes are not public
domain; most composers allow non-commercial use with credit, but that is a
convention, not a licence. Ask the composer for anything commercial.

---

## Playlists

`F3` opens playlists. Favorites is always there — press `L` on any tune to add
it. `CTRL+N` makes a new playlist, `DEL` removes a playlist or a tune from one.

`E` exports a playlist as an **Extended M3U** file and `I` imports one. That is
the de facto interchange format for chiptune collections, so playlists move
between the SID Browser and desktop players such as Sidplay2 or ACID64.

---

## Settings (`F2`)

| Setting | Default | Notes |
|---------|---------|-------|
| Mirror | `hvsc.de` | Switch to `hvsc.sannic.nl` if one is slow or down |
| Index max age (days) | `14` | How stale the index may get before a rebuild |
| Raster time border | `no` | Show the tune's raster cost in the border |
| Rebuild index | — | `RETURN` forces a rebuild now |

---

## Troubleshooting

**"No C64 IP configured"** — the server hasn't seen your C64 yet. Use the shell
once so the server learns its address.

**Index build fails** — the mirror is probably down. Switch mirrors in Settings
and press `RETURN` on *Rebuild index*.

**The tune won't stop** — press `STOP` again; the stop is retried and the RAM
backup is kept until it succeeds.

**"File not found"** when playing — the index is older than the mirror. Rebuild
it from Settings.
