import pytest
from unittest.mock import patch

from server_console import ascii_to_screencode
from agent_tools import create_screen_memory_tool


def test_get_screen_tool_returns_25x40_ascii():
    # Build a 1000-byte screen buffer filled with the screen code for 'A'
    a_sc = ascii_to_screencode(ord('A'))
    fake_screen = bytes([a_sc] * (40 * 25))

    with patch('agent_tools._read_last_c64_ip', return_value='192.168.1.1'), \
         patch('network_helper.dma_read_memory', return_value=fake_screen):

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


def test_get_screen_tool_no_c64_ip():
    with patch('agent_tools._read_last_c64_ip', return_value=''):
        tool = create_screen_memory_tool()
        assert tool is not None
        result = tool.func("")
        assert "No C64 IP" in result


def test_get_screen_tool_dma_error():
    with patch('agent_tools._read_last_c64_ip', return_value='192.168.1.1'), \
         patch('network_helper.dma_read_memory', side_effect=OSError("connection refused")):
        tool = create_screen_memory_tool()
        assert tool is not None
        result = tool.func("")
        assert "Error" in result
