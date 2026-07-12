"""
Unit tests for UltimateHandler (mkdir / memcpy) and the "csdb" alias on
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
from ultimate_handler import UltimateHandler
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
