"""
ChatHandler - Handles general chat requests to LLM Agent

Uses LangChain with Context7 MCP server for documentation access.
Processes requests starting with "I:"
"""

import logging
import os
import re
from langchain_core.callbacks import BaseCallbackHandler
from sdk import (
    BaseHandler,
    append_chat_message,
    get_session_state_copy,
    serialized_session_turn,
    update_session_state,
)
from agent_tools import (
    create_websearch_tool,
    create_c64ref_tool,
    create_manual_tool,
    search_manual,
    create_screen_memory_tool,
    create_c64_keyboard_tool,
    create_c64_machine_control_tool,
    create_c64_memory_access_tool,
    create_c64_memory_analyzer_tool,
    create_run_shell_command_tool,
    create_write_file_tool,
    create_read_file_tool,
    create_list_files_tool,
    create_compile_project_tool,
    create_run_project_tool,
    create_assistant_memory_tool,
)

logger = logging.getLogger(__name__)


class _AssistantGuardrailStop(RuntimeError):
    """Raised when assistant invoke guardrails stop an agent invoke."""

    def __init__(self, reason_code: str, detail: str):
        super().__init__(detail)
        self.reason_code = reason_code
        self.detail = detail

    def user_message(self) -> str:
        if self.reason_code == "max_steps":
            return (
                "Stopped to prevent runaway execution: max assistant steps per invoke reached.\n"
                f"Details: {self.detail}"
            )
        return f"Stopped by guardrail: {self.detail}"


class _AssistantInvokeGuardrailsCallback(BaseCallbackHandler):
    """Callback-based loop protection for a single assistant invoke."""

    def __init__(self, max_steps: int):
        self.max_steps = max_steps
        self.tool_steps = 0

    def on_tool_start(self, serialized, input_str, **kwargs):
        self.tool_steps += 1
        if self.tool_steps > self.max_steps:
            raise _AssistantGuardrailStop(
                "max_steps",
                f"tool_steps={self.tool_steps}, limit={self.max_steps}",
            )


ASSET_ROOT = os.path.join(
    os.path.dirname(os.path.dirname(__file__)), "server-apps", "coding_agent"
)
SKILLS_DIR = os.path.join(ASSET_ROOT, "skills")

# System prompt for chat agent
CHAT_SYSTEM_PROMPT = """You are an AI assistant for
Commodore 64 users using the Hondani Shell (hdnsh).
Hondani Shell replaced BASIC and BASIC commands are not relevant.
Do not rely on general BASIC web info.
Default environment assumptions:
- User works in Hondani Shell first
- Target machine is C64 Ultimate with network target
- When writing code, default language is C (use 6502 asm only if asked)
Rely on tools provided to you, including:
- Hondani Shell manual tool
- C64 reference documentation tool
- web search tool

TOOL PRIORITY RULES:
1. For ANY ask related to the Hondani Shell (hdnsh), operations,
its commands, CSDB, disk ops, mounting, file listing, or cloud
features: ALWAYS use hondani_shell_manual FIRST.
Do not assume general C64 knowledge because Hondani Shell is a
unique environment and the manual is the authoritative source.
2. For C64 hardware, opcodes, memory map, SID, VIC, KERNAL: use c64_reference_docs tool.
3. Use web_search ONLY for topics not covered by the above tools.

LIVE C64 TOOLING RULES:
- If the user asks about current on-screen content or errors, call get_screen first.
- If the user asks to automate typing, use type_on_c64 and include explicit \n where RETURN is needed.
- If the user asks to control machine state, use c64_machine_control.
- If the user asks to inspect/modify/execute memory on physical machine, use c64_memory_access.
- If the user asks to analyze memory (e.g. SID location, sprite extraction), use c64_memory_analyze.
- Before actions that can alter machine state or memory, summarize intended action in one short sentence.

CRITICAL RULE:
Output MUST contain ONLY ASCII characters (codes 32-126). Other characters would render incorrectly on the C64 screen.

Never use:
- Unicode
- UTF-8 symbols
- smart quotes
- long dashes
- emojis
- special bullets

Allowed punctuation:
. , : ; ! ? - ' ( ) / + * =

Output will be shown on a C64 screen (40x25).

Rules:
- Max 40 characters per line
- Use short sentences
- Avoid long paragraphs
- No fancy formatting
- No tabs

Use plain ASCII Markdown only:
- lists use "-"
- emphasis use *word*

Keep answers practical.

Assume:
- 8-bit CPU
- 64KB RAM
- Hondani Shell on C64 Ultimate
- C programming by default
- 6502 assembly only when explicitly requested

Be friendly.
Be brief.
Be ASCII-only."""


def _build_chat_system_prompt() -> str:
    """Return CHAT_SYSTEM_PROMPT with optional user-name personalization."""
    try:
        from sdk.config_manager import read_config

        user_name = read_config().get("user_name", "").strip()
    except Exception:
        logger.debug("Could not read user name from config", exc_info=True)
        user_name = ""
    if user_name:
        return CHAT_SYSTEM_PROMPT + f"\n\nThe user's name is {user_name}."
    return CHAT_SYSTEM_PROMPT


def _load_skill_text(skill_name: str) -> str:
    path = os.path.join(SKILLS_DIR, f"{skill_name}.md")
    with open(path, "r", encoding="utf-8") as f:
        return f.read().strip()


def _resolve_assistant_working_dir() -> str:
    try:
        from workspace_init import WORKSPACE_DIR

        path = os.path.join(WORKSPACE_DIR, "assistant")
    except Exception:
        here = os.path.dirname(os.path.abspath(__file__))
        path = os.path.abspath(os.path.join(here, "..", "workspace", "assistant"))
    os.makedirs(path, exist_ok=True)
    return path


class ChatHandler(BaseHandler):
    """Handler for general chat requests using LLM"""

    def __init__(self):
        """Initialize ChatHandler with LangChain components"""
        self.MAX_AGENT_STEPS_PER_INVOKE = 20
        self.llm = None
        self.tools = []
        self.manual_content = {}
        self.project_name = "assistant"
        self.working_dir = _resolve_assistant_working_dir()
        self.max_agent_steps_per_invoke = self._resolve_max_agent_steps_per_invoke()
        self.active_skills = self.available_skills()
        self._initialize_llm()
        self._initialize_tools()

    def _resolve_max_agent_steps_per_invoke(self) -> int:
        try:
            from sdk.config_manager import get_agent_max_iterations

            return get_agent_max_iterations(
                default=self.MAX_AGENT_STEPS_PER_INVOKE,
                hard_cap=self.MAX_AGENT_STEPS_PER_INVOKE,
            )
        except Exception:
            logger.debug("Falling back to default max assistant steps", exc_info=True)
            return self.MAX_AGENT_STEPS_PER_INVOKE

    @staticmethod
    def available_skills():
        skills = []
        if not os.path.isdir(SKILLS_DIR):
            return skills
        for name in sorted(os.listdir(SKILLS_DIR)):
            if not name.endswith(".md") or name.lower() == "readme.md":
                continue
            skills.append(os.path.splitext(name)[0])
        return skills

    def toggle_skill(self, skill_name: str):
        name = (skill_name or "").strip()
        if not name:
            raise ValueError("Skill name is required")
        available = set(self.available_skills())
        if name not in available:
            raise ValueError(f"Unknown assistant skill: {name}")
        if name in self.active_skills:
            self.active_skills = [
                skill for skill in self.active_skills if skill != name
            ]
            enabled = False
        else:
            self.active_skills.append(name)
            enabled = True
        return enabled

    def set_active_skills(self, skill_names):
        available = set(self.available_skills())
        normalized = []
        for skill_name in skill_names:
            name = (skill_name or "").strip()
            if not name:
                continue
            if name not in available:
                raise ValueError(f"Unknown assistant skill: {name}")
            if name not in normalized:
                normalized.append(name)
        self.active_skills = normalized

    def _compose_chat_system_prompt(self) -> str:
        parts = [_build_chat_system_prompt()]
        for skill_name in self.active_skills:
            try:
                parts.append(
                    f"Active skill: {skill_name}\n{_load_skill_text(skill_name)}"
                )
            except Exception:
                logger.warning("Could not load skill: %s", skill_name, exc_info=True)
        return "\n\n".join(part for part in parts if part)

    def get_status(self) -> str:
        skills = ", ".join(self.active_skills) if self.active_skills else "none"
        return f"skills={skills}, working_dir={self.working_dir}, project={self.project_name}"

    def _initialize_llm(self):
        """Initialize LLM using configured provider (with backup and legacy fallback)."""
        try:
            from llm_factory import create_llm_with_fallback

            self.llm = create_llm_with_fallback("chat")
            if self.llm:
                logger.info("ChatHandler LLM initialized from config")
            else:
                logger.warning(
                    "No LLM configured for chat, ChatHandler will use basic responses"
                )
        except Exception as e:
            logger.error(f"Error initializing LLM: {e}")

    def _initialize_tools(self):
        """Initialize all tools used by the coding agent for the I: assistant."""
        self.manual_content = self.load_manual_files()
        manual_tool = create_manual_tool(self.manual_content)
        if manual_tool is None:
            logger.warning("hondani_shell_manual tool is unavailable")

        for tool in [
            manual_tool,
            create_c64ref_tool(),
            create_websearch_tool(),
            create_c64_keyboard_tool(),
            create_c64_machine_control_tool(),
            create_c64_memory_access_tool(),
            create_c64_memory_analyzer_tool(),
            create_run_shell_command_tool(),
            create_write_file_tool(self.working_dir),
            create_read_file_tool(self.working_dir),
            create_list_files_tool(self.working_dir),
            create_compile_project_tool(self.working_dir),
            create_run_project_tool(self.working_dir),
            create_assistant_memory_tool(self.working_dir),
        ]:
            if tool is not None:
                self.tools.append(tool)

    def find_manual_dir(self) -> str:
        """
        Resolve the user_manual directory whether running from source or
        as a PyInstaller frozen binary.
        """
        import sys

        candidates = []

        if getattr(sys, "frozen", False):
            base = getattr(sys, "_MEIPASS", "")
            if base:
                candidates.extend(
                    [
                        os.path.join(base, "user_manual"),
                        os.path.join(base, "docs", "user_manual"),
                    ]
                )
            exe_dir = os.path.dirname(sys.executable)
            candidates.extend(
                [
                    os.path.join(exe_dir, "user_manual"),
                    os.path.join(exe_dir, "docs", "user_manual"),
                ]
            )

        here = os.path.dirname(os.path.abspath(__file__))
        repo_root = os.path.abspath(os.path.join(here, "..", ".."))
        candidates.extend(
            [
                os.path.join(repo_root, "docs", "user_manual"),
                os.path.join(here, "..", "docs", "user_manual"),
            ]
        )

        for candidate in candidates:
            if os.path.isdir(candidate):
                logger.info("Resolved user manual directory: %s", candidate)
                return candidate

        fallback = os.path.join(repo_root, "docs", "user_manual")
        logger.warning(
            "Could not resolve user manual directory from candidates: %s",
            candidates,
        )
        return fallback

    def load_manual_files(self, manual_dir: str = None) -> dict:
        """
        Read all .md files from the user_manual directory.
        Returns a dict mapping filename -> text.
        """
        if manual_dir is None:
            manual_dir = self.find_manual_dir()
        content = {}
        if not os.path.isdir(manual_dir):
            logger.warning("User manual directory not found: %s", manual_dir)
            return content
        for fname in sorted(os.listdir(manual_dir)):
            if fname.endswith(".md"):
                fpath = os.path.join(manual_dir, fname)
                try:
                    with open(fpath, "r", encoding="utf-8") as fh:
                        content[fname] = fh.read()
                except Exception as e:
                    logger.warning("Could not read manual file %s: %s", fname, e)
        logger.info("Loaded %d user manual file(s) into memory", len(content))
        return content

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        """
        Check if text starts with "I:" or if chat is the active module.

        Args:
            text: UTF-8 text to check
            session_id: The session ID for the request

        Returns:
            True if this handler can process the text
        """
        t = text.strip().lower()
        state = get_session_state_copy(session_id)
        if t.startswith("i:"):
            return True
        if state.get("active_module") == "i":
            if any(t.startswith(p) for p in ["c:", ":", "help"]):
                return False
            return True
        return False

    def handle(self, text: str, session_id: int = 0) -> str:
        """
        Process chat request using LLM

        Args:
            text: UTF-8 text (should start with "I:")
            session_id: The session ID for the request

        Returns:
            UTF-8 response text
        """
        t = text.strip()
        t_lower = t.lower()
        state = get_session_state_copy(session_id)

        if t_lower.startswith("i:"):
            query = t[2:].strip()
            if not query:
                update_session_state(session_id, active_module="i")
                return "Chat mode. I'm listening."
        elif state.get("active_module") == "i":
            query = t
        else:
            # This should not be reached if can_handle is correct
            return self._fallback_response(
                "Internal error: handle called unexpectedly."
            )

        if not query:
            return "Please provide a question or statement."

        if query.startswith("/"):
            slash_response = self._handle_slash_command(query)
            if slash_response is not None:
                return slash_response

        # "m:<phrase>" always searches the manual directly, bypassing the LLM
        # agent's tool selection -- "i:" doesn't reliably pick the manual tool.
        if query.lower().startswith("m:"):
            phrase = query[2:].strip()
            if not phrase:
                return "Usage: m:<search phrase>, e.g. m:memcpy"
            if self.manual_content:
                return search_manual(phrase, self.manual_content)
            return self._manual_missing_response(phrase)

        logger.info(f"Chat query: {query}")

        # If LLM is not initialized, provide fallback response
        if not self.llm:
            return self._fallback_response(query)

        try:
            # Serialize the whole turn for one session so history and responses
            # cannot interleave across concurrent requests from that session.
            with serialized_session_turn(session_id):
                append_chat_message(session_id, "user", query)
                history = get_session_state_copy(session_id).get("chat_history", [])

                response = self._query_llm(
                    query, history=history, session_id=session_id
                )

                try:
                    append_chat_message(session_id, "assistant", response)
                except Exception:
                    logger.debug("Could not append response to history", exc_info=True)

                return response

        except Exception as e:
            logger.error(f"Error processing chat request: {e}")
            return f"Error: {str(e)}"

    def _fallback_response(self, query: str) -> str:
        """
        Provide fallback response when LLM is not available

        Args:
            query: User query

        Returns:
            Simple response
        """
        return "Chat service is currently unavailable. Please check API configuration."

    def _handle_slash_command(self, cmd: str) -> str | None:
        """Handle assistant slash commands locally."""
        parts = cmd.split(None, 1)
        command = parts[0].lower()
        arg = parts[1].strip() if len(parts) > 1 else ""

        if command == "/skills":
            available = ", ".join(self.available_skills()) or "none"
            active = ", ".join(self.active_skills) or "none"
            return f"Skills: {available}\nActive: {active}"

        if command == "/skill":
            if not arg:
                return "Usage: /skill <name> | /skill clear"
            if arg.lower() in ("clear", "none", "off"):
                self.set_active_skills([])
                return "Skills cleared."
            try:
                enabled = self.toggle_skill(arg)
                state = "enabled" if enabled else "disabled"
                active = ", ".join(self.active_skills) or "none"
                return f"Skill {arg} {state}. Active: {active}"
            except ValueError as e:
                return str(e)

        if command == "/status":
            return self.get_status()

        if command == "/help":
            return "Slash commands: /skills, /skill <name>, /skill clear, /status"

        return None

    @staticmethod
    def _is_shell_docs_query(query: str) -> bool:
        q = (query or "").lower()
        if not q:
            return False

        patterns = [
            r"\bhdn\s*shell\b",
            r"\bhdnsh\b",
            r"\bmount\b|\bunmount\b|\bmnt\b|\bumnt\b",
            r"\bd64\b|\bd71\b|\bd81\b",
            r"\bhow\b.*\b(shell|mount|disk|image|csdb|command)\b",
            r"\bcsdb\b",
            r"\b(shell\s+command|command\s+in\s+shell)\b",
        ]
        return any(re.search(pattern, q) for pattern in patterns)

    def _manual_missing_response(self, query: str) -> str:
        q = (query or "").lower()
        if "mount" in q or "mnt" in q or "d64" in q:
            return (
                "HDN manual is not loaded on server.\n"
                "Bundle docs/user_manual in package.\n"
                "Likely commands: mnt <file.d64>, umnt."
            )
        return (
            "HDN manual is not loaded on server.\n"
            "Bundle docs/user_manual in package."
        )

    def _manual_tool_present(self, tools: list) -> bool:
        return any(getattr(tool, "name", "") == "hondani_shell_manual" for tool in tools)

    def _select_tools_for_query(self, query: str, session_id: int = 0) -> list:
        local_tools = list(self.tools)

        # For shell operation questions, force manual-first behavior by restricting
        # the agent to the manual tool only.
        if self._is_shell_docs_query(query):
            local_tools = [
                tool
                for tool in local_tools
                if getattr(tool, "name", "") == "hondani_shell_manual"
            ]

        try:
            screen_tool = create_screen_memory_tool(session_id=session_id)
            if screen_tool is not None and not any(
                getattr(tool, "name", "") == getattr(screen_tool, "name", "")
                for tool in local_tools
            ):
                local_tools.append(screen_tool)
        except Exception:
            logger.debug("Could not create session tools for chat", exc_info=True)

        # Do not add get_screen for docs-only questions to avoid unnecessary tool noise.
        if self._is_shell_docs_query(query):
            local_tools = [
                tool
                for tool in local_tools
                if getattr(tool, "name", "") == "hondani_shell_manual"
            ]

        return local_tools

    def _query_llm(
        self, query: str, history: list | None = None, session_id: int = 0
    ) -> str:
        """
        Query LLM with the user's request using a LangChain agent.
        If tools are available the agent can invoke them automatically.

        Args:
            query: User query

        Returns:
            LLM response
        """
        try:
            from langchain_core.messages import HumanMessage

            system_prompt = self._compose_chat_system_prompt()

            # Rebuild messages from history if provided, otherwise start fresh
            messages = []
            if history:
                for entry in history:
                    content = entry.get("content", "")
                    messages.append(HumanMessage(content=content))
            # Finally append current user query if it wasn't included
            if not (history and history and history[-1].get("content") == query):
                messages.append(HumanMessage(content=query))
            # Build a per-request tools list.
            local_tools = self._select_tools_for_query(query, session_id=session_id)

            if self._is_shell_docs_query(query) and not self._manual_tool_present(
                local_tools
            ):
                logger.warning("Shell docs query but hondani_shell_manual is missing")
                if self.manual_content:
                    return search_manual(query, self.manual_content)
                return self._manual_missing_response(query)

            print("Tools available to agent:", [tool.name for tool in local_tools])
            if local_tools:
                from langchain.agents import create_agent

                agent = create_agent(
                    model=self.llm,
                    tools=local_tools,
                    system_prompt=system_prompt,
                )
                guardrails = _AssistantInvokeGuardrailsCallback(
                    max_steps=self.max_agent_steps_per_invoke
                )
                try:
                    result = agent.invoke(
                        {"messages": messages},
                        config={
                            "callbacks": [guardrails],
                            "recursion_limit": self.max_agent_steps_per_invoke,
                        },
                    )
                except _AssistantGuardrailStop as stop:
                    logger.warning(
                        "Chat invoke guardrail stop (%s): %s",
                        stop.reason_code,
                        stop.detail,
                    )
                    return stop.user_message()
                # Last message in the result is the final AI response
                return result["messages"][-1].content
            else:
                response = self.llm.invoke(messages)
                return response.content

        except Exception as e:
            logger.error(f"Error querying LLM: {e}")
            return "I encountered an error processing your request."
