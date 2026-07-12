"""
Network helper utilities for communicating with Ultimate64 via TCP DMA service.
"""

import socket
import os

DMA_SERVICE_PORT = 64

# DMA Service Commands
SOCKET_CMD_DMA = 0x01  # DMA command
SOCKET_CMD_DMARUN = 0x02  # Run DMA
SOCKET_CMD_KEYB = 0x03  # Keyboard input
SOCKET_CMD_RESET = 0x04  # Reset command
SOCKET_CMD_WAIT = 0x05  # Wait command
SOCKET_CMD_DMAWRITE = 0x06  # DMA write
SOCKET_CMD_REUWRITE = 0x07  # REU write
SOCKET_CMD_KERNALWRITE = 0x08  # Kernal write
SOCKET_CMD_DMAJUMP = 0x09  # DMA jump
SOCKET_CMD_MOUNT_IMG = 0x0A  # Mount image
SOCKET_CMD_RUN_IMG = 0x0B  # Run image
SOCKET_CMD_POWEROFF = 0x0C  # Power off
SOCKET_CMD_RUN_CRT = 0x0D  # Run cartridge
SOCKET_CMD_IDENTIFY = 0x0E  # Identify device
SOCKET_CMD_AUTHENTICATE = 0x1F  # Authentication
SOCKET_CMD_VICSTREAM_ON = 0x20  # Start VIC stream
SOCKET_CMD_AUDIOSTREAM_ON = 0x21  # Start audio stream
SOCKET_CMD_DEBUGSTREAM_ON = 0x22  # Start debug stream
SOCKET_CMD_VICSTREAM_OFF = 0x30  # Stop VIC stream
SOCKET_CMD_AUDIOSTREAM_OFF = 0x31  # Stop audio stream
SOCKET_CMD_DEBUGSTREAM_OFF = 0x32  # Stop debug stream
SOCKET_CMD_LOADSIDCRT = 0x71  # Load SID cartridge
SOCKET_CMD_LOADBOOTCRT = 0x72  # Load boot cartridge
SOCKET_CMD_READFLASH = 0x75  # Read flash
SOCKET_CMD_DEBUG_REG = 0x76  # Debug registers


def read_last_c64_ip() -> str:
    """Read the last known C64 IP address from the config file."""
    from .workspace import get_workspace_config_path

    config_path = get_workspace_config_path()
    if not os.path.exists(config_path):
        return ""
    with open(config_path, "r") as f:
        for line in f:
            if line.startswith("last_c64_ip"):
                return line.split("=", 1)[1].strip().strip('"')
    return ""


def _send_tcp_cmd(host: str, cmd: int, payload: bytes = b"") -> None:
    """Send a single DMA-service command to Ultimate64 on port 64."""
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.settimeout(5)
        s.connect((host, 64))
        s.sendall((0xFF00 | cmd).to_bytes(2, "little"))
        s.sendall(len(payload).to_bytes(2, "little"))
        if payload:
            s.sendall(payload)


def send_dmawrite(host: str, prg_data: bytes) -> None:
    """DMA-write a PRG into C64 memory. No execution.

    The PRG bytes already carry [load_addr lo][load_addr hi][data...] which
    is the payload layout expected by SOCKET_CMD_DMAWRITE (0xFF06).
    """
    _send_tcp_cmd(host, SOCKET_CMD_DMAWRITE, prg_data)


def dma_read_memory(host: str, address: int, length: int) -> bytes:
    """
    Read *length* bytes of C64 memory starting at *address* via the
    Ultimate cartridge REST API (GET /v1/machine:readmem).

    Returns the raw memory bytes on success, raises on error.
    """
    import requests as _requests

    url = f"http://{host}/v1/machine:readmem"
    params = {"address": f"{address:04x}", "length": str(length)}
    resp = _requests.get(url, params=params, timeout=5)
    resp.raise_for_status()
    return resp.content


def send_screen_data(screen_data: bytes, color_data: bytes) -> None:
    """Send screen + color data to Ultimate64 for DMA display."""
    _send_tcp_cmd(
        read_last_c64_ip(),
        SOCKET_CMD_DMAWRITE,
        0x0400.to_bytes(2, "little") + screen_data,
    )
    _send_tcp_cmd(
        read_last_c64_ip(),
        SOCKET_CMD_DMAWRITE,
        0xD800.to_bytes(2, "little") + color_data,
    )


def send_vic_colors(border: int, background: int) -> None:
    """DMA-write border ($D020) and background ($D021) colours to the C64."""
    _send_tcp_cmd(
        read_last_c64_ip(),
        SOCKET_CMD_DMAWRITE,
        0xD020.to_bytes(2, "little") + bytes([border & 0x0F]),
    )
    _send_tcp_cmd(
        read_last_c64_ip(),
        SOCKET_CMD_DMAWRITE,
        0xD021.to_bytes(2, "little") + bytes([background & 0x0F]),
    )


def send_c64_keyboard_input(data: bytes, host: str = None) -> None:
    """
    Send PETSCII key strokes to the C64 via the DMA service (SOCKET_CMD_KEYB).
    If host is not provided, uses the last known C64 IP from config.
    """
    if host is None:
        host = read_last_c64_ip()
    if not host:
        raise ValueError("C64 host IP address is not set.")
    _send_tcp_cmd(host, SOCKET_CMD_KEYB, data)


def dma_write_memory_rest(host: str, address: int, data: bytes) -> None:
    """
    Write data to C64 memory starting at *address* via the
    Ultimate cartridge REST API (POST /v1/machine:writemem).
    """
    import requests as _requests

    url = f"http://{host}/v1/machine:writemem"
    params = {"address": f"{address:04x}"}
    _requests.post(url, params=params, data=data, timeout=5)


def dma_jump(host: str, address: int) -> None:
    """
    Jump to and execute code at *address* on the C64 via DMA service.
    Uses SOCKET_CMD_DMAJUMP (0x09) which takes the target address as a 2-byte payload.
    """
    payload = address.to_bytes(2, "little")
    _send_tcp_cmd(host, SOCKET_CMD_DMAJUMP, payload)


def send_reset(host: str) -> None:
    """
    Send a soft reset command to the C64 via DMA service.
    Uses SOCKET_CMD_RESET (0x04).
    """
    _send_tcp_cmd(host, SOCKET_CMD_RESET)


def send_poweroff(host: str) -> None:
    """
    Send a power-off command to the Ultimate64 via DMA service.
    Uses SOCKET_CMD_POWEROFF (0x0C).
    """
    _send_tcp_cmd(host, SOCKET_CMD_POWEROFF)


def rest_menu_button(host: str) -> None:
    """
    Trigger the menu button on the Ultimate64 via REST API.
    """
    import requests as _requests

    url = f"http://{host}/v1/machine:menu_button"
    _requests.post(url, timeout=5)


def rest_reboot(host: str) -> None:
    """
    Trigger a reboot of the Ultimate64 via REST API.
    """
    import requests as _requests

    url = f"http://{host}/v1/machine:reboot"
    _requests.post(url, timeout=5)
