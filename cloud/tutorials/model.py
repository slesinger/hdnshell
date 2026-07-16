"""
Tutorials data model: `Screen` decoder, `Step`/`Tutorial` dataclasses, and a
small library of `verify` predicate factories.

This module is pure Python (no network/DMA calls) so it can be unit-tested
off-hardware. See TUTORIALS_PLAN.md §3/§4 for the design this implements.
"""

import re
from dataclasses import dataclass, field
from typing import Callable, Dict, List, Optional

from sdk.petscii import ascii_to_screencode

SCREEN_COLS = 40
SCREEN_ROWS = 25
SCREEN_SIZE = SCREEN_COLS * SCREEN_ROWS  # 1000

# Screen-code bytes use bit 7 (0x80) as the reverse-video flag; the glyph
# itself lives in the low 7 bits.
_REVERSE_VIDEO_MASK = 0x80
_SCREENCODE_MASK = 0x7F

_SCREENCODE_TO_ASCII: Optional[Dict[int, str]] = None


def _screencode_to_ascii_map() -> Dict[int, str]:
    """
    Build (and cache) a screen-code (0-127) -> printable ASCII character map.

    There's no ready-made inverse of `ascii_to_screencode` in `sdk/petscii.py`,
    so this reverses it the same way `agent_tools._build_screencode_to_ascii_map`
    does: run every printable ASCII code through `ascii_to_screencode` and
    remember the first ASCII char that lands on each screen code. Codes with
    no printable-ASCII source (graphics chars, PETSCII lowercase-mode
    letters, etc.) fall back to a space -- good enough for verify predicates
    that do substring/regex matching on visible text.
    """
    global _SCREENCODE_TO_ASCII
    if _SCREENCODE_TO_ASCII is not None:
        return _SCREENCODE_TO_ASCII

    mapping: Dict[int, str] = {}
    for code in range(0x20, 0x7F):
        sc = ascii_to_screencode(code) & _SCREENCODE_MASK
        if sc not in mapping:
            mapping[sc] = chr(code)

    for i in range(0x80):
        mapping.setdefault(i, " ")

    _SCREENCODE_TO_ASCII = mapping
    return mapping


def screencode_to_ascii(screen_code: int) -> str:
    """
    Convert a single C64 screen-code byte to a printable ASCII character.

    Strips the reverse-video bit (0x80) before lookup. Unknown/unmapped
    codes decode to a space so callers can always treat the result as
    plain text.
    """
    mapping = _screencode_to_ascii_map()
    sc = screen_code & _SCREENCODE_MASK
    return mapping.get(sc, " ")


class Screen:
    """
    Decodes a live 1000-byte C64 screen-code buffer ($0400) into ASCII text.

    Optionally also holds the parallel 1000-byte color buffer ($D800); the
    color buffer isn't used for decoding today but is accepted so callers
    (the coach runner) can pass both without callers needing a second type.
    """

    def __init__(self, screen_bytes, color_bytes=None):
        data = bytes(screen_bytes)[:SCREEN_SIZE]
        if len(data) < SCREEN_SIZE:
            data = data.ljust(SCREEN_SIZE, b"\x20")
        self._screen: bytes = data
        self._color: Optional[bytes] = bytes(color_bytes) if color_bytes is not None else None
        self._rows: Optional[List[str]] = None

    @property
    def raw(self) -> bytes:
        """The raw 1000-byte screen-code buffer (post pad/truncate)."""
        return self._screen

    @property
    def color(self) -> Optional[bytes]:
        """The raw 1000-byte color buffer, if one was supplied."""
        return self._color

    @property
    def rows(self) -> List[str]:
        """
        The 25 decoded rows (40 screen columns each), trailing spaces
        stripped from each row. Reverse-video (0x80) is stripped before
        decoding so highlighted text still matches plain substrings.
        """
        if self._rows is None:
            decoded = []
            for r in range(SCREEN_ROWS):
                start = r * SCREEN_COLS
                chunk = self._screen[start : start + SCREEN_COLS]
                line = "".join(screencode_to_ascii(b) for b in chunk)
                decoded.append(line.rstrip())
            self._rows = decoded
        return self._rows

    @property
    def text(self) -> str:
        """Full decoded screen as ASCII text, one line per row, joined by \\n."""
        return "\n".join(self.rows)

    def __repr__(self) -> str:
        return f"Screen(rows={len(self.rows)})"


@dataclass
class Step:
    """One step of a coached tutorial. See TUTORIALS_PLAN.md §4."""

    hint: str
    verify: Callable[[Screen], bool]
    demo_keys: Optional[bytes] = None
    on_enter: Optional[Callable] = None


@dataclass
class Tutorial:
    """A named sequence of coached `Step`s. See TUTORIALS_PLAN.md §4."""

    id: str
    title: str
    blurb: str
    steps: List[Step]
    requires: List[str] = field(default_factory=list)


# ----------------------------------------------------------------------
# Verify predicate factories
#
# Each of these RETURNS a `Callable[[Screen], bool]` -- call the factory
# once when building tutorial content, and pass the returned callable as
# `Step.verify`.
# ----------------------------------------------------------------------


def screen_contains(*substrings: str, mode: str = "any") -> Callable[[Screen], bool]:
    """
    Build a verify predicate that checks (case-insensitively) whether
    `screen.text` contains the given substring(s).

    `mode="any"` (default): True if at least one substring is present.
    `mode="all"`: True only if every substring is present.
    """
    needles = [s.lower() for s in substrings]

    def _verify(screen: Screen) -> bool:
        haystack = screen.text.lower()
        if mode == "all":
            return all(needle in haystack for needle in needles)
        return any(needle in haystack for needle in needles)

    return _verify


def screen_matches(regex: str) -> Callable[[Screen], bool]:
    """
    Build a verify predicate that does a case-insensitive `re.search` for
    `regex` over `screen.text` (which spans all 25 rows, newline-joined).
    """
    pattern = re.compile(regex, re.IGNORECASE)

    def _verify(screen: Screen) -> bool:
        return pattern.search(screen.text) is not None

    return _verify


def always_manual() -> Callable[[Screen], bool]:
    """
    Build a verify predicate that never auto-advances (always False).

    Used for narration-only steps where the user must press `n` themselves.
    """

    def _verify(screen: Screen) -> bool:
        return False

    return _verify


def prompt_device_is(*letters: str) -> Callable[[Screen], bool]:
    """
    Build a verify predicate that detects the active drive/device letter
    from the shell screen (tut1 step 1: "type #u or #s").

    The wedge doesn't render a persistent "X:>"-style prompt; per
    docs/user_manual/dos.md the device letter only becomes visible on
    screen when the user types `#` (prints the current device) or
    `#<letter>` (switches device, echoing the command). Heuristic: scan
    the screen's non-empty rows bottom-up for a `#` immediately followed
    by one of the requested letters, case-insensitive.

    # TODO(hw): confirm the exact echoed prompt/device format on real
    # hardware once tut1 is wired up (Phase 3) and tighten this regex.
    """
    wanted = {letter.lower() for letter in letters}
    pattern = re.compile(r"#\s*([a-z0-9])", re.IGNORECASE)

    def _verify(screen: Screen) -> bool:
        for line in reversed(screen.rows):
            if not line.strip():
                continue
            match = pattern.search(line)
            if match and match.group(1).lower() in wanted:
                return True
        return False

    return _verify


def active_console_is(console_id: int, session_id: int = 0) -> Callable[[Screen], bool]:
    """
    Build a verify predicate for tut5-style steps ("press C=+CTRL+4") that
    is True once `ConsoleManager` reports `console_id` active for
    `session_id`.

    The `Screen` argument is accepted (for signature compatibility with
    every other verify predicate -- `TutorialSession` calls all of them as
    `verify(screen)`) but unused: which console is active lives in
    `ConsoleManager`, not the screen buffer.

    # TODO: session_id isn't known at content.py authoring time -- the
    # real TutorialSession (Phase 5, per-session background runner) will
    # need to either rebind this closure's session_id when a tutorial
    # starts, or this helper's signature may need to change to a
    # (screen, session_id) two-arg form called differently by the runner.
    # Not settled yet; only used starting tut5 (Phase 4).
    """

    def _verify(screen: Screen) -> bool:  # noqa: ARG001 - Screen unused by design
        try:
            from sdk.console_manager import ConsoleManager

            return ConsoleManager.instance()._active.get(session_id) == console_id
        except Exception:
            return False

    return _verify
