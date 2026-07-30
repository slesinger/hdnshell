"""
HDN Server Application

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
import importlib
from typing import Tuple, Optional
from logging_utils import configure_application_logging

# Add app and SDK directories to module search path.
_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_SERVER_APPS_DIR = os.path.join(_CLOUD_DIR, "server-apps")
_HANDLERS_DIR = os.path.join(_CLOUD_DIR, "handlers")
for _p in (_SERVER_APPS_DIR, _HANDLERS_DIR):
    if _p not in sys.path:
        sys.path.insert(0, _p)

CodingAgentConsole = importlib.import_module("coding_agent_console").CodingAgentConsole
FileEditorConsole = importlib.import_module("file_editor_console").FileEditorConsole
TelegramChatConsole = importlib.import_module("telegram_chat").TelegramChatConsole
WhatsAppChatConsole = importlib.import_module("whatsapp_chat").WhatsAppChatConsole
MailClientConsole = importlib.import_module("mail_client").MailClientConsole
WebBrowserConsole = importlib.import_module("web_browser").WebBrowserConsole
RSSReaderConsole = importlib.import_module("rss_reader").RSSReaderConsole
WikiBrowserConsole = importlib.import_module("wiki_browser").WikiBrowserConsole
LauncherConsole = importlib.import_module("launcher").LauncherConsole

_cmd = importlib.import_module("sdk.command_handler")
CommandHandler = _cmd.CommandHandler
MAGIC_BYTES = _cmd.MAGIC_BYTES
CommandID = _cmd.CommandID
ResponseType = _cmd.ResponseType

update_session_state = importlib.import_module("sdk.shared_state").update_session_state
ConsoleManager = importlib.import_module("sdk.console_manager").ConsoleManager
_app_registry = importlib.import_module("sdk.app_registry")
AppRegistry = _app_registry.AppRegistry
AppInfo = _app_registry.AppInfo
LauncherConfig = importlib.import_module("sdk.launcher_config").LauncherConfig
PINNABLE_SLOTS = importlib.import_module("sdk.launcher_config").PINNABLE_SLOTS

# ---------------------------------------------------------------------------
# App catalog — the single source of truth for the Launcher (GH #22).
# Each entry: app-id, title, one-line description, default slot, factory.
# The default slots reproduce today's fixed C=+CTRL+<digit> layout, so a fresh
# install's hotbar matches the historical map.
# ---------------------------------------------------------------------------
APP_CATALOG = [
    AppInfo("file_editor", "File Editor", "Edit files in your workspace.", 2, FileEditorConsole),
    AppInfo("coding_agent", "Coding Agent", "AI coding assistant chat.", 3, CodingAgentConsole),
    AppInfo("web_browser", "Web Browser", "Browse the web in PETSCII.", 4, WebBrowserConsole),
    AppInfo("telegram", "Telegram", "Telegram chats and messages.", 5, TelegramChatConsole),
    AppInfo("rss", "RSS Reader", "Read RSS/Atom news feeds.", 6, RSSReaderConsole),
    # Mail (issue #23) reachable via the Launcher's RETURN-to-open. The wedge
    # only wires C=+CTRL+1..7, so slot 8 has no direct chord yet, but the
    # Launcher (GH #22) provides slot-free access to catalog apps.
    AppInfo("mail", "Mail", "IMAP/SMTP email client.", 8, MailClientConsole),
    AppInfo("whatsapp", "WhatsApp", "WhatsApp chats and messages.", 9, WhatsAppChatConsole),
    AppInfo("wiki", "Wikipedia", "Browse Wikipedia articles.", 7, WikiBrowserConsole),
]


def _populate_registry() -> "AppRegistry":
    """Register every catalog app with the AppRegistry singleton."""
    reg = AppRegistry.instance()
    for info in APP_CATALOG:
        reg.register(info)
    return reg


# Configure logging
configure_application_logging()
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
        self.clipboard_sync = None

        # Shared clipboard (GH #18): one text clipboard across the host
        # desktop, the local BASIC console and every server app. Configure
        # the service byte cap and start the (optional) host-clipboard
        # bridge; a headless host with no backend just leaves the server
        # clipboard fully functional.
        self._init_clipboard()

        # Build the console factory map from the app registry + user pins.
        # Console 1 is always the Launcher; slots 2-7/10 come from config
        # (defaulting to today's fixed map). An unpinned slot falls through
        # to a Launcher opened pre-highlighting that empty slot (GH #22).
        registry = _populate_registry()
        config = LauncherConfig.load(registry.default_pins())

        mgr = ConsoleManager.instance()
        mgr.register_factory(1, LauncherConsole)  # Console 1 → Launcher (always)
        # Fixed extras: apps whose default slot is NOT a hotbar slot (i.e.
        # outside PINNABLE_SLOTS, with no C=+CTRL+<digit> chord) keep their
        # default console as a permanent home, reachable via the Launcher's
        # RETURN-to-open.
        for info in APP_CATALOG:
            if info.default_slot not in PINNABLE_SLOTS:
                mgr.register_factory(info.default_slot, info.factory)
        # Hotbar slots come from the user's pins (defaulting to today's map);
        # an unpinned slot falls through to a Launcher pre-highlighting it.
        for slot in PINNABLE_SLOTS:
            app_id = config.pins.get(slot)
            info = registry.get(app_id) if app_id else None
            if info is not None:
                mgr.register_factory(slot, info.factory)
            else:
                # Unpinned slot → Launcher (pre-highlights this slot on open).
                mgr.register_factory(slot, LauncherConsole)

    def _init_clipboard(self):
        """Configure the ClipboardService and build the host-sync bridge.

        Reads clipboard_* keys from cloud_config. The polling thread is not
        started here -- ``start()`` does that -- so a test that constructs a
        C64Server never spawns a background clipboard thread.
        """
        try:
            read_config = importlib.import_module("sdk.config_manager").read_config
            configure = importlib.import_module(
                "sdk.clipboard"
            ).configure_clipboard_service
            HostClipboardSync = importlib.import_module(
                "sdk.host_clipboard"
            ).HostClipboardSync

            cfg = read_config()
            max_bytes = int(cfg.get("clipboard_max_bytes") or 65536)
            host_sync = str(cfg.get("clipboard_host_sync", "true")).lower() in (
                "1",
                "true",
                "yes",
                "on",
            )
            poll_ms = int(cfg.get("clipboard_poll_interval_ms") or 500)

            service = configure(max_bytes=max_bytes)
            self.clipboard_sync = HostClipboardSync(
                service, enabled=host_sync, poll_interval_ms=poll_ms
            )
        except Exception:
            logger.exception("clipboard initialisation failed; continuing without it")
            self.clipboard_sync = None

    def start(self):
        """Start the server and begin accepting connections"""
        if self.clipboard_sync is not None:
            try:
                self.clipboard_sync.start()
            except Exception:
                logger.exception("host clipboard sync failed to start")

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
                    logger.debug(f"Accepted connection from {address}")
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
            update_session_state(session_id, client_ip=address[0])
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
            logger.debug(f"Connection from {address} closed")
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
        logger.debug(f"Received packet: {packet.hex()}")

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
                    if response_data:
                        resp = CommandHandler.create_response(
                            response_type, response_data
                        )
                        # Explicit end-of-reply marker: the wedge's SOCKET_READ
                        # loop watches for this $00 to stop immediately instead
                        # of guessing completion via a quiet-gap retry window
                        # (bank03.asm hsh_prlp). Scoped to this one wire path
                        # only -- create_response's stripped format (and its
                        # tests) stay untouched for every other response type.
                        return resp + b"\x00"
                    return None
                elif cmd_id == CommandID.COMMAND:
                    # Local-shell commands (screen save/restore via DMA)
                    response_data = CommandHandler.handle_local_command(
                        data, session_id
                    )
                else:
                    logger.warning(f"Unknown command ID: {cmd_id}")

                if response_data:
                    resp = CommandHandler.create_response(response_type, response_data)
                    # logger.info(f"ResponseT: {resp.hex()}")
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
        if self.clipboard_sync is not None:
            try:
                self.clipboard_sync.stop()
            except Exception:
                logger.debug("host clipboard sync stop failed", exc_info=True)
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

    parser = argparse.ArgumentParser(description="HDN Server")
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
