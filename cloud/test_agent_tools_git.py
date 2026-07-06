"""Unit tests for the guarded git version-control tool."""

import shutil

import pytest

from agent_tools import run_git_command, create_git_tool

pytestmark = pytest.mark.skipif(
    shutil.which("git") is None, reason="git not installed"
)


def test_git_blocks_outside_root(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_git_command(args="status", cwd="..", root_dir=str(root))

    assert "outside allowed root" in result.lower()


def test_git_hints_when_not_a_repo(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_git_command(args="status", root_dir=str(root))

    assert "not a git repo" in result.lower()


def test_git_blocks_remote_by_default(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_git_command(args="push origin main", root_dir=str(root))

    assert "blocked by default" in result.lower()
    assert "allow_remote" in result.lower()


def test_git_allows_remote_when_explicit(tmp_path):
    root = tmp_path / "root"
    root.mkdir()
    run_git_command(args="init", root_dir=str(root))

    # With allow_remote the guard is lifted; the command still fails because no
    # remote is configured, but it is NOT rejected by our gate.
    result = run_git_command(
        args="push origin main", allow_remote=True, root_dir=str(root)
    )

    assert "blocked by default" not in result.lower()


def test_git_strips_leading_git_and_runs(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    init = run_git_command(args="init", root_dir=str(root))
    assert "exit_code: 0" in init

    result = run_git_command(args="git status", root_dir=str(root))
    assert "exit_code: 0" in result


def test_git_empty_args_rejected(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_git_command(args="   ", root_dir=str(root))

    assert "must not be empty" in result.lower()


def test_create_git_tool_returns_named_tool(tmp_path):
    tool = create_git_tool(root_dir=str(tmp_path))

    assert tool is not None
    assert tool.name == "git"
