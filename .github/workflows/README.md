# GitHub Actions Workflows

This directory contains example GitHub Actions workflows for issue-driven development.

## Available Workflows

### `link-pr-to-issue.yml`
Automatically links Pull Requests to related issues when PRs mention issue numbers.

**Features:**
- Detects issue references in PR titles and descriptions
- Adds comments to issues linking the PR
- Runs on PR open, edit, and sync events

**Setup:**
1. Uncomment the workflow or ensure it's active
2. No additional configuration required

### `close-issue-on-merge.yml`
Closes issues automatically when PRs are merged (if PR contains closing keywords).

**Features:**
- Detects closing keywords: "Closes #123", "Fixes #123", "Resolves #123"
- Adds a comment to the issue before closing
- Provides logging for debugging

**Note:** GitHub has built-in support for closing issues via keywords in PR descriptions. This workflow adds additional functionality like custom notifications and logging.

**Setup:**
1. Uncomment the workflow or ensure it's active
2. Use keywords in PR descriptions: `Closes #123` or `Fixes #123`

## Enabling Workflows

### Option 1: Enable All Workflows
1. Remove comments from workflow files (if any)
2. Ensure workflows are in `.github/workflows/` directory
3. Push to repository
4. Workflows will run automatically

### Option 2: Selective Enablement
1. Copy only the workflows you need
2. Customize them for your project
3. Commit and push

### Option 3: Manual Setup
1. Use GitHub's web interface: Settings → Actions → Workflows
2. Create workflows manually based on these examples

## Branch Protection (Recommended)

To enforce branch-based workflow, set up branch protection in GitHub:

1. Go to repository Settings → Branches
2. Add a branch protection rule for `main`/`master`
3. Enable:
   - ✅ Require a pull request before merging
   - ✅ Require approvals (optional, but recommended)
   - ✅ Dismiss stale pull request approvals when new commits are pushed
   - ✅ Require status checks to pass before merging (optional)
   - ✅ Require conversation resolution before merging (optional)
   - ✅ Do not allow bypassing the above settings
   - ✅ Restrict who can push to matching branches (optional)

This prevents direct commits to main/master and enforces the branch-based workflow.

## Customization

### Adding Notifications
Add notification steps to workflows:
```yaml
- name: Notify Team
  uses: actions/github-script@v7
  with:
    script: |
      // Add Slack, Discord, or email notifications
```

### Integration with Project Management Tools
Add steps to update project boards, Jira, Linear, etc.:
```yaml
- name: Update Project Board
  uses: your-action/update-board@v1
```

### Additional Automation
- Auto-assign reviewers based on issue labels
- Add labels to PRs based on issue labels
- Update issue status based on PR state
- Generate changelog entries

## Testing Workflows

1. Create a test issue
2. Create a PR with `Closes #<issue-number>` in description
3. Check Actions tab to see workflow runs
4. Verify issue is linked/closed as expected

## Troubleshooting

### Workflows Not Running
- Check that GitHub Actions are enabled: Settings → Actions → General
- Verify workflow files are in `.github/workflows/` directory
- Check workflow syntax for errors
- Review Actions tab for error messages

### Issues Not Being Closed
- Verify PR description contains closing keywords: `Closes #123`
- Check that issue exists and is accessible
- Review workflow logs in Actions tab
- Ensure workflow has `issues: write` permission

### Permission Errors
- Check workflow permissions in workflow file
- Verify repository settings allow Actions to write to issues
- For organization repos, check organization Actions settings

