import pytest

from console_manager import ConsoleManager
from server_console import ascii_to_screencode
from agent_tools import create_screen_memory_tool


def test_get_screen_tool_returns_25x40_ascii():
    # Reset ConsoleManager singleton and create a console for the session
    ConsoleManager.reset()
    mgr = ConsoleManager.instance()

    session_id = 99
    console = mgr.get_console(1, session_id)

    # Fill the console screen with the screen-code for 'A'
    a_sc = ascii_to_screencode(ord('A'))
    console.screen[:] = bytearray([a_sc] * (40 * 25))

    # Mark console 1 as active for this session
    mgr._active[session_id] = 1

    tool = create_screen_memory_tool(session_id=session_id)
    assert tool is not None, "create_screen_memory_tool returned None"

    # Call the tool function (Tool.func signature expects one argument)
    content = tool.func("")
    assert isinstance(content, str)

    lines = content.splitlines()
    assert len(lines) == 25
    for line in lines:
        assert len(line) == 40
        for ch in line:
            o = ord(ch)
            assert 32 <= o <= 126, f"Non-ASCII char {ch} in output"
