"""
Workspace initialisation for the HDN Cloud Server.

On first run (or whenever the workspace directory is missing) this module
creates the canonical directory tree and seed files:

    workspace/
    ├── .config/
    │   └── cloud_config.cfg   (from cloud_config_template.py)
    ├── oscar/
    │   └── hello-c64/
    │       └── hello-c64.c
    ├── games/
    ├── docs/
    └── demos/
"""

import os
import logging

from cloud_config_template import CLOUD_CONFIG_TEMPLATE

logger = logging.getLogger(__name__)

# The workspace lives next to the cloud/ package directory.
WORKSPACE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "workspace")

HELLO_C64_C = """\
int main() {
    printf("Hello C64");
}
"""


def init_workspace() -> str:
    """
    Ensure the workspace directory tree exists.
    Returns the absolute path to the workspace root.
    """
    _ensure_dir(WORKSPACE_DIR)

    # .config + seed config
    config_dir = os.path.join(WORKSPACE_DIR, ".config")
    _ensure_dir(config_dir)
    config_file = os.path.join(config_dir, "cloud_config.cfg")
    if not os.path.exists(config_file):
        with open(config_file, "w") as f:
            f.write(CLOUD_CONFIG_TEMPLATE)
        logger.info("Created default %s", config_file)

    # oscar sample project
    hello_dir = os.path.join(WORKSPACE_DIR, "oscar", "hello-c64")
    _ensure_dir(hello_dir)
    hello_file = os.path.join(hello_dir, "hello-c64.c")
    if not os.path.exists(hello_file):
        with open(hello_file, "w") as f:
            f.write(HELLO_C64_C)
        logger.info("Created sample %s", hello_file)

    # Empty default directories
    for name in ("games", "docs", "demos"):
        _ensure_dir(os.path.join(WORKSPACE_DIR, name))

    logger.info("Workspace ready at %s", WORKSPACE_DIR)
    return WORKSPACE_DIR


def get_workspace_config_path() -> str:
    """Return the path to workspace/.config/cloud_config.cfg."""
    return os.path.join(WORKSPACE_DIR, ".config", "cloud_config.cfg")


def _ensure_dir(path: str):
    os.makedirs(path, exist_ok=True)
