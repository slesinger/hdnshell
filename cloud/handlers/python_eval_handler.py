"""
PythonEvalHandler - Evaluates Python expressions

Provides safe Python expression evaluation for C64 users.
Processes requests starting with ":"
"""

import importlib
import logging
import math
from typing import Any
from sdk import (
    BaseHandler,
    dma_read_memory,
    dma_write_memory_rest,
    get_session_state_copy,
    read_last_c64_ip,
)

logger = logging.getLogger(__name__)

C64_ADDRESS_SPACE = 0x10000

# Modules that "import x" / "from x import y" may load. Anything else
# (os, sys, subprocess, socket, ...) stays unreachable since __builtins__
# has no real __import__ - see _safe_import.
SAFE_IMPORT_MODULES = frozenset(
    {
        "math",
        "random",
        "string",
        "datetime",
        "time",
        "statistics",
        "itertools",
        "functools",
        "re",
        "json",
        "textwrap",
    }
)


def _safe_import(name, globals=None, locals=None, fromlist=(), level=0):
    if level != 0:
        raise ImportError("relative imports are not allowed")
    if name.split(".")[0] not in SAFE_IMPORT_MODULES:
        raise ImportError(f"import of '{name}' is not allowed")
    return importlib.import_module(name)

# Safe built-in functions allowed during eval
SAFE_BUILTINS = {
    "abs": abs,
    "bin": bin,
    "bool": bool,
    "chr": chr,
    "divmod": divmod,
    "float": float,
    "hex": hex,
    "int": int,
    "len": len,
    "max": max,
    "min": min,
    "oct": oct,
    "ord": ord,
    "pow": pow,
    "round": round,
    "str": str,
    "sum": sum,
    "print": print,
}

# Safe math functions
SAFE_MATH = {
    "pi": math.pi,
    "e": math.e,
    "sqrt": math.sqrt,
    "sin": math.sin,
    "cos": math.cos,
    "tan": math.tan,
    "floor": math.floor,
    "ceil": math.ceil,
    "log": math.log,
    "log10": math.log10,
    "exp": math.exp,
}


class RamProxy:
    """
    Lazy, slice-addressable view onto the live C64's RAM, backed by the
    Ultimate REST readmem/writemem API (dma_read_memory/dma_write_memory_rest).

    Indexing mirrors real Python bytes/bytearray semantics exactly, so
    PySIC snippets read like ordinary Python:
        ram[0xd020]              -> single byte, as an int
        ram[0x0400:0x0800]       -> bytes, half-open like any Python slice
        ram[0xd020] = 1          -> single-byte write
        ram[0x0400:0x0402] = [1, 2]  -> block write, length must match the slice
    """

    def __init__(self, host: str):
        self._host = host

    def __getitem__(self, key):
        if isinstance(key, slice):
            start, stop, step = key.indices(C64_ADDRESS_SPACE)
            if step != 1:
                raise ValueError("ram slices must have step 1")
            return dma_read_memory(self._host, start, stop - start)
        return dma_read_memory(self._host, key, 1)[0]

    def __setitem__(self, key, value):
        if isinstance(key, slice):
            start, stop, step = key.indices(C64_ADDRESS_SPACE)
            if step != 1:
                raise ValueError("ram slices must have step 1")
            data = bytes(value)
            if len(data) != stop - start:
                raise ValueError(f"expected {stop - start} bytes, got {len(data)}")
        else:
            start, data = key, bytes([value & 0xFF])
        dma_write_memory_rest(self._host, start, data)

    def __len__(self):
        return C64_ADDRESS_SPACE


class PythonEvalHandler(BaseHandler):
    """Handler for Python expression evaluation"""

    def __init__(self):
        """Initialize PythonEvalHandler"""
        # Create safe namespace
        self.safe_namespace = {}
        self.safe_namespace.update(SAFE_BUILTINS)
        self.safe_namespace.update(SAFE_MATH)

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        """
        Check if text starts with ":"

        Args:
            text: UTF-8 text to check

        Returns:
            True if text starts with ":"
        """
        return text.strip().startswith(":")

    def handle(self, text: str, session_id: int = 0) -> str:
        """
        Evaluate Python expression and return result, capturing printed output

        Args:
            text: UTF-8 text (should start with ":")

        Returns:
            UTF-8 response text with evaluation result or printed output
        """
        import io
        import contextlib

        # Remove ":" prefix
        expression = text.strip()[1:].strip()

        if not expression:
            return "Please provide an expression to evaluate after ':'"

        logger.info(f"Evaluating: {expression}")

        state = get_session_state_copy(session_id)
        host = state.get("client_ip") or read_last_c64_ip()
        namespace = dict(self.safe_namespace)
        namespace["ram"] = RamProxy(host)

        # Plain expressions (":0x2000", ":ram[0xd020]") are eval'd so we can
        # format and return their value. Statements ("ram[0xd020] = 1") aren't
        # valid as an eval expression, so fall back to exec for those - this
        # is what lets pysic accept real Python assignment syntax.
        try:
            code = compile(expression, "<pysic>", "eval")
            is_statement = False
        except SyntaxError:
            try:
                code = compile(expression, "<pysic>", "exec")
                is_statement = True
            except SyntaxError as e:
                logger.warning(f"Syntax error: {e}")
                return f"Syntax error: {e.msg}"

        output_buffer = io.StringIO()
        try:
            with contextlib.redirect_stdout(output_buffer):
                if is_statement:
                    exec(code, {"__builtins__": {"__import__": _safe_import}}, namespace)
                    result = None
                else:
                    result = eval(code, {"__builtins__": {"__import__": _safe_import}}, namespace)
            printed = output_buffer.getvalue().strip()
            # If something was printed, return it; otherwise, return the result
            if printed:
                logger.info(f"Printed output: {printed}")
                return printed
            if is_statement:
                return "OK"
            result_str = self._format_result(result)
            logger.info(f"Result: {result_str}")
            return result_str
        except NameError as e:
            logger.warning(f"Name error: {e}")
            return f"Unknown name: {str(e)}"
        except Exception as e:
            logger.error(f"Evaluation error: {e}")
            return f"Error: {str(e)}"

    def _format_result(self, result: Any) -> str:
        """
        Format evaluation result for display

        Args:
            result: Evaluation result

        Returns:
            Formatted string
        """
        # Handle different types appropriately
        if isinstance(result, bool):
            return str(result)
        elif isinstance(result, int):
            # For C64 users, also show hex for interesting values
            if result >= 0 and result <= 65535:
                return f"{result} (${result:04X})"
            return str(result)
        elif isinstance(result, float):
            return f"{result:.6f}".rstrip("0").rstrip(".")
        elif isinstance(result, str):
            return f'"{result}"'
        else:
            return str(result)
