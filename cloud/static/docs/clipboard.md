# Clipboard

HDN Shell gives you **one shared text clipboard** across your whole
workstation: the host computer's desktop clipboard, the local C64 BASIC
console, and every HDN Server app. Copy a URL in your desktop browser and
paste it at the BASIC prompt; copy an editor selection on the C64 and paste it
into a desktop app. There is no separate "C64 clipboard" — it is one clipboard
with the C64 as another participant.

The clipboard is **text only** in this release. Images, colours, fonts and
binary data are out of scope.

## Keys

All clipboard gestures use the shell-global **C=+CTRL** chord, which the
cartridge intercepts before BASIC or an app sees the key. Your app's own
`C=+C` / `C=+V` shortcuts (for example the File Editor's document copy/paste)
keep working unchanged.

| Keys | Action |
| --- | --- |
| `C=+CTRL+C` | Copy from the current app (if it has a native selection); otherwise start **visible-screen selection**. |
| `C=+CTRL+V` | Paste the shared clipboard into the current destination. |
| `C=+CTRL+L` | Toggle **line-wise** ↔ **rectangle** while selecting. |
| Cursor keys | Move the selection cursor while selecting. |
| `RETURN` | Mark the start point, then the end point (copies). |
| `STOP` | Cancel selection without changing the clipboard. |

You will see short confirmations such as `COPIED 42 CHARS`, `PASTED 42 CHARS`,
`CLIPBOARD EMPTY` and `PASTE NOT AVAILABLE`. Changes that arrive from the host
clipboard are silent (no C64 notification).

## Copying

There are two copy paths, and `C=+CTRL+C` picks the right one for you:

- **App-native copy** — when the current app has a richer selection than the
  screen, it copies that directly. The File Editor copies the selected
  document text; the RSS Reader copies the current article's link.
- **Visible-screen selection** — everywhere else (including the local BASIC
  console), a selection cursor appears so you can grab what is on screen:

  1. Press `C=+CTRL+C`.
  2. Move to the start of the text and press `RETURN`.
  3. Move to the end — the selected cells show in reverse video.
  4. Press `C=+CTRL+L` to switch between **line-wise** and **rectangle** modes.
  5. Press `RETURN` to copy, or `STOP` to cancel.

  **Line-wise** copies complete display rows between the two marks; trailing
  blanks are trimmed and rows are joined with newlines. **Rectangle** copies
  the inclusive column range on every row; interior spaces are kept and only
  trailing padding is trimmed. The selector only copies what is *visible* on
  the 40×25 screen — never hidden scrollback or an app's underlying document.

## Pasting

`C=+CTRL+V` inserts the shared clipboard into the current destination:

- **Server apps** with an editable target (the File Editor) receive the full
  text. An app with no paste target leaves its content unchanged and shows
  `PASTE NOT AVAILABLE`.
- **Local BASIC console** — newlines are converted to spaces before the text
  is inserted, so a multi-line clipboard becomes one line. Paste never injects
  a `RETURN` and never runs a command for you; you press `RETURN` yourself.
- Characters with no C64 equivalent become `?` rather than vanishing.

## Host clipboard synchronisation

When the HDN Server runs on a desktop with a clipboard backend, host and C64
clipboards stay in sync automatically:

- Text you copy on Linux, macOS or Windows becomes the C64/app clipboard.
- A C64 or app copy becomes your desktop clipboard.

The host clipboard is a single system value, while the HDN clipboard is
per-C64-session. When several C64 sessions are connected, host changes sync to
the **most recently active** session — the one that last performed a copy.

Synchronisation is **on by default** and fails gracefully: on a headless host
or one with no supported clipboard backend, the server logs this once at
startup and the on-C64 clipboard keeps working normally. Supported backends
are the Win32 clipboard on Windows, `pbcopy`/`pbpaste` on macOS, and
`wl-clipboard` (Wayland) or `xclip`/`xsel` (X11) on Linux.

The two directions work differently, by design, so the server never disturbs
your desktop when idle:

- **C64/app → desktop** happens the instant you copy (event-driven).
- **Desktop → C64/app** is pulled *on demand*, the moment you paste on the
  C64. The server does **not** poll the desktop clipboard in the background,
  because on some Linux desktops (notably GNOME/Wayland, which lack the
  wlroots `data-control` protocol) periodic clipboard reads make the taskbar
  or dock icon flash. If you specifically want continuous background polling,
  set `clipboard_background_poll` to `true` in the server config.

### Configuration

Clipboard behaviour is configured on the **Settings** page of the HDN Server
web UI, under the **Apps & Services** tab, in the **Clipboard** section:

| Setting | Default | Meaning |
| --- | --- | --- |
| **Sync with the host desktop clipboard** | On | Mirror the desktop clipboard both ways. Turn off to keep the C64/app clipboard separate from the desktop. |
| **Max clipboard size (bytes)** | `65536` | Maximum clipboard size (64 KiB). Larger copies are truncated. |
| **Host poll interval (ms)** | `500` | Only used when background polling is explicitly enabled (`clipboard_background_poll`). With the default on-demand sync the desktop clipboard is read only when you paste, so this has no effect. |

Clipboard settings are read when the server starts, so restart the HDN Server
after changing them.
