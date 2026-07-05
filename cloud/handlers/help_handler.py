"""
HelpHandler - Handles help requests

Provides static help text or uses LLM to find relevant help topics.
Processes requests starting with "help"
"""

import json
import logging
import os

from sdk import BaseHandler

logger = logging.getLogger(__name__)

# System prompt for help search
HELP_SYSTEM_PROMPT = """You are a help system for a C64 Cloud Server.
Analyze the user's help query and provide the most relevant help information.
Keep responses concise and suitable for a C64 screen (40 columns).
Focus on available commands and their usage.
Provide your answer in the same language as the query. Only use ASCII characters without special characters."""

# Static help text

HELP_TEXT = """\x05HDN Shell RR - Help\x9a

\x9ehelp [topic]\x9a   Show help on a topic
\x9ehelp topics\x9a    List all help topics
\x9ei:<query>\x9a      Ask the AI assistant
\x9em:<phrase>\x9a     Search the manual
\x9ec:<query>\x9a      Search CSDB.dk
\x9e?<expr>\x9a        Evaluate Python expr
\x9estatus\x9a         Show connection state

Examples:
i: how do i mount a disk?
m: memcpy
c: latest releases
? 2 + 2

Any line that isn't a shell command
is sent to the AI assistant, so the
i: prefix above is optional.

For more, type: help topics"""


def _manifest_candidates():
    """
    Candidate paths for docs-manifest.json, deployed copy first.

    The cloud server ships cloud/static/docs/docs-manifest.json, so that
    copy is tried first. The repo docs/user_manual copy is the fallback
    (useful when running from a source checkout without the static mirror).
    """
    here = os.path.dirname(os.path.abspath(__file__))
    cloud_dir = os.path.abspath(os.path.join(here, ".."))
    repo_root = os.path.abspath(os.path.join(cloud_dir, ".."))
    return [
        os.path.join(cloud_dir, "static", "docs", "docs-manifest.json"),
        os.path.join(repo_root, "docs", "user_manual", "docs-manifest.json"),
    ]


def load_doc_topics():
    """
    Load the manual page list (slug + title) from docs-manifest.json.

    Tries the deployed static copy first, then the repo docs copy.
    Returns a list of (slug, title) tuples, or an empty list if no
    manifest could be found/parsed.
    """
    for path in _manifest_candidates():
        try:
            if not os.path.isfile(path):
                continue
            with open(path, "r", encoding="utf-8") as f:
                data = json.load(f)
            pages = data.get("pages", [])
            topics = [
                (page.get("slug", ""), page.get("title", ""))
                for page in pages
                if page.get("slug")
            ]
            if topics:
                logger.info("Loaded help topics from manifest: %s", path)
                return topics
        except Exception as e:
            logger.warning("Could not load docs manifest %s: %s", path, e)
    return []


def format_topics_list() -> str:
    """
    Build the "help topics" response: a compact list of topic slugs the
    user can pass to "help <topic>", formatted for a 40-column screen.
    """
    topics = load_doc_topics()

    lines = ["Help topics:", ""]

    if topics:
        # Manifest entries may repeat a slug (e.g. sub-page groupings),
        # so dedupe while keeping the first-seen order.
        seen = set()
        slugs = []
        for slug, _title in topics:
            if slug not in seen:
                seen.add(slug)
                slugs.append(slug)
    else:
        # Fallback: list the topics the handler already knows about
        slugs = sorted(HELP_TOPICS.keys())

    lines.extend(slugs)
    lines.append("")
    lines.append("Use: help <topic>")

    return "\n".join(lines)


# Help topics dictionary
HELP_TOPICS = {
    "chat": """Chat Command (I:)

Send questions or statements to an AI assistant.

Usage: I: <your message>

Examples:
  I: explain machine code
  I: how do I save a file?
  I: what is peek and poke?

The AI understands C64 context and will provide relevant answers.""",
    "python": """Python Eval Command (?)

Evaluate Python expressions and get results.

Usage: ? <expression>

Examples:
  ? 2 + 2
  ? 255 * 256
  ? hex(49152)
  ? bin(15)

Security: Only basic math and functions are allowed for safety.""",
    "csdb": """CSDB Command (c:)

Search the csdb.dk database for C64 releases, groups, and sceners.

Usage: c: <search query>

Examples:
  c:latest
  c:fairlight
  c:rob hubbard music

Returns information from the comprehensive C64 Scene Database.""",
    "manual": """Manual Search Command (m:)

Search this user manual directly, without
going through the AI assistant.

Usage: m: <search phrase>

Examples:
  m: memcpy
  m: mount disk
  m: csdb

Returns the most relevant manual paragraphs
for your phrase. Use "i:" instead if you want
a conversational answer rather than the raw
manual text.""",
    "commands": HELP_TEXT,
}


class HelpHandler(BaseHandler):
    """Handler for help requests"""

    def __init__(self):
        """Initialize HelpHandler with optional LLM support"""
        self.llm = None
        self._initialize_llm()

    def _initialize_llm(self):
        """Initialize LLM for help topic search using configured provider."""
        try:
            from llm_factory import create_llm_with_fallback

            self.llm = create_llm_with_fallback("chat")
            if self.llm:
                logger.info("HelpHandler initialized with LLM support")
        except Exception as e:
            logger.error(f"Error initializing help LLM: {e}")

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        """
        Check if text starts with "help"

        Args:
            text: UTF-8 text to check

        Returns:
            True if text starts with "help" (case-insensitive)
        """
        return text.strip().lower().startswith("help")

    def handle(self, text: str, session_id: int = 0) -> str:
        """
        Process help request

        Args:
            text: UTF-8 text (should start with "help")

        Returns:
            UTF-8 response text
        """

        # General help request
        if text.strip().lower() == "help":
            return HELP_TEXT

        # Remove "help" prefix and get topic
        parts = text.strip().split(maxsplit=1)
        topic = parts[1].strip().lower() if len(parts) > 1 else None

        if not topic:
            # Return general help
            return HELP_TEXT

        # "help topics" (lenient: also accept "help topic") lists the
        # available manual pages/topics
        if topic in ("topics", "topic"):
            return format_topics_list()

        # Check if topic exists in static help
        if topic in HELP_TOPICS:
            return HELP_TOPICS[topic]

        # Try LLM-based help search if available
        if self.llm:
            return self._search_help_with_llm(topic)

        # Fallback: suggest available topics
        available = ", ".join(sorted(HELP_TOPICS.keys()))
        return f"Unknown topic: {topic}\n\nAvailable topics: {available}"

    def _search_help_with_llm(self, topic: str) -> str:
        """
        Use LLM to find relevant help for the topic

        Args:
            topic: Help topic to search for

        Returns:
            Help text
        """
        try:
            from langchain_core.messages import HumanMessage, SystemMessage

            # Create prompt to search help topics
            topics_text = "\n\n".join(
                [f"Topic: {name}\n{content}" for name, content in HELP_TOPICS.items()]
            )

            query = f"""User is asking for help about: {topic}

Available help topics:
{topics_text}

Find the most relevant help topic and return its content. If no exact match, provide a brief explanation of what '{topic}' might relate to in the context of this C64 cloud server."""  # noqa

            messages = [
                SystemMessage(content=HELP_SYSTEM_PROMPT),
                HumanMessage(content=query),
            ]

            response = self.llm.invoke(messages)
            return response.content

        except Exception as e:
            logger.error(f"Error searching help with LLM: {e}")
            available = ", ".join(sorted(HELP_TOPICS.keys()))
            return f"Error searching help.\n\nAvailable topics: {available}"
