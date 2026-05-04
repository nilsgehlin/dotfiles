# Bluestone PIM API Reference

## Environments

| Environment | API Base URL | IDP (Token) URL | PAPI Base URL |
|-------------|-------------|-----------------|---------------|
| **Production** | `https://api.bluestonepim.com` | `https://idp.bluestonepim.com/op/token` | `https://api.bluestonepim.com/v1` |
| **Production US** | `https://api-us.bluestonepim.com` | (contact Bluestone) | (contact Bluestone) |
| **Test** | `https://api.test.bluestonepim.com` | `https://idp.test.bluestonepim.com/op/token` | `https://api.test.bluestonepim.com/v1` |

MAPI docs per environment:
- Production: https://docs.api.bluestonepim.com
- Production US: https://docs.api-us.bluestonepim.com
- Test: https://docs.api.test.bluestonepim.com

Append `.md` to any doc page URL for a markdown version (e.g., `https://docs.api.bluestonepim.com/docs/authentication.md`).

---

## Public API (PAPI)

PAPI is **read-only** and serves published product data. Use the Tolerant Reader pattern -- new fields may be added without notice.

### Authentication

Pass the API key as a header on every request:

```
x-api-key: YOUR_API_KEY
```

Contact Bluestone support to obtain an API key.

### Common headers

| Header | Description | Default |
|--------|-------------|---------|
| `x-api-key` | API key (required) | -- |
| `context` | Language/market context ID | `en` |

### Pagination

Most list endpoints support:
- `itemsOnPage` -- number of results per page
- `pageNo` -- zero-based page number

Cursor-based pagination is available via `/products/cursor/all` using `cursor` and `limit` (max 100).

### Swagger / OpenAPI

- Production: `https://api.bluestonepim.com/v1/swagger.json`
- Test: `https://api.test.bluestonepim.com/v1/swagger.json`
- Swagger editor (prod): https://editor.swagger.io/?url=https%3A%2F%2Fapi.bluestonepim.com%2Fv1%2Fswagger.json

### Product endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/products/{id}` | Get single product by PIM ID |
| POST | `/products/list` | Search/filter products (body: `FilteringCriteriaRequest`) |
| POST | `/products/by-ids` | Get products by array of IDs |
| POST | `/products/by-numbers` | Get products by array of numbers |
| POST | `/products/cursor/all` | Cursor-based pagination through all products |

#### FilteringCriteriaRequest (POST /products/list)

All fields are optional. When multiple are supplied, all conditions must match (AND logic).

```json
{
  "ids": ["..."],
  "names": ["..."],           // partial match
  "numbers": ["..."],         // exact match
  "labels": ["..."],
  "categories": ["..."],      // category IDs (no subcategories)
  "attributes": ["..."],      // attribute IDs (has attribute, any value)
  "attributeFilters": [       // attribute number + value match
    { "number": "color", "value": "Blue" }
  ],
  "relations": ["..."],       // relation IDs
  "productTypes": ["SINGLE", "VARIANT", "GROUP", "BUNDLE"],
  "bundles": ["..."]          // find bundle products containing these IDs
}
```

Sorting: `?sort=number` or `?sort=name:desc`

#### Product response shape

```json
{
  "id": "string",
  "type": "SINGLE|VARIANT|GROUP|BUNDLE",
  "name": "string",
  "number": "string",
  "description": "string",
  "lastUpdate": 1234567890,
  "createDate": 1234567890,
  "attributes": [{ /* see ATTRIBUTE-TYPES.md */ }],
  "media": [{
    "id": "string",
    "downloadUri": "string",
    "previewUri": "string",
    "name": "string",
    "fileName": "string",
    "contentType": "string",
    "labels": ["string"],
    "number": "string",
    "attributes": [{ /* AssetAttribute */ }]
  }],
  "labels": ["string"],
  "categories": ["categoryId1", "categoryId2"],
  "relations": [{
    "id": "string",
    "name": "string",
    "number": "string",
    "productId": "string",
    "reverse": false,
    "direction": "ONE_WAY|TWO_WAY"
  }],
  "variants": ["variantProductId1"],
  "variantParentId": "string",
  "bundles": [{ "productId": "string", "quantity": 1 }],
  "metadata": [{ "id": "string", "value": "any" }]
}
```

### Category endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/categories` | List root categories (catalogs). Filter by `name`. |
| GET | `/categories/{categoryId}` | Get category with subcategories. `?deep=10` (default). |
| GET | `/categories/{categoryId}/products` | Products in category. `?includeSubCategories=true`. |
| GET | `/categories/{categoryId}/ancestors` | Parent categories for a given category. |
| GET | `/categories/scan` | Flat paginated list of categories. Optional `?categoryId=` filter. |
| POST | `/categories/by-numbers` | Get categories by array of numbers. |

### Other PAPI endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/attributes` | List all attribute definitions (paginated) |
| POST | `/attributes/by-numbers` | Get attribute definitions by numbers |
| GET | `/relations` | List all relation definitions |
| GET | `/contexts` | List all available contexts |
| GET | `/syncs` | List sync events. `?createdAfter=timestamp` |
| GET | `/differences/sync/{id}/products` | Product diffs for a sync (ADD/CHANGE/DELETE) |
| GET | `/differences/sync/{id}/categories` | Category diffs for a sync |
| GET | `/differences/sync/{id}/attributes` | Attribute diffs for a sync |
| GET | `/differences/sync/{id}/relations` | Relation diffs for a sync |
| GET | `/dictionaries/{definitionId}` | Get dictionary values for a definition (cursor-based) |
| GET | `/health` | Health check |

---

## Management API (MAPI)

MAPI provides full CRUD access to all PIM data, configuration, and operations.

### Authentication

OAuth2 `client_credentials` grant:

```
POST {IDP_URL}
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials&client_id=YOUR_ID&client_secret=YOUR_SECRET
```

Response:
```json
{
  "access_token": "string",
  "expires_in": 600,
  "token_type": "Bearer"
}
```

Then pass on every MAPI request:
```
Authorization: Bearer {access_token}
Content-Type: application/json
```

Tokens expire (typically 600s). Cache and refresh before expiry. **Keep credentials safe** -- MAPI gives full access to all data and operations.

Full auth guide: https://docs.api.bluestonepim.com/docs/authentication.md

### Common headers

| Header | Description |
|--------|-------------|
| `Authorization` | `Bearer {token}` (required) |
| `Content-Type` | `application/json` |
| `context` | Context ID (e.g., `en`) |
| `context-fallback` | `true` to enable fallback to parent context |

### Rate limiting

- **Rate limit**: Predefined RPS (requests per second), per contract
- **Burst limit**: Up to 10 additional RPS burst capacity
- **429 Too Many Requests**: Implement exponential backoff
- Limits apply to all clients combined within an organization

Full details: https://docs.api.bluestonepim.com/docs/throttling-and-rate-limits.md

### MAPI endpoint groups and OpenAPI specs

Each component has a full OpenAPI spec that can be used with [OpenAPI Generator](https://openapi-generator.tech) for client code generation.

| Component | OpenAPI Spec URL | Docs |
|-----------|-----------------|------|
| **PIM** (products, catalogs, attributes) | https://docs.api.bluestonepim.com/openapi/pim.json | https://docs.api.bluestonepim.com/reference/bulk.md |
| **Media bank** (assets, upload) | https://docs.api.bluestonepim.com/openapi/media-bank.json | https://docs.api.bluestonepim.com/reference/labels.md |
| **Search** (full-text, query builder) | https://docs.api.bluestonepim.com/openapi/search.json | https://docs.api.bluestonepim.com/reference/full-text-search.md |
| **Labels** | https://docs.api.bluestonepim.com/openapi/labels.json | https://docs.api.bluestonepim.com/reference/labels-1.md |
| **Global settings** (filters, contexts) | https://docs.api.bluestonepim.com/openapi/global-settings.json | https://docs.api.bluestonepim.com/reference/filters.md |
| **History** | https://docs.api.bluestonepim.com/openapi/history.json | https://docs.api.bluestonepim.com/reference/history.md |
| **Tasks** | https://docs.api.bluestonepim.com/openapi/tasks.json | https://docs.api.bluestonepim.com/reference/technical-3.md |
| **Query builder** | https://docs.api.bluestonepim.com/openapi/query-builder.json | https://docs.api.bluestonepim.com/reference/savedview.md |
| **Public API sync** | https://docs.api.bluestonepim.com/openapi/public-api-sync.json | https://docs.api.bluestonepim.com/reference/products-2.md |
| **Public API** (via MAPI) | https://docs.api.bluestonepim.com/openapi/page.json | https://docs.api.bluestonepim.com/reference/products-3.md |
| **IDP** (users, API clients, SSO) | https://docs.api.bluestonepim.com/openapi/idp.json | https://docs.api.bluestonepim.com/reference/additional-user-properties.md |
| **External notifications** (webhooks) | https://docs.api.bluestonepim.com/openapi/external-notifications.json | https://docs.api.bluestonepim.com/reference/subscriptions-webhook.md |
| **Completeness score** | https://docs.api.bluestonepim.com/openapi/completeness-score.json | https://docs.api.bluestonepim.com/reference/requirements.md |
| **Metadata** | https://docs.api.bluestonepim.com/openapi/metadata.json | https://docs.api.bluestonepim.com/reference/metadata-1.md |
| **UI settings** | https://docs.api.bluestonepim.com/openapi/ui-settings.json | https://docs.api.bluestonepim.com/reference/columns-setups.md |

**When you need full endpoint details for a MAPI component, fetch the OpenAPI spec URL above.**

### Key MAPI endpoints (embedded)

#### Products (PIM component)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/pim/products` | Create a product |
| PUT | `/pim/products/{productId}` | Update product metadata (name, number, description) |
| PUT | `/pim/products/{productId}/archive` | Archive a product |
| PUT | `/pim/products/{productId}/unarchive` | Unarchive a product |
| GET | `/pim/products/{productId}` | Get a product |
| POST | `/pim/products/find` | Find products by criteria |

#### Attributes (PIM component)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/pim/products/{productId}/attributes` | Add/update single attribute on product |
| PUT | `/pim/products/{productId}/attributes` | Add/update multiple attributes (bulk) |
| DELETE | `/pim/products/{productId}/attributes/{attributeId}` | Remove attribute from product |

When adding dictionary attributes, you need the dictionary option ID. Find options via:
| Method | Path | Description |
|--------|------|-------------|
| GET | `/pim/dictionaries/{definitionId}/options` | List dictionary options |
| POST | `/pim/dictionaries/{definitionId}/options/find` | Search dictionary options |

#### Catalogs and categories (PIM component)

| Method | Path | Description |
|--------|------|-------------|
| GET | `/pim/catalogs` | List all catalogs |
| POST | `/pim/catalogs` | Create a catalog |
| GET | `/pim/catalogs/{catalogId}/nodes` | Get category tree |
| POST | `/pim/catalogs/{catalogId}/nodes` | Create a category |

#### Variants (PIM component)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/pim/products/{groupId}/variants` | Add variant to group |
| DELETE | `/pim/products/{groupId}/variants/{variantId}` | Remove variant from group |

#### Assets (Media bank component)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/media-bank/assets` | Upload asset (multipart) |
| GET | `/media-bank/assets/{assetId}` | Get asset details |
| PUT | `/media-bank/assets/{assetId}` | Update asset metadata |
| POST | `/pim/products/{productId}/assets` | Link asset to product |

#### Search (Search component)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/search/products` | Full-text search across products |
| POST | `/query-builder/products` | Advanced query with complex filters and saved views |

#### Webhooks (External notifications component)

| Method | Path | Description |
|--------|------|-------------|
| GET | `/external-notifications/webhooks` | List webhook subscriptions |
| POST | `/external-notifications/webhooks` | Create webhook subscription |
| PUT | `/external-notifications/webhooks/{id}` | Update webhook subscription |
| DELETE | `/external-notifications/webhooks/{id}` | Delete webhook subscription |

---

## Publish / Sync flow

Data managed via MAPI is **not visible** in PAPI until published. This is the most common integration pitfall.

### How publishing works

1. Products are edited in PIM (via UI or MAPI)
2. Products are set to a publish status per context (e.g., "TO_BE_PUBLISHED")
3. A publish/sync is triggered -- either manually in the UI or via MAPI
4. The sync process copies data from the PIM database to the Public API database
5. A sync record is created, and a `PRODUCT_SYNC_DONE` webhook event fires

### Sync states

| State | Description |
|-------|-------------|
| `INITIALIZING` | Sync is being prepared |
| `PENDING` | Sync is queued |
| `PUBLISH` | Sync is actively copying data |
| `PUBLISH_CLEANUP` | Post-publish cleanup |
| `CLOSED` | Sync completed successfully |
| `CANCELLED` | Sync was cancelled |

### Session sync (MAPI)

Session sync allows batching multiple changes before triggering a publish:

1. Start a sync session via MAPI Public API sync endpoints
2. Make changes (create/update products, categories, etc.)
3. Complete the session to trigger the publish

Use the **Public API sync** component endpoints. Fetch the OpenAPI spec for full details:
`https://docs.api.bluestonepim.com/openapi/public-api-sync.json`

### Monitoring syncs (PAPI)

- `GET /syncs` -- list sync events, use `?createdAfter={timestamp}` for polling
- `GET /differences/sync/{id}/products` -- see what changed (ADD, CHANGE, DELETE)
- Each diff entry contains the entity `id` and optionally `number`

### Common pitfall

"I updated a product via MAPI but it's not showing in PAPI" -- the product needs to be **published** first. Check:
1. Is the product in a publishable status?
2. Has a sync been triggered after the change?
3. Was the sync for the correct **context**?
4. Did the sync reach `CLOSED` state?

---

## Media service (CDN)

Assets are served from `media.bluestonepim.com` (or a custom subdomain). Images support query-parameter transformations applied server-side before delivery.

**Media URL format**: `https://media.bluestonepim.com/{orgId}/{assetPath}`

Media transfer counts toward your monthly data transfer quota. Optimize images using transformation params.

### Transformation parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| **Resize** | | |
| `w` | int | Target width (pixels). Preserves aspect ratio. |
| `h` | int | Target height (pixels). Preserves aspect ratio. |
| `only-shrink-larger` | flag | Only downscale, never upscale. |
| **Crop** | | |
| `cw` | int | Crop width (required for crop). |
| `ch` | int | Crop height. |
| `cx` | int | X offset from left. |
| `cy` | int | Y offset from top. |
| **Smart crop (AI)** | | |
| `scw` | int | Smart crop width (both scw and sch required). |
| `sch` | int | Smart crop height. |
| **Format** | | |
| `f` | string | Output format: `jpg`, `png`, `gif`, `webp`, `avif`. Default: `jpg`. |
| **Trim** | | |
| `trim` | flag | Auto-remove border/whitespace. |
| `trim-fuzz` | float | Trim tolerance (0.0-1.0). Use ~0.12 for JPEG artifacts. |
| **Color correction** | | |
| `ag` | flag | Auto gamma correction. |
| `al` | flag | Auto level adjustment. |
| **Other** | | |
| `targetFileName` | string | Custom download filename. |

### Recommended practices

- Use `?f=avif` or `?f=webp` for web delivery (superior compression)
- Use `?w=800&only-shrink-larger` to cap image size without upscaling
- Cropping happens before resizing when both are combined
- First request for a trimmed image may be slow (analysis); subsequent requests are cached
- Use `png`, `webp`, or `avif` for images requiring transparency (not `jpg`)

### Custom subdomains

You can serve media from your own domain via a CNAME to CloudFront. See: https://help.bluestonepim.com/mediaservice-custom-subdomains

---

## Help Center reference

For UI guides, configuration, and non-API documentation:

| Topic | URL |
|-------|-----|
| Help Center home | https://help.bluestonepim.com/ |
| Public API guide | https://help.bluestonepim.com/get-started-with-public-api |
| Management API guide | https://help.bluestonepim.com/get-started-with-management-api |
| Data model overview | https://help.bluestonepim.com/the-data-model |
| Typical usage scenarios | https://help.bluestonepim.com/typical-usage-scenarios |
| Webhook event reference | https://help.bluestonepim.com/webhook-event-types |
| Attribute types in PAPI | https://help.bluestonepim.com/attribute-types-in-public-api |
| Media service | https://help.bluestonepim.com/media-service |
| Working with events | https://help.bluestonepim.com/work-with-events |
| Webhooks management (UI) | https://help.bluestonepim.com/webhooks |
