"""
Unit tests for graceful diacritics transliteration (issue #3).

Covers the shared ``sdk.petscii`` primitives that all PETSCII server apps
(telegram_chat, web_browser, rss_reader, wiki_browser) now route through:

  - ``transliterate``       — string-level graceful Unicode → ASCII
  - ``char_to_screencode``  — per-char safety net (no longer blanks accents)
  - ``utf8_to_petscii``     — PETSCII byte stream for the C64

The regression these guard against: accented / non-ASCII characters used to
render as blank spaces (or be dropped entirely, e.g. German ß), so Czech,
German and Spanish text was unreadable on the 40-column display.
"""

import os
import sys

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
if _CLOUD_DIR not in sys.path:
    sys.path.insert(0, _CLOUD_DIR)

import pytest

from sdk.petscii import (
    transliterate,
    char_to_screencode,
    ascii_to_screencode,
    utf8_to_petscii,
    DEFAULT_SCREEN_CODE,
)


# ── transliterate: language coverage ────────────────────────────────

@pytest.mark.parametrize(
    "text, expected",
    [
        # Czech — all handled by NFKD fall-through
        ("Přerov", "Prerov"),
        ("žížala", "zizala"),
        ("Škoda Octavia", "Skoda Octavia"),
        ("příliš žluťoučký kůň", "prilis zlutoucky kun"),
        # German — umlaut expansion + eszett (would otherwise be dropped)
        ("Straße", "Strasse"),
        ("Grüße", "Gruesse"),
        ("Müller", "Mueller"),
        ("Björk", "Bjoerk"),
        ("Ärger", "Aerger"),
        ("Öl", "Oel"),
        # Spanish — enye + inverted punctuation
        ("mañana", "manana"),
        ("¿Qué tal?", "?Que tal?"),
        ("¡Hola!", "!Hola!"),
        ("El Niño", "El Nino"),
    ],
)
def test_transliterate_languages(text, expected):
    assert transliterate(text) == expected


# ── transliterate: typography / symbols that have no ASCII base ──────

@pytest.mark.parametrize(
    "text, expected",
    [
        ("„quote“", '"quote"'),
        ("‘single’", "'single'"),
        ("en – em — dash", "en - em - dash"),
        ("wait…", "wait..."),
        ("€10", "EUR10"),
        ("naïve café", "naive cafe"),
    ],
)
def test_transliterate_typography(text, expected):
    assert transliterate(text) == expected


def test_transliterate_preserves_newlines_and_ascii():
    assert transliterate("Line1\nLine2") == "Line1\nLine2"
    assert transliterate("plain ASCII 123!") == "plain ASCII 123!"


def test_transliterate_is_ascii_only():
    """Whatever comes out must be pure ASCII (safe for the C64 mapping)."""
    sample = "Grüße aus Přerov — ¿qué? café €5 „naïve“ Niño"
    out = transliterate(sample)
    assert out.isascii()


# ── char_to_screencode: the anti-regression checks ──────────────────

def test_accented_char_is_not_blank():
    """Accented letters must map to their base glyph, never to a space."""
    space = ascii_to_screencode(ord(" "))
    for accented, base in [("č", "c"), ("é", "e"), ("ñ", "n"), ("ü", "u")]:
        sc = char_to_screencode(accented)
        assert sc != space
        assert sc == ascii_to_screencode(ord(base))


def test_eszett_char_falls_back_to_first_expansion_glyph():
    """ß expands to 'ss'; a single cell can only show the first glyph 's'."""
    assert char_to_screencode("ß") == ascii_to_screencode(ord("s"))


def test_unmappable_char_becomes_space():
    """A char with no ASCII form degrades to the space screen code."""
    assert char_to_screencode("​") == DEFAULT_SCREEN_CODE  # zero-width space


# ── utf8_to_petscii: end-to-end byte stream ─────────────────────────

def test_utf8_to_petscii_expands_before_encoding():
    # 'Straße' -> 'Strasse' (7 bytes), no dropped characters
    out = utf8_to_petscii("Straße")
    assert len(out) == len("Strasse")


def test_utf8_to_petscii_newline_conversion():
    out = utf8_to_petscii("a\nb")
    assert 0x0D in out  # PETSCII carriage return
