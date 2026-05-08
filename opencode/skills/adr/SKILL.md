---
name: adr
description: Write Architecture Decision Records (ADRs) to document significant technical decisions. Use when the user asks to create an ADR, document a decision, or when a hard-to-reverse architectural choice has been made.
---

# Architecture Decision Records

Write ADRs to document significant technical decisions in the repository.

## When to write an ADR

All three must be true:

- **Hard to reverse** — changing your mind later has meaningful cost
- **Surprising without context** — a future reader will wonder "why?"
- **Real trade-off** — genuine alternatives existed and you picked one for specific reasons

## What qualifies

- Architectural shape (monorepo, event-sourcing, etc.)
- Integration patterns between contexts
- Technology choices that carry lock-in
- Boundary and scope decisions
- Deliberate deviations from the obvious path
- Constraints not visible in the code
- Rejected alternatives when non-obvious

## Location and numbering

ADRs live in `docs/adr/` relative to the project root. For monorepo-wide decisions, use the repo root.

Create the directory lazily when the first ADR is needed.

Sequential numbering: `0001-slug.md`, `0002-slug.md`, etc.

Scan `docs/adr/` for the highest existing number and increment by one.

## Filename slug

Derive from the ADR title: kebab-case, strip filler words, max ~5 words. Confirm the full filename with the user before writing.

## Template

```md
# {Short title of the decision}

{1-3 sentences: what's the context, what did we decide, and why.}
```

An ADR can be a single paragraph. The value is in recording that a decision was made and why — not in filling out sections.

## Optional sections

Only include when they add genuine value. Proactively suggest them when context warrants — e.g., if rejected alternatives were discussed during the conversation, include "Considered Options" without being asked.

- **Status frontmatter** — `proposed | accepted | deprecated | superseded by ADR-NNNN`
- **Considered Options** — when rejected alternatives are worth remembering
- **Consequences** — when non-obvious downstream effects need calling out
