"""Server console applications package."""

from .code_chat_console import CodeChatConsole
from .coding_agent_console import CodingAgentConsole
from .file_editor_console import FileEditorConsole
from .rss_reader import RSSReaderConsole
from .telegram_chat import TelegramChatConsole
from .web_browser import WebBrowserConsole
from .wiki_browser import WikiBrowserConsole

__all__ = [
    "CodeChatConsole",
    "CodingAgentConsole",
    "FileEditorConsole",
    "RSSReaderConsole",
    "TelegramChatConsole",
    "WebBrowserConsole",
    "WikiBrowserConsole",
]
