"""
Unit tests for request handlers
"""

import pytest
import os
import sys
import threading

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_HANDLERS_DIR = os.path.join(_CLOUD_DIR, "handlers")
if _HANDLERS_DIR not in sys.path:
    sys.path.insert(0, _HANDLERS_DIR)

import agent_tools

from sdk.config_manager import apply_env_overrides
from sdk.base_handler import BaseHandler
from help_handler import HelpHandler, load_doc_topics, format_topics_list
from python_eval_handler import PythonEvalHandler
from csdb_handler import CSDBHandler
from chat_handler import ChatHandler
from code_chat_handler import _sprite_image_consistency_warnings
from agent_tools import search_manual
from sdk.shared_state import (
    get_session_state_copy,
    update_session_state,
    reset_all_session_states,
)

# from generate_pet_asc_table import Petscii

# Apply environment overrides from config file
apply_env_overrides()


@pytest.fixture(autouse=True)
def _isolate_session_state():
    """Session state is module-global; reset it so tests don't leak into each other."""
    reset_all_session_states()
    yield
    reset_all_session_states()


class TestBaseHandler:
    """Test BaseHandler utility methods"""

    def test_petscii_to_utf8(self):
        """Test PETSCII to UTF-8 conversion"""
        # "hello" in PETSCII
        petscii_bytes = bytes([0x48, 0x45, 0x4C, 0x4C, 0x4F])
        utf8_str = BaseHandler.petscii_to_utf8(petscii_bytes)
        assert utf8_str == "hello"

    def test_utf8_to_petscii(self):
        """Test UTF-8 to PETSCII conversion"""
        utf8_str = "HELLO"
        petscii_bytes = BaseHandler.utf8_to_petscii(utf8_str)
        # PETSCII "HELLO": H=$C8, E=$C5, L=$CC, L=$CC, O=$CF
        expected = bytes([0xC8, 0xC5, 0xCC, 0xCC, 0xCF])
        assert petscii_bytes == expected


class TestHelpHandler:
    """Test HelpHandler"""

    def test_can_handle_help(self):
        """Test help command detection"""
        handler = HelpHandler()
        assert handler.can_handle("help")
        assert handler.can_handle("HELP")
        assert handler.can_handle("help commands")
        assert not handler.can_handle("I: help me")
        assert not handler.can_handle(": help")

    def test_general_help(self):
        """Test general help response"""
        handler = HelpHandler()
        response = handler.handle("help")
        assert "i:" in response
        assert "m:" in response
        assert "help" in response
        assert "Python" in response
        assert "c:" in response

    def test_help_topic(self):
        """Test specific help topic"""
        handler = HelpHandler()
        response = handler.handle("help chat")
        assert "Chat Command" in response or "I:" in response

    def test_help_unknown_topic(self):
        """Test unknown help topic"""
        handler = HelpHandler()
        response = handler.handle("help nonexistent")
        assert "topic" in response.lower() or "available" in response.lower()

    def test_help_topics_lists_topics(self):
        """Test that 'help topics' prints a list of available topics"""
        handler = HelpHandler()
        response = handler.handle("help topics")
        assert "help" in response.lower() or "topic" in response.lower()
        # Should mention at least one known manual topic/slug
        assert "user_manual" in response or "chat" in response

    def test_help_topic_singular_is_lenient(self):
        """Test that 'help topic' (singular) is treated like 'help topics'"""
        handler = HelpHandler()
        response = handler.handle("help topic")
        assert response == handler.handle("help topics")

    def test_help_topics_lines_fit_40_columns(self):
        """Test that the topics listing is formatted for a C64 40-col screen"""
        handler = HelpHandler()
        response = handler.handle("help topics")
        for line in response.split("\n"):
            assert len(line) <= 40, f"Line too long for 40-col screen: {line!r}"

    def test_load_doc_topics_from_manifest(self):
        """Test loading topics from the docs-manifest.json manifest"""
        topics = load_doc_topics()
        # The repo ships a manifest with several manual pages; if found,
        # it should be a non-empty list of (slug, title) tuples.
        assert isinstance(topics, list)
        if topics:
            slug, title = topics[0]
            assert isinstance(slug, str) and slug
            assert isinstance(title, str)

    def test_format_topics_list_fallback_without_manifest(self, monkeypatch):
        """Test the fallback listing when no manifest can be found"""
        monkeypatch.setattr("help_handler.load_doc_topics", lambda: [])
        response = format_topics_list()
        assert "chat" in response
        assert "python" in response
        assert "csdb" in response


class TestPythonEvalHandler:
    """Test PythonEvalHandler"""

    def test_can_handle_eval(self):
        """Test eval command detection"""
        handler = PythonEvalHandler()
        assert handler.can_handle(": 2 + 2")
        assert handler.can_handle(":2+2")
        assert not handler.can_handle("help :")
        assert not handler.can_handle("I: what is ?")

    def test_simple_math(self):
        """Test simple mathematical expression"""
        handler = PythonEvalHandler()
        response = handler.handle(": 2 + 2")
        assert "4" in response

    def test_hex_conversion(self):
        """Test hex conversion"""
        handler = PythonEvalHandler()
        response = handler.handle(": hex(255)")
        assert "0xff" in response.lower()

    def test_binary_conversion(self):
        """Test binary conversion"""
        handler = PythonEvalHandler()
        response = handler.handle(": bin(15)")
        assert "0b1111" in response.lower()

    def test_c64_address(self):
        """Test C64 address conversion (shows hex)"""
        handler = PythonEvalHandler()
        response = handler.handle(": 49152")
        assert "49152" in response
        # Should also show hex for C64 addresses
        assert "C000" in response.upper()

    def test_math_functions(self):
        """Test math functions"""
        handler = PythonEvalHandler()
        response = handler.handle(": sqrt(16)")
        assert "4" in response

    def test_syntax_error(self):
        """Test syntax error handling"""
        handler = PythonEvalHandler()
        response = handler.handle(": 2 +")
        assert "error" in response.lower()

    def test_unsafe_function_blocked(self):
        """Test that unsafe functions are blocked"""
        handler = PythonEvalHandler()
        response = handler.handle(": open('file.txt')")
        assert "error" in response.lower() or "unknown" in response.lower()

    def test_empty_expression(self):
        """Test empty expression"""
        handler = PythonEvalHandler()
        response = handler.handle(":")
        assert "provide" in response.lower()

    def test_import_allowed_module(self):
        """Test that whitelisted modules can be imported"""
        handler = PythonEvalHandler()
        response = handler.handle(": import random; print(1)")
        assert response == "1"

    def test_import_used_after_import(self):
        """Test that an imported module is usable in the same snippet"""
        handler = PythonEvalHandler()
        response = handler.handle(": import statistics; print(statistics.mean([2, 4]))")
        assert response == "3"

    def test_import_blocked_module(self):
        """Test that unsafe modules are blocked"""
        handler = PythonEvalHandler()
        response = handler.handle(": import os")
        assert "error" in response.lower()
        assert "not allowed" in response.lower()


class TestCSDBHandler:
    """Test CSDBHandler"""

    def test_can_handle_csdb(self):
        """Test CSDB command detection"""
        handler = CSDBHandler()
        assert handler.can_handle("c: test")
        assert handler.can_handle("C: test")
        assert handler.can_handle("c:test")
        assert not handler.can_handle("help c:")
        assert not handler.can_handle(": c:")

    def test_empty_query(self):
        """Test empty CSDB query"""
        handler = CSDBHandler()
        response = handler.handle("c:")
        assert "csdb mode" in response.lower() or "query" in response.lower()

    def test_help_response(self):
        """Test CSDB help for general query"""
        handler = CSDBHandler()
        response = handler.handle("c: find hondani")
        # Should return search results (or a no-results/error message), never crash
        assert len(response) > 0
        assert "matches" in response.lower() or "no results" in response.lower()

    def test_release_query(self):
        """Test querying a specific release"""
        handler = CSDBHandler()
        response = handler.handle("c: release 1234")
        # Should return release info or help/error message
        assert len(response) > 0
        # The response should contain either release info or help text
        assert "release" in response.lower() or "csdb" in response.lower()


class TestChatHandler:
    """Test ChatHandler"""

    REMOVED_SHELL_TOOL_NAMES = {
        "find_oscar_symbol",
        "get_oscar64_overview_stdlib_docs",
        "get_oscar64_vic_sid_cia_reu_docs",
        "get_oscar64_charwin_sprites_input_io_docs",
        "get_oscar64_graphics_audio_vector_ultimate_docs",
        "write_source",
        "compile_code",
    }

    def test_can_handle_chat(self):
        """Test chat command detection"""
        handler = ChatHandler()
        assert handler.can_handle("I: hello")
        assert handler.can_handle("i: hello")
        assert handler.can_handle("I:hello")
        assert not handler.can_handle("help I:")
        assert not handler.can_handle(": I:")

    def test_empty_query(self):
        """Test empty chat query"""
        handler = ChatHandler()
        response = handler.handle("I:")
        assert "chat mode" in response.lower()
        response = handler.handle("i:")
        assert "chat mode" in response.lower()

    def test_skills_enabled_by_default(self):
        """Chat assistant should start with all available skills enabled."""
        handler = ChatHandler()
        assert handler.active_skills == handler.available_skills()

    def test_skills_slash_commands(self):
        """Slash commands should manage chat assistant skills."""
        handler = ChatHandler()

        listed = handler.handle("I: /skills")
        assert "skills:" in listed.lower()
        assert "active:" in listed.lower()

        cleared = handler.handle("I: /skill clear")
        assert "cleared" in cleared.lower()

        if handler.available_skills():
            first = handler.available_skills()[0]
            toggled = handler.handle(f"I: /skill {first}")
            assert "active:" in toggled.lower()

    def test_shell_assistant_excludes_coding_agent_tools(self):
        """I: assistant should not expose coding-only Oscar/source tools."""
        handler = ChatHandler()

        tool_names = {getattr(tool, "name", "") for tool in handler.tools}

        assert self.REMOVED_SHELL_TOOL_NAMES.isdisjoint(tool_names)

    def test_code_chat_agent_keeps_coding_agent_tools(self):
        """Server coding agent should retain its Oscar/source tools."""
        from code_chat_handler import CodeChatAgent

        handler = CodeChatAgent()
        tool_names = {getattr(tool, "name", "") for tool in handler.tools}

        assert self.REMOVED_SHELL_TOOL_NAMES.issubset(tool_names)

    def test_code_chat_new_project_slash_command(self, monkeypatch, tmp_path):
        """Coding agent should scaffold a workspace Oscar project via slash command."""
        from code_chat_handler import CodeChatAgent

        monkeypatch.setattr(agent_tools, "WORKSPACE_DIR", str(tmp_path))

        handler = CodeChatAgent()
        response = handler.handle("/new-project sprite-lab")

        assert "created project:" in response.lower()
        assert handler.working_dir == os.path.join(str(tmp_path), "oscar", "sprite-lab")
        assert os.path.isfile(os.path.join(handler.working_dir, "sprite-lab.c"))
        assert os.path.isfile(os.path.join(handler.working_dir, "sprite-lab.md"))

    def test_fallback_response_when_no_llm(self):
        """Test fallback when LLM not configured"""
        handler = ChatHandler()
        # If no LLM configured, should get fallback
        if not handler.llm:
            response = handler.handle("I: hello")
            assert (
                "unavailable" in response.lower() or "configuration" in response.lower()
            )

    def test_manual_dir_resolves_repo_docs(self):
        """Manual directory should resolve to repository docs in source runs."""
        handler = ChatHandler()
        manual_dir = handler.find_manual_dir()
        assert os.path.isdir(manual_dir)

        files = handler.load_manual_files(manual_dir)
        assert files
        assert any(name.endswith(".md") for name in files)

    def test_shell_docs_query_uses_manual_tool_only(self):
        """Shell help queries should constrain tools to hondani_shell_manual."""
        handler = ChatHandler()
        tools = handler._select_tools_for_query("how do i mount d64?", session_id=0)

        assert tools
        assert all(getattr(tool, "name", "") == "hondani_shell_manual" for tool in tools)

    def test_shell_docs_query_without_manual_returns_guidance(self):
        """If manual tool is missing, return direct guidance instead of looping tools."""
        handler = ChatHandler()
        handler.tools = [tool for tool in handler.tools if getattr(tool, "name", "") != "hondani_shell_manual"]
        handler.manual_content = {}
        handler.llm = object()

        response = handler._query_llm("how do i mount d64?", history=[], session_id=0)
        assert "manual" in response.lower()
        assert "mnt" in response.lower() or "mount" in response.lower()

    def test_llm_response(self):
        """Test actual LLM response with Azure OpenAI"""
        handler = ChatHandler()
        if handler.llm:
            response = handler.handle("I: what is 2+2?")
            assert len(response) > 0
            # The response should contain the answer
            assert "4" in response
        else:
            # If LLM not available, skip this test
            pytest.skip("Azure OpenAI not configured")

    def test_same_session_turns_are_serialized(self):
        """Concurrent chat turns for one session should not interleave history."""
        handler = ChatHandler()
        session_id = 92001
        update_session_state(session_id, active_module="i", chat_history=[])

        started = threading.Event()
        allow_finish = threading.Event()
        entered = []

        def fake_query(query, history=None, session_id=0):
            entered.append(query)
            if query == "first":
                started.set()
                allow_finish.wait(timeout=2.0)
            return f"reply:{query}"

        handler.llm = object()
        handler._query_llm = fake_query

        results = []

        def run_query(text):
            results.append(handler.handle(text, session_id=session_id))

        first = threading.Thread(target=run_query, args=("I: first",))
        second = threading.Thread(target=run_query, args=("second",))

        first.start()
        assert started.wait(timeout=1.0)
        second.start()
        assert second.is_alive()
        assert entered == ["first"]

        allow_finish.set()
        first.join(timeout=2.0)
        second.join(timeout=2.0)

        assert results == ["reply:first", "reply:second"]
        assert entered == ["first", "second"]
        assert get_session_state_copy(session_id)["chat_history"] == [
            {"role": "user", "content": "first"},
            {"role": "assistant", "content": "reply:first"},
            {"role": "user", "content": "second"},
            {"role": "assistant", "content": "reply:second"},
        ]


class TestRequestDispatcher:
    """Test RequestDispatcher"""

    def test_dispatch_help(self):
        """Test dispatching help request"""
        from request_dispatcher import RequestDispatcher

        dispatcher = RequestDispatcher()

        # "help" in PETSCII
        petscii_text = bytes([0x48, 0x45, 0x4C, 0x50, 0x00])  # help + null

        response = dispatcher.dispatch(petscii_text)

        # Should get help response
        assert len(response) > 0

        # Convert to UTF-8 to check content
        response_utf8 = BaseHandler.petscii_to_utf8(response[:-1])
        assert "command" in response_utf8.lower() or "help" in response_utf8.lower()

    def test_dispatch_python_eval(self):
        """Test dispatching Python eval request"""
        from request_dispatcher import RequestDispatcher

        dispatcher = RequestDispatcher()

        # ": 2 + 2" in PETSCII
        text = ": 2 + 2"
        petscii_text = BaseHandler.utf8_to_petscii(text) + bytes([0x00])

        response = dispatcher.dispatch(petscii_text)

        # Should get result
        assert len(response) > 0
        response_utf8 = BaseHandler.petscii_to_utf8(response[:-1])
        assert "4" in response_utf8

    def test_dispatch_chat(self):
        """Test dispatching chat request"""
        from request_dispatcher import RequestDispatcher

        dispatcher = RequestDispatcher()

        # "I: hello" in PETSCII
        text = "I: hello"
        petscii_text = BaseHandler.utf8_to_petscii(text) + bytes([0x00])

        response = dispatcher.dispatch(petscii_text)

        # Should get some response
        assert len(response) > 0

    def test_dispatch_csdb(self):
        """Test dispatching CSDB request"""
        from request_dispatcher import RequestDispatcher

        dispatcher = RequestDispatcher()

        # "c: test" in PETSCII
        text = "c: test"
        petscii_text = BaseHandler.utf8_to_petscii(text) + bytes([0x00])

        response = dispatcher.dispatch(petscii_text)

        # Should get response (probably help)
        assert len(response) > 0

    def test_dispatch_unknown(self):
        """Test dispatching unknown command"""
        from request_dispatcher import RequestDispatcher

        dispatcher = RequestDispatcher()

        # "unknown command" in PETSCII
        text = "unknown command"
        petscii_text = BaseHandler.utf8_to_petscii(text) + bytes([0x00])

        response = dispatcher.dispatch(petscii_text)

        # Should get error message
        assert len(response) > 0
        response_utf8 = BaseHandler.petscii_to_utf8(response.rstrip(b"\x00"))
        assert "error" in response_utf8.lower()

    def test_dispatch_empty(self):
        """Test dispatching empty input"""
        from request_dispatcher import RequestDispatcher

        dispatcher = RequestDispatcher()

        # Just null terminator
        petscii_text = bytes([0x00])

        response = dispatcher.dispatch(petscii_text)

        # Should get empty or minimal response
        assert len(response) > 0


class TestCodeChatSemanticChecks:
    """Test semantic guardrails used by CodeChatHandler."""

    def test_sprite_image_mismatch_is_reported(self):
        source = """
char * const SpriteMem = (char*)0x0340;
void main(void) {
    memcpy(SpriteMem, sprite_data, 63);
    spr_set(0, true, 160, 100, 0, 7, false, false, false);
}
"""
        warnings = _sprite_image_consistency_warnings(source)
        assert warnings
        assert "expected one of [13]" in warnings[0]

    def test_sprite_image_match_has_no_warning(self):
        source = """
char * const SpriteMem = (char*)0x0340;
void main(void) {
    memcpy(SpriteMem, sprite_data, 63);
    spr_set(0, true, 160, 100, 13, 7, false, false, false);
}
"""
        warnings = _sprite_image_consistency_warnings(source)
        assert warnings == []


class TestManualSearch:
    """Test manual search helper ranking and fallback behavior."""

    def test_natural_language_query_matches_relevant_paragraph(self):
        manual = {
            "using-the-shell.md": (
                "Use mnt to mount a D64 image.\n\n"
                "Use umnt to unmount the active image."
            )
        }

        result = search_manual("How do I mount d64 image?", manual)
        assert "mount a D64" in result

    def test_no_match_returns_full_manual(self):
        manual = {
            "a.md": "First section text.",
            "b.md": "Second section text.",
        }

        result = search_manual("nonexistent-topic-xyz", manual)
        assert "=== a.md ===" in result
        assert "=== b.md ===" in result


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
