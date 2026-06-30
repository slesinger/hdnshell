"""
Shared session state for C64 Cloud Server handlers
"""

from contextlib import contextmanager
import threading
from typing import Dict, Any

# Per-session state: session_id (int) -> state dict
_session_states: Dict[int, Dict[str, Any]] = {}
_session_locks: Dict[int, threading.RLock] = {}
_session_turn_locks: Dict[int, threading.Lock] = {}
_state_registry_lock = threading.Lock()


def _new_session_state() -> Dict[str, Any]:
    return {
        "active_module": None,
        "active_dir": None,
        "active_id": None,
        "zip_id": None,
        "zip_files": None,
        "chat_history": [],
        "clipboard": "",
    }


def _get_or_create_lock(session_id: int) -> threading.RLock:
    with _state_registry_lock:
        lock = _session_locks.get(session_id)
        if lock is None:
            lock = threading.RLock()
            _session_locks[session_id] = lock
        return lock


def _get_or_create_turn_lock(session_id: int) -> threading.Lock:
    with _state_registry_lock:
        lock = _session_turn_locks.get(session_id)
        if lock is None:
            lock = threading.Lock()
            _session_turn_locks[session_id] = lock
        return lock


def _get_or_create_state(session_id: int) -> Dict[str, Any]:
    with _state_registry_lock:
        state = _session_states.get(session_id)
        if state is None:
            state = _new_session_state()
            _session_states[session_id] = state
            _session_locks.setdefault(session_id, threading.RLock())
            _session_turn_locks.setdefault(session_id, threading.Lock())
        return state


@contextmanager
def locked_session_state(session_id: int):
    """Yield a session state dict while holding that session's lock."""
    lock = _get_or_create_lock(session_id)
    with lock:
        yield _get_or_create_state(session_id)


@contextmanager
def serialized_session_turn(session_id: int):
    """Serialize long-running per-session chat turns."""
    lock = _get_or_create_turn_lock(session_id)
    with lock:
        yield


def get_session_state(session_id: int) -> Dict[str, Any]:
    """
    Get the live state dict for a given session.

    Direct mutation of the returned dict is not thread-safe. Prefer
    locked_session_state(), update_session_state(), or get_session_state_copy().
    """
    return _get_or_create_state(session_id)


def get_session_state_copy(session_id: int) -> Dict[str, Any]:
    """Return a shallow snapshot with mutable nested lists copied."""
    with locked_session_state(session_id) as state:
        snapshot = dict(state)
        if isinstance(snapshot.get("chat_history"), list):
            snapshot["chat_history"] = list(snapshot["chat_history"])
        if isinstance(snapshot.get("zip_files"), list):
            snapshot["zip_files"] = list(snapshot["zip_files"])
        return snapshot


def update_session_state(session_id: int, **updates: Any) -> Dict[str, Any]:
    """Apply one or more key/value updates while holding the session lock."""
    with locked_session_state(session_id) as state:
        state.update(updates)
        return dict(state)


def append_chat_message(session_id: int, role: str, content: str) -> None:
    """Append one chat history entry while holding the session lock."""
    with locked_session_state(session_id) as state:
        history = state.setdefault("chat_history", [])
        history.append({"role": role, "content": content})


def get_clipboard(session_id: int) -> str:
    """Return the shared clipboard text for the given session."""
    with locked_session_state(session_id) as state:
        return state.get("clipboard", "")


def set_clipboard(session_id: int, text: str) -> None:
    """Set the shared clipboard text for the given session."""
    with locked_session_state(session_id) as state:
        state["clipboard"] = text
