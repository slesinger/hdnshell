"""Unit tests for guarded shell execution tool."""

from agent_tools import run_shell_command


def test_run_shell_command_blocks_outside_root(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_shell_command(
        command="pwd",
        cwd="..",
        root_dir=str(root),
    )

    assert "outside allowed root" in result.lower()


def test_run_shell_command_blocks_write_by_default(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_shell_command(
        command="touch blocked.txt",
        cwd=".",
        root_dir=str(root),
    )

    assert "blocks" in result.lower()
    assert not (root / "blocked.txt").exists()


def test_run_shell_command_allows_write_when_explicit(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_shell_command(
        command="touch allowed.txt",
        cwd=".",
        allow_write=True,
        root_dir=str(root),
    )

    assert "exit_code: 0" in result
    assert (root / "allowed.txt").exists()


def test_run_shell_command_truncates_output_to_last_200_lines(tmp_path):
    root = tmp_path / "root"
    root.mkdir()

    result = run_shell_command(
        command="seq 1 250",
        cwd=".",
        root_dir=str(root),
    )

    assert "output truncated to last 200 lines" in result
    assert "\n1\n" not in result
    assert "\n51\n" in result
    assert "\n250\n" in result
