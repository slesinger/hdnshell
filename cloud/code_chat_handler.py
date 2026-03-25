import os
import logging
from base_handler import BaseHandler
from langchain_core.messages import HumanMessage, SystemMessage
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
    create_oscar64_overview_stdlib_docs_tool,
    create_oscar64_vic_sid_cia_reu_docs_tool,
    create_oscar64_charwin_sprites_input_io_docs_tool,
    create_oscar64_graphics_audio_vector_ultimate_docs_tool,
)

logger = logging.getLogger(__name__)

CHAT_SYSTEM_PROMPT = """You are a helpful coding assistant agent available in the C64 Hondani Cloud.
Always creates full program or make changes until a .prg can be compiled successfully with compilation tool.
The user does not have access to the actual code you create. The user can only talk to you in chat, \
    give you instructions and then the user will able to check the program running on the C64 and give you feedback. \
    Therefore you need to use the run tool that will upload the compiled .prg to the C64 Ultimate and run it.
Library documentation: source code is the best documentation, find it in oscar/include and oscar/docs/samples
C64 Ultimate library: the program will run on the C64 Ultimate, so it can use the C64 Ultimate library, \
    which is located in oscar/include/ultimate_lib.h and oscar/docs/ultimate_lib.c
Commodore Kernal, memory map and other reference documentation is available by calling the c64ref_get_docs tool.
Programming for C64 is a low-level excercise. Use web search tool to find as much information as necessary before writing code. Always prefer using the tools to find information instead of relying on your own knowledge.

IMPORTANT — source file workflow:
- The current source code for the project is included below in this system message.
  It is refreshed automatically before every request, so you always see the latest version.
- When you create or modify code, you MUST call the `write_source` tool with the
  COMPLETE updated source file. Never output partial snippets or diffs.
- After writing, compile with `compile_code` and iterate until compilation succeeds.
- Once it compiles, use `run_code` to run it on the C64 Ultimate and see the results.
"""

MULTI_FILE_SYSTEM_PROMPT = """You are a helpful coding assistant agent available in the C64 Hondani Cloud.
You work with multi-file C projects for the Commodore 64.
The user does not see the code directly — they chat with you and run the result on a real C64.

Library documentation: oscar/include and oscar/docs/samples
C64 Ultimate library: oscar/include/ultimate_lib.h and oscar/docs/ultimate_lib.c
Commodore Kernal, memory map and other reference documentation: use the c64ref_get_docs tool.
Use web search to find information. Prefer tools over your own knowledge.

IMPORTANT — multi-file source workflow:
- All .c and .h files from the project directory are included below.
  They are refreshed automatically before every request.
- Use `write_file` to create or update any .c or .h file (COMPLETE content, no diffs).
- Use `read_file` to read a specific file.
- Use `list_project_files` to see all source files.
- Use `compile_project` to compile (pass the main .c filename or leave empty for auto-detect).
- Use `run_project` to upload the compiled .prg to the C64 Ultimate.
- Iterate: write -> compile -> fix errors -> compile -> run.
"""


def _build_code_system_prompt(base_prompt: str) -> str:
    """Append user-name personalization to the given base prompt."""
    try:
        from config_manager import read_config
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

    def __init__(self):
        self.project_name = "untitled"
        self.working_dir = None  # Multi-file mode when set
        self.messages = []
        self.llm = None
        self.tools = []
        self._initialize_llm()
        self._initialize_tools()
        self.set_project_name(self.project_name)

    def get_instance(self, session_id: int = 0, force_new: bool = False):
        # singleton instance per session
        if not hasattr(self, "_instances"):
            self._instances = {}
        if force_new or session_id not in self._instances:
            self._instances[session_id] = CodeChatHandler()
        return self._instances[session_id]

    def set_project_name(self, project_name: str):
        self.project_name = project_name.strip()
        self.working_dir = None
        self.messages = [SystemMessage(content=CHAT_SYSTEM_PROMPT)]
        self._rebuild_tools()
        logger.info(f"Set project name to '{self.project_name}'")

    def set_working_dir(self, path: str):
        """Switch to multi-file mode for a project directory."""
        self.working_dir = path
        self.messages = [SystemMessage(content=MULTI_FILE_SYSTEM_PROMPT)]
        self._rebuild_tools()
        logger.info(f"Set working dir to '{self.working_dir}'")

    def clear_history(self):
        """Reset conversation history, keeping the current mode/tools."""
        if self.working_dir:
            self.messages = [SystemMessage(content=MULTI_FILE_SYSTEM_PROMPT)]
        else:
            self.messages = [SystemMessage(content=CHAT_SYSTEM_PROMPT)]
        logger.info("Cleared agent conversation history")

    def _rebuild_tools(self):
        """Recreate tools list based on current mode (single-file vs multi-file)."""
        self.tools = []
        if self.working_dir:
            tool_list = [
                create_websearch_tool(),
                create_c64ref_tool(),
                create_write_file_tool(self.working_dir),
                create_read_file_tool(self.working_dir),
                create_list_files_tool(self.working_dir),
                create_compile_project_tool(self.working_dir),
                create_run_project_tool(self.working_dir),
                create_oscar64_overview_stdlib_docs_tool(),
                create_oscar64_vic_sid_cia_reu_docs_tool(),
                create_oscar64_charwin_sprites_input_io_docs_tool(),
                create_oscar64_graphics_audio_vector_ultimate_docs_tool(),
            ]
        else:
            tool_list = [
                create_websearch_tool(),
                create_c64ref_tool(),
                create_write_source_tool(self.project_name),
                create_compile_tool(self.project_name),
                create_run_tool(self.project_name),
                create_oscar64_overview_stdlib_docs_tool(),
                create_oscar64_vic_sid_cia_reu_docs_tool(),
                create_oscar64_charwin_sprites_input_io_docs_tool(),
                create_oscar64_graphics_audio_vector_ultimate_docs_tool(),
            ]
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

        try:
            # Use LLM to generate response
            response = self._query_llm(query)
            return response

        except Exception as e:
            logger.error(f"Error processing chat request: {e}")
            return f"Error: {str(e)}"

    def _initialize_llm(self):
        """Initialize LLM using configured provider (with backup and legacy fallback)."""
        try:
            from llm_factory import create_llm_with_fallback

            self.llm = create_llm_with_fallback("code", temperature=0.7)
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
                base_prompt = _build_code_system_prompt(MULTI_FILE_SYSTEM_PROMPT)
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
                base_prompt = _build_code_system_prompt(CHAT_SYSTEM_PROMPT)

            self.messages[0] = SystemMessage(
                content=base_prompt + source_section
            )

            self.messages.append(HumanMessage(content=query))

            agent = create_agent(
                model=self.llm,
                tools=self.tools,
                system_prompt=base_prompt + source_section,
            )
            result = agent.invoke({"messages": self.messages})
            # Last message in the result is the final AI response
            ai_response = result["messages"][-1]
            self.messages.append(ai_response)
            return ai_response.content

        except Exception as e:
            logger.error(f"Error querying LLM: {e}")
            return "I encountered an error processing your request."


if __name__ == "__main__":
    from config_manager import apply_env_overrides

    apply_env_overrides()
    logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
    agent = CodeChatAgent()
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
