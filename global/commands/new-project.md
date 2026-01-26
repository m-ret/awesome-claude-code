# Initialize New Project

Set up Claude Code configuration for this project.

## Instructions

1. First, check the current directory path
2. If this is an excluded project path (like ~/Work/work-project), inform user and exit:
   "Excluded project detected - this project has custom configuration. Skipping initialization."

3. Otherwise, analyze the project:
   - Read package.json, requirements.txt, Cargo.toml, go.mod, or similar
   - Scan the directory structure
   - Identify the tech stack

4. Create the following files:

### CLAUDE.md
Project configuration with:
- Project name and purpose
- Tech stack
- Common commands (dev, build, test, lint)
- Directory structure overview
- Code conventions

### CLAUDE.local.md
Personal/local config template (will be gitignored)

5. Add CLAUDE.local.md to .gitignore if not already there

6. Summarize what was created and detected

## Note
This command is also available as the /init-project skill which can auto-trigger on new projects.
