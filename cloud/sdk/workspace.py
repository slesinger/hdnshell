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
import sys
import glob
import shutil
import logging

from .cloud_config_template import CLOUD_CONFIG_TEMPLATE

logger = logging.getLogger(__name__)

# In a PyInstaller one-file bundle __file__ resolves to sys._MEIPASS (a temp dir
# deleted on exit). Anchor the workspace to the binary instead so it persists.
if getattr(sys, "frozen", False):
    _base_dir = os.path.dirname(sys.executable)
else:
    _base_dir = os.path.dirname(os.path.abspath(__file__))
WORKSPACE_DIR = os.path.join(_base_dir, "workspace")

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

    # Copy bundled oscar docs (C_0*.md) into workspace/docs/
    _copy_bundled_docs(os.path.join(WORKSPACE_DIR, "docs"))

    logger.info("Workspace ready at %s", WORKSPACE_DIR)
    return WORKSPACE_DIR


def get_workspace_config_path() -> str:
    """Return the path to workspace/.config/cloud_config.cfg."""
    return os.path.join(WORKSPACE_DIR, ".config", "cloud_config.cfg")


def _ensure_dir(path: str):
    os.makedirs(path, exist_ok=True)


def _copy_bundled_docs(docs_dir: str):
    """Copy bundled oscar/docs/C_0*.md files into the workspace docs directory."""
    base_dir = os.path.dirname(os.path.abspath(__file__))
    # PyInstaller bundle path: oscar/docs next to the executable
    bundled_docs_dir = os.path.join(base_dir, "oscar", "docs")
    # Development path: oscar/docs is one level up from cloud/
    dev_docs_dir = os.path.join(base_dir, "..", "oscar", "docs")
    for search_dir in (bundled_docs_dir, dev_docs_dir):
        for src in glob.glob(os.path.join(search_dir, "C_0*.md")):
            dst = os.path.join(docs_dir, os.path.basename(src))
            if not os.path.exists(dst):
                shutil.copy2(src, dst)
                logger.info("Copied %s -> %s", src, dst)
