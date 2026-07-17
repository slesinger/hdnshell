"""
Tutorial content: the actual `Tutorial`/`Step` data for tut1..tut5.

See TUTORIALS_PLAN.md §8 for the authored hint/verify/demo text this module
builds with `tutorials.model.Tutorial` / `Step` and the `screen_contains`
/ `screen_matches` / `always_manual` / `prompt_device_is` /
`active_console_is` verify-predicate factories.

Phase 4 (TUTORIALS_PLAN.md §9): all five tutorials are authored. tut1/tut2
were wired up in Phase 3; tut3 ("Ask me anything"), tut4 ("Find a demo on
CSDB, run & keep it") and tut5 ("Live on your C64") were added here.
`demo_keys` (PETSCII bytes) are typed onto the C64 by `TutorialSession.show()`
(the `s` nav command).

tut4's content is written against the *real* documented CSDB workflow
(`docs/user_manual/csdb.md`) and `mkdisk`/`mnt`/`cp` semantics
(`docs/user_manual/dos.md`, `docs/user_manual/file-operations.md`) rather
than the plan's placeholder syntax -- in particular, `cp` only bridges
the Ultimate's `/temp` folder with a server-backed device (`n`/`c`); it
cannot copy straight onto a mounted disk image. So "keep a copy" uses
plain BASIC `LOAD`/`SAVE` across two IEC devices (temp on 8, the fresh
disk on 9) instead of inventing an unsupported `cp` variant.

tut5's console-tour steps use `active_console_is()`, which needs the
*session's* session_id (see that factory's docstring in `model.py`) --
`TutorialSession._run_verify()` special-cases it via a `_console_id`
marker rather than ever calling the shared closure directly.

This module is imported by `tutorials/__init__.py` *after* `TUTORIALS` is
defined there, specifically so that `from . import TUTORIALS` below reaches
back into the (still-initializing) `tutorials` package and finds it. See
the import-order note at the top of `tutorials/__init__.py`.
"""

from . import TUTORIALS
from .model import (
    Step,
    Tutorial,
    active_console_is,
    always_manual,
    prompt_device_is,
    screen_contains,
    screen_matches,
)

tut1 = Tutorial(
    id="tut1",
    title="Disks & games: browse, mount, run",
    blurb="Disks & games: browse, mount, run",
    steps=[
        Step(
            hint='Pick a drive: type "#u" (USB) or "#f" (SD:/Flash).',
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
            hint='See inside the disk: "$" (or F3).',
            # Same listing approximation as step 2.
            # TODO(hw): confirm on hardware once mount+listing content is known.
            verify=screen_contains(".d64", ".prg", ".d81", ".crt"),
            demo_keys=b"$\r",
        ),
        Step(
            hint='Run the first program: "/*" (or "/name").',
            # Detecting "a program started" from a screen snapshot alone
            # is unreliable (games clear/redraw the screen in every
            # imaginable way) -- manual advance is safer than a flaky
            # heuristic here.
            # TODO(hw): revisit if a robust "program is running" signal
            # (e.g. a specific memory location) turns up during hardware
            # testing.
            verify=always_manual(),
            demo_keys=b"/*\r",
        ),
        Step(
            hint=(
                "Shell stepped aside so the game runs clean. Back at "
                'BASIC, type "HDN" to re-arm the app keys. '
                "Done -- press q."
            ),
            verify=always_manual(),
            demo_keys=b"HDN\r",
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
            hint=(
                'Type "help topics" - hold CTRL to slow the listing. '
                'Then "help <topic>".'
            ),
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
                'Try: "i:How do I mount a disk?" Press q when done.'
            ),
            verify=always_manual(),
            demo_keys=b"i:how do i mount a disk?\r",
        ),
    ],
)

TUTORIALS["tut2"] = tut2

tut3 = Tutorial(
    id="tut3",
    title="Ask me anything (AI chat & tools)",
    blurb="Ask me anything (AI chat & tools)",
    steps=[
        Step(
            # "i:" is REQUIRED, not optional -- ChatHandler.can_handle()
            # only routes to the AI on a leading "i:" (or "m:", or while
            # active_module=="i" from a prior bare "i:" with no query --
            # neither applies at the start of this tutorial).
            hint='Ask a question: "i:how much is 96-32?"',
            # Deterministic answer, so this can auto-verify (unlike the
            # open-ended AI-response steps below). \b64\b (word boundary)
            # rather than plain "64" so this can't fire on "C64" showing up
            # anywhere on screen -- "6" isn't a boundary right after "C".
            verify=screen_matches(r"\b64\b"),
            demo_keys=b"i:how much is 96-32?\r",
        ),
        Step(
            hint=(
                'Try: "i:search the web what was the most recent C64 '
                'demo party?" (needs a Search key in Settings -- press '
                "n to skip)."
            ),
            # The AI's response text is open-ended (varies by search
            # results, and there's no fixed success phrase to key off of
            # if the search key isn't configured) -- manual advance, same
            # reasoning as tut1's unpredictable-output steps.
            verify=always_manual(),
            demo_keys=b"i:search the web what was the most recent C64 demo party?\r",
        ),
        Step(
            hint="Leave something on screen, then ask \"i:what's on my screen?\"",
            # Same story: the AI's answer references whatever's actually
            # on screen, which varies per user -- can't verify generically.
            verify=always_manual(),
            demo_keys=b"i:what is on my screen?\r",
        ),
        Step(
            hint='Let it drive: "i:list the files on this disk" - watch it type "ll".',
            # The AI dispatches a real "ll", so the same directory-listing
            # heuristic as tut1's ll steps applies here too. (Real
            # hardware bug found here, 2026-07-17: the agent was
            # describing "ll" instead of actually typing it -- fixed in
            # chat_handler.py's CHAT_SYSTEM_PROMPT, which told the model
            # to consult the manual for "file listing"-type asks without
            # ever telling it to then act via type_on_c64 for a live
            # do-it-now request. The system prompt now says explicitly:
            # if the user asked you to DO it, call type_on_c64, don't
            # just describe it.)
            verify=screen_contains(".d64", ".prg", ".d81", ".crt"),
            demo_keys=b"i:list the files on this disk\r",
        ),
        Step(
            # Split from a single "read/modify memory and remember prefs"
            # narration step into two concrete, triable examples -- a
            # "see the manual" pointer goes unread at this stage.
            hint=(
                'It remembers things too: "i:remember that I prefer C '
                'over asm".'
            ),
            verify=always_manual(),
            demo_keys=b"i:remember that I prefer C over asm\r",
        ),
        Step(
            hint=(
                'It can also read C64 memory directly: "i:what is at '
                'memory address 53280?" Press q when done.'
            ),
            verify=always_manual(),
            demo_keys=b"i:what is at memory address 53280?\r",
        ),
    ],
)

TUTORIALS["tut3"] = tut3

tut4 = Tutorial(
    id="tut4",
    title="Find a demo on CSDB, run & keep it",
    blurb="Find a demo on CSDB, run & keep it",
    steps=[
        Step(
            # The bare "#c" switch-then-bare-command form isn't reliable
            # on real hardware (2026-07-17) -- the "c:" one-off prefix
            # (docs/user_manual/dos.md's ":" notation) is what actually
            # works, so every CSDB command in this tutorial uses it
            # instead of switching devices with "#c".
            hint='Search CSDB: "c:find <name>", e.g. "c:find hondani".',
            # CSDBHandler's find-result formatter always prints one of
            # these section headers (or "No results found.") -- see
            # cloud/handlers/csdb_handler.py's _format_find_result().
            verify=screen_contains(
                "release matches", "group matches", "scener matches", "no results found"
            ),
            demo_keys=b"c:find hondani\r",
        ),
        Step(
            hint='Open a release: "c:cd rel/<id>" using the ID shown.',
            # Release detail view always prints these headers (see
            # format_release_output() in csdb_handler.py). The numeric ID
            # varies per search, so demo_keys leaves it for the user.
            verify=screen_contains("released by", "files"),
            demo_keys=b"c:cd rel/",
        ),
        Step(
            hint='Grab the file: "c:cp *.zip" (or the exact filename).',
            # _cp_file()'s own success lines: "Copied ... to /tmp/hdnshell"
            # / "Uploaded ... to ftp://...".
            verify=screen_contains("copied", "uploaded"),
            demo_keys=b"c:cp *.zip\r",
        ),
        Step(
            hint='See it on the Ultimate: "#t" then "dir".',
            # "#t" is a real device switch (Ultimate storage), not the
            # CSDB ":" notation, so it's unaffected by the c: fix above.
            # Same listing approximation used elsewhere -- entry
            # suppression covers the case where these extensions are
            # already visible from an earlier step.
            verify=screen_contains(".zip", ".prg", ".d64", ".d81"),
            demo_keys=b"#t\rdir\r",
        ),
        Step(
            # NOT "mkdisk a blank disk" -- the file you just downloaded
            # already includes a ready-to-use .d64/.d81; mount THAT one.
            # TODO: a truly dynamic hint (reading the actual filename off
            # the live screen and inserting it here) would be nicer than
            # asking the user to read it themselves, but Step.hint is a
            # static string in the current data model -- out of scope for
            # this pass.
            hint='Mount it: look for a name ending ".d64"/".d81" above, then "mnt <name>".',
            # Same mount-confirmation uncertainty as tut1's mnt step.
            # Filename varies, so demo_keys leaves it for the user.
            verify=always_manual(),
            demo_keys=b"mnt ",
        ),
        Step(
            hint='See inside: "$" (or F3).',
            # Same "$"-not-"ll" correction as tut1's equivalent step --
            # ll doesn't show a mounted disk's directory.
            verify=screen_contains(".prg", ".d64", ".d81", ".crt"),
            demo_keys=b"$\r",
        ),
        Step(
            hint=(
                'Run it: "/*" - fast-load & run, same as tut1. '
                "Press q when done."
            ),
            verify=always_manual(),
            demo_keys=b"/*\r",
        ),
    ],
)

TUTORIALS["tut4"] = tut4

tut5 = Tutorial(
    id="tut5",
    title="Live on your C64 (the full tour)",
    blurb="Live on your C64 (the full tour)",
    steps=[
        Step(
            hint='Type "HDN" to unlock the console-switch keys.',
            # No fixed on-screen ack for a successful HDN arm (it's a
            # near-instant local action, see wedge/conversion_log3.md
            # §28) -- manual advance, same as tut1's re-arm step.
            verify=always_manual(),
            demo_keys=b"HDN\r",
        ),
        Step(
            # Each console-tour hint spells out BOTH halves of the round
            # trip: switching in AND switching back. Without the second
            # half, a user who's off exploring the console has no way to
            # know how to get back and see the next hint -- the coach
            # itself goes quiet while off-shell (see _check_console_
            # marker_step()'s docstring: verify still runs, but painting
            # doesn't), so the CONFIRM prompt only reappears once they're
            # back on the local shell.
            hint=(
                "Web browser: press C=+CTRL+4. Real web pages! Come "
                "back with C=+CTRL+1 to continue."
            ),
            verify=active_console_is(4),
        ),
        Step(
            hint=(
                "Telegram: C=+CTRL+5. Read & reply to chats. Come back "
                "with C=+CTRL+1 to continue."
            ),
            verify=active_console_is(5),
        ),
        Step(
            hint=(
                "News: C=+CTRL+6 (RSS). Come back with C=+CTRL+1 to "
                "continue."
            ),
            verify=active_console_is(6),
        ),
        Step(
            hint=(
                "Wikipedia: C=+CTRL+7. Come back with C=+CTRL+1 to "
                "continue."
            ),
            verify=active_console_is(7),
        ),
        Step(
            hint=(
                "Coding Agent: C=+CTRL+3. Describe a program, it builds "
                "& runs it. Come back with C=+CTRL+1 to continue."
            ),
            verify=active_console_is(3),
        ),
        Step(
            hint="Home: C=+CTRL+1. That's your whole computer. Press q.",
            # Coming back to console 1 (native BASIC) never routes through
            # ConsoleManager (see TutorialSession._on_shell()'s docstring),
            # so active_console_is(1) would never fire -- manual advance.
            verify=always_manual(),
        ),
    ],
)

TUTORIALS["tut5"] = tut5
