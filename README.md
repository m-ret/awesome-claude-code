# Awesome Claude Code

A curated collection of configurations, commands, skills, and templates for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) - Anthropic's agentic coding tool.

## What's Inside

- **Global Configuration** - Battle-tested `CLAUDE.md` with rules, behaviors, and patterns
- **Commands** - Reusable workflow commands for common tasks
- **Skills** - Auto-invokable skills for project initialization and pattern detection
- **Templates** - Ready-to-use project templates for Node.js, Next.js, and Python

## Quick Start

### 1. Install Global Configuration

Copy the global configuration to your Claude Code config directory:

```bash
# Create directory if it doesn't exist
mkdir -p ~/.claude

# Copy global config
cp global/CLAUDE.md ~/.claude/CLAUDE.md

# Copy commands
cp -r global/commands ~/.claude/

# Copy skills
cp -r global/skills ~/.claude/
```

### 2. Customize for Your Setup

Edit `~/.claude/CLAUDE.md` and update:
- Your name
- Your email addresses
- Any excluded project paths
- Personal preferences

### 3. Use Project Templates

When starting a new project, copy the relevant template:

```bash
# For a Node.js project
cp templates/nodejs/CLAUDE.md ./CLAUDE.md
cp -r templates/nodejs/.claude ./.claude

# For a Next.js project
cp templates/nextjs/CLAUDE.md ./CLAUDE.md
cp -r templates/nextjs/.claude ./.claude

# For a Python project
cp templates/python/CLAUDE.md ./CLAUDE.md
cp -r templates/python/.claude ./.claude
```

Or let the `/init-project` skill auto-detect and configure your project!

## Repository Structure

```
awesome-claude-code/
├── README.md              # You are here
├── STRUCTURE.md           # File hierarchy explanation
├── CUSTOMIZATION.md       # How to customize for your workflow
│
├── global/                # Global (user-level) configuration
│   ├── CLAUDE.md          # Global rules and behaviors
│   ├── commands/          # Global commands
│   │   ├── focus.md       # Start focused work sessions
│   │   ├── new-project.md # Initialize new projects
│   │   ├── quick-commit.md# Fast commit with identity check
│   │   └── session-end.md # End-of-session review
│   └── skills/            # Global skills
│       ├── init-project/  # Auto-detect and initialize projects
│       └── suggest-automation/ # Pattern detection
│
└── templates/             # Project templates
    ├── nodejs/            # Node.js/TypeScript template
    ├── nextjs/            # Next.js template
    └── python/            # Python template
```

## Features

### Global Configuration (`global/CLAUDE.md`)

The global configuration provides:

- **Git Identity Management** - Automatically verify correct email per project
- **Auto-Behaviors** - What Claude should do on session start
- **Pattern Detection** - Self-improving through pattern recognition
- **Session Management** - Keep focused, manage context efficiently
- **Quality Standards** - Default code style and commit conventions

### Commands

| Command | Description |
|---------|-------------|
| `/focus` | Start a focused work session on a specific task |
| `/new-project` | Initialize Claude Code configuration for current project |
| `/quick-commit` | Fast commit workflow with git identity verification |
| `/session-end` | End-of-session review to capture learnings |

### Skills

| Skill | Description |
|-------|-------------|
| `/init-project` | Auto-detects project type and creates appropriate configuration |
| `/suggest-automation` | Monitors for repetitive patterns and suggests automations |

### Project Templates

Each template includes:
- Pre-configured `CLAUDE.md` with project-specific conventions
- Relevant skills for that tech stack
- Common commands and patterns

## How It Works

### CLAUDE.md Hierarchy

Claude Code reads configuration files in order of specificity:

1. `~/.claude/CLAUDE.md` - Global (applies to all projects)
2. `./CLAUDE.md` - Project-specific (in project root)
3. `./CLAUDE.local.md` - Personal/local (gitignored, for your preferences)

### Commands vs Skills

**Commands** are manually invoked workflows:
```
/user:focus implement user authentication
```

**Skills** can be auto-invoked based on triggers:
- Project initialization when no CLAUDE.md exists
- Pattern detection during work sessions

## Contributing

Contributions are welcome! If you have useful configurations, commands, or skills:

1. Fork this repository
2. Add your contribution
3. Submit a pull request

### Guidelines

- Keep configurations generic (no personal info)
- Include clear documentation
- Test your configurations before submitting
- Follow existing file structure and naming conventions

## License

MIT License - Feel free to use, modify, and share.

## Credits

Built for use with [Claude Code](https://docs.anthropic.com/en/docs/claude-code) by Anthropic.

---

*Found this useful? Star the repo and share with others!*
