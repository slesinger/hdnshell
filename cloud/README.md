# C64 HDN Cloud Server

TCP server for C64 communication with PETSCII protocol support.

## Overview

This application receives TCP data as commands from a C64 computer and responds with data. It can run on a local PC or in a serverless cloud environment. The C64 client requires a C64 Ultimate with network target.

# HDN Cloud

Use Ulitimate Network target to make requests to HDN Cloud for command execution.
Data can be received synchronously or via a REST callback which can utilize DMA to write data directly to C64 memory.

Request protocol
- authentication token
- session id
- application id
- command
- data

Data saving binary protocol

Have a query tool to use/test the HDN Cloud API from PC

Host on GCP Cloud Run

Expose Ultimate via ngrok, Cloudflare Tunnel, Localtunnel, or Tailscale

Use nano LLMs

Google Maps app

For thin client C64 apps, use mText/SidekickMenu or similar plain text rich text format

## Application Types

#### Example: Database
Type: Thin client
Inputs: keystrokes
Output: Full screen updates

#### Example: Image search
Type: Realtime downloadable thick client
Input: search query, get image by id
Output: Data DMAed to C64 memory, display image


## Running the Cloud Server

To run the C64 Cloud server with a web status API:


1. Install all dependencies:

	```sh
	pip install -r requirements.txt
	```

2. Start the server:

	```sh
	python cloud.py
	```

This will start both the C64 TCP server and a web server on port 8064. You can check status at http://localhost:8064/status and see the number of connected C64 clients at http://localhost:8064/clients.

---

### CLI integrated

Sends commands to HDN Cloud for execution, receives text output that gets dispatched. It can handle standard output as well as cursor jumping.

#### Example: CSDB.dk integration
Type: Integrated CLI app
Input: CLI input line
Output: Text screen data as sync response or DMAed to C64 memory

## Installation

# C64 HDN Cloud Server

TCP server for C64 communication using PETSCII protocol, with modular command handlers and CSDB.dk integration.

---

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Architecture](#architecture)
4. [Installation](#installation)
5. [Running the Server](#running-the-server)
6. [Request Handlers](#request-handlers)
7. [CSDB Handler Usage](#csdb-handler-usage)
8. [PETSCII Protocol & Conversion](#petscii-protocol--conversion)
9. [Testing](#testing)
10. [Web UI](#web-ui)
11. [Production Build & Deployment](#production-build--deployment)
12. [Security Notes](#security-notes)
13. [Troubleshooting](#troubleshooting)
14. [Future Enhancements](#future-enhancements)

---

## Overview

This application acts as a TCP server for the Commodore 64, supporting PETSCII protocol and modular command handling. It can run locally or in a cloud environment. The C64 client communicates via network (Ultimate Network target recommended).

---

## Features

- Modular command handlers (Chat, Help, Python Eval, CSDB)
- CSDB.dk integration: search, release/group/scener/event info, file download
- PETSCII ↔ ASCII/UTF-8 conversion utilities
- Session state per client
- Test client simulator
- Web status API (optional)
- Optional LLM chat integration (requires API keys)
- File download, zip extraction, and FTP upload (CSDB handler)
- Configurable via .env and cloud_config.cfg

---

## Installation

Tested with Python 3.11+.

1. Install dependencies:
	 ```bash
	 pip install -r cloud/requirements.txt
	 ```
2. (Optional) For LLM chat features:
	 ```bash
	 pip install langchain langchain-openai langchain-community
	 export OPENAI_API_KEY="your-key-here"
	 # For Azure/OpenAI, also set AZURE_OPENAI_API_KEY, AZURE_OPENAI_ENDPOINT, AZURE_OPENAI_DEPLOYMENT_NAME
	 ```
3. (Optional) For web search in chat:
	 ```bash
	 export SERPAPI_API_KEY="your-key-here"
	 ```
4. (Optional) For documentation access:
	 ```bash
	 export CONTEXT7_API_KEY="your-key-here"
	 ```
5. (Optional) Configure .env and cloud_config.cfg for CSDB authentication and C64 client IP.

---

## Running the Server

Start the server from the `cloud/` directory:

```bash
python cloud.py          # default: host 0.0.0.0 port 6464
python cloud.py --port 8064
python cloud.py --debug  # enable debug logging
```

The server starts both the C64 TCP server and a web server (default port 8064). Status: http://localhost:8064/status, clients: http://localhost:8064/clients

---

## Request Handlers

The server uses a dispatcher system to route text input commands to specialized handlers:

- **Chat Handler (I: prefix):**
	- Conversational AI via LLM (optional)
	- Usage: `I: <your question>`
	- Requires `OPENAI_API_KEY` (see Installation)

- **Help Handler (help prefix):**
	- Provides help on available commands
	- Usage: `help [topic]`
	- Topics: chat, python, csdb, commands

- **Python Eval Handler (? prefix):**
	- Safe evaluation of Python expressions
	- Usage: `? <expression>`
	- Only safe built-in functions and math operations allowed

- **CSDB Handler (c: prefix):**
	- Queries csdb.dk for C64 scene info
	- Usage: `c: <query>`
	- Supports: release/group/scener/event info, search, file download, zip extraction, FTP upload

---

## CSDB Handler Usage

**Commands:**

- `c: release <id>`: Get release info
- `c: group <id>`: Get group info
- `c: scener <id>`: Get scener info
- `c: event <id>`: Get event info
- `c: find <text>`: Search for releases, groups, etc.
- `c: cd <type>`: Change directory (e.g., 'cd release')
- `c: cd <id>`: View details of an item
- `c: cd ..`: Go up one level
- `c: pwd`: Show current path
- `c: cp <file>`: Copy file from a release to local tmp (and upload via FTP if client IP is set)
- `c: ll` or `c: dir`: List latest entries in current directory

**Example: Display latest releases**

1. Enter CSDB mode: `c:`
2. Switch to release directory: `cd release`
3. List latest releases: `ll`

---

## PETSCII Protocol & Conversion

- All client commands start with magic bytes `$FE $FF`
- Supported commands:
	- `$01`: Keypress `[FE FF] [01] [PETSCII_CODE] [MODIFIER_FLAGS]`
	- `$02`: Text input `[FE FF] [02] [PETSCII_TEXT...] [00]`
- Server responses:
	- `$01`: PETSCII null-terminated string
	- `$02`: Mix of commands and screen codes
	- `$03`: mText format (see docs/mtext.md)
- PETSCII ↔ ASCII mapping:
	- ASCII `$41-$5A` (A-Z) ↔ PETSCII `$C1-$DA`
	- ASCII `$61-$7A` (a-z) ↔ PETSCII `$41-$5A`
	- Other characters map directly

---

## Testing

Run all tests:
```bash
pytest -v
```
Run specific test suites:
```bash
pytest test_cloud.py -v      # Core server tests
pytest test_handlers.py -v   # Handler tests
```
Test client simulator:
```bash
python test_client.py
python test_client.py --demo
python test_client.py --host <ip> --port <port>
```
Example dispatcher:
```bash
python example_dispatcher.py
```

---

## Web UI

The UI lives in `ui/` and calls the backend API on `http://127.0.0.1:8064`.

Install dependencies:
```bash
cd ui
npm install
```
Run in dev mode:
```bash
npm run dev
```
Build for production:
```bash
npm run build
```
Preview production build:
```bash
npm run preview
```

---

## Production Build & Deployment

To create a production release (UI + backend single-file executable):

Linux/Mac:
```bash
make release
```
Windows:
```bash
release.ps1
```
Artifacts are created in `cloud/dist/`, then copied to `release/`.
UI is served from backend at GET / and all static paths.
Requirements: Node.js, npm, Python, PyInstaller

On startup, server scans local network for C64U on port 64 and saves IP in `cloud_config.cfg`. Rescan via web UI or by clearing last_c64_ip in config.

---

## Security Notes

- Python evaluator restricts `__builtins__` and exposes only a safe namespace
- Handlers may perform network I/O (CSDB queries, LLM calls) — configure environment and credentials carefully
- Downloaded files are written to `/tmp/hdnshell` when using `cp` or extracting zip contents
- CSDB authentication can be set via .env (CSDB_USER, CSDB_PASSWORD)

---

## Troubleshooting

- "Chat service is unavailable": Ensure Azure/OpenAI environment variables and `langchain` packages are installed
- "CSDB network error": Verify network access to `https://csdb.dk` and check for rate limits
- Python eval errors: Check expression syntax and use allowed functions only
- File download/FTP errors: Check client IP configuration and permissions

---

## Future Enhancements

- Implement actual command handlers (DIR, LOAD, etc.)
- Add mText format support
- Integrate with web APIs (Wikipedia, weather, etc.)
- Add authentication/security
- Support for multiple simultaneous C64 clients
- Cloud deployment instructions (AWS Lambda, Google Cloud Functions, etc.)

---