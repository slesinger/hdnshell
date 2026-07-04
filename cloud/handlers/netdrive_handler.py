"""
NetDriveHandler - server-side proxy for the wedge cartridge's "#n" network
drive (see wedge/wedge-analysis.md).

The C64 side treats #n like any other UCI-style device: #n activates it,
then cd/pwd/ll/dir/cp all forward their raw typed line here over the
existing HDNCLD wire protocol (same TCP connection as chat/CSDB). Browsing
is a plain text request/response, sandboxed to cloud/workspace/ (the same
directory tree sdk/workspace.py seeds and cloud_server.py's assistant/coding
tools already treat as this server's one shared, non-secret file area).

File transfer ("cp") does NOT move bytes over that same hand-rolled text
protocol -- it reuses the FTP round trip cloud/handlers/csdb_handler.py's
own cp already relies on: the Ultimate/C64U hardware runs its own built-in
FTP server, reachable at the C64's own IP (state["client_ip"], populated
from the TCP peer address in cloud_server.py). So:
  - "cp <name>"  (GET, sent while the C64 is on #n): FTP-push the named
    workspace file onto the C64U's own FTP server, landing in /temp.
  - "put <name>" (PUT, sent while the C64 is on #h/#t/#f): FTP-pull the
    named file back out of the C64U's /temp into the current #n directory.
Both directions reuse ftplib exactly like csdb_handler.py's _cp_file, so no
new binary-safe framing was needed on the C64 side at all.
"""

import logging
import os
import ftplib

from sdk import BaseHandler, get_session_state_copy, update_session_state, WORKSPACE_DIR

logger = logging.getLogger(__name__)

_NAV_COMMANDS = {"cd", "pwd", "ll", "dir", "cp", "put"}


class NetDriveHandler(BaseHandler):
    """Sandboxed file-browser/transfer proxy onto cloud/workspace/."""

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        t = text.strip()
        tl = t.lower()
        if tl == "#n":
            return True
        state = get_session_state_copy(session_id)
        if state.get("active_module") == "n":
            # Let explicit switches to another module take priority.
            if any(tl.startswith(p) for p in ["i:", "c:", "#c", "?", "help"]):
                return False
            return True
        return False

    def handle(self, text: str, session_id: int = 0) -> str:
        t = text.strip()
        tl = t.lower()

        if tl == "#n":
            update_session_state(session_id, active_module="n", net_cwd="")
            return "NETDRIVE: /"

        state = get_session_state_copy(session_id)
        net_cwd = state.get("net_cwd") or ""
        parts = t.split(maxsplit=1)
        cmd = parts[0].lower() if parts else ""
        arg = parts[1].strip() if len(parts) > 1 else ""

        if cmd not in _NAV_COMMANDS:
            return "Unknown command. Type 'help' for available commands."

        if cmd == "pwd":
            return "/" + net_cwd.replace(os.sep, "/") if net_cwd else "/"

        if cmd == "cd":
            if not arg:
                return "Usage: cd <path>"
            target = self._resolve(net_cwd, arg)
            if target is None:
                return "?ACCESS DENIED - outside workspace"
            if not os.path.isdir(target):
                return f"?DIRECTORY NOT FOUND: {arg}"
            rel = os.path.relpath(target, WORKSPACE_DIR)
            rel = "" if rel == "." else rel
            update_session_state(session_id, net_cwd=rel)
            return "/" + rel.replace(os.sep, "/") if rel else "/"

        if cmd in ("ll", "dir"):
            return self._list_dir(net_cwd)

        if cmd == "cp":
            return self._get_file(net_cwd, arg, state)

        if cmd == "put":
            return self._put_file(net_cwd, arg, state)

        return "Unknown command."

    def _resolve(self, net_cwd: str, rel_path: str):
        """Resolve rel_path against net_cwd, refusing to leave WORKSPACE_DIR."""
        base = os.path.normpath(os.path.join(WORKSPACE_DIR, net_cwd))
        target = os.path.normpath(os.path.join(base, rel_path))
        if target != WORKSPACE_DIR and not target.startswith(
            WORKSPACE_DIR + os.sep
        ):
            return None
        return target

    def _list_dir(self, net_cwd: str) -> str:
        cur = self._resolve(net_cwd, "")
        try:
            entries = sorted(os.listdir(cur))
        except OSError as e:
            return f"?ERROR: {e}"
        if not entries:
            return "(empty)"
        lines = []
        for name in entries:
            full = os.path.join(cur, name)
            if os.path.isdir(full):
                lines.append(f"{name}/")
            else:
                try:
                    size = os.path.getsize(full)
                except OSError:
                    size = 0
                lines.append(f"{name} ({size})")
        return "\n".join(lines)

    def _get_file(self, net_cwd: str, arg: str, state: dict) -> str:
        """GET: push a workspace file onto the C64U's own FTP server (/temp)."""
        if not arg:
            return "Usage: cp <name>"
        resolved = self._resolve(net_cwd, arg)
        if resolved is None:
            return "?ACCESS DENIED - outside workspace"
        if not os.path.isfile(resolved):
            return f"?FILE NOT FOUND: {arg}"
        ftp_host = state.get("client_ip")
        if not ftp_host:
            return "?NO CLIENT IP - cannot reach C64U's FTP server"
        try:
            with ftplib.FTP(ftp_host, timeout=10) as ftp:
                ftp.login()
                ftp.cwd("/temp")
                with open(resolved, "rb") as fh:
                    ftp.storbinary(f"STOR {os.path.basename(resolved)}", fh)
        except Exception as e:
            logger.error(f"NetDrive cp (get) failed for {arg}: {e}")
            return f"?FTP FAILED: {e}"
        return f"OK: {arg} -> /TEMP"

    def _put_file(self, net_cwd: str, arg: str, state: dict) -> str:
        """PUT: pull a file out of the C64U's /temp into the current #n dir."""
        if not arg:
            return "Usage: put <name>"
        name = os.path.basename(arg)
        dest = self._resolve(net_cwd, name)
        if dest is None:
            return "?ACCESS DENIED - outside workspace"
        ftp_host = state.get("client_ip")
        if not ftp_host:
            return "?NO CLIENT IP - cannot reach C64U's FTP server"
        try:
            with ftplib.FTP(ftp_host, timeout=10) as ftp:
                ftp.login()
                ftp.cwd("/temp")
                with open(dest, "wb") as fh:
                    ftp.retrbinary(f"RETR {name}", fh.write)
        except Exception as e:
            logger.error(f"NetDrive cp (put) failed for {arg}: {e}")
            return f"?FTP FAILED: {e}"
        return f"OK: /TEMP/{name} -> {net_cwd or '/'}"
