# Customization Guide

This guide explains how to adapt the configurations in this repository for your own workflow.

## Getting Started

### Step 1: Copy Global Configuration

```bash
# Backup existing config (if any)
cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.bak 2>/dev/null

# Copy from this repo
cp global/CLAUDE.md ~/.claude/CLAUDE.md
cp -r global/commands ~/.claude/
cp -r global/skills ~/.claude/
```

### Step 2: Personalize Global Config

Edit `~/.claude/CLAUDE.md` and update these sections:

#### Owner Section

```markdown
## Owner
- Name: Your Actual Name
- Working Directory: ~/your-work-directory
- Personal Email: your.real@email.com
```

#### Git Identity

```markdown
### Git Identity - NEVER IGNORE
| Project | Email |
|---------|-------|
| ~/Work/company-project/** | work@company.com |
| **ALL other projects** | personal@email.com |
```

Add entries for each work context where you need a different email.

#### Excluded Projects

```markdown
### Excluded Projects
- `~/Work/legacy-project/**` - Has its own setup
- `~/Work/client-work/**` - Client-managed configuration
```

### Step 3: Customize Commands

Each command in `~/.claude/commands/` can be modified:

#### quick-commit.md

Update the email verification logic:

```markdown
Check against location:
- If in ~/Work/company/** -> must be work@company.com
- If in ~/Work/client/** -> must be client@example.com
- Otherwise -> must be personal@email.com
```

#### focus.md

Add your preferred focus session format or tools.

#### session-end.md

Customize what gets captured at session end.

## Project Templates

### Using a Template

1. Copy template files to your project:
   ```bash
   cp templates/nodejs/CLAUDE.md ./CLAUDE.md
   cp -r templates/nodejs/.claude ./.claude
   ```

2. Edit the project `CLAUDE.md`:
   - Update project name and description
   - Verify commands match your setup
   - Add project-specific conventions

### Creating Your Own Template

1. Start with the closest existing template
2. Modify for your tech stack
3. Add relevant skills
4. Save to your own templates directory

Example for a Go project:

```markdown
# Go Project

## Tech Stack
- Runtime: Go 1.21+
- Framework: [Gin / Echo / Chi / stdlib]
- Testing: go test
- Linting: golangci-lint

## Commands

### Development
```bash
go run ./cmd/server
```

### Build
```bash
go build -o bin/app ./cmd/server
```

### Test
```bash
go test ./...
# With coverage
go test -cover ./...
```

### Lint
```bash
golangci-lint run
```
```

## Creating Custom Commands

### Command Template

```markdown
# Command Name

Brief description of what this does.

## Arguments
$ARGUMENTS - What the user can pass (or "None required")

## Steps

1. **Step Name**
   What to do

2. **Next Step**
   Continue workflow

## Output
What the user should see when done
```

### Example: Custom Deploy Command

`.claude/commands/deploy.md`:

```markdown
# Deploy to Staging

Deploy the current branch to staging environment.

## Arguments
$ARGUMENTS - Optional: "skip-tests" to bypass test run

## Prerequisites
- All changes committed
- On a feature branch (not main)
- Tests passing (unless skipped)

## Steps

1. **Verify branch**
   ```bash
   git branch --show-current
   ```
   Must not be `main` or `master`.

2. **Run tests** (unless $ARGUMENTS contains "skip-tests")
   ```bash
   npm test
   ```

3. **Build**
   ```bash
   npm run build
   ```

4. **Deploy**
   ```bash
   ./scripts/deploy-staging.sh
   ```

5. **Verify**
   Check staging URL is accessible.

## Output
```
Deployed to staging: https://staging.example.com
Branch: [branch-name]
Commit: [short-hash]
```
```

## Creating Custom Skills

### Skill Template

```markdown
---
name: skill-name
description: One-line description
autoInvoke: true  # or false
---

# Skill Title

## When to Use
- Trigger condition 1
- Trigger condition 2

## Steps

1. **Step one**
   Details

2. **Step two**
   Details

## Output
What gets produced
```

### Example: Database Migration Skill

`.claude/skills/db-migrate/SKILL.md`:

```markdown
---
name: db-migrate
description: Run database migrations safely
autoInvoke: false
---

# Database Migration Skill

## When to Use
- After pulling changes that include migrations
- Before deploying to any environment
- When user requests migration run

## Pre-flight Checks

1. **Verify database connection**
   ```bash
   npx prisma db execute --stdin <<< "SELECT 1"
   ```

2. **Check pending migrations**
   ```bash
   npx prisma migrate status
   ```

3. **Backup reminder**
   If production, remind user to backup first.

## Steps

1. **Run migrations**
   ```bash
   npx prisma migrate deploy
   ```

2. **Regenerate client**
   ```bash
   npx prisma generate
   ```

3. **Verify**
   ```bash
   npx prisma migrate status
   ```

## Output
```
Migration complete
Applied: [list of migrations]
Database: [connection info, sanitized]
```
```

## Advanced Customization

### Multiple Work Contexts

If you work on different types of projects, create context-specific globals:

```
~/.claude/
├── CLAUDE.md                    # Base config
├── contexts/
│   ├── work.md                  # Work-specific rules
│   └── personal.md              # Personal project rules
```

Reference in base config:
```markdown
## Context Detection
- If in ~/Work/company → Apply work.md rules
- Otherwise → Apply personal.md rules
```

### Team Shared Config

For team projects, commit a shared configuration:

```
your-project/
├── CLAUDE.md                    # Shared team config (committed)
├── CLAUDE.local.md              # Personal config (gitignored)
└── .claude/
    └── skills/                  # Team skills (committed)
```

Team CLAUDE.md should include:
- Project setup instructions
- Code conventions everyone follows
- Shared commands
- Testing requirements

### Integration with Other Tools

#### Pre-commit Hooks

Add to your project's `.pre-commit-config.yaml`:
```yaml
repos:
  - repo: local
    hooks:
      - id: claude-pre-commit
        name: Claude Pre-commit Check
        entry: claude -p "Run /pre-commit skill"
        language: system
        pass_filenames: false
```

#### CI/CD

Reference CLAUDE.md conventions in CI:
```yaml
# .github/workflows/lint.yml
jobs:
  lint:
    steps:
      - name: Lint
        run: npm run lint  # Same command as in CLAUDE.md
```

## Tips

### Keep It Simple

- Start with the base templates
- Add customizations gradually
- Remove what you don't use

### Document Your Changes

Add comments in your config:
```markdown
## Custom Rules

<!-- Added 2024-01: Team agreed on this convention -->
- Always use named exports
- Prefer composition over inheritance
```

### Version Control Your Config

Consider versioning your global config:
```bash
cd ~/.claude
git init
git add CLAUDE.md commands/ skills/
git commit -m "Initial Claude Code config"
```

### Share What Works

If you create useful commands or skills, consider contributing them back to this repository!
