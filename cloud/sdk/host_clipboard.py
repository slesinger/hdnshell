"""
Host (desktop) clipboard synchronisation for HDN Shell (GH #18).

The HDN Server runs on a Linux / macOS / Windows host. When a desktop
clipboard backend is available, this module keeps the host clipboard and the
per-session HDN clipboard (owned by :mod:`sdk.clipboard`) in sync:

  * text copied on the desktop silently becomes the C64/app clipboard, and
  * a C64/app copy silently becomes the desktop clipboard.

The host clipboard is a single global value while the HDN clipboard is
per-C64-session. First-release policy: host changes are pushed to the *most
recently active* session (a C64/app copy makes that session active). This is
documented in the user manual and can be revisited if multi-client workflows
become a supported thing.

Design rules (from the issue's developer plan):

  * Poll only when host sync is enabled and a backend is available.
  * Detect changes by a normalised-text hash, not by raw equality.
  * Record the last host-written hash so a C64 copy mirrored to the host does
    not loop straight back in.
  * Log backend unavailability once at startup, then leave the server
    clipboard fully functional.
  * NEVER crash the server because desktop clipboard access failed.
"""

from __future__ import annotations

import hashlib
import logging
import platform
import shutil
import subprocess
import threading
from typing import Optional

logger = logging.getLogger(__name__)


def _norm_hash(text: str) -> str:
    """Stable hash of clipboard text after line-ending normalisation."""
    normalized = (text or "").replace("\r\n", "\n").replace("\r", "\n")
    return hashlib.sha1(normalized.encode("utf-8", "replace")).hexdigest()


# ── Backend adapter interface ────────────────────────────────────────────


class HostClipboard:
    """Abstract platform clipboard adapter."""

    def is_available(self) -> bool:  # pragma: no cover - interface
        return False

    def read_text(self) -> Optional[str]:  # pragma: no cover - interface
        return None

    def write_text(self, text: str) -> None:  # pragma: no cover - interface
        raise NotImplementedError


class _CommandClipboard(HostClipboard):
    """Clipboard backend driven by external read/write commands.

    Covers macOS (``pbpaste``/``pbcopy``) and Linux (Wayland ``wl-paste``/
    ``wl-copy`` or X11 ``xclip``/``xsel``). Availability is decided by whether
    the read/write executables are present on ``PATH``.
    """

    def __init__(self, name: str, read_cmd: list, write_cmd: list):
        self.name = name
        self._read_cmd = read_cmd
        self._write_cmd = write_cmd

    def is_available(self) -> bool:
        exe = self._read_cmd[0]
        return shutil.which(exe) is not None

    def read_text(self) -> Optional[str]:
        try:
            result = subprocess.run(
                self._read_cmd,
                capture_output=True,
                timeout=2.0,
            )
        except Exception:
            logger.debug("host clipboard read failed (%s)", self.name, exc_info=True)
            return None
        if result.returncode != 0:
            return None
        return result.stdout.decode("utf-8", errors="replace")

    def write_text(self, text: str) -> None:
        try:
            subprocess.run(
                self._write_cmd,
                input=text.encode("utf-8"),
                timeout=2.0,
                check=False,
            )
        except Exception:
            logger.debug("host clipboard write failed (%s)", self.name, exc_info=True)


class _WindowsClipboard(HostClipboard):
    """Windows clipboard backend via the Win32 API (``ctypes``)."""

    def is_available(self) -> bool:
        return platform.system() == "Windows"

    def read_text(self) -> Optional[str]:  # pragma: no cover - Windows only
        try:
            import ctypes

            CF_UNICODETEXT = 13
            user32 = ctypes.windll.user32
            kernel32 = ctypes.windll.kernel32
            if not user32.OpenClipboard(0):
                return None
            try:
                handle = user32.GetClipboardData(CF_UNICODETEXT)
                if not handle:
                    return None
                ptr = kernel32.GlobalLock(handle)
                if not ptr:
                    return None
                try:
                    return ctypes.c_wchar_p(ptr).value
                finally:
                    kernel32.GlobalUnlock(handle)
            finally:
                user32.CloseClipboard()
        except Exception:
            logger.debug("windows clipboard read failed", exc_info=True)
            return None

    def write_text(self, text: str) -> None:  # pragma: no cover - Windows only
        try:
            import ctypes

            CF_UNICODETEXT = 13
            GMEM_MOVEABLE = 0x0002
            user32 = ctypes.windll.user32
            kernel32 = ctypes.windll.kernel32
            if not user32.OpenClipboard(0):
                return
            try:
                user32.EmptyClipboard()
                data = text.encode("utf-16-le") + b"\x00\x00"
                handle = kernel32.GlobalAlloc(GMEM_MOVEABLE, len(data))
                ptr = kernel32.GlobalLock(handle)
                ctypes.memmove(ptr, data, len(data))
                kernel32.GlobalUnlock(handle)
                user32.SetClipboardData(CF_UNICODETEXT, handle)
            finally:
                user32.CloseClipboard()
        except Exception:
            logger.debug("windows clipboard write failed", exc_info=True)


def detect_backend() -> Optional[HostClipboard]:
    """Return the best available host clipboard backend, or ``None``.

    Priority order per the plan: Windows Win32, then macOS ``pbcopy``/
    ``pbpaste``, then Linux Wayland, then Linux X11. Returns ``None`` on a
    headless host with no usable backend.
    """
    system = platform.system()
    if system == "Windows":
        win = _WindowsClipboard()
        return win if win.is_available() else None
    if system == "Darwin":
        mac = _CommandClipboard("pbcopy", ["pbpaste"], ["pbcopy"])
        return mac if mac.is_available() else None
    # Linux / other Unix: Wayland first, then X11.
    candidates = [
        _CommandClipboard(
            "wl-clipboard", ["wl-paste", "--no-newline"], ["wl-copy"]
        ),
        _CommandClipboard(
            "xclip", ["xclip", "-selection", "clipboard", "-o"],
            ["xclip", "-selection", "clipboard"],
        ),
        _CommandClipboard(
            "xsel", ["xsel", "--clipboard", "--output"],
            ["xsel", "--clipboard", "--input"],
        ),
    ]
    for backend in candidates:
        if backend.is_available():
            return backend
    return None


# ── Background synchronisation watcher ───────────────────────────────────


class HostClipboardSync:
    """Bidirectional host <-> HDN clipboard bridge.

    ``service`` is a :class:`sdk.clipboard.ClipboardService`. ``backend`` is a
    :class:`HostClipboard` (injected in tests with a fake). When started, the
    watcher registers itself as the service's host sink (server->host) and
    polls the backend on a background thread (host->server).
    """

    def __init__(
        self,
        service,
        backend: Optional[HostClipboard] = None,
        enabled: bool = True,
        poll_interval_ms: int = 500,
    ):
        self.service = service
        self.enabled = enabled
        self.poll_interval = max(0.05, poll_interval_ms / 1000.0)
        self._backend = backend
        self._thread: Optional[threading.Thread] = None
        self._stop = threading.Event()
        # Hash of the last value we wrote to the host, so our own echo does
        # not get re-imported. Also the hash of the last host value we saw,
        # so we only react to genuine changes.
        self._last_host_written_hash: Optional[str] = None
        self._last_seen_hash: Optional[str] = None

    # ------------------------------------------------------------------
    # Lifecycle
    # ------------------------------------------------------------------

    def start(self) -> bool:
        """Start synchronisation. Returns True if the watcher is polling.

        If sync is disabled or no backend is available the service clipboard
        still works fully; this just returns False and logs once.
        """
        if not self.enabled:
            logger.info("host clipboard sync disabled by config")
            return False
        if self._backend is None:
            self._backend = detect_backend()
        if self._backend is None or not self._backend.is_available():
            logger.info(
                "no host clipboard backend available; server clipboard still active"
            )
            return False

        # server -> host: mirror C64/app copies to the desktop.
        self.service.register_host_sink(self._on_server_copy)

        # Seed the last-seen hash so we don't import whatever is already on
        # the host clipboard as a spurious "change" on the first tick.
        try:
            current = self._backend.read_text()
            if current is not None:
                self._last_seen_hash = _norm_hash(current)
        except Exception:
            logger.debug("initial host clipboard read failed", exc_info=True)

        self._thread = threading.Thread(
            target=self._run, name="host-clipboard-sync", daemon=True
        )
        self._thread.start()
        logger.info("host clipboard sync started (backend=%s)", type(self._backend).__name__)
        return True

    def stop(self) -> None:
        """Stop the watcher and detach the host sink."""
        self._stop.set()
        self.service.register_host_sink(None)
        if self._thread is not None:
            self._thread.join(timeout=2.0)

    # ------------------------------------------------------------------
    # server -> host
    # ------------------------------------------------------------------

    def _on_server_copy(self, session_id: int, text: str) -> None:
        """Host sink: write a C64/app copy to the desktop clipboard."""
        if self._backend is None:
            return
        self._last_host_written_hash = _norm_hash(text)
        # Suppress re-import of our own write on the next poll.
        self._last_seen_hash = self._last_host_written_hash
        try:
            self._backend.write_text(text)
        except Exception:
            logger.debug("host clipboard write failed", exc_info=True)

    # ------------------------------------------------------------------
    # host -> server
    # ------------------------------------------------------------------

    def poll_once(self) -> bool:
        """Import a genuine host clipboard change into the active session.

        Returns True if a change was imported. Public so tests can drive the
        watcher deterministically without the polling thread.
        """
        if self._backend is None:
            return False
        try:
            text = self._backend.read_text()
        except Exception:
            logger.debug("host clipboard poll read failed", exc_info=True)
            return False
        if text is None:
            return False

        h = _norm_hash(text)
        if h == self._last_seen_hash:
            return False  # no change
        self._last_seen_hash = h
        if h == self._last_host_written_hash:
            return False  # our own echo, not a genuine host change

        target = self.service.last_active_session
        if target is None:
            # No C64 session has copied yet; nothing to sync into.
            return False
        # source="host" ensures this does NOT mirror back out to the host.
        self.service.set_text(target, text, source="host")
        logger.debug("imported host clipboard change into session %s", target)
        return True

    def _run(self) -> None:
        while not self._stop.wait(self.poll_interval):
            try:
                self.poll_once()
            except Exception:
                logger.debug("host clipboard poll cycle failed", exc_info=True)
