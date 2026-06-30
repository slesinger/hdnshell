from unittest.mock import patch

from sdk.server_console import ascii_to_screencode
from sdk.shared_state import update_session_state
import sdk.network_helper as network_helper
from agent_tools import create_screen_memory_tool


def test_get_screen_tool_returns_25x40_ascii():
    # Build a 1000-byte screen buffer filled with the screen code for 'A'
    a_sc = ascii_to_screencode(ord("A"))
    fake_screen = bytes([a_sc] * (40 * 25))

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", return_value=fake_screen
    ):

        tool = create_screen_memory_tool()
        assert tool is not None, "create_screen_memory_tool returned None"

        content = tool.func("")
        assert isinstance(content, str)

        lines = content.splitlines()
        assert len(lines) == 25
        for line in lines:
            assert len(line) == 40
            for ch in line:
                o = ord(ch)
                assert 32 <= o <= 126, f"Non-ASCII char {ch} in output"


def test_backtick_maps_to_apostrophe_screen_code():
    assert ascii_to_screencode(ord("`")) == 0x27


def test_lowercase_maps_to_lowercase_screen_codes():
    assert ascii_to_screencode(ord("a")) == 0x81
    assert ascii_to_screencode(ord("z")) == 0x9A


def test_get_screen_tool_no_c64_ip():
    with patch("agent_tools._read_last_c64_ip", return_value=""):
        tool = create_screen_memory_tool()
        assert tool is not None
        result = tool.func("")
        assert "No C64 IP" in result


def test_get_screen_tool_dma_error():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=OSError("connection refused")
    ):
        tool = create_screen_memory_tool()
        assert tool is not None
        result = tool.func("")
        assert "Error" in result


def test_send_screen_data_prefers_session_client_ip():
    session_id = 4242
    update_session_state(session_id, client_ip="192.168.77.33")
    sent_hosts = []

    def _fake_send(host, cmd, payload=b""):
        sent_hosts.append(host)

    with patch("sdk.network_helper._send_tcp_cmd", side_effect=_fake_send):
        network_helper.send_screen_data(
            bytes([0x20] * (40 * 25)),
            bytes([0x01] * (40 * 25)),
            session_id=session_id,
        )

    assert sent_hosts == ["192.168.77.33", "192.168.77.33"]
