# Internal API SDK for C64 Cloud Server

## Server Applications

Server Applications are written in python, they run on the C64 HDN Cloud Server, that means on your PC, yet you can use them directly from your C64. They can render custom interfaces on the C64 screen, handle keypresses, and maintain state. They are ideal for building rich interactive applications that can use power of power of modern processing and internet connectivity, while providing the real user experience on the C64.

## Purpose

This SDK defines a reusable internal Python API for building server applications for the C64 HDN Cloud Server.

It standardizes:
- C64 screen rendering (40x25)
- PETSCII and screencode conversion
- session state handling
- configuration access
- server app lifecycle patterns

It is intentionally an internal SDK (not a REST API).

## Development Cycle

For developping a Server Application, you need to checkout Hondani Shell source code from [github](https://github.com/hondani/hdnsh) and run the server locally. This allows you to add or change a Server Application and run the Cloud Server directly without releasing a new version. This implies that the release downloaded from [github](https://github.com/hondani/hdnsh/releases) will not be used in this process.

You can find the Server Apps sources under `cloud/server-apps/`. Play with the code there and then use `make run-server` to start the server and test your changes from the C64. When you are happy with the result, you can decide to prepare a pull request should you want to publish it for all the other users.

## Current Structure

- `cloud/sdk/`: core reusable API
- `cloud/server-apps/`: screen-based server applications (console apps)
- `cloud/handlers/`: text request handlers

## Application Types

### 1. Console App (screen-based)

Use this when the app renders directly into C64 screen/color memory and handles keypress input.

Base class:
- `sdk.ServerConsole`

Typical examples:
- `TelegramChatConsole`
- `WebBrowserConsole`
- `WikiBrowserConsole`
- `RSSReaderConsole`
- `FileEditorConsole`
- `CodingAgentConsole`
- `CodeChatConsole`

### 2. Handler App (text-in/text-out)

Use this when the app processes a command string and returns plain text.

Base class:
- `sdk.BaseHandler`

Typical examples:
- `ChatHandler`
- `HelpHandler`
- `PythonEvalHandler`
- `CSDBHandler`
- `CodeChatHandler`

## SDK Modules

### `sdk.__init__`
Public entrypoint. Re-exports core types, helpers, and constants.

Recommended usage:
```python
from sdk import ServerConsole, BaseHandler, word_wrap, get_session_state
```

### `sdk.server_console`
Core virtual console abstraction.

Key constants:
- `SCREEN_COLS = 40`
- `SCREEN_ROWS = 25`
- `SCREEN_SIZE = 1000`

Key methods:
- `clear()`
- `write_text(text)`
- `write_petscii(data)`
- `put_text(row, col, text, fg, reverse=False)`
- `fill_row(row, char=' ', fg=...)`
- `render_status_bar(text, row=24, fg=1, bg=0, center=False)`
- `clear_region(row, col, width, height)`
- `push_screen()`
- `push_vic_colors(border, background)`
- `show_toaster(text, duration_sec=8.0, color=7)`
- `clear_toaster()`
- `on_activate()` / `on_deactivate()`

Input contract:
- `handle_keypress(petscii_code, modifiers) -> Optional[bytes]`
- `handle_text_input(data) -> Optional[bytes]`
- `handle_command(data) -> Optional[bytes]`

### `sdk.base_handler`
Abstract base for text handlers.

Required methods:
- `can_handle(text, session_id=0) -> bool`
- `handle(text, session_id=0) -> str`

Utilities:
- `petscii_to_utf8(petscii_bytes) -> str`
- `utf8_to_petscii(text) -> bytes`

### `sdk.command_handler`
Parses C64 packets and routes requests.

Protocol:
- Magic: `0xFE`
- Byte 1: `(console_id << 4) | cmd_id`
- `cmd_id`:
  - `0x00` command
  - `0x01` keypress
  - `0x02` text input

### `sdk.console_manager`
Singleton lifecycle manager for console instances.

Core methods:
- `ConsoleManager.instance()`
- `register_factory(console_id, factory)`
- `get_console(console_id, session_id)`
- `handle_keypress(...)`
- `handle_text_input(...)`
- `handle_command(...)`

### `sdk.network_helper`
Communication with Ultimate64 DMA service.

Key methods:
- `send_screen_data(screen_data, color_data)`
- `send_vic_colors(border, background)`
- `send_dmawrite(host, prg_data)`
- `dma_read_memory(host, address, length)`
- `send_c64_keyboard_input(data, host=None)`

### `sdk.shared_state`
Per-session in-memory state.

Key methods:
- `get_session_state(session_id)`
- `get_clipboard(session_id)`
- `set_clipboard(session_id, text)`

### `sdk.config_manager`
Centralized `workspace/.config/cloud_config.cfg` access.

Key methods:
- `read_config()`
- `write_config(data)`
- `get_merged_config()`
- `get_llm_config(role)`
- `apply_env_overrides()`

### `sdk.petscii`
Shared conversion utilities.

Key methods:
- `petscii_to_ascii(code)`
- `ascii_to_petscii(code)`
- `petscii_to_utf8(bytes)`
- `utf8_to_petscii(text)`
- `petscii_to_char(code)`
- `ascii_to_screencode(code)`
- `petscii_to_screencode(code)`
- `char_to_screencode(ch)`

### `sdk.text_utils`
Formatting for 40-column UIs.

Key methods:
- `word_wrap(text, width=40)`
- `truncate(text, width, ellipsis='..')`
- `strip_html(text)`
- `normalize_whitespace(text)`
- `center_text(text, width=40)`

### `sdk.c64_colors`
Single source of truth for C64 colors and semantic roles.

Palette:
- `COL_BLACK` ... `COL_LIGHT_GREY` (0..15)

Semantic aliases:
- `COL_STATUS_FG`, `COL_USER_FG`, `COL_AGENT_FG`, `COL_ERROR_FG`, etc.

## Creating a New Console App

1. Create file in `cloud/server-apps/`.
2. Subclass `sdk.ServerConsole`.
3. Keep render logic in a dedicated method (`_full_render`).
4. Handle PETSCII input in mode-based key handlers.
5. Use `put_text`, `word_wrap`, and shared color constants.
6. Register console ID in `cloud/cloud_server.py`.

Template:
```python
from sdk import ServerConsole
from sdk import SCREEN_COLS, SCREEN_ROWS
from sdk import word_wrap
from sdk.c64_colors import COL_WHITE, COL_BLUE

class MyConsole(ServerConsole):
    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        self.mode = 0
        self._render()

    def handle_keypress(self, petscii_code: int, modifiers: int):
        # app-specific input logic
        self._render()
        self.push_screen()
        return None

    def _render(self):
        self.clear()
        self.put_text(0, 0, "My Console", COL_WHITE, reverse=True)
```

## Creating a New Handler App

1. Create file in `cloud/handlers/`.
2. Subclass `sdk.BaseHandler`.
3. Implement `can_handle` and `handle`.
4. Register in `cloud/request_dispatcher.py`.

Template:
```python
from sdk import BaseHandler, get_session_state

class MyHandler(BaseHandler):
    def can_handle(self, text: str, session_id: int = 0) -> bool:
        return text.strip().lower().startswith("x:")

    def handle(self, text: str, session_id: int = 0) -> str:
        state = get_session_state(session_id)
        payload = text[2:].strip()
        state["last_x"] = payload
        return f"X handled: {payload}"
```

## C64 IO Principles Encapsulated by SDK

Input from C64:
- command packets
- keypress packets
- text-input packets

Output to C64:
- full screen push to `$0400`
- full color push to `$D800`
- optional VIC color updates (`$D020`, `$D021`)

This is abstracted by:
- `sdk.command_handler`
- `sdk.console_manager`
- `sdk.network_helper`
- `sdk.server_console`
