"""
UltimateHandler - server-side commands that talk directly to the Ultimate64/
C64U cartridge's own REST DMA API and its built-in FTP server.

Three commands live here:

  - mkdir <abspath>            Create a directory on the C64U's FTP server.
  - memcpy $START-$END <path>  SAVE: read an inclusive C64 memory range via
                                the Ultimate REST readmem API and FTP-STOR it
                                to <abspath> on the C64U.
  - memcpy <path> $ADDR        LOAD: FTP-RETR <abspath> from the C64U and
                                DMA-write its bytes into C64 memory at $ADDR
                                via the Ultimate REST writemem API.
  - mkdisk <path>[,<tracks>][,<diskname>]
                                Create a .d64/.d71/.d81/.dnp disk image on the
                                C64U via the Ultimate REST create_d64/d71/d81/dnp
                                API (sdk/network_helper.py's rest_create_disk).
  - del <pattern>              Delete file(s) matching a glob pattern on the
                                C64U's FTP filesystem (fnmatch over the resolved
                                directory; directories are never deleted). When
                                the #n network drive is active this command is
                                yielded to NetDriveHandler instead.

Policy: memory access always goes over the Ultimate REST API
(sdk/network_helper.py's dma_read_memory / dma_write_memory_rest), never
FTP. FTP is used only for moving the file itself, exactly like
netdrive_handler.py's cp/put reuse ftplib against the C64's own FTP server
at state["client_ip"].
"""

import io
import logging
import os
import posixpath
import re
import fnmatch
import ftplib

from sdk import BaseHandler, get_session_state_copy, network_helper

logger = logging.getLogger(__name__)

_MEMCPY_USAGE = "Usage: memcpy $START-$END /path/file  OR  memcpy /path/file $ADDR"
_MKDISK_USAGE = "Usage: mkdisk <name>.d64[,tracks][,diskname]  (d64/d71/d81/dnp)"
_DEL_USAGE = "Usage: del <pattern>  (e.g. del *.prg)"

# extension (lowercase, no dot) -> REST create_<type> suffix
_MKDISK_TYPES = ("d64", "d71", "d81", "dnp")

# $START-$END or START-END (hex, optional $/0x prefix on either side)
_HEX_RANGE_RE = re.compile(
    r"^(?:\$|0[xX])?([0-9A-Fa-f]+)-(?:\$|0[xX])?([0-9A-Fa-f]+)$"
)
# $ADDR or ADDR (hex, optional $/0x prefix)
_HEX_ADDR_RE = re.compile(r"^(?:\$|0[xX])?([0-9A-Fa-f]+)$")

_READ_CHUNK = 256
# writemem POST has no documented size cap, but the PUT variant caps at 128 and
# firmware buffer limits are unproven, so chunk writes conservatively too.
_WRITE_CHUNK = 256


class UltimateHandler(BaseHandler):
    """mkdir / memcpy against the Ultimate64/C64U's REST + FTP servers."""

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        parts = text.strip().split()
        if not parts:
            return False
        cmd = parts[0].lower()
        # `del` is context-sensitive: on the #n network drive it targets the
        # server-local workspace (NetDriveHandler), so yield it there. mkdir/
        # mkdisk/memcpy stay unconditional (always the C64U), per the dispatcher
        # ordering note in request_dispatcher.py.
        if cmd == "del":
            state = get_session_state_copy(session_id)
            return state.get("active_module") != "n"
        return cmd in ("mkdir", "memcpy", "mkdisk")

    def handle(self, text: str, session_id: int = 0) -> str:
        parts = text.strip().split()
        cmd = parts[0].lower() if parts else ""
        args = parts[1:]

        if cmd == "mkdir":
            return self._mkdir(args, session_id)
        if cmd == "memcpy":
            return self._memcpy(args, session_id)
        if cmd == "mkdisk":
            return self._mkdisk(text, session_id)
        if cmd == "del":
            return self._del(args, session_id)
        return "?ERROR"

    # ------------------------------------------------------------------
    # relative-path resolution (Step 21 cwd context frame)
    # ------------------------------------------------------------------

    def _resolve_abspath(self, path: str, session_id: int):
        """Return an absolute path for `path`, or None if it can't be made absolute.

        Absolute paths (leading '/') pass through unchanged. A relative path is
        joined against this session's UCI DOS current directory, which the wedge
        sends in the ``\\x01``-framed cwd context (see request_dispatcher). If the
        path is relative and no valid cwd context is available (un-framed request,
        or the cartridge's get_path failed and it fell open), returns None so the
        caller keeps the old absolute-path-required behaviour.
        """
        if path.startswith("/"):
            return path
        state = get_session_state_copy(session_id)
        cwd = state.get("dos_cwd")
        if not cwd or not cwd.startswith("/"):
            return None
        # posix-join + normalise so a root cwd ("/") or a trailing slash cannot
        # produce "//name", and any "." / ".." in the typed name is cleaned up.
        return posixpath.normpath(cwd.rstrip("/") + "/" + path)

    # ------------------------------------------------------------------
    # mkdir
    # ------------------------------------------------------------------

    def _mkdir(self, args, session_id: int) -> str:
        if not args:
            return "Usage: mkdir /absolute/path (or a name relative to the current dir)"
        abspath = self._resolve_abspath(args[0], session_id)
        if abspath is None:
            return "Usage: mkdir /absolute/path (or a name relative to the current dir)"

        state = get_session_state_copy(session_id)
        ftp_host = state.get("client_ip")
        if not ftp_host:
            return "?NO CLIENT IP - cannot reach C64U's FTP server"

        try:
            with ftplib.FTP(ftp_host, timeout=10) as ftp:
                ftp.login()
                ftp.mkd(abspath)
        except Exception as e:
            logger.error(f"mkdir failed for {abspath}: {e}")
            return f"?FTP FAILED: {e}"

        return f"OK: created {abspath}"

    # ------------------------------------------------------------------
    # memcpy
    # ------------------------------------------------------------------

    def _memcpy(self, args, session_id: int) -> str:
        if len(args) != 2:
            return _MEMCPY_USAGE
        a, b = args

        a_range = _HEX_RANGE_RE.match(a)
        b_range = _HEX_RANGE_RE.match(b)
        b_addr = _HEX_ADDR_RE.match(b)

        # SAVE: memcpy $START-$END <path>  (a is a hex range; b is the destination
        # path, absolute or relative-to-cwd). The range's '-' disambiguates vs a path.
        if a_range and not b_range:
            return self._memcpy_save(a_range.group(1), a_range.group(2), b, session_id)

        # LOAD: memcpy <path> $ADDR  (b is a bare hex address; a is the source path).
        if b_addr and not a_range:
            return self._memcpy_load(a, b_addr.group(1), session_id)

        return _MEMCPY_USAGE

    def _resolve_host(self, session_id: int):
        state = get_session_state_copy(session_id)
        return state.get("client_ip") or network_helper.read_last_c64_ip()

    def _memcpy_save(self, start_hex: str, end_hex: str, path: str, session_id: int) -> str:
        start = int(start_hex, 16)
        end = int(end_hex, 16)
        if end < start:
            return _MEMCPY_USAGE
        length = end - start + 1
        if length <= 0:
            return _MEMCPY_USAGE

        abspath = self._resolve_abspath(path, session_id)
        if abspath is None:
            return _MEMCPY_USAGE

        host = self._resolve_host(session_id)
        if not host:
            return "?NO CLIENT IP - cannot reach C64U's FTP server"

        try:
            data = bytearray()
            addr = start
            remaining = length
            while remaining > 0:
                chunk_len = min(_READ_CHUNK, remaining)
                chunk = network_helper.dma_read_memory(host, addr, chunk_len)
                if len(chunk) != chunk_len:
                    raise IOError(
                        f"short read at {addr:04X}: got {len(chunk)}/{chunk_len}"
                    )
                data += chunk
                addr += chunk_len
                remaining -= chunk_len
        except Exception as e:
            logger.error(f"memcpy save: readmem failed for {start:04X}-{end:04X}: {e}")
            return f"?READMEM FAILED: {e}"

        try:
            bio = io.BytesIO(bytes(data))
            dirpath, base = os.path.split(abspath)
            with ftplib.FTP(host, timeout=10) as ftp:
                ftp.login()
                try:
                    ftp.cwd(dirpath or "/")
                    ftp.storbinary(f"STOR {base}", bio)
                except ftplib.all_errors:
                    bio.seek(0)
                    ftp.storbinary(f"STOR {abspath}", bio)
        except Exception as e:
            logger.error(f"memcpy save: FTP STOR failed for {abspath}: {e}")
            return f"?FTP FAILED: {e}"

        return f"OK: saved {length} bytes {start:04X}-{end:04X} -> {abspath}"

    def _memcpy_load(self, path: str, addr_hex: str, session_id: int) -> str:
        addr = int(addr_hex, 16)

        abspath = self._resolve_abspath(path, session_id)
        if abspath is None:
            return _MEMCPY_USAGE

        host = self._resolve_host(session_id)
        if not host:
            return "?NO CLIENT IP - cannot reach C64U's FTP server"

        try:
            bio = io.BytesIO()
            with ftplib.FTP(host, timeout=10) as ftp:
                ftp.login()
                ftp.retrbinary(f"RETR {abspath}", bio.write)
        except Exception as e:
            logger.error(f"memcpy load: FTP RETR failed for {abspath}: {e}")
            return f"?FTP FAILED: {e}"

        data = bio.getvalue()
        try:
            off = 0
            while off < len(data):
                piece = data[off:off + _WRITE_CHUNK]
                network_helper.dma_write_memory_rest(host, addr + off, piece)
                off += len(piece)
        except Exception as e:
            logger.error(f"memcpy load: writemem failed for {addr:04X}: {e}")
            return f"?WRITEMEM FAILED: {e}"

        return f"OK: loaded {len(data)} bytes {abspath} -> {addr:04X}"

    # ------------------------------------------------------------------
    # mkdisk
    # ------------------------------------------------------------------

    def _mkdisk(self, text: str, session_id: int) -> str:
        parts = text.strip().split(None, 1)
        if len(parts) < 2 or not parts[1].strip():
            return _MKDISK_USAGE

        fields = [f.strip() for f in parts[1].split(",")]
        if len(fields) > 3:
            return _MKDISK_USAGE
        path = fields[0]
        tracks_str = fields[1] if len(fields) > 1 else ""
        diskname = fields[2] if len(fields) > 2 else ""
        if not path:
            return _MKDISK_USAGE

        ext = os.path.splitext(path)[1].lstrip(".").lower()
        if ext not in _MKDISK_TYPES:
            return _MKDISK_USAGE

        tracks = None
        if tracks_str:
            try:
                tracks = int(tracks_str)
            except ValueError:
                return _MKDISK_USAGE

        if ext == "d64":
            if tracks is not None and tracks not in (35, 40):
                return "?BAD TRACKS - d64 supports 35 or 40"
        elif ext in ("d71", "d81"):
            # fixed track count on the firmware side; ignore a supplied value
            tracks = None
        elif ext == "dnp":
            if tracks is None or not (1 <= tracks <= 255):
                return "?BAD TRACKS - dnp requires tracks 1-255"

        abspath = self._resolve_abspath(path, session_id)
        if abspath is None:
            return _MKDISK_USAGE

        host = self._resolve_host(session_id)
        if not host:
            return "?NO CLIENT IP - cannot reach C64U"

        try:
            errors = network_helper.rest_create_disk(
                host, abspath, ext, tracks=tracks, diskname=diskname or None
            )
        except Exception as e:
            logger.error(f"mkdisk failed for {abspath}: {e}")
            return f"?REST FAILED: {e}"

        if errors:
            return f"?CREATE FAILED: {'; '.join(errors)}"

        return f"OK: created {abspath}"

    # ------------------------------------------------------------------
    # del
    # ------------------------------------------------------------------

    def _del(self, args, session_id: int) -> str:
        """Delete file(s) matching a glob pattern on the C64U's FTP filesystem.

        The pattern's directory part resolves against the UCI DOS cwd (Step 21
        context frame) exactly like mkdir/mkdisk; the basename is fnmatch'd
        against the files in that directory. Directories are never deleted.
        """
        if not args or not args[0]:
            return _DEL_USAGE
        pattern = args[0]

        abspath = self._resolve_abspath(pattern, session_id)
        if abspath is None:
            return _DEL_USAGE

        dirpath = posixpath.dirname(abspath) or "/"
        glob = posixpath.basename(abspath)
        if not glob:
            return _DEL_USAGE

        host = self._resolve_host(session_id)
        if not host:
            return "?NO CLIENT IP - cannot reach C64U"

        try:
            with ftplib.FTP(host, timeout=10) as ftp:
                ftp.login()
                ftp.cwd(dirpath)
                names = self._match_files(ftp, glob)
                if not names:
                    return f"?NOTHING MATCHED: {pattern}"
                deleted = 0
                failed = []
                for name in names:
                    try:
                        ftp.delete(name)
                        deleted += 1
                    except ftplib.all_errors as e:
                        failed.append(name)
                        logger.error(f"del: could not delete {name}: {e}")
        except Exception as e:
            logger.error(f"del failed for {pattern}: {e}")
            return f"?FTP FAILED: {e}"

        if failed:
            return f"OK: deleted {deleted} file(s); {len(failed)} failed"
        return f"OK: deleted {deleted} file(s)"

    def _match_files(self, ftp, glob):
        """Return the names in the current FTP dir that are files and match glob.

        Uses MLSD (which tags each entry file/dir) when the server supports it so
        directories are excluded; falls back to NLST (no type info) when it does
        not -- in that case DELE simply fails on a directory and it is skipped.
        """
        try:
            return [
                name
                for name, facts in ftp.mlsd()
                if facts.get("type") == "file" and fnmatch.fnmatch(name, glob)
            ]
        except ftplib.all_errors:
            return [name for name in ftp.nlst() if fnmatch.fnmatch(name, glob)]
