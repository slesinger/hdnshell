# Improvement Ideas

_Generated 2026-07-05 during an autonomous overnight session. Items marked ✅ were
implemented that night; the rest are proposals for future work._

## Bugs found & fixed ✅

1. **Stale test patch targets** — `test_agent_tools_c64_memory.py` and
   `test_screen_tool.py` still monkeypatched the top-level `network_helper`
   module, which was moved to `sdk/network_helper.py`. All 9 tests failed with
   `ModuleNotFoundError`. Fixed by patching `sdk.network_helper.*`.
2. **Session-state leakage between tests** — session state in
   `sdk/shared_state.py` is module-global, so a CSDB test that set
   `active_module="c"` for session 0 made a later dispatcher test route
   "unknown command" into the CSDB handler. Added
   `reset_all_session_states()` and an autouse fixture in `test_handlers.py`.
3. **Impossible/brittle assertions** in `test_handlers.py`:
   - `assert "TBD" in response.lower()` can never be true (uppercase needle in
     a lowercased haystack).
   - `test_dispatch_unknown` expected the pre-`?ERROR` response wording and
     stripped the last byte assuming a null terminator that is no longer sent.
   - `test_llm_response` required `len(response) > 5`; the live LLM answered
     `2+2=4` (exactly 5 chars). Now asserts the answer contains "4".
4. **test_cloud.py tests an obsolete protocol** — magic bytes are now a single
   `$FE` (was `$FE $FF`) and `create_response()` no longer prefixes
   magic/type bytes. Integration tests hang the whole suite. ✅ modernized.
5. **Latent `create_response()` bug** — it returned `data[:-1]`
   unconditionally, silently chopping the final byte off
   MIX_COMMANDS_SCREEN_CODES / MTEXT responses (only null-terminated PETSCII
   responses were safe). ✅ fixed to strip only the null terminator it added.

## Shell / cloud server features

6. **`help topics` command** (from TODO.md) ✅ — print the list of available
   manual topics from `docs-manifest.json` so users can discover what
   `help <topic>` can answer.
7. **Semantic manual search with cached embeddings** (from TODO.md: "use FAISS
   for in memory similarity search, pickle embeddings to disk") ✅ implemented
   as an optional layer: embeddings computed via the configured OpenAI/Azure
   key, cached to disk (pickle keyed by content hash), cosine similarity in
   numpy; graceful fallback to the existing keyword search when no API key or
   cache is available. FAISS itself is overkill for ~25 manual pages.
8. **`m:` AI-manual prefix** (TODO.md) ✅ — dedicated prefix that always
   searches the manual, because `i:` doesn't reliably pick the manual tool.
   Implemented in `ChatHandler.handle()` (checked right after the slash-command
   branch, before the LLM agent is invoked): `m:<phrase>` calls `search_manual`
   directly and returns the raw paragraphs, bypassing tool selection entirely.
   No wedge/assembly change was needed — `m:` isn't a wedge keyword, so it
   already falls through to the existing chat-forward path (`wd_chat`, which
   prepends `I:`) like any other unrecognized line. Documented in
   `docs/user_manual/user_manual.md` and `ai-assistance.md`, plus a new
   `help manual` topic in `help_handler.py`.
9. **Server IP configuration command** (TODO.md "nastavovani ip serveru") —
   let the C64 side set/store the cloud server IP without reflashing;
   also expose C64U IP override in the web UI.
10. **`cp`/`mv` within the Ultimate filesystem** (TODO.md) — needs wedge/DOS
    work on the C64 side.
11. **Device-letter semantics** (TODO.md) — `#s` assumes SD card; `#t`/`#h`
    currently behave like SD. Decide semantics for USB0/1 sticks and document.
12. **Interactive tutorials** (TODO.md tut1–tut5) — scripted lessons driven by
    injected input keys: browse a disk, mount, run a game; using help; ask-me-
    anything; finding a demo; full migration to the C64.
13. **Multiple virtual consoles, clipboard, PRGlets, resident programs** —
    already sketched in TODO.md/README future features; the console manager in
    `sdk/console_manager.py` is the anchor point.

## Robustness / testing / CI

14. **Test isolation from the network** — several "unit" tests hit live
    csdb.dk and the live LLM. Mark them (`@pytest.mark.integration`) or mock
    them, so `pytest -m "not integration"` is deterministic and offline-safe.
15. **Integration tests must not hang** ✅ — client sockets in
    TestServerIntegration now use `settimeout(5)`, server threads are joined
    with a timeout, and the hardware-only DMA test is skipped with a reason.
16. **CI pipeline** — a GitHub Actions workflow running the offline test
    subset on push would have caught the `network_helper` rename breakage.
17. **Session-ID keying by client IP** — sessions keyed per client IP break
    with NAT/multiple C64s behind one router; consider a handshake token.
18. **`?ERROR` UX** — the default no-handler response could name the closest
    matching prefix ("did you mean `c:` ...?") instead of a bare `?ERROR`.

## Documentation

19. **Dead placeholder YouTube links** ✅ — README.md and README-v2.md linked
    to `youtube.com/watch?v=dummy1234`; removed/neutralized until a real
    video exists.
20. **Duplicate `coding-agent` entry in docs-manifest.json** ✅ — appeared both
    under Cloud Apps and Programming; the manifest README says the file is
    mirrored at `cloud/static/docs/docs-manifest.json`, and the two copies had
    drifted. Deduplicated + synced.
21. **README vs README-v2 split** — two parallel READMEs with overlapping
    content; pick v2 as canonical, fold unique bits of v1 into it.
22. **TODO.md contains real user documentation** — clipboard (C=+C / C=+V),
    screen-buffer switching (C=+1..4), stash/fetch/drop, PRGlets, resident
    programs, and the whole SMON command reference live in TODO.md instead of
    the user manual. Migrate them to `docs/user_manual/`.
