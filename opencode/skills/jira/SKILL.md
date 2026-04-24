---
name: jira
description: Use the Atlassian MCP tools for all Jira interactions including searching, creating, updating, and transitioning issues
---

## Team defaults

- **Cloud ID**: `stadium.atlassian.net`
- **Project key**: `RP` — all new issues MUST be created in this project.
- **Component**: `Product discovery` — add this component to every new issue, and include `component = "Product discovery"` in every JQL search query.
- **Language**: All Jira content (summaries, descriptions, comments) MUST be written in **Swedish**.

## Issue type guidelines

| Type | When to use |
|------|-------------|
| **Task** | The work is best described as a code or technical task. Use a clear, concise summary. |
| **Story** | The work describes a behaviour or user need. Formulate it as a proper user story: *"Som [roll] vill jag [handling]"*. |
| **Bug** | Something is broken or behaving incorrectly. |

## Instructions

When working with Jira, **always use the Atlassian MCP tools** instead of the Jira REST API, CLI tools, or web fetching. The following tools are available:

### Discovery
- `atlassian_getAccessibleAtlassianResources` - Get the cloudId needed for all other calls
- `atlassian_atlassianUserInfo` - Get current user info

### Searching
- `atlassian_searchJiraIssuesUsingJql` - Search issues using JQL
- `atlassian_search` - Search across Jira and Confluence using Rovo Search (preferred for natural language queries)

### Reading
- `atlassian_getJiraIssue` - Get full issue details
- `atlassian_getTransitionsForJiraIssue` - Get available status transitions
- `atlassian_getJiraIssueRemoteIssueLinks` - Get remote links on an issue
- `atlassian_getVisibleJiraProjects` - List projects
- `atlassian_getJiraProjectIssueTypesMetadata` - Get issue types for a project
- `atlassian_getJiraIssueTypeMetaWithFields` - Get field metadata for an issue type
- `atlassian_getIssueLinkTypes` - Get available link types

### Writing
- `atlassian_createJiraIssue` - Create a new issue
- `atlassian_editJiraIssue` - Update issue fields
- `atlassian_transitionJiraIssue` - Change issue status
- `atlassian_addCommentToJiraIssue` - Add a comment
- `atlassian_addWorklogToJiraIssue` - Log work on an issue
- `atlassian_createIssueLink` - Link two issues together

### User Lookup
- `atlassian_lookupJiraAccountId` - Find user account IDs for assignment

## Workflow

1. Always use `stadium.atlassian.net` as the `cloudId`. Do NOT call `atlassian_getAccessibleAtlassianResources` unless it fails.
2. Always create issues in project `RP` with component `Product discovery` and status `To do`.
3. Always add `component = "Product discovery"` to JQL searches to scope results to the team.
4. Write all Jira content (summaries, descriptions, comments) in Swedish.
5. Use `atlassian_search` for natural language queries and `atlassian_searchJiraIssuesUsingJql` when specific JQL is needed.
6. Use `responseContentFormat: "markdown"` and `contentFormat: "markdown"` when reading or writing content for simpler formatting.
7. When creating or editing issues, look up project metadata first if you're unsure about required fields.
8. When transitioning issues, call `atlassian_getTransitionsForJiraIssue` first to get valid transition IDs.

## When to use this skill

Use this skill whenever the user asks to:
- Search, view, create, update, or transition Jira issues
- Add comments or log work on Jira issues
- Look up Jira projects, users, or issue types
- Link Jira issues together
- Any other Jira-related task
