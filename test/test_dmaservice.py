import socket

"""
# Commands
0xFF01 SOCKET_CMD_DMA: DMA load
0xFF02 SOCKET_CMD_DMARUN: DMA load and run
0xFF03 SOCKET_CMD_KEYB: Keyboard input
0xFF04 SOCKET_CMD_RESET: Reset C64
0xFF05 SOCKET_CMD_WAIT: Wait (delay)
0xFF06 SOCKET_CMD_DMAWRITE: DMA raw write
0xFF07 SOCKET_CMD_REUWRITE: REU write
0xFF08 SOCKET_CMD_KERNALWRITE: Kernal write
0xFF09 SOCKET_CMD_DMAJUMP: DMA load and jump
0xFF0A SOCKET_CMD_MOUNT_IMG: Mount disk image
0xFF0B SOCKET_CMD_RUN_IMG: Mount and run disk image
0xFF0C SOCKET_CMD_POWEROFF: Power off
0xFF0D SOCKET_CMD_RUN_CRT: Run cartridge image
0xFF0E SOCKET_CMD_IDENTIFY: Identify (get product info)  returns len(title[0])+1 bytes
0xFF1F SOCKET_CMD_AUTHENTICATE: Authenticate (password)  return 1 byte: 0=fail, 1=success
0xFF20 SOCKET_CMD_VICSTREAM_ON: Start VIC stream (U64 only)
0xFF21 SOCKET_CMD_AUDIOSTREAM_ON: Start audio stream (U64 only)
0xFF22 SOCKET_CMD_DEBUGSTREAM_ON: Start debug stream (U64 only)
0xFF30 SOCKET_CMD_VICSTREAM_OFF: Stop VIC stream (U64 only)
0xFF31 SOCKET_CMD_AUDIOSTREAM_OFF: Stop audio stream (U64 only)
0xFF32 SOCKET_CMD_DEBUGSTREAM_OFF: Stop debug stream (U64 only)
0xFF71 SOCKET_CMD_LOADSIDCRT: Load SID cartridge (undocumented/dev)
0xFF72 SOCKET_CMD_LOADBOOTCRT: Load boot cartridge (undocumented/dev)
0xFF75 SOCKET_CMD_READFLASH: Read flash (undocumented/dev)
0xFF76 SOCKET_CMD_DEBUG_REG: Debug register (undocumented/dev, U64 only)
"""


def dma_run(filename: str):
    """
    curl -X POST http://192.168.1.136/v1/runners:run_prg --data-binary @sys0801.prg
    """
    with open(filename, 'rb') as f:
        data = f.read()
        payload = data
        send(0x02, len(payload), payload)


def keyboard_input(data: bytes):
    send(0x03, len(data), data)


def reset_c64():
    send(0x04)


def power_off():
    send(0x0C)


def dma_write(address: int, data: bytes):
    payload = address.to_bytes(2, 'little') + data
    send(0x06, len(payload), payload)


def identify():
    """
    Send the IDENTIFY command and print product info string.
    """
    # Use send() to transmit the command
    send(0x0E, read=True)
    # Open a new socket to receive the response
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('192.168.1.65', 64))
    response = s.recv(64)
    s.close()
    print(response)


def send(cmd: int, length: int = 0, payload: bytes = b'', read: bool = False):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('192.168.1.65', 64))
    cmd = 0xFF00 | cmd
    s.sendall(cmd.to_bytes(2, 'little'))
    s.sendall(length.to_bytes(2, 'little'))
    if length > 0:
        s.sendall(payload)
    if read:
        response = s.recv(64)  # only few commands return data
        if response:
            print("Response:", response)
    s.close()


# reset_c64()
# dma_write(0x0400, b'\x31\x38\x39\x00')
# keyboard_input(b'HELLO WORLD!\n')
power_off()
# dma_run('test_net.prg')
# identify()
