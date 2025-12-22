"""
C64 HDN Cloud Server Application

TCP server that receives commands from C64 and responds with data.
Can run on local PC or in serverless cloud.
Requires C64 Ultimate with network target on the client side.
"""
import socket
import threading
import logging
from typing import Tuple, Optional
from generate_pet_asc_table import Petscii

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


# Protocol constants
MAGIC_BYTES = bytes([0xFE, 0xFF])


class CommandID:
    """Command IDs from C64 client"""
    KEYPRESS = 0x01
    TEXT_INPUT = 0x02


class ResponseType:
    """Response types sent to C64"""
    PETSCII_NULL_TERMINATED = 0x01
    MIX_COMMANDS_SCREEN_CODES = 0x02
    MTEXT_FORMAT = 0x03


class ModifierFlags:
    """Modifier flags for keypress commands"""
    SHIFT = 0x01
    CTRL = 0x02
    COMMODORE = 0x04


class CommandHandler:
    """Handles processing of commands from C64 client"""

    @staticmethod
    def parse_packet(packet: bytes) -> Tuple[bytes, int, bytes]:
        """
        Parse a command packet from C64

        Args:
            packet: Raw packet bytes

        Returns:
            Tuple of (magic_bytes, command_id, data)

        Raises:
            ValueError: If packet is invalid
        """
        if len(packet) < 3:
            raise ValueError("Packet too short")

        magic = packet[0:2]
        if magic != MAGIC_BYTES:
            raise ValueError(f"Invalid magic bytes: {magic.hex()}")

        cmd_id = packet[2]
        data = packet[3:]

        return magic, cmd_id, data

    @staticmethod
    def handle_keypress(data: bytes) -> bytes:
        """
        Handle keypress command ($01)

        Args:
            data: Command data (1 byte PETSCII code + 1 byte modifier flags)

        Returns:
            Response packet
        """
        if len(data) < 2:
            logger.warning("Keypress data too short")
            return CommandHandler.create_response(
                ResponseType.PETSCII_NULL_TERMINATED,
                bytes([0x00])  # Empty response
            )

        petscii_code = data[0]
        modifiers = data[1]

        # Convert PETSCII to ASCII for logging
        ascii_code = Petscii.petscii2ascii(petscii_code)
        char = chr(
            ascii_code) if 32 <= ascii_code < 127 else f"<{ascii_code:02X}>"

        # Log the keypress
        mod_str = []
        if modifiers & ModifierFlags.SHIFT:
            mod_str.append("SHIFT")
        if modifiers & ModifierFlags.CTRL:
            mod_str.append("CTRL")
        if modifiers & ModifierFlags.COMMODORE:
            mod_str.append("C=")

        mod_desc = "+".join(mod_str) if mod_str else "none"
        logger.info(
            f"Keypress: {char} (PETSCII ${petscii_code:02X}), Modifiers: {mod_desc}")

        # Create echo response
        response_text = f"key: {char}\r".encode('ascii')
        petscii_response = bytes([Petscii.ascii2petscii(b)
                                 for b in response_text])
        petscii_response += bytes([0x00])  # Null terminator

        return CommandHandler.create_response(
            ResponseType.PETSCII_NULL_TERMINATED,
            petscii_response
        )

    @staticmethod
    def handle_text_input(data: bytes) -> bytes:
        """
        Handle text input command ($02)

        Args:
            data: Command data (null-terminated PETSCII string)

        Returns:
            Response packet
        """
        # Find null terminator
        null_pos = data.find(0x00)
        if null_pos == -1:
            logger.warning("Text input missing null terminator")
            petscii_text = data
        else:
            petscii_text = data[:null_pos]

        # Convert to UTF-8 for logging
        if len(petscii_text) > 0:
            utf8_bytes = bytes([Petscii.petscii2ascii(b)
                               for b in petscii_text])
            try:
                utf8_str = utf8_bytes.decode('ascii')
                logger.info(f"Text input: '{utf8_str}'")
            except UnicodeDecodeError:
                logger.info(f"Text input (raw): {petscii_text.hex()}")
        else:
            logger.info("Text input: (empty)")
            utf8_str = ""

        # Process the command - for now, just echo it back
        if len(petscii_text) > 0:
            # Echo back with ">" prefix
            prefix = "> "
            petscii_prefix = bytes(
                [Petscii.ascii2petscii(ord(c)) for c in prefix])
            response_data = petscii_prefix + petscii_text + \
                bytes([0x0D, 0x00])  # CR + null
        else:
            response_data = bytes([0x00])  # Just null terminator

        return CommandHandler.create_response(
            ResponseType.PETSCII_NULL_TERMINATED,
            response_data
        )

    @staticmethod
    def create_response(response_type: int, data: bytes) -> bytes:
        """
        Create a response packet

        Args:
            response_type: Type of response (ResponseType constant)
            data: Response data

        Returns:
            Complete response packet with magic bytes and type
        """
        return MAGIC_BYTES + bytes([response_type]) + data

    @staticmethod
    def process_command(packet: bytes) -> Optional[bytes]:
        """
        Process a command packet and generate response

        Args:
            packet: Raw command packet

        Returns:
            Response packet or None if invalid
        """
        try:
            magic, cmd_id, data = CommandHandler.parse_packet(packet)

            if cmd_id == CommandID.KEYPRESS:
                return CommandHandler.handle_keypress(data)
            elif cmd_id == CommandID.TEXT_INPUT:
                return CommandHandler.handle_text_input(data)
            else:
                logger.warning(f"Unknown command ID: ${cmd_id:02X}")
                return CommandHandler.create_response(
                    ResponseType.PETSCII_NULL_TERMINATED,
                    b"unknown cmd\r\x00"
                )
        except Exception as e:
            logger.error(f"Error processing command: {e}")
            return None


class C64Server:
    """TCP server for C64 communication"""

    def __init__(self, host: str = '0.0.0.0', port: int = 6464):
        """
        Initialize the C64 server

        Args:
            host: Host address to bind to
            port: Port number to listen on (default 6464)
        """
        self.host = host
        self.port = port
        self.running = False
        self.server_socket = None
        self.clients = []
        self.lock = threading.Lock()

    def start(self):
        """Start the server and begin accepting connections"""
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_socket.setsockopt(
            socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_socket.bind((self.host, self.port))

        # Get actual port if 0 was specified (for testing)
        if self.port == 0:
            self.port = self.server_socket.getsockname()[1]

        self.server_socket.listen(5)
        self.running = True

        logger.info(f"C64 Server started on {self.host}:{self.port}")

        try:
            while self.running:
                self.server_socket.settimeout(1.0)
                try:
                    client_socket, address = self.server_socket.accept()
                    logger.info(f"Client connected from {address}")

                    # Handle client in a separate thread
                    client_thread = threading.Thread(
                        target=self.handle_client,
                        args=(client_socket, address),
                        daemon=True
                    )
                    client_thread.start()

                    with self.lock:
                        self.clients.append(client_socket)
                except socket.timeout:
                    continue
                except Exception as e:
                    if self.running:
                        logger.error(f"Error accepting connection: {e}")
        finally:
            self.cleanup()

    def handle_client(self, client_socket: socket.socket, address: Tuple[str, int]):
        """
        Handle communication with a connected client

        Args:
            client_socket: Client socket
            address: Client address tuple
        """
        try:
            while self.running:
                # Receive data
                data = client_socket.recv(4096)
                if not data:
                    logger.info(f"Client {address} disconnected")
                    break

                logger.debug(
                    f"Received {len(data)} bytes from {address}: {data.hex()}")

                # Process command and send response
                response = CommandHandler.process_command(data)
                if response:
                    client_socket.send(response)
                    logger.debug(
                        f"Sent {len(response)} bytes to {address}: {response.hex()}")
        except Exception as e:
            logger.error(f"Error handling client {address}: {e}")
        finally:
            with self.lock:
                if client_socket in self.clients:
                    self.clients.remove(client_socket)
            client_socket.close()

    def stop(self):
        """Stop the server and close all connections"""
        logger.info("Stopping server...")
        self.running = False

        # Close all client connections
        with self.lock:
            for client in self.clients:
                try:
                    client.close()
                except Exception as e:
                    logger.error(f"Error closing client socket: {e}")
                    pass
            self.clients.clear()

        # Close server socket
        if self.server_socket:
            try:
                self.server_socket.close()
            except Exception as e:
                logger.error(f"Error closing server socket: {e}")
                pass

    def cleanup(self):
        """Cleanup resources"""
        logger.info("Server stopped")


def main():
    """Main entry point"""
    import argparse

    parser = argparse.ArgumentParser(description='C64 HDN Cloud Server')
    parser.add_argument('--host', default='0.0.0.0',
                        help='Host to bind to (default: 0.0.0.0)')
    parser.add_argument('--port', type=int, default=6464,
                        help='Port to listen on (default: 6464)')
    parser.add_argument('--debug', action='store_true',
                        help='Enable debug logging')

    args = parser.parse_args()

    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)

    server = C64Server(host=args.host, port=args.port)

    try:
        server.start()
    except KeyboardInterrupt:
        logger.info("Received interrupt signal")
    finally:
        server.stop()


if __name__ == '__main__':
    main()
