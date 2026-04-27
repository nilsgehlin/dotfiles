# Tutorials — Step-by-Step Guides — Tutorials

## Tutorials

[Getting Started](/docs/GettingStartedWithAPI)

# Tutorials

Step-by-step guides that walk you through complete integration scenarios with Omnium — from first API call to production-ready workflows.

These tutorials are hands-on, end-to-end walkthroughs. Each one starts from scratch and builds up a working integration, covering the API calls, data models, and best practices you need along the way.

If you're looking for reference documentation instead, check the domain-specific sections (Orders, Products, Inventory, etc.) in the sidebar.

* * *


## [Available tutorials](#available-tutorials)

[

Omnichannel E-commerce

Set up markets, stores, products, inventory, cart checkout, and click & collect from scratch



](/docs/GettingStartedWithAPI/Tutorials/omnichannel-ecom)[

ERP Integration

Subscribe to order events, sync inventory, report shipments, and process returns



](/docs/GettingStartedWithAPI/Tutorials/erp-integration)

[

Previous

Quick Guides

](/docs/GettingStartedWithAPI/user-guides)[

Next

Omnichannel e-com

](/docs/GettingStartedWithAPI/Tutorials/omnichannel-ecom)

---


## ERP Integration

[Getting Started](/docs/GettingStartedWithAPI)[Tutorials](/docs/GettingStartedWithAPI/Tutorials)

# ERP Integration

This guide walks through a complete ERP integration with Omnium — subscribing to order events, fetching orders, confirming receipt, syncing inventory, reporting shipments, and processing returns.


## [Prerequisites](#prerequisites)

Before starting, ensure you have:

*   **Access to Omnium**: You need an active Omnium account with appropriate permissions
*   **API Credentials**: You'll need a `ClientId` and `ClientSecret` for API authentication
*   **Required API Roles**: Your API user needs `OrderAdmin` and `InventoryAdmin` roles

If you don't have access yet, follow our [Get Access guide](/docs/GettingStartedWithAPI/introtoapi) to request access and obtain your API credentials.

* * *


## [1\. Subscribe to Order Events](#1-subscribe-to-order-events)

The recommended integration pattern combines **real-time event notifications** with **delta polling as a safety net**. Start by setting up a webhook so Omnium pushes order events to your ERP as they happen.

### [Configure a Webhook Subscription](#configure-a-webhook-subscription)

In the Omnium UI, navigate to **Configuration > Event subscriptions** and create a new subscription:

Field

Value

Description

**Name**

`ERP Order Sync`

Human-readable name

**Connector**

`Webhook`

Delivery mechanism

**Base URL**

`https://your-erp.example.com`

Your ERP's base URL

**Request URI**

`/api/webhooks/omnium-orders`

Your webhook endpoint path

**HTTP Verb**

`POST`

HTTP method

### [Add Filters](#add-filters)

Apply filters to receive only the events your ERP cares about:

Filter

Example Values

Purpose

**Class Names**

`Order`

Only order events

**Categories**

`Created`, `Updated`, `Workflow`

Event categories

**Statuses**

`New`, `Completed`, `Returned`

Only specific statuses

**Stores**

`oslo-online`

Limit to specific stores

**Markets**

`nor`

Limit to specific markets

You can also add custom HTTP headers (e.g., an API key) for authenticating incoming webhooks on your side.

### [Webhook Payload](#webhook-payload)

When an event matches your subscription filters, Omnium sends a POST request with this payload:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "timestamp": "2026-02-17T07:23:07.638Z",
        "operationId": 111102,
        "message": "Workflow completed",
        "className": "Order",
        "subClassName": "Online",
        "objectId": "ORD-12345",
        "objectNumber": "ORD-12345",
        "category": "Workflow",
        "market": "nor",
        "storeId": "oslo-online",
        "status": "New",
        "previousStatus": "",
        "isError": false,
        "origin": "POST /api/Cart/CreateOrderFromCart/"
    }

**Important**: The webhook payload contains **event metadata only** — not the full order. Use the `objectId` to fetch the complete order from the API (see step 2).

### [Alternative Delivery Mechanisms](#alternative-delivery-mechanisms)

Besides webhooks, Omnium supports:

*   **Azure Service Bus** — queue/topic-based messaging
*   **Azure Storage Queue** — simple queue-based delivery
*   **Apache Kafka** — high-throughput streaming
*   **RabbitMQ** — AMQP-based messaging

These are configured the same way via Event subscriptions, just with a different **Connector** value and connection details.

* * *


## [2\. Fetch New Orders](#2-fetch-new-orders)

When your webhook receives an event, call back to Omnium to get the full order data.

### [Get a Single Order](#get-a-single-order)

**Fetch the order referenced in the webhook event:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Orders/ORD-12345

**Response (simplified):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "id": "ORD-12345",
        "orderNumber": "ORD-12345",
        "status": "New",
        "orderType": "Online",
        "storeId": "oslo-online",
        "marketId": "nor",
        "customerId": "customer123",
        "customerName": "John Doe",
        "customerEmail": "john@example.com",
        "billingCurrency": "NOK",
        "billingAddress": {
            "firstName": "John",
            "lastName": "Doe",
            "street": "Storgata 1",
            "postalCode": "0182",
            "city": "Oslo",
            "country": "Norway"
        },
        "orderForm": {
            "lineItems": [
                {
                    "lineItemId": "1",
                    "skuId": "yellow-tshirt-medium",
                    "productId": "yellow-tshirt",
                    "name": "Yellow T-Shirt - Medium",
                    "quantity": 2,
                    "unitPrice": 299.00,
                    "total": 598.00
                }
            ],
            "shipments": [
                {
                    "shipmentId": "1",
                    "shippingMethodName": "Standard_Shipping",
                    "warehouseCode": "oslo-warehouse",
                    "shippingTotal": 79.00
                }
            ],
            "payments": [
                {
                    "paymentId": "1",
                    "paymentMethodName": "Klarna",
                    "amount": 677.00
                }
            ],
            "subTotal": 598.00,
            "shippingTotal": 79.00,
            "taxTotal": 169.25,
            "total": 677.00
        },
        "externalIds": [],
        "created": "2026-02-17T07:23:07Z",
        "modified": "2026-02-17T07:23:07Z"
    }

### [Delta Polling (Safety Net)](#delta-polling-safety-net)

Even with webhooks, use periodic delta polling to catch any missed events. Poll every few minutes using `ModifiedFrom`:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/Search
     
    {
        "ModifiedFrom": "2026-02-17T08:00:00Z",
        "SelectedStatuses": ["New"],
        "SortOrder": "ModifiedAscending",
        "Take": 100,
        "Page": 0,
        "DisableFacets": true
    }

**Response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "result": [ /* array of OmniumOrder objects */ ],
        "totalHits": 3
    }

**Key parameters:**

*   **ModifiedFrom** — inclusive (greater than or equal to) — returns orders modified since this timestamp
*   **SelectedStatuses** — filter by status (e.g., only `New` orders not yet processed by ERP)
*   **DisableFacets** — set to `true` for better performance when you don't need facet counts
*   **SortOrder** — use `ModifiedAscending` for chronological processing, or `DocumentID` for best performance
*   **Take** — max 100 per page. Use `Page` to paginate (max `Take * Page` = 10,000)

### [Scroll API (Large Volumes)](#scroll-api-large-volumes)

If you need to process more than 10,000 orders (e.g., initial backfill), use the Scroll API:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/Scroll
     
    {
        "ModifiedFrom": "2026-01-01T00:00:00Z",
        "SelectedStatuses": ["New", "InProgress"]
    }

The response includes a `scrollId`. Fetch subsequent batches of 1,000 orders:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Orders/Scroll/{scrollId}

Continue until the `result` array is empty.

* * *


## [3\. Confirm Order Receipt](#3-confirm-order-receipt)

Once your ERP has received and validated an order, confirm receipt by updating its status. This is the primary ERP integration endpoint.

### [Update Order Status](#update-order-status)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/ORD-12345/UpdateStatus
     
    {
        "status": "InProgress"
    }

**Response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "orderActionExecutionResults": [
            {
                "actionStatus": "Success",
                "actionType": "Notification",
                "cancelWorkflow": false
            }
        ],
        "isAborted": false,
        "order": { /* full updated OmniumOrder */ }
    }

This endpoint triggers the configured **workflow** for the target status — which may include sending customer notifications, capturing payments, reducing inventory, or exporting data. The response tells you what workflow actions ran and whether they succeeded.

### [Store Your ERP Reference](#store-your-erp-reference)

Use PatchOrder to store the ERP order number on the Omnium order for cross-referencing:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/Orders/ORD-12345/PatchOrder
     
    {
        "externalIds": [
            { "providerName": "ERP", "id": "SO-2026-001" }
        ]
    }

**Response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "totalCount": 1,
        "updatedCount": 1,
        "unchangedCount": 0,
        "notFoundCount": 0,
        "errorCount": 0,
        "isModified": true
    }

**Note**: PatchOrder does **not** run workflows — it directly updates the specified fields. Use it for storing references, adding custom properties, or making lightweight metadata updates without side effects.

You can later search for orders by their ERP external ID:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/Search
     
    {
        "ExternalIds": ["SO-2026-001"],
        "DisableFacets": true
    }

* * *


## [4\. Sync Inventory from ERP](#4-sync-inventory-from-erp)

Most ERP integrations use the ERP (or WMS) as the source of truth for stock levels. The recommended approach is to push inventory updates to Omnium using `UpdateMany`.

### [Full Inventory Sync](#full-inventory-sync)

**Push current stock levels (e.g., nightly full sync):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Inventory/UpdateMany
     
    [
        {
            "sku": "yellow-tshirt-small",
            "warehouseCode": "oslo-warehouse",
            "inventory": 25,
            "cost": 120.00,
            "costCurrency": "NOK",
            "location": "A3-B2"
        },
        {
            "sku": "yellow-tshirt-medium",
            "warehouseCode": "oslo-warehouse",
            "inventory": 30,
            "cost": 120.00,
            "costCurrency": "NOK"
        },
        {
            "sku": "yellow-tshirt-large",
            "warehouseCode": "oslo-warehouse",
            "inventory": 40
        }
    ]

**Key behaviors of UpdateMany:**

*   **Upsert** — creates new inventory items or updates existing ones
*   **Preserves reserved inventory** — by default, `reservedInventory` managed by Omnium's order workflows is not overwritten (controlled by `isReservedInventoryOverwritten=false`, the default)
*   **Change detection** — items that haven't actually changed are skipped, making full syncs efficient
*   **Field preservation** — fields like `cost`, `location`, and `minQuantity` are preserved from the existing item if you send them as `0` or empty
*   **Transaction logging** — every actual change creates an inventory transaction record for auditing

### [Incremental Delta Updates](#incremental-delta-updates)

For real-time stock changes (e.g., goods receipt, manual adjustments), use delta transactions instead of absolute values:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Inventory/ProcessInventoryTransactions
     
    [
        {
            "skuId": "yellow-tshirt-medium",
            "warehouseCode": "oslo-warehouse",
            "inventoryChange": 50,
            "reason": "Purchase order PO-2026-015 received"
        },
        {
            "skuId": "yellow-tshirt-small",
            "warehouseCode": "oslo-warehouse",
            "inventoryChange": -3,
            "reason": "Manual stock correction",
            "orderId": "ORD-12345"
        }
    ]

**Key fields:**

*   **inventoryChange** — the delta: positive for additions, negative for removals
*   **reason** — logged in the transaction history for auditing
*   **orderId** — optional link to a related order
*   **adjustReservedInventory** — set to `true` if the delta should also adjust reserved inventory (rarely needed for ERP sync)

### [Query Current Stock Levels](#query-current-stock-levels)

**Read inventory back from Omnium (e.g., to reconcile with ERP):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Inventory/Search
     
    {
        "warehouseCodes": ["oslo-warehouse"],
        "productCodes": ["yellow-tshirt-small", "yellow-tshirt-medium", "yellow-tshirt-large"]
    }

**Delta query (only items changed since last sync):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Inventory/Search
     
    {
        "lastModified": "2026-02-17T08:00:00Z"
    }

For large result sets, the response includes a `scrollId`. Use `GET /api/Inventory/Scroll/{scrollId}` to fetch subsequent pages (2,000 items per batch).

* * *


## [5\. Report Shipment and Fulfillment](#5-report-shipment-and-fulfillment)

When your ERP or WMS confirms that goods have been shipped, update Omnium with tracking information.

### [Simple Fulfillment (Single Shipment)](#simple-fulfillment-single-shipment)

**Mark the full order as shipped with tracking:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/ORD-12345/UpdateStatus
     
    {
        "status": "Completed",
        "shipmentInfo": {
            "trackingNumber": "BRING-789456123",
            "trackingUrl": "https://tracking.bring.com/tracking/BRING-789456123"
        }
    }

This triggers the configured workflow for the `Completed` status, which typically includes:

*   Capturing the payment (if not already captured)
*   Sending a shipping confirmation notification to the customer
*   Reducing reserved inventory
*   Exporting the order to downstream systems

### [Update with Detailed Shipment Info](#update-with-detailed-shipment-info)

**Provide full shipment details from your WMS:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/ORD-12345/UpdateStatus
     
    {
        "status": "Completed",
        "shipmentInfo": {
            "shipmentId": "1",
            "shipmentMethodName": "Bring",
            "trackingNumber": "BRING-789456123",
            "trackingUrl": "https://tracking.bring.com/tracking/BRING-789456123",
            "warehouseCode": "oslo-warehouse",
            "externalIds": [
                { "providerName": "WMS", "id": "WMS-SHIP-001" }
            ],
            "packages": [
                {
                    "weightInKg": 1.2,
                    "goodsDescription": "Clothing",
                    "dimensions": {
                        "lengthInCm": 30,
                        "widthInCm": 20,
                        "heightInCm": 10
                    },
                    "shipmentTracking": {
                        "trackingNumber": "BRING-789456123",
                        "trackingUrl": "https://tracking.bring.com/tracking/BRING-789456123"
                    }
                }
            ]
        }
    }

**Note**: The `shipmentId` references an existing shipment on the order. If the order has a single shipment (most common), `shipmentId: "1"` targets it. The `warehouseCode` on the shipment identifies where the order was shipped from, while the `storeId` on the order level identifies where it was sold.

* * *


## [6\. Handle Partial Shipments](#6-handle-partial-shipments)

When only some items can be shipped (e.g., backorder or multi-warehouse fulfillment), use the `OrderLinesUpdate` endpoint.

### [Ship Some Items, Back-order the Rest](#ship-some-items-back-order-the-rest)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/ORD-12345/OrderLinesUpdate
     
    {
        "status": "Completed",
        "lineItemUpdates": [
            {
                "lineItemId": "1",
                "deliveredQuantity": 2
            },
            {
                "lineItemId": "2",
                "deliveredQuantity": 0
            }
        ],
        "shipmentInfo": {
            "shipmentId": "1",
            "trackingNumber": "BRING-789456123",
            "trackingUrl": "https://tracking.bring.com/tracking/BRING-789456123",
            "warehouseCode": "oslo-warehouse"
        }
    }

This delivers line item 1 on shipment 1 and leaves line item 2 undelivered. The order status automatically changes to `PartiallyShipped`.

### [Ship Remaining Items on a New Shipment](#ship-remaining-items-on-a-new-shipment)

When the back-ordered items are ready, create a new shipment:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/ORD-12345/OrderLinesUpdate
     
    {
        "status": "Completed",
        "lineItemUpdates": [
            {
                "lineItemId": "2",
                "deliveredQuantity": 1
            }
        ],
        "shipmentInfo": {
            "shipmentId": "2",
            "shippingMethodName": "PostNord",
            "trackingNumber": "PN-456789",
            "trackingUrl": "https://tracking.postnord.com/PN-456789",
            "warehouseCode": "oslo-downtown"
        }
    }

**Note**: When `shipmentId` references a shipment that doesn't exist yet, Omnium **creates a new shipment** automatically. When all shipments on an order reach `Completed`, the order-level status automatically updates to `Completed`.

**Key fields in `lineItemUpdates`:**

*   **lineItemId** — the order line identifier (required)
*   **deliveredQuantity** — quantity actually shipped
*   **canceledQuantity** — quantity cancelled (won't be fulfilled)
*   **cost** — cost price per unit (for profit tracking)

* * *


## [7\. Process Returns](#7-process-returns)

When a customer returns goods and the return is registered in the ERP, update Omnium accordingly.

### [Create a Return](#create-a-return)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Returns/ORD-12345/Return
     
    {
        "returns": [
            {
                "lineItemId": "1",
                "returnQuantity": 1,
                "returnReason": "Wrong size",
                "isStockUpdated": true
            }
        ],
        "storeId": "oslo-warehouse",
        "creditPayment": true,
        "creditShipment": false,
        "comment": "Customer requested size exchange",
        "rmaNumber": "RMA-2026-001"
    }

**Key fields:**

*   **returns** — list of line items being returned with quantities and reasons
*   **isStockUpdated** — `true` to add the returned items back to inventory
*   **creditPayment** — `true` to trigger a refund to the original payment method (runs the `CreditReturn` workflow step)
*   **creditShipment** — `true` to also refund the shipping cost
*   **rmaNumber** — your ERP's return merchandise authorization number (auto-generated if omitted)
*   **storeId** — the warehouse receiving the returned goods

### [Update Return Status](#update-return-status)

Returns have their own status workflow (configurable per tenant). Advance the return through its lifecycle:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Returns/ORD-12345/UpdateStatus
     
    {
        "status": "Completed",
        "returnId": "return-form-id"
    }

The `returnId` is returned in the response when you create the return. The return workflow may trigger actions like refund processing, inventory updates, customer notifications, and export to your ERP.

### [Search Returns (Delta Query)](#search-returns-delta-query)

Poll for recently modified returns:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Returns/SearchReturnOrders
     
    {
        "modifiedFrom": "2026-02-17T08:00:00Z",
        "take": 20,
        "page": 1
    }

* * *


## [8\. Common Status Flows](#8-common-status-flows)

Here are the most common order status transitions an ERP integration handles:

### [Standard Online Order](#standard-online-order)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New → InProgress → Completed

1.  Webhook notifies ERP of new order
2.  ERP confirms receipt → `UpdateStatus` to `InProgress`
3.  ERP ships goods → `UpdateStatus` to `Completed` (with tracking info)

### [Order with Warehouse Processing](#order-with-warehouse-processing)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New → InProgress → InProgressWarehouse → ReadyForShipment → Completed

### [Partial Shipment](#partial-shipment)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New → InProgress → PartiallyShipped → Completed

1.  ERP ships some items → `OrderLinesUpdate` (order becomes `PartiallyShipped`)
2.  ERP ships remaining → `OrderLinesUpdate` (order becomes `Completed`)

### [Click & Collect](#click--collect)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New → InProgress → ReadyForPickup → PickedUp → Completed

### [Cancellation](#cancellation)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New or InProgress → OrderCanceled

### [Return](#return)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Completed → PartiallyReturned or Returned

* * *


## [9\. Best Practices](#9-best-practices)

### [Performance](#performance)

*   **Use `DisableFacets: true`** on all search requests — facet computation is expensive and not needed for ERP sync
*   **Use `SortOrder: "DocumentID"`** if you don't need a specific sort — it's the fastest option
*   **Batch operations** are limited to 4 concurrent requests — process them sequentially
*   **Use the Scroll API** for bulk retrieval (> 10,000 orders) instead of deep pagination

### [Reliability](#reliability)

*   **Combine webhooks with delta polling** — webhooks for real-time, polling as a safety net to catch missed events
*   **Store the last successful `ModifiedFrom` timestamp** — use it as the starting point for the next polling cycle
*   **Use `ModifiedFrom` (POST Search)** over `changedSince` (GET) — the POST variant uses inclusive matching (`>=`) which is safer for delta sync
*   **Implement exponential backoff** for 429 (rate limit) responses

### [Data Integrity](#data-integrity)

*   **Never overwrite `reservedInventory`** — keep the default `isReservedInventoryOverwritten=false` on UpdateMany
*   **Use `PatchOrder` for metadata** — storing ERP references via PatchOrder avoids triggering workflows
*   **Use `ExternalIds`** to link Omnium entities to your ERP records — enables bidirectional lookup

### [Monitoring](#monitoring)

*   **Subscribe to error events** — create a separate webhook subscription filtered to `isError: true` for alerting
*   **Check the event log** — in the UI under **Configuration > Advanced > Events**, or via `POST /api/EventLog/Search`
*   **Monitor subscription health** — every subscription execution creates an event with operation ID `290100` and a status of `Success` or `Failed`

* * *


## [Next Steps](#next-steps)

You've now set up a complete ERP integration with Omnium. Your integration covers:

✅ Real-time order notifications via webhooks ✅ Order fetching with delta queries and scroll ✅ Order status confirmation and workflow execution ✅ Inventory synchronization (full and incremental) ✅ Shipment reporting with tracking information ✅ Partial shipment handling ✅ Return and refund processing ✅ Cross-system reference tracking with ExternalIds

For more details on specific topics:

*   [Events & Webhooks](/docs/Integrations/events) — full event reference and subscription configuration
*   [Data Out](/docs/Integrations/data-out) — export patterns and delta query best practices
*   [Data In](/docs/Integrations/data-in) — batch import patterns
*   [Orders](/docs/Order) — complete order model and workflow documentation
*   [Inventory](/docs/Inventory) — inventory management deep dive
*   [Returns](/docs/Order/Returns) — return workflow configuration

[

Previous

Omnichannel e-com

](/docs/GettingStartedWithAPI/Tutorials/omnichannel-ecom)[

Next

Training

](/docs/training)

---


## Omnichannel e-com

[Getting Started](/docs/GettingStartedWithAPI)[Tutorials](/docs/GettingStartedWithAPI/Tutorials)

# Omnichannel e-com

This guide shows how to set up a basic e-commerce store in Omnium, including markets, products, inventory, and a simple checkout flow.


## [Prerequisites](#prerequisites)

Before starting, ensure you have:

*   **Access to Omnium**: You need an active Omnium account with appropriate permissions
*   **API Credentials**: You'll need a `ClientId` and `ClientSecret` for API authentication

If you don't have access yet, follow our [Get Access guide](/docs/GettingStartedWithAPI/introtoapi) to request access and obtain your API credentials.

* * *
