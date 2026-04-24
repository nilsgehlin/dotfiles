---
description: Review the current branch's pull request
agent: plan
---

Review the pull request for the current branch.

PR details:
!`az repos pr list --source-branch $(git branch --show-current) --status active --output json`

PR diff (current branch vs target):
!`git diff origin/main...HEAD`

Provide a thorough code review covering:
- Summary of what the PR does
- Potential bugs or logic errors
- Performance concerns
- Code style and readability issues
- Missing tests or edge cases
- Suggestions for improvement
