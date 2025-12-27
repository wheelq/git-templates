---
name: GitHub Issue Templates Setup
overview: Create a minimal template repository with GitHub issue templates, workflow scripts, updated .cursorrules, and documentation explaining GitHub Actions benefits and usage.
todos:
  - id: create-issue-templates
    content: Create .github/ISSUE_TEMPLATE/ directory with bug_report.md, feature_request.md, enhancement.md, task.md, question.md, and config.yml
    status: pending
  - id: create-workflow-script
    content: Create scripts/create-issue-branch.sh with the provided branch creation logic
    status: pending
  - id: update-cursorrules
    content: Create .cursorrules file with issue-driven development guidelines including branch enforcement (always use branches for commits, never main/master)
    status: pending
  - id: create-documentation
    content: Create README.md explaining template usage, GitHub Actions benefits, and setup instructions
    status: pending
  - id: create-optional-actions
    content: Create .github/workflows/ with example GitHub Actions workflows (commented/optional) and setup documentation
    status: pending
---

# GitHub Issue Templates and Workflow Setup

This plan creates a minimal template repository structure for issue-driven development that can be used to initialize other repositories.

## Files to Create

### 1. Issue Templates (`.github/ISSUE_TEMPLATE/`)

Create structured issue templates that Cursor can understand:

- `bug_report.md` - For bug reports
- `feature_request.md` - For new features
- `enhancement.md` - For improvements to existing features
- `task.md` - For general tasks
- `question.md` - For questions/discussions
- `config.yml` - Issue template configuration

### 2. Workflow Script (`scripts/create-issue-branch.sh`)

Create the branch creation script from issues:

- Script to fetch issue title and create properly formatted branch names
- Format: `feature/<issue-number>-<short-description>` or `fix/<issue-number>-<short-description>`

### 3. Updated `.cursorrules`

Add issue-driven development section:

- **CRITICAL**: Always ensure branches are used for commits - never commit directly to main/master
- Guidelines for referencing issues in commits
- PR linking instructions
- Branch naming conventions
- How to ask Cursor about issues

### 4. Documentation (`README.md` or `SETUP.md`)

Documentation covering:

- How to use this template repository
- **Branch-based workflow**: Always create branches for commits (never commit directly to main/master)
- Why GitHub Actions are beneficial (automation, linking PRs to issues, closing issues on merge, branch protection)
- How to set up GitHub Actions (optional workflow files or instructions)
- How to leverage this repository as a template

### 5. Optional GitHub Actions (`.github/workflows/`)

Include commented/example workflows:

- `link-pr-to-issue.yml` - Example workflow for linking PRs to issues
- `close-issue-on-merge.yml` - Example workflow for auto-closing issues
- Include setup instructions in comments

## Implementation Details

- All templates will use YAML frontmatter for structured data
- Issue templates will include sections for: description, acceptance criteria, steps to reproduce (for bugs)
- **Branch enforcement**: .cursorrules will explicitly state that all commits must be on branches, not main/master
- GitHub Actions can include branch protection rules as examples (prevent direct commits to main/master)