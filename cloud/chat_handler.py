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
        self._manual_content: dict = {}  # filename -> text
        self._load_manual_files()
        self._initialize_llm()
        self._initialize_tools()

    # ------------------------------------------------------------------ #
    # User manual helpers                                                  #
    # ------------------------------------------------------------------ #

    @staticmethod
    def _find_manual_dir() -> str:
        """
        Resolve the user_manual directory whether running from source or
        as a PyInstaller frozen binary.
        """
        import sys
        # PyInstaller unpacks data into sys._MEIPASS
        if getattr(sys, 'frozen', False):
            base = sys._MEIPASS
            return os.path.join(base, 'user_manual')
        # Running from source: cloud/ -> ../docs/user_manual
        here = os.path.dirname(os.path.abspath(__file__))
        return os.path.join(here, '..', 'docs', 'user_manual')

    def _load_manual_files(self):
        """Read all .md files from the user_manual directory into memory."""
        manual_dir = self._find_manual_dir()
        if not os.path.isdir(manual_dir):
            logger.warning("User manual directory not found: %s", manual_dir)
            return
        for fname in sorted(os.listdir(manual_dir)):
            if fname.endswith('.md'):
                fpath = os.path.join(manual_dir, fname)
                try:
                    with open(fpath, 'r', encoding='utf-8') as fh:
                        self._manual_content[fname] = fh.read()
                except Exception as e:
                    logger.warning("Could not read manual file %s: %s", fname, e)
        logger.info("Loaded %d user manual file(s) into memory", len(self._manual_content))

    def _search_manual(self, topic: str) -> str:
        """
        Search the in-memory user manual for *topic*.

        If *topic* is empty or "all", returns the full concatenated manual.
        Otherwise returns every paragraph/section that contains the keyword
        (case-insensitive). Falls back to the full manual if nothing matches.
        """
        if not self._manual_content:
            return "User manual is not available."

        topic = topic.strip()
        keyword = topic.lower()

        if not keyword or keyword == 'all':
            sections = []
            for fname, text in self._manual_content.items():
                sections.append(f"=== {fname} ===\n{text}")
            return "\n\n".join(sections)

        # Collect matching sections (split on markdown headings or blank lines)
        results = []
        for fname, text in self._manual_content.items():
            # Split into paragraphs on double newlines
            paragraphs = text.split('\n\n')
            for para in paragraphs:
                if keyword in para.lower():
                    results.append(para.strip())

        if results:
            return "\n\n".join(results)

        # Nothing matched — return the full manual so the LLM can still help
        logger.info("Manual search: no paragraphs matched '%s', returning full manual", topic)
        sections = []
        for fname, text in self._manual_content.items():
            sections.append(f"=== {fname} ===\n{text}")
        return "\n\n".join(sections)

    def _initialize_manual_tool(self):
        """Register the user manual search as a LangChain tool."""
        if not self._manual_content:
            logger.info("User manual not loaded, manual tool disabled")
            return
        try:
            from langchain_core.tools import Tool

            manual_tool = Tool(
                name="hondani_shell_manual",
                description=(
                    "ALWAYS use this tool first for any question about the Hondani Shell user manual"
                    "(hdnsh), its commands, or its features. "
                    "Covers: shell commands (mnt, umnt, cd, pwd, l, ll, r, run, m, hash, at, "
                    "frz, reset, info, time, mkdir, empty), file operations, disk mounting, "
                    "CSDB browsing and latest releases, cloud/AI integration, "
                    "memory operations, executing programs, installation, and general usage. "
                    "Input is a keyword or topic, e.g. 'mount', 'csdb', 'latest releases', "
                    "'file operations', 'memory', 'cloud', 'installation', 'commands'. "
                    "Use 'all' to retrieve the complete manual."
                ),
                func=self._search_manual,
            )
            self.tools.append(manual_tool)
            logger.info("hondani_shell_manual tool initialized (%d files)", len(self._manual_content))
        except ImportError as e:
            logger.warning("langchain_core not available for manual tool: %s", e)
        except Exception as e:
            logger.error("Error initializing manual tool: %s", e)

    def _initialize_llm(self):
        """Initialize LangChain LLM with Azure OpenAI"""
        try:
            # Check for Azure OpenAI credentials
            azure_key = os.getenv('AZURE_OPENAI_API_KEY')
            azure_endpoint = os.getenv('AZURE_OPENAI_ENDPOINT')
            azure_deployment = os.getenv('AZURE_OPENAI_DEPLOYMENT_NAME')
            azure_version = os.getenv(
                'AZURE_OPENAI_API_VERSION', '2024-02-15-preview')

            if not azure_key or not azure_endpoint or not azure_deployment:
                logger.warning(
                    "Azure OpenAI credentials not set, ChatHandler will use basic responses")
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
                    temperature=0.7
                )
                logger.info(
                    f"ChatHandler initialized with Azure OpenAI (deployment: {azure_deployment})")

            except ImportError as e:
                logger.warning(f"LangChain not installed: {e}")
                logger.info(
                    "Install with: pip install langchain langchain-openai")

        except Exception as e:
            logger.error(f"Error initializing LLM: {e}")

    def _initialize_tools(self):
        """Initialize LangChain tools including web search and context7 docs"""
        try:
            # Check for SerpAPI key for web search
            serpapi_key = os.getenv('SERPAPI_API_KEY')
            if serpapi_key:
                try:
                    from langchain_community.utilities import SerpAPIWrapper
                    from langchain_core.tools import Tool

                    search = SerpAPIWrapper(serpapi_api_key=serpapi_key)

                    search_tool = Tool(
                        name="web_search",
                        description=(
                            "Search the EXTERNAL web for information that cannot be found "
                            "in the Hondani Shell manual or C64 reference docs. "
                            "Use ONLY for topics unrelated to the Hondani Shell, its commands, "
                            "CSDB, C64 hardware, or 6502 programming. "
                            "Do NOT use for shell usage questions, CSDB browsing, "
                            "listing releases, or any feature of the Hondani Shell."
                        ),
                        func=search.run
                    )

                    self.tools.append(search_tool)
                    logger.info("SerpAPI search tool initialized")

                except ImportError as e:
                    logger.warning(f"SerpAPI tools not available: {e}")
            else:
                logger.info(
                    "SERPAPI_API_KEY not set, web search disabled")

        except Exception as e:
            logger.error(f"Error initializing tools: {e}")

        self._initialize_context7_tools()
        self._initialize_manual_tool()

    # ------------------------------------------------------------------ #
    # Context7 MCP helpers                                                 #
    # ------------------------------------------------------------------ #

    # Known library ID on context7 for the C64 reference project
    _C64REF_LIBRARY_ID = "/mist64/c64ref"

    def _context7_request(self, method: str, params: dict, request_id: int = 1) -> dict:
        """
        Send a single JSON-RPC request to the context7 MCP endpoint.
        Handles the streamable-HTTP session handshake transparently.

        Returns the parsed JSON-RPC response dict, or {} on error.
        """
        import requests as _requests

        api_key = os.getenv('CONTEXT7_API_KEY')
        if not api_key:
            logger.warning("CONTEXT7_API_KEY not set")
            return {}

        url = "https://mcp.context7.com/mcp"
        headers = {
            "Content-Type": "application/json",
            "Accept": "application/json, text/event-stream",
            "CONTEXT7_API_KEY": api_key,
        }

        session = _requests.Session()

        # --- initialise the MCP session ---
        init_payload = {
            "jsonrpc": "2.0",
            "id": 0,
            "method": "initialize",
            "params": {
                "protocolVersion": "2024-11-05",
                "capabilities": {},
                "clientInfo": {"name": "hdnsh-cloud", "version": "1.0"},
            },
        }
        try:
            init_resp = session.post(url, json=init_payload, headers=headers, timeout=15)
            init_resp.raise_for_status()
            session_id = init_resp.headers.get("Mcp-Session-Id")
            if session_id:
                headers["Mcp-Session-Id"] = session_id
        except Exception as e:
            logger.error(f"context7 init error: {e}")
            return {}

        # --- call the actual method ---
        payload = {"jsonrpc": "2.0", "id": request_id, "method": method, "params": params}
        try:
            resp = session.post(url, json=payload, headers=headers, timeout=30)
            resp.raise_for_status()
            return resp.json()
        except Exception as e:
            logger.error(f"context7 request error ({method}): {e}")
            return {}

    def _context7_extract_text(self, rpc_response: dict) -> str:
        """Extract plain text from a tools/call JSON-RPC response."""
        result = rpc_response.get("result", {})
        content = result.get("content", [])
        parts = [c.get("text", "") for c in content if c.get("type") == "text"]
        return "\n".join(parts).strip() or "No documentation found."

    def _c64ref_get_docs(self, topic: str) -> str:
        """
        Retrieve C64 reference documentation for *topic* from context7.
        Uses the pre-resolved library ID for https://github.com/mist64/c64ref.
        """
        response = self._context7_request(
            method="tools/call",
            params={
                "name": "get-library-docs",
                "arguments": {
                    "context7CompatibleLibraryID": self._C64REF_LIBRARY_ID,
                    "topic": topic,
                    "tokens": 5000,
                },
            },
            request_id=2,
        )
        return self._context7_extract_text(response)

    def _initialize_context7_tools(self):
        """Add the context7 C64-reference documentation tool to self.tools."""
        api_key = os.getenv('CONTEXT7_API_KEY')
        if not api_key:
            logger.info("CONTEXT7_API_KEY not set, context7 tool disabled")
            return

        try:
            from langchain_core.tools import Tool

            c64ref_tool = Tool(
                name="c64_reference_docs",
                description=(
                    "Retrieve authoritative Commodore 64 reference documentation "
                    "(CPU opcodes, memory map, SID/VIC registers, KERNAL routines, etc.) "
                    "from the c64ref project (https://github.com/mist64/c64ref). "
                    "Input is the topic or keyword to look up, e.g. 'SID registers', "
                    "'6502 opcodes', 'memory map', 'KERNAL vectors'."
                ),
                func=self._c64ref_get_docs,
            )

            self.tools.append(c64ref_tool)
            logger.info("context7 c64_reference_docs tool initialized (library: %s)",
                        self._C64REF_LIBRARY_ID)

        except ImportError as e:
            logger.warning(f"langchain_core not available for context7 tool: {e}")
        except Exception as e:
            logger.error(f"Error initializing context7 tool: {e}")

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
        if state.get('active_module') == 'i':
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
                state['active_module'] = 'i'
                return "Chat mode. I'm listening."
        elif state.get('active_module') == 'i':
            query = t
        else:
            # This should not be reached if can_handle is correct
            return self._fallback_response("Internal error: handle called unexpectedly.")

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
                HumanMessage(content=query)
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
