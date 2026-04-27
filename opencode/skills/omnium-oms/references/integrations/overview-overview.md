# Integrations — Data Flow, Events & Connectors — [Overview](#overview)

## [Overview](#overview)

This guide shows how to import products, inventory, orders, and customers efficiently using Omnium's batch endpoints. When importing data to Omnium, batch operations are strongly recommended over single-item operations. Batch endpoints are optimized to handle high volumes efficiently and reduce API calls dramatically.

* * *

### [Inventory Updates](#inventory-updates)

If you're adding or updating inventory in Omnium, `UpdateMany` is your go-to endpoint, even for a single item. It automatically handles inserts, updates, and skips unchanged items.

Here's an example of how to send multiple inventory updates in one request. Note that `warehouseCode` is the store's identifier in Omnium, and `inventory` represents the absolute stock quantity (not a delta/adjustment):

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/inventory/UpdateMany
     
    [
      {
        "sku": "yellow-tshirt-small",
        "warehouseCode": "oslo-warehouse",
        "inventory": 25
      },
      {
        "sku": "yellow-tshirt-medium",
        "warehouseCode": "oslo-warehouse",
        "inventory": 30
      },
      {
        "sku": "yellow-tshirt-large",
        "warehouseCode": "oslo-warehouse",
        "inventory": 40
      }
    ]

**Why it matters:**

*   Ignores unchanged inventory items
*   Only updates items with actual changes
*   Handles up to 1000 items per batch
*   Automatically inserts new items or updates existing ones
*   Automatically creates inventory transactions
*   **Enriches existing inventory items** - preserves `reservedInventory` and other existing data
*   Optimal performance for bulk operations

**Best Practice:** Use UpdateMany even if you only have a single inventory update. The endpoint is optimized to handle both single and bulk operations efficiently.

* * *

### [Product Updates](#product-updates)

For most product changes, `PatchMany` (or `UpdateMany`) is the best choice. It batches updates efficiently and skips unchanged data.

Here's how to update multiple products at once:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/products/PatchMany
     
    [
      {
        "id": "yellow-tshirt_no",
        "description": "Updated high-quality cotton t-shirt with improved fabric blend"
      },
      {
        "id": "blue-jeans_no",
        "isActive": false
      }
    ]

**Benefits:**

*   Only updates fields that have actual changes
*   Handles up to 1000 products per batch
*   Optimal performance - skips unnecessary updates
*   Preserves existing product data

**For single operations:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/products/{productId}
     
    {
      "description": "Updated product description"
    }

**Note:** Batch operations don't create new product versions, but they're much faster and more efficient.

* * *

### [Price Updates](#price-updates)

Prices can be updated as part of the product (via api/products/PatchMany, for instance), but to ensure proper handling of existing prices, whether you want to retain or remove them, you should use the dedicated pricing endpoint

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/prices/AddMany
     
    [
      {
        "productId": "yellow-tshirt",
        "prices": [
          {
            "marketId": "nor",
            "unitPrice": 349.00,
            "currencyCode": "NOK",
            "validFrom": "2024-01-01T00:00:00Z"
          }
        ]
      },
      {
        "productId": "blue-jeans",
        "prices": [
          {
            "marketId": "nor",
            "unitPrice": 799.00,
            "currencyCode": "NOK",
            "validFrom": "2024-01-01T00:00:00Z"
          }
        ]
      }
    ]

**What you get:**

*   Automatically checks for actual price changes to avoid unnecessary updates
*   Optimized for high-frequency price updates from external systems
*   If you're using [separate prices](/docs/Prices#separate-prices), always use this endpoint for updates

* * *

### [Order Import](#order-import)

**Important:** For new order processing that requires workflow execution (queuing, fulfillment automation, notifications, etc.), **do not use batch operations**. Instead, use the individual POST/PUT endpoints documented at the [Orders Update API](https://apitest.omnium.no/documentation/index.html#/Orders%20%7C%20Update). These endpoints ensure orders are properly queued and workflows are triggered.

**Batch import orders** should only be used when importing from external systems for orders that don't need to trigger workflows, such as:

*   Historical order imports from legacy systems
*   POS orders that are already fulfilled
*   Reporting/analytics data imports

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/orders/ImportMany
     
    [
      {
        "orderId": "EXT-12345",
        "storeId": "oslo-online",
        "marketId": "nor",
        "customer": {
          "email": "customer@example.com",
          "firstName": "John",
          "lastName": "Doe"
        },
        "orderLines": [
          {
            "skuId": "yellow-tshirt-medium",
            "quantity": 2,
            "unitPrice": 299.00
          }
        ]
      },
      {
        "orderId": "EXT-12346",
        "storeId": "oslo-online",
        "marketId": "nor",
        "customer": {
          "email": "another@example.com",
          "firstName": "Jane",
          "lastName": "Smith"
        },
        "orderLines": [
          {
            "skuId": "blue-jeans-32",
            "quantity": 1,
            "unitPrice": 799.00
          }
        ]
      }
    ]

**Benefits:**

*   Process multiple orders in a single API call
*   Reduced overhead and faster processing
*   Better error handling with batch results

* * *

### [Customer Import](#customer-import)

Use the batch endpoint to add or update multiple customers efficiently:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/PrivateCustomers/AddOrUpdateMany
     
    [
      {
        "customerId": "CUST-001",
        "customerNumber": "42",
        "email": "frequent.shopper@example.com",
        "firstName": "Liv",
        "lastName": "Andersen",
        "gender": "Female",
        "birthDate": "1985-03-15T00:00:00Z",
        "phone": "+4798765432",
        "isCustomerClubMember": true,
        "bonusPoints": 1337,
        "tags": ["VIP"],
        "address": {
          "name": "Liv Andersen",
          "line1": "Storgata 15",
          "city": "Oslo",
          "postalCode": "0155",
          "countryCode": "NO",
          "countryName": "Norway",
          "email": "frequent.shopper@example.com",
          "phone": "+4799999999"
        }
      }
    ]

* * *

### [⚠️ Important](#️-important)

Batch endpoints (`*Many` endpoints) should be executed **synchronously**, not in high parallel. Running multiple batch operations simultaneously, especially for the same entity type, may lead to temporary throttling or trigger stricter rate limits. Process batches sequentially to ensure smooth sailing.


## [Summary](#summary)

Batch endpoints = performance, reliability, and fewer API calls.

*   **Inventory** → `UpdateMany`
*   **Products** → `PatchMany` or `UpdateMany`
*   **Prices** → `AddMany`
*   **Orders** → `ImportMany`
*   **Customers** → `AddOrUpdateMany`

### [Batch sizes (starting points):](#batch-sizes-starting-points)

Entity

Recommended Batch

Notes

Inventory

1000

Optimized for high volume

Products

500

Reduce for complex product data

Orders

250–500

Lower if orders have many lines

Customers

500

Adjust for complex B2B data

Prices

500–2000

Larger batches OK for separate prices

💡 Tune batch sizes based on your own API timings and entity complexity.

Batch operations save both time and API overhead — and keep your integrations predictable even under heavy load.

* * *


## [Next Steps](#next-steps)

Now that you understand data import patterns:

*   Review the [Data Out](/docs/Integrations/data-out) for export strategies
*   Check out the [Omnichannel E-Commerce Tutorial](/docs/GettingStartedWithAPI/Tutorials/omnichannel-ecom) for end-to-end examples

[

Previous

Connectors

](/docs/Integrations/connectors)[

Next

Data Out

](/docs/Integrations/data-out)

---


## Data Out

[Integrations](/docs/Integrations)

# Data Out

Best practices for retrieving and synchronizing data from Omnium using delta queries, events, and scrolling.


## [Overview](#overview)

Omnium provides multiple mechanisms for exporting data and keeping external systems synchronized. Choose the right approach based on your use case.

* * *

### [Delta Queries](#delta-queries)

Delta queries let you fetch only data that has changed since a given timestamp. This is ideal for polling-based integrations.

**Example: Get orders modified since a timestamp:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/orders/Search
     
    {
      "modifiedSince": "2024-01-15T10:30:00Z",
      "take": 100
    }

**Benefits:**

*   Retrieve only what has changed
*   Reduce data transfer and processing
*   Simple to implement with timestamp-based polling
*   Works with standard API rate limits

**Best Practice:** Keep track of the timestamp from your last successful query and pass it as modifiedSince in the next call. This ensures you only process new or updated data once and never miss any updates.

#### [Practical Example: Inventory Delta Query with Auto-Scrolling](#practical-example-inventory-delta-query-with-auto-scrolling)

Here's a real-world example showing how delta queries automatically trigger scrolling for large result sets:

**Sample request for inventory delta query:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/inventory/search
     
    {
      "lastModified": "2019-11-21T17:32:28Z"
    }

**Sample response when result set exceeds 1000 items:**

Notice that the `scrollId` property has been populated because `totalHits` exceeds 1000, meaning you should use the scroll endpoint to fetch remaining inventory items:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "totalHits": 41244,
      "result": [
        {
          "sku": "102103",
          "warehouseCode": "40",
          "inventory": 33,
          "reservedInventory": 7,
          "location": "32D-A2"
        },
        {
          "sku": "102104",
          "warehouseCode": "40",
          "inventory": 15,
          "reservedInventory": 2
        }
        // ... more items up to 1000
      ],
      "scrollId": "2f842421e06e4c60bb2c4f0d8b3ef60b"
    }

**Important:** Specifically for the inventory search endpoint, when the total amount is larger than 1000, the response will automatically contain a `scrollId` which can be used with the scroll endpoint to fetch all remaining items:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/inventory/scroll/2f842421e06e4c60bb2c4f0d8b3ef60b

Continue calling the scroll endpoint with the latest `scrollId` until all items are retrieved.

* * *

### [Event-Driven Export](#event-driven-export)

Omnium fires events for most operations, whether executed via API or UI. Subscribe to these events for near real-time data synchronization.

**Event Subscription Types:**

*   Webhooks
*   Azure Storage Queues
*   Azure Service Bus
*   Apache Kafka

**Setting Up Event Subscriptions:**

Event subscribers are registered in the Omnium UI under **Configuration > Event subscriptions**. You can filter events by:

*   Entity type (orders, products, inventory, etc.)
*   Order type (Click and Collect, standard, etc.)
*   Status changes
*   Store
*   Market

**Learn More:** See our [Events documentation](/docs/Integrations/events) for detailed information on events and event subscriptions

* * *

### [Scrolling for Large Datasets](#scrolling-for-large-datasets)

Use scrolling when you need to process large datasets such as initial loads, backfills, recovery operations, or when there has been a massive number of updates. For delta queries, we actually encourage using the scroll endpoints, even if there are few or no data changes.

**Example: Initial scroll request:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products/scroll
     
    {
      "marketId": "nor",
      "isActive": true
    }

**Response includes a `scrollId`:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "result": [...],
      "scrollId": "abc123xyzerogpkaraahhreallylongscrollid",
      "totalCount": 90210
    }

**Continue scrolling with scrollId:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/products/scroll/abc123xyz

**Key Features:**

*   Consistent snapshot of data at query time
*   Handles datasets too large for standard pagination
*   Must complete or terminate scroll to free resources
*   Stricter rate limits than standard endpoints

**Warning:** Unfinished scroll operations continue to hold server resources. Always complete your scroll operations by fetching all results, or the scroll context will remain open until it expires (typically after 5 minutes of inactivity). Leaving many scrolls open can negatively impact system performance.

**Learn More:** See our [Scrolling documentation](/docs/Integrations/scrolling) for best practices and detailed workflow.

* * *


## [Event-Driven vs Polling Integrations](#event-driven-vs-polling-integrations)

Choosing the right integration pattern depends on your use case. Here's guidance on when to use each approach.

**Polling integrations** use delta queries (aka. `changedSince` or `modifiedSince` parameters) to periodically check for changes, while **event-driven integrations** receive push notifications when changes occur.

### [Quick Comparison](#quick-comparison)

**Aspect**

**Event-Driven (Push)**

**Polling (Pull/Delta Queries)**

**Latency**

Near real-time

Controlled delay (e.g., 30 sec to hours/daily)

**Best For**

Low-volume, time-critical changes

High-volume, frequently changing data

**Complexity**

Higher (event processing, replays)

Lower (simple scheduled jobs)

**Message Volume**

Can be very high for noisy domains

Batched, controlled volume

**Infrastructure**

Requires event processing system

Standard HTTP polling

**Control**

Omnium pushes when changes occur

You control polling frequency

**Examples**

Order status, payments

Inventory sync, product updates

* * *

### [When Events Shine](#when-events-shine)

**Use events when you need near real-time propagation and precision:**

*   Order lifecycle changes\*\* that drive customer communications or fulfillment
*   Customer profile updates such as consent, loyalty points, or address changes
*   Low-volume but time-critical operations

**Benefits:**

*   Low latency (near real-time)
*   Fine-grained change signals
*   Natural fit for reactive workflows
*   Immediate downstream processing

**Trade-offs:**

*   Potentially very high message counts for noisy domains (e.g., inventory - could be, but not always)
*   Complex error handling and replays
*   Harder to aggregate or reorder for downstream batch systems
*   Requires robust event processing infrastructure

**Example Use Cases:**

*   Notify customer when order is ready for pickup
*   Update product availability on website immediately when stock changes
*   Trigger fulfillment workflows on order placement

* * *

### [When Polling is Better](#when-polling-is-better)

**For high-churn domains such as inventory, polling with delta queries is often more efficient:**

**Recommended Pattern:**

1.  Poll delta queries at fixed intervals (e.g., every 30 seconds to 1 minute for high-priority data, or hourly/daily for less time-sensitive data - tuned to your business needs)
2.  Apply changes downstream using bulk operations
3.  Store the timestamp of successful processing and use it for the next poll.

**Benefits:**

*   Lower operational overhead and simpler error handling
*   Natural batching for downstream systems that prefer bulk writes
*   Easier throughput control and backoff under load
*   Reduced message volume for high-frequency changes
*   Better for aggregation and bulk processing
*   You control the polling frequency

**Trade-offs:**

*   Small, controlled delay compared to pure events (typically 30-60 seconds)
*   You must manage scheduling and checkpoints

**Example Use Cases:**

*   Synchronizing inventory levels to ERP systems
*   Bulk product updates to search indexes
*   Periodic synchronization of customer data to marketing platforms I

### [Combo! Best of two worlds? ✌️](#combo-best-of-two-worlds-️)

**The best integrations often combine both patterns:**

*   **Events** for critical, low-volume, latency-sensitive changes
    
    *   Order status changes
    *   Payment confirmations
    *   Critical inventory thresholds
*   **Polling (delta queries)** for high-volume, frequently changing entities
    
    *   Inventory levels
    *   Product catalog updates
    *   Bulk price changes
*   **Scrolling** for initial loads, large backfills, and recovery
    
    *   Initial data synchronization
    *   System recovery after outages
    *   Full catalog exports

**Example Hybrid Architecture:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Events (Webhook):
      └─ Order.StatusChanged → Trigger fulfillment workflow
      └─ Payment.Completed → Send confirmation email
    
    Delta Polling (Every 60 seconds):
      └─ Inventory changes → Update ERP system in batches
      └─ Product changes → Refresh search index
    
    Scrolling (On-demand):
      └─ Initial catalog load → Populate new system
      └─ Recovery → Re-sync after system downtime

### [Example Use Case: Exporting Product Data for External Systems](#example-use-case-exporting-product-data-for-external-systems)

A common scenario is exporting product data from Omnium to external systems such as **search engines**, **marketplaces**, or **product feeds** A common scenario is exporting product data from Omnium to external systems such as search engines, marketplaces, or product feeds for ACP, recommendation engines or marketing platforms.

In these cases, **batch-oriented polling** is usually the better approach:

*   Many external systems expect **bulk imports**, not a constant stream of granular updates.
*   Polling with **delta queries** (poll&scroll) lets you collect all recent changes at a fixed interval and send them in **controlled batches** downstream.
*   This reduces chatter and network overhead while improving stability and predictability.

**Example (recommended):**

> Every 30 seconds, call  
> `POST /api/products/scroll`  
> with `modifiedFrom` set to your last successful timestamp.  
> Add filters to only retrieve the subset you actually need (for example by channel, assortment, market, or product type).  
> Use `includeFields` / `excludeFields` to limit the payload to only the fields required by the external system. This reduces transfer size and makes the integration faster and more reliable.  
> Persist the **timestamp of the last successful update** so that if your application fails or restarts, you can resume from the same point by setting `modifiedFrom` accordingly.

This approach keeps downstream systems up-to-date without overwhelming them with excessive updates

#### [Union Delta Queries](#union-delta-queries)

The `isUnionDeltaQuery: true` parameter changes the query logic from **AND** to **OR** for specific time-based parameters:

*   **Without `isUnionDeltaQuery`** (default): All conditions must match (AND logic)
*   **With `isUnionDeltaQuery: true`**: Any of these time-based conditions can match (OR logic):
    *   `modifiedFrom` / `modifiedTo`
    *   `startPublishFrom` / `startPublishTo`
    *   `stopPublishFrom` / `stopPublishTo`
    *   `priceActivatedFrom` / `priceActivatedTo`
    *   `priceDeactivatedFrom` / `priceDeactivatedTo`

This means you can combine multiple time-based filters to catch products that match ANY of the criteria.

##### [Basic Union Delta Query](#basic-union-delta-query)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "marketId": "NOR",
      "isUnionDeltaQuery": true,
      "modifiedFrom": "2025-01-08T10:00:00Z",
      "priceActivatedFrom": "2025-01-08T10:00:00Z",
      "priceActivatedTo": "2025-01-08T10:05:00Z",
      "priceDeactivatedFrom": "2025-01-08T10:00:00Z",
      "priceDeactivatedTo": "2025-01-08T10:05:00Z"
    }

This returns products that:

*   Were recently modified, OR
*   Had prices activate since the last timestamp, OR
*   Had prices deactivate since the last timestamp
*   The "To-values" here is the current time

#### [Predictive Delta Queries](#predictive-delta-queries)

Beyond basic union queries, you can use predictive delta queries to detect upcoming activations or expirations before they happen. This makes it possible to retrieve both current changes and time-based updates in a single query. This is useful for proactive updates, cache warming, and early alerts.

##### [Comprehensive Predictive Query](#comprehensive-predictive-query)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

     {
       "marketId": "NOR",
       "isUnionDeltaQuery": true,
       "modifiedFrom": "2025-01-08T10:15:00Z",
       "startPublishFrom": "2025-01-08T10:15:00Z",
       "startPublishTo": "2025-01-08T10:20:00Z",
       "stopPublishFrom": "2025-01-08T10:15:00Z",
       "stopPublishTo": "2025-01-08T10:20:00Z",
       "priceActivatedFrom": "2025-01-08T10:15:00Z",
       "priceActivatedTo": "2025-01-08T10:20:00Z",
       "priceDeactivatedFrom": "2025-01-08T10:15:00Z",
       "priceDeactivatedTo": "2025-01-08T10:20:00Z"
      }

This returns products that:

*   Were modified since 9:00 AM, OR
*   Will start publishing in the next 5 minutes, OR
*   Will stop publishing in the next 5 minutes, OR
*   Will have prices activate in the next 5 minutes, OR
*   Will have prices deactivate in the next 5 minutes

This approach provides predictive and reactive change detection within a single, unified query. Neat!

**Example: Scheduled predictive delta query (runs every 5 minutes)**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    // Job runs at 10:15 UTC
    {
      "modifiedFrom": "2025-01-08T10:10:00Z",   // lastRunTime
      "startPublishFrom": "2025-01-08T10:15:00Z", // now
      "startPublishTo": "2025-01-08T10:20:00Z"    // now + lookaheadWindow (5m)
    }

At the next run (10:20 UTC), the values move forward by the same interval:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    // Job runs at 10:20 UTC
    {
      "modifiedFrom": "2025-01-08T10:15:00Z",   // lastRunTime (previous now)
      "startPublishFrom": "2025-01-08T10:20:00Z", // now
      "startPublishTo": "2025-01-08T10:25:00Z"    // now + lookaheadWindow (5m)
    }

**Pattern summary**

Each run:

*   Moves the window forward by the schedule interval
*   Uses the previous `now` as the new `modifiedFrom`
*   Keeps `lookaheadWindow` equal to the schedule interval

This ensures continuous coverage:

*   **No gaps** → you don't miss future activations
*   **No overlap** → you don't reprocess the same time range

#### [Optimizing Product Queries with Field Selection](#optimizing-product-queries-with-field-selection)

When working with delta queries, you can dramatically improve performance by requesting only the fields you actually need using `includedFields`:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "marketId": "NOR",
      "modifiedFrom": "2025-01-08T06:00:00Z",
      "includedFields": {
        "specificFields": [
          "id",
          "skuId",
          "name",
          "brand",
          "mainImageUrl",
          "variants.skuId",
          "variants.inventory.quantity",
          "variants.inventory.warehouseId"
        ]
      }
    }

**Performance Benefits**

Using `includedFields` with delta queries provides:

*   **Faster Response Times**: Huge potential reduction in response size
*   **Reduced Bandwidth**: Critical for high-volume delta processing
*   **Targeted Data**: Get exactly what you need for your use case


## [Best Practices Summary](#best-practices-summary)

*   Use **events** for time-critical, low-volume changes
*   Use **polling (delta queries)** for high-volume, frequently changing entities
*   Use **scrolling** for initial loads and large backfills
*   Use **includedFields** to maximize performance for product scrolling or searches
*   Consider implementing a **hybrid approach** for optimal performance

* * *


## [Next Steps](#next-steps)

Now that you understand data export patterns:

*   Explore the [Events documentation](/docs/Integrations/events) for event subscription details
*   Check out the [Data In](/docs/Integrations/data-in) for import strategies

[

Previous

Data In

](/docs/Integrations/data-in)[

Next

Events

](/docs/Integrations/events)

---


## Delta Queries

[Integrations](/docs/Integrations)

# Delta Queries

Learn how to use delta queries in Omnium to efficiently retrieve only the data that has changed since a specific timestamp, helping you keep your system synchronized with updates in Omnium.


## [API Endpoints](#api-endpoints)

The following API endpoints in Omnium support delta queries. Use these to retrieve the changed data:

*   **[Search Orders](https://api.omnium.no/documentation/index.html#/Orders/OrdersSearchOrders)**
*   **[Search Products](https://api.omnium.no/documentation/index.html#/Products/ProductsSearchProducts)**
*   **[Search Private Customers](https://api.omnium.no/documentation/index.html#/Customers%20%7C%20B2C/PrivateCustomersSearch)**
*   **[Search Business Customers](https://api.omnium.no/documentation/index.html#/Customers%20%7C%20B2B/BusinessCustomersSearch)**

* * *


## [📖 Recommended Reading](#-recommended-reading)

**Read the [Data Out guide](/docs/Integrations/data-out) first** - especially the **[Example Use Case: Exporting Product Data for External Systems](/docs/Integrations/data-out#example-use-case-exporting-product-data-for-external-systems)** section for real-world patterns and best practices.

* * *


## [Performing Delta Queries](#performing-delta-queries)

### [1\. Prepare Your Request](#1-prepare-your-request)

When making a request to the delta query endpoint, include a `timestamp` parameter indicating the point in time from which you want to retrieve changes. This could be the timestamp of the last successful synchronization.

### [2\. Process the Response](#2-process-the-response)

The response from Omnium will contain data that has changed since the specified timestamp. Depending on your requirements, you can:

*   Add new records.
*   Update existing records.
*   Take other actions necessary to reflect changes in Omnium.

### [Example Workflow](#example-workflow)

1.  **Send a Request:** Include the `timestamp` parameter in your API request.
2.  **Extract Data:** Process the response to extract the relevant information.
3.  **Update Your System:** Apply changes, such as adding or updating records.

* * *
