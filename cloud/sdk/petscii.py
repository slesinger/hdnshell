"""
PETSCII ↔ UTF-8 ↔ ASCII ↔ Screen Code Conversion Utilities

Provides comprehensive bidirectional conversion between multiple text encoding
formats needed for C64 communication:
  - PETSCII (Commodore default encoding)
  - ASCII / UTF-8 (Python strings)
  - Screen codes (C64 VIC-II character ROM indices)

Single source of truth: eliminates duplicated conversion code across
telegram_chat, web_browser, wiki_browser, rss_reader, coding_agent_console,
file_editor_console, base_handler, and server_console.
"""

from .generate_pet_asc_table import Petscii
import unicodedata
from typing import Optional

# Default values for conversions
DEFAULT_SCREEN_CODE = 0x20  # Space character

# ── Graceful transliteration map ─────────────────────────────────────
# Multi-character expansions and punctuation substitutions applied BEFORE
# NFKD normalization, so Unicode text degrades to readable ASCII on the
# C64 40-column display instead of being silently dropped.
#
# Language conventions covered:
#   German  — umlauts expand (ä→ae, ö→oe, ü→ue) and ß→ss (NFKD would drop ß).
#   Spanish — ñ→n and inverted punctuation ¿→? ¡→! (NFKD drops ¿ ¡).
#   Czech   — handled entirely by the NFKD fall-through (ř→r, š→s, ž→z, …).
# Common typography (curly quotes, dashes, ellipsis, €) is normalised too,
# since those characters have no NFKD ASCII form and would otherwise vanish.
_TRANSLIT_MAP = {
    # German umlauts / eszett (German ASCII convention)
    ord("ä"): "ae",
    ord("ö"): "oe",
    ord("ü"): "ue",
    ord("Ä"): "Ae",
    ord("Ö"): "Oe",
    ord("Ü"): "Ue",
    ord("ß"): "ss",
    ord("ẞ"): "SS",
    # Spanish enye + inverted punctuation
    ord("ñ"): "n",
    ord("Ñ"): "N",
    ord("¿"): "?",
    ord("¡"): "!",
    # Ligatures
    ord("æ"): "ae",
    ord("Æ"): "Ae",
    ord("œ"): "oe",
    ord("Œ"): "Oe",
    # Quotes
    ord("„"): '"',
    ord("“"): '"',
    ord("”"): '"',
    ord("«"): '"',
    ord("»"): '"',
    ord("‘"): "'",
    ord("’"): "'",
    ord("‚"): "'",
    # Dashes / ellipsis / bullets
    ord("–"): "-",
    ord("—"): "-",
    ord("―"): "-",
    ord("…"): "...",
    ord("•"): "*",
    ord("·"): ".",
    # Currency / symbols
    ord("€"): "EUR",
    ord("™"): "(tm)",
    ord("©"): "(c)",
    ord("®"): "(r)",
    # Whitespace oddities
    ord(" "): " ",  # non-breaking space
    ord("​"): "",  # zero-width space
}


def transliterate(text: str) -> str:
    """Gracefully transliterate arbitrary Unicode text to ASCII.

    Two stages:
      1. Explicit substitutions from ``_TRANSLIT_MAP`` (multi-char expansions
         such as ß→ss and ä→ae, plus punctuation that has no ASCII base).
      2. NFKD normalization with an ASCII-only fallback, which strips the
         diacritics from any remaining accented letters (á→a, č→c, ñ→n, …).

    Newlines and other ASCII control characters are preserved.

    Args:
        text: Any Unicode string.

    Returns:
        An ASCII-only string. Characters with no sensible ASCII form are
        dropped (they were unrenderable on the C64 anyway).

    Example:
        >>> transliterate("Grüße aus Přerov — ¿qué?")
        'Gruesse aus Prerov - ?que?'
    """
    text = text.translate(_TRANSLIT_MAP)
    return (
        unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("ascii")
    )


# Special ASCII characters that need custom screen code mapping
_SPECIAL_ASCII = {
    ord("`"): 0x27,  # ` → apostrophe glyph on C64 screen ($27)
    ord("{"): 0x6B,  # { → screen code $6B
    ord("}"): 0x73,  # } → screen code $73
    ord("_"): 0x64,  # _ → screen code $64
    ord("~"): 0x68,  # ~ → screen code $68
    ord("|"): 0x5D,  # | → screen code $5D
    ord("\\"): 0x7F,  # \ → screen code $7F
    0x7F: 0x1F,  # DEL → screen code $1F
}


def petscii_to_ascii(petscii_code: int) -> int:
    """
    Convert a single PETSCII byte to ASCII.

    Uses the Petscii.petscii2ascii() lookup table from generate_pet_asc_table.py.

    Args:
        petscii_code: PETSCII byte value (0-255)

    Returns:
        ASCII byte value (0-127 equivalent)
    """
    return Petscii.petscii2ascii(petscii_code)


def ascii_to_petscii(ascii_code: int) -> int:
    """
    Convert a single ASCII byte to PETSCII.

    Uses the Petscii.ascii2petscii() lookup table from generate_pet_asc_table.py.

    Args:
        ascii_code: ASCII byte value (0-127 equivalent)

    Returns:
        PETSCII byte value (0-255 equivalent)
    """
    return Petscii.ascii2petscii(ascii_code)


def petscii_to_utf8(petscii_bytes: bytes) -> str:
    """
    Convert PETSCII bytes to UTF-8 Python string.

    This is used when receiving data from C64 to convert it to Python strings.

    Args:
        petscii_bytes: Sequence of PETSCII bytes

    Returns:
        UTF-8 string (Python str)
    """
    ascii_bytes = bytes([Petscii.petscii2ascii(b) for b in petscii_bytes])
    return ascii_bytes.decode("ascii", errors="replace")


def utf8_to_petscii(text: str) -> bytes:
    """
    Convert UTF-8 Python string to PETSCII bytes.

    This is used when sending data to C64 to convert Python strings to PETSCII.
    Handles:
      - Newline conversion (\\n → PETSCII CR, 0x0D)
      - Unicode normalization (NFKD) for decomposing characters with diacritics
      - ASCII fallback with 'ignore' for non-ASCII characters

    Args:
        text: UTF-8 string (Python str)

    Returns:
        PETSCII encoded bytes

    Example:
        >>> utf8_to_petscii("Hello")
        b'\\x48\\x45\\x4c\\x4c\\x4f'

        >>> utf8_to_petscii("Line1\\nLine2")
        b'\\x4c\\x49\\x4e\\x45\\x31\\x0d\\x4c\\x49\\x4e\\x45\\x32'
    """
    # Convert '\n' (LF, 0x0a) to PETSCII newline (CR, 0x0d).
    # Gracefully transliterate Unicode to ASCII first (ß→ss, ä→ae, curly
    # quotes → straight, etc.) then map each ASCII byte to PETSCII.
    ascii_text = transliterate(text)

    out_bytes = []
    for c in ascii_text:
        if c == "\n":
            out_bytes.append(0x0D)  # PETSCII newline
            continue
        out_bytes.append(Petscii.ascii2petscii(ord(c)))

    return bytes(out_bytes)


def petscii_to_char(petscii_code: int) -> Optional[str]:
    """
    Convert a single PETSCII byte to a printable Python character.

    Returns None if the PETSCII code is not printable (control characters, etc.).

    Args:
        petscii_code: PETSCII byte value (0-255)

    Returns:
        Printable character (chr), or None if not printable

    Example:
        >>> petscii_to_char(0x41)  # PETSCII 'A'
        'a'

        >>> petscii_to_char(0x0D)  # PETSCII newline
        None
    """
    ascii_code = Petscii.petscii2ascii(petscii_code)
    # Printable ASCII range: 32-126
    if 32 <= ascii_code < 127:
        return chr(ascii_code)
    return None


def ascii_to_screencode(ascii_code: int) -> int:
    """
    Convert an ASCII code point to a C64 screen code.

    Screen codes are indices into the C64's VIC-II character ROM.
    Mapping (uppercase mode):
        PC   $20-$3F  → $20-$3F   (space, digits, punctuation)
        PC   $41-$5A  → $41-$5A   (A-Z)
        PC   $5B-$5E  → $1B-$1E   ([, £, ], ↑)
        PC \\ (0x5C)  → $7F       (2nd+4th quadrant diagonal)
        PC _ (0x5F)   → $64       (thin lower horizontal line)
        PC ` (0x60)   → $27       (backtick → apostrophe glyph)
        PC   $61-$7A  → $01-$1A   (lowercase a-z mapped to lowercase screen codes)
        PC { (0x7B)   → $6B       (left nose)
        PC | (0x7C)   → $5D       (middle vertical)
        PC } (0x7D)   → $73       (right nose)
        PC ~ (0x7E)   → $68       (lower half-gray block)
        PC DEL (0x7F) → $1F       (←)
        anything else → $20 (space)

    Args:
        ascii_code: ASCII code (0-127)

    Returns:
        Screen code (0-255)
    """
    if ascii_code in _SPECIAL_ASCII:
        return _SPECIAL_ASCII[ascii_code]
    if 0x20 <= ascii_code <= 0x3F:
        return ascii_code
    if 0x41 <= ascii_code <= 0x5A:
        return ascii_code
    if 0x5B <= ascii_code <= 0x5E:
        return ascii_code - 0x40
    if 0x61 <= ascii_code <= 0x7A:
        return ascii_code - 0x60
    return DEFAULT_SCREEN_CODE


def petscii_to_screencode(petscii: int) -> int:
    """
    Convert a PETSCII byte to a C64 screen code.

    Standard PETSCII-to-screencode mapping used by the C64 ROM:
        $20-$3F  → $20-$3F
        $40-$5F  → $00-$1F
        $60-$7F  → $40-$5F
        $A0-$BF  → $60-$7F
        $C0-$DF  → $40-$5F
        $E0-$FE  → $60-$7E
        $FF      → $5E
        $00-$1F  → $80-$9F  (reverse video)
        $80-$9F  → control/color codes, not directly printable → $20

    Args:
        petscii: PETSCII byte value (0-255)

    Returns:
        Screen code (0-255)
    """
    if 0x20 <= petscii <= 0x3F:
        return petscii
    if 0x40 <= petscii <= 0x5F:
        return petscii - 0x40
    if 0x60 <= petscii <= 0x7F:
        return petscii - 0x20
    if 0xA0 <= petscii <= 0xBF:
        return petscii - 0x40
    if 0xC0 <= petscii <= 0xDF:
        return petscii - 0x80
    if 0xE0 <= petscii <= 0xFE:
        return petscii - 0x80
    if petscii == 0xFF:
        return 0x5E
    if 0x00 <= petscii <= 0x1F:
        return petscii + 0x80  # Reverse video characters
    # $80-$9F (colour / control) – not directly printable
    return DEFAULT_SCREEN_CODE


def char_to_screencode(ch: str) -> int:
    """
    Convert a Unicode character to a C64 screen code.

    Handles Unicode normalization (NFKD) to find ASCII base character.
    This is used when rendering HTML content or general text to the 40-column display.

    Args:
        ch: Single Unicode character

    Returns:
        Screen code (0-255)

    Example:
        >>> char_to_screencode('A')
        0

        >>> char_to_screencode('5')
        53

        >>> char_to_screencode('é')  # Decomposes to 'e'
        (screencode for 'e')
    """
    # Gracefully transliterate (handles ß→ss, ä→ae, ñ→n, accents, …).
    # A single input char may expand to several ASCII chars; the screen
    # cell can only hold one glyph, so we render the first of the expansion
    # (string-level callers should use transliterate() before laying out
    # columns to keep multi-char expansions visible).
    trans = transliterate(ch)
    base_char = trans[0] if trans else " "
    return ascii_to_screencode(ord(base_char))
