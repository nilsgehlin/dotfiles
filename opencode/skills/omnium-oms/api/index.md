# Omnium OMS API Reference — Index

This directory contains the structured API specification for Omnium OMS, broken down by domain.

## Structure

```
api/
├── index.md              ← You are here. TOC and common conventions.
├── endpoints/            ← One file per domain with all endpoints, params, and request/response refs.
│   ├── orders.md
│   ├── carts.md
│   ├── customers-b2c.md
│   ├── customers-b2b.md
│   ├── products.md
│   ├── inventory.md
│   ├── prices.md
│   ├── promotions.md
│   ├── stores.md
│   ├── purchase-orders.md
│   ├── notifications.md
│   ├── analytics.md
│   ├── projects.md
│   ├── configuration.md
│   └── auth.md
└── schemas/              ← Data models with field definitions, grouped by domain.
    ├── orders.md
    ├── carts.md
    ├── customers.md
    ├── products.md
    ├── inventory.md
    ├── prices.md
    ├── purchase-orders.md
    └── common.md
```

## Base URLs

| Environment | API Base URL | Swagger |
|-------------|-------------|---------|
| Test | `https://apitest.omnium.no` | `https://apitest.omnium.no/documentation` |
| Production | `https://api.omnium.no` | `https://api.omnium.no/documentation` |

Swagger is also segmented: `/documentation/orders`, `/documentation/products`, `/documentation/carts`, 
`/documentation/customers`, `/documentation/projects`.

## Authentication

All endpoints require a JWT Bearer token.

```
POST /api/token?clientId={id}&clientSecret={secret}&returnAsJson=true
→ { "accessToken": "eyJ...", "tokenType": "Bearer", "expiresIn": 864000 }
```

Include in all requests: `Authorization: Bearer {accessToken}`

Token is valid for 10 days. See `endpoints/auth.md` for full details.

## Common conventions

These apply to all endpoint files below — they are not repeated in each file.

### Content type
All request/response bodies use `Content-Type: application/json`.

### Search pattern
Every major resource has a search endpoint:
```
POST /api/{Resource}/Search
Body: { "take": 20, "page": 0, "sortOrder": "CreatedDescending", ...filters }
Response: { "result": [...], "totalHits": N, "facets": [...], "scrollId": null }
```
- `take`: max 100 per page
- `page`: 0-based. Max offset: take × page ≤ 10,000
- Disable facets with `disableFacets: true` (or `isFacetsDisabled: true` for products)

### Scroll pattern (large datasets)
```
POST /api/{Resource}/Scroll  →  { "result": [...], "scrollId": "abc" }
GET  /api/{Resource}/Scroll/{scrollId}  →  next batch
```
Keep calling until `result` is empty.

### Patch pattern (partial updates)
```
PATCH /api/{Resource}/{id}/Patch{Resource}
Body: { only the fields you want to change }
```
- `keepExistingCustomProperties`: true (default) = merge, false = replace all
- `keepExistingListItems`: true (default) = merge tags/externalIds, false = replace
- `propertiesRemovalConditions`: remove specific properties before applying patch

### Bulk operations
- `POST /api/{Resource}/AddMany` — batch create (100-1000 items)
- `PATCH /api/{Resource}/PatchMany` — batch partial update
- `PUT /api/{Resource}/UpdateMany` — batch full update

### Delta queries
```
GET /api/{Resource}/GetAll?changedSince=2025-01-01T00:00:00Z&page=1&pageSize=100
```

### Standard error responses
All endpoints may return these (not repeated per endpoint):

| Code | Meaning |
|------|---------|
| 400 | Validation error or invalid parameters |
| 401 | Missing, expired, or invalid token |
| 404 | Resource not found |
| 409 | Conflict (duplicate ID on create) |
| 429 | Rate limited — check `Retry-After` header |
| 500 | Server error |

### Roles
Each domain has Read and Admin roles. Read = GET/Search. Admin = full CRUD.
- Orders: `OrderRead`, `OrderAdmin`
- Products: `ProductRead`, `ProductAdmin`
- Customers: `CustomerRead`, `CustomerAdmin`
- Carts: `CartRead`, `CartAdmin`
- Inventory: `InventoryRead`, `InventoryAdmin`
- Special: `CommerceUser` (headless commerce), `ApiOwner` (full access)

## Endpoint files — what each covers

| File | API tags covered | Key operations |
|------|-----------------|----------------|
| `endpoints/orders.md` | Orders, Orders \| Returns, Orders \| Analytics | CRUD, search, workflow, patch, order lines, payments, returns |
| `endpoints/carts.md` | Carts \| Add, Carts \| Get, Carts \| Update, Carts \| Checkout | Add items, manage cart, apply coupons, checkout → order |
| `endpoints/customers-b2c.md` | Customers \| B2C | Private customer CRUD, search, merge, loyalty |
| `endpoints/customers-b2b.md` | Customers \| B2B, Customers \| B2B \| Assets, Customers \| B2B \| Contact persons | Business customer CRUD, contact persons, assets |
| `endpoints/products.md` | Products | Product CRUD, search, categories, variants |
| `endpoints/inventory.md` | Inventory | Stock levels, ATP, inventory value |
| `endpoints/prices.md` | Prices | Price lists, price lookups |
| `endpoints/promotions.md` | Promotions | Campaign CRUD, active promotions |
| `endpoints/stores.md` | Stores | Store CRUD, warehouse config |
| `endpoints/purchase-orders.md` | PurchaseOrders | Supplier orders, goods reception |
| `endpoints/notifications.md` | Notifications | Email, SMS sending |
| `endpoints/analytics.md` | Orders \| Analytics | Analytics order line search |
| `endpoints/projects.md` | Projects | Project management |
| `endpoints/configuration.md` | Configuration, Settings | System settings, scheduled tasks |
| `endpoints/auth.md` | Token | Authentication, token management |

## Schema files — what each covers

| File | Key schemas |
|------|------------|
| `schemas/orders.md` | OmniumOrder, OmniumOrderLine, OmniumOrderForm, OmniumOrderSearchRequest, OmniumOrderPatch |
| `schemas/carts.md` | OmniumCart, OmniumCartSearchRequest, OmniumAddProductOptionsRequest |
| `schemas/customers.md` | OmniumPrivateCustomer, OmniumBusinessCustomer, OmniumContactPerson, OmniumCustomerSearchRequest |
| `schemas/products.md` | OmniumProduct, OmniumProductSearchRequest, OmniumProductCategory |
| `schemas/inventory.md` | OmniumInventory, OmniumInventorySearchRequest |
| `schemas/prices.md` | OmniumPriceList, OmniumPromotion |
| `schemas/purchase-orders.md` | OmniumPurchaseOrder, OmniumSupplier |
| `schemas/common.md` | OmniumProperty, OmniumAddress, OmniumPayment, OmniumShipment, ProblemDetails, OmniumSearchResult, OmniumAsset, OmniumEmailMessage |
