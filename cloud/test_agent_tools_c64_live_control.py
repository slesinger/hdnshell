from unittest.mock import patch

from sdk.server_console import ascii_to_screencode
from agent_tools import (
    create_c64_type_and_observe_tool,
    create_c64_machine_control_tool,
    create_c64_list_drives_tool,
    create_c64_mount_disk_tool,
    create_c64_run_file_tool,
    create_c64_configs_tool,
    create_c64_create_disk_image_tool,
    create_c64_file_info_tool,
)


# ---------------------------------------------------------------------------
# type_and_observe
# ---------------------------------------------------------------------------


def test_type_and_observe_types_then_waits_for_settled_screen():
    b_sc = ascii_to_screencode(ord("B"))
    settled = bytes([b_sc] * (40 * 25))

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.send_c64_keyboard_input"
    ) as mock_send, patch(
        "sdk.network_helper.dma_read_memory", side_effect=[settled, settled]
    ):
        tool = create_c64_type_and_observe_tool()
        assert tool is not None
        result = tool.func(text="ll\n")

        assert mock_send.called
        assert "settled" in result.lower()
        assert "B" * 40 in result


def test_type_and_observe_no_c64_ip():
    with patch("agent_tools._read_last_c64_ip", return_value=""):
        tool = create_c64_type_and_observe_tool()
        assert tool is not None
        result = tool.func(text="ll\n")
        assert "No C64 IP" in result


# ---------------------------------------------------------------------------
# c64_machine_control: pause/resume
# ---------------------------------------------------------------------------


def test_machine_control_pause_and_resume():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_machine_pause"
    ) as mock_pause, patch("sdk.network_helper.rest_machine_resume") as mock_resume:
        tool = create_c64_machine_control_tool()
        assert tool is not None

        result = tool.func(action="pause")
        assert "paused" in result.lower()
        mock_pause.assert_called_once_with("192.168.1.1")

        result = tool.func(action="resume")
        assert "resumed" in result.lower()
        mock_resume.assert_called_once_with("192.168.1.1")


# ---------------------------------------------------------------------------
# c64_list_drives / c64_mount_disk
# ---------------------------------------------------------------------------


def test_list_drives_formats_status():
    fake_drives = {
        "drives": [
            {"a": {"enabled": True, "bus_id": 8, "type": "1581", "image_file": "game.d64", "image_path": "/usb0/game.d64"}},
            {"b": {"enabled": False, "bus_id": 9, "type": "1541", "image_file": "", "image_path": ""}},
        ],
        "errors": [],
    }
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_list_drives", return_value=fake_drives
    ):
        tool = create_c64_list_drives_tool()
        assert tool is not None
        result = tool.func("")

        assert "drive a" in result
        assert "game.d64" in result
        assert "/usb0/game.d64" in result
        assert "drive b" in result


def test_mount_disk_success_and_error():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_mount_drive", return_value=[]
    ):
        tool = create_c64_mount_disk_tool()
        assert tool is not None
        result = tool.func(drive="a", image="/usb0/game.d64")
        assert "mounted" in result.lower()

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_mount_drive", return_value=["file not found"]
    ):
        tool = create_c64_mount_disk_tool()
        result = tool.func(drive="a", image="/usb0/missing.d64")
        assert "error" in result.lower()
        assert "file not found" in result


# ---------------------------------------------------------------------------
# c64_run_file
# ---------------------------------------------------------------------------


def test_run_file_success_and_error():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_run_file", return_value=[]
    ) as mock_run:
        tool = create_c64_run_file_tool()
        assert tool is not None
        result = tool.func(file="/usb0/game.prg", kind="run_prg")
        assert "ran" in result.lower()
        mock_run.assert_called_once_with("192.168.1.1", "run_prg", "/usb0/game.prg", None)

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_run_file", return_value=["bad file"]
    ):
        tool = create_c64_run_file_tool()
        result = tool.func(file="/usb0/broken.prg", kind="run_prg")
        assert "error" in result.lower()


# ---------------------------------------------------------------------------
# c64_configs
# ---------------------------------------------------------------------------


def test_configs_get_returns_json():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_get_configs", return_value={"categories": ["Drive A Settings"]}
    ):
        tool = create_c64_configs_tool()
        assert tool is not None
        result = tool.func(operation="get")
        assert "Drive A Settings" in result


def _config_value_response(value) -> dict:
    return {"Drive A Settings": {"Drive Bus ID": {"current": value}}, "errors": []}


def test_configs_set_requires_confirm():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_set_config"
    ) as mock_set:
        tool = create_c64_configs_tool()
        assert tool is not None

        result = tool.func(
            operation="set", category="Drive A Settings", item="Drive Bus ID", value="9"
        )
        assert "refused" in result.lower()
        mock_set.assert_not_called()


def test_configs_set_confirms_when_readback_matches_requested_value():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_set_config", return_value={"errors": []}
    ) as mock_set, patch(
        "sdk.network_helper.rest_get_configs",
        side_effect=[_config_value_response(8), _config_value_response(9)],
    ):
        tool = create_c64_configs_tool()
        assert tool is not None
        result = tool.func(
            operation="set",
            category="Drive A Settings",
            item="Drive Bus ID",
            value="9",
            confirm=True,
        )

        mock_set.assert_called_once_with("192.168.1.1", "Drive A Settings", "Drive Bus ID", "9")
        assert "confirmed" in result.lower()
        assert "now 9" in result
        assert "was 8" in result


def test_configs_set_reports_not_changed_when_readback_still_shows_old_value():
    # The API can report no errors even when the hardware silently ignored
    # the write -- the tool must catch this via the post-set readback and
    # refuse to claim success.
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_set_config", return_value={"errors": []}
    ), patch(
        "sdk.network_helper.rest_get_configs",
        side_effect=[_config_value_response(8), _config_value_response(8)],
    ):
        tool = create_c64_configs_tool()
        assert tool is not None
        result = tool.func(
            operation="set",
            category="Drive A Settings",
            item="Drive Bus ID",
            value="9",
            confirm=True,
        )

        assert "not changed" in result.lower()
        assert "do not tell the user this succeeded" in result.lower()


def test_configs_set_reports_uncertain_when_readback_mismatches_request():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_set_config", return_value={"errors": []}
    ), patch(
        "sdk.network_helper.rest_get_configs",
        side_effect=[_config_value_response(8), _config_value_response(10)],
    ):
        tool = create_c64_configs_tool()
        assert tool is not None
        result = tool.func(
            operation="set",
            category="Drive A Settings",
            item="Drive Bus ID",
            value="9",
            confirm=True,
        )

        assert "uncertain" in result.lower()
        assert "now 10" in result


# ---------------------------------------------------------------------------
# c64_create_disk_image / c64_file_info
# ---------------------------------------------------------------------------


def test_create_disk_image_success_and_dnp_requires_tracks():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_create_disk", return_value=[]
    ):
        tool = create_c64_create_disk_image_tool()
        assert tool is not None
        result = tool.func(path="/usb0/new.d64", image_type="d64")
        assert "created" in result.lower()

        result = tool.func(path="/usb0/new.dnp", image_type="dnp")
        assert "error" in result.lower()
        assert "tracks" in result.lower()


def test_file_info_returns_json():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_file_info", return_value={"size": 123, "extension": "PRG"}
    ):
        tool = create_c64_file_info_tool()
        assert tool is not None
        result = tool.func(path="/usb0/game.prg")
        assert "123" in result
        assert "PRG" in result
