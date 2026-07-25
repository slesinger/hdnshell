"""Windows shell resolution shared by every tool that runs POSIX shell commands.

Commands the coding agent and the embedded editor console reach for (ls, cat,
mv, cp, rm, grep, sed, find, ...) are POSIX coreutils and do not exist in
cmd.exe. On Windows these tools require Git for Windows' bash.exe, which ships
real coreutils and is a hard prerequisite for running the HDN Server there
(git is also required for the git tool, so this isn't an extra install for
most users).
"""

import os
import shutil

GIT_BASH_DOWNLOAD_URL = "https://git-scm.com/download/win"


def find_windows_bash() -> str | None:
    """Locate Git for Windows' bash.exe, or None if it isn't installed."""
    found = shutil.which("bash")
    if found:
        return found
    git_exe = shutil.which("git")
    if git_exe:
        git_root = os.path.dirname(os.path.dirname(os.path.abspath(git_exe)))
        candidate = os.path.join(git_root, "bin", "bash.exe")
        if os.path.isfile(candidate):
            return candidate
    for candidate in (
        r"C:\Program Files\Git\bin\bash.exe",
        r"C:\Program Files (x86)\Git\bin\bash.exe",
    ):
        if os.path.isfile(candidate):
            return candidate
    return None


IS_WINDOWS = os.name == "nt"
WINDOWS_BASH = find_windows_bash() if IS_WINDOWS else None
