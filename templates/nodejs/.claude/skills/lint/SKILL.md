---
name: lint
description: Run linting, formatting, type checking, and tests
---

# Lint Skill

Run comprehensive code quality checks for Node.js/TypeScript projects.

## When to Use
- Before committing code
- After making significant changes
- When user requests code quality check
- Part of pre-commit workflow

## Steps

1. **Type Check** (TypeScript projects)
   ```bash
   npx tsc --noEmit
   ```
   Report any type errors found.

2. **ESLint**
   ```bash
   npm run lint
   # or if no script exists:
   npx eslint . --ext .ts,.tsx,.js,.jsx
   ```
   Report linting issues.

3. **Prettier Check**
   ```bash
   npx prettier --check .
   # or
   npm run format:check
   ```
   Report formatting issues.

4. **Fix Issues** (if requested)
   ```bash
   npm run lint:fix
   npx prettier --write .
   ```

## Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CODE QUALITY CHECK

TypeScript: [pass/X errors]
ESLint: [pass/X warnings, Y errors]
Prettier: [pass/X files need formatting]

[Details of any issues]

Suggested fixes: [if applicable]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Auto-Fix Mode

When invoked with "fix" argument:
1. Run `npm run lint:fix`
2. Run `npx prettier --write .`
3. Report what was fixed
4. Re-run checks to confirm
