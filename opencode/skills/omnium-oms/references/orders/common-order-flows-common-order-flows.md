# Orders — Lifecycle, Workflows & Concepts — [Common Order Flows](#common-order-flows)

## [Common Order Flows](#common-order-flows)

### [Online Order — Happy Path](#online-order--happy-path)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New
     │  EnrichOrderFromProducts
     │  IncreaseReservedInventory
     │  AuthorizePayment
     │  GetOrCreateCustomerFromOrder
     │  Notification (order confirmation)
     ▼
    InProgress
     │  AllocateToWarehouse
     │  ExportOrder (to ERP)
     ▼
    PackedAndReady
     │  PrintShippingLabel
     │  CompleteShipment
     │  ValidateTrackingNumber
     ▼
    Ship
     │  CapturePayments
     │  ReduceInventory
     │  Notification (shipping confirmation)
     │  ExportOrder (shipment update to ERP)
     ▼
    Completed
        SetCompletedDate
        AnalyticsIndexing

### [Click and Collect](#click-and-collect)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New
     │  EnrichOrderFromProducts
     │  IncreaseReservedInventory
     │  AddClickAndCollectTags
     │  Notification (order received)
     ▼
    InProgress
     │  AllocateToWarehouse (store location)
     ▼
    ReadyForPickup
     │  SetReadyForPickupDate
     │  Notification (ready for pickup)
     ▼
    PickedUp
     │  CapturePayments
     │  ReduceInventory
     │  SetCompletedDate
     ▼
    Completed

If the customer doesn't collect the order within the configured deadline, the order automatically transitions to **NotCollected** and triggers cancellation workflows. See [Click and Collect](/docs/Order/order-click-and-collect) for details.

### [Split Shipment](#split-shipment)

When items ship from different warehouses, the order is split into multiple shipments:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    New → InProgress
     │
     │  TryReallocateEntireOrder
     │  SplitAllLineItems (creates Shipment A + Shipment B)
     │
     ├─ Shipment A (oslo-warehouse)
     │   Ship → InTransit → Completed
     │
     └─ Shipment B (bergen-warehouse)
         Ship → InTransit → Completed

The main order status reflects the overall state:

*   **PartiallyShipped** — Some shipments sent, others pending
*   **Completed** — All shipments delivered

### [Cancellation](#cancellation)

An order can be canceled from most statuses:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Any Status → OrderCanceled / OrderCanceledByCustomer / OrderCanceledByStore
                    │
                    │  CancelPayments (releases authorization)
                    │  TryReallocateOnCancel (frees reserved inventory)
                    │  SetCanceledDate
                    │  Notification (cancellation confirmation)
                    │  ExportOrder (cancellation to ERP)

* * *


## [Order Statuses Reference](#order-statuses-reference)

These are the built-in statuses available in Omnium. Not all statuses need to be used — you configure which ones apply to each order type.

### [Processing Statuses](#processing-statuses)

Status

Description

Typical Stage

`New`

Just created, initial processing

Creation

`Draft`

Not yet submitted

Pre-creation

`Queued`

Waiting in queue for processing

Creation

`Pending`

Awaiting external action

Validation

`Confirmed`

Order confirmed

Validation

`PaymentReview`

Payment needs manual review

Payment

`OnHold`

Temporarily paused

Any

`InProgress`

Being processed

Fulfillment

`InProgressWarehouse`

Being processed at warehouse

Fulfillment

### [Fulfillment Statuses](#fulfillment-statuses)

Status

Description

Typical Stage

`ReadyForShipment`

Ready to be dispatched

Fulfillment

`PackingInProcess`

Being picked and packed

Fulfillment

`PackedAndReady`

Packed, awaiting carrier

Fulfillment

`ReadyForPickup`

Ready for customer pickup

Fulfillment (C&C)

`PickingPostponed`

Picking delayed

Fulfillment

### [Shipping Statuses](#shipping-statuses)

Status

Description

Typical Stage

`Ship`

Shipped to customer

Shipment

`VirtualShip`

Virtually shipped (digital goods)

Shipment

`InTransit`

In transit with carrier

Shipment

`PartiallyShipped`

Some shipments sent

Shipment

`ShippedFromWarehouse`

Left the warehouse

Shipment

`SplittedShippedShipment`

Part of a split shipment

Shipment

### [Completion Statuses](#completion-statuses)

Status

Description

Typical Stage

`Completed`

Delivered to customer

Completion

`PickedUp`

Picked up by customer

Completion (C&C)

`PickedUpAndPaid`

Picked up and paid (pay-at-pickup)

Completion (C&C)

`Closed`

Order closed

Completion

### [Cancellation Statuses](#cancellation-statuses)

Status

Description

`OrderCanceled`

Canceled (general)

`OrderCanceledByCustomer`

Canceled by the customer

`OrderCanceledByStore`

Canceled by the store/staff

`Expired`

Order expired (e.g., unpaid Click and Collect)

`NotCollected`

Customer did not collect

`Deleted`

Order deleted

### [Return Statuses](#return-statuses)

Status

Description

`Returned`

Fully returned

`PartiallyReturned`

Some items returned

### [Other](#other)

Status

Description

`Faulted`

Error during processing

`Delayed`

Order delayed

`PartiallyDelivered`

Some items delivered

* * *


## [Shipment Statuses](#shipment-statuses)

Each shipment within an order has its own status, independent of the order status:

Shipment Status

Description

`AwaitingInventory`

Waiting for stock to become available

`OnHold`

Shipment paused

`Packing`

Being packed

`Released`

Released for shipping

`Shipped`

Shipped to customer

`Cancelled`

Shipment canceled

`SplittedShippedShipment`

Part of a split order

`PickingPostponed`

Picking delayed

Order statuses can be configured to automatically sync with shipment statuses. For example, when an order moves to "Ship", all its shipments can automatically update to "Shipped".

* * *


## [How Workflows Work](#how-workflows-work)

When an order transitions to a new status, the system executes all **workflow steps** configured for that status. Steps run sequentially, and each step can modify the order, call external systems, or trigger further status changes.

### [Workflow Step Properties](#workflow-step-properties)

Property

Description

**Name**

The action to execute (e.g., `CapturePayments`, `ExportOrder`)

**Active**

Enable or disable the step

**Connector**

Which integration connector to use (e.g., `"Klarna"`, `"Bring"`)

**StopOnError**

If true, stops remaining steps when this step fails

**RunAfterOrderIsSaved**

If true, runs asynchronously after the order is persisted

**IsInvisible**

If true, hides the step result from the UI

### [Scope Filters](#scope-filters)

Each step can be restricted to run only for specific contexts:

Filter

Example Use

**EnabledForMarkets** / **DisabledForMarkets**

Only capture payment for Norwegian orders

**EnabledForStores** / **DisabledForStores**

Only export to ERP for online store

**EnabledForWarehouses** / **DisabledForWarehouses**

Only print labels for central warehouse

**EnabledForShipmentOptions** / **DisabledForShipmentOptions**

Different steps for express vs standard shipping

**EnabledForTags** / **DisabledForTags**

Skip payment capture for zero-amount orders

### [Conditions](#conditions)

Steps can have conditions based on previous step results:

Condition

Step Runs When

**Success**

All previous steps succeeded

**Error**

A previous step had an error

**Warning**

A previous step had a warning

This lets you build error-handling flows: for example, send an alert notification only when the ERP export step fails.

### [Synchronous vs. Asynchronous](#synchronous-vs-asynchronous)

*   **RunAfterOrderIsSaved = false** (default): Step runs immediately during the status transition. The API call doesn't return until all synchronous steps complete.
*   **RunAfterOrderIsSaved = true**: Step runs in the background after the order is saved. Use this for operations that don't need to block the response — like ERP exports, analytics indexing, or heavy integrations.

### [Workflow Groups](#workflow-groups)

Multiple steps can be bundled into **reusable groups**. A group is referenced by a single workflow step using the `GroupId` property. All steps in the group execute sequentially, and the group's `StopOnError` flag controls whether a failure aborts the remaining group steps.

Groups are useful when the same set of steps (e.g., "ERP export + notification + analytics") is used across multiple statuses or order types.

For the full list of available workflow steps, see [Workflow Steps Reference](/docs/Order/workflow-steps).

* * *


## [Configuring Your Own Workflow](#configuring-your-own-workflow)

### [Prerequisites](#prerequisites)

Before orders can flow through the system, you need:

1.  **Markets and Stores** configured ([Markets](/docs/Markets), [Stores](/docs/Stores))
2.  **Products** with inventory ([Product](/docs/Product), [Inventory](/docs/Inventory))
3.  **Payment provider** set up ([Payments](/docs/plugins/Payments))
4.  **Shipping provider** set up ([Shipments](/docs/plugins/Shipments))

### [Setting Up an Order Type](#setting-up-an-order-type)

1.  Navigate to **Configuration > Order Types** in the Omnium GUI
2.  Create a new order type or copy an existing one as a template
3.  Define the **statuses** your orders will use (you don't need all 30+ statuses — most workflows use 4–8)
4.  For each status, add **workflow steps** that should execute
5.  Set the **Order** value on each status to define the sequence (lower numbers run first)

### [Workflow Chart](#workflow-chart)

The **Workflow Chart** in the GUI provides a visual editor:

*   Statuses appear as **columns** ordered by their `Order` value
*   Workflow steps appear as **boxes** within each status column
*   **Connections** between steps and statuses show the transition flow
*   Right-click a status to edit its properties
*   Click "Edit Workflow Steps" to add, remove, or reorder steps

### [Tips](#tips)

*   **Start simple**: Begin with 4–5 statuses (New, InProgress, Ship, Completed, Canceled) and add more as needed
*   **Test with dry-run**: Use the workflow test mode to validate your configuration before going live
*   **Use tags for branching**: Rather than creating many order types, use order tags with `EnabledForTags`/`DisabledForTags` on workflow steps to handle variations within a single order type
*   **Mind the order**: Steps run top-to-bottom. Put validation before enrichment, enrichment before allocation, and allocation before payment
*   **Use RunAfterOrderIsSaved** for non-critical steps like analytics, notifications, and ERP exports to keep the checkout fast

* * *


## [Where to Go Next](#where-to-go-next)

Question

Documentation

How do I create orders via API?

[Order API](/docs/Order/order-api)

How do I configure order types and statuses?

[Order Configuration](/docs/Order/order-config)

What workflow steps are available?

[Workflow Steps Reference](/docs/Order/workflow-steps)

How do I set up Click and Collect?

[Click and Collect](/docs/Order/order-click-and-collect)

How do returns work?

[Returns](/docs/Order/Returns/return-api)

How does the workflow system work?

[Workflow Architecture](/docs/Order/order-workflows)

Common questions?

[Order FAQ](/docs/Order/order-faq)

[

Previous

Create PO Delivery From Shipment

](/docs/Order/workflow-steps/purchase-orders/create-po-delivery-from-shipment)[

Next

Order Logging

](/docs/Order/order-logging)

---


## Order Logging

[Order](/docs/Order)

# Order Logging

Understanding the logging and audit trail features on orders in Omnium, including event log, order status log, workflow execution results, comments, and errors.


## [Overview](#overview)

Omnium provides several logging and audit trail features for orders. Each serves a different purpose and can be used independently.

Feature

What It Tracks

Storage

Always Active?

Configuration

[Event Log](./event-log)

All order operations (status changes, workflows, payments, notifications, errors)

Elasticsearch

Yes

Retention via `EventLogOrderPreservationDays`

[Order Status Log](./order-status-log)

Shipment status transitions with timestamps and duration

On the Shipment object

No

`OrderSettings.UseOrderStatusLog`

[Workflow Execution Results](./workflow-execution-results)

Result of each workflow step (success/failure, duration, errors)

Attached to Event Log entries

Yes

None

[Order Comments](./order-comments)

Manual notes and customer communication

Elasticsearch

Yes

Comment templates in `OrderSettings`

[Order Errors](./order-errors)

Processing failures on an order

On the Order object

Yes

None

[Verbose Logging](./verbose-logging)

Detailed per-step workflow execution events

Elasticsearch (Event Log)

No

`OrderSettings.UseVerboseLogging`

[

Previous

Order Lifecycle

](/docs/Order/order-lifecycle)[

Next

Event Log

](/docs/Order/order-logging/event-log)

---


## Workflow Steps

[Order](/docs/Order)

# Workflow Steps

Complete reference for all workflow steps (OrderActions) in Omnium OMS - the building blocks of order processing workflows.

Workflow steps are the core building blocks of order processing in Omnium. Each step performs a specific action on an order or shipment, such as allocating inventory, capturing payments, sending notifications, or exporting to external systems.


## [How Workflow Steps Work](#how-workflow-steps-work)

Workflow steps are configured in **Workflows** and execute automatically as orders move through different statuses. Each step:

*   Receives the current **Order**, optional **Shipment**, and **WorkflowStep configuration**
*   Performs its action and returns a result (Success, Warning, or Error)
*   Can optionally trigger a status change or cancel the workflow on failure


## [Configuration](#configuration)

Each workflow step can be configured with:

Setting

Description

**Properties**

Key-value pairs that control step behavior

**Market restrictions**

Limit execution to specific markets

**Store/Warehouse restrictions**

Limit execution to specific locations

**Shipment options**

Filter by shipping method

**Tags**

Filter by order tags

**StopOnError**

Whether to halt the workflow if this step fails


## [Step Categories](#step-categories)

Workflow steps are organized into functional categories:

Category

Description

Steps

[**Allocation**](/docs/Order/workflow-steps/allocation)

Warehouse assignment, order splitting, reallocation

26

[**Payment**](/docs/Order/workflow-steps/payment)

Payment capture, authorization, refunds, invoicing

18

[**Inventory**](/docs/Order/workflow-steps/inventory)

Stock reservation, reduction, ATP calculation

14

[**Shipments**](/docs/Order/workflow-steps/shipments)

Shipment creation, label printing, status updates

14

[**Enrichment**](/docs/Order/workflow-steps/enrichment)

Order data enrichment, tagging, barcode generation

22

[**Validation**](/docs/Order/workflow-steps/validation)

Order validation, fraud checks, payment verification

7

[**Export**](/docs/Order/workflow-steps/export)

ERP export, webhooks, external system integration

5

[**Notifications**](/docs/Order/workflow-steps/notifications)

Email and SMS notifications

1

[**Customers**](/docs/Order/workflow-steps/customers)

Customer creation, loyalty points

6

[**Workflow**](/docs/Order/workflow-steps/workflow)

Status changes, workflow control

5

[**Analytics**](/docs/Order/workflow-steps/analytics)

Analytics indexing

1

[**Subscriptions**](/docs/Order/workflow-steps/subscriptions)

Subscription order creation

2

[**Purchase Orders**](/docs/Order/workflow-steps/purchase-orders)

PO creation from orders

3


## [Identifying Workflow Steps](#identifying-workflow-steps)

Each workflow step has a unique **Key** identifier used in configuration. This key is shown in the documentation for each step and matches the value in `FactoryContants.OrderActions`.

Example: The "Allocate to Warehouse" step has key `AllocateToWarehouse`.


## [Common Patterns](#common-patterns)

### [Test Mode](#test-mode)

Most workflow steps support test mode (`context.IsTest = true`), which returns a simulated result without performing actual operations. This is useful for validating workflow configuration.

### [Market/Store Restrictions](#marketstore-restrictions)

Steps can check `workflowStep.IsAvailableForMarket(order.MarketId)` to skip execution for orders from non-configured markets.

### [Property Configuration](#property-configuration)

Steps read configuration from workflow step properties:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    var warehouseCode = workflowStep.GetProperty("warehouseCode")?.Value;
    var skipManual = workflowStep.GetPropertyAsBool("SkipForManualOrder", true);
    var storeRoles = workflowStep.GetProperties("storeRoles")?.Select(x => x.Value).ToList();


## [Result Handling](#result-handling)

Status

Meaning

**Success**

Step completed successfully

**Warning**

Step completed with a non-critical issue

**Error**

Step failed - may cancel workflow if `StopOnError` is set

When a step sets `CancelWorkflow = true`, remaining steps in the workflow are skipped.

When a step sets `TriggerNewStatus`, the order transitions to that status after the workflow completes.

* * *


## [Example: Online Order Happy Flow](#example-online-order-happy-flow)

This example shows a typical Online order type "happy flow" - where everything goes smoothly without cancellations, returns, or other complications. The "Online" order type handles standard e-commerce scenarios - orders placed online that are fulfilled either from a central warehouse or directly from a store.

The configurations shown here are examples. Your actual setup will likely be different - it might be less complex or more complicated.

### [Status: New (14 workflow steps)](#status-new-14-workflow-steps)

When an online order is created:

1.  **TryReallocateToOtherWarehouse** - Attempts to find alternative warehouse inventory if primary warehouse lacks stock
2.  **ProductPackageBreakDown** - Breaks down bundled products into individual components for fulfillment
3.  **TransferReplacementOrderPayment** _(invisible)_ - Transfers payment from original order to replacement orders (only executes for orders with `IsReplacementOrder` property set)
4.  **CheckAndUpdateCouponUsage** - Validates and marks coupons as used to prevent double redemption
5.  **UpdateOrderLineReservedInventory** - Updates inventory reservations at the line level
6.  **EnrichOrderFromProducts** - Adds product details, weights, dimensions from product catalog
7.  **TrySplitUnreservedOrderLinesToNewShipment** - Splits unreserved order lines to a separate shipment for allocation
8.  **Notification** - Sends notifications (email/SMS) based on order status
9.  **IncreaseReservedInventory** - Increases reserved inventory for order lines
10.  **EnrichShipmentLabel** - Enriches shipping label information from shipping options
11.  **SetAuthorizationExpires** _(invisible)_ - Sets payment authorization expiration timeframe
12.  **GetOrCreateCustomerFromOrder** - Creates or updates customer record
13.  **CustomerClubCalculateNewPointsOnHold** _(invisible)_ - Calculates loyalty points (held pending completion)
14.  **CalculateAtp** _(runs after save)_ - Recalculates Available-to-Promise inventory levels

### [Status: InProgress (2 workflow steps)](#status-inprogress-2-workflow-steps)

When order moves to processing:

1.  **Notification** - Sends notifications that order is being prepared
2.  **UpdateShipmentStatus** - Updates shipment status

### [Status: Ship (11 workflow steps)](#status-ship-11-workflow-steps)

When order is shipped to customer:

1.  **UpdateShipmentStatus** - Updates shipment to "Released"
2.  **CapturePayments** - Charges the customer's payment method
3.  **ReduceInventoryAndReservedInventory** - Removes items from available inventory
4.  **CompleteShipment** - Marks shipment as completed in carrier system
5.  **Notification** - Sends shipping confirmation notifications with tracking info
6.  **RemoveAuthorizationExpires** _(invisible)_ - Removes payment auth expiration
7.  **TryReleaseRemainingAuth** _(invisible)_ - Releases any unused payment authorization
8.  **SetCompletedDate** - Records order completion timestamp
9.  **CustomerClubMoveFromOnHoldToEarnedPoints** _(invisible)_ - Converts held points to earned points
10.  **CustomerClubCancelNewPointsOnHold** _(invisible)_ - Cleans up temporary point calculations
11.  **CustomerClubCalculateAndUpdateTierForMember** _(invisible, runs after save)_ - Updates customer loyalty tier

[

Previous

Configuration

](/docs/Order/order-config)[

Next

Allocation Workflow Steps

](/docs/Order/workflow-steps/allocation)

---


## Event Log

[Order](/docs/Order)[Order Logging](/docs/Order/order-logging)

# Event Log

The primary audit trail for all order operations in Omnium, covering status changes, workflows, payments, notifications, and errors.


## [Event Log](#event-log)

The Event Log is the primary audit trail for all order operations. Every significant action on an order — status changes, workflow executions, payment operations, notifications, errors, and more — produces an event log entry stored in Elasticsearch.

The Event Log is always active and cannot be disabled.

### [What Gets Logged](#what-gets-logged)

Events are categorized using the `category` field:

Category

Description

`Created`

Order was created

`Updated`

Order was modified

`Canceled`

Order was canceled

`Workflow`

Workflow started or completed

`WorkflowStep`

Individual workflow step executed (see [Verbose Logging](./verbose-logging))

`Notification`

Notification sent (email, SMS)

`Comment`

Comment added to the order

`Error`

An error occurred during processing

`Exported`

Order exported to an external system

`Imported`

Order imported from an external system

`Deleted`

Order or related entity deleted

`Information`

General informational event

`Published`

Entity published

`Added`

Item added to an entity

`BatchUpdate`

Batch update operation

`BatchAdd`

Batch add operation

Each event includes contextual information such as the user who triggered it, the order status, shipment ID, market, store, and the origin of the action (API path, scheduled task, etc.).

### [Event Log Data Model](#event-log-data-model)

Property

Type

Description

`id`

string

Unique event identifier

`timestamp`

DateTime

When the event occurred

`message`

string

Human-readable description

`category`

string

Event category (see table above)

`className`

string

Entity type (e.g., `Order`)

`subClassName`

string

Sub-type (e.g., order type name)

`objectId`

string

Order ID

`status`

string

Order status at time of event

`previousStatus`

string

Previous order status (for transitions)

`shipmentId`

string

Related shipment ID (if applicable)

`user`

string

User who triggered the event

`userId`

string

User ID

`isError`

bool

Whether this is an error event

`origin`

string

Where the event originated (API path, scheduled task, etc.)

`attachments`

list

Attached data (workflow results, export results, etc.)

`properties`

list

Additional key-value properties

`tags`

list

Event tags

### [Viewing the Event Log](#viewing-the-event-log)

The Event Log can be accessed in two ways:

*   **Per order**: Open any order in the UI, click the three-dot menu, and select **Log**
*   **Globally**: Navigate to **Configuration** > **Advanced** > **Events** to browse all events across the system

For subscribing to events via webhooks and queues, see [Events and Webhooks](/docs/Integrations/events).

### [Event Log Retention](#event-log-retention)

Event log retention is configured in **Advanced Settings**:

Setting

Type

Description

`EventLogPreservationDays`

int

Number of days to keep general event log items

`EventLogOrderPreservationDays`

int

Number of days to keep order-specific event log items

Both settings must be configured. The minimum recommended value is 7 days.

[

Previous

Order Logging

](/docs/Order/order-logging)[

Next

Order Status Log

](/docs/Order/order-logging/order-status-log)

---


## Order Comments

[Order](/docs/Order)[Order Logging](/docs/Order/order-logging)

# Order Comments

Add manual audit trail notes and customer communication to orders via the UI or API, with email and SMS notification support.


## [Order Comments](#order-comments)

Comments provide a manual audit trail and customer communication channel on orders. There are two types of comments, stored separately:

Type

Internal Name

Visibility

Use Case

**Public**

`PublicOrderNotes`

Staff + Customer

Customer-facing communication (can send email/SMS notifications)

**Internal**

`OrderNotes`

Staff only

Internal notes, handoff information, issue tracking

### [API: Adding Comments](#api-adding-comments)

**Endpoint**: `POST /api/Orders/AddComment`

**Request model** (`OmniumOrderCommentRequest`):

Property

Type

Required

Description

`orderId`

string

Yes

The order to add the comment to

`commentText`

string

Yes

The comment content

`commentType`

enum

No

`Public` (default) or `Internal`

`createdBy`

string

No

Comment author. Defaults to the API user's username

`tags`

list

No

Tags for categorizing/filtering comments

`marketId`

string

No

Market ID. Falls back to order's market

`sendEmail`

bool

No

Send email notification to customer

`emailSubject`

string

No

Email subject line

`emailTo`

string

No

Recipient email. Falls back to order's customer email

`emailCc`

string

No

CC recipients (semicolon separated)

`emailBcc`

string

No

BCC recipients (semicolon separated)

`emailFrom`

string

No

Sender email. Falls back to store's default

`senderName`

string

No

Display name for email/SMS sender. Falls back to store's default

`sendSms`

bool

No

Send SMS notification to customer

`smsPhoneNumber`

string

No

SMS recipient. Falls back to order's customer phone

**Public comment with email notification:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/AddComment
    {
      "orderId": "ORD-12345",
      "commentType": "Public",
      "commentText": "Your order has been shipped and is on its way!",
      "sendEmail": true,
      "emailSubject": "Your order has shipped",
      "emailTo": "customer@example.com",
      "emailFrom": "orders@yourcompany.com",
      "senderName": "Order Team"
    }

**Internal comment (staff only):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/AddComment
    {
      "orderId": "ORD-12345",
      "commentType": "Internal",
      "commentText": "Customer called about delivery delay. Offered 10% discount on next order.",
      "createdBy": "Support Team"
    }

### [Comment Templates](#comment-templates)

You can configure predefined comment templates to standardize communication. Templates are configured in `OrderSettings.CommentTemplates`. See [Order Configuration](/docs/Order/order-config#comment-templates) for setup details.

[

Previous

Workflow Execution Results

](/docs/Order/order-logging/workflow-execution-results)[

Next

Order Errors

](/docs/Order/order-logging/order-errors)

---


## Order Errors

[Order](/docs/Order)[Order Logging](/docs/Order/order-logging)

# Order Errors

How processing errors are tracked on orders, including the error model, severity levels, and resolution workflow.
