"""
Regression tests for /files/delete path-type classification.

Bug: the Ultimate64/C64U FTP server lets you CWD *into* a disk image
(.d64/.d71/.d81/.dnp) to browse the files inside it. The old
_ftp_is_directory() used a "does CWD succeed?" probe, so every disk image was
misclassified as a directory and delete routed it to RMD -> "550 Requested
action not taken." (The reporter saw this only on files whose names contained
spaces, but that was a coincidence -- those files were all disk images; a
space-free .d64 fails identically.) The fix takes the type from the parent
directory's MLSD listing, which reports disk images as type=file.
"""

import ftplib
import pytest

import cloud


class FakeFTP:
    """FTP stand-in whose MLSD is authoritative and whose CWD (like the real
    Ultimate) succeeds even for disk images -- so a test that trusted CWD would
    reproduce the bug."""

    def __init__(self, tree, mlsd_raises=False):
        # tree: {parent_path: [(name, type), ...]}
        self.tree = tree
        self.mlsd_raises = mlsd_raises
        self.deleted = []
        self.rmd_calls = []
        self.cwd_calls = []
        self._pwd = "/"

    def pwd(self):
        return self._pwd

    def cwd(self, path):
        self.cwd_calls.append(path)
        # Emulate the Ultimate quirk: CWD into a disk image succeeds. Only an
        # unknown path fails. This is deliberately permissive so the CWD probe
        # cannot be relied on -- MLSD must be the source of truth.
        self._pwd = path

    def mlsd(self, path=""):
        if self.mlsd_raises:
            raise ftplib.error_perm("500 MLSD not understood")
        # no-arg MLSD lists the current directory (what _ftp_list_directory
        # does after a cwd); an explicit path lists that path directly (what
        # _ftp_is_directory does).
        entries = self.tree.get(path or self._pwd, [])
        return [(name, {"type": t}) for name, t in entries]

    def delete(self, name):
        self.deleted.append(name)

    def rmd(self, name):
        self.rmd_calls.append(name)

    def quit(self):
        pass


class TestFtpIsDirectory:
    def test_disk_image_is_a_file_not_a_directory(self):
        ftp = FakeFTP({"/Temp": [("probe.d64", "file")]})
        assert cloud._ftp_is_directory(ftp, "/Temp/probe.d64") is False

    def test_disk_image_with_space_in_name(self):
        ftp = FakeFTP({"/Temp": [("funk paint 0.46c.d64", "file")]})
        assert cloud._ftp_is_directory(ftp, "/Temp/funk paint 0.46c.d64") is False

    def test_real_directory_reported_as_directory(self):
        ftp = FakeFTP({"/Temp": [("subdir", "dir")]})
        assert cloud._ftp_is_directory(ftp, "/Temp/subdir") is True

    def test_trailing_slash_normalised(self):
        ftp = FakeFTP({"/Temp": [("probe.d64", "file")]})
        assert cloud._ftp_is_directory(ftp, "/Temp/probe.d64/") is False

    def test_case_insensitive_name_fallback(self):
        ftp = FakeFTP({"/Temp": [("Probe.D64", "file")]})
        assert cloud._ftp_is_directory(ftp, "/Temp/probe.d64") is False

    def test_falls_back_to_cwd_probe_when_mlsd_unavailable(self):
        # No MLSD -> old CWD probe. CWD to a listable dir succeeds -> True.
        ftp = FakeFTP({}, mlsd_raises=True)
        assert cloud._ftp_is_directory(ftp, "/Temp/anything") is True


class TestFilesDeleteRouting:
    @pytest.fixture(autouse=True)
    def _patch_ftp(self, monkeypatch):
        monkeypatch.setattr(cloud, "read_last_c64_ip", lambda: "192.168.1.65")

    def _delete(self, ftp, path):
        client = cloud.app.test_client()
        return client.delete(
            "/files/delete",
            query_string={"c64_ip": "192.168.1.65", "path": path},
        ), ftp

    def test_disk_image_deleted_with_dele_not_rmd(self, monkeypatch):
        ftp = FakeFTP({"/Temp": [("probe nospace.d64", "file")]})
        monkeypatch.setattr(cloud, "_check_ftp_connection", lambda host: ftp)
        resp, ftp = self._delete(ftp, "/Temp/probe nospace.d64")
        assert resp.status_code == 200
        assert ftp.deleted == ["/Temp/probe nospace.d64"]
        assert ftp.rmd_calls == []

    def test_real_directory_still_uses_recursive_delete(self, monkeypatch):
        ftp = FakeFTP(
            {
                "/Temp": [("subdir", "dir")],
                "/Temp/subdir": [("inner.prg", "file")],
            }
        )
        monkeypatch.setattr(cloud, "_check_ftp_connection", lambda host: ftp)
        resp, ftp = self._delete(ftp, "/Temp/subdir")
        assert resp.status_code == 200
        # the file inside was DELE'd and the directory itself RMD'd
        assert "/Temp/subdir/inner.prg" in ftp.deleted
        assert "/Temp/subdir" in ftp.rmd_calls
