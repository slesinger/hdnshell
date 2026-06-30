## Plan: Oscar64 Coding Agent Harness

Build a compact but real prompt harness for the existing Oscar64 coding agent under the live runtime path, not a parallel tree. Curate only the Claude Code assets that directly improve multi-file C/H editing, planning, exploration, verification, and repo memory; then wire the current agent so those assets are actually loadable as instructions, skills, and at least one explore-style subagent or mode.

**Steps**
1. Confirm the live asset root and keep scope anchored to the existing runtime path: /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent. Treat the user-mentioned cloud/oscar/server_apps/workspace/coding_agent path as out of scope unless a later requirement explicitly needs mirroring.
2. Curate a small asset set from temp/claude-code-system-prompts by purpose, not by wholesale copy. Include only: communication style, harness identity, action safety/truthful reporting, plan-mode concepts, explore-agent concepts, selective memory guidance, and tool-use discipline. Exclude browser, GitHub, PR, scheduling, analytics, managed-agent API, onboarding, and team-memory assets.
3. Adapt the curated prompt content to Oscar64/C64 realities before copying: replace generic tool references with the actual local tools already exposed by agent_tools.py; replace generic software workflows with Oscar64 compile/run loops; keep the existing verified guardrails about no API guessing and sprite image index arithmetic; and make multi-file C/H project editing the default mental model. This blocks later runtime wiring because file names and document structure need to be stable first.
4. Define a minimal prompt architecture under the existing asset tree. Recommended structure:
- prompts/: base system prompt, single-file prompt, multi-file prompt, plan prompt, explore prompt
- instructions/: reusable instruction snippets for communication style, action safety, compile-run verification, Oscar64 symbol verification, repo-memory usage
- skills/: compact domain playbooks such as multi-file refactor workflow, sprite workflow, memory-layout checks, build-debug loop
- agents/: metadata or prompt wrappers for a planner and an explorer
5. Add prompt-composition/loading support in /home/honza/projects/c64/projects/hdnsh/cloud/handlers/code_chat_handler.py. Replace the current two-file hardcoded prompt setup with a small loader/composer that can assemble: base prompt + shared instructions + mode-specific prompt + optional skill snippets + current source snapshot + user-name personalization. Keep backward compatibility with current single-file and multi-file modes.
6. Add a compact runtime model for skills and subagents. Recommended v1 approach: keep everything inside the current coding agent process rather than adding new server consoles. Implement explicit mode selection or command-level dispatch for planner and explorer behaviors, backed by distinct prompt bundles and restricted tool subsets. This can run in parallel conceptually with step 7 after the prompt file format is chosen, but both depend on step 5.
7. Extend the current multi-file tooling flow to support an explore specialist and planning discipline without bloating the harness. Reuse the existing read/list/compile/run/find_oscar_symbol/doc tools from /home/honza/projects/c64/projects/hdnsh/cloud/agent_tools.py. The explorer should be read-only; the planner should be analysis-only; the default coder mode keeps write/compile/run access.
8. Decide how the C64 console exposes the new capabilities in /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent_console.py. Preferred v1: add lightweight slash commands or mode toggles rather than new UI surfaces. Examples: a planner command, an explorer command, a skills listing command, and a command to clear/reset mode.
9. Add repo-memory support only where it directly improves coding reliability. Use the existing memory concept to load a few local facts such as Oscar64 path resolution, memory-map constraints, or project-specific build conventions, but avoid full Claude-style memory infrastructure. Keep it optional and bounded to repo notes already present.
10. Preserve a small harness by explicitly limiting v1 scope: no autonomous loops, no browser-like tooling, no Git workflows, no background orchestration, no large skill catalog, and no full Claude Code prompt clone. This is a compact Oscar64-specialized harness, not a general reproduction.
11. Verify the harness with behavior-scoped checks: prompt file loading, mode routing, tool restrictions by mode, multi-file editing flow, compile-fix-run loop, and at least one example where the explorer/planner mode behaves differently from the default coder mode.

**Relevant files**
- /home/honza/projects/c64/projects/hdnsh/cloud/handlers/code_chat_handler.py — current prompt loading, mode switching, tool rebuilding, and the best integration point for composed prompts plus planner/explorer routing
- /home/honza/projects/c64/projects/hdnsh/cloud/agent_tools.py — existing tool surface to reuse and possibly subset per mode
- /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent_console.py — current user-facing C64 chat console and likely place for slash-command/mode exposure
- /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent/prompts/code_chat_single_file_system_prompt.md — current single-file prompt to split into base plus mode-specific content
- /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent/prompts/code_chat_multi_file_system_prompt.md — current multi-file prompt to refactor into the new prompt composition model
- /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent/instructions/README.md — placeholder location to replace with actual reusable instruction assets
- /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent/skills/README.md — placeholder location to replace with curated Oscar64 skills
- /home/honza/projects/c64/projects/hdnsh/cloud/server-apps/coding_agent/agents/README.md — placeholder location for planner/explorer agent definitions or metadata
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/system-prompt-outcome-first-communication-style.md — primary source for concise outcome-first interaction style
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/system-prompt-communication-style.md — source for concise progress/reporting behavior
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/system-prompt-action-safety-and-truthful-reporting.md — source for safe execution/reporting constraints
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/system-prompt-executing-actions-with-care.md — source for caution around stateful edits and destructive actions
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/system-prompt-harness-instructions.md — source for core harness behavior to adapt, not copy literally
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/system-prompt-memory-instructions.md — selective inspiration for compact repo-memory behavior
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/system-prompt-exploratory-questions-analyze-before-implementing.md — source for planner behavior when the user is asking for options/tradeoffs
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/data-tool-use-concepts.md — inspiration for describing tool discipline, not for verbatim copy
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/agent-prompt-explore.md — main source for a read-only explorer agent/mode
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/agent-prompt-plan-mode-enhanced.md — main source for planning behavior
- /home/honza/projects/c64/projects/hdnsh/temp/claude-code-system-prompts/system-prompts/agent-prompt-general-purpose.md — secondary source for multi-file agent behavior, to adapt selectively

**Verification**
1. Read the composed prompts as loaded by the handler and confirm each runtime mode receives the intended instruction stack: default coder, planner, and explorer.
2. Exercise the C64-facing console command path and confirm users can switch into planner/explorer behavior without losing existing multi-file coding flow.
3. Run at least one multi-file C/H scenario through the default coder mode and confirm the agent uses write, compile, and run tools in the expected sequence.
4. Run a read-only exploration request and confirm the explore mode cannot write or compile.
5. Run a planning-style request and confirm the planner produces a scoped plan rather than editing code.
6. Verify existing guardrails still survive prompt refactoring: Oscar64 API verification via symbol lookup and sprite image index validation warnings.

**Decisions**
- Included scope: curated Claude-inspired assets, adapted prompt content, real runtime loading for skills/instructions, and compact planner/explorer support inside the existing coding agent.
- Excluded scope: wholesale Claude Code prompt mirror, new server console types, GitHub/PR workflows, browser tooling, managed-agent infrastructure, analytics, autonomous loops, and heavy memory systems.
- Recommended architecture: one coding agent harness with prompt bundles and tool subsets per mode, not multiple separate heavyweight agents.
- Recommended UX: expose new behaviors through simple commands in the current C64 console rather than building another interface.

**Further Considerations**
1. Skill format decision: simplest path is markdown snippets with frontmatter-like metadata; richer structured skill manifests can wait until there is a second generation of skills.
2. Subagent boundary: v1 can emulate subagents as separately prompted internal modes inside the same handler. True multi-agent orchestration should wait until there is evidence this compact approach is insufficient.
3. Prompt size control: keep copied/adapted assets aggressively pruned so the live system prompt stays focused on Oscar64 compilation, C64 constraints, and actual available tools.