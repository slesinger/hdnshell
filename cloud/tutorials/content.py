"""
Tutorial content: the actual `Tutorial`/`Step` data for tut1..tut5.

See TUTORIALS_PLAN.md §8 for the authored hint/verify/demo text this module
builds with `tutorials.model.Tutorial` / `Step` and the `screen_contains`
/ `screen_matches` / `always_manual` / `prompt_device_is` /
`active_console_is` verify-predicate factories.

Phase 3 (TUTORIALS_PLAN.md §9): tut2 ("Getting help") has real
auto-advance verify predicates, and tut1 ("Disks & games") is wired up
for the first time. tut3/tut4/tut5 are still unauthored (Phase 4+).
`demo_keys` (PETSCII bytes) are typed onto the C64 by `TutorialSession.show()`
(the `s` nav command).

This module is imported by `tutorials/__init__.py` *after* `TUTORIALS` is
defined there, specifically so that `from . import TUTORIALS` below reaches
back into the (still-initializing) `tutorials` package and finds it. See
the import-order note at the top of `tutorials/__init__.py`.
"""

from . import TUTORIALS
from .model import Step, Tutorial, always_manual, prompt_device_is, screen_contains

tut1 = Tutorial(
    id="tut1",
    title="Disks & games: browse, mount, run",
    blurb="Disks & games: browse, mount, run",
    steps=[
        Step(
            hint='Pick a drive: type "#u" (USB) or "#s" (SD).',
            # TODO(hw): confirm the exact echoed prompt/device format on
            # real hardware -- see prompt_device_is()'s own TODO(hw) note.
            verify=prompt_device_is("u", "s", "t", "f", "h"),
            demo_keys=b"#u\r",
        ),
        Step(
            hint='Type "ll" to list this drive.',
            # Approximation: a directory listing shows filenames with one
            # of these common C64 image/program extensions. Fuzzy on
            # purpose -- exact listing format wasn't confirmed against
            # real hardware output for this plan.
            # TODO(hw): confirm ll's real on-screen format and tighten
            # this (e.g. a size-column regex) if this proves too loose
            # or too strict.
            verify=screen_contains(".d64", ".prg", ".d81", ".crt"),
            demo_keys=b"ll\r",
        ),
        Step(
            hint='Too many? "ll a*" filters by prefix. Press n to skip.',
            # Reliably detecting "the listing changed" from a screen diff
            # alone is hard and this step is optional/skippable anyway --
            # manual advance (n) is the safer choice over a flaky heuristic.
            # TODO(hw): revisit if a robust "filtered listing" signal
            # turns up during hardware testing.
            verify=always_manual(),
            demo_keys=b"ll a*\r",
        ),
        Step(
            hint=(
                'Mount a disk image: put "mnt" before its name, e.g. '
                '"mnt game.d64". Case doesn\'t matter.'
            ),
            # Approximation: look for a mount confirmation or the absence
            # of an error keyword. TODO(hw): confirm the real mnt success
            # message text and tighten this.
            verify=screen_contains("mounted", "ok"),
            # No \r -- leave the filename for the user to type themselves.
            demo_keys=b"mnt ",
        ),
        Step(
            hint='See inside the disk: "$" or "ll".',
            # Same listing approximation as step 2.
            # TODO(hw): confirm on hardware once mount+listing content is known.
            verify=screen_contains(".d64", ".prg", ".d81", ".crt"),
            demo_keys=b"$\r",
        ),
        Step(
            hint='Run the first program: "^*" (or "^name").',
            # Detecting "a program started" from a screen snapshot alone
            # is unreliable (games clear/redraw the screen in every
            # imaginable way) -- manual advance is safer than a flaky
            # heuristic here.
            # TODO(hw): revisit if a robust "program is running" signal
            # (e.g. a specific memory location) turns up during hardware
            # testing.
            verify=always_manual(),
            demo_keys=b"^*\r",
        ),
        Step(
            hint=(
                "Shell stepped aside so the game runs clean. Back at "
                'BASIC, type "HONDANI" to re-arm the app keys. '
                "Done -- press q."
            ),
            verify=always_manual(),
            demo_keys=b"HONDANI\r",
        ),
    ],
)

TUTORIALS["tut1"] = tut1

tut2 = Tutorial(
    id="tut2",
    title="Getting help",
    blurb="Getting help",
    steps=[
        Step(
            hint='Type "help" for the command cheat-sheet.',
            # NOT screen_contains("HDN Shell", "Help") -- that collides
            # with the tutorials menu header ("HDN Shell RR - Tutorials"),
            # which is still on screen the instant this step becomes
            # current (the user just typed "tut2" from that menu), so it
            # would fire before the user typed anything (real hardware
            # trace, hdnsh 2026-07-16: this is exactly what happened).
            # This phrase only appears in HelpHandler.HELP_TEXT's lower
            # body copy ("...is sent to the AI assistant, so the..."),
            # nowhere near the menu text, and (per TUTORIALS_PLAN.md's
            # box geometry note) that line renders well below/left of the
            # toaster box's top-right ~6x30 footprint, so Task 1's
            # blanking can't accidentally erase it either.
            verify=screen_contains("is sent to the AI assistant"),
            demo_keys=b"help\r",
        ),
        Step(
            hint='Type "help topics", then "help <topic>".',
            # HELP_TEXT (step 1's own demo output) literally contains the
            # phrase "help topics" ("help topics    List all help
            # topics"), so this predicate can be trivially true the
            # moment this step becomes current if the user already ran
            # "help". Entry suppression (_latch_entry_satisfied() /
            # Task 2) is exactly what stops that from firing immediately
            # -- left as screen_contains("Help topics") on purpose.
            verify=screen_contains("Help topics"),
            demo_keys=b"help topics\r",
        ),
        Step(
            hint='Search the manual raw: "m:memcpy".',
            # Same story as step 2: HELP_TEXT's "m:<phrase>" example line
            # is "m: memcpy", so "memcpy" can already be on screen from
            # step 1's demo. Entry suppression covers this too.
            verify=screen_contains("memory-operations", "memcpy"),
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
