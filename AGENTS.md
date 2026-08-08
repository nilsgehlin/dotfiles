# Decision Records

Record every intentional decision made while changing this repository, including choices about configuration, tools, workflows, conventions, defaults, and trade-offs. The record must explain why the choice was made so a future maintainer can understand the motive without reconstructing it from the diff.

Do not create records for purely mechanical changes that involve no choice, such as formatting or correcting a typo.

Before making any configuration change, consult all existing records in `docs/decisions/` and ensure the change is consistent with them. If the change replaces an earlier decision, follow the supersession process below.

## Location and numbering

Decision records live in `docs/decisions/`. Create the directory when the first record is needed.

Use sequentially numbered filenames: `0001-short-slug.md`, `0002-short-slug.md`, and so on. Before creating a record, scan the directory for the highest number and increment it. Derive the slug from the title using kebab-case and at most about five words.

## Format

Keep each record concise. A single paragraph is sufficient when it captures the context, the decision, and the reason:

```md
# {Short title of the decision}

{What prompted the decision, what was decided, and why.}
```

Add sections only when they preserve useful context that would otherwise be lost:

- `Considered Options` for meaningful rejected alternatives.
- `Consequences` for non-obvious effects or compromises.
- Status frontmatter when a decision is proposed, deprecated, or superseded.

## Immutability

Decision records are read-only once committed. Never edit or delete an already committed record. If a decision changes, create a new record that references and supersedes the earlier record; leave the earlier record unchanged.

Create the relevant decision record in the same change as the configuration it documents.
