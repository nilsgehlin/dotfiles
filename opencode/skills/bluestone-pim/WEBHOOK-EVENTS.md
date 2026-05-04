# Bluestone PIM Webhook Events

## General payload structure

All webhook events are delivered as HTTP POST requests with this structure:

```json
{
  "timestamp": 1698151920627,
  "events": [
    {
      "changes": {
        "eventType": "EVENT_TYPE_NAME",
        "entityIds": ["id1", "id2"],
        // ... event-specific fields
      }
    }
  ]
}
```

- `timestamp`: Unix timestamp (milliseconds) of when the event occurred
- `events`: Array of change events (usually one per delivery)
- `entityIds`: The PIM IDs of affected entities
- Event-specific fields vary by type (see examples below)

## All event types

### Product updates

| Event type | Description |
|------------|-------------|
| `PRODUCT_CREATED` | New product created |
| `PRODUCT_WATCH_METADATA_NAME` | Product name changed |
| `PRODUCT_WATCH_METADATA_NUMBER` | Product number changed |
| `PRODUCT_WATCH_METADATA_DESCRIPTION` | Product description changed |
| `PRODUCT_WATCH_STATE` | Product status changed (e.g., TO_BE_PUBLISHED) |
| `PRODUCT_WATCH_CATEGORY` | Product added/removed from category |
| `PRODUCT_WATCH_ASSET` | Product asset added/removed |
| `PRODUCT_WATCH_RELATION` | Product relation added/removed |
| `PRODUCT_WATCH_LABEL` | Product label added/removed |
| `PRODUCT_WATCH_ATTRIBUTE_ASSOCIATION` | Attribute assigned to product |
| `PRODUCT_WATCH_ATTRIBUTE_DISASSOCIATION` | Attribute unassigned from product |
| `PRODUCT_WATCH_ATTRIBUTE_UPDATE_VALUE` | Attribute value changed on product |
| `PRODUCT_WATCH_VARIANT` | Product added/removed from variant group |
| `PRODUCT_WATCH_BUNDLE` | Product added/removed from bundle |
| `PRODUCT_WATCH_BUNDLE_QUANTITY` | Product quantity in bundle changed |

### Catalog/category updates

| Event type | Description |
|------------|-------------|
| `CATEGORY_CREATED` | New catalog/category added |
| `CATEGORY_WATCH_METADATA_NAME` | Category name changed |
| `CATEGORY_WATCH_METADATA_NUMBER` | Category number changed |
| `CATEGORY_WATCH_METADATA_DESCRIPTION` | Category description changed |
| `CATEGORY_WATCH_ASSET` | Category asset added/removed |
| `CATEGORY_WATCH_MOVE` | Category moved to different parent |
| `CATEGORY_WATCH_ORDER` | Category reordered within parent |
| `CATEGORY_REMOVED` | Category deleted |
| `CATEGORY_WATCH_ARCHIVE_STATE` | Catalog archived/unarchived |
| `CATEGORY_LOCAL_WATCH_ATTRIBUTE_ASSOCIATION` | Attribute assigned to category |
| `CATEGORY_LOCAL_WATCH_ATTRIBUTE_DISASSOCIATION` | Attribute unassigned from category |
| `CATEGORY_LOCAL_WATCH_ATTRIBUTE_UPDATE_VALUE` | Attribute value changed on category |
| `CATEGORY_WATCH_ATTRIBUTE` | Category level attribute (CLA) value changed |

### Asset updates

| Event type | Description |
|------------|-------------|
| `ASSET_CREATED` | Asset added to DAM |
| `ASSET_WATCH_METADATA_NAME` | Asset name changed |
| `ASSET_WATCH_METADATA_NUMBER` | Asset number changed |
| `ASSET_WATCH_METADATA_DESCRIPTION` | Asset description changed |
| `ASSET_WATCH_ATTRIBUTE_ASSOCIATION` | Attribute assigned to asset |
| `ASSET_WATCH_ATTRIBUTE_DISASSOCIATION` | Attribute unassigned from asset |
| `ASSET_WATCH_ATTRIBUTE_UPDATE_VALUE` | Attribute value changed on asset |

### Other

| Event type | Description |
|------------|-------------|
| `PRODUCT_SYNC_DONE` | New sync completed to Public API |

## Representative payloads

### PRODUCT_CREATED

```json
{
  "timestamp": 1698151920627,
  "events": [{
    "changes": {
      "eventType": "PRODUCT_CREATED",
      "entityIds": ["6537bdebb388e74a0482e761"],
      "metadataChanges": [
        { "field": "NAME", "oldValue": null, "newValue": "Product A", "context": "en" },
        { "field": "NUMBER", "oldValue": null, "newValue": "product-a", "context": "en" },
        { "field": "TYPE", "oldValue": null, "newValue": "SINGLE", "context": "en" }
      ]
    }
  }]
}
```

### PRODUCT_WATCH_ATTRIBUTE_UPDATE_VALUE (context-aware)

When a **global** attribute value changes in context "en" (affects all contexts including those with fallback):

```json
{
  "timestamp": 1698151295719,
  "events": [{
    "changes": {
      "eventType": "PRODUCT_WATCH_ATTRIBUTE_UPDATE_VALUE",
      "entityIds": ["641314b6ee358800012b279b"],
      "attributeChange": {
        "changeType": "UPDATE",
        "attributeType": "text",
        "attributeId": "5da7254de21b84000c6ed075",
        "attributeOldValue": "Red",
        "attributeNewValue": "Blue",
        "context": "en",
        "contextId": null,
        "affectedContextIds": ["en", "no", "pl"]
      }
    }
  }]
}
```

When a **context-specific** attribute changes in context "en" (affects "en" and contexts using "en" as fallback):

```json
{
  "timestamp": 1698151295719,
  "events": [{
    "changes": {
      "eventType": "PRODUCT_WATCH_ATTRIBUTE_UPDATE_VALUE",
      "entityIds": ["641314b6ee358800012b279b"],
      "attributeChange": {
        "changeType": "UPDATE",
        "attributeType": "text",
        "attributeId": "5da7254de21b84000c6ed075",
        "attributeOldValue": "Red",
        "attributeNewValue": "Blue",
        "context": "en",
        "contextId": "en",
        "affectedContextIds": ["en", "no"]
      }
    }
  }]
}
```

Key distinction: `contextId: null` means global attribute; `contextId: "en"` means context-specific. `affectedContextIds` tells you which contexts are impacted (including fallback chains).

### CATEGORY_CREATED

```json
{
  "timestamp": 1698225320204,
  "events": [{
    "changes": {
      "eventType": "CATEGORY_CREATED",
      "entityIds": ["6538dca57566616af2206608"],
      "name": "Shoes",
      "number": "6538dca57566616af2206608",
      "parentId": "633d67fed6018000014074a1"
    }
  }]
}
```

### ASSET_CREATED

```json
{
  "timestamp": 1776081044169,
  "events": [{
    "changes": {
      "eventType": "ASSET_CREATED",
      "entityIds": ["8ae2a76a-5a8a-4210-98a3-ab19b99cc420"],
      "metadataChanges": [
        { "field": "NAME", "oldValue": null, "newValue": "Bluestone logo blue", "context": "en" },
        { "field": "NUMBER", "oldValue": null, "newValue": "8ae2a76a-5a8a-4210-98a3-ab19b99cc420", "context": "en" },
        { "field": "MEDIA_TYPE", "oldValue": null, "newValue": "IMAGE", "context": "en" }
      ]
    }
  }]
}
```

### PRODUCT_SYNC_DONE

```json
{
  "timestamp": 1698152131200,
  "events": [{
    "changes": {
      "eventType": "PRODUCT_SYNC_DONE",
      "entityIds": [],
      "syncDoneData": {
        "field": "PAPI_SYNC_ID",
        "value": "6537bebdfbde8a0013911d23",
        "context": "en"
      }
    }
  }]
}
```

Use the `value` field (sync ID) with PAPI `/differences/sync/{id}/products` to see what changed.

### PRODUCT_WATCH_CATEGORY (association/disassociation)

```json
{
  "timestamp": 1698151781966,
  "events": [{
    "changes": {
      "eventType": "PRODUCT_WATCH_CATEGORY",
      "entityIds": ["641314b6ee358800012b279b"],
      "categoryChange": {
        "changeType": "ASSOCIATE",
        "categoryId": "633d6809d6018000014074a2"
      }
    }
  }]
}
```

`changeType` is `ASSOCIATE` (added) or `DISASSOCIATE` (removed). This same pattern applies to `PRODUCT_WATCH_ASSET`, `PRODUCT_WATCH_RELATION`, `PRODUCT_WATCH_LABEL`, `PRODUCT_WATCH_VARIANT`, and `PRODUCT_WATCH_BUNDLE`.

## Full reference

For the complete list of all event types with example payloads, see: https://help.bluestonepim.com/webhook-event-types

For managing webhooks via MAPI, see the External notifications component: https://docs.api.bluestonepim.com/openapi/external-notifications.json

For managing webhooks via UI, see: https://help.bluestonepim.com/webhooks
