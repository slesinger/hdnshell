"""
Unit tests for UltimateHandler (mkdir / memcpy / mkdisk) and the "csdb" alias on
CSDBHandler.

All network access (ftplib.FTP, REST readmem/writemem) is mocked - these
tests never touch a live C64U.
"""

import os
import sys

import pytest

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_HANDLERS_DIR = os.path.join(_CLOUD_DIR, "handlers")
if _HANDLERS_DIR not in sys.path:
    sys.path.insert(0, _HANDLERS_DIR)

import ftplib

from sdk import network_helper
from sdk.shared_state import (
    get_session_state_copy,
    update_session_state,
    reset_all_session_states,
)
from ultimate_handler import UltimateHandler, _DEL_USAGE
from csdb_handler import CSDBHandler


@pytest.fixture(autouse=True)
def _isolate_session_state():
    """Session state is module-global; reset it so tests don't leak into each other."""
    reset_all_session_states()
    yield
    reset_all_session_states()


class FakeFTP:
    """Minimal ftplib.FTP stand-in for mkdir/memcpy tests."""

    instances = []

    def __init__(self, host=None, timeout=None):
        self.host = host
        self.timeout = timeout
        self.mkd_calls = []
        self.stor_calls = []
        self.retr_calls = []
        self.cwd_calls = []
        self.cwd_should_fail = False
        self.retr_data = b""
        # del support: mlsd() yields (name, {"type": "file"|"dir"}); delete()
        # records DELE calls. Tests set `mlsd_entries` / `mlsd_should_fail`.
        self.mlsd_entries = []
        self.mlsd_should_fail = False
        self.nlst_names = []
        self.delete_calls = []
        FakeFTP.instances.append(self)

    def login(self):
        pass

    def mkd(self, path):
        self.mkd_calls.append(path)
        return path

    def cwd(self, path):
        self.cwd_calls.append(path)
        if self.cwd_should_fail:
            raise ftplib.error_perm("550 no such dir")

    def storbinary(self, cmd, fp):
        self.stor_calls.append((cmd, fp.read()))

    def retrbinary(self, cmd, callback):
        self.retr_calls.append(cmd)
        callback(self.retr_data)

    def mlsd(self):
        if self.mlsd_should_fail:
            raise ftplib.error_perm("500 MLSD not understood")
        return list(self.mlsd_entries)

    def nlst(self):
        return list(self.nlst_names)

    def delete(self, name):
        self.delete_calls.append(name)

    def quit(self):
        pass

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc, tb):
        return False


@pytest.fixture(autouse=True)
def _reset_fake_ftp():
    FakeFTP.instances = []
    yield
    FakeFTP.instances = []


class TestUltimateHandlerCanHandle:
    def test_can_handle_mkdir(self):
        handler = UltimateHandler()
        assert handler.can_handle("mkdir /Temp/x")

    def test_can_handle_memcpy(self):
        handler = UltimateHandler()
        assert handler.can_handle("memcpy $c000-$c0ff /Temp/x")

    def test_can_handle_case_insensitive(self):
        handler = UltimateHandler()
        assert handler.can_handle("MEMCPY $c000-$c0ff /Temp/x")
        assert handler.can_handle("MkDir /Temp/x")

    def test_cannot_handle_unrelated(self):
        handler = UltimateHandler()
        assert not handler.can_handle("hello")
        assert not handler.can_handle("i: hi")
        assert not handler.can_handle("cp foo")
        assert not handler.can_handle("dir")

    def test_cannot_handle_empty(self):
        handler = UltimateHandler()
        assert not handler.can_handle("")
        assert not handler.can_handle("   ")


class TestMkdir:
    def test_mkdir_success(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        handler = UltimateHandler()
        session_id = 1
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdir /Temp/x", session_id)

        assert "OK" in response
        assert "/Temp/x" in response
        assert len(FakeFTP.instances) == 1
        assert FakeFTP.instances[0].mkd_calls == ["/Temp/x"]
        assert FakeFTP.instances[0].host == "1.2.3.4"

    def test_mkdir_no_client_ip(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        handler = UltimateHandler()
        session_id = 2

        response = handler.handle("mkdir /Temp/x", session_id)

        assert "?NO CLIENT IP" in response
        assert FakeFTP.instances == []

    def test_mkdir_requires_absolute_path(self):
        handler = UltimateHandler()
        session_id = 3
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdir Temp/x", session_id)
        assert "Usage" in response

        response = handler.handle("mkdir", session_id)
        assert "Usage" in response

    def test_mkdir_ftp_failure(self, monkeypatch):
        class FailingFTP(FakeFTP):
            def mkd(self, path):
                raise ftplib.error_perm("550 permission denied")

        monkeypatch.setattr(ftplib, "FTP", FailingFTP)
        handler = UltimateHandler()
        session_id = 4
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdir /Temp/x", session_id)
        assert "?FTP FAILED" in response


class TestMemcpySave:
    def test_memcpy_save_inclusive_length_and_stor(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)

        captured = {}

        def fake_dma_read_memory(host, address, length):
            captured.setdefault("calls", []).append((host, address, length))
            return bytes([address & 0xFF]) * length

        monkeypatch.setattr(network_helper, "dma_read_memory", fake_dma_read_memory)

        handler = UltimateHandler()
        session_id = 5
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("memcpy $c000-$c0ff /Temp/x", session_id)

        # inclusive range: c0ff - c000 + 1 == 256
        total_len = sum(c[2] for c in captured["calls"])
        assert total_len == 256
        assert "OK" in response
        assert "256" in response

        assert len(FakeFTP.instances) == 1
        ftp = FakeFTP.instances[0]
        assert len(ftp.stor_calls) == 1
        cmd, data = ftp.stor_calls[0]
        assert cmd == "STOR x"
        assert len(data) == 256

    def test_memcpy_save_chunks_reads_at_256(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)

        def fake_dma_read_memory(host, address, length):
            assert length <= 256
            return b"\x00" * length

        monkeypatch.setattr(network_helper, "dma_read_memory", fake_dma_read_memory)

        handler = UltimateHandler()
        session_id = 6
        update_session_state(session_id, client_ip="1.2.3.4")

        # 600-byte range should require multiple <=256 byte reads
        response = handler.handle("memcpy $c000-$c257 /Temp/big", session_id)
        assert "OK" in response
        assert "600" in response

    def test_memcpy_save_no_client_ip_falls_back_to_last_ip(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "9.9.9.9")

        def fake_dma_read_memory(host, address, length):
            assert host == "9.9.9.9"
            return b"\x00" * length

        monkeypatch.setattr(network_helper, "dma_read_memory", fake_dma_read_memory)

        handler = UltimateHandler()
        session_id = 7

        response = handler.handle("memcpy $c000-$c0ff /Temp/x", session_id)
        assert "OK" in response

    def test_memcpy_save_no_client_ip_no_last_ip(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        handler = UltimateHandler()
        session_id = 8

        response = handler.handle("memcpy $c000-$c0ff /Temp/x", session_id)
        assert "?NO CLIENT IP" in response


class TestMemcpyLoad:
    def test_memcpy_load_writes_retrieved_bytes(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)

        captured = {}

        def fake_dma_write_memory_rest(host, address, data):
            captured["host"] = host
            captured["address"] = address
            captured["data"] = data

        monkeypatch.setattr(
            network_helper, "dma_write_memory_rest", fake_dma_write_memory_rest
        )

        # Configure the fake FTP's RETR payload before the handler creates it.
        original_init = FakeFTP.__init__

        def init_with_payload(self, host=None, timeout=None):
            original_init(self, host=host, timeout=timeout)
            self.retr_data = b"\xde\xad\xbe\xef"

        monkeypatch.setattr(FakeFTP, "__init__", init_with_payload)

        handler = UltimateHandler()
        session_id = 9
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("memcpy /Temp/x $c000", session_id)

        assert captured["address"] == 0xC000
        assert captured["data"] == b"\xde\xad\xbe\xef"
        assert captured["host"] == "1.2.3.4"
        assert "OK" in response
        assert "4" in response
        assert "C000" in response.upper()

    def test_memcpy_load_no_client_ip(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        handler = UltimateHandler()
        session_id = 10

        response = handler.handle("memcpy /Temp/x $c000", session_id)
        assert "?NO CLIENT IP" in response


class TestMemcpyUsage:
    def test_bad_syntax_returns_usage(self):
        handler = UltimateHandler()
        assert "Usage" in handler.handle("memcpy nonsense")
        assert "Usage" in handler.handle("memcpy $c000-$c0ff")
        assert "Usage" in handler.handle("memcpy /Temp/x")


class TestMkdisk:
    def test_can_handle_mkdisk(self):
        handler = UltimateHandler()
        assert handler.can_handle("mkdisk games.d64")
        assert handler.can_handle("MKDISK games.d64")

    def test_mkdisk_success_d64_default(self, monkeypatch):
        captured = {}

        def fake_rest_create_disk(host, abspath, image_type, tracks=None, diskname=None):
            captured["host"] = host
            captured["abspath"] = abspath
            captured["image_type"] = image_type
            captured["tracks"] = tracks
            captured["diskname"] = diskname
            return []

        monkeypatch.setattr(network_helper, "rest_create_disk", fake_rest_create_disk)
        handler = UltimateHandler()
        session_id = 60
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk /Usb0/games.d64", session_id)

        assert "OK" in response
        assert "/Usb0/games.d64" in response
        assert captured["host"] == "1.2.3.4"
        assert captured["abspath"] == "/Usb0/games.d64"
        assert captured["image_type"] == "d64"
        assert captured["tracks"] is None
        assert captured["diskname"] is None

    def test_mkdisk_d64_explicit_tracks(self, monkeypatch):
        captured = {}

        def fake_rest_create_disk(host, abspath, image_type, tracks=None, diskname=None):
            captured["tracks"] = tracks
            return []

        monkeypatch.setattr(network_helper, "rest_create_disk", fake_rest_create_disk)
        handler = UltimateHandler()
        session_id = 61
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk /Usb0/games.d64,40", session_id)
        assert "OK" in response
        assert captured["tracks"] == 40

    def test_mkdisk_d64_bad_tracks(self, monkeypatch):
        handler = UltimateHandler()
        session_id = 62
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk /Usb0/games.d64,39", session_id)
        assert response.startswith("?BAD TRACKS")

    def test_mkdisk_d81_with_diskname_and_empty_tracks_field(self, monkeypatch):
        captured = {}

        def fake_rest_create_disk(host, abspath, image_type, tracks=None, diskname=None):
            captured["tracks"] = tracks
            captured["diskname"] = diskname
            captured["image_type"] = image_type
            return []

        monkeypatch.setattr(network_helper, "rest_create_disk", fake_rest_create_disk)
        handler = UltimateHandler()
        session_id = 63
        update_session_state(session_id, client_ip="1.2.3.4", dos_cwd="/Usb0")

        response = handler.handle("mkdisk demos.d81,,MY DEMOS", session_id)
        assert "OK" in response
        assert captured["image_type"] == "d81"
        assert captured["tracks"] is None
        assert captured["diskname"] == "MY DEMOS"

    def test_mkdisk_dnp_requires_tracks(self, monkeypatch):
        handler = UltimateHandler()
        session_id = 64
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk big.dnp", session_id)
        assert response.startswith("?BAD TRACKS")

        response = handler.handle("mkdisk big.dnp,300", session_id)
        assert response.startswith("?BAD TRACKS")

    def test_mkdisk_dnp_with_tracks_and_diskname(self, monkeypatch):
        captured = {}

        def fake_rest_create_disk(host, abspath, image_type, tracks=None, diskname=None):
            captured["tracks"] = tracks
            captured["diskname"] = diskname
            return []

        monkeypatch.setattr(network_helper, "rest_create_disk", fake_rest_create_disk)
        handler = UltimateHandler()
        session_id = 65
        update_session_state(session_id, client_ip="1.2.3.4", dos_cwd="/Usb0")

        response = handler.handle("mkdisk big.dnp,128,ARCHIVE", session_id)
        assert "OK" in response
        assert captured["tracks"] == 128
        assert captured["diskname"] == "ARCHIVE"

    def test_mkdisk_bad_extension(self):
        handler = UltimateHandler()
        session_id = 66
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk notes.txt", session_id)
        assert "Usage" in response

    def test_mkdisk_no_args_is_usage(self):
        handler = UltimateHandler()
        session_id = 67
        response = handler.handle("mkdisk", session_id)
        assert "Usage" in response

    def test_mkdisk_relative_path_joins_cwd(self, monkeypatch):
        captured = {}

        def fake_rest_create_disk(host, abspath, image_type, tracks=None, diskname=None):
            captured["abspath"] = abspath
            return []

        monkeypatch.setattr(network_helper, "rest_create_disk", fake_rest_create_disk)
        handler = UltimateHandler()
        session_id = 68
        update_session_state(session_id, client_ip="1.2.3.4", dos_cwd="/Temp/games")

        response = handler.handle("mkdisk games.d64", session_id)
        assert "OK" in response
        assert captured["abspath"] == "/Temp/games/games.d64"

    def test_mkdisk_relative_path_without_cwd_is_usage(self, monkeypatch):
        handler = UltimateHandler()
        session_id = 69
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk games.d64", session_id)
        assert "Usage" in response

    def test_mkdisk_no_client_ip(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        handler = UltimateHandler()
        session_id = 70

        response = handler.handle("mkdisk /Usb0/games.d64", session_id)
        assert "?NO CLIENT IP" in response

    def test_mkdisk_rest_errors_reported(self, monkeypatch):
        monkeypatch.setattr(
            network_helper, "rest_create_disk", lambda *a, **k: ["disk full"]
        )
        handler = UltimateHandler()
        session_id = 71
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk /Usb0/games.d64", session_id)
        assert "?CREATE FAILED" in response
        assert "disk full" in response

    def test_mkdisk_transport_exception(self, monkeypatch):
        def raising(*a, **k):
            raise IOError("connection refused")

        monkeypatch.setattr(network_helper, "rest_create_disk", raising)
        handler = UltimateHandler()
        session_id = 72
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("mkdisk /Usb0/games.d64", session_id)
        assert "?REST FAILED" in response


class TestFile:
    """`file <name>` - stat via FTP MLSD, REST :info as best-effort enrichment."""

    def _ftp(self, monkeypatch, entries):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        FakeFTP.instances = []
        original_init = FakeFTP.__init__

        def init(self, host=None, timeout=None):
            original_init(self, host, timeout)
            self.mlsd_entries = entries

        monkeypatch.setattr(FakeFTP, "__init__", init)

    def test_can_handle_file(self):
        handler = UltimateHandler()
        assert handler.can_handle("file game.prg")
        assert handler.can_handle("FILE game.prg")

    def test_no_args_is_usage(self):
        handler = UltimateHandler()
        assert "Usage: file" in handler.handle("file", 80)

    def test_reports_type_size_and_modify(self, monkeypatch):
        self._ftp(
            monkeypatch,
            [("game.prg", {"type": "file", "size": "12345", "modify": "20260714182203"})],
        )
        handler = UltimateHandler()
        session_id = 81
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/game.prg", session_id)
        assert "NAME     game.prg" in response
        assert "TYPE     PRG" in response
        assert "SIZE     12345 BYTES" in response
        assert "MODIFIED 2026-07-14 18:22:03" in response
        assert FakeFTP.instances[0].cwd_calls == ["/Usb0"]

    def test_directory_reports_dir_and_no_size(self, monkeypatch):
        self._ftp(
            monkeypatch, [("games", {"type": "dir", "size": "0", "modify": "20260101120000"})]
        )
        handler = UltimateHandler()
        session_id = 82
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/games", session_id)
        assert "TYPE     DIR" in response
        assert "SIZE" not in response

    def test_ultimate_placeholder_timestamp_is_labelled(self, monkeypatch):
        """The C64U reports 19800101000000 for entries with no real mtime
        (hardware-verified on the root pseudo-dirs) - don't show it as a date."""
        self._ftp(
            monkeypatch, [("Usb0", {"type": "dir", "size": "0", "modify": "19800101000000"})]
        )
        handler = UltimateHandler()
        session_id = 83
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0", session_id)
        assert "MODIFIED (not set)" in response
        assert "1980" not in response

    def test_missing_modify_fact_is_tolerated(self, monkeypatch):
        self._ftp(monkeypatch, [("game.prg", {"type": "file", "size": "10"})])
        handler = UltimateHandler()
        session_id = 84
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/game.prg", session_id)
        assert "MODIFIED ?" in response

    def test_file_without_extension_is_typed_file(self, monkeypatch):
        self._ftp(monkeypatch, [("readme", {"type": "file", "size": "10"})])
        handler = UltimateHandler()
        session_id = 85
        update_session_state(session_id, client_ip="1.2.3.4")

        assert "TYPE     FILE" in handler.handle("file /Usb0/readme", session_id)

    def test_not_found(self, monkeypatch):
        self._ftp(monkeypatch, [("other.prg", {"type": "file", "size": "1"})])
        handler = UltimateHandler()
        session_id = 86
        update_session_state(session_id, client_ip="1.2.3.4")

        assert "?NOT FOUND" in handler.handle("file /Usb0/game.prg", session_id)

    def test_glob_matches_several(self, monkeypatch):
        self._ftp(
            monkeypatch,
            [
                ("a.d64", {"type": "file", "size": "174848"}),
                ("b.d64", {"type": "file", "size": "174848"}),
                ("c.prg", {"type": "file", "size": "10"}),
            ],
        )
        handler = UltimateHandler()
        session_id = 87
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/*.d64", session_id)
        assert "a.d64" in response and "b.d64" in response
        assert "c.prg" not in response

    def test_glob_output_is_capped(self, monkeypatch):
        self._ftp(
            monkeypatch,
            [(f"f{i}.prg", {"type": "file", "size": "1"}) for i in range(12)],
        )
        handler = UltimateHandler()
        session_id = 88
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/*", session_id)
        assert "...4 more match(es)" in response
        assert response.count("NAME") == 8

    def test_case_insensitive_fallback(self, monkeypatch):
        """`ll` shows real case but users retype names lowercase (see the mnt
        note in TODO.md) - an exact match must win, else fold case."""
        self._ftp(monkeypatch, [("GAME.PRG", {"type": "file", "size": "10"})])
        handler = UltimateHandler()
        session_id = 89
        update_session_state(session_id, client_ip="1.2.3.4")

        assert "NAME     GAME.PRG" in handler.handle("file /Usb0/game.prg", session_id)

    def test_exact_match_wins_over_case_fold(self, monkeypatch):
        self._ftp(
            monkeypatch,
            [
                ("game.prg", {"type": "file", "size": "10"}),
                ("GAME.PRG", {"type": "file", "size": "20"}),
            ],
        )
        handler = UltimateHandler()
        session_id = 90
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/game.prg", session_id)
        assert "SIZE     10 BYTES" in response
        assert "GAME.PRG" not in response

    def test_relative_path_joins_cwd(self, monkeypatch):
        self._ftp(monkeypatch, [("game.prg", {"type": "file", "size": "10"})])
        handler = UltimateHandler()
        session_id = 91
        update_session_state(session_id, client_ip="1.2.3.4", dos_cwd="/Usb0/games")

        response = handler.handle("file game.prg", session_id)
        assert "NAME     game.prg" in response
        assert FakeFTP.instances[0].cwd_calls == ["/Usb0/games"]

    def test_relative_path_without_cwd_is_usage(self, monkeypatch):
        self._ftp(monkeypatch, [])
        handler = UltimateHandler()
        session_id = 92
        update_session_state(session_id, client_ip="1.2.3.4", dos_cwd=None)

        assert "Usage: file" in handler.handle("file game.prg", session_id)

    def test_no_client_ip(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        handler = UltimateHandler()
        assert "?NO CLIENT IP" in handler.handle("file /Usb0/game.prg", 93)

    def test_ftp_failure(self, monkeypatch):
        def raising(*a, **k):
            raise IOError("connection refused")

        monkeypatch.setattr(ftplib, "FTP", raising)
        handler = UltimateHandler()
        session_id = 94
        update_session_state(session_id, client_ip="1.2.3.4")

        assert "?FTP FAILED" in handler.handle("file /Usb0/game.prg", session_id)

    def test_mlsd_unsupported_falls_back_to_nlst(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        FakeFTP.instances = []
        original_init = FakeFTP.__init__

        def init(self, host=None, timeout=None):
            original_init(self, host, timeout)
            self.mlsd_should_fail = True
            self.nlst_names = ["game.prg"]

        monkeypatch.setattr(FakeFTP, "__init__", init)
        handler = UltimateHandler()
        session_id = 95
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/game.prg", session_id)
        assert "NAME     game.prg" in response
        assert "SIZE     ?" in response
        assert "MODIFIED ?" in response

    def test_only_mlsd_fields_are_shown(self, monkeypatch):
        """Guards the HW regression where the REST :info bonus appended a
        duplicate FILES line: `file` renders the MLSD facts and nothing else."""
        self._ftp(
            monkeypatch,
            [("echo.prg", {"type": "file", "size": "10387", "modify": "20260704155418"})],
        )
        handler = UltimateHandler()
        session_id = 96
        update_session_state(session_id, client_ip="1.2.3.4")

        response = handler.handle("file /Usb0/echo.prg", session_id)
        assert response.splitlines() == [
            "NAME     echo.prg",
            "TYPE     PRG",
            "SIZE     10387 BYTES",
            "MODIFIED 2026-07-04 15:54:18",
        ]

    def test_yields_to_netdrive_on_n(self):
        """On #n, `file` targets the workspace via NetDriveHandler - exactly like
        `del`. Regression: UltimateHandler used to claim it and answer with the
        usage line, because #n prepends no cwd frame (HW-reported)."""
        handler = UltimateHandler()
        session_id = 97
        update_session_state(session_id, active_module="n")
        assert not handler.can_handle("file aaa.prg", session_id)

        update_session_state(session_id, active_module="c")
        assert handler.can_handle("file aaa.prg", session_id)


class TestCsdbAlias:
    def test_can_handle_csdb(self):
        handler = CSDBHandler()
        assert handler.can_handle("csdb")
        assert handler.can_handle("CSDB")
        assert handler.can_handle("  csdb  ")

    def test_handle_csdb_sets_active_module(self):
        handler = CSDBHandler()
        session_id = 20
        response = handler.handle("csdb", session_id)

        state = get_session_state_copy(session_id)
        assert state.get("active_module") == "c"
        assert "csdb mode" in response.lower()

    def test_handle_csdb_matches_hash_c(self):
        handler = CSDBHandler()
        response_csdb = handler.handle("csdb", 21)
        response_hash_c = handler.handle("#c", 22)
        assert response_csdb == response_hash_c

    def test_existing_hash_c_and_colon_still_work(self):
        handler = CSDBHandler()
        assert handler.can_handle("#c")
        assert handler.can_handle("c: test")
        assert not handler.can_handle("csdbfoo")


class TestRelativePathResolution:
    """Step 21: mkdir/memcpy resolve a relative path against the session cwd that the
    wedge sends in the \\x01 context frame (stored as state['dos_cwd'])."""

    def _mkdir(self, monkeypatch, line, cwd, session_id):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        update_session_state(session_id, client_ip="1.2.3.4")
        if cwd is not None:
            update_session_state(session_id, dos_cwd=cwd)
        return UltimateHandler().handle(line, session_id)

    def test_mkdir_relative_joins_cwd(self, monkeypatch):
        resp = self._mkdir(monkeypatch, "mkdir new", "/Temp/games", 40)
        assert "OK" in resp
        assert FakeFTP.instances[0].mkd_calls == ["/Temp/games/new"]

    def test_mkdir_relative_without_cwd_is_usage(self, monkeypatch):
        resp = self._mkdir(monkeypatch, "mkdir new", None, 41)
        assert "Usage" in resp
        assert FakeFTP.instances == []

    def test_mkdir_absolute_ignores_cwd(self, monkeypatch):
        resp = self._mkdir(monkeypatch, "mkdir /Flash/x", "/Temp/games", 42)
        assert "OK" in resp
        assert FakeFTP.instances[0].mkd_calls == ["/Flash/x"]

    def test_mkdir_root_cwd_no_double_slash(self, monkeypatch):
        resp = self._mkdir(monkeypatch, "mkdir new", "/", 43)
        assert "OK" in resp
        assert FakeFTP.instances[0].mkd_calls == ["/new"]

    def test_mkdir_trailing_slash_cwd(self, monkeypatch):
        resp = self._mkdir(monkeypatch, "mkdir new", "/Temp/", 44)
        assert "OK" in resp
        assert FakeFTP.instances[0].mkd_calls == ["/Temp/new"]

    def test_memcpy_save_relative_joins_cwd(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        monkeypatch.setattr(
            network_helper, "dma_read_memory", lambda h, a, n: b"\x00" * n
        )
        session_id = 45
        update_session_state(session_id, client_ip="1.2.3.4", dos_cwd="/Temp")

        resp = UltimateHandler().handle("memcpy $c000-$c0ff dump.bin", session_id)
        assert "OK" in resp
        ftp = FakeFTP.instances[0]
        # abspath /Temp/dump.bin -> cwd /Temp, STOR dump.bin
        assert ftp.cwd_calls == ["/Temp"]
        assert ftp.stor_calls[0][0] == "STOR dump.bin"

    def test_memcpy_load_relative_joins_cwd(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        monkeypatch.setattr(
            network_helper, "dma_write_memory_rest", lambda h, a, d: None
        )
        session_id = 46
        update_session_state(session_id, client_ip="1.2.3.4", dos_cwd="/Temp")

        resp = UltimateHandler().handle("memcpy dump.bin $4000", session_id)
        assert "OK" in resp
        assert FakeFTP.instances[0].retr_calls == ["RETR /Temp/dump.bin"]

    def test_memcpy_save_relative_without_cwd_is_usage(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        session_id = 47
        update_session_state(session_id, client_ip="1.2.3.4")
        resp = UltimateHandler().handle("memcpy $c000-$c0ff dump.bin", session_id)
        assert "Usage" in resp

    def test_memcpy_direction_still_works_with_absolute(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        monkeypatch.setattr(
            network_helper, "dma_read_memory", lambda h, a, n: b"\x00" * n
        )
        session_id = 48
        update_session_state(session_id, client_ip="1.2.3.4")
        # absolute save path, no cwd needed
        resp = UltimateHandler().handle("memcpy $c000-$c0ff /Temp/x", session_id)
        assert "OK" in resp


class TestCwdContextFrame:
    """request_dispatcher decodes the \\x01 <cwd> \\x01 <line> context frame: cwd as
    ASCII into state['dos_cwd'], line as PETSCII dispatched normally."""

    def _framed(self, cwd, line):
        return b"\x01" + cwd.encode("ascii") + b"\x01" + line.encode("ascii") + b"\x00"

    def test_frame_sets_dos_cwd_and_strips(self):
        from request_dispatcher import RequestDispatcher

        session_id = 50
        RequestDispatcher().dispatch(self._framed("/Temp/games", "help"), session_id)
        assert get_session_state_copy(session_id).get("dos_cwd") == "/Temp/games"

    def test_unframed_request_clears_stale_cwd(self):
        from request_dispatcher import RequestDispatcher

        session_id = 51
        update_session_state(session_id, dos_cwd="/stale")
        RequestDispatcher().dispatch(b"help\x00", session_id)
        assert get_session_state_copy(session_id).get("dos_cwd") is None

    def test_frame_mixed_case_cwd_preserved(self):
        from request_dispatcher import RequestDispatcher

        session_id = 52
        # mixed-case path must survive (decoded as ASCII, not through petscii)
        RequestDispatcher().dispatch(self._framed("/Usb0/MyGames", "help"), session_id)
        assert get_session_state_copy(session_id).get("dos_cwd") == "/Usb0/MyGames"


class TestDelCanHandle:
    def test_can_handle_del_default(self):
        assert UltimateHandler().can_handle("del *.prg", 200) is True

    def test_del_yielded_on_netdrive(self):
        # while #n is active, del must fall through to NetDriveHandler
        update_session_state(201, active_module="n")
        assert UltimateHandler().can_handle("del *.prg", 201) is False

    def test_mkdir_still_claimed_on_netdrive(self):
        # only del is context-sensitive; mkdir stays unconditional
        update_session_state(202, active_module="n")
        assert UltimateHandler().can_handle("mkdir /Temp/x", 202) is True


class TestDel:
    def _mk(self, session_id, entries, cwd=None):
        update_session_state(session_id, client_ip="1.2.3.4")
        if cwd is not None:
            update_session_state(session_id, dos_cwd=cwd)

        def factory(host=None, timeout=None):
            ftp = FakeFTP(host=host, timeout=timeout)
            ftp.mlsd_entries = entries
            return ftp

        return factory

    def test_del_exact_name(self, monkeypatch):
        entries = [("game.prg", {"type": "file"}), ("other.prg", {"type": "file"})]
        monkeypatch.setattr(ftplib, "FTP", self._mk(210, entries))
        resp = UltimateHandler().handle("del /Usb0/game.prg", 210)
        assert resp == "OK: deleted 1 file(s)"
        assert FakeFTP.instances[-1].delete_calls == ["game.prg"]
        assert FakeFTP.instances[-1].cwd_calls == ["/Usb0"]

    def test_del_case_insensitive_fallback(self, monkeypatch):
        """del mirrors file: no exact match -> case-fold (users retype names in
        whatever keyboard case is handy; see the mnt note in TODO.md)."""
        entries = [("Game.prg", {"type": "file"}), ("other.prg", {"type": "file"})]
        monkeypatch.setattr(ftplib, "FTP", self._mk(230, entries))
        resp = UltimateHandler().handle("del /Usb0/GAME.PRG", 230)
        assert resp == "OK: deleted 1 file(s)"
        assert FakeFTP.instances[-1].delete_calls == ["Game.prg"]

    def test_del_exact_match_wins_over_case_fold(self, monkeypatch):
        entries = [("game.prg", {"type": "file"}), ("GAME.PRG", {"type": "file"})]
        monkeypatch.setattr(ftplib, "FTP", self._mk(231, entries))
        resp = UltimateHandler().handle("del /Usb0/game.prg", 231)
        assert resp == "OK: deleted 1 file(s)"
        assert FakeFTP.instances[-1].delete_calls == ["game.prg"]

    def test_del_wildcard_multiple_skips_dirs(self, monkeypatch):
        entries = [
            ("a.prg", {"type": "file"}),
            ("b.prg", {"type": "file"}),
            ("sub", {"type": "dir"}),
            ("keep.d64", {"type": "file"}),
        ]
        monkeypatch.setattr(ftplib, "FTP", self._mk(211, entries))
        resp = UltimateHandler().handle("del /Usb0/*.prg", 211)
        assert resp == "OK: deleted 2 file(s)"
        assert sorted(FakeFTP.instances[-1].delete_calls) == ["a.prg", "b.prg"]

    def test_del_nothing_matched(self, monkeypatch):
        entries = [("a.d64", {"type": "file"})]
        monkeypatch.setattr(ftplib, "FTP", self._mk(212, entries))
        resp = UltimateHandler().handle("del /Usb0/*.prg", 212)
        assert resp == "?NOTHING MATCHED: /Usb0/*.prg"
        assert FakeFTP.instances[-1].delete_calls == []

    def test_del_relative_uses_cwd(self, monkeypatch):
        entries = [("x.prg", {"type": "file"})]
        monkeypatch.setattr(ftplib, "FTP", self._mk(213, entries, cwd="/Usb0/games"))
        resp = UltimateHandler().handle("del *.prg", 213)
        assert resp == "OK: deleted 1 file(s)"
        assert FakeFTP.instances[-1].cwd_calls == ["/Usb0/games"]

    def test_del_relative_no_cwd_is_usage(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", self._mk(214, []))
        update_session_state(214, dos_cwd=None)
        resp = UltimateHandler().handle("del *.prg", 214)
        assert resp == _DEL_USAGE
        assert FakeFTP.instances == []

    def test_del_no_client_ip(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        resp = UltimateHandler().handle("del /Usb0/x.prg", 215)
        assert "?NO CLIENT IP" in resp
        assert FakeFTP.instances == []

    def test_del_no_args_is_usage(self):
        update_session_state(216, client_ip="1.2.3.4")
        assert UltimateHandler().handle("del", 216) == _DEL_USAGE

    def test_del_mlsd_fallback_to_nlst(self, monkeypatch):
        def factory(host=None, timeout=None):
            ftp = FakeFTP(host=host, timeout=timeout)
            ftp.mlsd_should_fail = True
            ftp.nlst_names = ["one.prg", "two.d64"]
            return ftp

        update_session_state(217, client_ip="1.2.3.4")
        monkeypatch.setattr(ftplib, "FTP", factory)
        resp = UltimateHandler().handle("del /Usb0/*.prg", 217)
        assert resp == "OK: deleted 1 file(s)"
        assert FakeFTP.instances[-1].delete_calls == ["one.prg"]
