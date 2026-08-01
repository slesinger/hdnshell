"""
Shared clipboard service for HDN Shell (GH #18).

HDN Shell exposes ONE shared text clipboard across three participants:

  * the host computer (Linux / macOS / Windows desktop clipboard),
  * the local C64 BASIC console (console 0), and
  * every HDN Server application (consoles 1-10).

This module is the single owner of clipboard *semantics*. The canonical
per-session value still lives in the existing ``clipboard`` entry of
``sdk.shared_state`` (so nothing else needs to change how it reads the raw
text), but all mutation now flows through :class:`ClipboardService` so that:

  * input is normalised to UTF-8 with ``\\n`` line endings,
  * a configurable byte cap is enforced,
  * metadata (length, line count, update time, source) is tracked, and
  * a C64/app copy can be mirrored to the host clipboard (see
    ``sdk.host_clipboard``) via the registered host sink.

Host-clipboard synchronisation is intentionally decoupled: this module knows
nothing about ``xclip``/``pbcopy``/Win32. It merely calls an opaque *host
sink* callback when a non-host copy occurs, and offers :func:`set_text` with
``source="host"`` for the watcher to push host changes back in without
looping.

The clipboard is text-only in the first release. Images, colours, fonts and
binary data are out of scope.
"""

from __future__ import annotations

import logging
import time
from dataclasses import dataclass
from typing import Callable, Optional

from .petscii import screencode_to_char, ascii_to_petscii, transliterate
from .shared_state import locked_session_state

logger = logging.getLogger(__name__)

# ── Configuration (overridable by cloud_server from cloud_config) ────────
# Default byte cap for a single clipboard value (64 KiB, per the spec).
DEFAULT_MAX_BYTES = 65536

# Selection modes for screen copy.
MODE_LINEWISE = 0
MODE_RECTANGLE = 1

# C64 screen geometry.
SCREEN_COLS = 40
SCREEN_ROWS = 25
SCREEN_SIZE = SCREEN_COLS * SCREEN_ROWS  # 1000

# Session-state keys owned by this module.
_STATE_TEXT_KEY = "clipboard"  # reused for backwards compatibility
_STATE_META_KEY = "clipboard_meta"

# Replacement byte used when a character has no PETSCII form on the local
# BASIC console. The spec requires an explicit marker rather than silent
# dropping.
_PETSCII_QUESTION = ascii_to_petscii(ord("?"))


@dataclass(frozen=True)
class ClipboardMetadata:
    """Lightweight, diagnostic-only description of the current clipboard.

    This is NOT a second user-visible clipboard: it never carries the text
    itself, only its shape and provenance.
    """

    byte_length: int
    line_count: int
    updated_at: float
    source: str


@dataclass(frozen=True)
class Selection:
    """An inclusive visible-screen selection.

    Endpoints may be given in either order; :func:`copy_screen` normalises
    them. ``mode`` is :data:`MODE_LINEWISE` or :data:`MODE_RECTANGLE`.
    """

    mode: int
    x0: int
    y0: int
    x1: int
    y1: int


@dataclass(frozen=True)
class PasteChunk:
    """A bounded PETSCII slice of the clipboard for local BASIC insertion."""

    data: bytes
    offset: int
    total_bytes: int
    done: bool


class ClipboardService:
    """The single owner of clipboard read/write semantics for a server.

    A service instance is cheap and stateless apart from the configured
    ``max_bytes`` and an optional *host sink*. The actual text lives in
    per-session state, so multiple service instances would share the same
    clipboard; in practice ``cloud_server`` creates exactly one.
    """

    def __init__(self, max_bytes: int = DEFAULT_MAX_BYTES):
        self.max_bytes = max_bytes
        self._host_sink: Optional[Callable[[int, str], None]] = None
        self._host_source: Optional[Callable[[int], None]] = None
        self._last_active_session: Optional[int] = None

    # ------------------------------------------------------------------
    # Host synchronisation glue
    # ------------------------------------------------------------------

    def register_host_sink(self, sink: Optional[Callable[[int, str], None]]) -> None:
        """Register a callback invoked on every non-host copy.

        The sink receives ``(session_id, text)`` and is expected to push the
        text to the platform clipboard. Registering ``None`` disables host
        mirroring. Exceptions raised by the sink are swallowed so a broken
        desktop backend can never break C64/app clipboard operations.
        """
        self._host_sink = sink

    def register_host_source(self, source: Optional[Callable[[int], None]]) -> None:
        """Register a callback that pulls the host clipboard on demand.

        The source receives the pasting ``session_id`` and is expected to
        import a genuine host clipboard change into it (via ``set_text`` with
        ``source="host"``). Called by :func:`pull_from_host` just before a
        paste is served, so the desktop->C64 direction needs no background
        polling. Registering ``None`` disables it. Exceptions are swallowed.
        """
        self._host_source = source

    def pull_from_host(self, session_id: int) -> None:
        """Refresh the clipboard from the host, if a host source is wired.

        Paste entry points call this so desktop->C64 sync happens lazily at
        paste time rather than on a background timer. A no-op when no host
        source is registered (headless, or host sync disabled).
        """
        if self._host_source is None:
            return
        try:
            self._host_source(session_id)
        except Exception:
            logger.debug("host clipboard source failed", exc_info=True)

    @property
    def last_active_session(self) -> Optional[int]:
        """The session that most recently performed a C64/app copy.

        The host watcher targets this session when mirroring host clipboard
        changes inward (first-release single-active-session policy).
        """
        return self._last_active_session

    # ------------------------------------------------------------------
    # Core text access
    # ------------------------------------------------------------------

    def set_text(
        self, session_id: int, text: str, source: str
    ) -> ClipboardMetadata:
        """Store ``text`` as the shared clipboard for ``session_id``.

        The text is normalised (UTF-8, ``\\n`` line endings) and capped at
        ``max_bytes``. ``source`` is a short provenance tag such as
        ``"screen"``, ``"editor"``, ``"rss"``, ``"local"`` or ``"host"``.

        A non-``"host"`` source marks this session as the active clipboard
        session and mirrors the value to the host sink (if registered). A
        ``"host"`` source is a push from the host watcher and is NEVER
        mirrored back, breaking the sync loop.
        """
        normalized = self._normalize(text)
        meta = ClipboardMetadata(
            byte_length=len(normalized.encode("utf-8")),
            line_count=normalized.count("\n") + 1 if normalized else 0,
            updated_at=time.time(),
            source=source,
        )
        with locked_session_state(session_id) as state:
            state[_STATE_TEXT_KEY] = normalized
            state[_STATE_META_KEY] = meta

        if source != "host":
            self._last_active_session = session_id
            if self._host_sink is not None:
                try:
                    self._host_sink(session_id, normalized)
                except Exception:
                    logger.debug("host clipboard sink failed", exc_info=True)

        logger.debug(
            "clipboard set: session=%s source=%s bytes=%d lines=%d",
            session_id,
            source,
            meta.byte_length,
            meta.line_count,
        )
        return meta

    def get_text(self, session_id: int) -> str:
        """Return the current shared clipboard text (``""`` if empty)."""
        with locked_session_state(session_id) as state:
            return state.get(_STATE_TEXT_KEY, "") or ""

    def get_metadata(self, session_id: int) -> ClipboardMetadata:
        """Return metadata for the current clipboard, recomputing if absent.

        Older sessions (or apps that wrote the raw ``clipboard`` entry before
        this service existed) may have text but no stored metadata; this
        derives it on the fly so callers always get a consistent answer.
        """
        with locked_session_state(session_id) as state:
            meta = state.get(_STATE_META_KEY)
            text = state.get(_STATE_TEXT_KEY, "") or ""
        if isinstance(meta, ClipboardMetadata):
            return meta
        return ClipboardMetadata(
            byte_length=len(text.encode("utf-8")),
            line_count=text.count("\n") + 1 if text else 0,
            updated_at=0.0,
            source="unknown",
        )

    # ------------------------------------------------------------------
    # Screen copy (generic visible-screen selector)
    # ------------------------------------------------------------------

    def copy_screen(
        self, session_id: int, screen: bytes, selection: Selection, source: str = "screen"
    ) -> ClipboardMetadata:
        """Extract text from a 1000-byte screen-code buffer and store it.

        Endpoints are inclusive and may be given in any order. Line-wise
        selection copies whole display rows between the endpoints; rectangle
        selection copies the inclusive column range on each row. Trailing
        display padding is stripped from every row; interior spaces are
        preserved. Rows are joined with ``\\n``.
        """
        text = extract_screen_text(screen, selection)
        return self.set_text(session_id, text, source)

    # ------------------------------------------------------------------
    # Local BASIC paste (chunked, PETSCII-safe)
    # ------------------------------------------------------------------

    def to_local_petscii_chunk(
        self, session_id: int, offset: int, max_bytes: int
    ) -> PasteChunk:
        """Return a bounded PETSCII slice for local BASIC insertion.

        Newlines are converted to spaces (the local shell must never receive
        an injected RETURN). Characters with no PETSCII form become ``?``.
        The full converted byte string is sliced at ``[offset:offset+max_bytes]``
        and ``done`` is set once the slice reaches the end.
        """
        payload = text_to_local_petscii(self.get_text(session_id))
        offset = max(0, offset)
        if max_bytes <= 0:
            chunk = b""
        else:
            chunk = payload[offset : offset + max_bytes]
        done = offset + len(chunk) >= len(payload)
        return PasteChunk(
            data=chunk, offset=offset, total_bytes=len(payload), done=done
        )

    # ------------------------------------------------------------------
    # Helpers
    # ------------------------------------------------------------------

    def _normalize(self, text: str) -> str:
        """Normalise line endings to ``\\n`` and enforce the byte cap.

        Truncation is done on a UTF-8 byte boundary so the stored value is
        always valid UTF-8, then re-checked so a multi-byte char straddling
        the cap is dropped rather than split.
        """
        if text is None:
            return ""
        normalized = text.replace("\r\n", "\n").replace("\r", "\n")
        encoded = normalized.encode("utf-8")
        if len(encoded) <= self.max_bytes:
            return normalized
        clipped = encoded[: self.max_bytes]
        return clipped.decode("utf-8", errors="ignore")


# ── Module-level screen/PETSCII helpers (pure, unit-testable) ────────────


def extract_screen_text(screen: bytes, selection: Selection) -> str:
    """Extract selection text from a 1000-byte screen-code buffer.

    Pure function shared by :meth:`ClipboardService.copy_screen` and the
    tests. Coordinates are clamped to the screen, endpoints normalised so
    either may be marked first, and reverse-video cells decode identically to
    their normal counterparts.
    """
    data = bytes(screen[:SCREEN_SIZE]).ljust(SCREEN_SIZE, b"\x20")

    x0 = _clamp(selection.x0, 0, SCREEN_COLS - 1)
    x1 = _clamp(selection.x1, 0, SCREEN_COLS - 1)
    y0 = _clamp(selection.y0, 0, SCREEN_ROWS - 1)
    y1 = _clamp(selection.y1, 0, SCREEN_ROWS - 1)
    top, bottom = sorted((y0, y1))
    left, right = sorted((x0, x1))

    out_rows = []
    for row in range(top, bottom + 1):
        row_start = row * SCREEN_COLS
        if selection.mode == MODE_RECTANGLE:
            cells = data[row_start + left : row_start + right + 1]
        else:
            cells = data[row_start : row_start + SCREEN_COLS]
        line = "".join(screencode_to_char(b) for b in cells)
        out_rows.append(line.rstrip(" "))
    return "\n".join(out_rows)


def text_to_local_petscii(text: str) -> bytes:
    """Convert clipboard text to a PETSCII byte string for local insertion.

    Newlines become spaces; every remaining character is transliterated to
    ASCII then mapped to PETSCII. A character with no representable form
    becomes ``?`` (never silently dropped, per the spec).
    """
    if not text:
        return b""
    flattened = text.replace("\n", " ").replace("\r", " ")
    out = bytearray()
    for ch in flattened:
        if ch == "\t":
            out.append(ascii_to_petscii(ord(" ")))
            continue
        trans = transliterate(ch)
        if not trans:
            out.append(_PETSCII_QUESTION)
            continue
        for tc in trans:
            code = ord(tc)
            if 32 <= code < 127:
                out.append(ascii_to_petscii(code))
            else:
                out.append(_PETSCII_QUESTION)
    return bytes(out)


def _clamp(value: int, lo: int, hi: int) -> int:
    return max(lo, min(value, hi))


# ── Process-wide singleton ───────────────────────────────────────────────
_service_singleton: Optional[ClipboardService] = None


def get_clipboard_service() -> ClipboardService:
    """Return the process-wide :class:`ClipboardService` (created on demand).

    ``cloud_server`` configures ``max_bytes`` by calling
    :func:`configure_clipboard_service` at startup; everything else (command
    handler, apps) uses this accessor so they share one service and one host
    sink.
    """
    global _service_singleton
    if _service_singleton is None:
        _service_singleton = ClipboardService()
    return _service_singleton


def configure_clipboard_service(max_bytes: int = DEFAULT_MAX_BYTES) -> ClipboardService:
    """(Re)create the singleton with an explicit byte cap and return it."""
    global _service_singleton
    _service_singleton = ClipboardService(max_bytes=max_bytes)
    return _service_singleton
