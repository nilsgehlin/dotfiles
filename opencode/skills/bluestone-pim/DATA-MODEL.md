# Bluestone PIM Data Model

## Products

Every item in Bluestone PIM is a **product** with a unique GUID (auto-generated) and a **number** (user-defined, unique, used as external identifier).

### Product types

| Type | Description | Use when |
|------|-------------|----------|
| **SINGLE** | Individual standalone product | Default choice. One SKU, no variations. |
| **VARIANT** | A variation of a product (e.g., a specific color/size) | The product differs from siblings by defining attributes (color, size). Always belongs to exactly one variant group. |
| **GROUP** (Variant Group) | Container for variants; holds shared data inherited by variants | Products share a base identity but differ by 1-2 defining attributes. E.g., a T-shirt available in multiple colors. |
| **BUNDLE** | Collection of products sold together with quantities | A "kit" or "set" -- e.g., computer + monitor + keyboard. Bundles cannot contain other bundles. |

### Design guidance: Product types

- **Variant group vs. relations**: Use variant groups when products share a base identity and differ by defining attributes (size, color). Use relations for cross-sell/upsell between genuinely different products.
- **Variant group data inheritance**: Data set on the group is inherited by all variants. Use this to avoid duplicating shared descriptions, images, and attributes across variants.
- **Variant Level Attributes (VLA)**: Attributes on a variant group can be marked as VLA to push them down to variants. VLAs can be locked (same value enforced), mandatory, or variant-defining (distinguishes variants from each other).
- **Bundle quantities**: Each product in a bundle has a quantity (default 1). Manage via the Bundle tab or MAPI.
- **Product numbers as external identifiers**: Prefer product `number` over `id` (GUID) for mapping to external systems. Numbers are human-readable, user-controlled, and stable across environments.

## Catalogs and Categories

Catalogs are the top-level organizational containers. Categories are nested within catalogs to form a tree structure.

### Structure

```
Catalog (root)
  Category Level 1
    Category Level 2
      Category Level 3
        ...
```

- A product can belong to **multiple categories** across multiple catalogs
- Categories cannot be moved between catalogs (only reordered within)
- Each catalog/category has: name, number, description, media (assets), attributes

### Design guidance: Catalogs

- **One catalog per channel vs. one shared catalog**: Use separate catalogs when channels need fundamentally different category structures (e.g., B2B vs B2C). Use one catalog with context-based filtering when the structure is the same but content varies by language/market.
- **Nesting depth**: Keep catalog depth manageable. Deep nesting (5+ levels) makes navigation harder and complicates API traversal. The PAPI default depth is 10 levels.
- **Category numbers**: Like product numbers, assign meaningful category numbers for reliable external mapping.

## Attributes

Attributes are data fields on products, categories, and assets. Bluestone PIM supports **16 attribute types** (see [ATTRIBUTE-TYPES.md](ATTRIBUTE-TYPES.md)).

### Attribute properties

- **Name**: Display name (translatable per context)
- **Number**: Machine identifier for external mapping (use this in integrations, not the GUID)
- **Data type**: One of 16 types (text, boolean, integer, decimal, date, dictionary, matrix, etc.)
- **Group**: Attributes belong to attribute groups for organization
- **Unit**: Optional unit of measurement
- **Context-aware**: Whether the attribute has different values per context (language/market)

### Attribute categories

| Category | Types | Use when |
|----------|-------|----------|
| **Simple values** | text, multiline, formatted_text, boolean, integer, decimal, date, date_time, time, pattern | Single scalar value |
| **Selection** | single_select, multi_select | Predefined option list, options are local to the attribute |
| **Dictionary** | dictionary | Shared option list across multiple attributes (e.g., "Colors" dictionary used by multiple attributes) |
| **Structured** | column, matrix | Tabular data (column = single row of key-value pairs; matrix = rows x columns grid) |
| **Compound** | compound (renders as `text` in API) | Combines multiple sub-attributes into one display value |

### Design guidance: Attributes

- **Dictionary vs. single_select/multi_select**: Use **dictionary** when the same set of options is shared across multiple attributes (e.g., a "Colors" dictionary used by both "Primary Color" and "Secondary Color"). Use **select** when the options are unique to that attribute.
- **formatted_text**: Supports both Markdown and HTML content types. Specify `contentType` as `text/markdown` or `text/html`. Use HTML for rich content destined for web display; Markdown for simpler editorial content.
- **Attribute numbers are your integration keys**: Always use attribute `number` (not `id`) when mapping to external systems. Numbers are human-readable and stable.
- **Context-aware attributes**: Mark an attribute as context-aware when its value varies by language/market (e.g., product description in English vs. Norwegian). Global attributes share one value across all contexts.

## Category Level Attributes (CLA)

CLAs are attributes attached to a category that apply to **all products within that category**. They define required/expected data for products in that context.

- CLAs can be set as **mandatory** (products must have a value)
- CLAs can be **locked** (value is forced from the category to all products)
- CLAs support **inheritance**: child categories inherit parent CLAs
- Inheritance options: "keep existing values" or "force update" when propagating

### Design guidance: CLA

- Use CLAs to enforce data quality within a category (e.g., all products in "Electronics" must have a "Voltage" attribute)
- Use locked CLAs sparingly -- they remove flexibility from product-level editing
- CLAs are separate from VLAs: CLAs are about category membership requirements, VLAs are about variant group inheritance

## Variant Level Attributes (VLA)

VLAs are attributes on a variant group that are pushed down to its variants.

- **Locked VLA**: All variants must have the same value as the group
- **Mandatory VLA**: Variants must have a value (can differ from group)
- **Variant-defining VLA**: Distinguishes variants from each other (e.g., "Color" is variant-defining for a T-shirt group)

### Design guidance: VLA

- Mark size/color-type attributes as **variant-defining** -- this signals to integrations which attributes differentiate the variants
- The `forceVla` flag in the MAPI corresponds to "Override values" in the UI -- use it when you want to reset all variant values to the group's value
- A variant can only belong to **one group at a time**

## Relations

Relations connect products to each other. Two directions:

| Direction | Behavior |
|-----------|----------|
| **One-way** | Product A relates to Product B, but B does not see the relation back to A |
| **Two-way** | Both products see the relation. Each direction can have a different name (e.g., "Accessory for" / "Has accessory") |

### Design guidance: Relations

- Use **two-way** relations for complementary products, cross-sell, "frequently bought together"
- Use **one-way** relations for directional relationships like "is replacement for" or "upgraded by"
- Relations have a `number` field -- use this for external system mapping
- Do not use relations as a substitute for variant groups. If products share a base identity, use variant groups instead.

## Assets (DAM)

Bluestone PIM includes a built-in Digital Asset Management system.

- Assets have: name, number, description, file, content type, labels, attributes
- Maximum upload size: **128 MB** per file
- Assets are linked to products and categories
- **Asset labels** categorize assets (e.g., "Hero image", "Technical drawing", "Data sheet")
- Media is served via CDN at `media.bluestonepim.com` with transformation support (see [API-REFERENCE.md](API-REFERENCE.md))
- Asset attributes follow the same attribute system as products

### Design guidance: Assets

- Use **asset labels** to distinguish asset types programmatically in integrations (e.g., filter for "Hero image" label when building product cards)
- Use **asset numbers** for external mapping, just like product and attribute numbers

## Contexts

Contexts represent different views of product data, typically corresponding to **languages** or **markets**.

- Each organization has a **default context** (typically `en`)
- Additional contexts can have a **fallback context** (e.g., Norwegian falls back to English for missing translations)
- Context-aware attributes return different values per context
- Global attributes return the same value regardless of context
- Each context has its own **publish state** -- products are published per context

### Context in API calls

- **PAPI**: Pass `context` header (e.g., `context: en`) on every request
- **MAPI**: Pass `context` and optionally `context-fallback: true` headers
- If no context header is passed, the default context is used

### Design guidance: Contexts

- Use contexts for **languages** (en, no, de) or **market-specific** content (B2B vs B2C descriptions)
- Leverage fallback contexts to avoid duplicating data -- only translate what differs
- The `affectedContextIds` field in webhook events tells you which contexts were impacted by a change

## GUIDs

Every entity (product, category, attribute, asset) gets an auto-generated GUID as its `id`.

- GUIDs are globally unique and immutable
- For external system integration, prefer `number` fields over GUIDs -- numbers are human-readable, user-controlled, and meaningful
- Some external systems may not support GUID format -- use `number` as the mapping key in those cases

## Labels

Labels are tags applied to products for lightweight grouping.

### Design guidance: Labels vs. Categories

- Use **categories** for hierarchical, structural organization (reflects how products are browsed/navigated)
- Use **labels** for flat, cross-cutting tags (e.g., "New arrival", "On sale", "Discontinued")
- Labels are simpler but less powerful -- no hierarchy, no CLAs, no media on labels
- In PAPI, you can filter products by labels via the `/products/list` endpoint
