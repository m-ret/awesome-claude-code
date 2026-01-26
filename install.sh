#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Awesome Claude Code - Installer${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if ~/.claude already exists
if [ -d "$CLAUDE_DIR" ]; then
    echo -e "${YELLOW}Warning: $CLAUDE_DIR already exists.${NC}"
    read -p "Do you want to overwrite? (y/N): " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    echo ""
fi

# Create directory
echo -e "Creating ${BLUE}$CLAUDE_DIR${NC}..."
mkdir -p "$CLAUDE_DIR"

# Copy files
echo -e "Copying ${BLUE}CLAUDE.md${NC}..."
cp "$SCRIPT_DIR/global/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

echo -e "Copying ${BLUE}commands${NC}..."
cp -r "$SCRIPT_DIR/global/commands" "$CLAUDE_DIR/"

echo -e "Copying ${BLUE}skills${NC}..."
cp -r "$SCRIPT_DIR/global/skills" "$CLAUDE_DIR/"

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Next steps:"
echo -e "  1. Edit ${BLUE}~/.claude/CLAUDE.md${NC} to personalize:"
echo "     - Update your name and email"
echo "     - Add your git identity rules"
echo "     - Customize behaviors"
echo ""
echo -e "  2. Open any project with Claude Code"
echo ""
echo -e "For more info, visit: ${BLUE}https://github.com/m-ret/awesome-claude-code${NC}"
