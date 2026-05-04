---
name: bluestone-pim
description: >-
  Complete reference for Bluestone PIM -- data model, Public API (PAPI), Management API (MAPI),
  webhooks, media service, search, and integration patterns. Use this skill whenever the user
  mentions Bluestone, PIM, BPIM, PAPI, MAPI, bluestonepim.com, or any Bluestone PIM concept
  such as product sync/publish, catalogs, categories, variant groups, bundles, attribute types,
  dictionary attributes, category-level attributes, contexts, or the Bluestone CDN/media service.
---

# Bluestone PIM

You are a Bluestone PIM domain expert. You know the data model, both APIs, integration patterns, and best practices. Always consult the reference files below before answering.

## Quick start

Bluestone PIM has **two APIs** with different purposes and auth:

| API | Purpose | Auth | Base URL (prod) | Base URL (test) |
|-----|---------|------|-----------------|-----------------|
| **Public API (PAPI)** | Read-only access to published product data | `x-api-key` header | `https://api.bluestonepim.com/v1` | `https://api.test.bluestonepim.com/v1` |
| **Management API (MAPI)** | Full CRUD, configuration, search, webhooks | OAuth2 bearer token | `https://api.bluestonepim.com` | `https://api.test.bluestonepim.com` |

If the user's environment is unclear, **ask which environment** (production or test) they are targeting.

## Workflows

### 1. Reading published data (PAPI)

Use PAPI when building frontends, e-commerce integrations, or any downstream system that consumes product data. PAPI only returns data that has been **published** from PIM.

- Auth: `x-api-key` header on every request
- Context: pass `context` header (e.g., `en`, `no`) for language-specific data
- Key endpoints: `/products/{id}`, `/products/list`, `/categories`, `/categories/{id}/products`
- Pagination: `itemsOnPage` + `pageNo` params, or cursor-based via `/products/cursor/all`
- See [API-REFERENCE.md](API-REFERENCE.md) for full endpoint list

### 2. Managing data (MAPI)

Use MAPI for importing products, enriching data, managing catalogs, attributes, assets, and all write operations.

- Auth: OAuth2 `client_credentials` grant to get bearer token
- Token endpoint: `https://idp.bluestonepim.com/op/token` (prod) / `https://idp.test.bluestonepim.com/op/token` (test)
- Pass `Authorization: Bearer {token}` on every request
- Key endpoint groups: PIM (products, catalogs, attributes), Media bank, Search, Labels, External notifications
- All 15 MAPI components have OpenAPI specs -- see [API-REFERENCE.md](API-REFERENCE.md)

### 3. Delta sync (incremental updates)

For keeping external systems in sync without full re-imports:

1. Use `/syncs` (PAPI) with `createdAfter` param to find new sync events, OR use webhooks for `PRODUCT_SYNC_DONE` events
2. Use `/differences/sync/{id}/products` (and `/categories`, `/attributes`, `/relations`) to get ADD/CHANGE/DELETE diffs
3. Fetch changed entities via `/products/by-ids` or `/products/list`

### 4. Webhooks (event-driven)

Subscribe to 30+ event types for real-time notifications on product, category, and asset changes.

- Configure via MAPI External notifications endpoints or the PIM UI (Settings > Webhooks)
- Events are delivered as POST requests with JSON payloads containing a `timestamp` and `events` array
- See [WEBHOOK-EVENTS.md](WEBHOOK-EVENTS.md) for all event types and payload structure

### 5. Media/CDN (image transformation)

Assets served from `media.bluestonepim.com` support query-parameter transformations:

- Resize: `?w=800` or `?h=600` (preserves aspect ratio)
- Format: `?f=webp` or `?f=avif` (recommended for web delivery)
- Crop: `?cw=100&ch=100&cx=10&cy=10`
- Smart crop (AI): `?scw=800&sch=600`
- Trim whitespace: `?trim&trim-fuzz=0.12`
- See [API-REFERENCE.md](API-REFERENCE.md) for full parameter list

### 6. Publishing (MAPI-to-PAPI sync)

Data managed via MAPI is **not visible** in PAPI until published. This is the most common integration pitfall.

- Products must be published per context (language/market)
- Use MAPI Public API sync endpoints to trigger and monitor publishes
- Session sync allows batching multiple changes before publishing
- Sync states: INITIALIZING -> PENDING -> PUBLISH -> PUBLISH_CLEANUP -> CLOSED
- See [API-REFERENCE.md](API-REFERENCE.md) for publish/sync operational details

### 7. Search

MAPI provides two search mechanisms:

- **Full-text search**: quick keyword search across products
- **Query builder**: advanced filtering with saved views, complex conditions

Use search when you need to find products by criteria not supported by PAPI's `/products/list` filters, or when working with unpublished data.

## Reference files

- [DATA-MODEL.md](DATA-MODEL.md) -- Product types, catalogs, attributes, relations, assets, contexts, design guidance
- [API-REFERENCE.md](API-REFERENCE.md) -- Full endpoint reference for PAPI and MAPI, auth, rate limiting, publish/sync, media service
- [WEBHOOK-EVENTS.md](WEBHOOK-EVENTS.md) -- All webhook event types with payload structure and examples
- [ATTRIBUTE-TYPES.md](ATTRIBUTE-TYPES.md) -- All 16 attribute data types with JSON response shapes
