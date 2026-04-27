---
name: pr-review
description: Use this skill when the user asks to review a pull request, review code changes on the current branch, or do a PR review. Targets Azure DevOps.
---

# Pull Request Review (Azure DevOps)

Use this skill when the user asks to review a pull request, review code changes on the current branch, or do a PR review.

## Gather context

First, get the PR details and diff:

```bash
az repos pr list --source-branch $(git branch --show-current) --status active --output json
```

```bash
git diff origin/main...HEAD
```

## Provide a thorough code review

Based on the gathered context, cover the following areas:

- **Summary**: What the PR does
- **Bugs/Logic errors**: Potential bugs or incorrect logic
- **Performance**: Performance concerns or inefficiencies
- **Code style**: Readability and style issues
- **Tests**: Missing tests or uncovered edge cases
- **Suggestions**: Concrete improvements with examples where possible
