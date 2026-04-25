"""
Shared session-level toast state store.

This module holds the session-toast dict so that both ServerConsole
(which applies overlays in get_screen_data/get_color_data) and
ConsoleManager (which writes toast entries) can share the same state
without any circular imports.

API
---
    put(session_id, text, expires, color)  -- store or replace a toast
    get(session_id) -> dict | None         -- retrieve current toast entry
    remove(session_id)                     -- dismiss immediately
    active(session_id) -> bool             -- True if a live toast exists
"""

import threading
import time
from typing import Dict, Optional

_lock: threading.Lock = threading.Lock()
_store: Dict[int, dict] = {}  # session_id -> {text, expires, color}


def put(session_id: int, text: str, expires: float, color: int) -> None:
    """Store (or replace) a session toast for *session_id*."""
    with _lock:
        _store[session_id] = {"text": text, "expires": expires, "color": color}


def get(session_id: int) -> Optional[dict]:
    """Return the raw toast dict for *session_id*, or None."""
    with _lock:
        return _store.get(session_id)


def remove(session_id: int) -> None:
    """Dismiss the session toast for *session_id* immediately."""
    with _lock:
        _store.pop(session_id, None)


def active(session_id: int) -> bool:
    """Return True if a non-expired toast exists for *session_id*."""
    with _lock:
        entry = _store.get(session_id)
    if not entry:
        return False
    if time.monotonic() >= entry["expires"]:
        remove(session_id)
        return False
    return True
