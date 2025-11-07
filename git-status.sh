#!/bin/bash
# Get git info for tmux status bar

# Get current pane's directory (or PWD if not in tmux)
if [ -n "$TMUX" ]; then
    PANE_PATH=$(tmux display-message -p "#{pane_current_path}")
else
    PANE_PATH="$PWD"
fi
cd "$PANE_PATH" 2>/dev/null || exit 0

# Check if we're in a git repo
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # Get branch name
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

    # Check for changes
    if [[ -n $(git status -s 2>/dev/null) ]]; then
        # Dirty - has changes
        status="●"
        color="#d79921"  # yellow
    else
        # Clean
        status="✓"
        color="#98971a"  # green
    fi

    # Output with Gruvbox colors
    echo -n "#[fg=$color] $branch $status"
else
    # Not in a git repo
    echo -n ""
fi
