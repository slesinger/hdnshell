import os
import logging
import re
import time
import sys
from sdk import BaseHandler
from logging_utils import configure_application_logging
from langchain_core.messages import HumanMessage, SystemMessage
from langchain_core.callbacks import BaseCallbackHandler
from langchain.agents import create_agent
from agent_tools import (
    create_websearch_tool,
    create_c64ref_tool,
    create_compile_tool,
    create_run_tool,
    create_write_source_tool,
    read_source_file,
    read_all_sources,
    create_write_file_tool,
    create_read_file_tool,
    create_list_files_tool,
    create_compile_project_tool,
    create_run_project_tool,
    create_run_shell_command_tool,
    create_git_tool,
    create_find_oscar_symbol_tool,
    create_oscar64_overview_stdlib_docs_tool,
    create_oscar64_vic_sid_cia_reu_docs_tool,
    create_oscar64_charwin_sprites_input_io_docs_tool,
    create_oscar64_graphics_audio_vector_ultimate_docs_tool,
    create_project_scaffold,
    create_c64_memory_peek_tool,
)

logger = logging.getLogger(__name__)


def _resolve_asset_root() -> str:
    """Resolve coding-agent asset root for dev and PyInstaller runtimes."""
    candidates = []

    # PyInstaller one-file extraction directory
    meipass = getattr(sys, "_MEIPASS", None)
    if meipass:
        candidates.append(os.path.join(meipass, "server-apps", "coding_agent"))

    # Development path (cloud/handlers -> cloud/server-apps/coding_agent)
    candidates.append(
        os.path.join(
            os.path.dirname(os.path.dirname(__file__)), "server-apps", "coding_agent"
        )
    )

    # Runtime path next to executable (used by some one-dir layouts)
    if getattr(sys, "frozen", False):
        exe_dir = os.path.dirname(sys.executable)
        candidates.append(os.path.join(exe_dir, "server-apps", "coding_agent"))

    for candidate in candidates:
        if os.path.isdir(candidate):
            return candidate

    checked = "\n - ".join(candidates)
    raise RuntimeError("Could not locate coding_agent assets. Checked:\n - " + checked)


ASSET_ROOT = _resolve_asset_root()
PROMPTS_DIR = os.path.join(ASSET_ROOT, "prompts")
INSTRUCTIONS_DIR = os.path.join(ASSET_ROOT, "instructions")
SKILLS_DIR = os.path.join(ASSET_ROOT, "skills")

MODE_CODE = "code"
MODE_PLAN = "plan"
MODE_EXPLORE = "explore"

SHARED_INSTRUCTION_FILES = [
    "communication_style.md",
    "action_safety.md",
    "compile_run_loop.md",
    "oscar_guardrails.md",
    "git_workflow.md",
    "repo_memory.md",
]

FILE_MODE_PROMPT_FILES = {
    False: "single_file_mode_prompt.md",
    True: "multi_file_mode_prompt.md",
}

AGENT_MODE_PROMPT_FILES = {
    MODE_CODE: None,
    MODE_PLAN: "plan_mode_prompt.md",
    MODE_EXPLORE: "explore_mode_prompt.md",
}


_SPRITE_MEM_DEF_RE = re.compile(
    r"char\s*\*\s*const\s+([A-Za-z_]\w*)\s*=\s*\(char\s*\*\)\s*(0x[0-9A-Fa-f]+|\d+)\s*;"
)
_MEMCPY_TARGET_RE = re.compile(r"memcpy\s*\(\s*([A-Za-z_]\w*)\s*,")
_SPR_SET_IMAGE_RE = re.compile(
    r"spr_set\s*\(\s*[^,]+,\s*[^,]+,\s*[^,]+,\s*[^,]+,\s*([^,\)]+)"
)


class _AgentGuardrailStop(RuntimeError):
    """Raised when orchestrator guardrails stop an agent invoke."""

    def __init__(self, reason_code: str, detail: str):
        super().__init__(detail)
        self.reason_code = reason_code
        self.detail = detail

    def user_message(self) -> str:
        if self.reason_code == "max_steps":
            return (
                "Stopped to prevent runaway execution: max agent steps per invoke reached.\n"
                f"Details: {self.detail}"
            )
        if self.reason_code == "max_wall_clock":
            return (
                "Stopped to prevent runaway execution: max wall-clock time per turn reached.\n"
                f"Details: {self.detail}"
            )
        if self.reason_code == "no_progress":
            return (
                "Stopped to prevent runaway execution: repeated identical tool calls indicate no progress.\n"
                f"Details: {self.detail}"
            )
        return f"Stopped by guardrail: {self.detail}"


class _InvokeGuardrailsCallback(BaseCallbackHandler):
    """Callback-based guardrails for a single agent invoke."""

    def __init__(
        self, max_steps: int, max_wall_clock_seconds: float, max_same_tool_repeat: int
    ):
        self.max_steps = max_steps
        self.max_wall_clock_seconds = max_wall_clock_seconds
        self.max_same_tool_repeat = max_same_tool_repeat
        self.started_at = time.monotonic()
        self.tool_steps = 0
        self._last_tool_signature = ""
        self._same_tool_repeat_count = 0

    def _elapsed(self) -> float:
        return time.monotonic() - self.started_at

    def _check_deadline(self, phase: str):
        elapsed = self._elapsed()
        if elapsed > self.max_wall_clock_seconds:
            raise _AgentGuardrailStop(
                "max_wall_clock",
                (
                    f"phase={phase}, elapsed={elapsed:.1f}s, "
                    f"limit={self.max_wall_clock_seconds:.1f}s"
                ),
            )

    def on_llm_start(self, serialized, prompts, **kwargs):
        self._check_deadline("llm_start")

    def on_tool_start(self, serialized, input_str, **kwargs):
        self._check_deadline("tool_start")

        self.tool_steps += 1
        if self.tool_steps > self.max_steps:
            raise _AgentGuardrailStop(
                "max_steps",
                f"tool_steps={self.tool_steps}, limit={self.max_steps}",
            )

        tool_name = "<unknown_tool>"
        if isinstance(serialized, dict):
            tool_name = serialized.get("name") or serialized.get("id") or tool_name
        signature = f"{tool_name}|{str(input_str).strip()}"

        if signature == self._last_tool_signature:
            self._same_tool_repeat_count += 1
        else:
            self._last_tool_signature = signature
            self._same_tool_repeat_count = 1

        if self._same_tool_repeat_count >= self.max_same_tool_repeat:
            raise _AgentGuardrailStop(
                "no_progress",
                (
                    f"tool='{tool_name}', repeated={self._same_tool_repeat_count}x, "
                    f"threshold={self.max_same_tool_repeat}"
                ),
            )


class _StatusCallback(BaseCallbackHandler):
    """Forwards LLM/tool activity events to an external status callable."""

    def __init__(self, on_status):
        self._on_status = on_status
        self._active_tool_name = "tool"

    def _notify(self, msg: str):
        logger.info("[StatusCallback] notify: %s", msg)
        try:
            self._on_status(msg)
        except Exception as e:
            logger.warning("[StatusCallback] on_status callback raised: %s", e)

    def on_llm_start(self, serialized, prompts, **kwargs):
        logger.info("[StatusCallback] on_llm_start")
        self._notify("thinking...")

    def on_llm_end(self, response, **kwargs):
        tokens = self._extract_total_tokens(response)
        if tokens is not None:
            self._notify(f"thinking ({tokens} tokens)")

    def on_tool_start(self, serialized, input_str, **kwargs):
        tool_name = "tool"
        if isinstance(serialized, dict):
            tool_name = serialized.get("name") or serialized.get("id") or "tool"
        self._active_tool_name = tool_name
        logger.info("[StatusCallback] on_tool_start: %s", tool_name)
        self._notify(tool_name)

    def on_tool_end(self, output, **kwargs):
        logger.info("[StatusCallback] on_tool_end")
        summary = self._summarize_tool_output(output)
        if summary:
            self._notify(f"{self._active_tool_name} ({summary})")
        self._notify("thinking...")

    def on_tool_error(self, error, **kwargs):
        logger.info("[StatusCallback] on_tool_error: %s", error)
        self._notify("thinking...")

    @staticmethod
    def _extract_total_tokens(response):
        """Best-effort extraction of token usage from LLM callback payload."""
        llm_output = getattr(response, "llm_output", None)
        if not isinstance(llm_output, dict):
            return None

        usage = llm_output.get("token_usage")
        if not isinstance(usage, dict):
            usage = llm_output.get("usage")
        if not isinstance(usage, dict):
            return None

        for key in ("total_tokens", "total", "tokens"):
            value = usage.get(key)
            if isinstance(value, int):
                return value

        prompt_tokens = usage.get("prompt_tokens")
        completion_tokens = usage.get("completion_tokens")
        if isinstance(prompt_tokens, int) and isinstance(completion_tokens, int):
            return prompt_tokens + completion_tokens

        input_tokens = usage.get("input_tokens")
        output_tokens = usage.get("output_tokens")
        if isinstance(input_tokens, int) and isinstance(output_tokens, int):
            return input_tokens + output_tokens

        return None

    @staticmethod
    def _summarize_tool_output(output):
        """Low-noise summary for status line, only when obvious."""
        if isinstance(output, dict):
            for key in ("docs", "documents", "results", "items"):
                value = output.get(key)
                if isinstance(value, list):
                    return f"fetched {len(value)} {key}"
        if isinstance(output, list):
            return f"fetched {len(output)} items"
        if isinstance(output, str):
            # Prefer explicit human-readable snippets if present.
            m = re.search(r"(fetched\s+\d+\s+\w+)", output, re.IGNORECASE)
            if m:
                return m.group(1).strip()
            m = re.search(r"(\d+\s+docs?)", output, re.IGNORECASE)
            if m:
                return f"fetched {m.group(1).strip()}"
        return None


def _parse_int_expr(expr: str):
    value = expr.strip()
    if not value:
        return None

    try:
        return int(value, 0)
    except ValueError:
        pass

    compact = re.sub(r"\s+", "", value)
    if "/" in compact:
        lhs, rhs = compact.split("/", 1)
        try:
            denominator = int(rhs, 0)
            if denominator == 0:
                return None
            return int(lhs, 0) // denominator
        except ValueError:
            return None

    return None


def _sprite_image_consistency_warnings(source: str):
    """Return warnings when spr_set image indices do not match sprite data address/64."""
    if not source:
        return []

    sprite_mem = {}
    for name, addr_text in _SPRITE_MEM_DEF_RE.findall(source):
        try:
            sprite_mem[name] = int(addr_text, 0)
        except ValueError:
            continue

    if not sprite_mem:
        return []

    memcpy_targets = set(_MEMCPY_TARGET_RE.findall(source))
    candidate_expected = {
        addr // 64
        for name, addr in sprite_mem.items()
        if name in memcpy_targets or "sprite" in name.lower()
    }

    if not candidate_expected:
        return []

    warnings = []
    expected_str = ", ".join(str(v) for v in sorted(candidate_expected))
    for image_expr in _SPR_SET_IMAGE_RE.findall(source):
        parsed_image = _parse_int_expr(image_expr)
        if parsed_image is None:
            continue
        if parsed_image not in candidate_expected:
            warnings.append(
                "spr_set image index appears inconsistent: "
                f"image={image_expr.strip()} but expected one of [{expected_str}] "
                "from sprite_data_address / 64."
            )

    return warnings


def _load_text_file(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        content = f.read().strip()
    if not content:
        raise RuntimeError(f"Prompt asset is empty: {path}")
    return content


def _load_asset(subdir: str, filename: str) -> str:
    return _load_text_file(os.path.join(ASSET_ROOT, subdir, filename))


def _load_prompt(prompt_file: str) -> str:
    """Load a prompt from cloud/server-apps/coding_agent/prompts."""
    return _load_asset("prompts", prompt_file)


BASE_SYSTEM_PROMPT = _load_prompt("base_system_prompt.md")


def _build_code_system_prompt(base_prompt: str) -> str:
    """Append user-name personalization to the given base prompt."""
    try:
        from sdk.config_manager import read_config

        user_name = read_config().get("user_name", "").strip()
    except Exception:
        user_name = ""
    if user_name:
        return base_prompt + f"\nThe user's name is {user_name}."
    return base_prompt


class CodeChatHandler:

    @staticmethod
    def handle_text_input(data: bytes, session_id: int = 0) -> bytes:
        try:
            # Convert PETSCII to UTF-8
            utf8_text = BaseHandler.petscii_to_utf8(data.rstrip(b"\x00"))
            logger.info(f"CodeChat {session_id}: Received: '{utf8_text}'")
            handler = CodeChatAgent().get_instance(session_id)
            response_text = handler.handle(utf8_text)
            logger.info(f"Response: '{response_text[:100]}...'")
            # Convert response back to PETSCII
            return BaseHandler.utf8_to_petscii(response_text)

        except Exception as e:
            logger.error(f"Error during CodeChat: {e}", exc_info=True)
            return BaseHandler.utf8_to_petscii(f"Server error: {str(e)}")


class CodeChatAgent:

    _instances = {}
    MAX_AGENT_STEPS_PER_INVOKE = 20
    MAX_AGENT_WALL_CLOCK_SECONDS = 90.0
    MAX_SAME_TOOL_REPEAT = 4

    def __init__(self):
        self.project_name = "untitled"
        self.working_dir = None  # Multi-file mode when set
        self.agent_mode = MODE_CODE
        self.active_skills = []
        self.messages = []
        self.llm = None
        self.tools = []
        self.max_agent_steps_per_invoke = self._resolve_max_agent_steps_per_invoke()
        self._status_callback = None
        self._initialize_llm()
        self._initialize_tools()
        self.set_project_name(self.project_name)

    @classmethod
    def _resolve_max_agent_steps_per_invoke(cls) -> int:
        try:
            from sdk.config_manager import get_agent_max_iterations

            return get_agent_max_iterations(
                default=cls.MAX_AGENT_STEPS_PER_INVOKE,
                hard_cap=cls.MAX_AGENT_STEPS_PER_INVOKE,
            )
        except Exception:
            logger.debug("Falling back to default max agent steps", exc_info=True)
            return cls.MAX_AGENT_STEPS_PER_INVOKE

    def set_status_callback(self, callback):
        """Set a callable that receives status strings ('thinking...' or a tool name)."""
        self._status_callback = callback

    def get_instance(self, session_id: int = 0, force_new: bool = False):
        # singleton instance per session
        if force_new or session_id not in type(self)._instances:
            type(self)._instances[session_id] = CodeChatAgent()
        return type(self)._instances[session_id]

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

    def get_status(self):
        skills = ", ".join(self.active_skills) if self.active_skills else "none"
        scope = self.working_dir if self.working_dir else f"{self.project_name}.c"
        return f"mode={self.agent_mode}, skills={skills}, target={scope}"

    def set_agent_mode(self, mode: str):
        normalized = (mode or "").strip().lower()
        if normalized not in AGENT_MODE_PROMPT_FILES:
            raise ValueError(f"Unknown coding-agent mode: {mode}")
        self.agent_mode = normalized
        self.clear_history()
        self._rebuild_tools()
        logger.info("Set coding-agent mode to '%s'", self.agent_mode)

    def set_active_skills(self, skill_names):
        available = set(self.available_skills())
        normalized = []
        for skill_name in skill_names:
            name = skill_name.strip()
            if not name:
                continue
            if name not in available:
                raise ValueError(f"Unknown coding-agent skill: {name}")
            if name not in normalized:
                normalized.append(name)
        self.active_skills = normalized
        self.clear_history()
        logger.info("Set active coding-agent skills: %s", self.active_skills)

    def toggle_skill(self, skill_name: str):
        name = skill_name.strip()
        if not name:
            raise ValueError("Skill name is required")
        available = set(self.available_skills())
        if name not in available:
            raise ValueError(f"Unknown coding-agent skill: {name}")
        if name in self.active_skills:
            self.active_skills = [
                skill for skill in self.active_skills if skill != name
            ]
            enabled = False
        else:
            self.active_skills.append(name)
            enabled = True
        self.clear_history()
        logger.info("Toggled coding-agent skill '%s' to %s", name, enabled)
        return enabled

    def set_project_name(self, project_name: str):
        self.project_name = project_name.strip()
        self.working_dir = None
        self.messages = [SystemMessage(content=self._compose_system_prompt(""))]
        self._rebuild_tools()
        logger.info(f"Set project name to '{self.project_name}'")

    def set_working_dir(self, path: str):
        """Switch to multi-file mode for a project directory."""
        self.working_dir = path
        self.messages = [SystemMessage(content=self._compose_system_prompt(""))]
        self._rebuild_tools()
        logger.info(f"Set working dir to '{self.working_dir}'")

    def clear_history(self):
        """Reset conversation history, keeping the current mode/tools."""
        self.messages = [SystemMessage(content=self._compose_system_prompt(""))]
        logger.info("Cleared agent conversation history")

    def _mode_prompt_sections(self):
        sections = [BASE_SYSTEM_PROMPT]
        for filename in SHARED_INSTRUCTION_FILES:
            sections.append(_load_asset("instructions", filename))
        sections.append(_load_prompt(FILE_MODE_PROMPT_FILES[bool(self.working_dir)]))
        mode_prompt_file = AGENT_MODE_PROMPT_FILES[self.agent_mode]
        if mode_prompt_file:
            sections.append(_load_prompt(mode_prompt_file))
        for skill_name in self.active_skills:
            sections.append(
                f"Active skill: {skill_name}\n"
                + _load_asset("skills", f"{skill_name}.md")
            )
        return sections

    def _compose_system_prompt(self, source_section: str):
        parts = self._mode_prompt_sections()
        if source_section:
            parts.append(source_section)
        return _build_code_system_prompt("\n\n".join(part for part in parts if part))

    def _rebuild_tools(self):
        """Recreate tools list based on current mode (single-file vs multi-file)."""
        shared_tools = [
            create_websearch_tool(),
            create_c64ref_tool(),
            create_run_shell_command_tool(),
            create_git_tool(),
            create_find_oscar_symbol_tool(),
            create_oscar64_overview_stdlib_docs_tool(),
            create_oscar64_vic_sid_cia_reu_docs_tool(),
            create_oscar64_charwin_sprites_input_io_docs_tool(),
            create_oscar64_graphics_audio_vector_ultimate_docs_tool(),
            create_c64_memory_peek_tool(),
        ]
        tool_list = list(shared_tools)
        if self.working_dir:
            tool_list.extend(
                [
                    create_read_file_tool(self.working_dir),
                    create_list_files_tool(self.working_dir),
                ]
            )
            if self.agent_mode == MODE_CODE:
                tool_list.extend(
                    [
                        create_write_file_tool(self.working_dir),
                        create_compile_project_tool(self.working_dir),
                        create_run_project_tool(self.working_dir),
                    ]
                )
        elif self.agent_mode == MODE_CODE:
            tool_list.extend(
                [
                    create_write_source_tool(self.project_name),
                    create_compile_tool(self.project_name),
                    create_run_tool(self.project_name),
                ]
            )

        self.tools = []
        for tool in tool_list:
            if tool is not None:
                self.tools.append(tool)

    def handle(self, text: str) -> str:
        """
        Process chat request using LLM

        Args:
            text: UTF-8 text (should start with "I:")
            session_id: The session ID for the request

        Returns:
            UTF-8 response text
        """
        query = text.strip()

        logger.info(f"Code Chat query: {query}")

        # Handle slash commands before sending to LLM
        if query.startswith("/"):
            result = self._handle_slash_command(query)
            if result is not None:
                return result

        try:
            # Use LLM to generate response
            response = self._query_llm(query)
            return response

        except Exception as e:
            logger.error(f"Error processing chat request: {e}")
            return f"Error: {str(e)}"

    def _handle_slash_command(self, cmd: str) -> str | None:
        """Handle slash commands locally without invoking the LLM.

        Returns a response string if the command was handled, or None if the
        text should be forwarded to the LLM as a normal message.
        """
        parts = cmd.split(None, 1)
        command = parts[0].lower()
        arg = parts[1].strip() if len(parts) > 1 else ""

        if command == "/clear":
            self.clear_history()
            return "Chat history cleared."

        if command == "/mode":
            if not arg:
                return f"Mode: {self.agent_mode}"
            try:
                self.set_agent_mode(arg)
                return f"Mode: {self.agent_mode}"
            except ValueError as e:
                return str(e)

        if command in ("/code", "/plan", "/explore"):
            try:
                self.set_agent_mode(command[1:])
                if arg:
                    # Run the task immediately through the LLM
                    return self._query_llm(arg)
                return f"Mode: {self.agent_mode}"
            except ValueError as e:
                return str(e)

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

        if command == "/project":
            if self.working_dir:
                return f"Project: {self.working_dir}"
            return "No project dir set."

        if command == "/new-project":
            if not arg:
                return "Usage: /new-project <name>"
            try:
                project_dir, created_files = create_project_scaffold(arg)
                self.set_working_dir(project_dir)
                return (
                    f"Created project: {project_dir}\n"
                    f"Files: {', '.join(created_files)}"
                )
            except ValueError as e:
                return f"Error: {e}"

        if command == "/files":
            if self.working_dir:
                from agent_tools import list_project_files

                return f"Project files:\n{list_project_files(self.working_dir)}"
            return "No project dir set."

        if command == "/help":
            return (
                "Slash commands: /clear, /mode, /code, /plan, /explore, "
                "/skills, /skill <name>, /skill clear, /status, /project, "
                "/new-project <name>, /files"
            )

        # Unknown slash command — let the LLM handle it
        return None

    def _initialize_llm(self):
        """Initialize LLM using configured provider (with backup and legacy fallback)."""
        try:
            from llm_factory import create_llm_with_fallback

            self.llm = create_llm_with_fallback("code")
            if self.llm:
                logger.info("CodeChatAgent LLM initialized from config")
            else:
                logger.warning(
                    "No LLM configured for code, CodeChatAgent will use basic responses"
                )
        except Exception as e:
            logger.error(f"Error initializing LLM: {e}")

    def _initialize_tools(self):
        """Initialize LangChain tools for this agent."""
        self._rebuild_tools()

    def _query_llm(self, query: str) -> str:
        """
        Query LLM with the user's request using a LangChain agent.
        If tools are available the agent can invoke them automatically.

        Args:
            query: User query

        Returns:
            LLM response
        """
        try:
            # Refresh the system message with current source file(s)
            if self.working_dir:
                source = read_all_sources(self.working_dir)
                if source and source != "(no .c or .h files found)":
                    source_section = (
                        f"\n\n--- Project files ({self.working_dir}) ---\n{source}"
                    )
                else:
                    source_section = (
                        f"\n\n--- No .c or .h files in {self.working_dir} yet. "
                        "Create them by calling write_file. ---"
                    )
            else:
                source = read_source_file(self.project_name)
                if source:
                    source_section = (
                        f"\n\n--- Current source ({self.project_name}.c) ---\n"
                        f"```c\n{source}\n```"
                    )
                else:
                    source_section = (
                        f"\n\n--- {self.project_name}.c does not exist yet. "
                        "Create it by calling write_source. ---"
                    )
            base_prompt = self._compose_system_prompt(source_section)

            self.messages[0] = SystemMessage(content=base_prompt)

            self.messages.append(HumanMessage(content=query))

            guardrails = _InvokeGuardrailsCallback(
                max_steps=self.max_agent_steps_per_invoke,
                max_wall_clock_seconds=self.MAX_AGENT_WALL_CLOCK_SECONDS,
                max_same_tool_repeat=self.MAX_SAME_TOOL_REPEAT,
            )
            callbacks = [guardrails]
            if self._status_callback is not None:
                callbacks.append(_StatusCallback(self._status_callback))

            agent = create_agent(
                model=self.llm,
                tools=self.tools,
                system_prompt=base_prompt,
            )
            try:
                result = agent.invoke(
                    {"messages": self.messages},
                    config={
                        "callbacks": callbacks,
                        "recursion_limit": self.max_agent_steps_per_invoke,
                    },
                )
            except _AgentGuardrailStop as stop:
                logger.warning(
                    "CodeChat invoke guardrail stop (%s): %s",
                    stop.reason_code,
                    stop.detail,
                )
                return stop.user_message()

            # Last message in the result is the final AI response
            ai_response = result["messages"][-1]
            self.messages.append(ai_response)

            response_text = ai_response.content
            validation_source = (
                read_all_sources(self.working_dir)
                if self.working_dir
                else read_source_file(self.project_name)
            )
            semantic_warnings = _sprite_image_consistency_warnings(validation_source)
            if semantic_warnings:
                response_text = (
                    f"{response_text}\n\n"
                    "Semantic check warning:\n"
                    + "\n".join(f"- {warning}" for warning in semantic_warnings)
                )
                logger.warning(
                    "CodeChat semantic warning(s): %s",
                    " | ".join(semantic_warnings),
                )

            return response_text

        except Exception as e:
            logger.error(f"Error querying LLM: {e}")
            return "I encountered an error processing your request."


if __name__ == "__main__":
    from sdk.config_manager import apply_env_overrides
    from workspace_init import init_workspace, WORKSPACE_DIR

    apply_env_overrides()
    configure_application_logging()
    agent = CodeChatAgent()
    init_workspace()
    agent.set_working_dir(os.path.join(WORKSPACE_DIR, "oscar", "honza"))
    print("C64 Code Chat (type 'exit' or press Ctrl+C to quit)")
    print("-" * 50)
    while True:
        try:
            user_input = input("You: ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\nBye!")
            break
        if not user_input:
            continue
        if user_input.lower() in ("exit", "quit"):
            print("Bye!")
            break
        response = agent.handle(user_input)
        print(f"Agent: {response}\n")
