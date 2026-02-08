import socket
import net_utils
import os
import logging
import ftplib
import requests
from cloud_server import C64Server
from flask_cors import CORS
from threading import Thread
from flask import Flask, jsonify
import time
from flask import send_from_directory


# Configure logging for the web server
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("webserver")


app = Flask(__name__, static_folder="static", static_url_path="")
CORS(app)


@app.route("/")
def root():
    return send_from_directory(app.static_folder, "index.html")


@app.route("/<path:filepath>")
def static_files(filepath: str):
    full_path = os.path.join(app.static_folder, filepath)
    if os.path.isfile(full_path):
        return send_from_directory(app.static_folder, filepath)
    return send_from_directory(app.static_folder, "index.html")


@app.route("/status")
def status():
    return jsonify({"status": "ok"})


def read_last_c64_ip():
    config_path = os.path.join(os.path.dirname(__file__), "cloud_config.cfg")
    if not os.path.exists(config_path):
        return ""
    with open(config_path, "r") as f:
        for line in f:
            if line.startswith("last_c64_ip"):
                return line.split("=", 1)[1].strip().strip('"')
    return ""


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
    hdnsh_conf_present = False
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
        hdnsh_conf_present = "hdnsh.conf" in normalized
        hdnsh_cfg_present = "hdnsh.cfg" in normalized
    except Exception:
        ftp_file_service_enabled = False
        hdnsh_bin_present = False
        hdnsh_conf_present = False
        hdnsh_cfg_present = False

    return ftp_file_service_enabled, hdnsh_bin_present, hdnsh_conf_present, hdnsh_cfg_present


@app.route("/c64/status_extended")
def c64_status_extended():
    last_c64_ip = read_last_c64_ip()
    ultimate_dma_service_enabled = False
    ftp_file_service_enabled = False
    hdnsh_bin_present = False
    hdnsh_conf_present = False
    hdnsh_cfg_present = False

    if last_c64_ip:
        ultimate_dma_service_enabled = is_port_open(last_c64_ip, 64, timeout=2)
        (
            ftp_file_service_enabled,
            hdnsh_bin_present,
            hdnsh_conf_present,
            hdnsh_cfg_present,
        ) = check_ftp_files(last_c64_ip)

    return jsonify(
        {
            "ultimate_dma_service_enabled": ultimate_dma_service_enabled,
            "ftp_file_service_enabled": ftp_file_service_enabled,
            "hdnsh.bin_present": hdnsh_bin_present,
            "hdnsh.conf_present": hdnsh_conf_present,
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


@app.route("/settings/ensure_rom")
def ensure_rom():
    last_c64_ip = read_last_c64_ip()
    if not last_c64_ip:
        return jsonify({"error": "No C64 IP found. Run scan first."}), 400

    try:
        rom_path, asset_name = download_latest_rom("/tmp/hdnshell")
        # Copy hdnsh.cfg as a twin if missing
        cfg_src = os.path.join(os.path.dirname(__file__), "../binaries/hdnsh.cfg")
        cfg_dst = os.path.join(os.path.dirname(rom_path), "hdnsh.cfg")
        if not os.path.exists(cfg_dst) and os.path.exists(cfg_src):
            import shutil
            shutil.copy2(cfg_src, cfg_dst)
        upload_rom_via_ftp(last_c64_ip, rom_path)
        return jsonify(
            {
                "status": "ok",
                "message": f"Uploaded {asset_name} and hdnsh.cfg to ftp://{last_c64_ip}/Flash/roms"
            }
        )
    except Exception as exc:
        logger.exception("Failed to ensure ROM")
        return jsonify({"error": str(exc)}), 500


@app.route("/settings/find_c64u", methods=["POST"])
def find_c64u():
    # Indicate scan started
    logger.info("Scanning network for C64U...")
    found_ip = net_utils.find_port_64_hosts()
    time.sleep(25)  # Simulate scan duration
    logger.info(f"Scan complete. Found: {found_ip}")
    # Update config if any IPs found
    if found_ip:
        config_path = os.path.join(os.path.dirname(__file__), "cloud_config.cfg")
        with open(config_path, "w") as f:
            f.write(f"last_c64_ip = \"{found_ip}\"\n")
    return jsonify({"found_ips": found_ip})


@app.route("/clients")
def clients():
    # Optionally, expose connected C64 clients (requires server instance)
    if hasattr(app, 'c64_server'):
        with app.c64_server.lock:
            return jsonify({"clients": len(app.c64_server.clients)})
    return jsonify({"clients": None})


def get_external_ips():
    ips = []
    for iface in socket.getaddrinfo(host=socket.gethostname(), port=None):
        ip = iface[4][0]
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
            print(f"  http://{ip}:8585")
    else:
        print("No external IP address found.")
    app.run(host='0.0.0.0', port=8585, debug=False, use_reloader=False)


if __name__ == "__main__":
    # Read config file
    config_path = os.path.join(os.path.dirname(__file__), "cloud_config.cfg")
    last_c64_ip = ""
    if os.path.exists(config_path):
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
        else:
            print("No C64 IPs found on the network.")

    # Start the C64 TCP server
    c64_server = C64Server()
    app.c64_server = c64_server  # Attach for web endpoints

    # Start web server in a separate thread
    web_thread = Thread(target=run_web, daemon=True)
    web_thread.start()

    # Start the C64 server (blocking)
    c64_server.start()
