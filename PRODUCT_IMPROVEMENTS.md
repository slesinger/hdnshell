# HDN Shell — Product Roadmap

*Living document. Owner: Honza. Last updated: 2026-07-05.*

## What the product is

**HDN Shell** turns a C64 Ultimate's Retro Replay cartridge into an AI-enabled, network-connected shell that lives *alongside* BASIC. You type at the familiar `READY.` prompt: recognized commands (`ll`, `cd`, `cp`, `mnt`, `status`, `#n`, …) run instantly in the cartridge; anything BASIC doesn't understand is forwarded to **HDN Server** — a companion app you run on your own PC or Mac — which answers with AI chat, manual search, CSDB scene access, virtual console apps, and a full AI coding agent that can see the screen, press keys, and inject compiled programs into the real machine.

This replaces two earlier ideas, deliberately abandoned:
- ~~Replacing the BASIC ROM entirely~~ → BASIC stays; the shell is a cartridge wedge.
- ~~Hosted cloud SaaS with accounts~~ → the server is yours, running locally.

### Guiding principles

1. **BASIC stays.** The C64 remains a stock C64; the shell adds, never subtracts.
2. **Your machine, your server.** No hosted service, no accounts, no telemetry. The server runs on the user's own computer; LLM access is whatever OpenAI-compatible endpoint they configure (including local Ollama).
3. **Invisible when unused.** Games and stock software must run bit-for-bit unaffected (the disarm-on-LOAD/RUN design). Compatibility bugs are release blockers.
4. **Open source everything.** Cartridge, server, docs, tools.
5. **Ship early, iterate publicly.** v1.0 means a stable core loop (shell + chat + files), not feature parity. Grow the rest in the open with community feedback.

### Audience

- **C64 Ultimate owners** who want their machine pleasant to operate and connected.
- **Newcomers & learners** — the built-in AI tutor and pair-programming loop make real 1982 hardware a place you can learn BASIC and 6502 today.

### The four core pillars

| Pillar | What it means |
|---|---|
| Files, CSDB & net drive | `ll`/`cd`/`cp`/`mnt`, `#n` workspace drive, CSDB browse & download-to-C64 |
| Server apps & consoles | C=+CTRL+digit virtual consoles: web browser, Telegram, RSS, Wikipedia, editor |
| Coding agent & AI tools | AI that reads the screen, injects keys/memory, compiles & runs programs |
| AI chat, help & tutor | Type anything at READY → LLM answers; semantic manual search; tutoring |

---

## Near-term goals (0–3 months) — *make the pivot real, then go public early*

### N1. Hardware-solid wedge
Make the cartridge boringly reliable before anything else — principle 3 is the product's license to exist.
- [ ] Full hardware regression of the round-6 build: game-compat repro (F7→F1→intro→SPACE plays), F3 with silent server log, STOP+RESTORE, shell regression, C=+CTRL+digit console switch, `memcpy` both directions, manual `LOAD"*",8,1`+`RUN` sniffer path.
- [ ] `#n` net drive / `cp` FTP push-pull verified end-to-end from real hardware (client_ip + anonymous FTP assumptions).
- [ ] Wider game-compatibility sweep beyond the one known repro (a small standard test set of popular titles).
- **Done when:** a full regression checklist passes on real hardware twice in a row with zero fixes needed.

### N2. Terminology & docs overhaul
The repo still tells the old ROM-replacement/cloud-SaaS story. Rewriting it *is* the pivot, externally.
- [ ] Adopt naming everywhere: **HDN Shell** (cartridge experience) + **HDN Server** (local companion app). Remove "cloud"/SaaS framing from READMEs, user manual, help texts, docs-manifest.
- [ ] One canonical README (retire the README.md / README-v2.md duplication) telling the cartridge + local-server story.
- [ ] Archive the v1 ROM-replacement docs/code path clearly as "legacy/reference" so newcomers don't install the wrong thing.
- [ ] Open-source hygiene: LICENSE, CONTRIBUTING stub, repo description.
- **Done when:** a stranger reading only the README correctly understands what to flash, what to run, and that BASIC survives.

### N3. Feature-migration audit (v1 → wedge)
Rule: every v1 feature migrates **unless Retro Replay already provides it**.
- [ ] Build a parity matrix from `src/cmd_*.asm` + the user manual: for each feature mark *migrate* / *already in RR* (monitor/SMON, fastload, freezer) / *obsolete under the pivot*.
- [ ] Migrate the gaps in priority order (shell/file commands first, then chat-adjacent, then console-dependent).
- **Done when:** the matrix has no unclassified rows and no *migrate* row without an owner/issue.

### N4. Easy install — the 15-minute onboarding
- [ ] One-command server setup (`pipx`/`uvx` or docker), with a first-run config step for the LLM endpoint & API key.
- [ ] Step-by-step `.crt` flashing guide for the C64U.
- [ ] Server-IP configuration flow on the C64 documented (no reflashing), plus a troubleshooting page for the usual failures (no network, wrong IP, FTP blocked).
- **Done when:** someone who has never seen the project goes from zero to AI-answer-at-READY in one sitting, using docs alone.

### N5. First public release (v0.x)
- [ ] Publish the GitHub repo; post on CSDB / Lemon64 / relevant forums once the core loop (shell commands + chat + file ops) is stable on hardware.
- [ ] A short demo video of the READY-prompt-to-AI loop — the single best marketing asset this product can have.
- **Done when:** the repo is public, the post is up, and the first outside user has it running.

---

## Mid-term goals (3–9 months) — *the four pillars, polished on the wedge*

### M1. Consoles & server apps matured
- [ ] Virtual consoles (C=+CTRL+1..7) stable on hardware; server-side screen save/restore proven under real switching.
- [ ] The existing server apps (web browser, Telegram, RSS, Wikipedia, file editor) usable from the cartridge, not just the v1 ROM.
- **Success:** switching to the Telegram console mid-BASIC-session and back is a demo you can do live without fear.

### M2. Coding agent as the flagship demo
The strongest expression of "AI-native retro computing" that already mostly exists: AI sees the screen, presses keys, compiles, injects, runs.
- [ ] End-to-end flow from the cartridge: ask for a program at READY → agent scaffolds/compiles server-side → injects and runs on the real machine.
- [ ] Polish the Oscar64/assembly toolchain path and workspace project flow.
- **Success:** a recorded "AI writes and runs a C64 program while you watch" session that works reliably.

### M3. Education track
- [ ] AI tutor polish: context-aware help (screen reading), beginner-friendly answers, `help` topics coverage.
- [ ] Interactive scripted tutorials (from improvement-ideas.md): browse a disk, mount and run a game, use help, ask the AI, write a first BASIC program — with the server checking progress.
- **Success:** a newcomer completes the tutorial track without a human helping.

### M4. Robustness & project health
- [ ] CI pipeline (GitHub Actions) running the offline test suite on every push; integration tests (live CSDB/LLM/TCP) clearly separated and mockable.
- [ ] Session keying by handshake token instead of client IP (NAT-safe).
- [ ] UX: replace bare `?ERROR` responses with helpful suggestions ("did you mean `c:` …?").
- **Success:** a green badge on the README and no test that requires Honza's machine to pass.

### M5. Community foundation
- [ ] Handler / server-app SDK documentation: how to write a new command handler or console app in Python against `cloud/sdk/`.
- [ ] Contribution guide + a few "good first issue" items from the migration matrix.
- **Success:** the first third-party pull request that adds a handler or app.

---

## Visionary (9+ months)

### V1. Extensibility ecosystem
HDN Server becomes a platform: third parties write server apps and command handlers against the Python SDK; a community registry (an "app store" of consoles and commands) lets users install them with one command. The cartridge stays small and stable; the ecosystem grows server-side where iteration is cheap.

### V2. AI-native retro computing
The flagship showcase. The agent already has eyes (screen reading), hands (keyboard/memory injection), and a toolchain (compile & run). Push it to the frontier: AI that autonomously operates the C64, builds and iterates on programs and demo effects on real hardware, assists full game development — a natural tie-in with the 3D game / REU renderer project as the proving ground. This is the story that gets conference talks and press: *a 1982 computer with a 2026 mind.*

### Backlog (kept visible, deliberately not headline)
- PRGlets: relocatable mini-programs with stdin/stdout via a dedicated memory buffer.
- Resident programs handling frame interrupts; SID/MOD background music streaming.
- Clipboard between server and C64 (C=+C / C=+V).
- Classroom / multi-seat kit (multiple C64s per server, lesson materials).
