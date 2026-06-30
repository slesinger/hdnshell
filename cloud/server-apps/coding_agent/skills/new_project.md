Use this skill when creating a brand new Oscar C64 project from scratch.

Project scaffold rules:
- Create the project inside `workspace/oscar/<name>`.
- Create exactly two starter files: `<name>.c` and `<name>.md`.
- Keep the C file minimal and buildable so compile can run immediately.
- Use the markdown file for project overview, build notes, file list, and TODO items.

Preferred workflow:
1. If the user requests a new project, use `/new-project <name>` when available.
2. After scaffolding, switch work to that project directory.
3. Put implementation details in `<name>.c` and design notes in `<name>.md`.

Do not overwrite an existing project scaffold unless the user explicitly asks for it.