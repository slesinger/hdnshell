"""
ChatHandler - Handles general chat requests to LLM Agent

Uses LangChain with Context7 MCP server for documentation access.
Processes requests starting with "I:"
"""

import os
import logging
from base_handler import BaseHandler
from dotenv import load_dotenv
from shared_state import get_session_state
from agent_tools import create_websearch_tool, create_c64ref_tool, create_manual_tool

# Load environment variables (override=True to prevent system vars from interfering)
load_dotenv(override=True)

logger = logging.getLogger(__name__)

# System prompt for chat agent
CHAT_SYSTEM_PROMPT = """You are an AI assistant for
Commodore 64 users.

TOOL PRIORITY RULES:
1. For ANY question about the
   Hondani Shell (hdnsh), its
   commands, CSDB, disk ops,
   mounting, file listing, or
   cloud features: ALWAYS use
   hondani_shell_manual FIRST.
2. For C64 hardware, opcodes,
   memory map, SID, VIC, KERNAL:
   use c64_reference_docs.
3. Use web_search ONLY for topics
   not covered by the above tools.

CRITICAL RULE:
Output MUST contain ONLY ASCII
characters (codes 32-126).

Never use:
- Unicode
- UTF-8 symbols
- smart quotes
- long dashes
- emojis
- special bullets

Allowed punctuation:
. , : ; ! ? - ' ( ) / + * =

Output will be shown on a C64
screen (40x25).

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
- BASIC or 6502 ASM

Be friendly.
Be brief.
Be ASCII-only."""


class ChatHandler(BaseHandler):
    """Handler for general chat requests using LLM"""

    def __init__(self):
        """Initialize ChatHandler with LangChain components"""
        self.llm = None
        self.tools = []
        self._initialize_llm()
        self._initialize_tools()

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
        for tool in [
            create_websearch_tool(),
            create_c64ref_tool(),
            create_manual_tool(self.load_manual_files()),
        ]:
            if tool is not None:
                self.tools.append(tool)

    def find_manual_dir(self) -> str:
        """
        Resolve the user_manual directory whether running from source or
        as a PyInstaller frozen binary.
        """
        import sys

        if getattr(sys, "frozen", False):
            base = sys._MEIPASS
            return os.path.join(base, "user_manual")
        here = os.path.dirname(os.path.abspath(__file__))
        return os.path.join(here, "..", "docs", "user_manual")

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
        state = get_session_state(session_id)
        if t.startswith("i:"):
            return True
        if state.get("active_module") == "i":
            if any(t.startswith(p) for p in ["c:", "?", "help"]):
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
        state = get_session_state(session_id)

        if t_lower.startswith("i:"):
            query = t[2:].strip()
            if not query:
                state["active_module"] = "i"
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

        logger.info(f"Chat query: {query}")

        # If LLM is not initialized, provide fallback response
        if not self.llm:
            return self._fallback_response(query)

        try:
            # Use LLM to generate response
            response = self._query_llm(query)
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
            from langchain_core.messages import HumanMessage, SystemMessage

            messages = [
                SystemMessage(content=CHAT_SYSTEM_PROMPT),
                HumanMessage(content=query),
            ]
            print("Tools available to agent:", [tool.name for tool in self.tools])
            if self.tools:
                from langchain.agents import create_agent

                agent = create_agent(
                    model=self.llm,
                    tools=self.tools,
                    system_prompt=CHAT_SYSTEM_PROMPT,
                )
                result = agent.invoke({"messages": [HumanMessage(content=query)]})
                # Last message in the result is the final AI response
                return result["messages"][-1].content
            else:
                response = self.llm.invoke(messages)
                return response.content

        except Exception as e:
            logger.error(f"Error querying LLM: {e}")
            return "I encountered an error processing your request."
