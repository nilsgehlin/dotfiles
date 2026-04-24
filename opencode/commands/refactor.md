---
description: Analyze codebase for refactoring opportunities
agent: plan
---

Analyze the current project for refactoring opportunities using jscpd (copy/paste detection) and knip (unused code detection).

## Step 1: Detect duplicate code

Run jscpd to find duplicated code blocks:
!`jscpd --min-lines 5 --min-tokens 50 --reporters console --format "typescript,typescriptreact,javascript,javascriptreact" --ignore "**/node_modules/**,**/.next/**,**/dist/**,**/build/**,**/coverage/**,**/generated/**,**/*.generated.*,**/*.gen.*" . 2>&1 || true`

## Step 2: Detect unused code

Run knip to find unused files, exports, dependencies, and types:
!`knip --no-exit-code 2>&1 || true`

## Instructions

Based on the output above, create a structured refactoring plan. For each category below, list specific actionable suggestions ranked by impact:

### 1. Duplicate Code

- Identify the most impactful duplications from the jscpd output
- For each duplication, suggest how to extract it into a shared utility, hook, or component
- Note the files and line numbers involved

### 2. Unused Code

- List unused exports, files, dependencies, and types from the knip output
- Categorize them by risk level (safe to remove vs. needs investigation)
- Flag any that might be used dynamically or via external tools

### 3. Suggested Refactoring Priority

- Rank all suggestions from highest to lowest impact
- Consider: code maintainability, bundle size reduction, developer experience
- For each item, estimate effort as low/medium/high

Keep the plan concise and actionable. Focus on the most impactful changes first.
