# Project Instructions

## File Modification Policy

Do not edit, patch, create, delete, move, rename, format, or otherwise modify any project file unless the user explicitly approves the exact file path in the current conversation.

Inspection, diagnosis, explanation, and recommendations are read-only.

Phrases like "check", "look at", "review", "diagnose", "why", "what is wrong", "is this right", or "can you tell me" do not authorize file changes.

Task intent is not file-edit permission. Phrases like "make this work", "wire this up", "implement this", "fix it", "I want you to make X happen", or "add this behavior" are not sufficient permission by themselves.

Before modifying any non-AGENTS.md project file, the assistant must:

1. List the exact file path or paths it wants to modify.
2. Briefly state the intended change for each file.
3. Wait for explicit user confirmation approving those paths.

The assistant may edit this `AGENTS.md` file when new general project instructions arise. When doing so, inform the user that the file was changed and summarize the instruction that was added or updated.

## Context Gathering

It is expected that the assistant will open and read project files when helpful for answering questions accurately.

If it would help answer a Godot-related question, the assistant is encouraged to use the Godot MCP tools for read-only inspection and context gathering.

## Godot Guidance Style

The user wants to become a Godot expert and is currently proficient. When answering Godot questions, explain the robust pattern and the reason behind it, call out tradeoffs where useful, and prefer maintainable project structure over quick hacks.

## Git Policy

Do not interact with git in this project unless the user explicitly asks for a git operation in the current conversation.

Do not run git commands, inspect git status, stage files, commit files, create branches, switch branches, push, pull, merge, rebase, reset, restore, checkout, stash, or edit git metadata unless explicitly authorized.

Git-related phrases like "what changed", "diff", "status", "commit", "branch", or "tracking" should be treated as requests for explanation only unless the user explicitly asks to run a git command or modify git configuration.
