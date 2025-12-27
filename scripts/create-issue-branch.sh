#!/bin/bash
# scripts/create-issue-branch.sh
# Creates a branch from a GitHub issue number

if [ -z "$1" ]; then
    echo "Usage: $0 <issue-number>"
    echo "Example: $0 123"
    exit 1
fi

ISSUE_NUM=$1

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "Error: Not authenticated with GitHub CLI."
    echo "Run: gh auth login"
    exit 1
fi

# Fetch issue title
ISSUE_TITLE=$(gh issue view $ISSUE_NUM --json title -q '.title' 2>/dev/null)

if [ -z "$ISSUE_TITLE" ]; then
    echo "Error: Could not fetch issue #$ISSUE_NUM"
    echo "Make sure you have access to the repository and the issue exists."
    exit 1
fi

# Determine branch type based on issue labels or default to feature
ISSUE_LABELS=$(gh issue view $ISSUE_NUM --json labels -q '.labels[].name' 2>/dev/null)
BRANCH_TYPE="feature"

if echo "$ISSUE_LABELS" | grep -q "bug"; then
    BRANCH_TYPE="fix"
elif echo "$ISSUE_LABELS" | grep -q "enhancement"; then
    BRANCH_TYPE="feature"
fi

# Create branch name: <type>/<issue-number>-<short-description>
# Convert to lowercase, replace non-alphanumeric with dashes, limit to 40 chars
BRANCH_NAME="$BRANCH_TYPE/$ISSUE_NUM-$(echo "$ISSUE_TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | cut -c1-40)"

# Remove trailing dash if present
BRANCH_NAME=$(echo "$BRANCH_NAME" | sed 's/-$//')

# Create and checkout branch
git checkout -b "$BRANCH_NAME"

echo "Created branch: $BRANCH_NAME for issue #$ISSUE_NUM"
echo "Issue: $ISSUE_TITLE"


