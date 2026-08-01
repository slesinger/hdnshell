# Clipboard (GH #18) — testing guide

This explains **why the clipboard "isn't working"** right now and **exactly
what you can test today**, step by step.

## TL;DR — current state

The clipboard has two halves:

| Half | Status |
| --- | --- |
| **Server side** — clipboard service, host-desktop sync, app copy/paste hooks, protocol | ✅ done + unit-tested |
| **Cartridge side** — `C=+CTRL+C` / `C=+CTRL+V` inside a server console | 🟡 **fits-now subset landed 2026-07-30, NOT yet HW-tested** (bank2 asm, VICE can't validate) |
| **Cartridge side** — interactive on-screen selector + local-BASIC copy/paste + BASIC-prompt chord | ❌ deferred (no bank space without dropping FunPaint; owner kept it) |

So on **real hardware, inside a server app (consoles 1-10)**, `C=+CTRL+C` now asks
the server to copy that app's whole visible screen to the shared+desktop
clipboard, and `C=+CTRL+V` pastes the shared clipboard into the app. This is
**untested on hardware** (it can't run in VICE — UCI/DMA), tracked as **Step 36**
in `wedge/historical_documentation/conversion_log3.md`. At the **local BASIC
prompt** the chord still does nothing (top-level dispatch is deferred).

**What already works without any cartridge change** is everything that rides on
a *normal* keypress or the desktop clipboard:

- App-native copy inside a server app (File Editor `C=+C`, RSS Reader `C=+C`)
  now writes to the shared clipboard **and** your desktop clipboard.
- Desktop clipboard ↔ server clipboard sync (both directions).

The one thing you cannot do yet is the shell-global copy/paste and pasting into
the local BASIC prompt — those need the cartridge.

---

## 0. Prerequisite on Linux: install a clipboard backend

**This machine currently has no clipboard backend installed**, so host↔desktop
sync is silently disabled (the server logs `no host clipboard backend
available` once at startup). Install one:

```bash
# Wayland (this machine runs Wayland — WAYLAND_DISPLAY=wayland-0):
sudo apt install wl-clipboard      # provides wl-copy / wl-paste
# or X11:
sudo apt install xclip             # or: xsel
```

macOS (`pbcopy`/`pbpaste`) and Windows (Win32) work out of the box.

> **No more dock/taskbar flashing.** Earlier builds polled the desktop
> clipboard in the background (spawning `wl-paste` twice a second), which on
> GNOME/Wayland — no wlroots `data-control`, so `wl-paste --watch` is
> unavailable — flashed the dock icon and blinked the terminal every second.
> The server no longer polls: **C64→desktop** fires the instant you copy, and
> **desktop→C64** is pulled only when you paste on the C64. Nothing runs on a
> timer. (To force the old background polling, set `clipboard_background_poll`
> to `true` in the config.)

Verify the server picks a backend:

```bash
cd cloud
python -c "from sdk.host_clipboard import detect_backend as d; b=d(); print(type(b).__name__ if b else 'NONE', b and b.is_available())"
```

You want something other than `NONE`. After installing, **restart the HDN
Server** and look for `host clipboard sync started (backend=...)` in the log.

---

## 1. Fastest check — run the unit tests

```bash
cd cloud
python -m pytest test_clipboard.py -v
```

27 tests exercise extraction (line/rectangle), size cap, session isolation,
local-paste PETSCII conversion + chunking, host sync (both directions + loop
suppression + disabled + backend errors), and command routing. Green = the
whole server side is behaving.

---

## 2. Test host → server and server → host sync (no C64 needed)

With a backend installed, drive the sync watcher directly:

```bash
cd cloud
python - <<'PY'
from sdk.clipboard import configure_clipboard_service
from sdk.host_clipboard import HostClipboardSync
import subprocess

svc = configure_clipboard_service()
sync = HostClipboardSync(svc)          # auto-detects the real backend
assert sync.start(), "no host clipboard backend — see section 0"

SID = 1

# server -> host: an app/C64 copy mirrors to the desktop clipboard.
svc.set_text(SID, "hello from the c64", source="editor")
print("desktop now holds:", subprocess.run(
    ["wl-paste", "--no-newline"], capture_output=True, text=True).stdout)
#  ^ use `xclip -selection clipboard -o` on X11, or `pbpaste` on macOS.

# host -> server: type/copy something on your desktop, then:
input("Copy some text on your DESKTOP now, then press Enter...")
sync.poll_once()
print("server clipboard now holds:", repr(svc.get_text(SID)))
sync.stop()
PY
```

Expected: after `set_text`, your desktop paste buffer holds the string; after
you copy on the desktop and `poll_once()`, the server clipboard picks it up.

> Note on host→server: sync targets the **most recently active session** — a
> session becomes active when it does a copy (`source != "host"`). That's why
> the script does an `editor` copy on `SID` first. With a real C64 attached,
> any app/screen copy makes that session active automatically.

---

## 3. Test app-native copy on a real C64 (works today, no cartridge change)

This path uses the app's own `C=+C` shortcut (a normal keypress, already wired),
not the not-yet-implemented `C=+CTRL` chord:

1. Start the HDN Server (with a clipboard backend from section 0) and connect
   the C64.
2. Open **File Editor** (`C=+CTRL+2`), type some text, select it, press
   **C=+C**.
3. On your desktop, paste (Ctrl/Cmd+V) — you should get the selected text.
4. Open **RSS Reader** (`C=+CTRL+6`), then press **C=+C** — the selected
   article's link is copied straight from the list ("Link copied!"), or open
   an article first and press **C=+C** there. Paste on the desktop to confirm
   you got the article URL. If the status line says **"No link to copy"**, that
   article genuinely has no link — pick another. (Earlier builds only copied
   from *inside* an open article and did nothing, silently, elsewhere.)

Reverse (desktop → File Editor) also works today via the app's own paste
(`C=+V` in the editor reads the shared clipboard): copy on the desktop, then
`C=+V` in the File Editor.

---

## 4. Test the wire protocol directly (simulates the future cartridge)

You can exercise the exact commands the cartridge *will* send once bank2 is
done, by feeding packets to `process_command`:

```bash
cd cloud
python - <<'PY'
import cloud_server as cs
import sdk.command_handler as ch
from sdk.command_handler import MAGIC_BYTES
from sdk.clipboard import get_clipboard_service
from sdk.shared_state import update_session_state

SID = 42

# --- local (console 0) COPY_SCREEN from a fake saved screen ---
from sdk.petscii import ascii_to_screencode
scr = bytearray(b"\x20"*1000)
for i,c in enumerate("HELLO WORLD"):
    scr[i] = ascii_to_screencode(ord(c))
update_session_state(SID, saved_screen=bytes(scr))
# console 0, cmd COMMAND(0x00): pkt = magic + [0x00] + [COPY_SCREEN, mode, x0,y0,x1,y1]
pkt = MAGIC_BYTES + bytes([0x00, ch.SERVER_CMD_COPY_SCREEN, 1, 0,0, 4,0])  # rect cols0-4 row0
print("COPY_SCREEN reply:", cs.C64Server.process_command(pkt, SID).hex())
print("clipboard now:", repr(get_clipboard_service().get_text(SID)))   # -> 'hello'

# --- CLIPBOARD_INFO (len_hi,len_lo,lines,flags) ---
pkt = MAGIC_BYTES + bytes([0x00, ch.SERVER_CMD_CLIPBOARD_INFO])
print("INFO reply:", cs.C64Server.process_command(pkt, SID).hex())

# --- LOCAL_PASTE_CHUNK (offset_hi,offset_lo,max_bytes) ---
pkt = MAGIC_BYTES + bytes([0x00, ch.SERVER_CMD_LOCAL_PASTE_CHUNK, 0,0, 4])
r = cs.C64Server.process_command(pkt, SID)
print("PASTE_CHUNK reply:", r.hex(), "-> [total_hi,total_lo,done, petscii...]")
PY
```

Expected: `COPY_SCREEN` stores `hello`, `INFO` returns `00 05 01 01`
(len 5, 1 line, present-flag), and `PASTE_CHUNK` returns
`00 05 00 <4 petscii bytes>` (total 5, not done). This proves the server end
of the contract the cartridge will speak.

---

## 5. Configure it (Settings page)

Clipboard behaviour lives on the **Settings** page of the web UI, in the
**Clipboard** section:

- **Sync with the host desktop clipboard** (on/off)
- **Max clipboard size (bytes)** (default 65536)
- **Host poll interval (ms)** (default 500)

Settings are read at server startup, so **restart the HDN Server** after
changing them.

---

## 6. C64 chord (fits-now subset) — HARDWARE TEST NEEDED

The `C=+CTRL+C` / `C=+CTRL+V` dispatch inside a server console landed in
`wedge/rr38p-tmp12reu.bank02.asm` (2026-07-30) but **cannot be validated in
VICE** (UCI/DMA) — it needs a C64 Ultimate. Flash the rebuilt cartridge
(`wedge/build.sh` → `wedge/hdn-rr38p-tmp12reu.crt`) and:

1. Start the HDN Server, connect the C64, type `HONDANI` to arm the wedge.
2. Enter a server app, e.g. **File Editor** (`C=+CTRL+2`).
3. On your desktop, copy some text (Ctrl/Cmd+C). In the app press **C=+CTRL+V** —
   the text should paste into the app (server routes `PASTE_TO_APP`; a
   `PASTE NOT AVAILABLE` toaster means the app rejected it).
4. In the app press **C=+CTRL+C** — the app's whole visible screen should land on
   your desktop clipboard (paste elsewhere to confirm; server runs
   `COPY_SCREEN` line-wise `0,0..39,24`).
5. Robustness: stop the server, press the chord — the console session must stay
   alive (the send fails closed; no hang, no border change).

Expected non-behaviour (by design, deferred): the chord does nothing at the
**local BASIC prompt**, there is **no interactive selection rectangle** (copy is
always the whole screen), and there is **no paste into the BASIC prompt**.

## What's left (deferred — needs bank space we chose not to reclaim)

The interactive on-screen selector, local console-0 copy (`scr_save` +
top-level `csw_guard` dispatch), local-BASIC paste (`LOCAL_PASTE_CHUNK` → KEYD
injection), and `COPY_NATIVE` app-selection copy via the chord are all deferred.
They don't fit bank2's remaining ~28 B; landing them needs FunPaint dropped
(`space_map.md` §5.4 — owner chose to keep it) or a reserve-bank + a
(currently unproven) IRQ-context cross-bank call path. See Step 36 in the
conversion log for the full accounting.
