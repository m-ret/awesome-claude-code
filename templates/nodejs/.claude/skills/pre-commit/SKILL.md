---
name: pre-commit
description: Run all checks before committing
---

# Pre-Commit Checks Skill

Comprehensive validation before committing code.

## When to Use
- Before any git commit
- When user runs /pre-commit
- As part of quick-commit workflow

## Steps

1. **Check for unstaged changes**
   ```bash
   git status --short
   ```
   Warn if there are unstaged changes that won't be committed.

2. **Type Check** (TypeScript)
   ```bash
   npx tsc --noEmit
   ```
   STOP if type errors found.

3. **Lint Check**
   ```bash
   npm run lint
   ```
   STOP if lint errors found (warnings OK).

4. **Format Check**
   ```bash
   npx prettier --check .
   ```
   Offer to fix if formatting issues found.

5. **Run Tests**
   ```bash
   npm test
   ```
   STOP if tests fail.

6. **Check for Sensitive Files**
   Scan staged files for:
   - .env files (should be .env.example only)
   - Credentials, API keys, secrets
   - Large binary files
   WARN if found.

7. **Verify Git Identity**
   ```bash
   git config user.email
   ```
   Confirm correct email for this project.

## Output

### All Checks Pass
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRE-COMMIT CHECK

[OK] TypeScript: No errors
[OK] ESLint: Passed
[OK] Prettier: Formatted
[OK] Tests: All passing
[OK] No sensitive files
[OK] Git identity: your.email@example.com

Ready to commit!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Checks Failed
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRE-COMMIT CHECK

[OK] TypeScript: No errors
[FAIL] ESLint: 3 errors found
  - src/index.ts:15 - Unexpected any
  - src/utils.ts:8 - Missing return type
  - src/utils.ts:12 - Unused variable
[--] Prettier: Skipped (lint failed)
[--] Tests: Skipped (lint failed)

Fix errors before committing.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Auto-Fix Mode

When invoked with "fix" argument:
1. Run lint:fix
2. Run prettier --write
3. Re-run all checks
4. Report final status
