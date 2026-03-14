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
        self.messages = [SystemMessage(content=CHAT_SYSTEM_PROMPT)]
        logger.info(f"Set project name to '{self.project_name}'")

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
        """Initialize LangChain LLM with Azure OpenAI"""
        try:
            # Check for Azure OpenAI credentials
            azure_key = os.getenv("AZURE_OPENAI_API_KEY")
            azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
            azure_deployment = os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME")
            azure_version = os.getenv("AZURE_OPENAI_API_VERSION", "2024-02-15-preview")

            if not azure_key or not azure_endpoint or not azure_deployment:
                logger.warning(
                    "Azure OpenAI credentials not set, ChatHandler will use basic responses"
                )
                return

            # Import LangChain components
            try:
                from langchain_openai import AzureChatOpenAI

                # Initialize LLM (using Azure OpenAI)
                self.llm = AzureChatOpenAI(
                    azure_deployment=azure_deployment,
                    api_version=azure_version,
                    azure_endpoint=azure_endpoint,
                    api_key=azure_key,
                    temperature=0.7,
                )
                logger.info(
                    f"ChatHandler initialized with Azure OpenAI (deployment: {azure_deployment})"
                )

            except ImportError as e:
                logger.warning(f"LangChain not installed: {e}")
                logger.info("Install with: pip install langchain langchain-openai")

        except Exception as e:
            logger.error(f"Error initializing LLM: {e}")

    def _initialize_tools(self):
        """Initialize LangChain tools for this agent, including web search and context7 docs"""
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
            # Refresh the system message with the current source file
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
            self.messages[0] = SystemMessage(
                content=CHAT_SYSTEM_PROMPT + source_section
            )

            self.messages.append(HumanMessage(content=query))

            agent = create_agent(
                model=self.llm,
                tools=self.tools,
                system_prompt=CHAT_SYSTEM_PROMPT + source_section,
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
    from dotenv import load_dotenv
    load_dotenv(override=True)
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
