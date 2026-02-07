import socket
import os
import ipaddress

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


def get_network(ip: str) -> ipaddress.IPv4Network:
    # Try to get netmask from system
    try:
        iface = os.popen(
            "ip route get 8.8.8.8 | awk '{print $5}'").read().strip()
        if iface:
            netmask = os.popen(
                f"ip addr show {iface} | grep 'inet ' | awk '{{print $2}}' | cut -d'/' -f2").read().strip()
            if netmask:
                return ipaddress.IPv4Network(f"{ip}/{netmask}", strict=False)
    except Exception:
        pass
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
