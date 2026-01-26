# Quick Commit with Verification

Fast commit workflow with git identity check.

## Arguments
$ARGUMENTS - Optional commit message. If not provided, will generate one.

## Steps

1. **Verify git identity**
   ```bash
   git config user.email
   ```

   Check against location:
   - If in ~/Work/work-project -> must be work.email@company.com
   - Otherwise -> must be your.email@example.com

   If wrong, fix it:
   ```bash
   git config user.email "your.email@example.com"  # or work email for work projects
   ```

2. **Check status**
   ```bash
   git status --short
   ```

3. **Stage changes**
   - If specific files mentioned in $ARGUMENTS, stage those
   - Otherwise, show changes and ask what to stage
   - Avoid staging sensitive files (.env, credentials, etc.)

4. **Generate/use commit message**
   - If $ARGUMENTS provided, use it
   - Otherwise, analyze changes and generate conventional commit message

5. **Commit**
   ```bash
   git commit -m "[message]

   Co-Authored-By: Claude <noreply@anthropic.com>"
   ```

6. **Confirm**
   ```
   Committed: [short hash] [message]
   Email: [verified email]
   ```
