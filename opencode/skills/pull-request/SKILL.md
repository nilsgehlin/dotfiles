---
name: pull-request
description: Use this skill when the user asks about creating a pull request, opening a PR, or submitting code for review. Targets Azure DevOps repositories using the az repos pr create CLI.
---

# Pull Request Creation (Azure DevOps)

Use this skill when the user asks about creating a pull request, opening a PR, or submitting code for review. This skill targets Azure DevOps repositories using the `az repos pr create` CLI.

## Gather context

First, collect branch and change information:

```bash
git branch --show-current
```

```bash
git log origin/main..HEAD --oneline
```

```bash
git diff origin/main...HEAD
```

## Create the pull request

Based on the gathered context, follow these steps:

### 1. Extract JIRA ticket ID

Look for an "RP-XXXX" pattern in the branch name. If no JIRA ticket ID is found, omit the Jira link table entirely.

### 2. Choose conventional commit type

Pick the appropriate prefix based on the changes:

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

Format: `<type>: RP-XXXX: <short description>`

Examples:
- `feat: RP-2817: Add product filtering to search page`
- `fix: RP-2817: Resolve null reference in checkout flow`
- `refactor: RP-2817: Simplify authentication logic`

### 4. Write PR description

Use this template:

```
| JIRA | <https://stadium.atlassian.net/browse/><TICKET_ID> |
| --- | --- |

# Description

<A clear summary of what this PR does and why, based on the actual changes>

# How to test

# Screenshots
```

### 5. Create the PR

Execute the `az repos pr create` command in draft mode using a heredoc for the description:

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
