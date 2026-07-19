"""
Unit tests for CopyMoveHandler (`cp <src> <dst>` / `mv <src> <dst>`).

All network access (ftplib.FTP) is mocked via FakeFTP below - these tests
never touch a live C64U. FakeFTP tracks a *separate* listing/file-body per
directory (keyed by the last cwd), unlike test_ultimate_handler.py's simpler
single-global-listing FakeFTP, because cp/mv routinely needs the source
directory and the destination directory to report different contents in the
same test.
"""

import os
import sys

import pytest

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_HANDLERS_DIR = os.path.join(_CLOUD_DIR, "handlers")
if _HANDLERS_DIR not in sys.path:
    sys.path.insert(0, _HANDLERS_DIR)

import posixpath
import ftplib

from sdk.shared_state import (
    get_session_state_copy,
    update_session_state,
    reset_all_session_states,
)
import copymove_handler
from copymove_handler import (
    CopyMoveHandler,
    _classify,
    _resolve_workspace_path,
)
from request_dispatcher import RequestDispatcher
from sdk import BaseHandler


@pytest.fixture(autouse=True)
def _isolate_session_state():
    reset_all_session_states()
    yield
    reset_all_session_states()


class FakeFTP:
    """ftplib.FTP stand-in with per-directory listings + file bodies."""

    instances = []

    def __init__(self, host=None, timeout=None):
        self.host = host
        self.timeout = timeout
        self.current_dir = "/"
        self.dirs = {}          # path -> [(name, facts_dict), ...]
        self.files = {}         # abspath -> bytes
        self.cwd_calls = []
        self.stor_calls = []    # (abspath, bytes)
        self.retr_calls = []    # abspath
        self.delete_calls = []  # abspath
        self.rename_calls = []  # (fromname, toname)
        self.mkd_calls = []
        self.fail_stor = set()  # basenames that raise on STOR
        self.fail_rename = set()  # fromnames that raise on rename
        FakeFTP.instances.append(self)

    def login(self):
        pass

    def quit(self):
        pass

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc, tb):
        return False

    def cwd(self, path):
        self.cwd_calls.append(path)
        self.current_dir = path

    def mlsd(self):
        return list(self.dirs.get(self.current_dir, []))

    def nlst(self):
        return [n for n, _ in self.dirs.get(self.current_dir, [])]

    def mkd(self, path):
        self.mkd_calls.append(path)

    def storbinary(self, cmd, fp):
        name = cmd.split(" ", 1)[1]
        if name in self.fail_stor:
            raise ftplib.error_perm("550 denied")
        data = fp.read()
        abspath = posixpath.join(self.current_dir, name)
        self.stor_calls.append((abspath, data))
        self.files[abspath] = data
        entries = self.dirs.setdefault(self.current_dir, [])
        entries[:] = [(n, f) for n, f in entries if n != name]
        entries.append((name, {"type": "file", "size": str(len(data))}))

    def retrbinary(self, cmd, callback):
        name = cmd.split(" ", 1)[1]
        abspath = posixpath.join(self.current_dir, name)
        self.retr_calls.append(abspath)
        if abspath not in self.files:
            raise ftplib.error_perm("550 no such file")
        callback(self.files[abspath])

    def delete(self, name):
        abspath = posixpath.join(self.current_dir, name)
        self.delete_calls.append(abspath)
        self.files.pop(abspath, None)
        entries = self.dirs.get(self.current_dir, [])
        entries[:] = [(n, f) for n, f in entries if n != name]

    def rename(self, fromname, toname):
        base = posixpath.basename(fromname)
        if base in self.fail_rename:
            raise ftplib.error_perm("550 denied")
        self.rename_calls.append((fromname, toname))
        data = self.files.pop(fromname, b"")
        self.files[toname] = data
        from_dir, from_base = posixpath.dirname(fromname), posixpath.basename(fromname)
        to_dir, to_base = posixpath.dirname(toname), posixpath.basename(toname)
        entries = self.dirs.setdefault(from_dir, [])
        entries[:] = [(n, f) for n, f in entries if n != from_base]
        to_entries = self.dirs.setdefault(to_dir, [])
        to_entries[:] = [(n, f) for n, f in to_entries if n != to_base]
        to_entries.append((to_base, {"type": "file", "size": str(len(data))}))

    def seed_file(self, abspath, data):
        d, n = posixpath.dirname(abspath) or "/", posixpath.basename(abspath)
        self.files[abspath] = data
        self.dirs.setdefault(d, []).append((n, {"type": "file", "size": str(len(data))}))

    def seed_dir(self, abspath):
        d, n = posixpath.dirname(abspath) or "/", posixpath.basename(abspath)
        self.dirs.setdefault(d, []).append((n, {"type": "dir"}))
        self.dirs.setdefault(abspath, [])


@pytest.fixture(autouse=True)
def _reset_fake_ftp():
    FakeFTP.instances = []
    yield
    FakeFTP.instances = []


def _uci_session(session_id, cwd, client_ip="1.2.3.4"):
    update_session_state(session_id, dos_cwd=cwd, client_ip=client_ip)


class TestCanHandle:
    def test_cp_two_args_claimed(self):
        assert CopyMoveHandler().can_handle("cp a b")

    def test_cp_one_arg_not_claimed(self):
        assert not CopyMoveHandler().can_handle("cp a")

    def test_cp_zero_args_not_claimed(self):
        assert not CopyMoveHandler().can_handle("cp")

    def test_mv_always_claimed(self):
        h = CopyMoveHandler()
        assert h.can_handle("mv")
        assert h.can_handle("mv a")
        assert h.can_handle("mv a b")

    def test_unrelated_not_claimed(self):
        assert not CopyMoveHandler().can_handle("ll")
        assert not CopyMoveHandler().can_handle("del a")


class TestPathGrammar:
    def test_classify_bare_is_uci(self):
        assert _classify("/usb0/tools") == ("uci", "/usb0/tools")
        assert _classify("echo.prg") == ("uci", "echo.prg")
        assert _classify("h:") == ("uci", "h:")  # no per-letter UCI prefix

    def test_classify_prefixes(self):
        assert _classify("n:tools/new") == ("n", "tools/new")
        assert _classify("n:") == ("n", "")
        assert _classify("c:*.zip") == ("c", "*.zip")
        assert _classify("8:foo") == ("iec", "foo")
        assert _classify("9:foo") == ("iec", "foo")
        assert _classify("s:foo") == ("iec", "foo")

    def test_workspace_resolve_empty_is_cwd(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        assert _resolve_workspace_path("demos", "") == str(tmp_path / "demos")

    def test_workspace_resolve_relative(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        assert _resolve_workspace_path("demos", "tools/new") == str(
            tmp_path / "demos" / "tools" / "new"
        )

    def test_workspace_resolve_leading_slash_is_root_relative(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        assert _resolve_workspace_path("demos", "/tools") == str(tmp_path / "tools")

    def test_workspace_resolve_sandbox_escape_denied(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        assert _resolve_workspace_path("", "../../etc/passwd") is None

    def test_relative_uci_with_no_cwd_frame_is_usage_error(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        handler = CopyMoveHandler()
        update_session_state(400, client_ip="1.2.3.4")  # no dos_cwd
        resp = handler.handle("cp echo.prg /temp/echo.prg", 400)
        assert resp == "Usage: cp <src> <dst>"

    def test_c_as_destination_errors(self):
        handler = CopyMoveHandler()
        resp = handler.handle("cp /temp/echo.prg c:foo", 401)
        assert "READ-ONLY" in resp

    def test_c_as_move_source_errors(self):
        handler = CopyMoveHandler()
        resp = handler.handle("mv c:*.zip /temp", 402)
        assert "READ-ONLY" in resp

    def test_iec_prefix_errors_on_either_side(self):
        handler = CopyMoveHandler()
        assert "IEC" in handler.handle("cp 8:foo n:bar", 403)
        assert "IEC" in handler.handle("cp n:bar 9:foo", 404)


class TestUciToUci:
    def test_exact_copy(self, monkeypatch):
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/greet.prg", b"1234567890")
        ftp.seed_dir("/sd/home")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(500, "/sd/home")
        resp = handler.handle("cp greet.prg /temp/greet.prg", 500)

        assert resp == "OK: copied 1 file(s)"
        assert ("/temp/greet.prg", b"1234567890") in ftp.stor_calls

    def test_case_fold_fallback_on_source(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/GREET.PRG", b"x")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(501, "/sd/home")
        resp = handler.handle("cp greet.prg /temp/greet.prg", 501)

        assert resp == "OK: copied 1 file(s)"

    def test_glob_into_directory(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/a.prg", b"1")
        ftp.seed_file("/sd/home/b.prg", b"22")
        ftp.seed_file("/sd/home/c.d64", b"333")
        ftp.seed_dir("/temp")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(502, "/sd/home")
        resp = handler.handle("cp *.prg /temp", 502)

        assert resp == "OK: copied 2 file(s)"
        assert ("/temp/a.prg", b"1") in ftp.stor_calls
        assert ("/temp/b.prg", b"22") in ftp.stor_calls

    def test_glob_into_non_directory_is_usage_error(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/a.prg", b"1")
        ftp.seed_file("/sd/home/b.prg", b"2")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(503, "/sd/home")
        resp = handler.handle("cp *.prg /temp/onefile.prg", 503)

        assert "wildcard source requires" in resp

    def test_nothing_matched(self, monkeypatch):
        ftp = FakeFTP()
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(504, "/sd/home")
        resp = handler.handle("cp nope.prg /temp/nope.prg", 504)

        assert resp == "?NOTHING MATCHED: nope.prg"

    def test_mv_uses_native_rename_not_retr_stor(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/greet.prg", b"1234567890")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(505, "/sd/home")
        resp = handler.handle("mv greet.prg /temp/greet.prg", 505)

        assert resp == "OK: moved 1 file(s)"
        assert ftp.rename_calls == [("/sd/home/greet.prg", "/temp/greet.prg")]
        assert ftp.retr_calls == []
        assert ftp.stor_calls == []

    def test_partial_glob_failure_reports_n_ok_m_failed(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/a.prg", b"1")
        ftp.seed_file("/sd/home/b.prg", b"2")
        ftp.seed_dir("/temp")
        ftp.fail_stor.add("b.prg")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(506, "/sd/home")
        resp = handler.handle("cp *.prg /temp", 506)

        assert resp == "OK: copied 1 file(s); 1 failed"

    def test_no_client_ip(self, monkeypatch):
        from sdk import network_helper

        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        handler = CopyMoveHandler()
        update_session_state(507, dos_cwd="/sd/home")  # no client_ip
        resp = handler.handle("cp a.prg /temp/a.prg", 507)
        assert "NO CLIENT IP" in resp


class TestUciWorkspace:
    def _ws_session(self, session_id, dos_cwd, net_cwd=""):
        update_session_state(
            session_id, dos_cwd=dos_cwd, net_cwd=net_cwd, client_ip="1.2.3.4"
        )

    def test_cp_uci_to_workspace(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        ftp = FakeFTP()
        ftp.seed_file("/temp/echo.prg", b"hello")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        self._ws_session(600, "/temp", net_cwd="")
        resp = handler.handle("cp echo.prg n:echo.prg", 600)

        assert resp == "OK: copied 1 file(s)"
        assert (tmp_path / "echo.prg").read_bytes() == b"hello"

    def test_cp_workspace_to_uci(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "greet.prg").write_bytes(b"world")
        ftp = FakeFTP()
        ftp.seed_dir("/sd/home")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        self._ws_session(601, "/sd/home", net_cwd="")
        resp = handler.handle("cp n:greet.prg greet.prg", 601)

        assert resp == "OK: copied 1 file(s)"
        assert ftp.files["/sd/home/greet.prg"] == b"world"

    def test_mv_uci_to_workspace_deletes_source_after_verify(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        ftp = FakeFTP()
        ftp.seed_file("/temp/echo.prg", b"hello")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        self._ws_session(602, "/temp", net_cwd="")
        resp = handler.handle("mv echo.prg n:echo.prg", 602)

        assert resp == "OK: moved 1 file(s)"
        assert (tmp_path / "echo.prg").read_bytes() == b"hello"
        assert "/temp/echo.prg" not in ftp.files
        assert ftp.delete_calls == ["/temp/echo.prg"]

    def test_mv_workspace_to_uci_deletes_source_after_verify(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "greet.prg").write_bytes(b"world")
        ftp = FakeFTP()
        ftp.seed_dir("/sd/home")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        self._ws_session(603, "/sd/home", net_cwd="")
        resp = handler.handle("mv n:greet.prg greet.prg", 603)

        assert resp == "OK: moved 1 file(s)"
        assert not (tmp_path / "greet.prg").exists()
        assert ftp.files["/sd/home/greet.prg"] == b"world"

    def test_mv_workspace_to_uci_verify_failure_leaves_source_untouched(
        self, tmp_path, monkeypatch
    ):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "greet.prg").write_bytes(b"world")
        ftp = FakeFTP()
        ftp.seed_dir("/sd/home")
        ftp.fail_stor.add("greet.prg")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        self._ws_session(604, "/sd/home", net_cwd="")
        resp = handler.handle("mv n:greet.prg greet.prg", 604)

        assert "1 failed" in resp
        assert (tmp_path / "greet.prg").read_bytes() == b"world"
        assert "/sd/home/greet.prg" not in ftp.files


class TestWorkspaceToWorkspace:
    def test_cp(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "a.prg").write_bytes(b"x")
        (tmp_path / "backup").mkdir()

        handler = CopyMoveHandler()
        update_session_state(700, net_cwd="")
        resp = handler.handle("cp n:a.prg n:backup", 700)

        assert resp == "OK: copied 1 file(s)"
        assert (tmp_path / "backup" / "a.prg").read_bytes() == b"x"
        assert (tmp_path / "a.prg").exists()

    def test_mv_uses_os_rename(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "a.prg").write_bytes(b"x")

        handler = CopyMoveHandler()
        update_session_state(701, net_cwd="")
        resp = handler.handle("mv n:a.prg n:b.prg", 701)

        assert resp == "OK: moved 1 file(s)"
        assert not (tmp_path / "a.prg").exists()
        assert (tmp_path / "b.prg").read_bytes() == b"x"

    def test_sandbox_escape_denied(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        handler = CopyMoveHandler()
        update_session_state(702, net_cwd="")
        resp = handler.handle("cp n:../../etc/passwd n:stolen", 702)
        assert resp == "?ACCESS DENIED - outside workspace"


class TestCsdbSource:
    def test_mv_from_csdb_rejected(self):
        handler = CopyMoveHandler()
        resp = handler.handle("mv c:*.zip /temp", 800)
        assert "READ-ONLY" in resp

    def test_cp_from_csdb_no_release_context(self):
        handler = CopyMoveHandler()
        resp = handler.handle("cp c:*.zip /temp", 801)
        assert "cp can only be used within a release." in resp

    def test_cp_from_csdb_reuses_extraction_and_uploads_to_given_dst(
        self, tmp_path, monkeypatch
    ):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))

        class FakeCSDB:
            def _extract_matching_files(self, pattern, session_id):
                p = tmp_path / "extracted.prg"
                p.write_bytes(b"demo")
                return (["Copied extracted.prg to /tmp/hdnshell"], [p])

        handler = CopyMoveHandler()
        handler._csdb = FakeCSDB()
        update_session_state(802, net_cwd="")

        resp = handler.handle("cp c:extracted.prg n:extracted.prg", 802)

        assert "extracted.prg" in resp
        assert (tmp_path / "extracted.prg").read_bytes() == b"demo"


class TestCsdbCpUnchangedAfterSplit:
    """Regression: CSDBHandler's own one-arg `cp <pattern>` must still behave
    exactly as before the `_extract_matching_files` split."""

    def test_cp_outside_release_context_unchanged(self):
        from csdb_handler import CSDBHandler

        handler = CSDBHandler()
        resp = handler._cp_file("*.zip", 900)
        assert resp == "cp can only be used within a release."


class TestDispatcherBackwardCompat:
    """One-arg cp on #n / #c must keep working with CopyMoveHandler inserted
    into the handler list (ordering regression guard)."""

    def test_netdrive_one_arg_cp_still_works(self, tmp_path, monkeypatch):
        import netdrive_handler

        monkeypatch.setattr(netdrive_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "greet.prg").write_bytes(b"hi")

        class FakeFTPPush:
            def __init__(self, host=None, timeout=None):
                self.stored = None

            def login(self):
                pass

            def cwd(self, path):
                pass

            def storbinary(self, cmd, fp):
                self.stored = (cmd, fp.read())

            def quit(self):
                pass

            def __enter__(self):
                return self

            def __exit__(self, *a):
                return False

        monkeypatch.setattr(ftplib, "FTP", FakeFTPPush)

        dispatcher = RequestDispatcher()
        update_session_state(1000, active_module="n", net_cwd="", client_ip="1.2.3.4")
        resp_bytes = dispatcher.dispatch(b"cp greet.prg\x00", 1000)
        resp = BaseHandler.petscii_to_utf8(resp_bytes)
        assert "OK" in resp
        assert "TEMP" in resp.upper()

    def test_csdb_one_arg_cp_still_yields_usage_message(self):
        dispatcher = RequestDispatcher()
        update_session_state(1001, active_module="c")
        resp_bytes = dispatcher.dispatch(b"cp *.zip\x00", 1001)
        resp = BaseHandler.petscii_to_utf8(resp_bytes)
        assert "release" in resp.lower()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
