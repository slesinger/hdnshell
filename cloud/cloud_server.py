"""
C64 HDN Cloud Server Application

TCP server that receives commands from C64 and responds with data.
Can run on local PC or in serverless cloud.
Requires C64 Ultimate with network target on the client side.
"""

import socket
import threading
import logging
import sys
import os
import argparse
from typing import Tuple, Optional
from code_chat_console import CodeChatConsole
from coding_agent_console import CodingAgentConsole
from file_editor_console import FileEditorConsole
from web_browser import WebBrowserConsole
from command_handler import CommandHandler, MAGIC_BYTES, CommandID, ResponseType
from shared_state import get_session_state
from console_manager import ConsoleManager

# Configure logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


class C64Server:
    """TCP server for C64 communication"""

    def __init__(self, host: str = "0.0.0.0", port: int = 6464):
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

        # Register custom server-console factories
        mgr = ConsoleManager.instance()
        mgr.register_factory(2, FileEditorConsole)  # Console 2 → File Editor
        mgr.register_factory(3, CodingAgentConsole)  # Console 3 → Coding Agent Chat
        mgr.register_factory(4, WebBrowserConsole)  # Console 4 → Web Browser
        mgr.register_factory(10, CodeChatConsole)  # C=+0 → Vibe Coding AI Chat

    def start(self):
        """Start the server and begin accepting connections"""
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_socket.bind((self.host, self.port))

        # Get actual port if 0 was specified (for testing)
        if self.port == 0:
            self.port = self.server_socket.getsockname()[1]

        self.server_socket.listen(5)
        self.running = True

        logger.info(f"C64 Server started on {self.host}:{self.port}")

        try:
            while self.running:
                try:
                    client_socket, address = self.server_socket.accept()
                    with self.lock:
                        self.clients.append(client_socket)
                    logger.info(f"Accepted connection from {address}")
                    # Use a stable session ID per client IP to persist state across connections
                    session_id = hash(address[0]) & 0xFFFFFFFF
                    thread = threading.Thread(
                        target=self.handle_client,
                        args=(client_socket, address, session_id),
                    )
                    thread.daemon = True
                    thread.start()
                except OSError:
                    # This can happen when the socket is closed by another thread
                    break
        finally:
            self.stop()

    def handle_client(
        self, client_socket: socket.socket, address: Tuple[str, int], session_id: int
    ):
        """
        Handle communication with a connected client

        Args:
            client_socket: Client socket
            address: Client address tuple
            session_id: A unique ID for this client session
        """
        try:
            # Store client IP for this session
            state = get_session_state(session_id)
            state["client_ip"] = address[0]
            while self.running:
                data = client_socket.recv(1024)
                if not data:
                    break  # Connection closed
                response = self.process_command(data, session_id)
                if response:
                    client_socket.sendall(response)
        except ConnectionResetError:
            logger.info(f"Connection reset by {address}")
        except Exception as e:
            logger.error(f"Error handling client {address}: {e}", exc_info=True)
        finally:
            logger.info(f"Connection from {address} closed")
            with self.lock:
                if client_socket in self.clients:
                    self.clients.remove(client_socket)
            client_socket.close()

    @staticmethod
    def process_command(packet: bytes, session_id: int = 0) -> Optional[bytes]:
        """
        Process a complete command packet from the client
        """
        # Print packet in hex for debugging
        logger.info(f"Received packet: {packet.hex()}")

        try:
            magic, console_cmd_id, data = CommandHandler.parse_packet(packet)
            if magic != MAGIC_BYTES:
                logger.warning("Invalid magic bytes received")
                return None

            response_data = b""
            response_type = ResponseType.PETSCII_NULL_TERMINATED

            console_id: int = (console_cmd_id & 0xF0) >> 4  # Upper 4 bits shifted right
            cmd_id = console_cmd_id & 0x03  # Ensure lower 2 bits only

            if console_id == 0:
                # Console 0 — local C64 shell
                if cmd_id == CommandID.KEYPRESS:
                    response_data = CommandHandler.handle_keypress(data)
                elif cmd_id == CommandID.TEXT_INPUT:
                    response_data = CommandHandler.handle_text_input(data, session_id)
                else:
                    logger.warning(f"Unknown command ID: {cmd_id}")

                if response_data:
                    resp = CommandHandler.create_response(response_type, response_data)
                    logger.info(f"ResponseT: {resp.hex()}")
                    return resp

            elif CommandHandler.is_server_console(console_id):
                # Consoles 1-10 — server-side virtual consoles
                if cmd_id == CommandID.COMMAND:
                    logger.info(
                        f"Received command for console {console_id}: {data.hex()}"
                    )
                    resp = CommandHandler.handle_command(console_id, data, session_id)
                    if resp:
                        logger.info(f"ResponseC: {resp.hex()}")
                        return resp
                    return None  # No response for unhandled commands or commands that respond using DMA write

                elif cmd_id == CommandID.KEYPRESS:
                    resp_data = CommandHandler.handle_console_keypress(
                        console_id, data, session_id
                    )
                    if resp_data:
                        resp = CommandHandler.create_response(response_type, resp_data)
                        logger.info(f"ResponseK: {resp.hex()}")
                        return resp
                    return None

                elif cmd_id == CommandID.TEXT_INPUT:
                    resp_data = CommandHandler.handle_console_text_input(
                        console_id, data, session_id
                    )
                    if resp_data:
                        resp = CommandHandler.create_response(response_type, resp_data)
                        logger.info(f"ResponseI: {resp.hex()}")
                        return resp

                else:
                    logger.warning(f"Unknown cmd_id {cmd_id} for console {console_id}")

            else:
                logger.warning(f"Console {console_id} out of range")

        except ValueError as e:
            logger.error(f"Packet parsing error: {e}")
        except Exception as e:
            logger.error(f"Error processing command: {e}", exc_info=True)

        return None

    def stop(self):
        """Stop the server and close all connections"""
        logger.info("Stopping server...")
        self.running = False
        if self.server_socket:
            # This will unblock the accept() call
            self.server_socket.close()
            self.server_socket = None

        with self.lock:
            for client in self.clients:
                try:
                    client.shutdown(socket.SHUT_RDWR)
                    client.close()
                except OSError:
                    pass  # Ignore errors on already closed sockets
            self.clients.clear()

        logger.info("C64 Server stopped.")

    def cleanup(self):
        """Cleanup resources"""
        logger.info("Server stopped")


def main():
    """Main entry point"""
    # Ensure cloud directory is in path
    sys.path.append(os.path.dirname(os.path.abspath(__file__)))

    parser = argparse.ArgumentParser(description="C64 HDN Cloud Server")
    parser.add_argument(
        "--host", default="0.0.0.0", help="Host to bind to (default: 0.0.0.0)"
    )
    parser.add_argument(
        "--port", type=int, default=6464, help="Port to listen on (default: 6464)"
    )
    parser.add_argument("--debug", action="store_true", help="Enable debug logging")

    args = parser.parse_args()

    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)

    server = C64Server(host=args.host, port=args.port)

    try:
        server.start()
    except KeyboardInterrupt:
        logger.info("Shutting down server...")
    finally:
        server.stop()
        server.cleanup()


if __name__ == "__main__":
    main()
