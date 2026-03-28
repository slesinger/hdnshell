"""
Template for the default cloud_config.cfg that lives inside
workspace/.config/cloud_config.cfg

All configuration — including secrets — is stored in this single file.
"""

# All known config keys with their default values.
# Every key listed here is persisted to cloud_config.cfg.
CONFIG_DEFAULTS = {
    # ── General ──
    "last_c64_ip": "",
    "server_ip": "",
    "user_name": "",
    # ── Chat LLM ──
    "chat_llm_provider": "",
    "chat_llm_endpoint": "",
    "chat_llm_model": "",
    "CHAT_LLM_API_KEY": "",
    "CHAT_LLM_API_VERSION": "",
    "CHAT_LLM_PROJECT_ID": "",
    "CHAT_LLM_LOCATION": "",
    "CHAT_LLM_SERVICE_ACCOUNT_JSON": "",
    # ── Code LLM ──
    "code_llm_provider": "",
    "code_llm_endpoint": "",
    "code_llm_model": "",
    "code_llm_same_as_chat": "false",
    "CODE_LLM_API_KEY": "",
    "CODE_LLM_API_VERSION": "",
    "CODE_LLM_PROJECT_ID": "",
    "CODE_LLM_LOCATION": "",
    "CODE_LLM_SERVICE_ACCOUNT_JSON": "",
    # ── Backup LLM ──
    "backup_llm_provider": "",
    "backup_llm_endpoint": "",
    "backup_llm_model": "",
    "BACKUP_LLM_API_KEY": "",
    "BACKUP_LLM_API_VERSION": "",
    "BACKUP_LLM_PROJECT_ID": "",
    "BACKUP_LLM_LOCATION": "",
    "BACKUP_LLM_SERVICE_ACCOUNT_JSON": "",
    # ── LangSmith ──
    "LANGSMITH_TRACING": "false",
    "LANGSMITH_ENDPOINT": "https://api.smith.langchain.com",
    "LANGSMITH_API_KEY": "",
    "LANGSMITH_PROJECT": "",
    # ── Google Vertex AI service account ──
    "GOOGLE_APPLICATION_CREDENTIALS": "",
    # ── SerpAPI ──
    "SERPAPI_API_KEY": "",
    # ── Context7 ──
    "CONTEXT7_API_KEY": "",
    # ── CSDB.dk ──
    "CSDB_USER": "",
    "CSDB_PASSWORD": "",
    # ── Telegram ──
    "TELEGRAM_API_ID": "",
    "TELEGRAM_API_HASH": "",
    "TELEGRAM_PHONE": "",
    "TIMEZONE": "UTC",
    # ── RSS Reader ──
    "rss_max_articles": "100",
    "rss_refresh_minutes": "5",
}

# Keys whose values should be masked (last 4 chars shown) in API responses.
SECRET_KEYS = [
    "CHAT_LLM_API_KEY",
    "CODE_LLM_API_KEY",
    "BACKUP_LLM_API_KEY",
    "CHAT_LLM_API_VERSION",
    "CODE_LLM_API_VERSION",
    "BACKUP_LLM_API_VERSION",
    "CHAT_LLM_SERVICE_ACCOUNT_JSON",
    "CODE_LLM_SERVICE_ACCOUNT_JSON",
    "BACKUP_LLM_SERVICE_ACCOUNT_JSON",
    "LANGSMITH_API_KEY",
    "GOOGLE_APPLICATION_CREDENTIALS",
    "SERPAPI_API_KEY",
    "CONTEXT7_API_KEY",
    "CSDB_PASSWORD",
    "TELEGRAM_API_ID",
    "TELEGRAM_API_HASH",
]

# Keys that must be pushed into os.environ so SDKs pick them up automatically.
ENV_OVERRIDE_KEYS = [
    "LANGSMITH_TRACING",
    "LANGSMITH_ENDPOINT",
    "LANGSMITH_API_KEY",
    "LANGSMITH_PROJECT",
    "GOOGLE_APPLICATION_CREDENTIALS",
]

# Boolean-valued keys stored without quotes in the config file.
_BOOLEAN_KEYS = {"code_llm_same_as_chat", "LANGSMITH_TRACING"}


def _generate_template() -> str:
    """Generate the seed config file content from CONFIG_DEFAULTS."""
    lines = []
    for key, default in CONFIG_DEFAULTS.items():
        if key in _BOOLEAN_KEYS:
            lines.append(f"{key} = {default}")
        else:
            lines.append(f'{key} = "{default}"')
    return "\n".join(lines) + "\n"


CLOUD_CONFIG_TEMPLATE = _generate_template()
