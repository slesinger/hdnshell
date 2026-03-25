"""
LLM Factory — create LangChain chat model instances from provider config.

Supported providers:
  - openai_compatible  (OpenAI, OpenRouter, local models)
  - anthropic          (Anthropic / Claude API)
  - gemini             (Google AI Studio / Gemini API)
  - gemini_vertexai    (Google Vertex AI)
  - azure_openai       (Azure OpenAI Service)
"""

import os
import logging

logger = logging.getLogger(__name__)

# Valid provider identifiers
PROVIDERS = [
    "openai_compatible",
    "anthropic",
    "gemini",
    "gemini_vertexai",
    "azure_openai",
]


def create_llm(
    provider: str,
    endpoint: str = "",
    api_key: str = "",
    model: str = "",
    api_version: str = "",
    project_id: str = "",
    location: str = "",
    service_account_json: str = "",
    temperature: float = 0.7,
):
    """Create a LangChain BaseChatModel for the given provider.

    Returns None if the provider is unknown or required credentials are missing.
    """
    if not provider:
        return None

    try:
        if provider == "openai_compatible":
            return _create_openai_compatible(endpoint, api_key, model, temperature)
        elif provider == "anthropic":
            return _create_anthropic(api_key, model, temperature)
        elif provider == "gemini":
            return _create_gemini(api_key, model, temperature)
        elif provider == "gemini_vertexai":
            return _create_gemini_vertexai(project_id, location, model, temperature, service_account_json)
        elif provider == "azure_openai":
            return _create_azure_openai(endpoint, api_key, model, api_version, temperature)
        else:
            logger.warning("Unknown LLM provider: %s", provider)
            return None
    except ImportError as e:
        logger.error("Missing dependency for provider '%s': %s", provider, e)
        return None
    except Exception as e:
        logger.error("Failed to create LLM for provider '%s': %s", provider, e)
        return None


def _create_openai_compatible(endpoint: str, api_key: str, model: str, temperature: float):
    """OpenAI-compatible endpoint (also works for OpenRouter, local models)."""
    if not api_key or not model:
        logger.warning("OpenAI-compatible requires api_key and model")
        return None
    from langchain_openai import ChatOpenAI

    kwargs = {
        "model": model,
        "api_key": api_key,
        "temperature": temperature,
    }
    if endpoint:
        kwargs["base_url"] = endpoint
    return ChatOpenAI(**kwargs)


def _create_anthropic(api_key: str, model: str, temperature: float):
    """Anthropic Claude API."""
    if not api_key or not model:
        logger.warning("Anthropic requires api_key and model")
        return None
    from langchain_anthropic import ChatAnthropic

    return ChatAnthropic(
        model=model,
        api_key=api_key,
        temperature=temperature,
    )


def _create_gemini(api_key: str, model: str, temperature: float):
    """Google AI Studio (Gemini API key)."""
    if not api_key or not model:
        logger.warning("Gemini requires api_key and model")
        return None
    from langchain_google_genai import ChatGoogleGenerativeAI

    return ChatGoogleGenerativeAI(
        model=model,
        google_api_key=api_key,
        temperature=temperature,
    )


def _create_gemini_vertexai(project_id: str, location: str, model: str, temperature: float, service_account_json: str = ""):
    """Google Vertex AI (uses ADC or service account)."""
    if not model:
        logger.warning("Gemini VertexAI requires model")
        return None

    # If a service account JSON path is provided, set it in the environment
    # so the Google SDK picks it up automatically.
    if service_account_json:
        os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = service_account_json

    from langchain_google_vertexai import ChatVertexAI

    kwargs = {
        "model_name": model,
        "temperature": temperature,
    }
    if project_id:
        kwargs["project"] = project_id
    if location:
        kwargs["location"] = location
    return ChatVertexAI(**kwargs)


def _create_azure_openai(endpoint: str, api_key: str, model: str, api_version: str, temperature: float):
    """Azure OpenAI Service."""
    if not api_key or not endpoint or not model:
        logger.warning("Azure OpenAI requires endpoint, api_key, and model (deployment name)")
        return None
    from langchain_openai import AzureChatOpenAI

    return AzureChatOpenAI(
        azure_deployment=model,
        api_version=api_version or "2024-02-15-preview",
        azure_endpoint=endpoint,
        api_key=api_key,
        temperature=temperature,
    )


def create_llm_from_config(role: str, temperature: float = 0.7):
    """Create an LLM from the saved configuration for a given role.

    Args:
        role: 'chat', 'code', or 'backup'
        temperature: LLM temperature setting

    Returns:
        A LangChain BaseChatModel instance, or None if configuration is incomplete.
    """
    from config_manager import get_llm_config

    cfg = get_llm_config(role)
    if not cfg["provider"]:
        return None
    return create_llm(
        provider=cfg["provider"],
        endpoint=cfg["endpoint"],
        api_key=cfg["api_key"],
        model=cfg["model"],
        api_version=cfg["api_version"],
        project_id=cfg["project_id"],
        location=cfg["location"],
        service_account_json=cfg.get("service_account_json", ""),
        temperature=temperature,
    )


def create_llm_with_fallback(role: str, temperature: float = 0.7):
    """Create an LLM for the given role, falling back to backup if primary fails.

    Also falls back to legacy AZURE_OPENAI_* env vars if no config is set.

    Returns:
        A LangChain BaseChatModel instance, or None.
    """
    # Try configured provider first
    llm = create_llm_from_config(role, temperature)
    if llm is not None:
        return llm

    # Try backup LLM
    if role != "backup":
        backup = create_llm_from_config("backup", temperature)
        if backup is not None:
            logger.info("Using backup LLM for role '%s'", role)
            return backup

    # Legacy fallback: read AZURE_OPENAI_* environment variables
    azure_key = os.getenv("AZURE_OPENAI_API_KEY")
    azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
    azure_deployment = os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME")
    azure_version = os.getenv("AZURE_OPENAI_API_VERSION", "2024-02-15-preview")

    if azure_key and azure_endpoint and azure_deployment:
        logger.info("Using legacy AZURE_OPENAI_* env vars for role '%s'", role)
        return _create_azure_openai(azure_endpoint, azure_key, azure_deployment, azure_version, temperature)

    return None


def test_llm_completion(role: str) -> dict:
    """Test an LLM by sending 'Just say HONDANI' and returning the result.

    Returns:
        dict with 'success' (bool), 'response' (str), and optionally 'error' (str).
    """
    from config_manager import get_llm_config

    cfg = get_llm_config(role)
    if not cfg["provider"]:
        return {"success": False, "error": "No provider configured for this role."}

    try:
        llm = create_llm(
            provider=cfg["provider"],
            endpoint=cfg["endpoint"],
            api_key=cfg["api_key"],
            model=cfg["model"],
            api_version=cfg["api_version"],
            project_id=cfg["project_id"],
            location=cfg["location"],
            service_account_json=cfg.get("service_account_json", ""),
            temperature=0.0,
        )
        if llm is None:
            return {"success": False, "error": "Could not create LLM instance. Check credentials."}

        response = llm.invoke("Just say 'HONDANI'")
        return {"success": True, "response": response.content}
    except Exception as e:
        logger.error("LLM test failed for role '%s': %s", role, e)
        return {"success": False, "error": str(e)}
