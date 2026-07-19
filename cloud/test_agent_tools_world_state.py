from unittest.mock import patch

import pytest

import agent_tools
from agent_tools import (
    get_c64_world_state_summary,
    create_c64_type_and_observe_tool,
    create_c64_machine_control_tool,
    create_c64_run_file_tool,
    create_c64_mount_disk_tool,
)
from sdk.server_console import ascii_to_screencode


@pytest.fixture(autouse=True)
def _clear_state():
    agent_tools._clear_world_state()
    yield
    agent_tools._clear_world_state()


def test_summary_empty_when_no_state():
    assert get_c64_world_state_summary() == ""


def test_type_and_observe_updates_world_state():
    b_sc = ascii_to_screencode(ord("B"))
    settled = bytes([b_sc] * (40 * 25))

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.send_c64_keyboard_input"
    ), patch("sdk.network_helper.dma_read_memory", side_effect=[settled, settled]):
        tool = create_c64_type_and_observe_tool()
        tool.func(text="ll\n")

    summary = get_c64_world_state_summary()
    assert "ll\\n" in summary or "ll\n" in summary
    assert "settled" in summary


def test_run_file_updates_world_state():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_run_file", return_value=[]
    ):
        tool = create_c64_run_file_tool()
        tool.func(file="/usb0/game.prg", kind="run_prg")

    summary = get_c64_world_state_summary()
    assert "/usb0/game.prg" in summary


def test_mount_disk_updates_world_state():
    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_mount_drive", return_value=[]
    ):
        tool = create_c64_mount_disk_tool()
        tool.func(drive="a", image="/usb0/game.d64")

    summary = get_c64_world_state_summary()
    assert "/usb0/game.d64" in summary
    assert "drive a" in summary


def test_reset_clears_previously_cached_state():
    agent_tools._update_world_state(last_action="typed 'll\\n'", last_typed="ll\n")
    assert get_c64_world_state_summary() != ""

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.send_reset"
    ):
        tool = create_c64_machine_control_tool()
        tool.func(action="reset")

    summary = get_c64_world_state_summary()
    # Old "typed" state is gone; only the reset action itself is recorded.
    assert "ll" not in summary
    assert "machine_control: reset" in summary


def test_pause_does_not_clear_state():
    agent_tools._update_world_state(last_action="typed 'll\\n'", last_typed="ll\n")

    with patch("agent_tools._read_last_c64_ip", return_value="192.168.1.1"), patch(
        "sdk.network_helper.rest_machine_pause"
    ):
        tool = create_c64_machine_control_tool()
        tool.func(action="pause")

    summary = get_c64_world_state_summary()
    assert "ll" in summary
    assert "machine_control: pause" in summary
