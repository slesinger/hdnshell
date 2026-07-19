from unittest.mock import patch

from sdk.server_console import ascii_to_screencode
from agent_tools import create_screen_memory_tool, create_c64_wait_for_screen_tool


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


def test_backtick_in_server_response_renders_as_apostrophe():
    """Regression test: server responses go out as PETSCII bytes
    (BaseHandler.utf8_to_petscii), which the real C64 KERNAL then converts
    to a screen code on its own. Backtick has no real PETSCII glyph, so it
    must be sent as PETSCII apostrophe ($27) -- not left as raw PETSCII
    $60, which the KERNAL renders as $00 instead of an apostrophe."""
    from sdk.base_handler import BaseHandler
    from sdk.petscii import petscii_to_screencode

    petscii_bytes = BaseHandler.utf8_to_petscii("`")
    assert petscii_bytes == b"'"
    assert petscii_to_screencode(petscii_bytes[0]) == 0x27


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


def test_get_screen_tool_include_color_appends_color_grid():
    a_sc = ascii_to_screencode(ord("A"))
    fake_screen = bytes([a_sc] * (40 * 25))
    # Color RAM: color code 2 (red) for every cell.
    fake_color = bytes([0x02] * (40 * 25))

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=[fake_screen, fake_color]
    ):
        tool = create_screen_memory_tool()
        assert tool is not None
        result = tool.func(include_color=True)

        assert "red" in result.lower()
        assert "2" * 40 in result


def test_get_screen_tool_without_include_color_skips_second_read():
    a_sc = ascii_to_screencode(ord("A"))
    fake_screen = bytes([a_sc] * (40 * 25))

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=[fake_screen]
    ) as mocked_read:
        tool = create_screen_memory_tool()
        assert tool is not None
        result = tool.func(include_color=False)

        assert mocked_read.call_count == 1
        assert "Color RAM" not in result


def test_wait_for_c64_screen_returns_once_settled():
    a_sc = ascii_to_screencode(ord("A"))
    b_sc = ascii_to_screencode(ord("B"))
    changing = bytes([a_sc] * (40 * 25))
    settled = bytes([b_sc] * (40 * 25))
    # First read differs from the (implicit) prior state, second and third
    # reads are identical -> should settle after the third read and not
    # need to wait out the full timeout.
    reads = [changing, settled, settled]

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=reads
    ):
        tool = create_c64_wait_for_screen_tool()
        assert tool is not None
        result = tool.func(max_wait_seconds=2.0)
        assert "settled" in result.lower()
        assert "B" * 40 in result


def test_wait_for_c64_screen_times_out_if_still_changing():
    import itertools

    a_sc = ascii_to_screencode(ord("A"))
    b_sc = ascii_to_screencode(ord("B"))
    alternating = itertools.cycle(
        [bytes([a_sc] * (40 * 25)), bytes([b_sc] * (40 * 25))]
    )

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=lambda *a, **k: next(alternating)
    ):
        tool = create_c64_wait_for_screen_tool()
        assert tool is not None
        result = tool.func(max_wait_seconds=0.5, poll_interval=0.15)
        assert "timed out" in result.lower()


def test_wait_for_c64_screen_no_c64_ip():
    with patch("agent_tools._read_last_c64_ip", return_value=""):
        tool = create_c64_wait_for_screen_tool()
        assert tool is not None
        result = tool.func(max_wait_seconds=1.0)
        assert "No C64 IP" in result
