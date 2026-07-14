"""
Regression tests for C= (Commodore) modifier chords in the file-editor console.

The wedge forwards the raw C64 SHFLAG byte and the server swaps it into the
canonical ModifierFlags on ingest (swap_c64_modifiers), so C= arrives as
MOD_COMMODORE (0x04). These tests pin the chords the wedge change was made for:
C=+< / C=+> page up/down, C=+cursor word left/right.
"""

import os
import sys

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_APPS_DIR = os.path.join(_CLOUD_DIR, "server-apps")
if _APPS_DIR not in sys.path:
    sys.path.insert(0, _APPS_DIR)

from file_editor_console import (  # noqa: E402
    FileEditorConsole,
    KEY_SHIFT_COMA,
    KEY_SHIFT_PERIOD,
    KEY_CRSR_LT,
    MOD_COMMODORE,
)


def _editor_with_lines(n=60, cursor_y=40):
    e = FileEditorConsole(1, 0)
    e.doc.lines = ["line %d word" % i for i in range(n)]
    e.doc.cursor_y = cursor_y
    e.doc.cursor_x = 5
    return e


def test_cbm_page_up_down():
    """C=+< pages up, C=+> pages down (the reported broken chord)."""
    e = _editor_with_lines()
    start = e.doc.cursor_y

    e._key_edit(KEY_SHIFT_COMA, MOD_COMMODORE)  # C=+<
    up = e.doc.cursor_y
    assert up < start

    e._key_edit(KEY_SHIFT_PERIOD, MOD_COMMODORE)  # C=+>
    assert e.doc.cursor_y > up


def test_page_keys_without_modifier_do_not_page():
    """Without the C= modifier the same keys must not page."""
    e = _editor_with_lines()
    start = e.doc.cursor_y
    e._key_edit(KEY_SHIFT_COMA, 0x00)
    assert e.doc.cursor_y == start


def test_cbm_cursor_word_motion_differs_from_plain():
    """C=+cursor_left jumps by word; plain cursor_left steps one column."""
    e = _editor_with_lines()  # each line is "line NN word"
    e.doc.cursor_x = 2

    e._key_edit(KEY_CRSR_LT, 0x00)  # plain: one column left
    assert e.doc.cursor_x == 1

    e.doc.cursor_x = 2
    e._key_edit(KEY_CRSR_LT, MOD_COMMODORE)  # C=+cursor: word motion (jumps > 1)
    assert e.doc.cursor_x != 1
