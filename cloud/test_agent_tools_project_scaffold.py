"""Unit tests for coding-agent project scaffolding helpers."""

import os

import pytest

import agent_tools
from agent_tools import create_project_scaffold


def test_create_project_scaffold_creates_workspace_oscar_project(
    monkeypatch, tmp_path
):
    monkeypatch.setattr(agent_tools, "WORKSPACE_DIR", str(tmp_path))

    project_dir, created_files = create_project_scaffold("sprite-lab")

    assert project_dir == os.path.join(str(tmp_path), "oscar", "sprite-lab")
    assert created_files == ["sprite-lab.c", "sprite-lab.md"]

    c_path = os.path.join(project_dir, "sprite-lab.c")
    md_path = os.path.join(project_dir, "sprite-lab.md")

    assert os.path.isfile(c_path)
    assert os.path.isfile(md_path)

    with open(c_path, "r", encoding="utf-8") as f:
        c_source = f.read()
    with open(md_path, "r", encoding="utf-8") as f:
        markdown = f.read()

    assert "int main(void)" in c_source
    assert "# sprite-lab" in markdown
    assert "## Overview" in markdown


def test_create_project_scaffold_rejects_invalid_or_duplicate_names(
    monkeypatch, tmp_path
):
    monkeypatch.setattr(agent_tools, "WORKSPACE_DIR", str(tmp_path))

    with pytest.raises(ValueError):
        create_project_scaffold("../oops")

    create_project_scaffold("demo")
    with pytest.raises(ValueError):
        create_project_scaffold("demo")
