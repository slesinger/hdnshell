# Coding Agent Assets

This folder organizes assets used by coding agents in a structure similar to modern agent systems.

## Structure
- prompts/: markdown prompt templates consumed by handlers.
- instructions/: reusable instruction documents and policies.
- skills/: domain skills and task-specific guides.
- agents/: per-agent definitions, notes, and configs.

## Current usage
- handlers/code_chat_handler.py loads system prompts from server-apps/coding_agent/prompts/.

Keep files small and focused so handlers can compose them safely.
