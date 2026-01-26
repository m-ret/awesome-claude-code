# Claude Code File Structure

This document explains the file hierarchy used by Claude Code and how this repository maps to it.

## Overview

Claude Code uses a layered configuration system:

```
~/.claude/                    # Global (user-level)
├── CLAUDE.md                 # Global rules for all projects
├── commands/                 # Commands available everywhere
│   └── *.md
└── skills/                   # Skills available everywhere
    └── */SKILL.md

~/your-project/               # Project-level
├── CLAUDE.md                 # Project-specific rules
├── CLAUDE.local.md           # Personal (gitignored)
└── .claude/
    ├── commands/             # Project commands
    │   └── *.md
    └── skills/               # Project skills
        └── */SKILL.md
```

## Configuration Files

### CLAUDE.md

The main configuration file. Claude reads this at the start of every session.

**Location Priority:**
1. Project `CLAUDE.md` (highest priority)
2. Global `~/.claude/CLAUDE.md` (lower priority)

Both are read; project config can override or extend global config.

**Contents:**
- Project/user information
- Critical rules (like git identity)
- Auto-behaviors and triggers
- Code conventions
- Available commands and how to use them

### CLAUDE.local.md

Personal configuration that shouldn't be committed to git.

**Use for:**
- Your current focus/task
- Personal notes about the codebase
- WIP experiments
- Local environment quirks

**Always add to `.gitignore`:**
```
CLAUDE.local.md
```

## Commands

Commands are markdown files that define reusable workflows.

### File Format

```markdown
# Command Name

Description of what this command does.

## Arguments
$ARGUMENTS - Description of expected input

## Steps

1. **Step name**
   What to do in this step

2. **Next step**
   Continue the workflow
```

### Location

| Location | Invocation | Scope |
|----------|------------|-------|
| `~/.claude/commands/foo.md` | `/user:foo` | All projects |
| `.claude/commands/bar.md` | `/project:bar` | This project only |

### Example Command

```markdown
# Run Tests

Run the test suite with optional filter.

## Arguments
$ARGUMENTS - Optional test file or pattern to run

## Steps

1. **Check test runner**
   Detect if using Jest, Vitest, or pytest

2. **Run tests**
   ```bash
   npm test $ARGUMENTS
   ```

3. **Report results**
   Summarize pass/fail counts
```

## Skills

Skills are more complex than commands - they can auto-invoke based on conditions.

### File Format

```markdown
---
name: skill-name
description: What this skill does
autoInvoke: true|false
---

# Skill Title

## When to Use
Conditions that trigger this skill

## Steps
1. Step one
2. Step two

## Output
What the skill produces
```

### Location

| Location | Scope |
|----------|-------|
| `~/.claude/skills/name/SKILL.md` | All projects |
| `.claude/skills/name/SKILL.md` | This project only |

### Auto-Invoke

When `autoInvoke: true`, Claude will automatically run the skill when conditions are met:

```yaml
---
name: init-project
description: Initialize project configuration
autoInvoke: true
---
```

This skill triggers when:
- Claude starts in a directory without CLAUDE.md
- The directory appears to be a project (has package.json, etc.)

## This Repository's Structure

```
awesome-claude-code/
│
├── global/                   # → Copy to ~/.claude/
│   ├── CLAUDE.md             # → ~/.claude/CLAUDE.md
│   ├── commands/             # → ~/.claude/commands/
│   │   ├── focus.md
│   │   ├── new-project.md
│   │   ├── quick-commit.md
│   │   └── session-end.md
│   └── skills/               # → ~/.claude/skills/
│       ├── init-project/
│       │   └── SKILL.md
│       └── suggest-automation/
│           └── SKILL.md
│
└── templates/                # → Copy to project root
    ├── nodejs/
    │   ├── CLAUDE.md         # → ./CLAUDE.md
    │   └── .claude/          # → ./.claude/
    │       └── skills/
    │
    ├── nextjs/
    │   ├── CLAUDE.md
    │   └── .claude/
    │
    └── python/
        ├── CLAUDE.md
        └── .claude/
```

## Best Practices

### Global vs Project

| Put in Global | Put in Project |
|---------------|----------------|
| Your identity (name, email) | Project-specific commands |
| Default preferences | Project conventions |
| Cross-project workflows | Tech stack specifics |
| Personal commands | Shared team config |

### Naming Conventions

- **Commands**: lowercase with hyphens (`quick-commit.md`)
- **Skills**: lowercase with hyphens (`init-project/SKILL.md`)
- **Config files**: UPPERCASE (`CLAUDE.md`, `CLAUDE.local.md`)

### Keep It DRY

- Put reusable patterns in global config
- Override in project config only when needed
- Use skills for complex, conditional workflows
- Use commands for simple, manual workflows

## Troubleshooting

### Command not found

Check the file location and naming:
- Global: `~/.claude/commands/name.md` → `/user:name`
- Project: `.claude/commands/name.md` → `/project:name`

### Skill not auto-invoking

Verify:
1. `autoInvoke: true` in frontmatter
2. Trigger conditions are met
3. File is named `SKILL.md` (case-sensitive)

### Config not loading

1. Check file exists in correct location
2. Verify markdown syntax is valid
3. Restart Claude Code session
