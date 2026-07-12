# HDN Shell — Product Strategy & Improvement Backlog

> Living document. Accumulates product-owner findings, decisions, and roadmap.
> Started 2026-07-12 (recreates the lost `PRODUCT_IMPROVEMENTS.md` from the
> 2026-07-05 PM session and extends it with the 2026-07-12 review).

---

## 1. Product identity (decided 2026-07-05)

- **HDN Shell** (outward name; "HDN Shell RR" only in technical docs) — the C64-side
  experience, delivered as an upgraded Retro Replay cartridge (`wedge/`).
  **BASIC stays intact**; recognized commands run in the wedge, everything else
  forwards to the server.
- **HDN Server** — the Python backend (`cloud/`), a **companion app users run on
  their own PC/Mac**. No hosted SaaS, no accounts, any OpenAI-compatible LLM
  endpoint (including local Ollama). All "cloud" terminology is legacy.
- v1 ROM-replacement firmware is archived as reference. Every v1 feature migrates
  to the wedge unless Retro Replay already provides it (monitor, freezer, fastload).
- **Audience:** C64 Ultimate owners + newcomers/education.
- **Four equal pillars:** files/CSDB/net-drive · server apps/consoles ·
  coding agent + AI tools · AI chat/help/tutor.
- **Ship early, iterate publicly.** v1.0 bar = stable core loop (shell + chat +
  files), NOT feature parity.

## 2. Positioning

Differentiators vs the adjacent ecosystem (Assembly64, WiC64/SKTP, Ultimate web UI):

1. **BASIC untouched** — zero-compromise wedge, machine looks stock from outside.
2. **No hosted service** — your own machine, your own LLM endpoint, incl. local
   Ollama. "No account, no SaaS" is a headline, not a footnote.
3. **The coding agent operates the real machine** — sees the screen, presses keys,
   injects compiled programs.

Say this comparison explicitly on README/landing page.

## 3. Urgent (credibility & safety)

- [ ] **Ship v0.1.0 release** with the `.crt` + three server binaries. Latest
      public release (v0.0.14, 2026-04) predates the pivot and has **no cartridge**
      — the documented install path is broken for every new user. Even an "early
      preview, expect hangs" release beats broken links.
- [x] Recreate the roadmap file (this document) and commit it.
- [ ] **LICENSE file.** README claims open source but the license text
      ("educational and personal purposes") is not open source. Pick GPL-3.0
      (community ethos, RR lineage) or MIT (max adoption). Blocks the SDK
      ecosystem play — nobody builds on an unlicensed SDK.
- [ ] **Move the GCP service-account key** (`robik-*.json`) out of the working
      tree (gitignored & never committed, but one `git add -f` from leaking).
- [ ] **Fix GitHub repo description** — still says "C64 BASIC replacement for
      modern utility" (the abandoned story). Add topics: `c64`, `commodore-64`,
      `ultimate64`, `retro-replay`, `ai`. Update local remote from `mujbasic` to
      `hdnshell`.

## 4. Code

- [ ] **Repo hygiene:** delete the four rescue wedge dirs (`wedge-previous`,
      `wedge-latest-not-working`, `wedge_2pokus_o_zachranu`,
      `wedge_3pokus_o_zachranu`) and `temp/` duplicates after tagging — git
      history preserves them. Same for `src-discontinued/` once v1 feature
      migration is confirmed complete. Keep `wedge/` (product) and
      `retro_replay/` (stock reference).
- [ ] **On-hardware smoke test:** the server can already read the C64 screen and
      inject keys (agent tools). Script the known kill-sequences (`#h` → `cd /`,
      `TASM` after power-on, `memcpy`, `m:`) and verify liveness per release.
      Converts the most painful manual chore into a checklist; great demo, too.
- [ ] **CI (GitHub Actions):** Python tests on push; PyInstaller builds (3 OSes) +
      KickAssembler cartridge build on tag, attach to release. Removes
      `release.ps1`-on-one-machine as the bottleneck.
- [ ] **Docs mirror:** `cloud/static/docs/` is a manual copy of
      `docs/user_manual/` — make sync a build step so it can't drift.

## 5. Documentation

- [ ] Retire `README-v2.md` (old-story duplicate).
- [x] Rewrite `cloud/README.md` as a *developer* README for HDN Server
      (architecture, protocol, how to write a handler/console app) — done 2026-07-12.
- [ ] **Compatibility matrix** up front in the manual: which hardware/firmware
      works (U-II+ / Ultimate 64 / real RR?). Every forum thread starts with
      "will it run on my X?"
- [ ] Move `TODO.md` content to GitHub Issues — public backlog doubles as
      marketing and lets early adopters report the hangs.

## 6. Strategy & sequencing

- Hold the v1.0 bar: **stable core loop**. The wedge hang bugs are the blocker,
  not `mkdisk`/scrollback/USB mapping. Park TODO "READY" items until the
  "ANNOYING" list is empty.
- **Ecosystem (mid-term):** the SDK is the moat. Publish a "write your own server
  app in 50 lines" template + one killer example (weather, train departures).
  Community registry is the long-term play.
- **Education (mid/long-term):** tutorials + AI tutor is the expansion beyond
  existing C64U owners, and the press hook: *"AI teaches you to program a 1982
  computer, on the real hardware."*

## 7. Marketing

- Outward name **HDN Shell** (drop "RR" — insider jargon; RR is the delivery
  mechanism, not the product).
- Launch sequence once v0.1.0 exists: CSDB release entry, Forum64 + Lemon64
  threads, Ultimate 64 Facebook/Discord, one demo GIF at the top of the README
  ("type a question at READY., get an answer").
- Prioritize two videos: 90-second "what is this" with the game-loading payoff
  (keep the Outrun script's personality) and the setup walkthrough (install
  friction = biggest funnel leak). Coding-tutorial videos are wave two.
- Publish the docs SPA to GitHub Pages — searchable manual online is both
  marketing and support deflection.

## 8. Roadmap

| Horizon | Focus |
|---|---|
| **Short (weeks)** | v0.1.0 release with `.crt`; GitHub description; LICENSE; kill hang bugs (bank3 era); repo cleanup; key out of tree |
| **Mid (1–3 months)** | On-hardware automated smoke test; CI + release automation; SDK template repo + docs; landing page + launch (CSDB, forums, 2 videos); then READY-section features (mkdisk, scrollback, #u/#v) |
| **Long (3–12 months)** | Third-party app registry; interactive AI tutorials as education product; PRGlets/residents; virtual consoles & clipboard; AI-native direction (agent fully operating the C64) |

## 9. Improvement log

- **2026-07-12:** created this document; UI/server/docs improvement pass (see
  git log of this date for details).
