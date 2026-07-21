# HDN Shell Clipboard

## Purpose

HDN Shell provides one shared text clipboard between the host computer, the
local C64 BASIC console, and all HDN Server applications. The clipboard lives
on the HDN Server, not in persistent C64 memory.

The host clipboard is part of the same experience. Text copied on Linux,
macOS, or Windows becomes available to the C64; text copied on the C64 or in a
server app becomes available to desktop applications. The user should think of
this as one workstation clipboard with the C64 as another participant.

The feature has two complementary copy paths:

- A shell-owned visible-screen selector that works everywhere, including the
  local BASIC console and apps without their own selection model.
- An app-native copy action for applications that have richer underlying data,
  such as a file editor selection or an RSS article URL.

## User Experience

### One Clipboard

- The server keeps the canonical clipboard as UTF-8 text for each connected
  C64 session.
- When host clipboard synchronization is available, host clipboard changes
  silently update that same clipboard.
- A C64 or server-app copy silently updates the host clipboard.
- There is no separate "C64 clipboard" or "host clipboard" in the UI.
- Clipboard synchronization is enabled by default and can be disabled in
  `hdnsh.cfg`. It must fail gracefully on headless hosts or when the platform
  clipboard backend is unavailable.

Recommended configuration:

```ini
[clipboard]
host_sync = true
max_bytes = 65536
poll_interval_ms = 500
```

The clipboard is intentionally text-only in the first release. Images, C64
screen colours, fonts, and binary data are out of scope.

### Key Map

All shell-global gestures use `C=+CTRL`, which is intercepted by the cartridge
before BASIC or a server app sees the key. Existing console-switch and
scrollback gestures remain unchanged.

| Keys | Action |
| --- | --- |
| `C=+CTRL+C` | Copy from the current app if it has a native selection/action; otherwise enter visible-screen selection mode. |
| `C=+CTRL+V` | Paste the shared clipboard into the current destination. |
| `C=+CTRL+L` | Toggle line-wise and rectangle mode while visible-screen selection is active. |
| Cursor keys | Move the selection cursor while visible-screen selection is active. |
| `RETURN` | Mark the start/end point or confirm copy in visible-screen selection mode. |
| `STOP` | Cancel visible-screen selection without changing the clipboard. |

`C=+C` and `C=+V` stay available to applications for their existing local
behaviour. For example, the file editor continues to use its document-aware
copy and paste shortcuts.

### Visible-Screen Selection

The generic selector copies what is visible in the current 40x25 screen. It
does not infer hidden text from scrollback, a file editor document, or a web
page. This makes the fallback predictable everywhere.

1. Press `C=+CTRL+C` where no app-native copy target exists.
2. A selection cursor appears at the current visible cursor position. If the
   active source has no cursor, begin at `(0, 0)`.
3. Move to the desired start point and press `RETURN` to mark it.
4. Move to the desired end point. The selected cells are shown in reverse
   video.
5. Press `C=+CTRL+L` to switch between line-wise and rectangle selection as
   needed.
6. Press `RETURN` again to copy, or `STOP` to cancel.

Line-wise selection copies complete display rows between the two endpoints.
Trailing padding is removed from each row and rows are joined with `\n`.

Rectangle selection copies the inclusive column range on every selected row.
Internal spaces are preserved; only trailing display padding is removed from
each row. Rows are joined with `\n`.

The selector must always restore the screen exactly on confirmation,
cancellation, connection failure, console switch, and program-mode self-disarm.

### Paste Behaviour

`C=+CTRL+V` reads the current shared clipboard.

- In a server app with an editable target, the app receives the complete UTF-8
  text through a dedicated clipboard-paste hook.
- An app with no valid paste target leaves its content unchanged and displays a
  short toaster such as `PASTE NOT AVAILABLE`.
- In the local BASIC console, newlines are normalized to spaces before text is
  inserted. The action never injects `RETURN` or executes multiple direct-mode
  commands.
- C64 insertion converts UTF-8 to PETSCII. Unsupported characters become `?`;
  they must not be silently discarded.
- The server transfers paste text in bounded chunks. The C64 never keeps a
  persistent clipboard copy.

Useful short notifications are `COPIED 42 CHARS`, `PASTED 42 CHARS`,
`CLIPBOARD EMPTY`, and `PASTE NOT AVAILABLE`. Host clipboard changes do not
show C64 notifications.

## Developer Implementation Plan

### 1. Define the Contract and Reserve Protocol IDs

Document the protocol next to the existing console commands in
`cloud/sdk/command_handler.py` and the matching wedge constants. Do not reuse
the existing values:

- `0x01`: get screen
- `0x02`: save local screen
- `0x03`: restore local screen
- `0x04` / `0x05`: scrollback

Reserve a contiguous new command range for clipboard operations. The exact
numeric values must be selected after checking all currently assigned values.
Suggested operations are:

| Operation | Payload | Result |
| --- | --- | --- |
| `COPY_SCREEN` | source console ID, mode, x0, y0, x1, y1 | Server extracts text, stores it, returns metadata/ack. |
| `COPY_NATIVE` | source console ID | Server routes to the active app's native copy hook. |
| `CLIPBOARD_INFO` | none | Length, line count, flags; no clipboard content. |
| `PASTE_TO_APP` | target console ID | Server routes UTF-8 text to the target app hook. |
| `LOCAL_PASTE_CHUNK` | offset/max payload | PETSCII-safe payload for the local console, chunked. |

Use an explicit packet-version or capability flag if the protocol may need to
coexist with older cartridge images.

### 2. Implement a Clipboard Service

Create `cloud/sdk/clipboard.py` as the only owner of clipboard semantics.
Keep the actual session value in the existing `clipboard` entry in
`cloud/sdk/shared_state.py` for compatibility, but stop having server apps
write it directly.

The service should provide:

```python
set_text(session_id: int, text: str, source: str) -> ClipboardMetadata
get_text(session_id: int) -> str
get_metadata(session_id: int) -> ClipboardMetadata
copy_screen(session_id: int, screen: bytes, selection: Selection) -> ClipboardMetadata
to_local_petscii_chunk(session_id: int, offset: int, max_bytes: int) -> PasteChunk
```

Requirements:

- Normalize input to UTF-8 text and normalize line endings to `\n`.
- Enforce a configurable byte limit, initially 64 KiB.
- Keep metadata such as byte length, line count, update time, and source for
  diagnostics; do not expose it as a second user-visible clipboard.
- Serialize access using the existing session-state locking helpers.
- Convert C64 screen codes to Unicode text consistently with the existing
  PETSCII/screen-code conversion utilities.
- Convert local paste text to PETSCII with an explicit unsupported-character
  replacement and with newlines converted to spaces.
- Implement inclusive, normalized selection bounds so users can mark either
  endpoint first.

Write focused unit tests for line-wise extraction, rectangles, reverse-video
screen codes, empty cells, trailing-space trimming, reversed endpoints,
encoding fallback, size limits, and session isolation.

### 3. Add Host Clipboard Synchronization

Implement a small platform-adapter interface in `cloud/sdk/host_clipboard.py`:

```python
class HostClipboard:
    def is_available(self) -> bool: ...
    def read_text(self) -> str | None: ...
    def write_text(self, text: str) -> None: ...
```

Provide implementations in this priority order:

1. Windows via native Win32 clipboard APIs.
2. macOS via `pbpaste` / `pbcopy` or native APIs if packaging makes that
   preferable.
3. Linux via Wayland (`wl-paste` / `wl-copy`) and X11 (`xclip` or `xsel`).

Run synchronization in a background service started by `cloud_server.py`:

- Poll only when `host_sync` is enabled and a backend is available.
- Detect content changes by a normalized-text hash.
- Write C64/server-app copies to the host backend immediately.
- Record the last host-written hash so the watcher does not loop a C64 copy
  back into itself.
- Log backend unavailability once at startup, then leave the server clipboard
  fully functional.
- Never crash the server because desktop clipboard access fails.

The host clipboard is global while current HDN clipboard state is per C64
session. First release policy: synchronize host changes to the most recently
active session; a C64 copy makes that session active. Document this explicitly.
Later, consider a configurable active-session selector if multiple C64 clients
are a supported workflow.

Test the watcher with a fake backend. Cover host-to-server propagation,
server-to-host propagation, loop suppression, disabled synchronization, and
backend exceptions.

### 4. Route Global Clipboard Commands

Extend `CommandHandler.handle_local_command()` in
`cloud/sdk/command_handler.py` to handle clipboard commands for console 0.

- For local copy, use `saved_screen` after a `SAVE_SCREEN` DMA read. Do not
  retain another C64-side screen buffer.
- Return an acknowledgement only after the server has stored copied text.
- For local paste, serve chunk requests through `ClipboardService`; do not put
  the entire clipboard on the C64.

Extend `ConsoleManager` to expose the authoritative active console instance.
For server console copy, extract from the app's `screen` buffer rather than
from `$0400`, which may be stale during a redraw.

Add to `ServerConsole` in `cloud/sdk/server_console.py`:

```python
def copy_native(self) -> bool:
    """Copy app-specific selection into ClipboardService; return success."""

def handle_clipboard_paste(self, text: str) -> bool:
    """Paste into the current app target; return whether it was accepted."""
```

The base implementation returns `False`. Apps should use the existing toaster
API for rejected paste feedback.

Migrate existing direct users:

- `file_editor_console.py`: native copy/cut should write through
  `ClipboardService`; paste should use `handle_clipboard_paste()` and preserve
  document selection semantics.
- `rss_reader.py`: native copy writes the current link through the service.
- Other apps initially rely on visible-screen copy and may reject paste until
  they have a meaningful text input target.

### 5. Implement Cartridge Input and Selection Mode

Modify the CINV hook and console modal logic in
`wedge/rr38p-tmp12reu.bank02.asm`. This code already recognizes the
`C=+CTRL` chord, provides a one-press latch, safely waits for key release, and
uses modal loops for console switching and scrollback. Preserve the existing
behaviour for `1..7`, `F5`, and `F7` exactly.

Add dispatch for `C` and `V`:

- `C=+CTRL+C`: ask the active server console to perform native copy. If it
  reports no native selection/action, start generic visible-screen selection.
  For console 0, start generic selection directly after `scr_save`.
- `C=+CTRL+V`: request clipboard metadata and paste to the active app or begin
  local chunked insertion.

The generic selection modal needs only transient state:

- Phase: choosing start or choosing end.
- Mode: line-wise or rectangle.
- Anchor `(x0, y0)` and focus `(x1, y1)`.
- Previous highlighted bounds, if needed for incremental redraw.

Render selection by XORing the reverse-video bit of affected screen bytes at
`$0400`. On movement, XOR the old selected area to remove its highlight and
the new area to add it. This preserves each character and does not require a
1000-byte backup. Carefully clamp all coordinates to `x=0..39`, `y=0..24`.

When selection confirms, send only the selection metadata to the server. The
server performs text extraction and owns clipboard storage. On every exit path
(confirmation, `STOP`, network error, console change, or self-disarm), XOR the
current highlighted area once to restore the display.

For local BASIC paste, fetch a chunk, inject only as much as the KERNAL input
buffer safely accepts, and request the next chunk after it is consumed. Never
inject a carriage return. Keep terminal flow responsive and discard stale
keyboard backlog consistently with the existing `cs_modal` behaviour.

### 6. Add Tests and Hardware Validation

Server-side automated tests:

- Clipboard service behavior and extraction rules.
- Host backend fake and synchronization loop prevention.
- Command parsing, invalid payloads, command acknowledgements, and session
  routing.
- Native file-editor copy/paste and generic screen-copy fallback.
- Local paste normalization: `one\ntwo` becomes `one two` with no PETSCII
  carriage return.

Cartridge/manual validation in VICE and on C64 Ultimate:

1. Copy an X11/Wayland/macOS/Windows host clipboard value and paste it into the
   BASIC prompt.
2. Copy a BASIC screen rectangle and paste it into the file editor.
3. Copy an editor document selection and paste it into a host editor.
4. Copy a visible RSS link and paste it into BASIC and the host.
5. Verify line-wise and rectangle extraction at screen edges and with reversed
   start/end marks.
6. Verify `STOP`, network loss, console switching, and loading/running a
   program leave no reverse-video residue and no stuck input state.
7. Verify host clipboard backend failure does not break server-app/local
   clipboard operations.

### 7. Rollout and Documentation

Ship in increments:

1. Server clipboard service and app migration, preserving current editor/RSS
   behavior.
2. Generic server-console screen copy and paste hooks.
3. Cartridge selector and local BASIC paste.
4. Host synchronization behind the configuration switch, then enabled by
   default once Linux, macOS, and Windows packages are verified.

Add a user-manual chapter after the implementation is stable. It should show
the key map, selection steps, host synchronization behavior, BASIC newline
normalization, configuration, and headless-host limitation.