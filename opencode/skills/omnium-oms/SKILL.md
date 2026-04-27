---
name: omnium-oms
description: >
  Complete reference for the Omnium OMS (Order Management System) platform — API endpoints, data models, 
  integration patterns, and domain knowledge. Use this skill whenever the user asks about Omnium OMS, 
  including order management, cart/checkout flows, customer management (B2C and B2B), product catalog, 
  inventory, pricing/promotions, purchase orders, stores/markets, notifications, analytics, or any 
  Omnium API endpoint. Also trigger when the user mentions Omnium-specific concepts like workflow steps, 
  order lifecycle, click & collect, delta queries, scroll search, or the Omnium GUI. Even if the user 
  only says "Omnium" or "OMS" in passing, consult this skill — it covers both the REST API and the 
  conceptual documentation at docs.omnium.no.
---

# Omnium OMS Skill

Omnium is a cloud-based Order Management System (OMS) and e-commerce platform for unified commerce. 
It manages orders from all sales channels (webshop, POS, phone, B2B portal) through configurable 
workflows handling payment, inventory, fulfillment, and notifications.

## Quick facts

- **API type**: RESTful JSON API with JWT Bearer authentication
- **Base URLs**: `https://api.omnium.no` (prod), `https://apitest.omnium.no` (test)
- **Auth**: `POST /api/token?clientId=...&clientSecret=...` → JWT token valid for 10 days
- **Swagger**: `https://api.omnium.no/documentation` (also segmented by domain)
- **Docs site**: https://docs.omnium.no

## How to use this skill

This skill has three layers. Read only what you need for the task at hand.

### Layer 1: This file (SKILL.md)
Always in context. Use the routing table below to decide which files to read next.

### Layer 2: Domain knowledge (references/)
Conceptual documentation from docs.omnium.no — how things work, best practices, integration patterns.
Read these when the user asks "how does X work" or "what's the best way to do Y".

### Layer 3: API reference (api/)
Structured API specification — endpoints, parameters, request/response schemas.
Start with `api/index.md` for the table of contents, then drill into specific domain files.
Read these when the user asks about specific endpoints, request formats, or data models.

## Routing table

Use this table to determine which file(s) to read based on the user's question.

### Conceptual / "how does it work" questions → references/

| Topic | Read file |
|-------|-----------|
| Authentication, API conventions, search, pagination, scroll, error handling | `references/getting-started.md` |
| Order lifecycle, workflows, statuses, order types | `references/orders.md` |
| Cart management, checkout flow, offers | `references/carts.md` |
| Private customers (B2C), business customers (B2B), customer club, loyalty | `references/customers.md` |
| Product catalog, categories, assets, assortment | `references/products.md` |
| Stock levels, ATP, inventory value, virtual locations | `references/inventory.md` |
| Price lists, prioritization, promotions, lowest price rules | `references/prices-promotions.md` |
| Data in/out, events, webhooks, delta queries, connectors | `references/integrations.md` |
| Stores, markets, warehouses, regions | `references/stores-markets.md` |
| Suppliers, deliveries, goods reception | `references/purchase-orders.md` |
| Email, SMS, notification templates | `references/notifications.md` |
| Scheduled tasks, GUI extensions, settings, environments | `references/configuration.md` |

### API endpoint / "which endpoint" / "how do I call" questions → api/

Always start with `api/index.md` to orient yourself, then read the specific domain file.

| Topic | Endpoints file | Schemas file |
|-------|---------------|--------------|
| Orders (CRUD, search, workflow, returns) | `api/endpoints/orders.md` | `api/schemas/orders.md` |
| Carts (add items, checkout, coupons, shipping) | `api/endpoints/carts.md` | `api/schemas/carts.md` |
| Private customers (B2C) | `api/endpoints/customers-b2c.md` | `api/schemas/customers.md` |
| Business customers (B2B) | `api/endpoints/customers-b2b.md` | `api/schemas/customers.md` |
| Products (catalog, search, categories) | `api/endpoints/products.md` | `api/schemas/products.md` |
| Inventory (stock, ATP) | `api/endpoints/inventory.md` | `api/schemas/inventory.md` |
| Prices and price lists | `api/endpoints/prices.md` | `api/schemas/prices.md` |
| Promotions and campaigns | `api/endpoints/promotions.md` | `api/schemas/prices.md` |
| Stores and markets | `api/endpoints/stores.md` | `api/schemas/common.md` |
| Purchase orders | `api/endpoints/purchase-orders.md` | `api/schemas/purchase-orders.md` |
| Notifications (email, SMS) | `api/endpoints/notifications.md` | `api/schemas/common.md` |
| Analytics and reporting | `api/endpoints/analytics.md` | `api/schemas/common.md` |
| Projects | `api/endpoints/projects.md` | `api/schemas/common.md` |
| Configuration and settings | `api/endpoints/configuration.md` | `api/schemas/common.md` |
| Authentication and tokens | `api/endpoints/auth.md` | — |

### Both layers needed

Some questions need both conceptual context and API details. For example:
- "How do I implement click & collect?" → read `references/orders.md` first, then `api/endpoints/orders.md`
- "Set up a checkout flow" → read `references/carts.md` first, then `api/endpoints/carts.md`
- "Integrate our ERP with Omnium" → read `references/integrations.md` first, then relevant endpoint files

## Common API patterns (quick reference)

These patterns apply across all domains — no need to look them up each time.

**Search**: `POST /api/{resource}/Search` with JSON body containing `take`, `page`, `sortOrder`, and filters.
Max result window: `take × page ≤ 10,000`. Disable facets with `disableFacets: true` for backend integrations.

**Scroll**: `POST /api/{resource}/Scroll` → returns `scrollId` → `GET /api/{resource}/Scroll/{scrollId}` until empty.
Use for datasets > 10,000 items.

**Patch**: `PATCH /api/{resource}/{id}/Patch{Resource}` — partial update, only supplied fields change.
Set `keepExistingCustomProperties: true` to merge (default), `false` to replace.

**Bulk operations**: Most resources support `AddMany`, `PatchMany`, `UpdateMany` — max 100-1000 items per batch.

**Delta queries**: `GET /api/{resource}/GetAll?changedSince=2025-01-01T00:00:00Z` — fetch only changed items.

**HTTP status codes**: 200 OK, 201 Created, 204 No Content, 400 Bad Request, 401 Unauthorized (token expired), 
404 Not Found, 409 Conflict (duplicate ID), 429 Rate Limited (check Retry-After header), 500 Server Error.
