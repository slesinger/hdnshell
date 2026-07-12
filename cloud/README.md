# HDN Server — developer README

The **HDN Server** is the companion app for [HDN Shell](../README.md). Users run
it on their own PC or Mac; the HDN Shell cartridge on the C64 Ultimate connects
to it over the local network. There is no hosted service and no account — the
server, the LLM endpoint, and all data stay on the user's machine.

> This document is for developers working on the server. End-user setup lives in
> the [Installation Guide](../docs/user_manual/installation.md); command-level
> documentation lives in the [User Manual](../docs/user_manual/user_manual.md).

---

## Architecture

One process (`cloud.py`) starts two servers:

| Server | Port | Purpose |
|---|---|---|
| **TCP server** (`cloud_server.py`, `C64Server`) | 6464 | The C64 cartridge connects here. Binary framing (magic bytes + command ID), payload text in PETSCII. |
| **Flask web API + UI** (`cloud.py`) | 8064 | Serves the web UI from `static/` and a REST API: C64U discovery, machine control (run/stop cartridge, reset, reboot, power off), FTP file management, memory read, screen/video streams, settings, self-update. |

```
C64 Ultimate ──TCP 6464──▶ cloud_server.py ──▶ request_dispatcher.py ──▶ handlers/
             ◀─UCI/DMA/FTP── cloud.py (Flask 8064) ◀──HTTP── browser (web UI)
```

### Directory map

- `cloud.py` — entry point. Flask app (REST API + static UI), starts the
  `C64Server` TCP thread. Talks to the C64 Ultimate's own REST API
  (`http://<c64u-ip>/v1/...`) for machine control and DMA.
- `cloud_server.py` — TCP server; accepts C64 clients, frames commands, and
  registers the server-console apps with the `ConsoleManager` (console number →
  app: 2 file editor, 3 coding agent, 4 web browser, 5 Telegram, 6 RSS,
  7 Wikipedia, 10 vibe-coding chat). The C64 switches consoles with
  `C=+CTRL+<digit>`.
- `request_dispatcher.py` — routes a typed line (PETSCII) to the first matching
  handler, in priority order: help → Python eval (`?`) → chat (default) →
  CSDB → net drive.
- `handlers/` — line-oriented command handlers (one class per feature, all
  subclass `sdk.base_handler.BaseHandler`).
- `server-apps/` — full-screen console apps (own the whole C64 screen, receive
  keystrokes, paint via DMA). `coding_agent/` contains the agent harness.
- `sdk/` — shared building blocks: `command_handler` (wire protocol constants),
  `console_manager`, `shared_state` (per-session state), `petscii` conversion,
  `workspace`, `semantic_search`, network helpers. Third-party apps build on
  this SDK.
- `agent_tools.py` — tools exposed to the AI coding agent (screen reading, key
  injection, C64 memory access, git, project scaffolding, shell).
- `llm_factory.py` — LLM client creation; any OpenAI-compatible endpoint works,
  including local Ollama.
- `csdb_*_parser.py` — csdb.dk scraping/parsing.
- `oscar/`, `workspace/` — Oscar64 toolchain assets and the user workspace the
  coding agent works in.
- `static/` — **generated**: the built web UI plus a copy of the user manual.
  Never edit by hand; rebuild with `cd ../ui && npm run build`.

## Running from source

Python 3.11+.

```bash
pip install -r requirements.txt
python cloud.py            # TCP on 6464, web UI on http://localhost:8064
python cloud.py --debug    # verbose logging
```

Optional environment for AI features: an OpenAI-compatible endpoint/key
(configure via the web UI Settings page or `hdnsh.cfg`); `SERPAPI_API_KEY` for
web search.

`cloud_test_client.py` simulates a C64 client against the TCP server, so most
development needs no hardware.

## Testing

```bash
python -m pytest -q        # from cloud/
```

Notes:
- Some tests exercise live network services (csdb.dk) and will fail offline.
- Anything touching the Ultimate's UCI/REU/DOS cannot be verified in VICE —
  it needs real C64 Ultimate hardware.

## Writing a handler or console app

- **Line handler** (reacts to typed input at the `READY.` prompt): subclass
  `sdk/base_handler.py`'s `BaseHandler`, implement `can_handle()`/`handle()`,
  register it in `request_dispatcher.py`. Order matters — first match wins.
- **Console app** (full-screen, switchable with `C=+CTRL+<digit>`): subclass the
  server-console base in `sdk/server_console.py`, register a factory for a free
  console number in `cloud_server.py`.

See `docs/user_manual/api-sdk.md` for the SDK reference.

## Release build

PyInstaller single-file binaries per OS (see `Makefile` and
`hdnsh-server-linux.spec`); output lands in `dist/`. The release also ships the
cartridge image `wedge/hdn-rr38p-tmp12reu.crt` — the web UI's
"Download & update" button fetches both from the latest GitHub release and
patches the server IP into the cartridge before uploading it to the C64U over
FTP.

## Security notes

- The server binds to `0.0.0.0` and has no authentication — it is designed for
  a trusted home LAN. Do not expose ports 6464/8064 to the internet.
- The Python eval handler (`?`) restricts itself to safe builtins, but the
  coding agent's shell/git tools execute real commands in the workspace —
  treat the workspace directory as untrusted-code territory.
