"""
cloud/tutorials package.

Data model (`Screen`, `Step`, `Tutorial`, verify predicate helpers) lives in
`model.py`; the actual tut1..tut5 content lives in `content.py` and is
registered here in `TUTORIALS`. The coach runner (`session.py`,
`tutorial_handler.py`) that drives these against a live C64U lands in later
phases -- see TUTORIALS_PLAN.md.

Import order matters here: `TUTORIALS` must exist as an attribute of this
package *before* `content` is imported, because `content.py` reaches back
into this (still-initializing) package with `from . import TUTORIALS` to
register each tutorial as a side effect of being imported. That's why
`from . import content` is the last line in this file -- see
TUTORIALS_PLAN.md §9 Phase 2 / Task 2c.
"""

from typing import Dict

from .model import (
    Screen,
    Step,
    Tutorial,
    active_console_is,
    always_manual,
    prompt_device_is,
    screen_contains,
    screen_matches,
)

# Populated as a side effect of importing `content` below (each tutorial's
# content module assigns `TUTORIALS["tutN"] = ...`).
TUTORIALS: Dict[str, Tutorial] = {}

from . import content  # noqa: E402,F401 - populates TUTORIALS as a side effect

__all__ = [
    "TUTORIALS",
    "Screen",
    "Step",
    "Tutorial",
    "screen_contains",
    "screen_matches",
    "always_manual",
    "prompt_device_is",
    "active_console_is",
]
