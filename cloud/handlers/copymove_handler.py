"""
CopyMoveHandler - `cp <src> <dst>` / `mv <src> <dst>` across the Ultimate DOS
filesystem, the `#n` network/workspace drive, and (as a source only) CSDB.

Devices reachable here:
  - UCI (no prefix): the Ultimate64/C64U's own FTP filesystem. h/t/f/u/v are
    all the SAME physical drive/filesystem (just different starting
    directories the cartridge jumps to on #h/#t/#f/#u/#v) so there is no
    per-letter prefix -- a bare path is either absolute ("/...") or relative
    to the live UCI cwd the cartridge sends in the \\x01-framed cwd context
    (see request_dispatcher.py / ultimate_handler.resolve_uci_abspath). A
    relative path with no frame available is a hard usage error, never a
    guess.
  - `n:` -- the server-local workspace tree behind #n (netdrive_handler.py).
    `n:` (empty) = current net_cwd dir. `n:/x` = workspace-ROOT-relative
    (NOT the real filesystem root). `n:x` = relative to net_cwd.
  - `c:<pattern>` -- SOURCE ONLY. Reuses CSDBHandler's existing
    release/zip-extraction logic (whatever release you last browsed into
    with #c, which persists in session state regardless of which device is
    currently active) but uploads the result to <dst> instead of the
    hardcoded /temp that CSDB's own one-arg `cp` always uses.
  - `8:`/`9:`/`s:` -- real IEC drives. No server-side session reaches them
    at all; always a clean error.

Not touched: CSDB's own one-arg `cp <pattern>` (still only usable while
browsing a release, still always uploads to /temp) and NetDriveHandler's own
one-arg `cp <name>` (still pushes a named workspace file to /temp). Both
keep working unchanged -- `can_handle` below only claims `cp` once 2+ args
are present, so the legacy one-arg forms fall through exactly as before.

Case folding: the SOURCE side gets the same case-sensitive-then-case-
insensitive-fallback matching already used by del/file/cd/mnt (see
ultimate_handler.match_ftp_files / _match_workspace_files below). The
DESTINATION filename is never folded -- typed case is the name being
created, matching this project's create/duplicate-command convention.

mv: same-filesystem (UCI->UCI, or workspace->workspace) uses a real atomic
rename. Crossing a filesystem boundary, mv = copy, verify (size match),
then delete the source -- in that order, so a failed/partial copy never
loses the source, and a verify failure removes the partial destination
rather than leaving it as a silent truncated copy.
"""

import fnmatch
import ftplib
import io
import logging
import os
import posixpath
import shutil

from sdk import BaseHandler, get_session_state_copy, WORKSPACE_DIR
from ultimate_handler import resolve_uci_abspath, resolve_uci_host, match_ftp_files

logger = logging.getLogger(__name__)

_CP_USAGE = "Usage: cp <src> <dst>"
_MV_USAGE = "Usage: mv <src> <dst>"
_NO_IEC = "?NO SERVER PATH TO IEC DRIVES"
_CSDB_RO_DST = "?CSDB IS READ-ONLY - c: cannot be a destination"
_CSDB_RO_MV_SRC = "?CSDB IS READ-ONLY - mv source cannot be c: (use cp)"
_NO_CLIENT_IP = "?NO CLIENT IP - cannot reach C64U"
_ACCESS_DENIED = "?ACCESS DENIED - outside workspace"
_GLOB_DEST_USAGE = "?USAGE: wildcard source requires an existing directory destination"

_PREFIX_LETTERS = {"n": "n", "c": "c", "8": "iec", "9": "iec", "s": "iec"}


def _has_glob(name: str) -> bool:
    return "*" in name or "?" in name


def _has_explicit_prefix(token: str) -> bool:
    return len(token) >= 2 and token[1] == ":"


def _classify(token: str, session_id: int = None):
    """Return (kind, remainder). kind in {"uci", "n", "c", "iec"}.

    Only `n:`/`c:`/`8:`/`9:`/`s:` are recognised prefixes -- there is
    deliberately no per-letter UCI prefix (h:/t:/f:/u:/v: are NOT special;
    they fall through as ordinary "uci" text, which is correct since those
    letters are just different starting directories on the one UCI
    filesystem, not separate devices).

    A bare token with no prefix resolves against whichever device this
    command was actually typed on. An absolute UCI path ("/...") always
    means the Ultimate filesystem, from any device. A *relative* bare token
    resolves against the live UCI cwd IF this request carried the wedge's
    \\x01-framed cwd context (h/t/f/u/v always send one) -- but if it didn't,
    the cartridge wasn't on a UCI device this request, so the only live
    "current directory" left is net_cwd (#n). This is not a guess or a
    cached device flag: frame presence is a fresh, per-request signal.
    """
    if len(token) >= 2 and token[1] == ":":
        kind = _PREFIX_LETTERS.get(token[0].lower())
        if kind:
            return kind, token[2:]
    if session_id is not None and not token.startswith("/"):
        state = get_session_state_copy(session_id)
        if not state.get("dos_cwd"):
            return "n", token
    return "uci", token


def _resolve_workspace_path(net_cwd: str, rel_path: str):
    """n: path resolution for cp/mv. '' -> net_cwd itself. A leading '/' is
    workspace-ROOT-relative (stripped, then joined from WORKSPACE_DIR
    directly -- NOT the real filesystem root, unlike a naive os.path.join).
    Otherwise relative to net_cwd. None = would escape WORKSPACE_DIR.

    Deliberately separate from NetDriveHandler._resolve, which mishandles a
    leading '/' in rel_path (os.path.join discards the base on POSIX when a
    later segment is absolute, so it resolves against the real filesystem
    root and gets rejected by the sandbox check instead of meaning anything
    useful) -- that method stays untouched for cd/ll/del/file/cp/put.
    """
    if rel_path == "" or rel_path == ".":
        base = net_cwd or ""
    elif rel_path.startswith("/"):
        base = rel_path.lstrip("/")
    else:
        base = os.path.join(net_cwd or "", rel_path)
    target = os.path.normpath(os.path.join(WORKSPACE_DIR, base))
    if target != WORKSPACE_DIR and not target.startswith(WORKSPACE_DIR + os.sep):
        return None
    return target


def _match_workspace_files(dirpath: str, glob: str):
    """Case-sensitive-then-case-insensitive-fallback file match, mirroring
    ultimate_handler.match_ftp_files / NetDriveHandler._del_files."""
    try:
        entries = os.listdir(dirpath)
    except OSError:
        return []
    names = [n for n in entries if os.path.isfile(os.path.join(dirpath, n))]
    matches = [n for n in names if fnmatch.fnmatchcase(n, glob)]
    if not matches:
        lowered = glob.lower()
        matches = [n for n in names if fnmatch.fnmatchcase(n.lower(), lowered)]
    return matches


def _ftp_retr_bytes(ftp, abspath: str) -> bytes:
    dirpath = posixpath.dirname(abspath) or "/"
    base = posixpath.basename(abspath)
    ftp.cwd(dirpath)
    buf = io.BytesIO()
    ftp.retrbinary(f"RETR {base}", buf.write)
    return buf.getvalue()


def _ftp_stor_bytes(ftp, abspath: str, data: bytes) -> None:
    dirpath = posixpath.dirname(abspath) or "/"
    base = posixpath.basename(abspath)
    ftp.cwd(dirpath)
    ftp.storbinary(f"STOR {base}", io.BytesIO(data))


def _nothing_matched(ftp, src_abs: str, src_rest: str, src_base: str) -> str:
    """?NOTHING MATCHED, except when the bare name is actually a directory --
    cp/mv only ever moves files, so that's a much clearer answer than
    implying nothing is there at all."""
    if not _has_glob(src_base):
        facts = _ftp_stat_exact(ftp, src_abs)
        if facts and facts.get("type") == "dir":
            return f"?CP/MV DOES NOT SUPPORT DIRECTORIES: {src_rest}"
    return f"?NOTHING MATCHED: {src_rest}"


def _ftp_stat_exact(ftp, abspath: str):
    """MLSD-stat one path -- used for dest-is-dir checks and move-
    verification. Root always "exists". Exact case wins first; falls back
    to a case-insensitive match otherwise, same as match_ftp_files --
    needed because the Ultimate's own top-level mounts (Temp, Flash, SD,
    USB0) are capitalized on disk regardless of how a path was typed."""
    if abspath in ("", "/"):
        return {"type": "dir"}
    dirpath = posixpath.dirname(abspath) or "/"
    base = posixpath.basename(abspath)
    try:
        ftp.cwd(dirpath)
        entries = list(ftp.mlsd())
    except ftplib.all_errors:
        return None
    for name, facts in entries:
        if name == base:
            return facts
    lowered = base.lower()
    for name, facts in entries:
        if name.lower() == lowered:
            return facts
    return None


class CopyMoveHandler(BaseHandler):
    """cp/mv dispatch across UCI, n:, and (source-only) c:."""

    def __init__(self):
        self._csdb = None

    def _csdb_handler(self):
        if self._csdb is None:
            from csdb_handler import CSDBHandler
            self._csdb = CSDBHandler()
        return self._csdb

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        parts = text.strip().split()
        if not parts:
            return False
        cmd = parts[0].lower()
        if cmd == "mv":
            return True
        if cmd == "cp":
            # 0/1-arg cp is left unclaimed so it falls through unchanged to
            # CSDBHandler's / NetDriveHandler's existing one-arg cp.
            return len(parts) >= 3
        return False

    def handle(self, text: str, session_id: int = 0) -> str:
        parts = text.strip().split()
        cmd = parts[0].lower() if parts else ""
        is_move = cmd == "mv"
        usage = _MV_USAGE if is_move else _CP_USAGE
        if len(parts) != 3:
            return usage
        return self._dispatch(parts[1], parts[2], is_move, session_id)

    # ------------------------------------------------------------------
    # top-level dispatch by (src kind, dst kind)
    # ------------------------------------------------------------------

    def _dispatch(self, src_tok, dst_tok, is_move, session_id) -> str:
        src_kind, src_rest = _classify(src_tok, session_id)
        dst_kind, dst_rest = _classify(dst_tok, session_id)

        # A bare source with no UCI cwd frame falls back to workspace-
        # relative (see _classify) -- but if you're actively browsing CSDB
        # (#c) rather than #n, a bare filename obviously means the release
        # you're looking at, not something in the workspace. Source only:
        # c: can never be a destination, so a bare *destination* in this
        # situation is left as workspace-relative regardless of module.
        if src_kind == "n" and not _has_explicit_prefix(src_tok):
            state = get_session_state_copy(session_id)
            if state.get("active_module") == "c":
                src_kind, src_rest = "c", src_tok

        if src_kind == "iec" or dst_kind == "iec":
            return _NO_IEC
        if dst_kind == "c":
            return _CSDB_RO_DST
        if src_kind == "c":
            if is_move:
                return _CSDB_RO_MV_SRC
            return self._cp_from_csdb(src_rest, dst_kind, dst_rest, session_id)

        if src_kind == "uci" and dst_kind == "uci":
            return self._cp_mv_uci_uci(src_rest, dst_rest, is_move, session_id)
        if src_kind == "uci" and dst_kind == "n":
            return self._cp_mv_uci_to_workspace(src_rest, dst_rest, is_move, session_id)
        if src_kind == "n" and dst_kind == "uci":
            return self._cp_mv_workspace_to_uci(src_rest, dst_rest, is_move, session_id)
        return self._cp_mv_workspace_workspace(src_rest, dst_rest, is_move, session_id)

    # ------------------------------------------------------------------
    # case 1: UCI -> UCI (one physical filesystem)
    # ------------------------------------------------------------------

    def _cp_mv_uci_uci(self, src_rest, dst_rest, is_move, session_id) -> str:
        usage = _MV_USAGE if is_move else _CP_USAGE
        src_abs = resolve_uci_abspath(src_rest, session_id)
        dst_abs = resolve_uci_abspath(dst_rest, session_id)
        if src_abs is None or dst_abs is None:
            return usage
        src_dir = posixpath.dirname(src_abs) or "/"
        src_base = posixpath.basename(src_abs)
        if not src_base:
            return usage

        host = resolve_uci_host(session_id)
        if not host:
            return _NO_CLIENT_IP

        try:
            with ftplib.FTP(host, timeout=10) as ftp:
                ftp.login()
                dst_facts = _ftp_stat_exact(ftp, dst_abs)
                dst_is_dir = bool(dst_facts and dst_facts.get("type") == "dir")

                try:
                    ftp.cwd(src_dir)
                except ftplib.all_errors:
                    return f"?NOTHING MATCHED: {src_rest}"
                names = match_ftp_files(ftp, src_base)
                if not names:
                    return _nothing_matched(ftp, src_abs, src_rest, src_base)
                if (len(names) > 1 or _has_glob(src_base)) and not dst_is_dir:
                    return _GLOB_DEST_USAGE

                done, failed = 0, 0
                for name in names:
                    full_src = posixpath.join(src_dir, name)
                    target = posixpath.join(dst_abs, name) if dst_is_dir else dst_abs
                    try:
                        if is_move:
                            renamed = False
                            try:
                                # RNTO refuses to overwrite an existing file
                                # on this FTP server (450); STOR-based cp
                                # overwrites silently, so mv must match that
                                # by clearing the old destination first.
                                existing = _ftp_stat_exact(ftp, target)
                                if existing and existing.get("type") == "file":
                                    ftp.delete(target)
                                ftp.rename(full_src, target)
                                renamed = True
                            except ftplib.all_errors as e:
                                logger.info(
                                    f"uci->uci rename {full_src} -> {target} "
                                    f"rejected ({e}), falling back to copy+delete"
                                )
                            if not renamed:
                                # This FTP server's RNFR/RNTO apparently can't
                                # move a file across directories (only rename
                                # in place) -- fall back to the same
                                # copy + verify + delete-source pattern the
                                # UCI<->n: move path already uses.
                                data = _ftp_retr_bytes(ftp, full_src)
                                _ftp_stor_bytes(ftp, target, data)
                                remote_facts = _ftp_stat_exact(ftp, target)
                                remote_size = (
                                    int(remote_facts["size"])
                                    if remote_facts and remote_facts.get("size") is not None
                                    else None
                                )
                                if remote_size is None or remote_size != len(data):
                                    raise IOError(
                                        f"short write: got {remote_size}, "
                                        f"expected {len(data)}"
                                    )
                                ftp.delete(full_src)
                        else:
                            _ftp_stor_bytes(ftp, target, _ftp_retr_bytes(ftp, full_src))
                        done += 1
                    except Exception as e:
                        failed += 1
                        logger.error(
                            f"uci->uci {'mv' if is_move else 'cp'} failed for {name}: {e}"
                        )
        except Exception as e:
            logger.error(f"cp/mv uci->uci failed: {e}")
            return f"?FTP FAILED: {e}"

        return _report(is_move, done, failed)

    # ------------------------------------------------------------------
    # case 2a: UCI -> n:
    # ------------------------------------------------------------------

    def _cp_mv_uci_to_workspace(self, src_rest, dst_rest, is_move, session_id) -> str:
        usage = _MV_USAGE if is_move else _CP_USAGE
        src_abs = resolve_uci_abspath(src_rest, session_id)
        if src_abs is None:
            return usage
        src_dir = posixpath.dirname(src_abs) or "/"
        src_base = posixpath.basename(src_abs)
        if not src_base:
            return usage

        state = get_session_state_copy(session_id)
        net_cwd = state.get("net_cwd") or ""
        dst_path = _resolve_workspace_path(net_cwd, dst_rest)
        if dst_path is None:
            return _ACCESS_DENIED
        dst_is_dir = os.path.isdir(dst_path)

        host = resolve_uci_host(session_id)
        if not host:
            return _NO_CLIENT_IP

        try:
            with ftplib.FTP(host, timeout=10) as ftp:
                ftp.login()
                try:
                    ftp.cwd(src_dir)
                except ftplib.all_errors:
                    return f"?NOTHING MATCHED: {src_rest}"
                names = match_ftp_files(ftp, src_base)
                if not names:
                    return _nothing_matched(ftp, src_abs, src_rest, src_base)
                if (len(names) > 1 or _has_glob(src_base)) and not dst_is_dir:
                    return _GLOB_DEST_USAGE

                done, failed = 0, 0
                for name in names:
                    full_src = posixpath.join(src_dir, name)
                    target = os.path.join(dst_path, name) if dst_is_dir else dst_path
                    partial = target + ".hdntmp"
                    try:
                        expected = None
                        if is_move:
                            facts = _ftp_stat_exact(ftp, full_src)
                            if facts and facts.get("size") is not None:
                                expected = int(facts["size"])
                        data = _ftp_retr_bytes(ftp, full_src)
                        if is_move and expected is not None and len(data) != expected:
                            raise IOError(
                                f"short read: got {len(data)}, expected {expected}"
                            )
                        write_target = partial if is_move else target
                        with open(write_target, "wb") as fh:
                            fh.write(data)
                        if is_move:
                            if os.path.getsize(write_target) != len(data):
                                raise IOError("local write truncated")
                            os.replace(write_target, target)
                            ftp.delete(full_src)
                        done += 1
                    except Exception as e:
                        failed += 1
                        if is_move and os.path.exists(partial):
                            try:
                                os.remove(partial)
                            except OSError:
                                pass
                        logger.error(
                            f"uci->n {'mv' if is_move else 'cp'} failed for {name}: {e}"
                        )
        except Exception as e:
            logger.error(f"cp/mv uci->n failed: {e}")
            return f"?FTP FAILED: {e}"

        return _report(is_move, done, failed)

    # ------------------------------------------------------------------
    # case 2b: n: -> UCI
    # ------------------------------------------------------------------

    def _cp_mv_workspace_to_uci(self, src_rest, dst_rest, is_move, session_id) -> str:
        usage = _MV_USAGE if is_move else _CP_USAGE
        state = get_session_state_copy(session_id)
        net_cwd = state.get("net_cwd") or ""
        src_path = _resolve_workspace_path(net_cwd, src_rest)
        if src_path is None:
            return _ACCESS_DENIED
        src_dir = os.path.dirname(src_path)
        src_base = os.path.basename(src_path)
        if not src_base:
            return usage

        dst_abs = resolve_uci_abspath(dst_rest, session_id)
        if dst_abs is None:
            return usage

        host = resolve_uci_host(session_id)
        if not host:
            return _NO_CLIENT_IP

        names = _match_workspace_files(src_dir, src_base)
        if not names:
            return f"?NOTHING MATCHED: {src_rest}"

        try:
            with ftplib.FTP(host, timeout=10) as ftp:
                ftp.login()
                dst_facts = _ftp_stat_exact(ftp, dst_abs)
                dst_is_dir = bool(dst_facts and dst_facts.get("type") == "dir")
                if (len(names) > 1 or _has_glob(src_base)) and not dst_is_dir:
                    return _GLOB_DEST_USAGE

                done, failed = 0, 0
                for name in names:
                    local_path = os.path.join(src_dir, name)
                    target = posixpath.join(dst_abs, name) if dst_is_dir else dst_abs
                    try:
                        with open(local_path, "rb") as fh:
                            data = fh.read()
                        _ftp_stor_bytes(ftp, target, data)
                        if is_move:
                            remote_facts = _ftp_stat_exact(ftp, target)
                            remote_size = (
                                int(remote_facts["size"])
                                if remote_facts and remote_facts.get("size") is not None
                                else None
                            )
                            if remote_size is None or remote_size != len(data):
                                try:
                                    ftp.delete(target)
                                except ftplib.all_errors:
                                    pass
                                raise IOError(
                                    f"short write: got {remote_size}, expected {len(data)}"
                                )
                            os.remove(local_path)
                        done += 1
                    except Exception as e:
                        failed += 1
                        logger.error(
                            f"n->uci {'mv' if is_move else 'cp'} failed for {name}: {e}"
                        )
        except Exception as e:
            logger.error(f"cp/mv n->uci failed: {e}")
            return f"?FTP FAILED: {e}"

        return _report(is_move, done, failed)

    # ------------------------------------------------------------------
    # case 3: n: -> n:
    # ------------------------------------------------------------------

    def _cp_mv_workspace_workspace(self, src_rest, dst_rest, is_move, session_id) -> str:
        usage = _MV_USAGE if is_move else _CP_USAGE
        state = get_session_state_copy(session_id)
        net_cwd = state.get("net_cwd") or ""
        src_path = _resolve_workspace_path(net_cwd, src_rest)
        dst_path = _resolve_workspace_path(net_cwd, dst_rest)
        if src_path is None or dst_path is None:
            return _ACCESS_DENIED

        src_dir = os.path.dirname(src_path)
        src_base = os.path.basename(src_path)
        if not src_base:
            return usage
        dst_is_dir = os.path.isdir(dst_path)

        names = _match_workspace_files(src_dir, src_base)
        if not names:
            return f"?NOTHING MATCHED: {src_rest}"
        if (len(names) > 1 or _has_glob(src_base)) and not dst_is_dir:
            return _GLOB_DEST_USAGE

        done, failed = 0, 0
        for name in names:
            local_src = os.path.join(src_dir, name)
            target = os.path.join(dst_path, name) if dst_is_dir else dst_path
            try:
                if is_move:
                    os.replace(local_src, target)
                else:
                    shutil.copy2(local_src, target)
                done += 1
            except OSError as e:
                failed += 1
                logger.error(f"n->n {'mv' if is_move else 'cp'} failed for {name}: {e}")

        return _report(is_move, done, failed)

    # ------------------------------------------------------------------
    # case 4: c:<pattern> -> UCI or n:
    # ------------------------------------------------------------------

    def _cp_from_csdb(self, glob_pattern, dst_kind, dst_rest, session_id) -> str:
        output, local_paths = self._csdb_handler()._extract_matching_files(
            glob_pattern, session_id
        )
        if not local_paths:
            return "\n".join(output)

        is_glob_like = _has_glob(glob_pattern) or len(local_paths) > 1

        if dst_kind == "uci":
            dst_abs = resolve_uci_abspath(dst_rest, session_id)
            if dst_abs is None:
                return _CP_USAGE
            host = resolve_uci_host(session_id)
            if not host:
                return _NO_CLIENT_IP
            try:
                with ftplib.FTP(host, timeout=10) as ftp:
                    ftp.login()
                    dst_facts = _ftp_stat_exact(ftp, dst_abs)
                    dst_is_dir = bool(dst_facts and dst_facts.get("type") == "dir")
                    if is_glob_like and not dst_is_dir:
                        return _GLOB_DEST_USAGE
                    for local_path in local_paths:
                        if not local_path.exists():
                            continue
                        target = (
                            posixpath.join(dst_abs, local_path.name)
                            if dst_is_dir
                            else dst_abs
                        )
                        with open(local_path, "rb") as fh:
                            data = fh.read()
                        _ftp_stor_bytes(ftp, target, data)
                        output.append(f"Copied {local_path.name} -> {target}")
            except Exception as e:
                output.append(f"?FTP FAILED: {e}")
            return "\n".join(output)

        # dst_kind == "n"
        state = get_session_state_copy(session_id)
        net_cwd = state.get("net_cwd") or ""
        dst_path = _resolve_workspace_path(net_cwd, dst_rest)
        if dst_path is None:
            return _ACCESS_DENIED
        dst_is_dir = os.path.isdir(dst_path)
        if is_glob_like and not dst_is_dir:
            return _GLOB_DEST_USAGE
        for local_path in local_paths:
            if not local_path.exists():
                continue
            target = os.path.join(dst_path, local_path.name) if dst_is_dir else dst_path
            try:
                shutil.copy2(local_path, target)
                output.append(f"Copied {local_path.name} -> {target}")
            except OSError as e:
                output.append(f"?ERROR copying {local_path.name}: {e}")
        return "\n".join(output)


def _report(is_move: bool, done: int, failed: int) -> str:
    verb = "moved" if is_move else "copied"
    if failed:
        return f"OK: {verb} {done} file(s); {failed} failed"
    return f"OK: {verb} {done} file(s)"
