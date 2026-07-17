"""
Unit tests for tutorials.model: the Screen decoder and verify predicate
factories. Pure Python -- no hardware, no network_helper.
"""

from sdk.petscii import ascii_to_screencode
from tutorials.model import (
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    Screen,
    active_console_is,
    always_manual,
    screen_contains,
    screen_matches,
)


def _blank_screen_bytes() -> bytearray:
    """A 1000-byte screencode buffer filled with spaces."""
    space_sc = ascii_to_screencode(ord(" "))
    return bytearray([space_sc] * SCREEN_SIZE)


def _write_row(buf: bytearray, row: int, text: str, reverse: bool = False) -> None:
    """
    Write `text` (plain ASCII) into `buf` at `row`, screencode-encoded,
    left-justified, truncated/padded to SCREEN_COLS. If `reverse`, set the
    reverse-video bit (0x80) on every screencode byte written.
    """
    assert 0 <= row < SCREEN_ROWS
    start = row * SCREEN_COLS
    line = text[:SCREEN_COLS].ljust(SCREEN_COLS)
    for i, ch in enumerate(line):
        sc = ascii_to_screencode(ord(ch))
        if reverse:
            sc |= 0x80
        buf[start + i] = sc


def test_screen_text_and_rows_round_trip():
    buf = _blank_screen_bytes()
    _write_row(buf, 0, "10 FREE BLOCKS")
    _write_row(buf, 1, "READY.")

    screen = Screen(bytes(buf))

    assert len(screen.rows) == SCREEN_ROWS
    assert screen.rows[0] == "10 FREE BLOCKS"
    assert screen.rows[1] == "READY."
    # Untouched rows decode to empty (all spaces, stripped).
    assert screen.rows[2] == ""

    # .text is all 25 rows, newline-joined, row structure preserved.
    lines = screen.text.split("\n")
    assert len(lines) == SCREEN_ROWS
    assert lines[0] == "10 FREE BLOCKS"
    assert lines[1] == "READY."


def test_screen_decodes_reverse_video_row():
    buf = _blank_screen_bytes()
    _write_row(buf, 3, "MOUNTED OK", reverse=True)

    screen = Screen(bytes(buf))

    # Reverse-video bit (0x80) must be stripped before decoding, so the
    # text reads the same as the non-reversed case.
    assert screen.rows[3] == "MOUNTED OK"


def test_screen_accepts_bytearray_and_short_buffers():
    # Short buffer should be padded, not raise.
    screen = Screen(bytearray(b"\x00" * 40))
    assert len(screen.rows) == SCREEN_ROWS
    assert len(screen.raw) == SCREEN_SIZE


def test_screen_contains_any_mode_default():
    buf = _blank_screen_bytes()
    _write_row(buf, 5, "10 BLOCKS FREE")
    screen = Screen(bytes(buf))

    verify_hit = screen_contains("free")
    verify_miss = screen_contains("error")

    assert verify_hit(screen) is True
    assert verify_miss(screen) is False


def test_screen_contains_is_case_insensitive():
    buf = _blank_screen_bytes()
    _write_row(buf, 0, "READY.")
    screen = Screen(bytes(buf))

    assert screen_contains("ready")(screen) is True
    assert screen_contains("READY")(screen) is True


def test_screen_contains_mode_all_requires_every_substring():
    buf = _blank_screen_bytes()
    _write_row(buf, 0, "GAME.PRG")
    _write_row(buf, 1, "DEMO.D64")
    screen = Screen(bytes(buf))

    both_present = screen_contains("game.prg", "demo.d64", mode="all")
    one_missing = screen_contains("game.prg", "missing.txt", mode="all")
    any_mode = screen_contains("game.prg", "missing.txt", mode="any")

    assert both_present(screen) is True
    assert one_missing(screen) is False
    assert any_mode(screen) is True


def test_screen_matches_regex():
    buf = _blank_screen_bytes()
    _write_row(buf, 10, "664 BLOCKS FREE")
    screen = Screen(bytes(buf))

    verify = screen_matches(r"\d+\s+BLOCKS\s+FREE")
    assert verify(screen) is True

    verify_miss = screen_matches(r"\d+\s+ERRORS")
    assert verify_miss(screen) is False


def test_screen_matches_is_case_insensitive():
    buf = _blank_screen_bytes()
    _write_row(buf, 0, "hello world")
    screen = Screen(bytes(buf))

    assert screen_matches(r"HELLO WORLD")(screen) is True


def test_screen_matches_word_boundary_excludes_c64():
    # tut3 step 1 ("i:how much is 96-32?") verifies with \b64\b so it
    # can't fire just because "C64" is showing up somewhere else on
    # screen -- "6" right after "C" isn't a word boundary.
    buf = _blank_screen_bytes()
    _write_row(buf, 0, "WELCOME TO YOUR C64")
    screen_with_c64_only = Screen(bytes(buf))

    buf2 = _blank_screen_bytes()
    _write_row(buf2, 0, "THE ANSWER IS 64")
    screen_with_standalone_64 = Screen(bytes(buf2))

    verify = screen_matches(r"\b64\b")
    assert verify(screen_with_c64_only) is False
    assert verify(screen_with_standalone_64) is True


def test_always_manual_never_advances():
    buf = _blank_screen_bytes()
    _write_row(buf, 0, "ANYTHING AT ALL")
    screen = Screen(bytes(buf))

    verify = always_manual()
    assert verify(screen) is False
    # Still False regardless of what's on screen.
    assert verify(Screen(bytes(_blank_screen_bytes()))) is False


def test_active_console_is_carries_console_id_marker():
    # TutorialSession._run_verify() special-cases this via the
    # `_console_id` marker rather than ever calling the closure with the
    # right session_id baked in (Tutorial/Step objects are shared across
    # every session -- see the factory's own docstring).
    verify = active_console_is(4)
    assert verify._console_id == 4


def test_active_console_is_fallback_closure_is_safe_but_never_true():
    # If something calls the closure directly (bypassing TutorialSession's
    # marker-based special case), it must degrade to a safe False rather
    # than crash or accidentally match a real session.
    from sdk.console_manager import ConsoleManager

    ConsoleManager.reset()
    verify = active_console_is(4)
    screen = Screen(bytes(_blank_screen_bytes()))
    assert verify(screen) is False
