---
name: suggest-automation
description: Detect repetitive patterns and suggest creating commands, skills, or instructions to automate them.
autoInvoke: true
---

# Pattern Detection & Automation Suggestion Skill

## When to Trigger (Auto-Detect)

Monitor for these patterns during sessions:

### Command Repetition
- Same bash command run 3+ times
- Same sequence of commands repeated
- Similar commands with slight variations

### Task Repetition
- Same type of request across sessions
- Repeated file modifications in same pattern
- Recurring debugging steps

### Knowledge Gaps
- Information I needed but wasn't in CLAUDE.md
- Corrections from user about project conventions
- Confusion that required clarification

### Workflow Patterns
- Multi-step processes done manually
- Copy-paste patterns
- Repeated context explanations

## Detection Thresholds

| Pattern Type | Threshold | Action |
|--------------|-----------|--------|
| Same command | 3x in session | Suggest command |
| Similar commands | 5x in session | Suggest parameterized command |
| Same task type | 2x across sessions | Suggest skill |
| User correction | 1x | Suggest adding to CLAUDE.md |
| Missing info | 2x | Suggest documenting |

## Suggestion Format

When pattern detected, present:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PATTERN DETECTED

I noticed: [specific observation]
Frequency: [how often]

Suggested automation:
[brief description of what would be created]

Options:
1. Create project command (.claude/commands/)
2. Create global command (~/.claude/commands/)
3. Create project skill (.claude/skills/)
4. Add to project CLAUDE.md
5. Add to global ~/.claude/CLAUDE.md
6. Skip for now
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Automation Templates

### For Repeated Commands -> Create Command

`.claude/commands/[name].md`:
```markdown
# [Command Name]

[Description of what this does]

## Steps
1. [step]
2. [step]

## Usage
/project:[name] [optional args]
```

### For Complex Workflows -> Create Skill

`.claude/skills/[name]/SKILL.md`:
```markdown
---
name: [name]
description: [what it does]
---

# [Skill Name]

## When to Use
[trigger conditions]

## Steps
1. [step]
2. [step]

## Output
[expected result]
```

### For Conventions/Rules -> Add to CLAUDE.md

```markdown
## [Section Name]
- [rule or convention]
- [example]
```

### For Personal Preferences -> Add to CLAUDE.local.md

```markdown
## My Preferences
- [preference]
```

## Post-Creation

After creating automation:
1. Confirm with user
2. Test if applicable
3. Summarize what was created and how to use it

```
Created: [file path]
Invoke with: [command or trigger]
```

## Examples

### Example 1: Repeated Test Command
```
Pattern: `npm test -- --watch src/utils` run 4 times

Suggestion: Create command /project:test-utils
Content: Runs tests in watch mode for utils directory
```

### Example 2: Repeated Debugging Steps
```
Pattern: Same sequence: check logs -> read config -> verify env

Suggestion: Create skill /debug-config
Content: Systematic config debugging workflow
```

### Example 3: User Correction
```
Pattern: User said "always use async/await, never .then()"

Suggestion: Add to CLAUDE.md code conventions
Content: "Use async/await for promises, avoid .then() chains"
```

## Self-Improvement Loop

At end of significant tasks, briefly evaluate:
1. What information would have helped?
2. What steps were repetitive?
3. What could be automated next time?

If improvements identified, suggest them proactively.
