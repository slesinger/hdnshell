"""
Shared LangChain tool factories for cloud agents.

Provides reusable tool builders for:
  - SerpAPI web search  (create_websearch_tool)
  - Context7 C64 reference docs  (create_c64ref_tool)
  - Source file read/write  (read_source_file / create_write_source_tool)
  - Oscar64 documentation files  (create_oscar64_*_tool)
"""

import subprocess
import os
import sys
import shutil
import logging
import re
import json
import asyncio
import threading
from langchain_core.tools import Tool
from langchain_community.utilities import SerpAPIWrapper
from workspace_init import WORKSPACE_DIR

logger = logging.getLogger(__name__)

DEFAULT_SHELL_TIMEOUT_SECONDS = 60
MAX_SHELL_OUTPUT_LINES = 200
PROJECT_NAME_RE = re.compile(r"[A-Za-z0-9][A-Za-z0-9_-]*")

_WRITE_OR_DESTRUCTIVE_PATTERNS = [
    re.compile(
        r"(^|[;&|]\s*)(rm|mv|cp|dd|mkfs|fdisk|parted|wipefs|truncate|touch|mkdir|rmdir)\b",
        re.IGNORECASE,
    ),
    re.compile(r"(^|[;&|]\s*)(sed|perl)\s+-i\b", re.IGNORECASE),
    re.compile(r"\btee\b", re.IGNORECASE),
    re.compile(r"(>|>>)\s*\S+", re.IGNORECASE),
    re.compile(r"\bfind\b.*\-delete\b", re.IGNORECASE),
    re.compile(r"\bgit\s+(reset|clean|checkout)\b", re.IGNORECASE),
]


def _wrap_with_logging(tool_name: str, func):
    """Wrap a tool function with DEBUG logging of input and output."""

    def wrapped(*args, **kwargs):
        inp = args[0] if len(args) == 1 and not kwargs else (args, kwargs)
        logger.debug("[TOOL] %s | input: %r", tool_name, inp)
        result = func(*args, **kwargs)
        out = result[:200] if isinstance(result, str) else result
        logger.debug("[TOOL] %s | output: %r", tool_name, out)
        return result

    return wrapped


def validate_project_name(project_name: str) -> str | None:
    """Return an error message if *project_name* is unsafe for workspace scaffolds."""
    name = (project_name or "").strip()
    if not name:
        return "project name is required."
    if not PROJECT_NAME_RE.fullmatch(name):
        return (
            "project name must use only letters, digits, '-' or '_' "
            "and must not start with punctuation."
        )
    return None


def get_workspace_oscar_dir() -> str:
    """Return the writable workspace oscar directory used by the coding agent."""
    return os.path.join(WORKSPACE_DIR, "oscar")


def get_workspace_project_dir(project_name: str) -> str:
    """Return the absolute workspace path for a scaffolded Oscar project."""
    return os.path.join(get_workspace_oscar_dir(), project_name.strip())


def create_project_scaffold(project_name: str) -> tuple[str, list[str]]:
    """Create a new Oscar project scaffold in workspace/oscar/<name>."""
    err = validate_project_name(project_name)
    if err:
        raise ValueError(err)

    name = project_name.strip()
    oscar_dir = get_workspace_oscar_dir()
    project_dir = get_workspace_project_dir(name)
    c_filename = f"{name}.c"
    md_filename = f"{name}.md"

    os.makedirs(oscar_dir, exist_ok=True)
    if os.path.exists(project_dir):
        raise ValueError(f"project already exists: {project_dir}")

    os.makedirs(project_dir, exist_ok=False)

    c_path = os.path.join(project_dir, c_filename)
    md_path = os.path.join(project_dir, md_filename)

    with open(c_path, "w", encoding="utf-8") as f:
        f.write(
            "#include <stdio.h>\n\n"
            "int main(void)\n"
            "{\n"
            f'    printf("{name}\\n");\n'
            "    return 0;\n"
            "}\n"
        )

    with open(md_path, "w", encoding="utf-8") as f:
        f.write(
            f"# {name}\n\n"
            "## Overview\n\n"
            "Describe the project goal and expected behavior.\n\n"
            "## Files\n\n"
            f"- `{c_filename}`: main project source\n"
            f"- `{md_filename}`: project notes and progress\n\n"
            "## Build Notes\n\n"
            "Record compiler options, runtime assumptions, and test steps.\n\n"
            "## TODO\n\n"
            "- Define the first milestone\n"
            "- Document any hardware constraints\n"
            "- Track follow-up tasks\n"
        )

    logger.info("Created project scaffold at %s", project_dir)
    return project_dir, [c_filename, md_filename]


# ------------------------------------------------------------------
# Web search
# ------------------------------------------------------------------


def create_websearch_tool():
    """
    Build and return a LangChain Tool for SerpAPI web search, or None if
    SERPAPI_API_KEY is not set / dependencies are missing.
    """
    from sdk.config_manager import read_config

    serpapi_key = read_config().get("SERPAPI_API_KEY", "")
    if not serpapi_key:
        logger.info("SERPAPI_API_KEY not set, web search disabled")
        return None
    try:
        search = SerpAPIWrapper(serpapi_api_key=serpapi_key)
        tool = Tool(
            name="web_search",
            description=(
                "Search the EXTERNAL web for information that cannot be found "
                "in the Hondani Shell manual or C64 reference docs. "
                "Use ONLY for topics unrelated to the Hondani Shell, its commands, "
                "CSDB, C64 hardware, or 6502 programming. "
                "Do NOT use for shell usage questions, CSDB browsing, "
                "listing releases, or any feature of the Hondani Shell."
            ),
            func=_wrap_with_logging("web_search", search.run),
        )
        logger.info("SerpAPI search tool initialized")
        return tool

    except ImportError as e:
        logger.warning("SerpAPI tools not available: %s", e)
    except Exception as e:
        logger.error("Error initializing web search tool: %s", e)
    return None


# ------------------------------------------------------------------
# Context7 C64 reference docs
# ------------------------------------------------------------------

# Pre-resolved Context7 library ID for https://github.com/mist64/c64ref
C64REF_LIBRARY_ID = "/mist64/c64ref"


def _extract_text_like_payload(value) -> str:
    """Best-effort extraction of user-facing text from tool outputs."""
    if value is None:
        return ""
    if isinstance(value, str):
        return value.strip()
    if isinstance(value, (int, float, bool)):
        return str(value)
    if isinstance(value, list):
        parts = [_extract_text_like_payload(item) for item in value]
        return "\n".join([p for p in parts if p]).strip()
    if isinstance(value, dict):
        # Common MCP/LangChain shapes
        if "text" in value and isinstance(value["text"], str):
            return value["text"].strip()
        if "content" in value:
            return _extract_text_like_payload(value["content"])
        if "result" in value:
            return _extract_text_like_payload(value["result"])
        # Fallback to JSON for unknown shapes
        return json.dumps(value, ensure_ascii=True)

    content = getattr(value, "content", None)
    if content is not None:
        return _extract_text_like_payload(content)

    return str(value)


def _run_coro_sync(coro):
    """Run async code from sync context, including when an event loop already exists."""
    try:
        asyncio.get_running_loop()
    except RuntimeError:
        return asyncio.run(coro)

    container = {"value": None, "error": None}

    def _thread_runner():
        try:
            container["value"] = asyncio.run(coro)
        except Exception as e:  # pragma: no cover - safety net
            container["error"] = e

    t = threading.Thread(target=_thread_runner, daemon=True)
    t.start()
    t.join()

    if container["error"] is not None:
        raise container["error"]
    return container["value"]


async def _c64ref_get_docs_via_mcp_async(topic: str, api_key: str) -> str:
    """Query Context7 docs using a single MCP session per request."""
    from langchain_mcp_adapters.client import MultiServerMCPClient

    headers = {
        # Context7 accepts these auth header variants.
        "Context7-API-Key": api_key,
        "CONTEXT7_API_KEY": api_key,
    }

    client = MultiServerMCPClient(
        {
            "context7": {
                "transport": "streamable_http",
                "url": "https://mcp.context7.com/mcp",
                "headers": headers,
            }
        },
        tool_name_prefix=False,
        handle_tool_errors=True,
    )

    async with client.session("context7") as session:
        tools_result = await session.list_tools()
        available_names = [tool.name for tool in tools_result.tools]
        if "query-docs" not in available_names:
            return (
                "Context7 MCP error: 'query-docs' tool not available. "
                f"Available tools: {', '.join(available_names)}"
            )

        result = await session.call_tool(
            "query-docs",
            {"libraryId": C64REF_LIBRARY_ID, "query": topic},
        )

    text = _extract_text_like_payload(result)
    return text.strip() or "No documentation found."


# ------------------------------------------------------------------
# C64 reference docs tool factory
# ------------------------------------------------------------------
def c64ref_get_docs(topic: str) -> str:
    """
    Retrieve C64 reference documentation for *topic* from Context7.
    Uses the pre-resolved library ID for https://github.com/mist64/c64ref.
    """
    from sdk.config_manager import read_config

    query = (topic or "").strip() or "Commodore 64 reference overview"
    api_key = read_config().get("CONTEXT7_API_KEY", "")
    if not api_key:
        return "CONTEXT7_API_KEY is not configured."

    try:
        return _run_coro_sync(_c64ref_get_docs_via_mcp_async(query, api_key))
    except ImportError as e:
        logger.warning("Context7 MCP adapter dependencies missing: %s", e)
        return (
            "Context7 MCP adapter dependencies are missing. "
            "Install 'langchain-mcp-adapters' and 'mcp'."
        )
    except Exception as e:
        logger.error("Context7 MCP adapter request failed: %s", e)
        return f"Context7 request failed: {e}"


def create_c64ref_tool():
    """
    Build and return a LangChain Tool for C64 reference docs via Context7,
    or None if CONTEXT7_API_KEY is not set / dependencies are missing.
    """
    from sdk.config_manager import read_config

    api_key = read_config().get("CONTEXT7_API_KEY", "")
    if not api_key:
        logger.info("CONTEXT7_API_KEY not set, context7 tool disabled")
        return None

    try:
        tool = Tool(
            name="c64_reference_docs",
            description=(
                "Retrieve authoritative Commodore 64 reference documentation "
                "(CPU opcodes, memory map, SID/VIC registers, KERNAL routines, etc.) "
                "from the c64ref project (https://github.com/mist64/c64ref). "
                "Input is the topic or keyword to look up, e.g. 'SID registers', "
                "'6502 opcodes', 'memory map', 'KERNAL vectors'."
            ),
            func=_wrap_with_logging("c64_reference_docs", c64ref_get_docs),
        )
        logger.info(
            "context7 c64_reference_docs tool initialized (library: %s)",
            C64REF_LIBRARY_ID,
        )
        return tool

    except ImportError as e:
        logger.warning("langchain_core not available for context7 tool: %s", e)
    except Exception as e:
        logger.error("Error initializing context7 tool: %s", e)
    return None


# ------------------------------------------------------------------ #
# Hondani Shell user manual tool                                       #
# ------------------------------------------------------------------ #


_MANUAL_QUERY_STOPWORDS = {
    "a",
    "an",
    "and",
    "are",
    "can",
    "do",
    "for",
    "from",
    "help",
    "how",
    "i",
    "image",
    "in",
    "is",
    "it",
    "me",
    "of",
    "on",
    "please",
    "shell",
    "the",
    "to",
    "use",
    "with",
}


def _manual_query_tokens(topic: str) -> list[str]:
    words = re.findall(r"[a-z0-9]+", (topic or "").lower())
    tokens = []
    for word in words:
        if len(word) <= 1:
            continue
        if word in _MANUAL_QUERY_STOPWORDS:
            continue
        if word not in tokens:
            tokens.append(word)
    return tokens


def _try_semantic_search(topic: str, manual_content: dict, top_k: int = 12):
    """Best-effort semantic search; returns None on any failure/unavailability.

    Kept as a thin wrapper so search_manual never has to know about the
    embeddings machinery in sdk.semantic_search, and any import/runtime
    failure there degrades to the existing keyword search path.
    """
    try:
        from sdk.semantic_search import semantic_search
    except Exception as e:
        logger.info("Semantic search module unavailable: %s", e)
        return None

    try:
        return semantic_search(topic, manual_content, top_k=top_k)
    except Exception as e:
        logger.info("Semantic search failed, falling back to keyword search: %s", e)
        return None


def search_manual(topic: str, manual_content: dict) -> str:
    """
    Search the in-memory user manual for *topic*.

    If *topic* is empty or "all", returns the full concatenated manual.
    Tries semantic (embedding-based) search first; if that yields ranked
    paragraphs, they are returned. Otherwise falls back to keyword scoring,
    and finally to the full manual if nothing matches either approach.
    """
    if not manual_content:
        return "User manual is not available."

    topic = (topic or "").strip()
    keyword = topic.lower()

    if not keyword or keyword == "all":
        sections = [
            f"=== {fname} ===\n{text}" for fname, text in manual_content.items()
        ]
        return "\n\n".join(sections)

    semantic_results = _try_semantic_search(topic, manual_content)
    if semantic_results:
        results = [f"=== {fname} ===\n{para}" for _, fname, para in semantic_results]
        return "\n\n".join(results)

    tokens = _manual_query_tokens(keyword)
    if not tokens:
        tokens = [keyword]

    # Word-boundary matches ("`ll`" for keyword "ll") outscore plain substring
    # matches ("directly" for keyword "dir") so short exact command names
    # like "ll" or "dir" don't get buried under unrelated words that merely
    # contain those letters.
    keyword_boundary = re.compile(r"\b" + re.escape(keyword) + r"\b")
    token_boundaries = [re.compile(r"\b" + re.escape(tok) + r"\b") for tok in tokens]

    try:
        from sdk.semantic_search import chunk_manual

        chunks = chunk_manual(manual_content)
    except Exception:
        chunks = [
            (fname, para.strip())
            for fname, text in manual_content.items()
            for para in text.split("\n\n")
            if para.strip()
        ]

    ranked = []
    for fname, para_clean in chunks:
        haystack = para_clean.lower()
        score = 0

        if keyword_boundary.search(haystack):
            score += 10
        elif keyword in haystack:
            score += 4

        for token, token_boundary in zip(tokens, token_boundaries):
            if token_boundary.search(haystack):
                score += 3
            elif token in haystack:
                score += 1
            if token in fname.lower():
                score += 1

        if score > 0:
            ranked.append((score, fname, para_clean))

    if ranked:
        ranked.sort(key=lambda item: item[0], reverse=True)
        top_matches = ranked[:12]
        results = [f"=== {fname} ===\n{para}" for _, fname, para in top_matches]
        return "\n\n".join(results)

    logger.info(
        "Manual search: no paragraphs matched '%s', returning full manual", topic
    )
    sections = [f"=== {fname} ===\n{text}" for fname, text in manual_content.items()]
    return "\n\n".join(sections)


def create_manual_tool(manual_content: dict):
    """
    Build and return a LangChain Tool for the Hondani Shell user manual,
    or None if manual_content is empty / dependencies are missing.
    """
    if not manual_content:
        logger.info("User manual not loaded, manual tool disabled")
        return None
    try:
        tool = Tool(
            name="hondani_shell_manual",
            description=(
                "ALWAYS use this tool first for any question about the Hondani Shell user manual "
                "(hdnsh), its commands, or its features. "
                "Covers: shell commands (mnt, umnt, cd, pwd, l, ll, r, run, m, hash, at, "
                "frz, reset, info, time, mkdir, empty), file operations, disk mounting, "
                "CSDB browsing and latest releases, cloud/AI integration, "
                "memory operations, executing programs, installation, and general usage. "
                "Input is a keyword or topic, e.g. 'mount', 'csdb', 'latest releases', "
                "'file operations', 'memory', 'cloud', 'installation', 'commands'. "
                "Use 'all' to retrieve the complete manual."
            ),
            func=_wrap_with_logging(
                "hondani_shell_manual",
                lambda topic: search_manual(topic, manual_content),
            ),
        )
        logger.info(
            "hondani_shell_manual tool initialized (%d files)", len(manual_content)
        )
        return tool
    except ImportError as e:
        logger.warning("langchain_core not available for manual tool: %s", e)
    except Exception as e:
        logger.error("Error initializing manual tool: %s", e)
    return None


# ------------------------------------------------------------------
# Code compilation tool
# ------------------------------------------------------------------


def compile_code(program_name: str) -> str:
    """
    Execute Compile command: cd oscar && bin/oscar64 <program name>/<program name>.c
    Return the compiler output (success message or error details).
    """

    program_name = program_name.strip()
    if not program_name:
        return "Error: program_name must not be empty."

    oscar_dir = _resolve_oscar_dir(require_compiler=True)
    compiler = os.path.join(oscar_dir, "bin", "oscar64")
    source_file = os.path.join("projects", program_name, f"{program_name}.c")

    if not os.path.isfile(compiler):
        print(f"Error: oscar64 compiler not found at {compiler}")
        return f"Error: compiler not found at {compiler}"

    try:
        result = subprocess.run(
            [compiler, source_file],
            cwd=oscar_dir,
            capture_output=True,
            text=True,
            timeout=60,
        )
        output = (result.stdout + result.stderr).strip()
        if result.returncode == 0:
            return (
                f"Compilation successful.\n{output}"
                if output
                else "Compilation successful."
            )
        else:
            return f"Compilation failed (exit {result.returncode}).\n{output}"
    except subprocess.TimeoutExpired:
        return "Error: compiler timed out after 60 seconds."
    except Exception as e:
        return f"Error running compiler: {e}"


# ------------------------------------------------------------------
# PRG run tool
# ------------------------------------------------------------------


def _read_last_c64_ip() -> str:
    """Read the last known C64 IP from cloud_config.cfg."""
    from workspace_init import get_workspace_config_path

    config_path = get_workspace_config_path()
    if not os.path.isfile(config_path):
        return ""
    with open(config_path, "r") as f:
        for line in f:
            if line.startswith("last_c64_ip"):
                return line.split("=", 1)[1].strip().strip('"')
    return ""


def run_prg(project_name: str) -> str:
    """Upload and run the compiled .prg on the C64 via DMA + RUN keyboard inject."""
    project_name = project_name.strip()
    if not project_name:
        return "Error: project_name must not be empty."

    oscar_dir = _resolve_oscar_dir()
    prg_path = os.path.join(oscar_dir, "projects", project_name, f"{project_name}.prg")

    if not os.path.isfile(prg_path):
        return f"Error: .prg file not found at {prg_path}. Compile first."

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    try:
        from sdk.network_helper import send_dmawrite

        with open(prg_path, "rb") as f:
            prg_data = f.read()
        send_dmawrite(c64_ip, prg_data)
        return f"Program '{project_name}' loaded to C64 memory."
    except Exception as e:
        return f"Error sending .prg to C64: {e}"


def create_run_tool(project_name: str):
    """Factory for a tool that uploads and runs the compiled PRG on the C64 Ultimate."""
    if not project_name or not project_name.strip():
        logger.info("project_name not provided, run tool disabled")
        return None

    project_name = project_name.strip()
    try:
        tool = Tool(
            name="run_prg",
            description=(
                "Upload and run the compiled .prg program on the real C64 Ultimate "
                "hardware via its REST API. Call this after a successful compilation."
            ),
            func=_wrap_with_logging("run_prg", lambda _: run_prg(project_name)),
        )
        logger.info("run_prg tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing run_prg tool: %s", e)
    return None


# ------------------------------------------------------------------
# Source file read / write helpers
# ------------------------------------------------------------------


def _source_file_path(project_name: str) -> str:
    """Return the absolute path to the project's C source file."""
    # Prefer workspace/oscar so packaged and dev behavior stays consistent.
    oscar_dir = _resolve_oscar_dir(prefer_workspace=True)
    return os.path.join(oscar_dir, "projects", project_name, f"{project_name}.c")


def read_source_file(project_name: str) -> str:
    """
    Read and return the current contents of the project's C source file.
    Returns an empty string if the file does not exist yet.
    """
    path = _source_file_path(project_name)
    if not os.path.isfile(path):
        return ""
    with open(path, "r") as f:
        return f.read()


def write_source_file(project_name: str, code: str) -> str:
    """
    Overwrite the project's C source file with *code*.
    Creates the project directory if it doesn't exist.
    Returns a confirmation message.
    """
    path = _source_file_path(project_name)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w") as f:
        f.write(code)
    logger.info("Wrote %d bytes to %s", len(code), path)
    return f"Source file written ({len(code)} bytes): {path}"


def create_write_source_tool(project_name: str):
    """
    Factory for a tool that writes the FULL C source file to disk.
    The agent must always output the complete file content (no diffs/patches).
    """
    if not project_name or not project_name.strip():
        logger.info("project_name not provided, write_source tool disabled")
        return None

    project_name = project_name.strip()
    try:
        tool = Tool(
            name="write_source",
            description=(
                "Write the FULL updated C source code to the project file. "
                "Input MUST be the COMPLETE source code for the .c file "
                "(not a diff, patch, or partial snippet). "
                "Always call this tool after making any code changes."
            ),
            func=_wrap_with_logging(
                "write_source", lambda code: write_source_file(project_name, code)
            ),
        )
        logger.info("write_source tool initialized for project '%s'", project_name)
        return tool
    except Exception as e:
        logger.error("Error initializing write_source tool: %s", e)
    return None


def create_compile_tool(project_name: str):
    """Factory for a code compilation tool
    Compiler is located in directory: bin/oscar64
    Compile command: cd oscar && bin/oscar64 projects/<program name>/<program name>.c
    Compiler documentation: oscar/docs/oscar64.md
    """
    if not project_name or not project_name.strip():
        logger.info("project_name not provided, compile tool disabled")
        return None

    project_name = project_name.strip()
    oscar_dir = _resolve_oscar_dir(require_compiler=True)
    project_dir = os.path.join(oscar_dir, "projects", project_name)
    source_file = os.path.join(project_dir, f"{project_name}.c")

    if not os.path.isdir(project_dir):
        os.makedirs(project_dir, exist_ok=True)
        logger.info("Created project directory: %s", project_dir)

    if not os.path.isfile(source_file):
        with open(source_file, "w") as f:
            f.write(
                f"/*\n * {project_name} - Commodore C64\n */\n\n#include <stdio.h>\n\nint main(void)\n{{\n    return 0;\n}}\n"
            )
        logger.info("Created source file: %s", source_file)

    try:
        tool = Tool(
            name="compile_code",
            description="Compile a C64 program using the Oscar64 compiler.",
            func=_wrap_with_logging(
                "compile_code", lambda _: compile_code(project_name)
            ),
        )
        logger.info("compile_code tool initialized")
        return tool
    except ImportError as e:
        logger.warning("langchain_core not available for compile tool: %s", e)
    except Exception as e:
        logger.error("Error initializing compile tool: %s", e)
    return None


# ------------------------------------------------------------------
# Oscar64 documentation file tools
# ------------------------------------------------------------------


def _oscar_base_candidates() -> list[str]:
    """Return likely Oscar64 base directories in priority order."""
    candidates: list[str] = []

    # Canonical runtime location (works in development and packaged mode).
    try:
        from workspace_init import WORKSPACE_DIR

        candidates.append(os.path.join(WORKSPACE_DIR, "oscar"))
    except Exception:
        pass

    if getattr(sys, "frozen", False):
        # Packaged fallback: bundled read-only assets in temporary extraction dir.
        candidates.append(os.path.join(sys._MEIPASS, "oscar"))
    else:
        cloud_dir = os.path.dirname(os.path.abspath(__file__))
        workspace_root = os.path.dirname(cloud_dir)
        # Dev fallbacks.
        candidates.extend(
            [
                os.path.join(cloud_dir, "oscar"),
                os.path.join(workspace_root, "oscar"),
            ]
        )

    # De-duplicate while preserving order.
    unique: list[str] = []
    seen = set()
    for c in candidates:
        if c and c not in seen:
            unique.append(c)
            seen.add(c)
    return unique


def _resolve_oscar_dir(
    prefer_workspace: bool = False, require_compiler: bool = False
) -> str:
    """Resolve the Oscar root directory according to runtime priorities."""
    candidates = _oscar_base_candidates()
    if not candidates:
        return "oscar"

    if require_compiler:
        for base in candidates:
            if os.path.isfile(os.path.join(base, "bin", "oscar64")):
                return base

    if prefer_workspace:
        # Workspace path is first candidate when available.
        return candidates[0]

    for base in candidates:
        if os.path.isdir(base):
            return base
    return candidates[0]


def _first_existing_subdir(subdir: str) -> str:
    """Pick the first existing Oscar subdirectory from candidate roots."""
    for base in _oscar_base_candidates():
        candidate = os.path.join(base, subdir)
        if os.path.isdir(candidate):
            return candidate
    # Fallback to the first candidate path to keep messages deterministic.
    return os.path.join(_oscar_base_candidates()[0], subdir)


_OSCAR_DOCS_BASE = _first_existing_subdir("docs")
_OSCAR_INCLUDE_BASE = _first_existing_subdir("include")


_DOC_NAME_FALLBACKS = {
    "LLM_GUIDE_01_overview_and_types.md": "C_01_overview_and_types.md",
    "LLM_GUIDE_02_vic_sid_cia_reu.md": "C_02_vic_sid_cia_reu.md",
    "LLM_GUIDE_03_charwin_sprites_rasterirq_io.md": "C_03_charwin_sprites_rasterirq_io.md",
    "LLM_GUIDE_04_graphics_audio_vector_ultimate.md": "C_04_graphics_audio_vector_ultimate.md",
}


def _read_doc_file(relative_path: str) -> str:
    """Read and return the contents of a documentation file relative to oscar/docs/."""
    candidates = [relative_path]
    fallback = _DOC_NAME_FALLBACKS.get(relative_path)
    if fallback:
        candidates.append(fallback)

    for name in candidates:
        path = os.path.join(_OSCAR_DOCS_BASE, name)
        if os.path.isfile(path):
            with open(path, "r", encoding="utf-8") as f:
                return f.read()

    return "Documentation file not found. Tried: " + ", ".join(
        os.path.join(_OSCAR_DOCS_BASE, n) for n in candidates
    )


def find_oscar_symbol(symbol: str, max_matches: int = 40) -> str:
    """
    Search Oscar64 include/docs sources for an exact C identifier match.

    Returns matching file:line snippets so the agent can verify API names
    before suggesting changes.
    """
    symbol = (symbol or "").strip()
    if not symbol:
        return "Error: symbol must not be empty."
    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", symbol):
        return "Error: symbol must be a single C identifier (e.g. spr_show)."

    search_roots = [
        (_OSCAR_INCLUDE_BASE, (".h",), "include"),
        (_OSCAR_DOCS_BASE, (".md", ".c", ".h", ".txt"), "docs"),
    ]
    pattern = re.compile(rf"\b{re.escape(symbol)}\b")
    matches: list[str] = []

    for root, exts, label in search_roots:
        if not os.path.isdir(root):
            continue
        for dirpath, _dirnames, filenames in os.walk(root):
            for filename in sorted(filenames):
                if not filename.endswith(exts):
                    continue
                fpath = os.path.join(dirpath, filename)
                try:
                    with open(fpath, "r", encoding="utf-8", errors="replace") as f:
                        for line_no, line in enumerate(f, start=1):
                            if pattern.search(line):
                                rel = os.path.relpath(fpath, root)
                                snippet = line.strip()
                                matches.append(f"{label}/{rel}:{line_no}: {snippet}")
                                if len(matches) >= max_matches:
                                    break
                except OSError:
                    continue
                if len(matches) >= max_matches:
                    break
            if len(matches) >= max_matches:
                break

    if not matches:
        return (
            f"No exact symbol match for '{symbol}' in oscar/include or oscar/docs. "
            "Do not assume alternate function names without evidence."
        )

    header = [
        f"Found {len(matches)} match(es) for symbol '{symbol}':",
        *matches,
    ]
    if len(matches) >= max_matches:
        header.append(f"(truncated to first {max_matches} matches)")
    return "\n".join(header)


def create_find_oscar_symbol_tool():
    """Build and return a LangChain Tool for Oscar64 symbol verification."""
    try:
        tool = Tool(
            name="find_oscar_symbol",
            description=(
                "Verify whether a C symbol/function/macro exists in Oscar64 headers/docs. "
                "Input is a single identifier (e.g. 'spr_show'). "
                "Use this BEFORE proposing API replacements after compile errors."
            ),
            func=_wrap_with_logging("find_oscar_symbol", find_oscar_symbol),
        )
        logger.info("find_oscar_symbol tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing find_oscar_symbol tool: %s", e)
    return None


def create_oscar64_overview_stdlib_docs_tool():
    """
    Build and return a LangChain Tool that returns the contents of
    LLM_GUIDE_01_overview_and_types.md.
    """
    try:
        content = _read_doc_file("LLM_GUIDE_01_overview_and_types.md")
        tool = Tool(
            name="get_oscar64_overview_stdlib_docs",
            description=(
                "Returns documentation for the oscar64 cross-compiler for Commodore 64, "
                "covering: compiler invocation and build system, C64 memory layout, "
                "basic types (byte, sbyte, word, dword), standard library "
                "(stdlib.h: malloc, rand, atoi, itoa, div), string functions "
                "(string.h: strcpy, memcpy, memset, etc.), stdio (printf, sprintf, scanf, "
                "file I/O with fopen/fread/fwrite), floating-point math "
                "(math.h: sin, cos, sqrt, etc.), fixed-point arithmetic "
                "(fixmath.h: lmul16u, ldiv16s, lmul8f8s, etc.), compression utilities "
                "(oscar.h: LZO/RLE decompress, breakpoint), low-level console I/O "
                "(conio.h: getch, putch, clrscr, gotoxy, textcolor), and PETSCII "
                "character mapping. Use this when writing any new C64 program from scratch, "
                "when needing string/memory/math operations, or when unsure about basic "
                "types and compiler usage."
            ),
            func=_wrap_with_logging(
                "get_oscar64_overview_stdlib_docs", lambda _: content
            ),
        )
        logger.info("get_oscar64_overview_stdlib_docs tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing get_oscar64_overview_stdlib_docs tool: %s", e)
    return None


def create_oscar64_vic_sid_cia_reu_docs_tool():
    """
    Build and return a LangChain Tool that returns the contents of
    LLM_GUIDE_02_vic_sid_cia_reu.md.
    """
    try:
        content = _read_doc_file("LLM_GUIDE_02_vic_sid_cia_reu.md")
        tool = Tool(
            name="get_oscar64_vic_sid_cia_reu_docs",
            description=(
                "Returns documentation for the core C64 hardware chips: VIC-II video chip "
                "(vic.h: display modes, sprite positioning, raster waiting, color constants, "
                "register layout), SID sound chip (sid.h: voice control, envelope ADSR, "
                "waveforms, note frequency macros, filter), CIA timer/I/O chips "
                "(cia.h: port registers, timers, TOD clock), memory map control "
                "(memmap.h: MMAP_ROM/RAM/NO_ROM constants, mmap_set, mmap_trampoline), "
                "and RAM Expansion Unit (reu.h: reu_store, reu_load, reu_fill, reu_load2d "
                "for DMA transfers). Use this when setting up video mode, playing sound, "
                "accessing hardware registers directly, switching memory banks, or using "
                "REU expansion memory."
            ),
            func=_wrap_with_logging(
                "get_oscar64_vic_sid_cia_reu_docs", lambda _: content
            ),
        )
        logger.info("get_oscar64_vic_sid_cia_reu_docs tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing get_oscar64_vic_sid_cia_reu_docs tool: %s", e)
    return None


def create_oscar64_charwin_sprites_input_io_docs_tool():
    """
    Build and return a LangChain Tool that returns the contents of
    LLM_GUIDE_03_charwin_sprites_rasterirq_io.md.
    """
    try:
        content = _read_doc_file("LLM_GUIDE_03_charwin_sprites_rasterirq_io.md")
        tool = Tool(
            name="get_oscar64_charwin_sprites_input_io_docs",
            description=(
                "Returns documentation for: text window management "
                "(charwin.h: CharWin struct, cursor control, text output, scrolling, "
                "editing, console mode), hardware and virtual sprite system "
                "(sprites.h: spr_set/move/color, vspr_* multiplexer for 16 sprites), "
                "raster interrupt system (rasterirq.h: rirq_build/write/set/sort/start "
                "for mid-screen register changes), keyboard scanning "
                "(keyboard.h: keyb_poll, key_pressed, KeyScanCode enum), joystick input "
                "(joystick.h: joy_poll, joyx/joyy/joyb arrays), mouse input (mouse.h), "
                "KERNAL file I/O (kernalio.h: krnio_open/close/read/write/gets), raw IEC "
                "bus access (iecbus.h), fast disk loader (flossiec.h), and runtime 6502 "
                "code generation (asm6502.h). Use this when implementing text UI, sprites, "
                "game input, raster effects (color bars, split screen), or disk file access."
            ),
            func=_wrap_with_logging(
                "get_oscar64_charwin_sprites_input_io_docs", lambda _: content
            ),
        )
        logger.info("get_oscar64_charwin_sprites_input_io_docs tool initialized")
        return tool
    except Exception as e:
        logger.error(
            "Error initializing get_oscar64_charwin_sprites_input_io_docs tool: %s", e
        )
    return None


def read_all_sources(working_dir: str, max_bytes: int = 50000) -> str:
    """
    Walk *working_dir*, collect all *.c and *.h files, and return their
    concatenated content with filename headers.

    Caps total output at *max_bytes* to avoid exceeding LLM token limits.
    """
    if not working_dir or not os.path.isdir(working_dir):
        return ""
    parts: list[str] = []
    total = 0
    for root, _dirs, files in os.walk(working_dir):
        for fname in sorted(files):
            if not fname.endswith((".c", ".h")):
                continue
            rel = os.path.relpath(os.path.join(root, fname), working_dir)
            try:
                with open(
                    os.path.join(root, fname), "r", encoding="utf-8", errors="replace"
                ) as f:
                    content = f.read()
            except OSError:
                content = "<read error>"
            section = f"--- file: {rel} ---\n```c\n{content}\n```\n"
            if total + len(section) > max_bytes:
                parts.append(f"\n[truncated — {max_bytes} byte limit reached]")
                break
            parts.append(section)
            total += len(section)
        else:
            continue
        break  # break outer loop when truncated
    return "\n".join(parts) if parts else "(no .c or .h files found)"


def list_project_files(working_dir: str) -> str:
    """List all *.c, *.h and *.md files under *working_dir* (recursive)."""
    if not working_dir or not os.path.isdir(working_dir):
        return "Error: working directory does not exist."
    files: list[str] = []
    for root, _dirs, fnames in os.walk(working_dir):
        for fname in sorted(fnames):
            if fname.endswith((".c", ".h", ".md")):
                files.append(os.path.relpath(os.path.join(root, fname), working_dir))
    if not files:
        return "(no .c, .h or .md files found)"
    return "\n".join(files)


def _validate_source_filename(filename: str) -> str | None:
    """Return an error message if *filename* is not a safe .c/.h/.md relative path."""
    if not filename:
        return "filename must not be empty."
    if ".." in filename or filename.startswith("/"):
        return "filename must be a relative path within the project (no '..' or leading '/')."
    if not filename.endswith((".c", ".h", ".md")):
        return "Only .c, .h and .md files are allowed."
    return None


def write_project_file(working_dir: str, filename: str, code: str) -> str:
    """Write *code* to *filename* (relative to *working_dir*)."""
    err = _validate_source_filename(filename)
    if err:
        return f"Error: {err}"
    path = os.path.join(working_dir, filename)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(code)
    logger.info("Wrote %d bytes to %s", len(code), path)
    return f"File written ({len(code)} bytes): {filename}"


def read_project_file(working_dir: str, filename: str) -> str:
    """Read and return the contents of *filename* (relative to *working_dir*)."""
    err = _validate_source_filename(filename)
    if err:
        return f"Error: {err}"
    path = os.path.join(working_dir, filename)
    if not os.path.isfile(path):
        return f"Error: file not found: {filename}"
    with open(path, "r", encoding="utf-8", errors="replace") as f:
        return f.read()


def create_write_file_tool(working_dir: str):
    """Factory for a tool that writes a .c/.h/.md file inside *working_dir*."""
    if not working_dir:
        return None
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class WriteFileInput(BaseModel):
            filename: str = Field(
                description="Relative path (e.g. 'main.c', 'utils/helpers.h', 'notes/plan.md')"
            )
            code: str = Field(description="COMPLETE file content to write")

        tool = StructuredTool.from_function(
            func=_wrap_with_logging(
                "write_file",
                lambda filename, code: write_project_file(working_dir, filename, code),
            ),
            name="write_file",
            description=(
                "Write or overwrite a .c, .h, or .md file in the project directory. "
                "Input MUST be the COMPLETE file content (not a diff or snippet). "
                "Provide the filename as a relative path."
            ),
            args_schema=WriteFileInput,
        )
        logger.info("write_file tool initialized for dir '%s'", working_dir)
        return tool
    except Exception as e:
        logger.error("Error initializing write_file tool: %s", e)
    return None


def create_read_file_tool(working_dir: str):
    """Factory for a tool that reads a .c/.h/.md file from *working_dir*."""
    if not working_dir:
        return None
    try:
        tool = Tool(
            name="read_file",
            description=(
                "Read the contents of a .c, .h, or .md file from the project. "
                "Input is the relative filename (e.g. 'main.c' or 'notes/plan.md')."
            ),
            func=_wrap_with_logging(
                "read_file", lambda filename: read_project_file(working_dir, filename)
            ),
        )
        logger.info("read_file tool initialized for dir '%s'", working_dir)
        return tool
    except Exception as e:
        logger.error("Error initializing read_file tool: %s", e)
    return None


def create_list_files_tool(working_dir: str):
    """Factory for a tool that lists project source and markdown files."""
    if not working_dir:
        return None
    try:
        from langchain_core.tools import StructuredTool

        tool = StructuredTool.from_function(
            func=_wrap_with_logging(
                "list_project_files",
                lambda *args, **kwargs: list_project_files(working_dir),
            ),
            name="list_project_files",
            description="List all .c, .h, and .md files in the project directory.",
        )
        logger.info("list_project_files tool initialized for dir '%s'", working_dir)
        return tool
    except Exception as e:
        logger.error("Error initializing list_project_files tool: %s", e)
    return None


def compile_project(working_dir: str, main_file: str = "") -> str:
    """
    Compile a project in *working_dir* using oscar64.
    If *main_file* is empty, finds the first .c file.
    """
    if not working_dir or not os.path.isdir(working_dir):
        return "Error: working directory does not exist."

    oscar_dir = _resolve_oscar_dir(require_compiler=True)
    compiler = os.path.join(oscar_dir, "bin", "oscar64")
    if not os.path.isfile(compiler):
        print(f"Error: oscar64 compiler not found at {compiler}")
        return f"Error: compiler not found at {compiler}"

    # Determine main source file
    main_file = main_file.strip()
    if not main_file:
        # Find first .c file alphabetically
        c_files = sorted(
            f
            for f in os.listdir(working_dir)
            if f.endswith(".c") and os.path.isfile(os.path.join(working_dir, f))
        )
        if not c_files:
            return "Error: no .c files found in project directory."
        main_file = c_files[0]

    source_path = os.path.join(working_dir, main_file)
    if not os.path.isfile(source_path):
        return f"Error: source file not found: {main_file}"

    try:
        result = subprocess.run(
            [compiler, source_path],
            cwd=working_dir,
            capture_output=True,
            text=True,
            timeout=60,
        )
        output = (result.stdout + result.stderr).strip()
        if result.returncode == 0:
            return (
                f"Compilation successful.\n{output}"
                if output
                else "Compilation successful."
            )
        else:
            return f"Compilation failed (exit {result.returncode}).\n{output}"
    except subprocess.TimeoutExpired:
        return "Error: compiler timed out after 60 seconds."
    except Exception as e:
        return f"Error running compiler: {e}"


def run_project_prg(working_dir: str, main_file: str = "") -> str:
    """Upload and run the compiled .prg from *working_dir* on the C64."""
    if not working_dir or not os.path.isdir(working_dir):
        return "Error: working directory does not exist."

    main_file = main_file.strip()
    if not main_file:
        prg_files = sorted(
            f
            for f in os.listdir(working_dir)
            if f.endswith(".prg") and os.path.isfile(os.path.join(working_dir, f))
        )
        if not prg_files:
            return "Error: no .prg found. Compile first."
        prg_path = os.path.join(working_dir, prg_files[0])
    else:
        prg_path = os.path.join(working_dir, main_file.replace(".c", ".prg"))

    if not os.path.isfile(prg_path):
        return f"Error: .prg file not found: {prg_path}. Compile first."

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    try:
        from sdk.network_helper import send_dmawrite

        with open(prg_path, "rb") as f:
            prg_data = f.read()
        send_dmawrite(c64_ip, prg_data)
        return f"Program loaded to C64 memory ({os.path.basename(prg_path)})."
    except Exception as e:
        return f"Error sending .prg to C64: {e}"


def create_compile_project_tool(working_dir: str):
    """Factory for a compilation tool scoped to *working_dir*."""
    if not working_dir:
        return None
    try:
        tool = Tool(
            name="compile_project",
            description=(
                "Compile the C64 project using the Oscar64 compiler. "
                "Input is the main .c filename (e.g. 'main.c'), or empty to auto-detect."
            ),
            func=_wrap_with_logging(
                "compile_project",
                lambda main_file="": compile_project(working_dir, main_file),
            ),
        )
        logger.info("compile_project tool initialized for '%s'", working_dir)
        return tool
    except Exception as e:
        logger.error("Error initializing compile_project tool: %s", e)
    return None


def create_run_project_tool(working_dir: str):
    """Factory for a run tool scoped to *working_dir*."""
    if not working_dir:
        return None
    try:
        tool = Tool(
            name="run_project",
            description=(
                "Upload and run the compiled .prg on the C64 Ultimate hardware. "
                "Input is the main .c filename (to find matching .prg), or empty to auto-detect."
            ),
            func=_wrap_with_logging(
                "run_project",
                lambda main_file="": run_project_prg(working_dir, main_file),
            ),
        )
        logger.info("run_project tool initialized for '%s'", working_dir)
        return tool
    except Exception as e:
        logger.error("Error initializing run_project tool: %s", e)
    return None


# ------------------------------------------------------------------
# Guarded shell command tool
# ------------------------------------------------------------------


def _default_shell_root_dir() -> str:
    """Return the default root directory allowed for shell command execution."""
    try:
        from workspace_init import WORKSPACE_DIR

        return os.path.abspath(WORKSPACE_DIR)
    except Exception:
        here = os.path.dirname(os.path.abspath(__file__))
        return os.path.abspath(os.path.join(here, "workspace"))


def _resolve_shell_cwd(root_dir: str, cwd: str) -> tuple[bool, str]:
    """Resolve cwd against root_dir and enforce subtree restriction."""
    root_abs = os.path.abspath(root_dir)
    requested = (cwd or ".").strip()
    if os.path.isabs(requested):
        candidate = os.path.abspath(requested)
    else:
        candidate = os.path.abspath(os.path.join(root_abs, requested))

    try:
        common = os.path.commonpath([root_abs, candidate])
    except ValueError:
        return False, ("Error: invalid working directory. " f"Allowed root: {root_abs}")

    if common != root_abs:
        return False, (
            "Error: working directory is outside allowed root. "
            f"Allowed root: {root_abs}"
        )

    if not os.path.isdir(candidate):
        return False, f"Error: working directory does not exist: {candidate}"

    return True, candidate


def _is_write_or_destructive_command(command: str) -> bool:
    """Best-effort check for file-modifying or destructive shell commands."""
    stripped = (command or "").strip()
    if not stripped:
        return False
    if re.search(r"(^|[;&|]\\s*)sudo\\b", stripped, re.IGNORECASE):
        return True
    for pattern in _WRITE_OR_DESTRUCTIVE_PATTERNS:
        if pattern.search(stripped):
            return True
    return False


def _tail_lines(text: str, max_lines: int = MAX_SHELL_OUTPUT_LINES) -> tuple[str, bool]:
    """Return last max_lines lines and truncation flag."""
    lines = text.splitlines()
    if len(lines) <= max_lines:
        return text, False
    tail = "\n".join(lines[-max_lines:])
    return tail, True


def run_shell_command(
    command: str,
    cwd: str = ".",
    timeout_seconds: int = DEFAULT_SHELL_TIMEOUT_SECONDS,
    allow_write: bool = False,
    root_dir: str | None = None,
) -> str:
    """
    Execute a shell command with lightweight guardrails.

    - Restricts execution to a configured root subtree.
    - Blocks risky/write commands by default unless allow_write=True.
    - Captures stdout/stderr and truncates output to last N lines.
    """
    cmd = (command or "").strip()
    if not cmd:
        return "Error: command must not be empty."
    if "\x00" in cmd:
        return "Error: command contains invalid null byte."

    if timeout_seconds is None:
        timeout_seconds = DEFAULT_SHELL_TIMEOUT_SECONDS
    try:
        timeout_seconds = int(timeout_seconds)
    except Exception:
        return "Error: timeout_seconds must be an integer."
    if timeout_seconds < 1 or timeout_seconds > DEFAULT_SHELL_TIMEOUT_SECONDS:
        return (
            "Error: timeout_seconds must be between 1 and "
            f"{DEFAULT_SHELL_TIMEOUT_SECONDS}."
        )

    root = os.path.abspath(root_dir or _default_shell_root_dir())
    ok, cwd_or_error = _resolve_shell_cwd(root, cwd)
    if not ok:
        return cwd_or_error
    resolved_cwd = cwd_or_error

    if _is_write_or_destructive_command(cmd) and not allow_write:
        return (
            "Error: command appears to modify files or perform risky actions. "
            "This tool blocks such commands by default. "
            "Use read/build/run-only commands or rerun with allow_write=true "
            "if you intentionally need write access."
        )

    try:
        result = subprocess.run(
            cmd,
            cwd=resolved_cwd,
            shell=True,
            executable="/bin/bash",
            capture_output=True,
            text=True,
            timeout=timeout_seconds,
        )
        combined = "\n".join(
            part for part in [result.stdout, result.stderr] if part
        ).strip()
        output_text, truncated = _tail_lines(combined)
        if not output_text:
            output_text = "(no output)"
        trunc_msg = "\n[output truncated to last 200 lines]" if truncated else ""
        return (
            f"cwd: {resolved_cwd}\n"
            f"exit_code: {result.returncode}\n"
            f"output:\n{output_text}{trunc_msg}"
        )
    except subprocess.TimeoutExpired as e:
        partial = ""
        if isinstance(e.stdout, bytes):
            partial += e.stdout.decode("utf-8", errors="replace")
        elif isinstance(e.stdout, str):
            partial += e.stdout
        if isinstance(e.stderr, bytes):
            partial += "\n" + e.stderr.decode("utf-8", errors="replace")
        elif isinstance(e.stderr, str):
            partial += "\n" + e.stderr
        output_text, truncated = _tail_lines(partial.strip())
        if not output_text:
            output_text = "(no output before timeout)"
        trunc_msg = "\n[output truncated to last 200 lines]" if truncated else ""
        return (
            f"cwd: {resolved_cwd}\n"
            f"exit_code: timeout\n"
            f"output:\n{output_text}{trunc_msg}"
        )
    except Exception as e:
        return f"Error running shell command: {e}"


def create_run_shell_command_tool(root_dir: str | None = None):
    """Factory for a guarded shell command tool scoped to a workspace subtree."""
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class ShellCommandInput(BaseModel):
            command: str = Field(
                description=(
                    "Shell command to execute. Command chaining with ;, &&, || and | is allowed."
                )
            )
            cwd: str = Field(
                default=".",
                description="Working directory, relative to the allowed workspace root.",
            )
            timeout_seconds: int = Field(
                default=DEFAULT_SHELL_TIMEOUT_SECONDS,
                ge=1,
                le=DEFAULT_SHELL_TIMEOUT_SECONDS,
                description="Execution timeout in seconds (max 60).",
            )
            allow_write: bool = Field(
                default=False,
                description=(
                    "Set true only when a command is expected to modify files. "
                    "Default is false for safer execution."
                ),
            )

        allowed_root = os.path.abspath(root_dir or _default_shell_root_dir())
        tool = StructuredTool.from_function(
            func=_wrap_with_logging(
                "run_shell_command",
                lambda command, cwd=".", timeout_seconds=DEFAULT_SHELL_TIMEOUT_SECONDS, allow_write=False: run_shell_command(
                    command=command,
                    cwd=cwd,
                    timeout_seconds=timeout_seconds,
                    allow_write=allow_write,
                    root_dir=allowed_root,
                ),
            ),
            name="run_shell_command",
            description=(
                "Run a shell command within a restricted workspace subtree. "
                "Default mode is read/build/run-friendly and blocks risky write/destructive commands unless allow_write=true. "
                "Returns command output and exit code."
            ),
            args_schema=ShellCommandInput,
        )
        logger.info("run_shell_command tool initialized (root: %s)", allowed_root)
        return tool
    except Exception as e:
        logger.error("Error initializing run_shell_command tool: %s", e)
    return None


# ------------------------------------------------------------------
# Git version-control tool
# ------------------------------------------------------------------

# Subcommands that reach the network or an external remote. Blocked unless the
# caller explicitly opts in with allow_remote=True.
_GIT_REMOTE_SUBCOMMANDS = frozenset(
    {"push", "pull", "fetch", "clone", "remote", "submodule"}
)

# Subcommands considered destructive to history or the working tree. Allowed,
# but only surfaced deliberately so the model does not reach for them casually.
_GIT_DESTRUCTIVE_SUBCOMMANDS = frozenset({"reset", "clean", "rebase", "gc"})


def run_git_command(
    args: str,
    cwd: str = ".",
    allow_remote: bool = False,
    timeout_seconds: int = DEFAULT_SHELL_TIMEOUT_SECONDS,
    root_dir: str | None = None,
) -> str:
    """Run a `git` command inside the allowed workspace subtree.

    - Requires the git binary to be installed on the server.
    - Confines execution to the workspace root (same sandbox as the shell tool).
    - Blocks network subcommands (push/pull/fetch/clone/remote) unless
      allow_remote=True, so local history operations are always safe.
    """
    if shutil.which("git") is None:
        return (
            "Error: git is not installed on the server. Ask the operator to "
            "install git, then retry."
        )

    raw = (args or "").strip()
    if not raw:
        return "Error: git arguments must not be empty (e.g. 'status', 'log --oneline')."
    if "\x00" in raw:
        return "Error: git arguments contain an invalid null byte."

    try:
        timeout_seconds = int(timeout_seconds)
    except Exception:
        return "Error: timeout_seconds must be an integer."
    if timeout_seconds < 1 or timeout_seconds > DEFAULT_SHELL_TIMEOUT_SECONDS:
        return (
            "Error: timeout_seconds must be between 1 and "
            f"{DEFAULT_SHELL_TIMEOUT_SECONDS}."
        )

    # Strip a leading literal "git" if the model included it.
    lowered = raw.lower()
    if lowered == "git" or lowered.startswith("git "):
        raw = raw[3:].strip()
        if not raw:
            return "Error: no git subcommand given after 'git'."

    # Identify the subcommand (first token that is not a global -c/-C option).
    tokens = raw.split()
    subcommand = ""
    for tok in tokens:
        if tok.startswith("-"):
            continue
        subcommand = tok.lower()
        break

    if subcommand in _GIT_REMOTE_SUBCOMMANDS and not allow_remote:
        return (
            f"Error: git '{subcommand}' reaches an external remote and is blocked "
            "by default. Rerun with allow_remote=true only if the user explicitly "
            "asked to sync with a remote."
        )

    root = os.path.abspath(root_dir or _default_shell_root_dir())
    ok, cwd_or_error = _resolve_shell_cwd(root, cwd)
    if not ok:
        return cwd_or_error
    resolved_cwd = cwd_or_error

    try:
        result = subprocess.run(
            ["git"] + tokens,
            cwd=resolved_cwd,
            capture_output=True,
            text=True,
            timeout=timeout_seconds,
        )
        combined = "\n".join(
            part for part in [result.stdout, result.stderr] if part
        ).strip()
        output_text, truncated = _tail_lines(combined)
        if not output_text:
            output_text = "(no output)"
        trunc_msg = "\n[output truncated to last 200 lines]" if truncated else ""
        hint = ""
        if (
            result.returncode != 0
            and "not a git repository" in combined.lower()
            and subcommand != "init"
        ):
            hint = (
                "\nHint: this directory is not a git repo yet. Run git 'init' first "
                "if you intend to start version control here."
            )
        return (
            f"cwd: {resolved_cwd}\n"
            f"git {raw}\n"
            f"exit_code: {result.returncode}\n"
            f"output:\n{output_text}{trunc_msg}{hint}"
        )
    except subprocess.TimeoutExpired:
        return f"cwd: {resolved_cwd}\ngit {raw}\nexit_code: timeout\noutput:\n(timed out)"
    except Exception as e:
        return f"Error running git command: {e}"


def create_git_tool(root_dir: str | None = None):
    """Factory for a git CLI tool scoped to the workspace subtree."""
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class GitCommandInput(BaseModel):
            args: str = Field(
                description=(
                    "Arguments passed to git, without the leading 'git'. "
                    "Examples: 'status', 'log --oneline -10', 'add .', "
                    "\"commit -m 'add sprite loader'\", 'diff', 'checkout -b feature'."
                )
            )
            cwd: str = Field(
                default=".",
                description="Working directory, relative to the workspace root.",
            )
            allow_remote: bool = Field(
                default=False,
                description=(
                    "Set true only when the user explicitly asked to sync with a "
                    "remote (push/pull/fetch/clone/remote). Blocked otherwise."
                ),
            )

        allowed_root = os.path.abspath(root_dir or _default_shell_root_dir())
        tool = StructuredTool.from_function(
            func=_wrap_with_logging(
                "git",
                lambda args, cwd=".", allow_remote=False: run_git_command(
                    args=args,
                    cwd=cwd,
                    allow_remote=allow_remote,
                    root_dir=allowed_root,
                ),
            ),
            name="git",
            description=(
                "Run git version-control commands (status, diff, log, add, commit, "
                "branch, checkout, stash, init) inside the workspace. Use this to "
                "inspect history and to checkpoint your work with small, well-described "
                "commits. Network subcommands are blocked unless allow_remote=true. "
                "Requires git to be installed on the server."
            ),
            args_schema=GitCommandInput,
        )
        logger.info("git tool initialized (root: %s)", allowed_root)
        return tool
    except Exception as e:
        logger.error("Error initializing git tool: %s", e)
    return None


def create_oscar64_graphics_audio_vector_ultimate_docs_tool():
    """
    Build and return a LangChain Tool that returns the contents of
    LLM_GUIDE_04_graphics_audio_vector_ultimate.md.
    """
    try:
        content = _read_doc_file("LLM_GUIDE_04_graphics_audio_vector_ultimate.md")
        tool = Tool(
            name="get_oscar64_graphics_audio_vector_ultimate_docs",
            description=(
                "Returns documentation for: hires monochrome bitmap graphics "
                "(bitmap.h: Bitmap struct, bm_init, bm_line, bm_rect_fill, "
                "bm_polygon_fill, bm_bitblit, bm_put_string, bm_transform), multicolor "
                "bitmap graphics (mcbitmap.h: bmmc_put/line/circle/polygon_fill, flood "
                "fill), built-in tiny pixel font (tinyfont.h), 2D/3D/4D vector and matrix "
                "math (vector3d.h: Vector2/3/4, Matrix2/3/4, dot/cross product, "
                "normalization, rotation matrices, perspective/view matrices, fixed-point "
                "F12Vector3/F12Matrix3 variants), SID sound effects engine "
                "(sidfx.h: SIDFX struct, sidfx_play/loop/stop), and Ultimate 64 / "
                "1541 Ultimate II+ cartridge library (ultimate_lib.h: file operations, "
                "disk mounting, TCP/UDP networking). Also contains complete working example "
                "programs and key C64 programming pitfalls. Use this when drawing graphics, "
                "doing 3D math, playing sound effects, or communicating with the Ultimate "
                "cartridge hardware."
            ),
            func=_wrap_with_logging(
                "get_oscar64_graphics_audio_vector_ultimate_docs", lambda _: content
            ),
        )
        logger.info("get_oscar64_graphics_audio_vector_ultimate_docs tool initialized")
        return tool
    except Exception as e:
        logger.error(
            "Error initializing get_oscar64_graphics_audio_vector_ultimate_docs tool: %s",
            e,
        )
    return None


# ------------------------------------------------------------------
# Screen memory -> ASCII rendering tool
# ------------------------------------------------------------------

_SCREENCODE_TO_ASCII: dict | None = None


def _build_screencode_to_ascii_map() -> dict:
    """
    Build (and cache) a mapping from C64 screen-code (0-127) -> printable
    ASCII character. We use the `ascii_to_screencode` helper from
    `cloud.server_console` to reverse-map common printable ASCII codepoints.
    """
    global _SCREENCODE_TO_ASCII
    if _SCREENCODE_TO_ASCII is not None:
        return _SCREENCODE_TO_ASCII

    try:
        from sdk.server_console import ascii_to_screencode
    except Exception:
        # If server_console can't be imported, fall back to a simple map
        _SCREENCODE_TO_ASCII = {i: " " for i in range(128)}
        return _SCREENCODE_TO_ASCII

    mapping: dict[int, str] = {}
    # Prefer printable ASCII range 32..126
    for code in range(32, 127):
        try:
            sc = ascii_to_screencode(code) & 0x7F
        except Exception:
            continue
        if sc not in mapping:
            mapping[sc] = chr(code)

    # Ensure every code has at least a space fallback
    for i in range(128):
        if i not in mapping:
            mapping[i] = " "

    _SCREENCODE_TO_ASCII = mapping
    return mapping


def _format_screen_bytes(screen_bytes: bytes) -> str:
    """
    Convert a 1000-byte screen buffer (40x25) into a 25-line ASCII string
    (40 characters per line). Non-printable or unknown codes are rendered
    as space.
    """
    if not screen_bytes:
        return "(no screen data)"

    mapping = _build_screencode_to_ascii_map()
    cols = 40
    rows = 25
    lines: list[str] = []
    # Truncate or pad to expected size
    data = screen_bytes[: cols * rows].ljust(cols * rows, b" ")
    for r in range(rows):
        start = r * cols
        chunk = data[start : start + cols]
        chars: list[str] = []
        for b in chunk:
            sc = b & 0x7F  # drop reverse-video bit
            ch = mapping.get(sc, " ")
            chars.append(ch)
        line = "".join(chars)
        if len(line) < cols:
            line = line.ljust(cols)
        else:
            line = line[:cols]
        lines.append(line)
    return "\n".join(lines)


def create_screen_memory_tool(
    session_id: int | None = None, console_id: int | None = None
):
    """
    Factory for a LangChain Tool that returns the current 40x25 screen by
    reading C64 screen RAM ($0400-$07E7, 1000 bytes) directly from the hardware
    via the Ultimate cartridge REST API.

    *session_id* and *console_id* are accepted for API compatibility but ignored.
    """
    try:

        def _tool(_input: str = "") -> str:
            from sdk.network_helper import dma_read_memory

            c64_ip = _read_last_c64_ip()
            if not c64_ip:
                return "Error: No C64 IP configured. Run a network scan first."

            # Debug mode: report connection target
            if isinstance(_input, str) and _input.strip().lower().startswith("debug"):
                return (
                    f"get_screen: reading $0400-$07E7 (1000 bytes) from C64 at {c64_ip}"
                )

            try:
                screen = dma_read_memory(c64_ip, 0x0400, 1000)
            except Exception as e:
                logger.exception(
                    "get_screen: failed to read C64 screen memory from %s", c64_ip
                )
                return f"Error: could not read C64 screen memory: {e}"

            return _format_screen_bytes(screen)

        tool = Tool(
            name="get_screen",
            description=(
                "Return a 40x25 ASCII rendering of the C64 screen by reading screen RAM "
                "($0400-$07E7) directly from the hardware via the Ultimate cartridge REST API. "
                "Input is ignored. Use when the AI needs to see what is currently on the C64 screen."
            ),
            func=_wrap_with_logging("get_screen", _tool),
        )
        logger.info("get_screen tool initialized (live C64 screen read from $0400)")
        return tool

    except Exception as e:
        logger.error("Error initializing get_screen tool: %s", e)
    return None


# ------------------------------------------------------------------
# C64 keyboard input tool
# ------------------------------------------------------------------


def send_keys_to_c64(text: str) -> str:
    """
    Send a sequence of key strokes to the C64 via the DMA keyboard service.

    *text* is a plain ASCII string. Use '\\n' to send RETURN (e.g. to submit
    a BASIC command). Each character is converted to PETSCII before sending.

    Returns a confirmation message or an error string.
    """
    from sdk.network_helper import send_c64_keyboard_input
    from sdk.generate_pet_asc_table import Petscii

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    petscii_bytes = bytearray()
    for ch in text:
        if ch == "\n":
            petscii_bytes.append(0x0D)  # RETURN
        else:
            code = Petscii.ascii2petscii(ord(ch))
            petscii_bytes.append(code)

    if not petscii_bytes:
        return "Error: no text to send."

    try:
        send_c64_keyboard_input(bytes(petscii_bytes), host=c64_ip)
        preview = text[:40].replace("\n", "<RETURN>")
        return f"Sent {len(petscii_bytes)} key(s) to C64: {preview}"
    except Exception as e:
        logger.error("send_keys_to_c64: error: %s", e)
        return f"Error sending keys to C64: {e}"


def create_c64_keyboard_tool():
    """
    Factory for a LangChain Tool that injects key strokes into the C64 keyboard
    buffer via the Ultimate cartridge DMA service (SOCKET_CMD_KEYB).

    The agent can use this tool to type commands or text on the C64, effectively
    automating the keyboard. Combine with get_screen to observe the result.
    """
    try:
        tool = Tool(
            name="type_on_c64",
            description=(
                "Inject key strokes into the C64 keyboard buffer via the Ultimate cartridge "
                "DMA service. Input is a plain ASCII string to type. Use '\\n' to press RETURN "
                "(e.g. to submit a BASIC command or confirm a prompt). "
                "Example: 'LOAD\"*\",8,1\\n' types a LOAD command and presses RETURN. "
                "Use get_screen first to see what is on the screen, then use this tool to "
                "interact with the C64. The AI can guide or automate the user this way."
            ),
            func=_wrap_with_logging("type_on_c64", send_keys_to_c64),
        )
        logger.info("type_on_c64 tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing type_on_c64 tool: %s", e)
    return None


# ------------------------------------------------------------------
# Assistant memory tool (.md files under workspace/assistant)
# ------------------------------------------------------------------


def _default_assistant_memory_root() -> str:
    """Return the default assistant memory root directory."""
    try:
        from workspace_init import WORKSPACE_DIR

        return os.path.abspath(os.path.join(WORKSPACE_DIR, "assistant"))
    except Exception:
        here = os.path.dirname(os.path.abspath(__file__))
        return os.path.abspath(os.path.join(here, "workspace", "assistant"))


def _validate_assistant_md_path(path: str) -> str | None:
    """Validate a relative markdown path for assistant memory operations."""
    candidate = (path or "").strip()
    if not candidate:
        return "path is required."
    if os.path.isabs(candidate):
        return "path must be relative."
    normalized = candidate.replace("\\", "/")
    if normalized.startswith("../") or "/../" in normalized or normalized == "..":
        return "path must stay inside assistant memory root."
    if not normalized.endswith(".md"):
        return "only .md files are allowed."
    return None


def _resolve_assistant_memory_path(root_dir: str, rel_path: str) -> tuple[bool, str]:
    """Resolve and validate a markdown file path under root_dir."""
    err = _validate_assistant_md_path(rel_path)
    if err:
        return False, f"Error: {err}"

    root_abs = os.path.abspath(root_dir)
    target_abs = os.path.abspath(os.path.join(root_abs, rel_path))
    try:
        common = os.path.commonpath([root_abs, target_abs])
    except ValueError:
        return False, "Error: invalid path."
    if common != root_abs:
        return False, "Error: path is outside assistant memory root."
    return True, target_abs


def _assistant_memory_list(root_dir: str) -> str:
    entries: list[str] = []
    for base, _dirs, files in os.walk(root_dir):
        for name in sorted(files):
            if not name.endswith(".md"):
                continue
            abs_path = os.path.join(base, name)
            rel = os.path.relpath(abs_path, root_dir).replace("\\", "/")
            entries.append(rel)
    if not entries:
        return "(no markdown files found)"
    return "\n".join(entries)


def assistant_memory_operation(
    operation: str,
    path: str = "",
    content: str = "",
    root_dir: str | None = None,
) -> str:
    """
    Execute assistant memory operations on markdown files under workspace/assistant.

    Supported operations:
    - list
    - read
    - write
    - append
    - delete
    """
    root = os.path.abspath(root_dir or _default_assistant_memory_root())
    os.makedirs(root, exist_ok=True)

    op = (operation or "").strip().lower()
    if op == "list":
        return _assistant_memory_list(root)

    if op in ("read", "write", "append", "delete"):
        ok, resolved = _resolve_assistant_memory_path(root, path)
        if not ok:
            return resolved

        if op == "read":
            if not os.path.isfile(resolved):
                return f"Error: file not found: {path}"
            with open(resolved, "r", encoding="utf-8", errors="replace") as f:
                return f.read()

        if op == "write":
            os.makedirs(os.path.dirname(resolved), exist_ok=True)
            with open(resolved, "w", encoding="utf-8") as f:
                f.write(content or "")
            return f"Wrote {len(content or '')} chars to {path}"

        if op == "append":
            os.makedirs(os.path.dirname(resolved), exist_ok=True)
            with open(resolved, "a", encoding="utf-8") as f:
                f.write(content or "")
            return f"Appended {len(content or '')} chars to {path}"

        if op == "delete":
            if not os.path.exists(resolved):
                return f"Error: file not found: {path}"
            os.remove(resolved)
            return f"Deleted {path}"

    return "Error: unsupported operation. Use list/read/write/append/delete."


def create_assistant_memory_tool(root_dir: str | None = None):
    """Factory for markdown memory management under workspace/assistant."""
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class AssistantMemoryInput(BaseModel):
            operation: str = Field(
                description="Memory operation: list, read, write, append, or delete."
            )
            path: str = Field(
                default="",
                description="Relative .md path (required except for list).",
            )
            content: str = Field(
                default="",
                description="Text content for write/append operations.",
            )

        memory_root = os.path.abspath(root_dir or _default_assistant_memory_root())
        os.makedirs(memory_root, exist_ok=True)

        tool = StructuredTool.from_function(
            func=_wrap_with_logging(
                "assistant_memory",
                lambda operation, path="", content="": assistant_memory_operation(
                    operation=operation,
                    path=path,
                    content=content,
                    root_dir=memory_root,
                ),
            ),
            name="assistant_memory",
            description=(
                "Manage assistant memory markdown files under workspace/assistant. "
                "Supports list/read/write/append/delete operations for .md files only. "
                "Use this to store preferences, instructions, ongoing state, and notes."
            ),
            args_schema=AssistantMemoryInput,
        )
        logger.info("assistant_memory tool initialized (root: %s)", memory_root)
        return tool
    except Exception as e:
        logger.error("Error initializing assistant_memory tool: %s", e)
    return None


# ------------------------------------------------------------------
# C64 memory + control + analysis tools
# ------------------------------------------------------------------


def _parse_int_auto(value, default: int = 0) -> int:
    if value is None:
        return default
    if isinstance(value, int):
        return value
    text = str(value).strip()
    if not text:
        return default
    return int(text, 0)


def _parse_hex_bytes(data_hex: str) -> bytes:
    text = (data_hex or "").strip()
    if not text:
        return b""
    cleaned = text.replace(",", " ").replace("0x", "").replace("0X", "")
    cleaned = "".join(cleaned.split())
    if len(cleaned) % 2 != 0:
        raise ValueError("hex data must have even number of nybbles")
    return bytes.fromhex(cleaned)


def _hexdump(data: bytes, base_address: int, max_lines: int = 64) -> str:
    lines: list[str] = []
    chunked = [data[i : i + 16] for i in range(0, len(data), 16)]
    shown = chunked[:max_lines]
    for index, row in enumerate(shown):
        addr = (base_address + index * 16) & 0xFFFF
        hex_part = " ".join(f"{b:02X}" for b in row).ljust(16 * 3 - 1)
        ascii_part = "".join(chr(b) if 32 <= b <= 126 else "." for b in row)
        lines.append(f"${addr:04X}: {hex_part}  {ascii_part}")
    if len(chunked) > len(shown):
        lines.append(f"... truncated {len(chunked) - len(shown)} line(s)")
    return "\n".join(lines)


def c64_memory_peek(address: str = "0x0000", length: int = 256) -> str:
    """
    Read-only peek of C64 memory on the physical Ultimate machine via the
    Ultimate cartridge REST API (GET /v1/machine:readmem).
    """
    from sdk.network_helper import dma_read_memory

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    addr = _parse_int_auto(address, 0)
    if addr < 0 or addr > 0xFFFF:
        return "Error: address must be in range 0x0000..0xFFFF."

    try:
        read_len = int(length)
    except Exception:
        return "Error: length must be an integer."
    if read_len < 1 or read_len > 65536:
        return "Error: length must be in range 1..65536."

    try:
        data = dma_read_memory(c64_ip, addr, read_len)
        return (
            f"Read {len(data)} bytes from ${addr:04X} on {c64_ip}.\n"
            f"{_hexdump(data, addr)}"
        )
    except Exception as e:
        return f"Error reading C64 memory via REST API: {e}"


def create_c64_memory_peek_tool():
    """Factory for a read-only C64 memory peek tool."""
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class C64MemoryPeekInput(BaseModel):
            address: str = Field(
                default="0x0000",
                description="Start address to read from (hex like 0x0801 or decimal).",
            )
            length: int = Field(
                default=256,
                ge=1,
                le=65536,
                description="Number of bytes to read.",
            )

        tool = StructuredTool.from_function(
            func=_wrap_with_logging("c64_memory_peek", c64_memory_peek),
            name="c64_memory_peek",
            description=(
                "Read-only peek at C64 memory on the physical Ultimate machine "
                "via the Ultimate cartridge REST API (GET /v1/machine:readmem). "
                "Returns a hex+ASCII dump of the requested range. Does not write "
                "or execute anything."
            ),
            args_schema=C64MemoryPeekInput,
        )
        logger.info("c64_memory_peek tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing c64_memory_peek tool: %s", e)
    return None


def c64_memory_access(
    operation: str,
    address: str = "0x0000",
    length: int = 256,
    data_hex: str = "",
    file_path: str = "",
    execute_after_write: bool = False,
) -> str:
    """
    Read/write memory and execute on a physical C64 Ultimate machine.

    Supported operations:
    - read
    - write
    - write_file
    - execute
    """
    from sdk.network_helper import dma_read_memory, dma_write_memory_rest, dma_jump

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    op = (operation or "").strip().lower()
    addr = _parse_int_auto(address, 0)
    if addr < 0 or addr > 0xFFFF:
        return "Error: address must be in range 0x0000..0xFFFF."

    if op == "read":
        try:
            read_len = int(length)
        except Exception:
            return "Error: length must be an integer."
        if read_len < 1 or read_len > 65536:
            return "Error: length must be in range 1..65536."
        try:
            data = dma_read_memory(c64_ip, addr, read_len)
            return (
                f"Read {len(data)} bytes from ${addr:04X} on {c64_ip}.\n"
                f"{_hexdump(data, addr)}"
            )
        except Exception as e:
            return f"Error reading C64 memory via REST API: {e}"

    if op == "write":
        try:
            payload = _parse_hex_bytes(data_hex)
        except Exception as e:
            return f"Error parsing data_hex: {e}"
        if not payload:
            return "Error: write requires non-empty data_hex."
        end_addr = addr + len(payload) - 1
        if end_addr > 0xFFFF:
            return "Error: write exceeds C64 memory range."
        try:
            dma_write_memory_rest(c64_ip, addr, payload)
            if execute_after_write:
                dma_jump(c64_ip, addr)
                return f"Wrote {len(payload)} bytes to ${addr:04X} via REST and executed at ${addr:04X}."
            return f"Wrote {len(payload)} bytes to ${addr:04X} via REST API."
        except Exception as e:
            return f"Error writing C64 memory via REST API: {e}"

    if op == "write_file":
        path = (file_path or "").strip()
        if not path:
            return "Error: write_file requires file_path."
        if not os.path.isfile(path):
            return f"Error: file not found: {path}"
        try:
            with open(path, "rb") as f:
                payload = f.read()
        except Exception as e:
            return f"Error reading file: {e}"
        if not payload:
            return "Error: file is empty."

        start_addr = addr
        # PRG file: first two bytes are load address.
        if len(payload) >= 3 and path.lower().endswith(".prg"):
            start_addr = payload[0] | (payload[1] << 8)
            payload = payload[2:]

        end_addr = start_addr + len(payload) - 1
        if end_addr > 0xFFFF:
            return "Error: payload exceeds C64 memory range."

        try:
            dma_write_memory_rest(c64_ip, start_addr, payload)
            if execute_after_write:
                dma_jump(c64_ip, start_addr)
                return f"Loaded {len(payload)} bytes from {path} to ${start_addr:04X} via REST and executed."
            return f"Loaded {len(payload)} bytes from {path} to ${start_addr:04X} via REST API."
        except Exception as e:
            return f"Error writing file payload via REST API: {e}"

    if op == "execute":
        try:
            dma_jump(c64_ip, addr)
            return f"Execution started at ${addr:04X}."
        except Exception as e:
            return f"Error executing at ${addr:04X}: {e}"

    return "Error: unsupported operation. Use read/write/write_file/execute."


def create_c64_memory_access_tool():
    """Factory for C64 memory read/write/execute tool."""
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class C64MemoryInput(BaseModel):
            operation: str = Field(
                description="Operation: read, write, write_file, or execute."
            )
            address: str = Field(
                default="0x0000",
                description="Start address (hex like 0x0801 or decimal).",
            )
            length: int = Field(
                default=256,
                ge=1,
                le=65536,
                description="Read length for operation=read.",
            )
            data_hex: str = Field(
                default="",
                description="Hex bytes for operation=write, e.g. 'A9 00 8D 20 D0'.",
            )
            file_path: str = Field(
                default="",
                description="Path for operation=write_file. .prg uses embedded load address.",
            )
            execute_after_write: bool = Field(
                default=False,
                description="When true, executes at the write address after write/write_file.",
            )

        tool = StructuredTool.from_function(
            func=_wrap_with_logging("c64_memory_access", c64_memory_access),
            name="c64_memory_access",
            description=(
                "Read and write C64 memory on the physical Ultimate machine using REST API endpoints, "
                "and execute code at a specific address."
            ),
            args_schema=C64MemoryInput,
        )
        logger.info("c64_memory_access tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing c64_memory_access tool: %s", e)
    return None


def c64_machine_control(action: str) -> str:
    """Control machine-level actions on the physical C64 Ultimate."""
    from sdk.network_helper import (
        send_reset,
        send_poweroff,
        rest_menu_button,
        rest_reboot,
    )

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    act = (action or "").strip().lower()
    try:
        if act in ("reset", "soft_reset"):
            send_reset(c64_ip)
            return "Reset command sent."
        if act in ("poweroff", "power_off"):
            send_poweroff(c64_ip)
            return "Power-off command sent."
        if act in ("menu", "menu_button"):
            rest_menu_button(c64_ip)
            return "Menu button triggered via REST API."
        if act in ("reboot", "hard_reboot"):
            rest_reboot(c64_ip)
            return "Reboot triggered via REST API."
        return "Error: unsupported action. Use reset/poweroff/menu_button/reboot."
    except Exception as e:
        return f"Error sending machine control action '{act}': {e}"


def create_c64_machine_control_tool():
    """Factory for machine control actions on physical C64 Ultimate."""
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class C64ControlInput(BaseModel):
            action: str = Field(
                description="Action: reset, poweroff, menu_button, or reboot."
            )

        tool = StructuredTool.from_function(
            func=_wrap_with_logging("c64_machine_control", c64_machine_control),
            name="c64_machine_control",
            description=(
                "Control the physical C64 Ultimate machine state (reset, reboot, menu button, poweroff)."
            ),
            args_schema=C64ControlInput,
        )
        logger.info("c64_machine_control tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing c64_machine_control tool: %s", e)
    return None


def _extract_sid_header_details(blob: bytes, absolute_addr: int) -> str:
    if len(blob) < 0x16:
        return f"SID header at ${absolute_addr:04X} (truncated)"
    version = int.from_bytes(blob[4:6], "big")
    data_off = int.from_bytes(blob[6:8], "big")
    load = int.from_bytes(blob[8:10], "big")
    init = int.from_bytes(blob[10:12], "big")
    play = int.from_bytes(blob[12:14], "big")
    songs = int.from_bytes(blob[14:16], "big")
    start_song = int.from_bytes(blob[16:18], "big")
    return (
        f"SID at ${absolute_addr:04X}: version={version}, data_off=${data_off:04X}, "
        f"load=${load:04X}, init=${init:04X}, play=${play:04X}, songs={songs}, start_song={start_song}"
    )


def _sprite_to_ascii(block63: bytes) -> str:
    rows: list[str] = []
    for r in range(21):
        row = block63[r * 3 : r * 3 + 3]
        bits = "".join(
            "#" if (byte >> bit) & 1 else "."
            for byte in row
            for bit in range(7, -1, -1)
        )
        rows.append(bits)
    return "\n".join(rows)


def _find_probable_sprite_blocks(
    data: bytes, base_address: int, max_sprites: int
) -> list[tuple[int, bytes, float]]:
    candidates: list[tuple[int, bytes, float]] = []
    if len(data) < 63:
        return candidates

    for offset in range(0, len(data) - 63 + 1):
        if offset % 64 != 0:
            continue
        block = data[offset : offset + 63]
        if not block:
            continue
        if all(b == 0x00 for b in block):
            continue
        if all(b == 0xFF for b in block):
            continue

        pop = sum(bin(b).count("1") for b in block)
        unique = len(set(block))
        if pop < 8 or pop > 500:
            continue

        score = (unique * 0.8) + (pop / 40.0)
        candidates.append((base_address + offset, block, score))

    candidates.sort(key=lambda item: item[2], reverse=True)
    return candidates[: max(1, int(max_sprites))]


def c64_memory_analyze(
    task: str = "",
    address: str = "0x0000",
    length: int = 65536,
    save_sprites: bool = False,
    max_sprites: int = 32,
    output_dir: str = "",
) -> str:
    """
    Analyze C64 memory for structures like SID headers and probable sprites.
    """
    from sdk.network_helper import dma_read_memory

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    try:
        base_addr = _parse_int_auto(address, 0)
    except Exception:
        return "Error: address must be a valid number (e.g. 0x0801)."

    if base_addr < 0 or base_addr > 0xFFFF:
        return "Error: address must be in range 0x0000..0xFFFF."

    try:
        read_len = int(length)
    except Exception:
        return "Error: length must be an integer."
    if read_len < 1 or read_len > 65536:
        return "Error: length must be in range 1..65536."

    if base_addr + read_len > 0x10000:
        read_len = 0x10000 - base_addr

    try:
        data = dma_read_memory(c64_ip, base_addr, read_len)
    except Exception as e:
        return f"Error reading memory for analysis: {e}"

    lines: list[str] = []
    lines.append(f"Analyzed {len(data)} bytes from ${base_addr:04X} on {c64_ip}.")
    if task:
        lines.append(f"Task hint: {task.strip()}")

    sid_hits: list[str] = []
    for sig in (b"PSID", b"RSID"):
        pos = 0
        while True:
            idx = data.find(sig, pos)
            if idx < 0:
                break
            abs_addr = base_addr + idx
            sid_hits.append(
                _extract_sid_header_details(data[idx : idx + 0x20], abs_addr)
            )
            pos = idx + 1

    if sid_hits:
        lines.append(f"SID signatures: {len(sid_hits)}")
        lines.extend(sid_hits[:20])
        if len(sid_hits) > 20:
            lines.append(f"... truncated {len(sid_hits) - 20} SID result(s)")
    else:
        lines.append("SID signatures: none found (PSID/RSID).")

    sprite_candidates = _find_probable_sprite_blocks(data, base_addr, max_sprites)
    lines.append(f"Probable sprite blocks: {len(sprite_candidates)}")
    for addr, _block, score in sprite_candidates[:20]:
        lines.append(f"sprite candidate at ${addr:04X}, score={score:.2f}")
    if len(sprite_candidates) > 20:
        lines.append(f"... truncated {len(sprite_candidates) - 20} sprite candidate(s)")

    if save_sprites and sprite_candidates:
        if output_dir.strip():
            target_dir = os.path.abspath(output_dir)
        else:
            target_dir = os.path.join(
                _default_assistant_memory_root(), "memory_artifacts", "sprites"
            )
        os.makedirs(target_dir, exist_ok=True)

        saved = 0
        for addr, block, _score in sprite_candidates:
            name = f"sprite_{addr:04X}"
            raw_path = os.path.join(target_dir, f"{name}.bin")
            txt_path = os.path.join(target_dir, f"{name}.txt")
            with open(raw_path, "wb") as f:
                f.write(block)
            with open(txt_path, "w", encoding="utf-8") as f:
                f.write(_sprite_to_ascii(block))
            saved += 1
        lines.append(f"Saved {saved} sprite file pairs to {target_dir}")

    return "\n".join(lines)


def create_c64_memory_analyzer_tool():
    """Factory for C64 memory analysis tool."""
    try:
        from langchain_core.tools import StructuredTool
        from pydantic import BaseModel, Field

        class C64MemoryAnalyzerInput(BaseModel):
            task: str = Field(
                default="",
                description="Natural-language analysis hint, e.g. 'where is SID tune located'.",
            )
            address: str = Field(
                default="0x0000",
                description="Start address to scan.",
            )
            length: int = Field(
                default=65536,
                ge=1,
                le=65536,
                description="Bytes to scan.",
            )
            save_sprites: bool = Field(
                default=False,
                description="Save probable sprite blocks as .bin and .txt files.",
            )
            max_sprites: int = Field(
                default=32,
                ge=1,
                le=512,
                description="Maximum number of sprite candidates to keep/save.",
            )
            output_dir: str = Field(
                default="",
                description="Optional output directory for saved sprites.",
            )

        tool = StructuredTool.from_function(
            func=_wrap_with_logging("c64_memory_analyze", c64_memory_analyze),
            name="c64_memory_analyze",
            description=(
                "Analyze live C64 memory for useful structures (SID headers, probable sprite data), "
                "and optionally save discovered sprites to files."
            ),
            args_schema=C64MemoryAnalyzerInput,
        )
        logger.info("c64_memory_analyze tool initialized")
        return tool
    except Exception as e:
        logger.error("Error initializing c64_memory_analyze tool: %s", e)
    return None
