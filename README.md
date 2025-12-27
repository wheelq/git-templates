# Git Templates Repository

> **A template repository for setting up issue-driven development workflows with GitHub and Cursor AI**

## What Problem Does This Solve?

When starting a new project, you often need to:
- Set up structured issue templates for bug reports, features, and tasks
- Establish a workflow that connects issues → branches → PRs → code
- Enable Cursor AI to understand and work with your GitHub issues
- Automate linking PRs to issues and closing issues on merge
- Enforce best practices like branch-based development

**This repository provides all of this out of the box**, so you can initialize new repositories with a complete issue-driven development setup in seconds.

## Capabilities

This template provides:

### 🎯 Issue-Driven Development Framework
- **Structured Issue Templates**: Pre-configured templates for bugs, features, enhancements, tasks, and questions
- **Cursor AI Integration**: Templates formatted so Cursor can read and understand issue requirements
- **Acceptance Criteria**: Built-in acceptance criteria in templates for clear planning

### 🌿 Branch Management
- **Automated Branch Creation**: Script to create branches directly from GitHub issues
- **Smart Branch Naming**: Automatically formats branch names as `feature/123-description` or `fix/123-description`
- **Branch Enforcement**: Rules and guidelines to ensure all work happens on branches (never on main/master)

### 🤖 Automation (Optional)
- **PR-Issue Linking**: Automatically link Pull Requests to related issues
- **Auto-Close Issues**: Close issues when PRs are merged (using keywords like `Closes #123`)
- **Workflow Examples**: Ready-to-use GitHub Actions workflows

### 🧠 Cursor AI Integration
- **Issue Context**: Cursor can read and understand your GitHub issues
- **Planning Support**: Ask Cursor about issue requirements and acceptance criteria
- **Workflow Guidance**: `.cursorrules` file guides Cursor on your development workflow

## Main Usage Scenarios

### Scenario 1: Starting a New Repository
**Problem**: You're creating a new project and want professional issue tracking and workflow from day one.

**Solution**: Use this template to initialize your repository with:
- Issue templates ready to use
- Branch creation scripts
- Cursor AI integration
- Optional automation workflows

**Time saved**: Hours of manual setup

### Scenario 2: Issue-Driven Development with Cursor
**Problem**: You want Cursor AI to help you plan and implement features based on GitHub issues.

**Solution**:
1. Create an issue using the templates (Cursor can read them)
2. Ask Cursor: "What are the requirements for issue #123?"
3. Use the script to create a branch: `./scripts/create-issue-branch.sh 123`
4. Cursor understands the issue context and can help implement it

**Benefit**: Seamless integration between GitHub issues and AI-assisted development

### Scenario 3: Team Collaboration
**Problem**: Your team needs consistent issue tracking and workflow automation.

**Solution**: Everyone uses the same issue templates, branch naming conventions, and automated workflows ensure PRs are properly linked to issues.

**Benefit**: Consistent, traceable development process

## Quick Start

### Option 1: Use as Git Template (Recommended)

Set this repository as your global Git template:

```bash
# Clone this repository
git clone <this-repo-url> ~/.git-templates

# Configure Git to use it
git config --global init.templateDir ~/.git-templates

# Initialize new repositories with the template
cd /path/to/new-project
git init
# All template files are now in your new repository!
```

### Option 2: Manual Copy

```bash
# Copy template files to your repository
cp -r .github scripts .cursorrules /path/to/your/repo/
```

### Option 3: GitHub Template Repository

1. Mark this repository as a template on GitHub (Settings → Template repository)
2. Click "Use this template" when creating new repositories
3. All files are automatically included

## How to Use

### Step 1: Set Up the Template

Choose one of the Quick Start options above to get the files into your repository.

### Step 2: Create Your First Issue

1. Go to your repository on GitHub
2. Click "New Issue"
3. Choose a template (Bug Report, Feature Request, etc.)
4. Fill in the details and acceptance criteria
5. Create the issue

### Step 3: Create a Branch from the Issue

```bash
# Make sure GitHub CLI is installed and authenticated
gh auth login

# Create a branch from issue #123
./scripts/create-issue-branch.sh 123

# This creates: feature/123-short-description (or fix/123-... for bugs)
```

### Step 4: Work with Cursor AI

Ask Cursor about your issue:
- "Show me all open issues"
- "What's the description of issue #123?"
- "What are the acceptance criteria for issue #123?"

Cursor will read the issue and help you implement it.

### Step 5: Create a Pull Request

When your work is done:

```bash
git add .
git commit -m "feat: implement feature (#123)"
git push origin feature/123-short-description
```

Create a PR on GitHub with `Closes #123` or `Fixes #123` in the description.

### Step 6: Enable Automation (Optional)

If you want automatic PR-issue linking and auto-closing:

1. Go to `.github/workflows/`
2. The workflows are ready to use - they'll run automatically
3. Optionally configure branch protection in GitHub Settings → Branches

## Detailed Features

### Issue Templates

Located in `.github/ISSUE_TEMPLATE/`:

- **`bug_report.md`** - Structured bug reporting with reproduction steps
- **`feature_request.md`** - Feature proposals with acceptance criteria
- **`enhancement.md`** - Improvements to existing features
- **`task.md`** - General tasks and chores
- **`question.md`** - Questions and discussions
- **`config.yml`** - Template configuration

Each template includes:
- Clear sections for description, context, and requirements
- Acceptance criteria checkboxes for tracking
- Formatting optimized for Cursor AI to read

### Branch Creation Script

**File**: `scripts/create-issue-branch.sh`

**Usage**:
```bash
./scripts/create-issue-branch.sh <issue-number>
```

**Features**:
- Fetches issue title from GitHub
- Automatically determines branch type (feature/fix) from issue labels
- Sanitizes issue title for valid Git branch names
- Creates and checks out the new branch

**Requirements**:
- GitHub CLI (`gh`) installed: https://cli.github.com/
- Authenticated: `gh auth login`
- Access to the repository

**Example**:
```bash
./scripts/create-issue-branch.sh 42
# Creates: feature/42-add-user-authentication
# or: fix/42-resolve-login-bug (if issue has "bug" label)
```

### Branch-Based Workflow

**CRITICAL RULE**: All commits must be on branches, never directly on `main` or `master`.

**Why?**
- Enables code review via Pull Requests
- Maintains clean git history
- Allows for easy rollback
- Supports parallel development

**How to enforce**:
1. Use the branch creation script: `./scripts/create-issue-branch.sh <issue-number>`
2. Or create manually: `git checkout -b feature/123-description`
3. Set up branch protection in GitHub (Settings → Branches)

### GitHub Actions (Optional)

**Why use them?**
- **Automatic PR-Issue Linking**: No manual linking needed
- **Auto-Close Issues**: Issues close automatically when PRs merge
- **Workflow Automation**: Saves time and reduces errors
- **Team Notifications**: Keep everyone informed

**Available Workflows** (in `.github/workflows/`):

1. **`link-pr-to-issue.yml`**
   - Automatically links PRs to issues when PR mentions issue numbers
   - Adds comments to issues linking the PR
   - Runs on PR open, edit, and sync

2. **`close-issue-on-merge.yml`**
   - Closes issues when PRs are merged
   - Detects keywords: `Closes #123`, `Fixes #123`, `Resolves #123`
   - Adds closing comments to issues

**Setup**:
- Workflows are ready to use - they run automatically when enabled
- No configuration needed for basic usage
- See `.github/workflows/README.md` for customization options

**Note**: GitHub has built-in support for closing issues via keywords in PR descriptions. The workflows add additional functionality like logging and custom notifications.

### Cursor AI Integration

**How it works**:
- Cursor has native GitHub integration
- It can read your repository's issues
- The `.cursorrules` file guides Cursor on your workflow

**What you can ask Cursor**:
- "Show me all open issues"
- "What's the description of issue #123?"
- "What are the acceptance criteria for issue #123?"
- "Create a branch for issue #123" (Cursor can use the script)

**Benefits**:
- Cursor understands issue context when you're working
- Can help plan implementation based on acceptance criteria
- References issues in code and commits automatically

## Repository Structure

```
.
├── .github/
│   ├── ISSUE_TEMPLATE/          # Issue templates for GitHub
│   │   ├── bug_report.md
│   │   ├── feature_request.md
│   │   ├── enhancement.md
│   │   ├── task.md
│   │   ├── question.md
│   │   └── config.yml
│   └── workflows/               # GitHub Actions workflows (optional)
│       ├── link-pr-to-issue.yml
│       ├── close-issue-on-merge.yml
│       └── README.md
├── scripts/
│   └── create-issue-branch.sh   # Branch creation script
├── .cursorrules                 # Cursor AI workflow guidelines
└── README.md                    # This file
```

## Customization

### Issue Templates

Edit files in `.github/ISSUE_TEMPLATE/` to match your project:
- Add project-specific fields
- Modify acceptance criteria format
- Update default labels
- Change template structure

### Branch Creation Script

Customize `scripts/create-issue-branch.sh`:
- Change branch naming convention
- Add validation rules
- Integrate with other tools
- Add custom logic

### Cursor Rules

Update `.cursorrules` to add:
- Project-specific coding standards
- Testing requirements
- Documentation standards
- Additional workflow guidelines

### GitHub Actions

Customize workflows in `.github/workflows/`:
- Add notifications (Slack, Discord, email)
- Integrate with project management tools
- Add custom automation
- Modify issue/PR keywords

## Complete Workflow Example

Here's a complete example of using this template:

```bash
# 1. Initialize repository with template
git init
# (template files are now in your repo)

# 2. Create an issue on GitHub using a template
# (Go to GitHub, click "New Issue", choose "Feature Request")

# 3. Create a branch from issue #5
./scripts/create-issue-branch.sh 5
# Switched to branch: feature/5-add-user-dashboard

# 4. Ask Cursor about the issue
# "What are the acceptance criteria for issue #5?"

# 5. Implement the feature (with Cursor's help)
# ... write code ...

# 6. Commit with issue reference
git add .
git commit -m "feat: add user dashboard (#5)"
git push origin feature/5-add-user-dashboard

# 7. Create PR on GitHub with "Closes #5" in description
# (GitHub Actions will automatically link and close the issue)
```

## Requirements

### Required
- Git
- GitHub account
- GitHub CLI (`gh`) - for branch creation script
  - Install: https://cli.github.com/
  - Authenticate: `gh auth login`

### Optional
- Cursor AI - for AI-assisted development
- GitHub Actions enabled - for automation workflows

## Troubleshooting

### Branch Creation Script Fails

**Error**: "GitHub CLI (gh) is not installed"
- **Solution**: Install GitHub CLI from https://cli.github.com/

**Error**: "Not authenticated with GitHub CLI"
- **Solution**: Run `gh auth login`

**Error**: "Could not fetch issue #123"
- **Solution**: Verify you have access to the repository and the issue exists

### GitHub Actions Not Running

- Check that Actions are enabled: Settings → Actions → General
- Verify workflow files are in `.github/workflows/` directory
- Check workflow syntax for errors
- Review Actions tab for error messages

### Cursor Not Reading Issues

- Ensure you're authenticated with GitHub in Cursor
- Verify the repository is connected to GitHub
- Check that issues exist and are accessible

## Contributing

When contributing to this template repository:

1. Create an issue describing your change (use the templates!)
2. Use `./scripts/create-issue-branch.sh <issue-number>` to create a branch
3. Make your changes
4. Submit a PR with `Closes #<issue-number>` in the description

## License

[Add your license here]

---

**Need help?** Open an issue using one of the templates, or check the documentation in `.github/workflows/README.md` for GitHub Actions setup.
