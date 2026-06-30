Use assistant memory for persistent markdown notes in workspace/assistant.

When to use:
- Save user preferences, custom instructions, and recurring constraints.
- Save current task state, next steps, and decisions.
- Save reusable snippets, checklists, and project conventions.

Tool to use:
- assistant_memory

Operation guide:
- list: Discover existing memory files before creating new ones.
- read: Load relevant notes before answering or acting.
- write: Create or fully replace a note when structure is clear.
- append: Add progress updates or incremental facts.
- delete: Remove obsolete notes when explicitly requested.

Path conventions:
- Use concise, topic-based markdown names, for example:
  - preferences.md
  - instructions.md
  - current_state.md
  - skills.md

Safety rules:
- Keep notes short and actionable.
- Do not store secrets.
- Prefer updating existing files over creating duplicates.
