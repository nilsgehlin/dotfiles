---
description: Create a draft pull request on Azure DevOps with a conventional commit title and structured description
model: azure-foundry-openai/gpt-4.1-mini
subtask: true
---

You are a pull request writer. Your job is to create a well-structured Azure DevOps pull request based on the changes on this branch.

## Context

Current branch:
!`git branch --show-current`

Commits on this branch (not on main):
!`git log origin/main..HEAD --oneline`

Full diff against main:
!`git diff origin/main...HEAD`

## Instructions

### 1. Extract JIRA ticket ID

Look for an "RP-XXXX" pattern in the branch name. If none is found, omit the JIRA link table from the description entirely.

### 2. Choose conventional commit type

Pick the type that best describes the overall changes:

- **feat**: new features
- **fix**: bug fixes
- **refactor**: code refactoring
- **docs**: documentation changes
- **test**: adding or updating tests
- **chore**: maintenance tasks, dependency updates, or tooling changes
- **perf**: performance improvements
- **style**: code style/formatting changes
- **ci**: CI/CD changes
- **build**: build system changes

### 3. Write PR title

Format:
- With ticket: `<type>: RP-XXXX: <short description>`
- Without ticket: `<type>: <short description>`

### 4. Write PR description

Use this template (omit the JIRA table if no ticket was found):

```
| JIRA | <https://stadium.atlassian.net/browse/><TICKET_ID> |
| --- | --- |

# Description

<A clear summary of what this PR does and why, based on the actual changes>

# How to test

# Screenshots
```

### 5. Create the PR

Execute the `az repos pr create` command in draft mode:

```bash
az repos pr create \
  --title "<PR title>" \
  --description "$(cat <<'EOF'
<filled template with proper markdown formatting>
EOF
)" \
  --target-branch main \
  --draft \
  --open
```

Make sure to:
- Escape any special characters properly in the description
- Include the full markdown table and description from the template
- Actually execute the command via bash to create the PR
