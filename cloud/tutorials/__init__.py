"""
cloud/tutorials package.

Data model (`Screen`, `Step`, `Tutorial`, verify predicate helpers) lives in
`model.py`; the actual tut1..tut5 content lives in `content.py` and is
registered here in `TUTORIALS`. The coach runner (`session.py`,
`tutorial_handler.py`) that drives these against a live C64U lands in later
phases -- see TUTORIALS_PLAN.md.
"""

from typing import Dict

from .content import *  # noqa: F401,F403 - re-export content symbols, if any
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

# Populated in Phase 2+ as tutorial content is authored (content.py).
TUTORIALS: Dict[str, Tutorial] = {}

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
