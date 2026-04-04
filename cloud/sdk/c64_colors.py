"""
C64 Color Palette and Semantic Color Constants

Single source of truth for all Commodore 64 color values (0-15)
and semantic role-based color assignments used by Server Applications.

All server-side console apps should import colors from this module
instead of defining them locally.
"""

# ─────────────────────────────────────────────────────────────────────
# C64 Standard Color Palette (0-15)
# ─────────────────────────────────────────────────────────────────────
COL_BLACK = 0           # RGB: #000000
COL_WHITE = 1           # RGB: #FFFFFF
COL_RED = 2             # RGB: #883333
COL_CYAN = 3            # RGB: #AAAAFF
COL_PURPLE = 4          # RGB: #CC44CC
COL_GREEN = 5           # RGB: #00CC55
COL_BLUE = 6            # RGB: #0000EE
COL_YELLOW = 7          # RGB: #EEEE77
COL_ORANGE = 8          # RGB: #DD8855
COL_BROWN = 9           # RGB: #664400
COL_LIGHT_RED = 10      # RGB: #FF7777
COL_DARK_GREY = 11      # RGB: #333333
COL_GREY = 12           # RGB: #777777
COL_LIGHT_GREEN = 13    # RGB: #00FF88
COL_LIGHT_BLUE = 14     # RGB: #0088FF
COL_LIGHT_GREY = 15     # RGB: #BBBBBB

# ─────────────────────────────────────────────────────────────────────
# Semantic Color Assignments for UI Elements
# ─────────────────────────────────────────────────────────────────────

# Status bar colors
COL_STATUS_BG = COL_BLACK       # Status bar background
COL_STATUS_FG = COL_WHITE       # Status bar text

# Chat/Message colors (semantic by role)
COL_USER_FG = COL_LIGHT_BLUE    # User input messages
COL_AGENT_FG = COL_LIGHT_GREEN  # Agent/AI responses
COL_SYSTEM_FG = COL_CYAN        # System messages
COL_ACTION_FG = COL_YELLOW      # Agent actions (file writes, compile, run)

# Error and warning colors
COL_ERROR_FG = COL_RED          # Error messages
COL_WARNING_FG = COL_ORANGE     # Warning messages

# Input and UI colors
COL_INPUT_FG = COL_WHITE        # Input line text
COL_SEPARATOR_FG = COL_DARK_GREY  # Separator lines between sections

# Browser/File list colors
COL_BROWSER_DIR = COL_GREEN     # Directory entries
COL_BROWSER_FILE = COL_LIGHT_BLUE  # File entries

# Help and special modes
COL_HELP_FG = COL_CYAN          # Help text
COL_THINKING_FG = COL_YELLOW    # Loading/thinking indicator animation

# Generic UI colors for common patterns
COL_TEXT_DEFAULT_FG = COL_WHITE     # Default text color
COL_TEXT_DEFAULT_BG = COL_BLACK     # Default background
COL_HIGHLIGHT = COL_LIGHT_BLUE      # Highlighted/selected text
COL_BORDER = COL_CYAN               # Border decorations
