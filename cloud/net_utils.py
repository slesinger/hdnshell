import socket
import os
import ipaddress
import platform
import subprocess

# Get the primary non-localhost IPv4 address


def get_primary_ip() -> str:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # Connect to a public address, doesn't actually send packets
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
    finally:
        s.close()
    return ip

# Get the network range from the IP and netmask


def _cidr_from_netmask(mask: str) -> int | None:
    try:
        return ipaddress.IPv4Network(f"0.0.0.0/{mask}").prefixlen
    except Exception:
        return None


def _get_network_linux(ip: str) -> ipaddress.IPv4Network | None:
    try:
        iface = os.popen(
            "ip route get 8.8.8.8 | awk '{print $5}'").read().strip()
        if iface:
            netmask = os.popen(
                f"ip addr show {iface} | grep 'inet ' | awk '{{print $2}}' | cut -d'/' -f2").read().strip()
            if netmask:
                return ipaddress.IPv4Network(f"{ip}/{netmask}", strict=False)
    except Exception:
        return None
    return None


def _get_network_macos(ip: str) -> ipaddress.IPv4Network | None:
    try:
        route_out = subprocess.check_output(
            ["route", "-n", "get", "default"], text=True, stderr=subprocess.DEVNULL
        )
        iface = None
        for line in route_out.splitlines():
            if "interface:" in line:
                iface = line.split(":", 1)[1].strip()
                break
        if not iface:
            return None

        ifconfig_out = subprocess.check_output(
            ["ifconfig", iface], text=True, stderr=subprocess.DEVNULL
        )
        netmask_hex = None
        for line in ifconfig_out.splitlines():
            if "inet " in line and "netmask" in line:
                parts = line.split()
                if "netmask" in parts:
                    netmask_hex = parts[parts.index("netmask") + 1]
                    break
        if netmask_hex:
            if netmask_hex.startswith("0x"):
                netmask_hex = netmask_hex[2:]
            mask_int = int(netmask_hex, 16)
            netmask = str(ipaddress.IPv4Address(mask_int))
            cidr = _cidr_from_netmask(netmask)
            if cidr is not None:
                return ipaddress.IPv4Network(f"{ip}/{cidr}", strict=False)
    except Exception:
        return None
    return None


def _get_network_windows(ip: str) -> ipaddress.IPv4Network | None:
    try:
        ipconfig_out = subprocess.check_output(
            ["ipconfig"], text=True, stderr=subprocess.DEVNULL
        )
        lines = ipconfig_out.splitlines()
        for idx, line in enumerate(lines):
            if ip in line:
                # Search forward for Subnet Mask in the same adapter block
                for j in range(idx, min(idx + 20, len(lines))):
                    if "Subnet Mask" in lines[j]:
                        parts = lines[j].split(":", 1)
                        if len(parts) == 2:
                            netmask = parts[1].strip()
                            cidr = _cidr_from_netmask(netmask)
                            if cidr is not None:
                                return ipaddress.IPv4Network(f"{ip}/{cidr}", strict=False)
                        break
                break
    except Exception:
        return None
    return None


def get_network(ip: str) -> ipaddress.IPv4Network:
    system = platform.system().lower()
    network = None
    if "linux" in system:
        network = _get_network_linux(ip)
    elif "darwin" in system or "mac" in system:
        network = _get_network_macos(ip)
    elif "windows" in system:
        network = _get_network_windows(ip)

    if network is not None:
        return network
    # Fallback: assume /24
    return ipaddress.IPv4Network(f"{ip}/24", strict=False)

# Scan the network for machines with port 64 open


def scan_network_for_port_64(network: ipaddress.IPv4Network, timeout: float = 0.05) -> str:
    count = 0
    for ip in network.hosts():
        ip_str = str(ip)
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(timeout)
        try:
            s.connect((ip_str, 64))
            s.close()
            print()  # Newline after scan
            return ip_str  # Return first found
        except Exception:
            pass
        finally:
            s.close()
        count += 1
        if count % 10 == 0:
            print('.', end='', flush=True)
    print()  # Newline after scan
    return None

# Main function to use


def find_port_64_hosts() -> str:
    ip = get_primary_ip()
    network = get_network(ip)
    return scan_network_for_port_64(network)

# Example usage:
# hosts = find_port_64_hosts()
# print(hosts)
