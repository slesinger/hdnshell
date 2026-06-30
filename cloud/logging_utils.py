import logging
import re


DEFAULT_LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"


def configure_application_logging(
    level: int = logging.INFO, log_format: str = DEFAULT_LOG_FORMAT
) -> None:
    """Configure the process-wide root logger once."""
    root_logger = logging.getLogger()

    if not root_logger.handlers:
        logging.basicConfig(level=level, format=log_format)
    else:
        root_logger.setLevel(level)

    configure_httpx_request_logging()
    configure_mcp_stream_logging()
    configure_werkzeug_logging()


class HttpxRequestLogDowngradeFilter(logging.Filter):
    """Downgrade httpx request summary logs so they are hidden at INFO level."""

    def filter(self, record: logging.LogRecord) -> bool:
        if record.name.startswith("httpx") and record.getMessage().startswith(
            "HTTP Request:"
        ):
            if logging.getLogger().getEffectiveLevel() > logging.DEBUG:
                return False
            record.levelno = logging.DEBUG
            record.levelname = logging.getLevelName(logging.DEBUG)
        return True


def configure_httpx_request_logging() -> None:
    """Keep httpx request summaries out of logs unless DEBUG is enabled."""
    root_logger = logging.getLogger()
    filter_name = HttpxRequestLogDowngradeFilter.__name__

    if not any(
        type(existing).__name__ == filter_name for existing in root_logger.filters
    ):
        root_logger.addFilter(HttpxRequestLogDowngradeFilter())

    for handler in root_logger.handlers:
        if not any(
            type(existing).__name__ == filter_name for existing in handler.filters
        ):
            handler.addFilter(HttpxRequestLogDowngradeFilter())


class WerkzeugHealthCheckFilter(logging.Filter):
    """Filter out health check and status endpoints from werkzeug HTTP logs."""

    def filter(self, record: logging.LogRecord) -> bool:
        if record.name == "werkzeug":
            # Look for status endpoint paths in the log message
            msg = record.getMessage()
            if "/c64/status" in msg:
                return False
        return True


class McpStreamReconnectLogDowngradeFilter(logging.Filter):
    """Hide noisy MCP stream reconnect chatter unless DEBUG logging is enabled."""

    _reconnect_pattern = re.compile(
        r"GET stream disconnected, reconnecting in \d+ms\.?"
    )

    def filter(self, record: logging.LogRecord) -> bool:
        if record.name == "mcp.client.streamable_http":
            msg = record.getMessage()
            if self._reconnect_pattern.search(msg):
                if logging.getLogger().getEffectiveLevel() > logging.DEBUG:
                    return False
                record.levelno = logging.DEBUG
                record.levelname = logging.getLevelName(logging.DEBUG)
        return True


def configure_mcp_stream_logging() -> None:
    """Keep repetitive MCP reconnect logs out of INFO output."""
    root_logger = logging.getLogger()
    filter_name = McpStreamReconnectLogDowngradeFilter.__name__

    if not any(
        type(existing).__name__ == filter_name for existing in root_logger.filters
    ):
        root_logger.addFilter(McpStreamReconnectLogDowngradeFilter())

    for handler in root_logger.handlers:
        if not any(
            type(existing).__name__ == filter_name for existing in handler.filters
        ):
            handler.addFilter(McpStreamReconnectLogDowngradeFilter())


def configure_werkzeug_logging() -> None:
    """Configure werkzeug logger to exclude health check endpoints."""
    werkzeug_logger = logging.getLogger("werkzeug")
    root_logger = logging.getLogger()
    filter_name = WerkzeugHealthCheckFilter.__name__

    # Add filter to werkzeug logger itself
    if not any(
        type(existing).__name__ == filter_name for existing in werkzeug_logger.filters
    ):
        werkzeug_logger.addFilter(WerkzeugHealthCheckFilter())

    # Add filter to werkzeug logger's handlers
    for handler in werkzeug_logger.handlers:
        if not any(
            type(existing).__name__ == filter_name for existing in handler.filters
        ):
            handler.addFilter(WerkzeugHealthCheckFilter())

    # Add filter to root logger's handlers (werkzeug propagates to root)
    for handler in root_logger.handlers:
        if not any(
            type(existing).__name__ == filter_name for existing in handler.filters
        ):
            handler.addFilter(WerkzeugHealthCheckFilter())
