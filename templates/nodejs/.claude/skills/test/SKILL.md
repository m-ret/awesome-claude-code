---
name: test
description: Run tests with various options and configurations
---

# Test Skill

Run and manage tests for Node.js projects.

## When to Use
- After implementing a feature
- Before committing
- When debugging test failures
- When user requests test run

## Arguments
$ARGUMENTS - Optional: specific test file, pattern, or flags

## Steps

1. **Detect test runner**
   Check package.json for:
   - Jest
   - Vitest
   - Mocha
   - Node test runner

2. **Run tests**

   ### Full test suite
   ```bash
   npm test
   ```

   ### Specific file
   ```bash
   npm test -- path/to/test.ts
   ```

   ### Watch mode
   ```bash
   npm test -- --watch
   ```

   ### With coverage
   ```bash
   npm test -- --coverage
   ```

   ### Pattern matching
   ```bash
   npm test -- --testNamePattern="should handle"
   ```

3. **Report results**
   - Number of tests passed/failed
   - Failed test details
   - Coverage summary (if available)

## Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TEST RESULTS

Total: X tests
Passed: Y
Failed: Z
Skipped: W

[Failed test details if any]

Coverage: XX% (if available)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Debugging Failed Tests

When tests fail:
1. Show the specific assertion that failed
2. Show relevant code context
3. Suggest potential fixes
4. Offer to run in verbose/debug mode
