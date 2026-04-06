"""
Centralized configuration manager for HDN Cloud Server.

All configuration (including secrets) is stored in a single file:
  workspace/.config/cloud_config.cfg
"""

import os
import sys
import re
import logging

from .cloud_config_template import CONFIG_DEFAULTS, SECRET_KEYS, ENV_OVERRIDE_KEYS
from .cloud_config_template import CONFIG_DEFAULTS, SECRET_KEYS, ENV_OVERRIDE_KEYS
from .workspace import get_workspace_config_path
logger = logging.getLogger(__name__)

# Path where the old .env file used to live (used only for one-time migration)
_OLD_ENV_PATH = os.path.join(
    os.path.dirname(sys.executable) if getattr(sys, "frozen", False)
    else os.path.dirname(os.path.abspath(__file__)),
    ".env")

# Boolean-valued keys stored without quotes
_BOOLEAN_KEYS = {"code_llm_same_as_chat", "LANGSMITH_TRACING"}


# ── Config file (cloud_config.cfg) ──────────────────────────────────────────


def read_config() -> dict:
    """Read all settings from cloud_config.cfg, filling in defaults for missing keys."""
    config = dict(CONFIG_DEFAULTS)
    cfg_path = get_workspace_config_path()
    if not os.path.exists(cfg_path):
        return config
    try:
        with open(cfg_path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                if "=" not in line:
                    continue
                key, _, value = line.partition("=")
                key = key.strip()
                value = value.strip().strip('"')
                if key in CONFIG_DEFAULTS:
                    config[key] = value
    except OSError as e:
        logger.warning("Could not read config: %s", e)
    return config


def write_config(data: dict) -> None:
    """Write all settings to cloud_config.cfg."""
    cfg_path = get_workspace_config_path()
    os.makedirs(os.path.dirname(cfg_path), exist_ok=True)
    lines = []
    for key in CONFIG_DEFAULTS:
        value = data.get(key, CONFIG_DEFAULTS[key])
        if key in _BOOLEAN_KEYS:
            lines.append(f"{key} = {value}")
        else:
            lines.append(f'{key} = "{value}"')
    with open(cfg_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    logger.info("Config written to %s", cfg_path)


def migrate_config() -> None:
    """Add any missing keys from CONFIG_DEFAULTS to the existing config file.

    Also performs a one-time migration from .env if it exists.
    """
    cfg_path = get_workspace_config_path()

    # One-time migration: pull values from old .env into config
    _migrate_dotenv()

    if not os.path.exists(cfg_path):
        return
    existing = read_config()
    needs_write = False
    with open(cfg_path, "r", encoding="utf-8") as f:
        content = f.read()
    for key in CONFIG_DEFAULTS:
        if not re.search(rf"^\s*{re.escape(key)}\s*=", content, re.MULTILINE):
            needs_write = True
            break
    if needs_write:
        write_config(existing)
        logger.info("Migrated config with new keys")


def _migrate_dotenv() -> None:
    """If the old .env file exists, read its values and merge into cloud_config.cfg."""
    if not os.path.exists(_OLD_ENV_PATH):
        return

    logger.info("Found legacy .env file, migrating to cloud_config.cfg ...")
    env_values = {}
    try:
        with open(_OLD_ENV_PATH, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                if "=" not in line:
                    continue
                key, _, value = line.partition("=")
                key = key.strip()
                value = value.strip().strip('"').strip("'")
                if key in CONFIG_DEFAULTS:
                    env_values[key] = value
    except OSError as e:
        logger.warning("Could not read .env for migration: %s", e)
        return

    if not env_values:
        return

    # Merge: existing config values take precedence over .env only if non-empty
    config = read_config()
    for key, value in env_values.items():
        if not config.get(key):
            config[key] = value
    write_config(config)
    logger.info("Migrated %d keys from .env into cloud_config.cfg", len(env_values))


# ── Masking helpers ──────────────────────────────────────────────────────────


def mask_secret(value: str) -> str:
    """Mask a secret value for display, showing only last 4 chars."""
    if not value or len(value) <= 4:
        return "*" * len(value) if value else ""
    return "*" * (len(value) - 4) + value[-4:]


def get_merged_config() -> dict:
    """Return the full config for the API."""
    return read_config()


# ── Environment overrides ────────────────────────────────────────────────────


def apply_env_overrides() -> None:
    """Push selected config values into os.environ for SDKs that read them.

    This covers LANGSMITH_* (LangChain tracing) and GOOGLE_APPLICATION_CREDENTIALS
    (Google Cloud SDK / Vertex AI).
    """
    config = read_config()
    for key in ENV_OVERRIDE_KEYS:
        value = config.get(key, "")
        if value:
            os.environ[key] = value
        elif key in os.environ:
            del os.environ[key]
    logger.info("Environment overrides applied")


# ── LLM config helper ───────────────────────────────────────────────────────


def get_llm_config(role: str) -> dict:
    """Get LLM configuration for a specific role ('chat', 'code', 'backup').

    Returns a dict with keys: provider, endpoint, model, api_key,
    api_version, project_id, location, service_account_json.
    """
    config = read_config()

    # If code role and "same as chat" is enabled, use chat config
    if role == "code" and config.get("code_llm_same_as_chat", "false").lower() == "true":
        role = "chat"

    prefix = f"{role}_llm"
    secret_prefix = f"{role.upper()}_LLM"

    return {
        "provider": config.get(f"{prefix}_provider", ""),
        "endpoint": config.get(f"{prefix}_endpoint", ""),
        "model": config.get(f"{prefix}_model", ""),
        "api_key": config.get(f"{secret_prefix}_API_KEY", ""),
        "api_version": config.get(f"{secret_prefix}_API_VERSION", ""),
        "project_id": config.get(f"{secret_prefix}_PROJECT_ID", ""),
        "location": config.get(f"{secret_prefix}_LOCATION", ""),
        "service_account_json": config.get(f"{secret_prefix}_SERVICE_ACCOUNT_JSON", ""),
    }
