---
description: Create an Azure DevOps pull request
---

Create a pull request in Azure DevOps for the current branch.

Branch name:
!`git branch --show-current`

Commits on this branch (not on main):
!`git log origin/main..HEAD --oneline`

Full diff against main:
!`git diff origin/main...HEAD`

Based on the above changes, create a pull request using the Azure DevOps CLI. Follow these steps:

1. Extract the JIRA ticket ID from the branch name (the "RP-XXXX" prefix). If no JIRA ticket ID is found, remove the Jira link table all together.

2. Analyze the changes and choose the appropriate conventional commit type prefix:
   - feat: for new features
   - fix: for bug fixes
   - refactor: for code refactoring
   - docs: for documentation changes
   - test: for adding or updating tests
   - chore: for maintenance tasks, dependency updates, or tooling changes
   - perf: for performance improvements
   - style: for code style/formatting changes
   - ci: for CI/CD changes
   - build: for build system changes

3. Write a concise, informative PR title in this format:
   <type>: RP-XXXX: <short description>

   For example:
   - feat: RP-2817: Add product filtering to search page
   - fix: RP-2817: Resolve null reference in checkout flow
   - refactor: RP-2817: Simplify authentication logic

4. Write a PR description using this template format:

| JIRA | <https://stadium.atlassian.net/browse/><TICKET_ID> |
| --- | --- |

# Description

<A clear summary of what this PR does and why, based on the actual changes>

# How to test

# Screenshots

1. Execute the `az repos pr create` command to create the PR in draft mode:

Use a bash command with a heredoc to pass the description:

az repos pr create \
  --title "<PR title>" \
  --description "$(cat <<'EOF'
<filled template with proper markdown formatting>
EOF
)" \
  --target-branch main \
  --draft \
  --open

Make sure to:

- Escape any special characters properly in the description
- Include the full markdown table and description from the template
- Actually execute the command via bash to create the PR
