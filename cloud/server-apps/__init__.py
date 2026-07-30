"""Server console applications package."""

from .code_chat_console import CodeChatConsole
from .coding_agent_console import CodingAgentConsole
from .file_editor_console import FileEditorConsole
from .mail_client import MailClientConsole
from .rss_reader import RSSReaderConsole
from .telegram_chat import TelegramChatConsole
from .web_browser import WebBrowserConsole
from .whatsapp_chat import WhatsAppChatConsole
from .wiki_browser import WikiBrowserConsole

__all__ = [
    "CodeChatConsole",
    "CodingAgentConsole",
    "FileEditorConsole",
    "MailClientConsole",
    "RSSReaderConsole",
    "TelegramChatConsole",
    "WebBrowserConsole",
    "WhatsAppChatConsole",
    "WikiBrowserConsole",
]
