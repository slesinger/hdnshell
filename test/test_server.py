import socket
import sys

HOST = '0.0.0.0'  # Listen on all interfaces
PORT = 6464
RESPONSE = b'MEDLIK IS HERE'

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    # --- TCP Keepalive Configuration ---
    # Enable keepalive probes on the socket
    s.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)

    # The following settings are for Linux. They might need adjustment for other OS.
    if sys.platform == 'linux':
        # Time (in seconds) the connection is idle before starting to send keepalive probes
        s.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPIDLE, 10)
        # Interval (in seconds) between individual keepalive probes
        s.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPINTVL, 5)
        # Number of unacknowledged probes before considering the connection dead
        s.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPCNT, 3)

    s.bind((HOST, PORT))
    s.listen(1)
    print(f"Listening on {HOST}:{PORT} with TCP Keepalive enabled...")
    while True:
        conn, addr = s.accept()
        # Set a read timeout for the application layer.
        # This will catch clients that are network-alive but not sending app data.
        conn.settimeout(30.0)
        try:
            with conn:
                print(f"Connected by {addr}")
                # Send greeting immediately
                conn.sendall(RESPONSE)
                print(f"Sent: {RESPONSE}")
                while True:
                    try:
                        data = conn.recv(1)
                        if not data:
                            print("Client disconnected gracefully.")
                            break
                    except socket.timeout:
                        print("Application-level timeout. Client has been idle for too long.")
                        break
                    # A ConnectionResetError or other socket error will be raised by recv()
                    # when the OS determines the connection is dead via keepalive probes.
                    except ConnectionResetError:
                        print("Client disconnected abruptly (Connection Reset).")
                        break
                    except OSError as e:
                        print(f"Connection lost (OS Error): {e}")
                        break
                    print(f"Received: {data}")
                    # Increment the byte by 1 and send back
                    incremented = bytes([(data[0] + 1) % 256])
                    # incremented = b"B"
                    conn.sendall(incremented)
                    print(f"Echoed: {incremented}")
        except Exception as e:
            print(f"Error during communication: {e}")
        finally:
            print("Connection closed.")
# Server will continue to the next connection
print("Server stopped.")

