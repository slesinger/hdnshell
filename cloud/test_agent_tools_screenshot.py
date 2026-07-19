import os
from unittest.mock import patch

import agent_tools
from agent_tools import create_c64_screenshot_tool


_FAKE_PNG = b"\x89PNG\r\n\x1a\n" + b"fake-rest-of-file"


def test_screenshot_tool_saves_png_and_reports_path(tmp_path, monkeypatch):
    monkeypatch.setattr(agent_tools, "WORKSPACE_DIR", str(tmp_path))

    import cloud

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch.object(
        cloud, "capture_video_frame", return_value=_FAKE_PNG
    ):
        tool = create_c64_screenshot_tool()
        assert tool is not None
        result = tool.func(timeout_seconds=6.0)

    assert "Screenshot captured" in result
    assert "40-column" in result

    screenshots_dir = os.path.join(str(tmp_path), "assistant", "screenshots")
    saved = os.listdir(screenshots_dir)
    assert len(saved) == 1
    assert saved[0].startswith("c64_screenshot_") and saved[0].endswith(".png")
    with open(os.path.join(screenshots_dir, saved[0]), "rb") as f:
        assert f.read() == _FAKE_PNG


def test_screenshot_tool_no_c64_ip():
    with patch("agent_tools._read_last_c64_ip", return_value=""):
        tool = create_c64_screenshot_tool()
        assert tool is not None
        result = tool.func(timeout_seconds=6.0)
        assert "No C64 IP" in result


def test_screenshot_tool_reports_capture_error(monkeypatch, tmp_path):
    monkeypatch.setattr(agent_tools, "WORKSPACE_DIR", str(tmp_path))

    import cloud

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch.object(
        cloud, "capture_video_frame", side_effect=RuntimeError("timed out")
    ):
        tool = create_c64_screenshot_tool()
        assert tool is not None
        result = tool.func(timeout_seconds=6.0)

    assert "Error" in result
    assert "timed out" in result
