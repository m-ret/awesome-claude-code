# Focus Mode

Start a focused work session on a specific task.

## Arguments
$ARGUMENTS - The task or goal for this session

## Steps

1. **Clear previous context** (suggest /clear if needed)

2. **Set the focus**
   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   FOCUS SESSION

   Goal: $ARGUMENTS
   Started: [timestamp]
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

3. **Update CLAUDE.local.md** (if exists)
   Add to "My Current Focus" section

4. **Read relevant context**
   - Check CLAUDE.md for related conventions
   - Check TASKS.md for related tasks
   - Identify relevant files

5. **Create mini-plan**
   Brief outline of steps to achieve the goal

6. **Begin work**
   Stay focused on the stated goal
   Resist scope creep
   If tangential issues found, note them but don't pursue

7. **End of focus**
   When task complete or user ends session:
   - Summarize what was accomplished
   - Note any follow-up items
   - Suggest /user:session-end
