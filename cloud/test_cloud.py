"""
Unit tests for cloud.py C64 TCP server
"""

import pytest
import socket
import threading
import time
from cloud_server import C64Server
from sdk.command_handler import (
    CommandHandler,
    MAGIC_BYTES,
    ResponseType,
    ModifierFlags,
    swap_c64_modifiers,
)


@pytest.fixture
def server():
    """Create a C64 server instance for testing"""
    srv = C64Server(host="127.0.0.1", port=0)  # Port 0 = random available port
    yield srv
    srv.stop()


@pytest.fixture
def running_server(server):
    """Create and start a C64 server in a background thread"""
    thread = threading.Thread(target=server.start, daemon=True)
    thread.start()
    time.sleep(0.1)  # Give server time to start
    yield server
    server.stop()
    # Make sure the accept-loop thread actually exits; the fixture must never
    # let a hung server thread leak into (and stall) later tests.
    thread.join(timeout=2)


class TestProtocolParsing:
    """Test protocol parsing and packet handling"""

    def test_parse_keypress_command(self):
        """Test parsing of keypress command ($01)"""
        # Magic byte + Command ID $01 + PETSCII 'a' ($41) + No modifiers
        packet = bytes([0xFE, 0x01, 0x41, 0x00])

        magic, cmd_id, data = CommandHandler.parse_packet(packet)

        assert magic == MAGIC_BYTES
        assert magic == bytes([0xFE])
        assert cmd_id == 0x01
        assert data == bytes([0x41, 0x00])

    def test_parse_text_input_command(self):
        """Test parsing of text input command ($02)"""
        # Magic byte + Command ID $02 + "hello" in PETSCII + null terminator
        # h=0x48, e=0x45, l=0x4C, l=0x4C, o=0x4F
        packet = bytes([0xFE, 0x02, 0x48, 0x45, 0x4C, 0x4C, 0x4F, 0x00])

        magic, cmd_id, data = CommandHandler.parse_packet(packet)

        assert magic == MAGIC_BYTES
        assert cmd_id == 0x02
        assert data == bytes([0x48, 0x45, 0x4C, 0x4C, 0x4F, 0x00])

    def test_invalid_magic_bytes(self):
        """Test that invalid magic byte is rejected"""
        packet = bytes([0xAA, 0x01, 0x41, 0x00])

        with pytest.raises(ValueError, match="Invalid magic bytes"):
            CommandHandler.parse_packet(packet)

    def test_packet_too_short(self):
        """Test that packets shorter than minimum length are rejected"""
        packet = bytes([0xFE, 0x01])

        with pytest.raises(ValueError, match="Packet too short"):
            CommandHandler.parse_packet(packet)


class TestCommandHandlers:
    """Test command processing"""

    def test_handle_keypress_no_modifiers(self):
        """Test handling keypress without modifiers"""
        # PETSCII 'a' ($41), no modifiers
        data = bytes([0x41, 0x00])

        response = CommandHandler.handle_keypress(data)

        assert response is not None
        # Responses no longer carry magic/response-type prefix bytes -- they
        # are raw (unterminated) PETSCII payloads.
        assert response[0:1] != MAGIC_BYTES
        assert len(response) > 0

    def test_handle_keypress_with_shift(self):
        """Test handling keypress with shift modifier"""
        # PETSCII 'A' ($C1), shift flag set (bit 0)
        data = bytes([0xC1, 0x01])

        response = CommandHandler.handle_keypress(data)

        assert response is not None
        assert len(response) > 0

    def test_swap_c64_modifiers(self):
        """Raw C64 SHFLAG {b0 SHIFT,b1 C=,b2 CTRL} -> canonical ModifierFlags
        {b0 SHIFT,b1 CTRL,b2 COMMODORE}: swap b1<->b2, keep SHIFT."""
        SHF_SHIFT, SHF_CBM, SHF_CTRL = 0x01, 0x02, 0x04
        cases = {
            0x00: 0x00,
            SHF_SHIFT: ModifierFlags.SHIFT,
            SHF_CBM: ModifierFlags.COMMODORE,
            SHF_CTRL: ModifierFlags.CTRL,
            SHF_CBM | SHF_CTRL: ModifierFlags.CTRL | ModifierFlags.COMMODORE,
            SHF_SHIFT | SHF_CBM: ModifierFlags.SHIFT | ModifierFlags.COMMODORE,
            SHF_SHIFT | SHF_CTRL: ModifierFlags.SHIFT | ModifierFlags.CTRL,
            0x07: 0x07,
        }
        for raw, expected in cases.items():
            assert swap_c64_modifiers(raw) == expected, f"raw={raw:#04x}"

    def test_handle_text_input_simple(self):
        """Test handling simple text input"""
        # "hello" in PETSCII + null terminator
        data = bytes([0x48, 0x45, 0x4C, 0x4C, 0x4F, 0x00])

        response = CommandHandler.handle_text_input(data)
        assert response is not None
        # Response should echo or acknowledge the text
        assert len(response) > 0

    def test_handle_text_input_empty(self):
        """Test handling empty text input"""
        data = bytes([0x00])

        response = CommandHandler.handle_text_input(data)

        assert response is not None


class TestResponseGeneration:
    """Test response packet generation"""

    def test_petscii_response_is_not_null_terminated_on_wire(self):
        """PETSCII_NULL_TERMINATED responses ensure a null terminator internally
        but create_response strips it before putting the response on the wire."""
        # 'HELP' in PETSCII, no trailing null yet
        petscii_text = bytes([0x48, 0x45, 0x4C, 0x50])

        response = CommandHandler.create_response(
            ResponseType.PETSCII_NULL_TERMINATED, petscii_text
        )

        # The null terminator that create_response ensures internally must be
        # stripped from the wire response.
        assert response == petscii_text
        assert response[-1:] != b"\x00"

    def test_petscii_response_strips_existing_null_terminator(self):
        """If the data already ends with a null, it is still stripped once."""
        # "ok" in PETSCII + null terminator: o=$4F, k=$4B
        petscii_text = bytes([0x4F, 0x4B, 0x00])

        response = CommandHandler.create_response(
            ResponseType.PETSCII_NULL_TERMINATED, petscii_text
        )

        assert response == bytes([0x4F, 0x4B])

    def test_handle_keypress_response_not_null_terminated(self):
        """The real handle_keypress path should also come back unterminated."""
        data = bytes([0x41, 0x00])  # PETSCII 'a', no modifiers

        response = CommandHandler.handle_keypress(data)

        assert response[-1:] != b"\x00"

    def test_create_mixed_response_unchanged(self):
        """Non-PETSCII response types must be returned byte-for-byte unchanged
        (this was a latent bug: the old code chopped the last byte off of
        every response type, including screen-code / mtext payloads)."""
        data = bytes([0x01, 0x02, 0x03])

        response = CommandHandler.create_response(
            ResponseType.MIX_COMMANDS_SCREEN_CODES, data
        )

        assert response == data

    def test_create_mtext_response_unchanged(self):
        """MTEXT_FORMAT responses must not be truncated either."""
        data = bytes([0x10, 0x20, 0x30, 0x40])

        response = CommandHandler.create_response(ResponseType.MTEXT_FORMAT, data)

        assert response == data


class TestPETSCIIConversion:
    """Test PETSCII conversion utilities"""

    def test_petscii_to_utf8_lowercase(self):
        """Test converting PETSCII lowercase to UTF-8"""
        from sdk.generate_pet_asc_table import Petscii

        # PETSCII 'a' = $41, ASCII 'a' = $61
        petscii_a = 0x41
        ascii_a = Petscii.petscii2ascii(petscii_a)

        assert ascii_a == 0x61
        assert chr(ascii_a) == "a"

    def test_petscii_to_utf8_uppercase(self):
        """Test converting PETSCII uppercase to UTF-8"""
        from sdk.generate_pet_asc_table import Petscii

        # PETSCII 'A' = $C1, ASCII 'A' = $41
        petscii_A = 0xC1
        ascii_A = Petscii.petscii2ascii(petscii_A)

        assert ascii_A == 0x41
        assert chr(ascii_A) == "A"

    def test_utf8_to_petscii_lowercase(self):
        """Test converting UTF-8 lowercase to PETSCII"""
        from sdk.generate_pet_asc_table import Petscii

        # ASCII 'a' = $61, PETSCII 'a' = $41
        ascii_a = ord("a")
        petscii_a = Petscii.ascii2petscii(ascii_a)

        assert petscii_a == 0x41

    def test_utf8_to_petscii_uppercase(self):
        """Test converting UTF-8 uppercase to PETSCII"""
        from sdk.generate_pet_asc_table import Petscii

        # ASCII 'A' = $41, PETSCII 'A' = $C1
        ascii_A = ord("A")
        petscii_A = Petscii.ascii2petscii(ascii_A)

        assert petscii_A == 0xC1

    def test_petscii_string_to_utf8(self):
        """Test converting a PETSCII string to UTF-8"""
        from sdk.generate_pet_asc_table import Petscii

        # "hello" in PETSCII
        petscii_hello = bytes([0x48, 0x45, 0x4C, 0x4C, 0x4F])

        # Convert to UTF-8
        utf8_bytes = bytes([Petscii.petscii2ascii(b) for b in petscii_hello])
        utf8_str = utf8_bytes.decode("ascii")

        assert utf8_str == "hello"

    def test_utf8_string_to_petscii(self):
        """Test converting a UTF-8 string to PETSCII"""
        from sdk.generate_pet_asc_table import Petscii

        # "HELLO" in UTF-8
        utf8_str = "HELLO"

        # Convert to PETSCII
        petscii_bytes = bytes([Petscii.ascii2petscii(ord(c)) for c in utf8_str])

        # PETSCII "HELLO": H=$C8, E=$C5, L=$CC, L=$CC, O=$CF
        expected = bytes([0xC8, 0xC5, 0xCC, 0xCC, 0xCF])
        assert petscii_bytes == expected


class TestServerIntegration:
    """Integration tests with actual TCP connections.

    These tests talk to a real C64Server bound to 127.0.0.1 on an ephemeral
    port (port=0). No hardware / real network access is involved. Every
    client socket gets a short settimeout() so a protocol mismatch (e.g. a
    server that never responds) raises socket.timeout instead of hanging the
    whole test run -- that is what made this class hang before: it sent
    packets using the OLD 2-byte magic (0xFE 0xFF), the server silently
    dropped them as invalid, and the blocking recv() with no timeout waited
    forever for a response that would never come.
    """

    SOCKET_TIMEOUT = 5

    def test_server_starts_and_stops(self, server):
        """Test that server can start and stop cleanly"""
        thread = threading.Thread(target=server.start, daemon=True)
        thread.start()
        time.sleep(0.1)

        assert server.running

        server.stop()
        thread.join(timeout=2)

        assert not server.running

    def test_client_can_connect(self, running_server):
        """Test that a client can connect to the server"""
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.settimeout(self.SOCKET_TIMEOUT)
        client.connect((running_server.host, running_server.port))

        assert client.fileno() != -1

        client.close()

    def test_send_keypress_command(self, running_server):
        """Test sending a keypress command and receiving response"""
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.settimeout(self.SOCKET_TIMEOUT)
        client.connect((running_server.host, running_server.port))

        # Send keypress command: magic byte + $01 + 'a' ($41) + no modifiers
        packet = bytes([0xFE, 0x01, 0x41, 0x00])
        client.send(packet)

        # Receive response (bounded by settimeout above)
        response = client.recv(1024)

        # Current protocol: responses are raw PETSCII payloads with no
        # magic/response-type prefix bytes.
        assert len(response) > 0
        assert response[0:1] != MAGIC_BYTES

        client.close()

    def test_send_text_input_command(self, running_server):
        """Test sending a text input command and receiving response"""
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.settimeout(self.SOCKET_TIMEOUT)
        client.connect((running_server.host, running_server.port))

        # Send text input: magic byte + $02 + "test" + null
        packet = bytes([0xFE, 0x02, 0x54, 0x45, 0x53, 0x54, 0x00])
        client.send(packet)

        # Receive response (bounded by settimeout above)
        response = client.recv(1024)

        assert len(response) > 0

    def test_text_input_response_ends_with_null_terminator(self, running_server):
        """Console-0 TEXT_INPUT replies carry an explicit $00 end-of-reply
        marker (unlike every other response type) so the wedge's SOCKET_READ
        loop can stop the instant it sees it instead of guessing completion
        via a quiet-gap retry window. See cloud_server.py's TEXT_INPUT branch
        and bank03.asm's hsh_prlp."""
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.settimeout(self.SOCKET_TIMEOUT)
        client.connect((running_server.host, running_server.port))

        packet = bytes([0xFE, 0x02, 0x54, 0x45, 0x53, 0x54, 0x00])
        client.send(packet)

        response = client.recv(1024)

        assert response.endswith(b"\x00")
        # exactly one trailing null -- the payload itself must not be
        # truncated or double-terminated
        assert response[-2:-1] != b"\x00" or len(response) == 1

    @pytest.mark.skip(
        reason=(
            "SERVER_CMD_SAVE_SCREEN/RESTORE_SCREEN (console 0 COMMAND path) "
            "DMA-reads/writes real C64 memory via network_helper.dma_read_memory "
            "/ send_screen_data, which requires a physical C64 Ultimate on the "
            "network. Not safe to run in an automated test environment."
        )
    )
    def test_send_local_command_requires_hardware(self, running_server):
        pass


class TestRestoreScreenDeactivatesConsole:
    """
    handle_local_command's RESTORE_SCREEN branch is the server's only
    "user returned to the local BASIC shell" signal (the wedge sends no
    server-console packet on C=+CTRL+1). It must deactivate the
    previously-active server console so its on_deactivate hook (e.g. File
    Editor auto-save) still runs and ConsoleManager._active is cleared.
    """

    @pytest.fixture(autouse=True)
    def _reset_console_manager(self, monkeypatch):
        from sdk.console_manager import ConsoleManager

        ConsoleManager.reset()
        # No hardware: RESTORE_SCREEN's DMA push must not hit the network.
        # It only pushes if there's a saved screen in session state; there
        # isn't in these tests, but stub send_screen_data defensively.
        import sdk.command_handler as ch

        monkeypatch.setattr(ch, "send_screen_data", lambda *a, **kw: None)
        yield
        ConsoleManager.reset()

    def _restore_packet(self):
        from sdk.command_handler import SERVER_CMD_RESTORE_SCREEN

        return bytes([SERVER_CMD_RESTORE_SCREEN])

    def test_restore_runs_on_deactivate_and_clears_active(self):
        from sdk.console_manager import ConsoleManager
        from sdk.server_console import ServerConsole

        sid = 3
        deactivated = []

        class _SpyConsole(ServerConsole):
            def on_deactivate(self):
                deactivated.append(self.console_id)

        mgr = ConsoleManager.instance()
        mgr.register_factory(2, _SpyConsole)
        # Make console 2 (File Editor slot) the active console for the session.
        mgr.get_console(2, sid)
        mgr._active[sid] = 2

        CommandHandler.handle_local_command(self._restore_packet(), sid)

        assert deactivated == [2]  # on_deactivate ran exactly once
        assert mgr._active.get(sid) is None  # active record cleared

    def test_second_restore_with_no_active_console_is_noop(self):
        from sdk.console_manager import ConsoleManager

        sid = 4
        mgr = ConsoleManager.instance()

        # No active console at all -- must not raise, must stay clear.
        CommandHandler.handle_local_command(self._restore_packet(), sid)
        CommandHandler.handle_local_command(self._restore_packet(), sid)

        assert mgr._active.get(sid) is None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
