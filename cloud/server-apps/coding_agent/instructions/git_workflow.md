Git workflow

A `git` tool is available when git is installed on the server. Use it to inspect history and to checkpoint working code, not as a substitute for the file and compile tools.

Guidance:
- Before a larger change, run `git status` and `git diff` to understand the current state.
- Commit only code that compiles. Make small commits with a concrete message, for example: `commit -m "sprite: fix image index (addr/64)"`.
- Stage narrowly (`add <file>`), avoid `add .` when unrelated changes are present.
- If a directory is not a repo yet and the user wants version control, run `init` first.
- Network subcommands (push/pull/fetch/clone/remote) are blocked unless the user explicitly asks to sync with a remote; only then set allow_remote.
- In plan and explore modes, git is read-only: status/log/diff to gather evidence, never commit or reset.

Never claim a commit succeeded unless the tool result confirms it.
