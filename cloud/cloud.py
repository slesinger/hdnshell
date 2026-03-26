import socket
import net_utils
import os
import sys
import stat
import shutil
import platform
import logging
import ftplib
import requests
import queue
import threading
from version import __version__
from cloud_server import C64Server
from workspace_init import init_workspace, get_workspace_config_path
from flask_cors import CORS
from threading import Thread
from flask import Flask, jsonify, request
from flask_sock import Sock  # type: ignore[import-untyped]
from flask import send_from_directory
from network_helper import (
    read_last_c64_ip,
    _send_tcp_cmd,
)
from config_manager import (
    read_config,
    write_config,
    get_merged_config,
    migrate_config,
    apply_env_overrides,
)
from cloud_config_template import CONFIG_DEFAULTS, SECRET_KEYS
from llm_factory import test_llm_completion


# Configure logging for the web server
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("webserver")


app = Flask(__name__, static_folder="static", static_url_path="")
static_folder = os.path.join(os.path.dirname(__file__), "static")
app.static_folder = static_folder
CORS(app)
sock = Sock(app)

# Module-level reference to the C64 TCP server (set in __main__)
_c64_server: "C64Server | None" = None

# ── U64 Stream state ──────────────────────────────────────────────────────────
# UDP ports used by the Ultimate64 VIC/audio stream (REST API defaults)
U64_VIDEO_UDP_PORT = 11000
U64_AUDIO_UDP_PORT = 11001

_video_active = False
_video_udp_thread = None
_video_stop_event: threading.Event | None = None
_video_clients: list[queue.Queue] = []
_video_lock = threading.Lock()

_audio_active = False
_audio_udp_thread = None
_audio_stop_event: threading.Event | None = None
_audio_clients: list[queue.Queue] = []
_audio_lock = threading.Lock()


def _udp_receiver(port: int, get_active, clients, lock, stop_event: threading.Event):
    """Background thread: receive UDP packets and broadcast to all WebSocket queues."""
    udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    udp.bind(("0.0.0.0", port))
    udp.settimeout(0.5)
    logger.info(f"UDP listener started on port {port}")
    while not stop_event.is_set():
        try:
            data, _ = udp.recvfrom(65507)
        except socket.timeout:
            continue
        except OSError:
            break
        with lock:
            dead: list[queue.Queue] = []
            for q in clients:
                try:
                    q.put_nowait(data)
                except queue.Full:
                    pass  # drop frame for slow client
            for q in dead:
                clients.remove(q)
    udp.close()
    logger.info(f"UDP listener stopped on port {port}")


def _get_outbound_ip() -> str:
    """Return the IP address the server uses to reach the outside world."""
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except OSError:
        return "127.0.0.1"


@app.route("/")
def root():
    return send_from_directory(app.static_folder or "static", "index.html")


@app.route("/<path:filepath>")
def static_files(filepath: str):
    static_dir = app.static_folder or "static"
    full_path = os.path.join(static_dir, filepath)
    if os.path.isfile(full_path):
        return send_from_directory(static_dir, filepath)
    return send_from_directory(static_dir, "index.html")


@app.route("/status")
def status():
    return jsonify({"status": "ok"})


@app.route("/c64/status")
def c64_status():
    last_c64_ip = read_last_c64_ip()
    connected = False
    if last_c64_ip:
        try:
            with socket.create_connection((last_c64_ip, 64), timeout=2):
                connected = True
        except OSError:
            connected = False
    return jsonify({"last_c64_ip": last_c64_ip, "connected": connected})


def is_port_open(host, port, timeout=2):
    try:
        with socket.create_connection((host, port), timeout=timeout):
            return True
    except OSError:
        return False


def check_ftp_files(host):
    ftp_file_service_enabled = False
    hdnsh_bin_present = False
    hdnsh_cfg_present = False

    try:
        with ftplib.FTP() as ftp:
            ftp.connect(host, 21, timeout=3)
            ftp.login()
            ftp.cwd("/Flash/roms")
            entries = ftp.nlst()
        ftp_file_service_enabled = True
        normalized = {entry.lower() for entry in entries}
        hdnsh_bin_present = "hdnsh.bin" in normalized
        hdnsh_cfg_present = "hdnsh.cfg" in normalized
    except Exception:
        ftp_file_service_enabled = False
        hdnsh_bin_present = False
        hdnsh_cfg_present = False

    return ftp_file_service_enabled, hdnsh_bin_present, hdnsh_cfg_present


@app.route("/c64/status_extended")
def c64_status_extended():
    last_c64_ip = read_last_c64_ip()
    connected = False
    ultimate_dma_service_enabled = False
    ftp_file_service_enabled = False
    web_remote_control_enabled = False
    hdnsh_bin_present = False
    hdnsh_cfg_present = False

    if last_c64_ip:
        connected = is_port_open(last_c64_ip, 64, timeout=2)
        ultimate_dma_service_enabled = connected
        web_remote_control_enabled = is_port_open(last_c64_ip, 80, timeout=2)
        (
            ftp_file_service_enabled,
            hdnsh_bin_present,
            hdnsh_cfg_present,
        ) = check_ftp_files(last_c64_ip)

    return jsonify(
        {
            "connected": connected,
            "ultimate_dma_service_enabled": ultimate_dma_service_enabled,
            "ftp_file_service_enabled": ftp_file_service_enabled,
            "web_remote_control_enabled": web_remote_control_enabled,
            "hdnsh.bin_present": hdnsh_bin_present,
            "hdnsh.cfg_present": hdnsh_cfg_present,
        }
    )


def download_latest_rom(target_dir: str) -> tuple[str, str]:
    api_url = "https://api.github.com/repos/slesinger/hdnshell/releases/latest"
    response = requests.get(api_url, timeout=10)
    response.raise_for_status()
    release = response.json()
    assets = release.get("assets", [])
    if not assets:
        raise RuntimeError("No assets found in the latest release")

    chosen_asset = None
    for asset in assets:
        name = asset.get("name", "")
        if name.lower() == "hdnsh.bin":
            chosen_asset = asset
            break
    if chosen_asset is None:
        for asset in assets:
            name = asset.get("name", "")
            if name.lower().endswith(".bin"):
                chosen_asset = asset
                break

    if chosen_asset is None:
        raise RuntimeError("No ROM .bin asset found in the latest release")

    download_url = chosen_asset.get("browser_download_url")
    if not download_url:
        raise RuntimeError("Release asset missing download URL")

    os.makedirs(target_dir, exist_ok=True)
    local_path = os.path.join(target_dir, "hdnsh.bin")

    with requests.get(download_url, stream=True, timeout=20) as download:
        download.raise_for_status()
        with open(local_path, "wb") as f:
            for chunk in download.iter_content(chunk_size=1024 * 256):
                if chunk:
                    f.write(chunk)

    return local_path, chosen_asset.get("name", "hdnsh.bin")


def download_latest_cfg(target_dir: str) -> str:
    """Download hdnsh.cfg from the GitHub master branch into target_dir.
    Raises RuntimeError if the download fails.
    Returns the path to the downloaded cfg file."""
    cfg_url = (
        "https://raw.githubusercontent.com/slesinger/hdnshell/master/cloud/hdnsh.cfg"
    )
    os.makedirs(target_dir, exist_ok=True)
    local_path = os.path.join(target_dir, "hdnsh.cfg")
    response = requests.get(cfg_url, timeout=10)
    if not response.ok:
        raise RuntimeError(
            f"Failed to download hdnsh.cfg from GitHub (HTTP {response.status_code})"
        )
    with open(local_path, "wb") as f:
        f.write(response.content)
    return local_path


# Placeholder IP compiled into hdnsh.bin (see src/utils.asm host_ip label).
# The label reserves 16 bytes: 11 chars "192.168.1.2" + 5 null-padding bytes.
_ROM_IP_PLACEHOLDER = b"192.168.1.2"
_ROM_IP_SLOT_SIZE = 16  # total bytes available for IP + null terminator


def patch_server_ip(rom_path: str, server_ip: str) -> None:
    """Replace the placeholder IP in the ROM binary with *server_ip*.

    The replacement is done byte-by-byte within a fixed-size slot so the
    binary size never changes.  The new IP string is null-terminated and the
    remaining bytes in the slot are zeroed out.
    """
    ip_bytes = server_ip.encode("ascii")
    if len(ip_bytes) + 1 > _ROM_IP_SLOT_SIZE:
        raise ValueError(
            f"Server IP '{server_ip}' too long for the {_ROM_IP_SLOT_SIZE}-byte ROM slot"
        )

    with open(rom_path, "rb") as f:
        data = bytearray(f.read())
    offset = data.find(_ROM_IP_PLACEHOLDER)
    if offset == -1:
        raise RuntimeError(
            f"Placeholder IP {_ROM_IP_PLACEHOLDER!r} not found in {rom_path}"
        )

    # Build padded replacement: IP + 0x00 terminator + zero-fill rest of slot
    replacement = ip_bytes + b"\x00" * (_ROM_IP_SLOT_SIZE - len(ip_bytes))
    data[offset : offset + _ROM_IP_SLOT_SIZE] = replacement

    with open(rom_path, "wb") as f:
        f.write(data)
    logger.info("Patched ROM IP: %s -> %s (at offset 0x%04X)", _ROM_IP_PLACEHOLDER.decode(), server_ip, offset)


def upload_rom_via_ftp(host: str, rom_path: str) -> None:
    with ftplib.FTP() as ftp:
        ftp.connect(host, 21, timeout=5)
        ftp.login()
        ftp.cwd("/Flash/roms")
        # Upload hdnsh.bin
        with open(rom_path, "rb") as f:
            ftp.storbinary("STOR hdnsh.bin", f)
        # If hdnsh.cfg exists in the same directory as rom_path, upload it too
        cfg_path = os.path.join(os.path.dirname(rom_path), "hdnsh.cfg")
        if os.path.exists(cfg_path):
            with open(cfg_path, "rb") as f:
                ftp.storbinary("STOR hdnsh.cfg", f)


@app.route("/settings/server_ip_detect", methods=["GET"])
def server_ip_detect():
    """Return the server's primary LAN IP address."""
    try:
        ip = net_utils.get_primary_ip()
        return jsonify({"ip": ip})
    except Exception as exc:
        logger.exception("Failed to detect server IP")
        return jsonify({"error": str(exc)}), 500


@app.route("/settings/ensure_rom")
def ensure_rom():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400

    try:
        rom_path, asset_name = download_latest_rom("/tmp/hdnshell")
        # Download hdnsh.cfg from GitHub master branch alongside the ROM
        download_latest_cfg(os.path.dirname(rom_path))

        # Determine server IP to patch into the ROM
        cfg = read_config()
        server_ip = cfg.get("server_ip", "").strip()
        if not server_ip:
            server_ip = net_utils.get_primary_ip()
        if server_ip == "127.0.0.1":
            return jsonify({"error": "Server IP resolved to 127.0.0.1 (localhost). "
                           "Configure a real LAN IP in Settings."}), 400

        patch_server_ip(rom_path, server_ip)
        upload_rom_via_ftp(last_c64_ip, rom_path)
        return jsonify(
            {
                "status": "ok",
                "message": f"Uploaded {asset_name} (server IP {server_ip}) and hdnsh.cfg to ftp://{last_c64_ip}/Flash/roms",
            }
        )
    except Exception as exc:
        logger.exception("Failed to ensure ROM")
        return jsonify({"error": str(exc)}), 500


def _parse_version(tag: str) -> tuple:
    """Turn 'v1.2.3' or '1.2.3' into (1, 2, 3) for comparison."""
    return tuple(int(x) for x in tag.lstrip("vV").split("."))


@app.route("/settings/version_check", methods=["GET"])
def version_check():
    local_version = __version__
    try:
        api_url = "https://api.github.com/repos/slesinger/hdnshell/releases/latest"
        response = requests.get(api_url, timeout=10)
        response.raise_for_status()
        release = response.json()
        latest_tag = release.get("tag_name", "")
        published_at = release.get("published_at", "")
        html_url = release.get("html_url", "")
        release_name = release.get("name") or latest_tag
        body = release.get("body", "")

        update_available = False
        try:
            update_available = _parse_version(latest_tag) > _parse_version(
                local_version
            )
        except (ValueError, TypeError):
            pass

        return jsonify(
            {
                "local_version": local_version,
                "latest_version": latest_tag,
                "update_available": update_available,
                "release_name": release_name,
                "published_at": published_at,
                "html_url": html_url,
                "release_notes": body,
            }
        )
    except requests.RequestException as exc:
        logger.exception("Failed to check latest release")
        return jsonify({"error": str(exc), "local_version": local_version}), 502


@app.route("/settings/self_update", methods=["POST"])
def self_update():
    """Download the latest server binary from GitHub and replace + restart this process."""
    system = platform.system().lower()  # 'linux' or 'windows'
    if system not in ("linux", "windows"):
        return jsonify({"error": f"Unsupported platform: {system}"}), 400

    asset_name = "hdnsh-server-linux" if system == "linux" else "hdnsh-server-win.exe"

    try:
        api_url = "https://api.github.com/repos/slesinger/hdnshell/releases/latest"
        response = requests.get(api_url, timeout=10)
        response.raise_for_status()
        release = response.json()
        assets = release.get("assets", [])

        chosen_asset = next(
            (a for a in assets if a.get("name", "").lower() == asset_name.lower()),
            None,
        )
        if chosen_asset is None:
            return (
                jsonify({"error": f"Asset '{asset_name}' not found in latest release"}),
                404,
            )

        download_url = chosen_asset["browser_download_url"]
        tmp_path = os.path.join(
            "/tmp" if system == "linux" else os.environ.get("TEMP", "/tmp"),
            asset_name + ".new",
        )

        with requests.get(download_url, stream=True, timeout=60) as dl:
            dl.raise_for_status()
            with open(tmp_path, "wb") as f:
                for chunk in dl.iter_content(chunk_size=1024 * 256):
                    if chunk:
                        f.write(chunk)

        # Determine path of the running executable
        current_exe = (
            sys.executable
            if getattr(sys, "frozen", False)
            else os.path.abspath(sys.argv[0])
        )

        if system == "linux":
            # Make the download executable
            os.chmod(
                tmp_path,
                os.stat(tmp_path).st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH,
            )
            # Unlink the running binary first (kernel keeps the inode alive for
            # the current process), then move the new file into place.
            if os.path.exists(current_exe):
                os.remove(current_exe)
            shutil.move(tmp_path, current_exe)
            # Restart: spawn the new executable and let this process exit
            import subprocess

            subprocess.Popen([current_exe] + sys.argv[1:])
            # Respond before exiting
            resp = jsonify({"status": "ok", "message": "Updated and restarting..."})
            logger.info("Self-update complete; restarting process.")
            # Use a daemon thread so the response is sent before sys.exit()

            def _delayed_exit():
                import time as _time

                _time.sleep(1)
                os._exit(0)

            import threading

            threading.Thread(target=_delayed_exit, daemon=True).start()
            return resp
        else:
            # Windows: schedule replace on next start via a batch wrapper
            batch_path = current_exe + ".update.bat"
            with open(batch_path, "w") as bf:
                bf.write(
                    f"@echo off\n"
                    f"timeout /t 2 /nobreak >nul\n"
                    f'copy /Y "{tmp_path}" "{current_exe}"\n'
                    f'start "" "{current_exe}"\n'
                    f'del "%~f0"\n'
                )
            import subprocess

            subprocess.Popen(
                ["cmd", "/c", batch_path],
                creationflags=getattr(subprocess, "DETACHED_PROCESS", 0x00000008),
            )
            resp = jsonify(
                {"status": "ok", "message": "Update scheduled; restarting..."}
            )

            def _delayed_exit():
                import time as _time

                _time.sleep(1)
                os._exit(0)

            import threading

            threading.Thread(target=_delayed_exit, daemon=True).start()
            return resp

    except requests.RequestException as exc:
        logger.exception("Self-update download failed")
        return jsonify({"error": str(exc)}), 502
    except OSError as exc:
        logger.exception("Self-update file operation failed")
        return jsonify({"error": str(exc)}), 500


@app.route("/c64/basic/enabled", methods=["GET"])
def c64_basic_enabled():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    try:
        url = f"http://{last_c64_ip}/v1/configs/C64%20and%20Cartridge%20Settings/Basic%20ROM"
        response = requests.get(url, timeout=5)
        response.raise_for_status()
        data = response.json()
        current = (
            data.get("C64 and Cartridge Settings", {})
            .get("Basic ROM", {})
            .get("current", None)
        )
        if current is None:
            return jsonify({"error": "Unexpected response from C64"}), 502
        # Empty string means the default/stock BASIC ROM is active (basic enabled)
        enabled = current == ""
        return jsonify({"enabled": enabled, "current_rom": current})
    except requests.RequestException as exc:
        logger.exception("Failed to query Basic ROM config")
        return jsonify({"error": str(exc)}), 502


@app.route("/c64/basic/enable", methods=["PUT"])
def c64_basic_enable():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    try:
        url = f"http://{last_c64_ip}/v1/configs/C64%20and%20Cartridge%20Settings/Basic%20ROM"
        response = requests.put(url, params={"value": "hdnsh.bin"}, timeout=5)
        response.raise_for_status()
        return jsonify(response.json())
    except requests.RequestException as exc:
        logger.exception("Failed to enable Basic ROM")
        return jsonify({"error": str(exc)}), 502


@app.route("/c64/basic/disable", methods=["PUT"])
def c64_basic_disable():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    try:
        url = f"http://{last_c64_ip}/v1/configs/C64%20and%20Cartridge%20Settings/Basic%20ROM"
        response = requests.put(url, params={"value": ""}, timeout=5)
        response.raise_for_status()
        return jsonify(response.json())
    except requests.RequestException as exc:
        logger.exception("Failed to disable Basic ROM")
        return jsonify({"error": str(exc)}), 502


@app.route("/c64/menu_button", methods=["PUT"])
def c64_menu_button():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    try:
        url = f"http://{last_c64_ip}/v1/machine:menu_button"
        response = requests.put(url, timeout=5)
        response.raise_for_status()
        return jsonify({"status": "ok", "message": "Menu button command sent."})
    except requests.RequestException as exc:
        logger.exception("Failed to send menu button command")
        return jsonify({"error": str(exc)}), 502


@app.route("/c64/reboot", methods=["PUT"])
def c64_reboot():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    try:
        url = f"http://{last_c64_ip}/v1/machine:reboot"
        response = requests.put(url, timeout=5)
        response.raise_for_status()
        return jsonify({"status": "ok", "message": "Reboot command sent."})
    except requests.RequestException as exc:
        logger.exception("Failed to send reboot command")
        return jsonify({"error": str(exc)}), 502


@app.route("/c64/reset", methods=["PUT"])
def c64_reset():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((last_c64_ip, 64))
        cmd = (0xFF00 | 0x04).to_bytes(2, "little")
        s.sendall(cmd)
        s.sendall((0).to_bytes(2, "little"))  # length = 0
        s.close()
        return jsonify({"status": "ok", "message": "Reset command sent."})
    except OSError as exc:
        logger.exception("Failed to send reset command")
        return jsonify({"error": str(exc)}), 502


@app.route("/c64/power_off", methods=["PUT"])
def c64_power_off():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((last_c64_ip, 64))
        cmd = (0xFF00 | 0x0C).to_bytes(2, "little")
        s.sendall(cmd)
        s.sendall((0).to_bytes(2, "little"))  # length = 0
        s.close()
        return jsonify({"status": "ok", "message": "Power off command sent."})
    except OSError as exc:
        logger.exception("Failed to send power off command")
        return jsonify({"error": str(exc)}), 502


@app.route("/c64/readmem", methods=["GET"])
def c64_readmem():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400
    address = request.args.get("address", "0000")
    length = request.args.get("length", "256")
    # Validate address is hex, length is decimal
    try:
        addr_int = int(address, 16)
    except ValueError:
        return jsonify({"error": "Invalid address (must be hex)"}), 400
    if addr_int < 0 or addr_int > 0xFFFF:
        return jsonify({"error": "Address out of range (0000-FFFF)"}), 400
    try:
        length_int = int(length)
    except ValueError:
        return jsonify({"error": "Invalid length (must be decimal)"}), 400
    if length_int < 1 or length_int > 65536:
        return jsonify({"error": "Length out of range (1-65536)"}), 400
    try:
        url = f"http://{last_c64_ip}/v1/machine:readmem"
        params = {"address": address, "length": str(length_int)}
        response = requests.get(url, params=params, timeout=30)
        response.raise_for_status()
        return response.content, 200, {"Content-Type": "application/octet-stream"}
    except requests.RequestException as exc:
        logger.exception("Failed to read memory")
        return jsonify({"error": str(exc)}), 502


@app.route("/settings/find_c64u", methods=["POST"])
def find_c64u():
    # Indicate scan started
    logger.info("Scanning network for C64U...")
    found_ip = net_utils.find_port_64_hosts()
    logger.info(f"Scan complete. Found: {found_ip}")
    # Always write config so the file exists; update IP only when found
    if found_ip:
        cfg = read_config()
        cfg["last_c64_ip"] = found_ip
        write_config(cfg)
    elif not os.path.exists(get_workspace_config_path()):
        write_config(read_config())
    return jsonify({"found_ips": found_ip})


# ─── Settings / Config ─────────────────────────────────────────────────────────


@app.route("/settings/config", methods=["GET"])
def settings_get_config():
    """Return all configuration (non-secret values + masked secrets)."""
    return jsonify(get_merged_config())


@app.route("/settings/config", methods=["PUT"])
def settings_put_config():
    """Save configuration.  Body is a flat JSON object.

    All keys are stored in cloud_config.cfg.
    Secret values that are all '*' (masked) are left unchanged.
    """
    data = request.get_json(force=True, silent=True) or {}
    if not data:
        return jsonify({"error": "No data provided"}), 400

    # Start from current config so unsubmitted keys are preserved
    existing = read_config()

    for key in CONFIG_DEFAULTS:
        if key in data:
            value = data[key]
            # If a secret value is all asterisks (masked), keep the existing value
            if key in SECRET_KEYS and value and all(c == "*" for c in value):
                continue
            existing[key] = value

    write_config(existing)
    apply_env_overrides()

    return jsonify({"status": "ok"})


@app.route("/settings/c64_ip", methods=["PUT"])
def settings_put_c64_ip():
    """Update just the C64 IP address."""
    data = request.get_json(force=True, silent=True) or {}
    ip = data.get("ip", "").strip()
    cfg = read_config()
    cfg["last_c64_ip"] = ip
    write_config(cfg)
    return jsonify({"status": "ok", "last_c64_ip": ip})


@app.route("/settings/test_llm", methods=["POST"])
def settings_test_llm():
    """Test an LLM provider by sending a completion prompt.

    Body: {"role": "chat" | "code" | "backup"}
    """
    data = request.get_json(force=True, silent=True) or {}
    role = data.get("role", "chat")
    if role not in ("chat", "code", "backup"):
        return jsonify({"error": "Invalid role. Use 'chat', 'code', or 'backup'."}), 400
    result = test_llm_completion(role)
    return jsonify(result)


@app.route("/clients")
def clients():
    # Optionally, expose connected C64 clients (requires server instance)
    if _c64_server is not None:
        with _c64_server.lock:
            return jsonify({"clients": len(_c64_server.clients)})
    return jsonify({"clients": None})


# ─── Keyboard ──────────────────────────────────────────────────────────────────


@app.route("/c64/keyboard", methods=["POST"])
def c64_keyboard():
    """Inject key presses into the C64 via TCP DMA-service command 0xFF03.

    Body: {"bytes": [<petscii_byte>, ...]}
    """
    last_ip = read_last_c64_ip()
    if not last_ip:
        return jsonify({"error": "No C64 IP configured"}), 400
    data = request.get_json(force=True, silent=True) or {}
    byte_list = data.get("bytes", [])
    if not byte_list:
        return jsonify({"error": "No bytes provided"}), 400
    payload = bytes([b & 0xFF for b in byte_list])
    try:
        _send_tcp_cmd(last_ip, 0x03, payload)
        return jsonify({"status": "ok", "bytes_sent": len(payload)})
    except OSError as exc:
        logger.exception("Keyboard send failed")
        return jsonify({"error": str(exc)}), 500


# ─── Stream control ────────────────────────────────────────────────────────────


@app.route("/streams/video/start", methods=["PUT"])
def start_video_stream():
    """Tell U64 to start sending its VIC video stream to this server (UDP 11000),
    and start the local UDP listener if not already running."""
    global _video_active, _video_udp_thread, _video_stop_event
    last_ip = read_last_c64_ip()
    if not last_ip:
        return jsonify({"error": "No C64 IP configured"}), 400

    server_ip = _get_outbound_ip()
    try:
        url = f"http://{last_ip}/v1/streams/video:start"
        resp = requests.put(url, params={"ip": server_ip}, timeout=5)
        resp.raise_for_status()
    except requests.RequestException as exc:
        logger.warning(f"U64 stream start via REST failed: {exc} — trying TCP fallback")
        try:
            # TCP fallback: SOCKET_CMD_VICSTREAM_ON (0xFF20)
            _send_tcp_cmd(last_ip, 0x20)
        except OSError as tcp_exc:
            logger.exception("TCP fallback for video stream also failed")
            return jsonify({"error": str(tcp_exc)}), 500

    if not _video_active:
        _video_active = True
        stop_evt = threading.Event()
        _video_udp_thread = threading.Thread(
            target=_udp_receiver,
            args=(
                U64_VIDEO_UDP_PORT,
                lambda: _video_active,
                _video_clients,
                _video_lock,
                stop_evt,
            ),
            daemon=True,
            name="udp-video",
        )
        _video_stop_event = stop_evt
        _video_udp_thread.start()

    return jsonify(
        {"status": "ok", "streaming_to": server_ip, "port": U64_VIDEO_UDP_PORT}
    )


@app.route("/streams/video/stop", methods=["PUT"])
def stop_video_stream():
    """Stop the video stream."""
    global _video_active
    _video_active = False
    if _video_stop_event is not None:
        _video_stop_event.set()

    last_ip = read_last_c64_ip()
    if last_ip:
        try:
            url = f"http://{last_ip}/v1/streams/video:stop"
            requests.put(url, timeout=5)
        except requests.RequestException:
            try:
                _send_tcp_cmd(last_ip, 0x30)  # SOCKET_CMD_VICSTREAM_OFF
            except OSError:
                pass

    return jsonify({"status": "ok"})


@app.route("/streams/audio/start", methods=["PUT"])
def start_audio_stream():
    """Tell U64 to start sending its audio stream to this server (UDP 11001)."""
    global _audio_active, _audio_udp_thread, _audio_stop_event
    last_ip = read_last_c64_ip()
    if not last_ip:
        return jsonify({"error": "No C64 IP configured"}), 400

    server_ip = _get_outbound_ip()
    try:
        url = f"http://{last_ip}/v1/streams/audio:start"
        resp = requests.put(url, params={"ip": server_ip}, timeout=5)
        resp.raise_for_status()
    except requests.RequestException as exc:
        logger.warning(
            f"U64 audio stream start via REST failed: {exc} — trying TCP fallback"
        )
        try:
            _send_tcp_cmd(last_ip, 0x21)  # SOCKET_CMD_AUDIOSTREAM_ON
        except OSError as tcp_exc:
            logger.exception("TCP fallback for audio stream also failed")
            return jsonify({"error": str(tcp_exc)}), 500

    if not _audio_active:
        _audio_active = True
        stop_evt = threading.Event()
        _audio_udp_thread = threading.Thread(
            target=_udp_receiver,
            args=(
                U64_AUDIO_UDP_PORT,
                lambda: _audio_active,
                _audio_clients,
                _audio_lock,
                stop_evt,
            ),
            daemon=True,
            name="udp-audio",
        )
        _audio_stop_event = stop_evt
        _audio_udp_thread.start()

    return jsonify(
        {"status": "ok", "streaming_to": server_ip, "port": U64_AUDIO_UDP_PORT}
    )


@app.route("/streams/audio/stop", methods=["PUT"])
def stop_audio_stream():
    """Stop the audio stream."""
    global _audio_active
    _audio_active = False
    if _audio_stop_event is not None:
        _audio_stop_event.set()

    last_ip = read_last_c64_ip()
    if last_ip:
        try:
            url = f"http://{last_ip}/v1/streams/audio:stop"
            requests.put(url, timeout=5)
        except requests.RequestException:
            try:
                _send_tcp_cmd(last_ip, 0x31)  # SOCKET_CMD_AUDIOSTREAM_OFF
            except OSError:
                pass

    return jsonify({"status": "ok"})


# ─── WebSocket proxies ─────────────────────────────────────────────────────────


@sock.route("/ws/video")
def ws_video(ws):
    """WebSocket endpoint: forward UDP video packets to browser clients."""
    q: queue.Queue = queue.Queue(maxsize=10)
    with _video_lock:
        _video_clients.append(q)
    logger.info("WebSocket video client connected")
    try:
        while True:
            try:
                frame: bytes = q.get(timeout=5.0)
                ws.send(frame)  # binary frame
            except queue.Empty:
                # No data – check if client is still connected and stream is active
                if not ws.connected or not _video_active:
                    break
    except Exception:
        pass
    finally:
        with _video_lock:
            if q in _video_clients:
                _video_clients.remove(q)
        logger.info("WebSocket video client disconnected")


@sock.route("/ws/audio")
def ws_audio(ws):
    """WebSocket endpoint: forward UDP audio packets to browser clients."""
    q: queue.Queue = queue.Queue(maxsize=20)
    with _audio_lock:
        _audio_clients.append(q)
    logger.info("WebSocket audio client connected")
    try:
        while True:
            try:
                chunk: bytes = q.get(timeout=5.0)
                ws.send(chunk)
            except queue.Empty:
                # No data – check if client is still connected and stream is active
                if not ws.connected or not _audio_active:
                    break
    except Exception:
        pass
    finally:
        with _audio_lock:
            if q in _audio_clients:
                _audio_clients.remove(q)
        logger.info("WebSocket audio client disconnected")


def get_external_ips():
    ips = []
    for iface in socket.getaddrinfo(host=socket.gethostname(), port=None):
        ip = str(iface[4][0])
        if not ip.startswith("127.") and ":" not in ip:
            ips.append(ip)
    # Also try to get the primary outbound IP
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        if ip not in ips:
            ips.append(ip)
        s.close()
    except Exception:
        pass
    return ips


def run_web():
    # Print only external IPs
    ext_ips = get_external_ips()
    if ext_ips:
        print("Web server available on:")
        for ip in ext_ips:
            print(f"  http://{ip}:8064")
    else:
        print("No external IP address found.")
    app.run(host="0.0.0.0", port=8064, debug=False, use_reloader=False, threaded=True)


if __name__ == "__main__":

    # Initialise workspace directory tree (creates dirs + seed files on first run)
    init_workspace()

    # Ensure config file has all current keys (adds new settings on upgrade)
    migrate_config()

    # Push LANGSMITH_* and GOOGLE_APPLICATION_CREDENTIALS into os.environ
    apply_env_overrides()

    # Config now lives inside workspace/.config/
    config_path = get_workspace_config_path()

    # Read config file
    last_c64_ip = ""
    with open(config_path, "r") as f:
        for line in f:
            if line.startswith("last_c64_ip"):
                last_c64_ip = line.split("=", 1)[1].strip().strip('"')

    # If last_c64_ip is empty, scan network
    if not last_c64_ip:
        print("last_c64_ip is empty, scanning network for C64...")
        found_ip = net_utils.find_port_64_hosts()
        if found_ip:
            print("Found C64 IP:", found_ip)
            cfg = read_config()
            cfg["last_c64_ip"] = found_ip
            write_config(cfg)
        else:
            print("No C64 IPs found on the network.")

    # Start the C64 TCP server
    c64_server = C64Server()
    _c64_server = c64_server

    # Start web server in a separate thread
    web_thread = Thread(target=run_web, daemon=True)
    web_thread.start()

    # Start the C64 server (blocking)
    c64_server.start()
