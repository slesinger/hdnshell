"""
Tutorial content: the actual `Tutorial`/`Step` data for tut1..tut5.

See TUTORIALS_PLAN.md §8 for the authored hint/verify/demo text this module
builds with `tutorials.model.Tutorial` / `Step` and the `screen_contains`
/ `screen_matches` / `always_manual` / `prompt_device_is` /
`active_console_is` verify-predicate factories.

Phase 2 (TUTORIALS_PLAN.md §9): only tut2 ("Getting help") is wired up so
far, and every step uses `always_manual()` -- the coach runner doesn't call
`verify` at all yet in this phase, so this is mostly future-proofing. Real
verify predicates for tut2 (and tut1/tut3/tut4/tut5) land in Phase 3+.
`demo_keys` are already recorded here (PETSCII bytes) since Phase 3's `s`
handler will type them onto the C64; storing them now is harmless.

This module is imported by `tutorials/__init__.py` *after* `TUTORIALS` is
defined there, specifically so that `from . import TUTORIALS` below reaches
back into the (still-initializing) `tutorials` package and finds it. See
the import-order note at the top of `tutorials/__init__.py`.
"""

from . import TUTORIALS
from .model import Step, Tutorial, always_manual

tut2 = Tutorial(
    id="tut2",
    title="Getting help",
    blurb="Getting help",
    steps=[
        Step(
            hint='Type "help" for the command cheat-sheet.',
            verify=always_manual(),
            demo_keys=b"help\r",
        ),
        Step(
            hint='Type "help topics", then "help <topic>".',
            verify=always_manual(),
            demo_keys=b"help topics\r",
        ),
        Step(
            hint='Search the manual raw: "m:memcpy".',
            verify=always_manual(),
            demo_keys=b"m:memcpy\r",
        ),
        Step(
            hint=(
                "Just ask! Anything unrecognised goes to the AI. "
                'Try: "how do I mount a disk?" Press q when done.'
            ),
            verify=always_manual(),
            demo_keys=b"how do i mount a disk?\r",
        ),
    ],
)

TUTORIALS["tut2"] = tut2
