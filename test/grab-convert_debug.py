import sys
import socket
import struct

multicast_group = '239.0.1.64'
server_address = ('', 11002)

# Whitelist of address ranges (inclusive)
whitelist_ranges = [
    (0xdf00, 0xdf30),
    # Add more ranges as needed
]


def is_address_whitelisted(addr):
    for start, end in whitelist_ranges:
        if start <= addr <= end:
            return True
    return False


seconds = 5
if len(sys.argv) > 1:
    seconds = int(sys.argv[1])


sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# Set a timeout so the socket does not block indefinitely when trying
# to receive data.
sock.settimeout(2.0)

# Bind to the server address
sock.bind(server_address)

# Tell the operating system to add the socket to the multicast group
# on all interfaces.
group = socket.inet_aton(multicast_group)
mreq = struct.pack('4sL', group, socket.INADDR_ANY)
# sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)

sock.sendto(b"Hey, open the port!", ("192.168.0.121", 11002))

previous = None
with open("debug.raw", "wb") as raw_out, open("debug.txt", "w") as txt_out:
    for frame in range(2737 * seconds):
        data, address = sock.recvfrom(1536)
        (number, ) = struct.unpack("<H", data[0:2])
        if previous and (previous + 1) != number:
            print('X', end='')
        else:
            print('.', end='')
        previous = number
        sys.stdout.flush()
        # raw_out.write(data[4:])

        # Process debug samples (each 4 bytes)
        payload = data[4:]
        for i in range(0, len(payload), 4):
            if i + 4 > len(payload):
                break
            sample = payload[i:i+4]
            # Unpack as little-endian 32-bit
            val = struct.unpack('<I', sample)[0]
            address = (val >> 16) & 0xFFFF
            data_byte = (val >> 8) & 0xFF
            rw_flag = (val >> 7) & 0x1
            clk_flag = (val >> 6) & 0x1
            other_flags = val & 0x3F
            operation = 'R' if rw_flag else 'W'
            # Format other flags as 6-bit binary
            flags_bin = format(other_flags, '06b')
            if is_address_whitelisted(address):
                txt_out.write(f"{operation} {address:04X} {data_byte:02X} {flags_bin}\n")

print("Done.")
