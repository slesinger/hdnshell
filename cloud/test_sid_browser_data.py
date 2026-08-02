"""
Offline tests for the SID Browser's data layer (GH #28).

No network, no C64: STIL/Songlengths parsing, PSID/RSID header decoding,
path-derived composers, saving with the companion note, and playlist +
Extended M3U round-tripping. Everything that talks to a mirror or to the
hardware is tested elsewhere (or by hand, on hardware).
"""

import os
import struct

import pytest

from sdk.hvsc_index import (
    filename_title,
    parse_songlengths,
    parse_stil,
    path_author_and_section,
)
from sdk.sid_header import (
    SidHeaderError,
    parse_sid_header,
    save_sid_to_workspace,
)
from sdk.sid_playlists import (
    FAVORITES,
    PlaylistStore,
    export_m3u,
    import_m3u,
)


# ======================================================================
#  STIL.txt
# ======================================================================

STIL_SAMPLE = """\
#  The SID Tune Information List
#  (preamble that must be ignored)

/MUSICIANS/H/Hubbard_Rob/Commando.sid
  TITLE: Commando
  ARTIST: Rob Hubbard
  COMMENT: Cover of the arcade original by Kouji Murata.
           The high-score tune is a Hubbard original.

/MUSICIANS/H/Hubbard_Rob/Delta.sid
  TITLE: Delta
(#1)
  TITLE: Delta (main theme)
  COMMENT: Inspired by Philip Glass' Koyaanisqatsi.
(#2)
  TITLE: Delta (high score)
  ARTIST: Rob Hubbard

/GAMES/A-F/Bubble_Bobble.sid
  COMMENT: No title or artist here at all.
"""


def test_stil_parses_a_simple_block():
    stil = parse_stil(STIL_SAMPLE)
    entry = stil["/MUSICIANS/H/Hubbard_Rob/Commando.sid"]
    assert entry["titles"] == ["Commando"]
    assert entry["author"] == "Rob Hubbard"
    assert "Kouji Murata" in entry["comment"]
    assert entry["per_subtune"] is False


def test_stil_folds_comment_continuation_lines():
    stil = parse_stil(STIL_SAMPLE)
    comment = stil["/MUSICIANS/H/Hubbard_Rob/Commando.sid"]["comment"]
    # The indented continuation belongs to the preceding COMMENT, not to a
    # field of its own.
    assert "high-score tune is a Hubbard original" in comment
    assert "\n" not in comment.strip(), "continuation must fold into one line"


def test_stil_collects_every_subtune_title():
    # Recall matters more than display here: all subtune titles must be
    # retrievable, even though the console shows a short one.
    entry = parse_stil(STIL_SAMPLE)["/MUSICIANS/H/Hubbard_Rob/Delta.sid"]
    assert entry["per_subtune"] is True
    assert "Delta (main theme)" in entry["titles"]
    assert "Delta (high score)" in entry["titles"]
    assert "Koyaanisqatsi" in entry["comment"]


def test_stil_keeps_the_raw_block_for_the_credits_note():
    entry = parse_stil(STIL_SAMPLE)["/MUSICIANS/H/Hubbard_Rob/Commando.sid"]
    assert entry["raw_block"].startswith("/MUSICIANS/H/Hubbard_Rob/Commando.sid")
    assert "ARTIST: Rob Hubbard" in entry["raw_block"]


def test_stil_tolerates_a_block_with_no_title_or_artist():
    entry = parse_stil(STIL_SAMPLE)["/GAMES/A-F/Bubble_Bobble.sid"]
    assert entry["titles"] == []
    assert entry["author"] == ""
    assert entry["comment"]


def test_stil_ignores_the_preamble():
    assert all(p.startswith("/") for p in parse_stil(STIL_SAMPLE))


# ======================================================================
#  Songlengths.md5
# ======================================================================

SONGLENGTHS_SAMPLE = """\
[Database]
; /MUSICIANS/H/Hubbard_Rob/Commando.sid
c7b8c... =3:47 1:29 2:03
; /MUSICIANS/H/Hubbard_Rob/Delta.sid
d0ffe... =7:04.500
; /GAMES/A-F/Bubble_Bobble.sid
abcde... =0:32
"""


def test_songlengths_parses_multiple_subtunes():
    lengths = parse_songlengths(SONGLENGTHS_SAMPLE)
    entry = lengths["/MUSICIANS/H/Hubbard_Rob/Commando.sid"]
    assert entry["lengths"] == [227, 89, 123]
    assert entry["total_length_seconds"] == 439


def test_songlengths_accepts_fractional_seconds():
    entry = parse_songlengths(SONGLENGTHS_SAMPLE)["/MUSICIANS/H/Hubbard_Rob/Delta.sid"]
    assert entry["lengths"] == [424]


def test_songlengths_skips_the_section_header():
    assert all(p.startswith("/") for p in parse_songlengths(SONGLENGTHS_SAMPLE))


# ======================================================================
#  Path-derived composer / section
# ======================================================================


@pytest.mark.parametrize(
    "path,expected",
    [
        ("/MUSICIANS/H/Hubbard_Rob/Commando.sid", ("Hubbard, Rob", "MUSICIANS")),
        ("/MUSICIANS/G/Galway_Martin/Wizball.sid", ("Galway, Martin", "MUSICIANS")),
        # Sections with no composer-folder convention: STIL is the only source.
        ("/GAMES/A-F/Bubble_Bobble.sid", ("", "GAMES")),
        ("/DEMOS/0-9/2nd_Reality.sid", ("", "DEMOS")),
        ("/CGSC/Composers/Whatever.sid", ("", "CGSC")),
        ("", ("", "")),
    ],
)
def test_path_author_and_section(path, expected):
    assert path_author_and_section(path) == expected


def test_path_author_covers_tunes_with_no_stil_entry():
    # This is the whole point: most HVSC tunes have no STIL block, so
    # searching a composer name would find nothing without this.
    author, _ = path_author_and_section("/MUSICIANS/D/Daglish_Ben/Trap.sid")
    assert author == "Daglish, Ben"


def test_filename_title_is_readable():
    assert filename_title("/MUSICIANS/H/Hubbard_Rob/Last_Ninja.sid") == "Last Ninja"


# ======================================================================
#  PSID / RSID header
# ======================================================================


def _build_sid(
    magic=b"PSID",
    version=2,
    data_offset=0x7C,
    load_address=0x0000,
    init_address=0x1000,
    play_address=0x1003,
    songs=3,
    start_song=1,
    name="Test Tune",
    author="Test Author",
    released="2026 HDN",
    flags=0x0024,  # PAL (bits 3-2 = 01), 8580 (bits 5-4 = 10)
    embedded_load=0x1000,
    payload=b"\xEA" * 16,
):
    header = struct.pack(
        ">4sHHHHHHHI",
        magic,
        version,
        data_offset,
        load_address,
        init_address,
        play_address,
        songs,
        start_song,
        0,  # speed
    )
    for field in (name, author, released):
        header += field.encode("latin-1").ljust(32, b"\x00")[:32]
    if version >= 2:
        # flags, startPage, pageLength, secondSIDAddress, thirdSIDAddress
        header += struct.pack(">HBBBB", flags, 0x08, 0x20, 0, 0)
    body = b""
    if load_address == 0:
        body += struct.pack("<H", embedded_load)
    return header + body + payload


def test_parses_the_core_header_fields():
    header = parse_sid_header(_build_sid())
    assert header.magic == "PSID"
    assert header.version == 2
    assert header.init_address == 0x1000
    assert header.play_address == 0x1003
    assert header.songs == 3
    assert header.name == "Test Tune"
    assert header.author == "Test Author"
    assert header.released == "2026 HDN"


def test_zero_load_address_comes_from_the_embedded_little_endian_word():
    # The single most common way to misread a .sid file.
    header = parse_sid_header(_build_sid(load_address=0, embedded_load=0xC800))
    assert header.load_address == 0xC800


def test_nonzero_load_address_is_taken_from_the_header():
    header = parse_sid_header(_build_sid(load_address=0x5000))
    assert header.load_address == 0x5000


def test_v2_flags_decode_clock_and_sid_model():
    assert parse_sid_header(_build_sid(flags=0x0024)).clock == "PAL"
    assert parse_sid_header(_build_sid(flags=0x0024)).sid_model == "8580"
    assert parse_sid_header(_build_sid(flags=0x0018)).clock == "NTSC"
    assert parse_sid_header(_build_sid(flags=0x0018)).sid_model == "6581"


def test_rsid_is_recognised():
    assert parse_sid_header(_build_sid(magic=b"RSID")).magic == "RSID"


def test_display_helpers_explain_the_zero_cases():
    header = parse_sid_header(_build_sid(init_address=0, play_address=0))
    assert header.init_address_display() == "= load address"
    assert "own IRQ" in header.play_address_display()


def test_rejects_a_non_sid_file():
    with pytest.raises(SidHeaderError):
        parse_sid_header(b"C64 PRG maybe, but not a SID" * 8)


def test_rejects_a_truncated_file():
    with pytest.raises(SidHeaderError):
        parse_sid_header(_build_sid()[:0x20])


# ======================================================================
#  Saving with the companion note
# ======================================================================


def test_save_writes_the_tune_and_a_credits_note(tmp_path):
    data = _build_sid(load_address=0x5000)
    sid_path, txt_path = save_sid_to_workspace(
        data,
        "/MUSICIANS/H/Hubbard_Rob/Commando.sid",
        str(tmp_path / "demos"),
        mirror="https://www.hvsc.de/download/C64Music",
        stil_raw_block="COMMENT: Cover of the arcade original.",
    )

    assert os.path.basename(sid_path) == "Commando.sid"
    with open(sid_path, "rb") as f:
        assert f.read() == data, "the .sid must be saved byte for byte"

    note = open(txt_path, encoding="utf-8").read()
    assert "/MUSICIANS/H/Hubbard_Rob/Commando.sid" in note
    assert "hvsc.de" in note
    assert "Test Author" in note
    assert "arcade original" in note, "the STIL block belongs in the note"
    assert "$5000" in note


def test_saved_note_carries_the_licensing_reminder(tmp_path):
    # HVSC tunes are not public domain; the note is what stops a user
    # shipping one by accident.
    _, txt_path = save_sid_to_workspace(
        _build_sid(), "/MUSICIANS/H/Hubbard_Rob/Commando.sid", str(tmp_path)
    )
    note = open(txt_path, encoding="utf-8").read().lower()
    assert "licen" in note or "permission" in note


# ======================================================================
#  Playlists and Extended M3U
# ======================================================================


class _FakeIndex:
    """Just enough of HvscIndex for export_m3u."""

    class _Row:
        def __init__(self, title, author, lengths):
            self.title, self.author, self.lengths = title, author, lengths

    def __init__(self, rows):
        self.rows = rows

    def get_by_path(self, path):
        return self.rows.get(path)


COMMANDO = "/MUSICIANS/H/Hubbard_Rob/Commando.sid"
DELTA = "/MUSICIANS/H/Hubbard_Rob/Delta.sid"


def _index():
    return _FakeIndex(
        {
            COMMANDO: _FakeIndex._Row("Commando", "Rob Hubbard", [227]),
            DELTA: _FakeIndex._Row("Delta", "Rob Hubbard", [424]),
        }
    )


def test_playlist_add_remove_and_membership():
    store = PlaylistStore({})
    store.create("Demo music")
    assert store.add("Demo music", COMMANDO) is True
    assert store.add("Demo music", COMMANDO) is False, "no duplicates"
    assert store.contains("Demo music", COMMANDO)
    assert store.paths("Demo music") == [COMMANDO]
    assert store.remove("Demo music", COMMANDO) is True
    assert store.paths("Demo music") == []


def test_favorites_toggle():
    store = PlaylistStore({})
    assert store.toggle_favorite(COMMANDO) is True
    assert store.is_favorite(COMMANDO)
    assert store.toggle_favorite(COMMANDO) is False
    assert not store.is_favorite(COMMANDO)
    assert FAVORITES in store.list_playlists()


def test_deleting_a_playlist():
    store = PlaylistStore({})
    store.create("Scratch")
    assert store.delete("Scratch") is True
    assert "Scratch" not in store.list_playlists()


def test_m3u_export_is_extended_format_with_playable_urls():
    store = PlaylistStore({})
    store.create("Demo music")
    store.add("Demo music", COMMANDO)
    store.add("Demo music", DELTA)

    text = export_m3u(store, "Demo music", _index())
    lines = text.strip().splitlines()
    assert lines[0] == "#EXTM3U"
    assert lines[1] == "#EXTINF:227,Rob Hubbard - Commando"
    # Full URLs, so the file also works in a desktop player.
    assert lines[2].startswith("http") and lines[2].endswith(COMMANDO)


def test_m3u_round_trip():
    store = PlaylistStore({})
    store.create("Demo music")
    store.add("Demo music", COMMANDO)
    store.add("Demo music", DELTA)

    assert import_m3u(export_m3u(store, "Demo music", _index())) == [COMMANDO, DELTA]


def test_m3u_import_reanchors_on_the_section_across_mirrors():
    # Exported against one mirror, imported against another: the mirror's own
    # path prefix must not survive into the stored HVSC path.
    text = (
        "#EXTM3U\n"
        "#EXTINF:227,Rob Hubbard - Commando\n"
        f"https://hvsc.sannic.nl/C64Music{COMMANDO}\n"
        f"https://www.hvsc.de/download/C64Music{DELTA}\n"
    )
    assert import_m3u(text) == [COMMANDO, DELTA]


def test_m3u_import_accepts_bare_relative_paths():
    assert import_m3u(f"#EXTM3U\n{COMMANDO}\n") == [COMMANDO]


def test_m3u_import_skips_comments_and_blank_lines():
    assert import_m3u("#EXTM3U\n\n#EXTINF:1,x\n\n") == []
