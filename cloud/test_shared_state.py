"""Focused tests for shared session state helpers."""

from sdk.shared_state import (
    append_chat_message,
    get_session_state_copy,
    set_clipboard,
    get_clipboard,
    update_session_state,
)


def test_session_state_copy_detaches_mutable_values():
    session_id = 91001

    update_session_state(session_id, zip_files=["a.prg"], chat_history=[])
    append_chat_message(session_id, "user", "hello")

    snapshot = get_session_state_copy(session_id)
    snapshot["zip_files"].append("b.prg")
    snapshot["chat_history"].append({"role": "assistant", "content": "world"})

    fresh_snapshot = get_session_state_copy(session_id)
    assert fresh_snapshot["zip_files"] == ["a.prg"]
    assert fresh_snapshot["chat_history"] == [{"role": "user", "content": "hello"}]


def test_clipboard_round_trip_uses_locked_helpers():
    session_id = 91002

    set_clipboard(session_id, "copy me")

    assert get_clipboard(session_id) == "copy me"


def test_update_session_state_applies_multiple_fields_atomically():
    session_id = 91003

    update_session_state(
        session_id,
        active_module="c",
        active_dir="release",
        active_id=123,
        zip_id=456,
    )

    snapshot = get_session_state_copy(session_id)
    assert snapshot["active_module"] == "c"
    assert snapshot["active_dir"] == "release"
    assert snapshot["active_id"] == 123
    assert snapshot["zip_id"] == 456
