from unittest.mock import patch

from agent_tools import create_c64_detect_video_mode_tool


def _vic_regs(d011=0x1B, d012=0x00, d013=0x00, d014=0x00, d015=0xFF, d016=0x08, d017=0x00, d018=0x15):
    return bytes([d011, d012, d013, d014, d015, d016, d017, d018])


def test_detect_video_mode_default_boot_state_is_text_mode():
    # $D011=$1B (BMM=0,ECM=0), $D016=$08 (MCM=0), $D018=$15 (screen $0400, chars $1000)
    # $DD00 low 2 bits = 3 -> bank select -> VIC bank base $0000 (default).
    reads = [_vic_regs(), bytes([0x07])]

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=reads
    ):
        tool = create_c64_detect_video_mode_tool()
        assert tool is not None
        result = tool.func("")

        assert "standard text mode" in result
        assert "is_text_mode: True" in result
        assert "is_bitmap_mode: False" in result
        assert "VIC bank base: $0000" in result
        assert "Screen (text/attribute) memory base: $0400" in result
        assert "Character memory base: $1000" in result
        # Default layout is exactly what get_screen assumes -> no relocation note.
        assert "relocated" not in result


def test_detect_video_mode_standard_bitmap_mode():
    # $D011 with BMM set ($3B), $D018=$18 -> screen/color base $0400, bitmap base $2000.
    reads = [_vic_regs(d011=0x3B, d018=0x18), bytes([0x07])]

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=reads
    ):
        tool = create_c64_detect_video_mode_tool()
        assert tool is not None
        result = tool.func("")

        assert "standard bitmap mode" in result
        assert "is_text_mode: False" in result
        assert "is_bitmap_mode: True" in result
        assert "Bitmap memory base: $2000" in result
        assert "c64_screenshot" in result


def test_detect_video_mode_relocated_screen_still_text_mode():
    # $D018=$95 -> bits4-7=1001 -> screen offset 9*0x400=$2400 (relocated),
    # bits1-3=010 -> char base $1000. BMM/ECM/MCM all 0 -> still text mode.
    reads = [_vic_regs(d018=0x95), bytes([0x07])]

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.dma_read_memory", side_effect=reads
    ):
        tool = create_c64_detect_video_mode_tool()
        assert tool is not None
        result = tool.func("")

        assert "standard text mode" in result
        assert "Screen (text/attribute) memory base: $2400" in result
        assert "relocated to $2400" in result


def test_detect_video_mode_no_c64_ip():
    with patch("agent_tools._read_last_c64_ip", return_value=""):
        tool = create_c64_detect_video_mode_tool()
        assert tool is not None
        result = tool.func("")
        assert "No C64 IP" in result
