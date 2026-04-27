# Purchase Orders — Suppliers, Deliveries & Goods Reception — [Updating purchase orders](#updating-purchase-orders)

## [Updating purchase orders](#updating-purchase-orders)

Omnium provides three update strategies depending on your needs:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌─────────────────────────────────────────────────────────────────┐
    │                     Update Strategies                           │
    ├─────────────────────┬───────────────────┬───────────────────────┤
    │       PUT           │      PATCH        │  UpdateStatus (POST)  │
    │                     │                   │                       │
    │ Full replacement    │ Partial update    │ Change status and     │
    │ of the PO           │ of specific       │ run workflow steps    │
    │                     │ fields only       │                       │
    │ Use when you have   │ Use when you need │ Use when advancing    │
    │ the complete PO     │ to change a few   │ the PO through its    │
    │ model               │ properties        │ lifecycle             │
    └─────────────────────┴───────────────────┴───────────────────────┘

### [Full update (PUT)](#full-update-put)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/PurchaseOrders?updateAtpValues={true|false}

Replaces the entire purchase order. You must send the complete model. Uses a resource lock (30 seconds) to prevent concurrent updates.

Set `updateAtpValues=true` if you want Omnium to recalculate Available-to-Promise values for affected inventories.

Returns `409 Conflict` if another update is in progress.

### [Partial update (PATCH)](#partial-update-patch)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/PurchaseOrders/{purchaseOrderId}?updateAtpValues={true|false}

Updates only the fields you provide. Unset fields remain unchanged.

**Example: Update supplier reference and requested delivery date**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "referenceNumber": "SUPP-REF-2026-001",
      "requestedDeliveryDate": "2026-04-01T00:00:00Z"
    }

**Example: Add a new line item to an existing PO**

By default, `KeepExistingOrderLines` is `true`, meaning new lines are merged with existing ones:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "purchaseOrderForm": {
        "lineItems": [
          {
            "code": "WIDGET-003",
            "displayName": "Economy Widget",
            "quantity": 1000,
            "placedPrice": 7.50,
            "placedPriceExclTax": 6.00,
            "taxRate": 25,
            "currency": "NOK"
          }
        ]
      }
    }

**Example: Replace all line items**

Set `KeepExistingOrderLines` to `false` to replace the entire line item list:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "keepExistingOrderLines": false,
      "purchaseOrderForm": {
        "lineItems": [
          {
            "code": "WIDGET-001",
            "quantity": 750,
            "placedPrice": 11.00,
            "placedPriceExclTax": 8.80,
            "taxRate": 25,
            "currency": "NOK"
          }
        ]
      }
    }

#### [Patch merge behavior](#patch-merge-behavior)

Property

Default

Behavior

KeepExistingListItems

true

`true`: merge new properties with existing. `false`: replace the entire properties list.

KeepExistingOrderLines

true

`true`: merge new lines (matched by LineItemId) with existing. `false`: replace all lines.

### [Update and run workflow](#update-and-run-workflow)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/UpdateAndRunWorkflow?updateAtpValues={true|false}

Updates the purchase order **and** executes the workflow steps configured for the current status. Use this when you need to both modify data and trigger actions (e.g., export to ERP, send notifications).

**Request body:** Full `OmniumPurchaseOrder`

**Response:** `OmniumPurchaseOrderWorkflowExecutionResult` (see [Workflow execution results](#workflow-execution-results))

### [Update status](#update-status)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/{purchaseOrderId}/UpdateStatus

Changes the purchase order status and runs the workflow steps configured for the new status. This is the primary endpoint for advancing a PO through its lifecycle.

Uses a resource lock (300 seconds) to ensure workflow steps complete without interference.

**Example: Confirm a purchase order**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "status": "Confirmed",
      "expectedDeliveryDate": "2026-03-20T00:00:00Z"
    }

**Response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "isAborted": false,
      "purchaseOrder": { /* updated OmniumPurchaseOrder */ },
      "purchaseOrderActionExecutionResults": [
        {
          "actionType": "ExportPurchaseOrder",
          "actionStatus": "Success",
          "translateKey": "ExportPurchaseOrder",
          "cancelWorkflow": false,
          "isInvisible": false
        },
        {
          "actionType": "SetExpectedDeliveryDate",
          "actionStatus": "Success",
          "translateKey": "SetExpectedDeliveryDate",
          "cancelWorkflow": false,
          "isInvisible": false
        }
      ]
    }

### [Bulk update](#bulk-update)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/PurchaseOrders/UpdateMany

Updates multiple purchase orders at once. Send a list of complete `OmniumPurchaseOrder` objects.

* * *


## [Workflow execution results](#workflow-execution-results)

When you use the status update or workflow endpoints, the response includes detailed results for each workflow step that was executed.

### [Result model](#result-model)

Property

Type

Description

IsAborted

bool

`true` if the workflow was aborted due to an error

PurchaseOrder

OmniumPurchaseOrder

The updated purchase order after workflow execution

PurchaseOrderActionExecutionResults

List

Results for each workflow step

### [Action execution result](#action-execution-result)

Property

Type

Description

ActionType

string

The workflow action that was executed

ActionStatus

string

`"Success"`, `"Warning"`, or `"Error"`

ErrorReason

string

Error description (if the step failed)

TranslateKey

string

Translation key for the result message

CancelWorkflow

bool

Whether this step caused the workflow to abort

IsInvisible

bool

Whether the result should be hidden from end users

If `IsAborted` is `true`, the purchase order status is reverted to its previous value. Check the `PurchaseOrderActionExecutionResults` to identify which step failed and why.

* * *


## [Line item operations](#line-item-operations)

### [Split a line item](#split-a-line-item)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/{purchaseOrderId}/OrderLines/Split

Splits one or more line items into separate lines. This is useful when part of an order needs to be shipped to a different warehouse, or when you need to track partial deliveries separately.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Before split (Line A: 100 units)
    ┌──────────────────────────────────────────┐
    │  WIDGET-001  │  Qty: 100                │
    └──────────────────────────────────────────┘
    
    After split (Line A: 70 units, Line B: 30 units)
    ┌──────────────────────────────────────────┐
    │  WIDGET-001  │  Qty: 70                 │
    └──────────────────────────────────────────┘
    ┌──────────────────────────────────────────┐
    │  WIDGET-001  │  Qty: 30  (new line)     │
    └──────────────────────────────────────────┘

**Example: Split 30 units from a line**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "lineItemId": "line-001",
        "quantityToSplit": 30
      }
    ]

**Example: Split with virtual warehouse allocations**

When the line has VSL allocations, you can specify which allocations to move to the new line:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "lineItemId": "line-001",
        "quantityToSplit": 30,
        "virtualWarehouseAllocationsToSplit": [
          {
            "id": "alloc-vsl-store-b",
            "quantity": 30
          }
        ],
        "newLineItemId": "line-001-split"
      }
    ]

**Response:** Returns the updated `OmniumPurchaseOrder` with the split lines.

### [Cancel a line item](#cancel-a-line-item)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/{purchaseOrderId}/OrderLines/{lineItemId}/Cancel

Cancels the remaining quantity on a line item. The `CanceledQuantity` is set to the undelivered portion. Already delivered quantities are not affected.

* * *


## [Comments](#comments-1)

Purchase orders support both internal and public (supplier-facing) comments. Both endpoints support email and SMS notifications.

### [Add an internal comment](#add-an-internal-comment)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/{purchaseOrderId}/AddInternalPurchaseOrderComment

### [Add a public comment](#add-a-public-comment)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/{purchaseOrderId}/AddPublicPurchaseOrderComment

**Example:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "body": "Please expedite shipment — customer order is urgent.",
      "subject": "Urgent delivery request"
    }

**Response:** Returns the updated list of comments.

* * *


## [Deleting a purchase order](#deleting-a-purchase-order)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    DELETE /api/PurchaseOrders/{id}

Permanently deletes the purchase order. Returns `404` if the PO does not exist.

Deletion is irreversible. Consider using the `OrderCanceled` status instead if you need to retain the PO for historical records.

* * *


## [Recalculate ATP values](#recalculate-atp-values)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/{id}

Triggers a recalculation of Available-to-Promise (ATP) values for all inventories referenced in the purchase order. Use this after external changes to inventory or delivery dates that Omnium may not be aware of.

* * *


## [Working with deliveries](#working-with-deliveries)

Deliveries represent the physical receipt of goods from a supplier. A purchase order can have one or more deliveries, and each delivery tracks which line items and quantities were received.

### [Delivery lifecycle](#delivery-lifecycle)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
    │   Created    │────►│  In Transit  │────►│   Received   │
    │              │     │              │     │              │
    │ PO confirmed │     │ Goods shipped│     │ Goods receipt │
    │ Delivery     │     │ by supplier  │     │ completed    │
    │ created      │     │              │     │              │
    └──────────────┘     └──────────────┘     └──────────────┘

### [Delivery model](#delivery-model)

Property

Type

Description

Id

string

Delivery ID

WarehouseCode

string

Receiving warehouse

SupplierWarehouseCode

string

Source warehouse (for internal transfers)

DeliveryStatus

string

Current delivery status

DeliveryTrackingNumber

string

Carrier tracking number

DeliveryTrackingLink

string

URL to carrier tracking page

DeliveryProvider

string

Shipping carrier name

InvoiceNumber

string

Supplier invoice number

InvoiceDate

DateTime?

Invoice date

EstimatedTimeOfDeparture

DateTime?

Expected departure from supplier

EstimatedTimeOfArrival

DateTime?

Expected arrival at warehouse

IsCounted

bool

Whether quantities were verified before goods reception

OrderType

string

`"PurchaseOrder"` or `"InternalTransfer"`

Suppliers

List<string>

Supplier names on this delivery

SupplierIds

List<string>

Supplier IDs on this delivery

Tags

List<string>

Delivery tags

Properties

List<OmniumPropertyItem>

Custom properties

DeliveryNotes

List<OmniumComment>

Internal comments

PublicDeliveryNotes

List<OmniumComment>

Public comments

### [Goods reception](#goods-reception)

Goods reception is the process of recording which items have arrived at the warehouse. When goods are received:

1.  **Line item quantities** are updated (`DeliveredQuantity` incremented)
2.  **Inventory levels** are increased at the receiving warehouse
3.  **Cost prices** can be updated on products (if `UpdateCostPrice` is set)
4.  **Customer order reservations** are fulfilled (orders waiting for this stock are updated)
5.  **PO status** may auto-advance to completed (if configured via `GoodsReceptionCompletedStatus`)

#### [Goods reception line model](#goods-reception-line-model)

Property

Type

Description

**LineItemId**

string

The PO line item being received

**DeliveredQuantity**

decimal

Quantity received in this reception

CostPrice

decimal

Actual cost at time of receipt (may differ from PO price)

WarehouseCode

string

Receiving warehouse (optional, defaults to PO warehouse)

UpdateProductCostPrice

bool

Update the product master with this cost price

ReceiveAsUnallocated

bool

For VSL warehouses: receive as unallocated inventory

AllocateBasedOnRules

bool

For VSL warehouses: auto-allocate using inventory rules

GoodsReceptionId

string

Idempotency key to prevent duplicate reception

Goods reception is performed via the Delivery API. Use `POST /api/Deliveries/{deliveryId}/GoodsReception` to record received quantities. The delivery ID is available on the purchase order's `DeliveryId` property.

#### [Goods reception flow](#goods-reception-flow)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

                        Goods Reception Request
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Update PO line      │
                    │ DeliveredQuantity   │
                    └──────────┬──────────┘
                               │
                  ┌────────────┼────────────┐
                  ▼            ▼            ▼
        ┌──────────────┐ ┌──────────┐ ┌──────────────┐
        │   Update     │ │  Update  │ │   Fulfill    │
        │  inventory   │ │  cost    │ │   customer   │
        │   levels     │ │  prices  │ │   orders     │
        └──────────────┘ └──────────┘ └──────────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Check if PO is      │
                    │ fully received      │
                    │ → Auto-complete     │
                    └─────────────────────┘

* * *


## [Practical scenarios](#practical-scenarios)

### [Scenario 1: Complete procurement workflow](#scenario-1-complete-procurement-workflow)

This example walks through a typical purchase order lifecycle from creation to completion.

**Step 1: Create the purchase order**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "supplierId": "supplier-nordic-parts",
      "supplierName": "Nordic Parts AB",
      "supplierEmail": "orders@nordicparts.se",
      "storeId": "warehouse-oslo",
      "billingCurrency": "NOK",
      "status": "New",
      "requestedDeliveryDate": "2026-03-01T00:00:00Z",
      "isDelivery": true,
      "tags": ["Import"],
      "purchaseOrderForm": {
        "lineItems": [
          {
            "code": "NP-BOLT-M8",
            "displayName": "M8 Stainless Bolt",
            "quantity": 5000,
            "placedPrice": 2.50,
            "placedPriceExclTax": 2.00,
            "taxRate": 25,
            "currency": "NOK",
            "supplierSkuId": "NP-10042"
          },
          {
            "code": "NP-NUT-M8",
            "displayName": "M8 Stainless Nut",
            "quantity": 5000,
            "placedPrice": 1.25,
            "placedPriceExclTax": 1.00,
            "taxRate": 25,
            "currency": "NOK",
            "supplierSkuId": "NP-10043"
          }
        ]
      }
    }

**Step 2: Confirm and send to supplier**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/PO-2026-001/UpdateStatus

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "status": "Confirmed",
      "expectedDeliveryDate": "2026-03-01T00:00:00Z"
    }

This triggers configured workflow steps (e.g., export to ERP, send notification to supplier).

**Step 3: Move to in-progress when goods are shipped**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/PO-2026-001/UpdateStatus

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "status": "InProgress"
    }

**Step 4: Receive goods** (via the delivery/goods reception API)

Goods reception updates the `DeliveredQuantity` on each line. If all lines are fully received and `GoodsReceptionCompletedStatus` is configured, the PO automatically moves to the completed status.

### [Scenario 2: Partial delivery](#scenario-2-partial-delivery)

When a supplier ships part of the order:

**First delivery — 3000 of 5000 bolts arrive:**

The goods reception records `DeliveredQuantity: 3000` on the bolt line. The PO remains in `InProgress` because not all items are received.

**Second delivery — remaining 2000 bolts and all 5000 nuts arrive:**

After this reception, all lines are fully delivered. If `GoodsReceptionCompletedStatus` is set to `"Completed"`, the PO automatically moves to that status.

### [Scenario 3: Splitting lines for multiple warehouses](#scenario-3-splitting-lines-for-multiple-warehouses)

You ordered 500 widgets on a single line, but need to distribute them across two warehouses:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/PO-2026-002/OrderLines/Split

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "lineItemId": "line-widgets",
        "quantityToSplit": 200,
        "newLineItemId": "line-widgets-store-b"
      }
    ]

Now you have two lines:

*   `line-widgets`: 300 units for the original warehouse
*   `line-widgets-store-b`: 200 units that can be assigned to a different warehouse via PATCH

* * *


## [Error handling](#error-handling)

### [HTTP status codes](#http-status-codes)

Code

Meaning

200

Success

400

Bad request — check request body for validation errors

404

Purchase order not found

409

Conflict — another update is in progress (resource locked)

500

Server error — check error details in response

### [Concurrency control](#concurrency-control)

Omnium uses two mechanisms to prevent conflicting updates:

1.  **Resource locking** — Write endpoints (PUT, PATCH, UpdateStatus) acquire a distributed lock on the purchase order. If another request is already modifying the same PO, you'll receive a `409 Conflict`. The lock is held for the duration of the operation (30 seconds for updates, 300 seconds for status changes with workflows).
    
2.  **Optimistic concurrency** — The `VersionId` field tracks the version of the purchase order. If the PO has been modified since you last retrieved it, the update will fail.
    

**Best practice:** Always retrieve the latest version before updating, and handle `409` responses by re-fetching and retrying.

### [Validation errors](#validation-errors)

Validation errors are returned in the `Errors` list on the purchase order:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "errors": [
        {
          "key": "NonPurchasableAssortmentCode",
          "message": "Product WIDGET-X has a non-purchasable assortment code",
          "severity": "Error",
          "occurred": "2026-02-11T10:30:00Z"
        }
      ]
    }

Common error keys:

Key

Description

NonPurchasableAssortmentCode

Product has an assortment code in the non-purchasable list

WrongOrMissingSupplierOnProduct

Product's supplier doesn't match the PO supplier

PackageBreak

Package quantity constraints violated

ProductDiscontinued

Product has been discontinued

* * *


## [API endpoint reference](#api-endpoint-reference)

Method

Endpoint

Description

GET

`/api/PurchaseOrders/{id}`

Get a purchase order by ID

GET

`/api/PurchaseOrders/Extended/{id}`

Get PO with store, supplier, and customer order details

POST

`/api/PurchaseOrders/Search`

Search and filter purchase orders

POST

`/api/PurchaseOrders/Scroll`

Initialize scroll for large result sets

GET

`/api/PurchaseOrders/Scroll/{scrollId}`

Continue scrolling

POST

`/api/PurchaseOrders`

Create a new purchase order

PUT

`/api/PurchaseOrders`

Full update of a purchase order

PATCH

`/api/PurchaseOrders/{id}`

Partial update of a purchase order

POST

`/api/PurchaseOrders/UpdateAndRunWorkflow`

Update and execute workflow

POST

`/api/PurchaseOrders/{id}/UpdateStatus`

Change status and run workflow

PUT

`/api/PurchaseOrders/UpdateMany`

Bulk update multiple POs

DELETE

`/api/PurchaseOrders/{id}`

Delete a purchase order

POST

`/api/PurchaseOrders/{id}`

Recalculate ATP values

POST

`/api/PurchaseOrders/{id}/OrderLines/Split`

Split line items

POST

`/api/PurchaseOrders/{id}/OrderLines/{lineId}/Cancel`

Cancel a line item

POST

`/api/PurchaseOrders/{id}/AddPublicPurchaseOrderComment`

Add public comment

POST

`/api/PurchaseOrders/{id}/AddInternalPurchaseOrderComment`

Add internal comment

[

Previous

Purchase Orders

](/docs/PurchaseOrders)[

Next

Configuration

](/docs/PurchaseOrders/purchase-order-config)

---


## Configuration

[Purchase Orders](/docs/PurchaseOrders)

# Configuration

Learn how to configure purchase order statuses, workflows, reorder settings, deliveries, and automation in Omnium. This guide covers all purchase order configuration options for administrators and developers.
