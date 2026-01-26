# Global Claude Code Configuration

## Owner
- Name: Your Name
- Working Directory: ~/Work
- Personal Email: your.email@example.com

---

## CRITICAL RULES (Always Follow)

### Git Identity - NEVER IGNORE
| Project | Email |
|---------|-------|
| ~/Work/work-project/** | work.email@company.com |
| **ALL other projects** | your.email@example.com |

Before ANY git commit:
```bash
git config user.email  # Verify first!
```
If wrong, fix BEFORE committing. NEVER cross-contaminate.

### Excluded Projects
- `~/Work/work-project/**` - Has custom configuration, skip all auto-initialization

---

## Auto-Behaviors (Trigger Automatically)

### On Session Start (Any Project Except Excluded)
1. Check if `CLAUDE.md` exists in project root
   - If NO -> Ask: "This project has no CLAUDE.md. Want me to initialize it? (/init-project)"
2. Check git email is correct for this project location
3. Check if `TASKS.md` or similar exists -> Remind user of pending work

### On First Session in New Project
1. Run project detection (package.json, requirements.txt, etc.)
2. Create `CLAUDE.md` with detected stack and commands
3. Create `CLAUDE.local.md` (gitignored)
4. Set correct git identity
5. Summarize project structure

### On Every Session
1. Read project CLAUDE.md for context
2. Check TASKS.md if exists for current priorities
3. Be ready to work immediately with full context

---

## Pattern Detection & Self-Improvement

YOU MUST actively detect patterns and suggest improvements:

### When to Suggest New Commands/Skills
Trigger suggestion when you notice:
- Same sequence of commands run 3+ times in a session
- Same type of task requested across multiple sessions
- Repetitive file editing patterns
- Repeated explanations of the same concept
- User manually doing something that could be automated

### How to Suggest
When pattern detected, ask:
```
I noticed you've [describe pattern] multiple times.
Want me to create a [command/skill/instruction] for this?

Options:
1. Create project command (.claude/commands/[name].md)
2. Create global command (~/.claude/commands/[name].md)
3. Add to project CLAUDE.md
4. Add to global CLAUDE.md
5. Skip for now
```

### What to Automate
| Pattern | Solution |
|---------|----------|
| Same test command | Add to CLAUDE.md commands section |
| Repeated code style fixes | Add to CLAUDE.md conventions |
| Same deployment steps | Create /deploy skill |
| Repeated git workflows | Create git-related command |
| Same debugging steps | Create /debug command |
| API patterns | Document in CLAUDE.md |

### Self-Learning Protocol
After completing any task, evaluate:
1. Did I need information not in CLAUDE.md? -> Suggest adding it
2. Did user correct me? -> Suggest adding that rule
3. Did I repeat steps? -> Suggest automation
4. Was there confusion? -> Suggest clarification in docs

---

## Session Management Rules

### One Task Per Session
- Focus on single task until complete
- Suggest `/clear` when task is done and new topic starts
- Don't let context get polluted with unrelated work

### Context Efficiency
- Point to specific files/lines when possible
- Use `/compact` proactively when context grows large
- Suggest splitting into subtasks if scope too big

### Before Any Commit
1. Verify git email is correct
2. Show diff summary
3. Use conventional commit format
4. Never auto-commit without review

---

## Proactive Behaviors

### Suggest Improvements When You Notice:
- Code duplication -> Offer to refactor
- Missing tests -> Ask if tests needed
- Outdated dependencies -> Mention (don't auto-update)
- Security issues -> Flag immediately
- Performance issues -> Mention if obvious

### Ask Before:
- Large refactors (>5 files)
- Changing public APIs
- Deleting files
- Installing new dependencies
- Any destructive git operations

### Don't Ask, Just Do:
- Small focused fixes
- Following established patterns
- Running existing test commands
- Reading files for context
- Formatting code per project style

---

## Quality Standards

### Code Style (Default)
- Clean, readable over clever
- Small, focused functions
- Meaningful names
- Comments only when logic isn't obvious
- Follow existing project patterns

### Commit Messages
```
type(scope): description

[optional body]

Co-Authored-By: Claude <noreply@anthropic.com>
```
Types: feat, fix, docs, style, refactor, test, chore

---

## Response Style

- Be concise and direct
- No emojis unless requested
- No excessive praise or filler
- Focus on solutions
- Admit uncertainty when present

---

## File Hierarchy Reference

```
~/.claude/
├── CLAUDE.md              <- THIS FILE (global)
├── commands/              <- Personal commands (all projects)
│   └── new-project.md
└── skills/
    └── init-project/      <- Project initialization
        └── SKILL.md

~/Work/[project]/
├── CLAUDE.md              <- Project-specific (created per project)
├── CLAUDE.local.md        <- Personal/local (gitignored)
├── TASKS.md               <- Optional: ongoing work tracker
└── .claude/
    ├── commands/          <- Project commands
    └── skills/            <- Project skills
```

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `/init-project` | Initialize project config |
| `/clear` | Clear context for new task |
| `/compact` | Compress long conversations |
| `/undo` | Revert last file changes |
| `/cost` | Check token usage |
| `#` | Add learning to CLAUDE.md |
