"""
Text Formatting Utilities for 40-Column C64 Display

Provides text processing functions optimized for the C64's 40-column x 25-row display,
including word wrapping, truncation, HTML stripping, and whitespace normalization.

Single source of truth: eliminates duplicated text formatting code across
web_browser, wiki_browser, rss_reader, and coding_agent_console.
"""

from typing import List

SCREEN_COLS = 40
SCREEN_ROWS = 25


def word_wrap(text: str, width: int = SCREEN_COLS) -> List[str]:
    """
    Wrap text to fit within a specified column width.

    Intelligently breaks lines at word boundaries, collapsing trailing/leading
    whitespace on wrapping edges. If a word is longer than the width, it is
    included on its own line (no hyphenation).

    Args:
        text: Text to wrap (may contain newlines, which are preserved)
        width: Maximum columns per line (default: 40 for C64 screen)

    Returns:
        List of wrapped lines, each ≤ width characters

    Example:
        >>> word_wrap("The quick brown fox jumps over the lazy dog", 20)
        ['The quick brown fox', 'jumps over the lazy', 'dog']

        >>> word_wrap("Short\\nTest", 40)
        ['Short', 'Test']
    """
    result: List[str] = []

    for raw_line in text.split("\n"):
        while len(raw_line) > width:
            # Find the last space within the width limit
            break_idx = raw_line.rfind(" ", 0, width)

            if break_idx <= 0:
                # No space found, or space is at start: break at width
                break_idx = width

            # Add the line up to the break point
            result.append(raw_line[:break_idx].rstrip())

            # Continue with the rest, stripping leading whitespace
            raw_line = raw_line[break_idx:].lstrip()

        # Add the final line (or the original if it fit)
        if raw_line or not result or result[-1]:
            # Only add empty lines if we have content or they're purposeful
            result.append(raw_line)

    return result


def truncate(text: str, width: int = SCREEN_COLS, ellipsis: str = "..") -> str:
    """
    Truncate text to fit within a specified column width, adding ellipsis if needed.

    Args:
        text: Text to truncate
        width: Maximum columns (default: 40 for C64 screen)
        ellipsis: Suffix to add if truncated (default: "..")

    Returns:
        Truncated string, right-padded with spaces to fill width

    Example:
        >>> truncate("Hello World", 8)
        'Hello..."'

        >>> truncate("Hi", 8)
        'Hi      '
    """
    if len(text) <= width:
        return text.ljust(width)

    ellipsis_len = len(ellipsis)
    max_text_len = width - ellipsis_len

    if max_text_len <= 0:
        # Ellipsis is wider than available space, just truncate
        return text[:width]

    return text[:max_text_len] + ellipsis


def strip_html(text: str) -> str:
    """
    Remove HTML tags from text.

    Simple regex-based HTML tag stripping. For complex HTML parsing, use BeautifulSoup.

    Args:
        text: HTML text

    Returns:
        Text without HTML tags

    Example:
        >>> strip_html("<p>Hello <b>World</b></p>")
        'Hello World'
    """
    import re
    # Remove HTML tags: <...> and self-closing tags <.../>
    text = re.sub(r"<[^>]+>", "", text)
    return text


def normalize_whitespace(text: str) -> str:
    """
    Collapse multiple consecutive spaces and newlines into single separators.

    Reduces:
      - Multiple spaces → single space
      - Multiple newlines → single newline
      - Leading/trailing whitespace → stripped

    Args:
        text: Text to normalize

    Returns:
        Normalized text

    Example:
        >>> normalize_whitespace("Hello    world\\n\\ntest")
        'Hello world\\ntest'
    """
    import re
    # Collapse multiple spaces
    text = re.sub(r" +", " ", text)
    # Collapse multiple newlines (but preserve single newlines)
    text = re.sub(r"\n\n+", "\n", text)
    # Strip leading/trailing whitespace
    return text.strip()


def center_text(text: str, width: int = SCREEN_COLS) -> str:
    """
    Center text within a specified column width, padding with spaces.

    Args:
        text: Text to center
        width: Total width (default: 40 for C64 screen)

    Returns:
        Centered text, padded with spaces to fill width

    Example:
        >>> center_text("HELLO", 11)
        '   HELLO   '
    """
    if len(text) >= width:
        return text[:width]

    total_pad = width - len(text)
    left_pad = total_pad // 2
    right_pad = total_pad - left_pad

    return " " * left_pad + text + " " * right_pad


def pad_right(text: str, width: int = SCREEN_COLS, pad_char: str = " ") -> str:
    """
    Right-pad text to fill width.

    Args:
        text: Text to pad
        width: Target width
        pad_char: Character to use for padding (default: space)

    Returns:
        Text padded to width

    Example:
        >>> pad_right("TEST", 10, ".")
        'TEST......'
    """
    return text.ljust(width, pad_char)[:width]


def pad_left(text: str, width: int = SCREEN_COLS, pad_char: str = " ") -> str:
    """
    Left-pad text to fill width.

    Args:
        text: Text to pad
        width: Target width
        pad_char: Character to use for padding (default: space)

    Returns:
        Text padded to width

    Example:
        >>> pad_left("TEST", 10, ".")
        '......TEST'
    """
    return text.rjust(width, pad_char)[:width]


def split_into_lines(text: str, width: int = SCREEN_COLS) -> List[str]:
    """
    Split text into lines, handling both pre-existing newlines and word-wrapping.

    Combines word_wrap() and normalization for clean line-by-line text.

    Args:
        text: Text to split
        width: Maximum columns per line

    Returns:
        List of lines, each ≤ width characters
    """
    # Normalize whitespace first
    normalized = normalize_whitespace(text)
    # Then word-wrap
    return word_wrap(normalized, width)


def limit_lines(text: str, max_lines: int, width: int = SCREEN_COLS) -> List[str]:
    """
    Split text into lines, but limit to a maximum number of lines.

    Useful for displaying in a bounded UI area (e.g., status bar, chat view).

    Args:
        text: Text to split
        max_lines: Maximum number of lines to return
        width: Maximum columns per line

    Returns:
        List of lines (≤ max_lines), each ≤ width characters

    Example:
        >>> limit_lines("Line1\\nLine2\\nLine3\\nLine4", 2, 40)
        ['Line1', 'Line2']
    """
    lines = split_into_lines(text, width)
    return lines[:max_lines]
