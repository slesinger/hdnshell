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
import logging
import requests
from langchain_core.tools import Tool
from langchain_community.utilities import SerpAPIWrapper

logger = logging.getLogger(__name__)


# ------------------------------------------------------------------
# Web search
# ------------------------------------------------------------------


def create_websearch_tool():
    """
    Build and return a LangChain Tool for SerpAPI web search, or None if
    SERPAPI_API_KEY is not set / dependencies are missing.
    """
    serpapi_key = os.getenv("SERPAPI_API_KEY")
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
            func=search.run,
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


def _context7_request(method: str, params: dict, request_id: int = 1) -> dict:
    """
    Send a single JSON-RPC request to the Context7 MCP endpoint.
    Handles the streamable-HTTP session handshake transparently.

    Returns the parsed JSON-RPC response dict, or {} on error.
    """
    import requests as _requests

    api_key = os.getenv("CONTEXT7_API_KEY")
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
        logger.error("context7 init error: %s", e)
        return {}

    # --- call the actual method ---
    payload = {"jsonrpc": "2.0", "id": request_id, "method": method, "params": params}
    try:
        resp = session.post(url, json=payload, headers=headers, timeout=30)
        resp.raise_for_status()
        return resp.json()
    except Exception as e:
        logger.error("context7 request error (%s): %s", method, e)
        return {}


def _context7_extract_text(rpc_response: dict) -> str:
    """Extract plain text from a tools/call JSON-RPC response."""
    result = rpc_response.get("result", {})
    content = result.get("content", [])
    parts = [c.get("text", "") for c in content if c.get("type") == "text"]
    return "\n".join(parts).strip() or "No documentation found."


# ------------------------------------------------------------------
# C64 reference docs tool factory
# ------------------------------------------------------------------
def c64ref_get_docs(topic: str) -> str:
    """
    Retrieve C64 reference documentation for *topic* from Context7.
    Uses the pre-resolved library ID for https://github.com/mist64/c64ref.
    """
    response = _context7_request(
        method="tools/call",
        params={
            "name": "get-library-docs",
            "arguments": {
                "context7CompatibleLibraryID": C64REF_LIBRARY_ID,
                "topic": topic,
                "tokens": 5000,
            },
        },
        request_id=2,
    )
    return _context7_extract_text(response)


def create_c64ref_tool():
    """
    Build and return a LangChain Tool for C64 reference docs via Context7,
    or None if CONTEXT7_API_KEY is not set / dependencies are missing.
    """
    api_key = os.getenv("CONTEXT7_API_KEY")
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
            func=c64ref_get_docs,
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


def search_manual(topic: str, manual_content: dict) -> str:
    """
    Search the in-memory user manual for *topic*.

    If *topic* is empty or "all", returns the full concatenated manual.
    Otherwise returns every paragraph/section that contains the keyword
    (case-insensitive). Falls back to the full manual if nothing matches.
    """
    if not manual_content:
        return "User manual is not available."

    topic = topic.strip()
    keyword = topic.lower()

    if not keyword or keyword == "all":
        sections = [
            f"=== {fname} ===\n{text}" for fname, text in manual_content.items()
        ]
        return "\n\n".join(sections)

    results = []
    for fname, text in manual_content.items():
        for para in text.split("\n\n"):
            if keyword in para.lower():
                results.append(para.strip())

    if results:
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
            func=lambda topic: search_manual(topic, manual_content),
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

    oscar_dir = os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "oscar"
    )
    compiler = os.path.join(oscar_dir, "bin", "oscar64")
    source_file = os.path.join("projects", program_name, f"{program_name}.c")

    if not os.path.isfile(compiler):
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

    oscar_dir = os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "oscar"
    )
    prg_path = os.path.join(oscar_dir, "projects", project_name, f"{project_name}.prg")

    if not os.path.isfile(prg_path):
        return f"Error: .prg file not found at {prg_path}. Compile first."

    c64_ip = _read_last_c64_ip()
    if not c64_ip:
        return "Error: No C64 IP configured. Run a network scan first."

    try:
        from network_helper import send_dmarun
        with open(prg_path, "rb") as f:
            prg_data = f.read()
        send_dmarun(c64_ip, prg_data)
        return f"Program '{project_name}' sent to C64 and running."
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
            func=lambda _: run_prg(project_name),
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
    oscar_dir = os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "oscar"
    )
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
            func=lambda code: write_source_file(project_name, code),
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
    oscar_dir = os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "oscar"
    )
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
            func=lambda _: compile_code(project_name),
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

_OSCAR_DOCS_BASE = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "oscar",
    "docs",
)


def _read_doc_file(relative_path: str) -> str:
    """Read and return the contents of a documentation file relative to oscar/docs/."""
    path = os.path.join(_OSCAR_DOCS_BASE, relative_path)
    if not os.path.isfile(path):
        return f"Documentation file not found: {path}"
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


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
            func=lambda _: content,
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
            func=lambda _: content,
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
            func=lambda _: content,
        )
        logger.info("get_oscar64_charwin_sprites_input_io_docs tool initialized")
        return tool
    except Exception as e:
        logger.error(
            "Error initializing get_oscar64_charwin_sprites_input_io_docs tool: %s", e
        )
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
            func=lambda _: content,
        )
        logger.info("get_oscar64_graphics_audio_vector_ultimate_docs tool initialized")
        return tool
    except Exception as e:
        logger.error(
            "Error initializing get_oscar64_graphics_audio_vector_ultimate_docs tool: %s",
            e,
        )
    return None
