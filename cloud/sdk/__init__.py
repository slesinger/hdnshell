"""
C64 Cloud Server Internal Python SDK

A comprehensive software development kit for building server-side applications
for the Hondani Shell C64 HDN Cloud Server. The SDK provides a clean, unified API
for:

  - Server-side virtual console management (screen buffers, rendering, I/O)
  - C64 protocol communication (DMA writes, packet parsing, screen push)
  - Session state and configuration management
  - Text formatting for 40-column displays
  - PETSCII/ASCII/UTF-8 bidirectional conversion
  - Handler-based request processing (text in, text out)

The SDK eliminates code duplication across 12 server applications by consolidating
shared utilities, constants, and patterns into a single reusable package.

## Architecture

### Core Console Layer
  - ServerConsole: Virtual 40x25 display with screen/color buffers
  - ConsoleManager (singleton): Manage up to 10 console instances per session
  - CommandHandler: Parse C64 packets, route to appropriate handler

### Communication Layer
  - NetworkHelper: Send screen data via DMA, keyboard input, etc.
  - SharedState: Per-session state dictionary (clipboard, active module, etc.)

### Text & Encoding Layer
  - PETSCII utilities: Bidirectional PETSCII ↔ ASCII ↔ UTF-8 conversion
  - TextUtils: Word wrapping, truncation, HTML stripping, etc.
  - C64Colors: Unified color palette with semantic names

### Configuration Layer
  - ConfigManager: Centralized configuration file management
  - WorkspaceInit: Workspace directory initialization

### Application Patterns
  - BaseHandler: Abstract base for text-based request handlers
  - ServerConsole subclasses: Extend for custom 40x25 screen consoles

## Usage Examples

### Creating a Console Application

```python
from sdk import ServerConsole, SCREEN_COLS
from sdk.c64_colors import COL_GREEN, COL_WHITE

class MyConsole(ServerConsole):
    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        self.mode = "main"
    
    def handle_keypress(self, petscii_code: int, modifiers: int):
        self.write_text(f"Key: {chr(petscii_code)}")
        self._full_render()  # My custom render method
        self.push_screen()  # Send to C64
```

### Creating a Handler Application

```python
from sdk import BaseHandler, utf8_to_petscii, get_session_state

class MyHandler(BaseHandler):
    def can_handle(self, text: str, session_id: int = 0) -> bool:
        return text.strip().lower().startswith("my:")
    
    def handle(self, text: str, session_id: int = 0) -> str:
        query = text[3:].strip()
        result = f"Processed: {query}"
        return result
```

## Public API

This package exports a clean public interface via the classes, functions, and
constants below. All internal imports should go through this module (sdk.__init__)
rather than importing submodules directly, to maintain API stability.
"""

# ─────────────────────────────────────────────────────────────────────
# Server Console & Management
# ─────────────────────────────────────────────────────────────────────

from .server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    DEFAULT_SCREEN_CODE,
    DEFAULT_FG_COLOR,
    DEFAULT_BG_COLOR,
)

from .console_manager import ConsoleManager

# ─────────────────────────────────────────────────────────────────────
# Request Handlers & Protocol
# ─────────────────────────────────────────────────────────────────────

from .base_handler import BaseHandler

from .command_handler import (
    CommandHandler,
    CommandID,
    ResponseType,
    ModifierFlags,
    MAGIC_BYTES,
    SERVER_CMD_GET_SCREEN,
)

# ─────────────────────────────────────────────────────────────────────
# C64 Communication
# ─────────────────────────────────────────────────────────────────────

from .network_helper import (
    send_screen_data,
    send_vic_colors,
    send_dmawrite,
    dma_read_memory,
    send_c64_keyboard_input,
    read_last_c64_ip,
    DMA_SERVICE_PORT,
)

# ─────────────────────────────────────────────────────────────────────
# Session & State Management
# ─────────────────────────────────────────────────────────────────────

from .shared_state import get_session_state, get_clipboard, set_clipboard

# ─────────────────────────────────────────────────────────────────────
# Configuration
# ─────────────────────────────────────────────────────────────────────

from .config_manager import (
    read_config,
    write_config,
    get_merged_config,
    get_llm_config,
    apply_env_overrides,
    migrate_config,
    mask_secret,
)

from .cloud_config_template import (
    CONFIG_DEFAULTS,
    SECRET_KEYS,
    ENV_OVERRIDE_KEYS,
)

# ─────────────────────────────────────────────────────────────────────
# PETSCII & Text Encoding
# ─────────────────────────────────────────────────────────────────────

from .petscii import (
    petscii_to_ascii,
    ascii_to_petscii,
    petscii_to_utf8,
    utf8_to_petscii,
    petscii_to_char,
    char_to_screencode,
    ascii_to_screencode,
    petscii_to_screencode,
)

# ─────────────────────────────────────────────────────────────────────
# Text Formatting for 40-Column Display
# ─────────────────────────────────────────────────────────────────────

from .text_utils import (
    word_wrap,
    truncate,
    strip_html,
    normalize_whitespace,
    center_text,
    pad_right,
    pad_left,
    split_into_lines,
    limit_lines,
)

# ─────────────────────────────────────────────────────────────────────
# C64 Color Palette & Semantic Assignments
# ─────────────────────────────────────────────────────────────────────

from .c64_colors import (
    # Standard palette
    COL_BLACK,
    COL_WHITE,
    COL_RED,
    COL_CYAN,
    COL_PURPLE,
    COL_GREEN,
    COL_BLUE,
    COL_YELLOW,
    COL_ORANGE,
    COL_BROWN,
    COL_LIGHT_RED,
    COL_DARK_GREY,
    COL_GREY,
    COL_LIGHT_GREEN,
    COL_LIGHT_BLUE,
    COL_LIGHT_GREY,
    # Semantic assignments
    COL_STATUS_BG,
    COL_STATUS_FG,
    COL_USER_FG,
    COL_AGENT_FG,
    COL_SYSTEM_FG,
    COL_ACTION_FG,
    COL_ERROR_FG,
    COL_WARNING_FG,
    COL_INPUT_FG,
    COL_SEPARATOR_FG,
    COL_BROWSER_DIR,
    COL_BROWSER_FILE,
    COL_HELP_FG,
    COL_THINKING_FG,
    COL_TEXT_DEFAULT_FG,
    COL_TEXT_DEFAULT_BG,
    COL_HIGHLIGHT,
    COL_BORDER,
)

# ─────────────────────────────────────────────────────────────────────
# Workspace & Network Utilities
# ─────────────────────────────────────────────────────────────────────

from .workspace import (
    WORKSPACE_DIR,
    init_workspace,
    get_workspace_config_path,
)

from .net_utils import (
    get_primary_ip,
    get_network,
    scan_network_for_port_64,
    scan_network_for_modem,
    find_port_64_hosts,
)

# ─────────────────────────────────────────────────────────────────────
# PETSCII Table Access (for advanced use)
# ─────────────────────────────────────────────────────────────────────

from .generate_pet_asc_table import Petscii

# ─────────────────────────────────────────────────────────────────────
# Package Metadata
# ─────────────────────────────────────────────────────────────────────

__version__ = "1.0.0"
__author__ = "Hondani Cloud SDK"
__description__ = "Internal Python SDK for C64 Cloud Server Applications"

__all__ = [
    # Console
    "ServerConsole",
    "ConsoleManager",
    "SCREEN_COLS",
    "SCREEN_ROWS",
    "SCREEN_SIZE",
    "DEFAULT_SCREEN_CODE",
    "DEFAULT_FG_COLOR",
    "DEFAULT_BG_COLOR",
    # Handlers
    "BaseHandler",
    "CommandHandler",
    "CommandID",
    "ResponseType",
    "ModifierFlags",
    # Communication
    "send_screen_data",
    "send_vic_colors",
    "send_dmawrite",
    "dma_read_memory",
    "send_c64_keyboard_input",
    "read_last_c64_ip",
    # State
    "get_session_state",
    "get_clipboard",
    "set_clipboard",
    # Config
    "read_config",
    "write_config",
    "get_merged_config",
    "get_llm_config",
    # Text Encoding
    "petscii_to_utf8",
    "utf8_to_petscii",
    "petscii_to_char",
    "char_to_screencode",
    # Text Utils
    "word_wrap",
    "truncate",
    "strip_html",
    "normalize_whitespace",
    "center_text",
    # Colors
    "COL_BLACK",
    "COL_WHITE",
    "COL_RED",
    "COL_CYAN",
    "COL_GREEN",
    "COL_BLUE",
    "COL_YELLOW",
    "COL_USER_FG",
    "COL_AGENT_FG",
    "COL_ERROR_FG",
    # Workspace
    "WORKSPACE_DIR",
    "init_workspace",
    "get_workspace_config_path",
]
