# Clipboard

HDN Shell links your host computer's desktop clipboard to the C64 as **one shared
text clipboard**. Its main job today is to move text **from your PC or Mac onto the
C64**: copy a URL or a line of code in a desktop editor, then paste it at the C64
BASIC prompt or into an HDN Server app. Copying the other way (C64 → desktop) is
available from inside server apps — see the limits below.

The clipboard is **text only**. Images, colours, fonts and binary data are out of
scope.

## What works today

All clipboard gestures use the shell-global **C=+CTRL** chord, which the cartridge
intercepts before BASIC or an app sees the key. An app's own `C=+C` / `C=+V`
shortcuts (for example an app's document copy/paste) keep working unchanged.

| Keys | Where | Action |
| --- | --- | --- |
| `C=+CTRL+V` | Local BASIC console (READY) | Paste the host clipboard as text at the cursor. |
| `C=+CTRL+V` | Inside an HDN Server app | Send the host clipboard to the app's paste target. |
| `C=+CTRL+C` | Inside an HDN Server app | Copy the app's current screen (or a native selection, such as the RSS Reader's article link) to the shared clipboard. |

## Pasting (host → C64)

`C=+CTRL+V` inserts the shared clipboard into whatever is in front of you:

- **Local BASIC console** — the text is placed at the cursor as if you had typed
  it. You press `RETURN` yourself: paste never injects a `RETURN` and never runs a
  command for you.
- **HDN Server apps** — an app with an editable target receives the text; an app
  with no paste target is left unchanged.
- Characters with no C64 equivalent are shown as `?` rather than dropped.

### Limits of a BASIC-console paste

- **One line at a time.** A paste fills a single BASIC input line; newlines in the
  clipboard are converted to **spaces**, so a multi-line snippet arrives as one
  line.
- **About 64 characters per paste.** Longer clipboards are cut to roughly the
  first 64 characters (about one BASIC logical line). Paging in longer text is
  planned but not yet available.
- Requires the HDN Server to be running and reachable on the host; the desktop
  clipboard is read at the moment you paste (see synchronisation below).

## Copying (C64 → host)

Copying from the C64 is available **inside HDN Server apps**. `C=+CTRL+C` copies
the app's visible screen — or, where the app offers a richer native selection
(such as the RSS Reader's current article link) — into the shared clipboard, which
then syncs to your desktop.

**Not yet available:**

- An **interactive on-screen selector** (moving a cursor to mark a start and end,
  or choosing line-wise vs rectangular selection). Copy is currently whole-screen
  or app-native only.
- Copying from the **local BASIC console** screen. Copy works only from within a
  server app; the BASIC prompt supports paste only.

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
startup and the on-C64 clipboard keeps working normally.

### Installing a clipboard backend

On **macOS** and **Windows** there is nothing to install — the system
clipboard (`pbcopy`/`pbpaste` on macOS, the Win32 clipboard on Windows) is
used automatically.

On **Linux** install the tool that matches your display server, then restart
the HDN Server.

**Wayland** (most current distros — confirm with `echo $WAYLAND_DISPLAY`):

| Distro | Command |
| --- | --- |
| Debian / Ubuntu / Mint | `sudo apt install wl-clipboard` |
| Fedora / RHEL | `sudo dnf install wl-clipboard` |
| Arch / Manjaro | `sudo pacman -S wl-clipboard` |
| openSUSE | `sudo zypper install wl-clipboard` |

**X11** (`echo $DISPLAY` is set and `$WAYLAND_DISPLAY` is empty):

| Distro | Command |
| --- | --- |
| Debian / Ubuntu / Mint | `sudo apt install xclip` (or `xsel`) |
| Fedora / RHEL | `sudo dnf install xclip` |
| Arch / Manjaro | `sudo pacman -S xclip` |
| openSUSE | `sudo zypper install xclip` |

The server auto-detects backends in the order **Windows → macOS → Wayland
(`wl-clipboard`) → X11 (`xclip`, then `xsel`)**, choosing the first whose tool
is on `PATH` — so install the one matching your session. At startup the log
shows `host clipboard sync started (backend=…)` on success, or `no host
clipboard backend available` if none was found.

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
| **Poll the desktop clipboard in the background** | Off | Leave off. When on, the desktop clipboard is re-read on a timer instead of on demand — only enable it if desktop→C64 sync feels stale, and note it makes the GNOME/Wayland dock and taskbar flash each interval. |
| **Max clipboard size (bytes)** | `65536` | Maximum size of the *host/synced* clipboard (64 KiB). Larger copies are truncated. (A single BASIC-console paste is separately limited to about one line — see above.) |
| **Host poll interval (ms)** | `500` | Only used when background polling (above) is on. With the default on-demand sync the desktop clipboard is read only when you paste, so this has no effect. |

Clipboard settings are read when the server starts, so restart the HDN Server
after changing them.

## Limits at a glance

- **Text only** — no images, colour, or binary data.
- **Host → C64 paste** works at the BASIC prompt and inside server apps; a BASIC
  paste is **one line, about 64 characters**, with newlines flattened to spaces.
- **C64 → host copy** works **only inside server apps** (whole screen or
  app-native selection). Copying from the local BASIC screen, and an interactive
  on-screen selector, are **not yet available**.
- Requires the **HDN Server running on the host** with a clipboard backend
  installed (see above).
