"""Unit tests for assistant memory markdown operations."""

from agent_tools import assistant_memory_operation


def test_assistant_memory_write_read_append_delete(tmp_path):
    root = tmp_path / "assistant"
    root.mkdir()

    write_result = assistant_memory_operation(
        operation="write",
        path="prefs/user.md",
        content="line1\n",
        root_dir=str(root),
    )
    assert "Wrote" in write_result

    read_result = assistant_memory_operation(
        operation="read",
        path="prefs/user.md",
        root_dir=str(root),
    )
    assert read_result == "line1\n"

    append_result = assistant_memory_operation(
        operation="append",
        path="prefs/user.md",
        content="line2\n",
        root_dir=str(root),
    )
    assert "Appended" in append_result

    read_after_append = assistant_memory_operation(
        operation="read",
        path="prefs/user.md",
        root_dir=str(root),
    )
    assert read_after_append == "line1\nline2\n"

    listed = assistant_memory_operation(operation="list", root_dir=str(root))
    assert "prefs/user.md" in listed

    delete_result = assistant_memory_operation(
        operation="delete",
        path="prefs/user.md",
        root_dir=str(root),
    )
    assert "Deleted" in delete_result


def test_assistant_memory_rejects_non_markdown_and_traversal(tmp_path):
    root = tmp_path / "assistant"
    root.mkdir()

    non_md = assistant_memory_operation(
        operation="write",
        path="prefs/user.txt",
        content="x",
        root_dir=str(root),
    )
    assert "only .md files are allowed" in non_md

    traversal = assistant_memory_operation(
        operation="write",
        path="../evil.md",
        content="x",
        root_dir=str(root),
    )
    assert "inside assistant memory root" in traversal
