---
name: lint
description: Run Python linting, formatting, and type checking
---

# Python Lint Skill

Run comprehensive code quality checks for Python projects.

## When to Use
- Before committing code
- After making significant changes
- When user requests code quality check
- Part of pre-commit workflow

## Steps

1. **Detect linting tools**
   Check pyproject.toml and installed packages for:
   - ruff (modern, fast)
   - black + isort + flake8 (traditional)
   - pylint

2. **Run Linting**

   ### With Ruff (Preferred)
   ```bash
   ruff check .
   ```

   ### With Traditional Tools
   ```bash
   flake8 src/ tests/
   ```

3. **Run Formatting Check**

   ### With Ruff
   ```bash
   ruff format --check .
   ```

   ### With Black + isort
   ```bash
   black --check .
   isort --check-only .
   ```

4. **Run Type Checking**
   ```bash
   mypy src/
   # or
   pyright src/
   ```

5. **Report Issues**
   Categorize by severity:
   - Errors (must fix)
   - Warnings (should fix)
   - Style (optional)

## Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PYTHON CODE QUALITY CHECK

Linting (ruff/flake8): [pass/X issues]
Formatting (ruff/black): [pass/X files need formatting]
Type Check (mypy): [pass/X errors]

[Details of any issues]

Suggested fixes: [if applicable]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Auto-Fix Mode

When invoked with "fix" argument:

### With Ruff
```bash
ruff check --fix .
ruff format .
```

### With Traditional Tools
```bash
black .
isort .
```

After fixing:
1. Re-run checks to confirm
2. Report what was auto-fixed
3. Note any remaining manual fixes needed

## Common Issues and Fixes

| Issue | Fix |
|-------|-----|
| Import order | `isort .` or `ruff check --fix` |
| Line too long | Break into multiple lines |
| Unused import | Remove or add `# noqa: F401` if intentional |
| Missing type hint | Add type annotations |
| Undefined name | Import or define the name |
