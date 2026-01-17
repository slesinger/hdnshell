import socket

HOST = '0.0.0.0'  # Listen on all interfaces
PORT = 6464
RESPONSE = b'MEDLIK IS HERE'

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((HOST, PORT))
    s.listen(1)
    print(f"Listening on {HOST}:{PORT}...")
    while True:
        conn, addr = s.accept()
        with conn:
            print(f"Connected by {addr}")
            # Send greeting immediately
            conn.sendall(RESPONSE)
            print(f"Sent: {RESPONSE}")
            try:
                while True:
                    data = conn.recv(1)
                    if not data:
                        print("Client disconnected.")
                        break
                    print(f"Received: {data}")
                    # Increment the byte by 1 and send back
                    incremented = bytes([(data[0] + 1) % 256])
                    incremented = b"B"
                    conn.sendall(incremented)
                    print(f"Echoed: {incremented}")
            except Exception as e:
                print(f"Error during communication: {e}")
            break
print("Server stopped.")
