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
        self.fail_cwd = set()  # paths that raise on cwd (e.g. nonexistent dir)
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
        if path in self.fail_cwd:
            raise ftplib.error_perm("550 Requested action not taken.")
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

    def test_relative_bare_with_no_cwd_frame_falls_back_to_workspace(self, monkeypatch):
        # No dos_cwd this request (e.g. typed on #n) -- a bare *relative* token
        # can no longer mean a UCI path (there's no live UCI cwd to resolve
        # against), so it's treated as net_cwd-relative instead. Nothing is
        # seeded at that workspace path here, so this surfaces as NOTHING
        # MATCHED rather than the old hard usage error.
        monkeypatch.setattr(ftplib, "FTP", FakeFTP)
        handler = CopyMoveHandler()
        update_session_state(400, client_ip="1.2.3.4")  # no dos_cwd
        resp = handler.handle("cp echo.prg /temp/echo.prg", 400)
        assert resp == "?NOTHING MATCHED: echo.prg"

    def test_classify_bare_relative_with_no_frame_is_workspace(self):
        update_session_state(499, client_ip="1.2.3.4")  # no dos_cwd
        assert _classify("digitalclock.prg", 499) == ("n", "digitalclock.prg")
        # absolute bare paths are always UCI, frame or not
        assert _classify("/sd/home/medlicek", 499) == ("uci", "/sd/home/medlicek")

    def test_relative_bare_src_with_no_cwd_frame_resolves_against_workspace(
        self, tmp_path, monkeypatch
    ):
        # Regression: `cp digitalclock.prg /sd/home/medlicek` typed while on #n
        # (no UCI cwd frame this request) used to hard-fail with the usage
        # string even though the bare source obviously meant "the file in my
        # current network-drive directory" -- #n is the only device that sends
        # no frame, so that's the only live directory a bare relative token
        # could mean.
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "digitalclock.prg").write_bytes(b"code")
        ftp = FakeFTP()
        ftp.seed_dir("/sd/home")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        update_session_state(498, net_cwd="", client_ip="1.2.3.4")  # no dos_cwd
        resp = handler.handle("cp digitalclock.prg /sd/home/medlicek", 498)

        assert resp == "OK: copied 1 file(s)"
        assert ftp.files["/sd/home/medlicek"] == b"code"

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

    def test_mv_overwrites_existing_destination_file(self, monkeypatch):
        # Regression: RNTO refuses to overwrite an existing file on the real
        # Ultimate FTP server (450 Requested file action not taken), even
        # though STOR-based cp overwrites the same path silently. mv must
        # delete the stale destination first so it behaves the same way.
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/greet.prg", b"new")
        ftp.seed_file("/temp/greet.prg", b"stale")

        def rename(fromname, toname):
            if toname in ftp.files:
                raise ftplib.error_perm("450 Requested file action not taken.")
            FakeFTP.rename(ftp, fromname, toname)

        ftp.rename = rename
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(508, "/sd/home")
        resp = handler.handle("mv greet.prg /temp/greet.prg", 508)

        assert resp == "OK: moved 1 file(s)"
        assert ftp.delete_calls == ["/temp/greet.prg"]
        assert ftp.files["/temp/greet.prg"] == b"new"

    def test_nonexistent_source_dir_reports_nothing_matched(self, monkeypatch):
        # Regression: a source directory that doesn't exist on the C64U (e.g.
        # a typo'd path) used to bubble up as a raw "?FTP FAILED: 550 ..."
        # from the cwd() call instead of the same friendly ?NOTHING MATCHED
        # used when the directory exists but nothing in it matches.
        ftp = FakeFTP()
        ftp.fail_cwd.add("/sd/medlicek")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(509, "/sd/home")
        resp = handler.handle("cp /sd/medlicek/greet2 /temp/greet2", 509)

        assert resp == "?NOTHING MATCHED: /sd/medlicek/greet2"

    def test_mv_cross_directory_falls_back_to_copy_when_rename_rejected(self, monkeypatch):
        # Regression: the real Ultimate FTP server's RNFR/RNTO only renames
        # in place -- moving a file to a *different* directory comes back
        # "450 Requested file action not taken." mv must fall back to
        # copy + verify + delete-source so it still works, just slower.
        ftp = FakeFTP()
        ftp.seed_file("/flash/bin/greet2", b"payload")
        ftp.seed_dir("/sd/home/medlicek")
        ftp.fail_rename.add("greet2")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(510, "/sd/home/medlicek")
        resp = handler.handle("mv /flash/bin/greet2 .", 510)

        assert resp == "OK: moved 1 file(s)"
        assert ftp.files["/sd/home/medlicek/greet2"] == b"payload"
        assert "/flash/bin/greet2" not in ftp.files
        assert ftp.delete_calls == ["/flash/bin/greet2"]

    def test_glob_into_directory_with_different_on_disk_case(self, monkeypatch):
        # Regression: the Ultimate's own top-level mounts (Temp, Flash, SD,
        # USB0) are capitalized on disk -- typing the lowercase "/temp" you'd
        # naturally use for #t's mount root used to fail the dest-is-dir
        # check (_ftp_stat_exact did an exact-case-only compare), so a
        # wildcard cp into it wrongly reported the "needs an existing
        # directory" usage error even though /temp obviously exists.
        ftp = FakeFTP()
        ftp.seed_file("/flash/bin/a.prg", b"1")
        ftp.seed_file("/flash/bin/b.prg", b"22")
        ftp.dirs.setdefault("/", []).append(("Temp", {"type": "dir"}))
        ftp.dirs.setdefault("/Temp", [])
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(512, "/flash/bin")
        resp = handler.handle("cp *.prg /temp", 512)

        assert resp == "OK: copied 2 file(s)"
        assert ("/temp/a.prg", b"1") in ftp.stor_calls
        assert ("/temp/b.prg", b"22") in ftp.stor_calls

    def test_mv_directory_source_gives_clear_error(self, monkeypatch):
        # A bare name that resolves to a directory (not a file) used to
        # report the same generic ?NOTHING MATCHED as a name that truly
        # isn't there at all -- cp/mv only ever moves files, so say that.
        ftp = FakeFTP()
        ftp.seed_dir("/flash/bin")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(511, "/sd/home")
        resp = handler.handle("mv /flash/bin .", 511)

        assert resp == "?CP/MV DOES NOT SUPPORT DIRECTORIES: /flash/bin"


class TestDiskImageDestination:
    """cp/mv where the destination is a .d64/.d71/.d81 sitting on the UCI
    filesystem: the Ultimate reports it as type=file in its parent's MLSD
    listing (see FakeFTP.seed_file), so without special-casing, `cp x.prg
    games.d64` would silently overwrite the whole image instead of copying
    x.prg into it."""

    def test_cp_bare_disk_image_name_copies_into_it_not_over_it(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/game.prg", b"1234")
        ftp.seed_dir("/flash/bin")
        ftp.seed_file("/flash/bin/games.d64", b"original-image-bytes")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(520, "/sd/home")
        resp = handler.handle("cp game.prg /flash/bin/games.d64", 520)

        assert resp == "OK: copied 1 file(s)"
        assert ("/flash/bin/games.d64/game.prg", b"1234") in ftp.stor_calls
        # the image itself must be untouched, not clobbered with game.prg's bytes
        assert ftp.files["/flash/bin/games.d64"] == b"original-image-bytes"

    def test_cp_explicit_path_inside_disk_image(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/game.prg", b"1234")
        ftp.seed_file("/flash/bin/games.d64", b"original-image-bytes")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(521, "/sd/home")
        resp = handler.handle("cp game.prg /flash/bin/games.d64/renamed.prg", 521)

        assert resp == "OK: copied 1 file(s)"
        assert ("/flash/bin/games.d64/renamed.prg", b"1234") in ftp.stor_calls

    def test_cp_glob_into_disk_image(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/a.prg", b"1")
        ftp.seed_file("/sd/home/b.prg", b"22")
        ftp.seed_file("/flash/bin/games.d64", b"original-image-bytes")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(522, "/sd/home")
        resp = handler.handle("cp *.prg /flash/bin/games.d64", 522)

        assert resp == "OK: copied 2 file(s)"
        assert ("/flash/bin/games.d64/a.prg", b"1") in ftp.stor_calls
        assert ("/flash/bin/games.d64/b.prg", b"22") in ftp.stor_calls

    def test_cp_out_of_disk_image_to_plain_directory(self, monkeypatch):
        # Source side needed zero code changes -- cwd-ing into a .d64 was
        # already generic behavior, this just confirms it end-to-end.
        ftp = FakeFTP()
        ftp.seed_file("/flash/bin/games.d64/game.prg", b"5678")
        ftp.seed_dir("/temp")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(523, "/sd/home")
        resp = handler.handle("cp /flash/bin/games.d64/game.prg /temp/game.prg", 523)

        assert resp == "OK: copied 1 file(s)"
        assert ("/temp/game.prg", b"5678") in ftp.stor_calls

    def test_cp_into_unreachable_disk_image_gives_clear_error_not_overwrite(
        self, monkeypatch
    ):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/game.prg", b"1234")
        ftp.seed_file("/flash/bin/broken.d64", b"original-image-bytes")
        ftp.fail_cwd.add("/flash/bin/broken.d64")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(524, "/sd/home")
        resp = handler.handle("cp game.prg /flash/bin/broken.d64", 524)

        assert resp == "?CANNOT ENTER DISK IMAGE: /flash/bin/broken.d64"
        assert ftp.files["/flash/bin/broken.d64"] == b"original-image-bytes"
        assert ftp.stor_calls == []

    def test_cp_overwriting_plain_file_destination_still_works(self, monkeypatch):
        # Regression: a non-image existing file at the destination must
        # still be overwritten in place exactly like before this change.
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/game.prg", b"new")
        ftp.seed_file("/temp/game.prg", b"stale")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(525, "/sd/home")
        resp = handler.handle("cp game.prg /temp/game.prg", 525)

        assert resp == "OK: copied 1 file(s)"
        assert ftp.files["/temp/game.prg"] == b"new"

    def test_mv_bare_disk_image_name_moves_into_it(self, monkeypatch):
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/game.prg", b"1234")
        ftp.seed_file("/flash/bin/games.d64", b"original-image-bytes")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        _uci_session(526, "/sd/home")
        resp = handler.handle("mv game.prg /flash/bin/games.d64", 526)

        assert resp == "OK: moved 1 file(s)"
        assert ftp.files["/flash/bin/games.d64/game.prg"] == b"1234"
        assert "/sd/home/game.prg" not in ftp.files
        assert ftp.files["/flash/bin/games.d64"] == b"original-image-bytes"


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

    def test_cp_uci_to_workspace_nonexistent_source_dir_reports_nothing_matched(
        self, tmp_path, monkeypatch
    ):
        # Same regression as TestUciToUci's version, for the uci->n: leg
        # exercised directly by the hardware-test repro:
        # `cp /sd/medlicek/greet2 n:` where /sd/medlicek was never a real dir.
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        ftp = FakeFTP()
        ftp.fail_cwd.add("/sd/medlicek")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        self._ws_session(605, "/sd/home", net_cwd="")
        resp = handler.handle("cp /sd/medlicek/greet2 n:", 605)

        assert resp == "?NOTHING MATCHED: /sd/medlicek/greet2"

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

    def test_cp_workspace_to_uci_bare_disk_image_name_copies_into_it(
        self, tmp_path, monkeypatch
    ):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "greet.prg").write_bytes(b"world")
        ftp = FakeFTP()
        ftp.seed_file("/sd/home/games.d64", b"original-image-bytes")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        self._ws_session(606, "/sd/home", net_cwd="")
        resp = handler.handle("cp n:greet.prg games.d64", 606)

        assert resp == "OK: copied 1 file(s)"
        assert ftp.files["/sd/home/games.d64/greet.prg"] == b"world"
        assert ftp.files["/sd/home/games.d64"] == b"original-image-bytes"


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

    def test_bare_filename_while_on_csdb_is_treated_as_csdb_source(
        self, tmp_path, monkeypatch
    ):
        # Regression: browsing a release with #c and typing a bare filename
        # (no c: prefix, matching the muscle memory of CSDB's own one-arg
        # `cp <pattern>`) used to silently fall back to workspace-relative
        # resolution (the #n bare-token convenience fix) and fail with
        # ?NOTHING MATCHED, even though #c is the device actually active.
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))

        class FakeCSDB:
            def _extract_matching_files(self, pattern, session_id):
                assert pattern == "extracted.prg"
                p = tmp_path / "extracted.prg"
                p.write_bytes(b"demo")
                return (["Copied extracted.prg to /tmp/hdnshell"], [p])

        handler = CopyMoveHandler()
        handler._csdb = FakeCSDB()
        update_session_state(803, net_cwd="", active_module="c")  # no dos_cwd

        resp = handler.handle("cp extracted.prg n:extracted.prg", 803)

        assert "extracted.prg" in resp
        assert (tmp_path / "extracted.prg").read_bytes() == b"demo"

    def test_bare_destination_while_on_csdb_stays_workspace_relative(
        self, tmp_path, monkeypatch
    ):
        # c: can never be a destination -- a bare *destination* token while
        # on #c must not be swept into the source-only CSDB override above.
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))
        (tmp_path / "greet.prg").write_bytes(b"hi")
        update_session_state(804, net_cwd="", active_module="c")  # no dos_cwd

        handler = CopyMoveHandler()
        resp = handler.handle("cp n:greet.prg dest.prg", 804)

        assert resp == "OK: copied 1 file(s)"
        assert (tmp_path / "dest.prg").read_bytes() == b"hi"

    def test_cp_from_csdb_into_disk_image_copies_into_it(self, tmp_path, monkeypatch):
        monkeypatch.setattr(copymove_handler, "WORKSPACE_DIR", str(tmp_path))

        class FakeCSDB:
            def _extract_matching_files(self, pattern, session_id):
                p = tmp_path / "extracted.prg"
                p.write_bytes(b"demo")
                return (["Copied extracted.prg to /tmp/hdnshell"], [p])

        ftp = FakeFTP()
        ftp.seed_file("/flash/bin/games.d64", b"original-image-bytes")
        monkeypatch.setattr(ftplib, "FTP", lambda *a, **k: ftp)

        handler = CopyMoveHandler()
        handler._csdb = FakeCSDB()
        update_session_state(805, dos_cwd="/flash/bin", client_ip="1.2.3.4")

        resp = handler.handle("cp c:extracted.prg /flash/bin/games.d64", 805)

        assert ftp.files["/flash/bin/games.d64/extracted.prg"] == b"demo"
        assert ftp.files["/flash/bin/games.d64"] == b"original-image-bytes"


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
