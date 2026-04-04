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

# Special ASCII characters that need custom screen code mapping
_SPECIAL_ASCII = {
    ord("@"): 0x00,     # @ → screen code $00
    ord("["): 0x1B,     # [ → screen code $1B
    ord("]"): 0x1D,     # ] → screen code $1D
    ord("{"): 0x6B,     # { → screen code $6B
    ord("}"): 0x73,     # } → screen code $73
    ord("_"): 0x64,     # _ → screen code $64
    ord("~"): 0x68,     # ~ → screen code $68
    ord("|"): 0x5D,     # | → screen code $5D
    ord("\\"): 0x7F,    # \ → screen code $7F
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
    # Normalize Unicode (NFKD) to decompose characters with diacritics,
    # then transliterate to ASCII-only string by encoding to ASCII
    # with 'ignore' (drops diacritic marks and yields base letters).
    ascii_text = (
        unicodedata.normalize("NFKD", text)
        .encode("ascii", "ignore")
        .decode("ascii")
    )

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
        PC @ (0x40)   → $00
        PC [ (0x5B)   → $1B
        PC ] (0x5D)   → $1D
        PC { (0x7B)   → $6B
        PC } (0x7D)   → $73
        PC _ (0x5F)   → $64
        PC ~ (0x7E)   → $68
        PC | (0x7C)   → $5D
        PC \\ (0x5C)  → $7F
        $20-$3F       → $20-$3F   (space, digits, punctuation)
        $40-$5F       → $00-$1F   (@, A-Z, [, £, ], ↑, ←)
        $60-$7F       → $00-$1F   (lowercase a-z mapped to uppercase screen codes)
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
    if 0x40 <= ascii_code <= 0x5F:
        return ascii_code - 0x40  # Uppercase letters map to $00-$1F
    if 0x60 <= ascii_code <= 0x7F:
        return ascii_code - 0x60  # Lowercase letters map to $00-$1F
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
    # Normalize via NFKD to decompose characters with diacritics
    normalized = unicodedata.normalize("NFKD", ch)
    # Take first character of normalized form (base character without diacritics)
    base_char = normalized[0] if normalized else ch

    # Get ASCII code
    ascii_code = ord(base_char)

    # Convert to screen code
    return ascii_to_screencode(ascii_code)
