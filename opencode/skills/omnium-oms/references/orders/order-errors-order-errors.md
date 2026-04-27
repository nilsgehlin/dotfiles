# Orders — Lifecycle, Workflows & Concepts — [Order Errors](#order-errors)

## [Order Errors](#order-errors)

When order processing fails, errors are added to the order's error list. These errors provide structured information about what went wrong and are visible directly on the order.

### [Error Model](#error-model)

The `errors` array on an order contains `EntityError` entries:

Property

Type

Description

`key`

string

Error identifier/code

`message`

string

Human-readable error message

`details`

string

Additional error details

`referenceId`

string

Reference to a related entity (e.g., shipment ID, payment ID)

`severity`

string

Error severity level

`occured`

DateTime

When the error occurred

`status`

string

Error status (e.g., `Active`, `Solved`)

`comment`

string

Optional comment on the error (e.g., resolution notes)

### [How Errors Work](#how-errors-work)

*   Orders with errors are **flagged visually** in the order list UI, making them easy to spot
*   Errors can be **reviewed** on the order detail page
*   Errors can be **resolved** by marking them as `Solved` with an optional comment
*   Workflow steps with `ContinueOnError: true` will add an error but allow the workflow to continue

**Example error on an order:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "errors": [
        {
          "key": "PaymentCaptureFailed",
          "message": "Payment capture failed for transaction TX-9876",
          "details": "Gateway returned: insufficient funds",
          "referenceId": "PAY-001",
          "severity": "Error",
          "occured": "2025-01-15T14:20:00Z",
          "status": "Active",
          "comment": null
        }
      ]
    }

[

Previous

Order Comments

](/docs/Order/order-logging/order-comments)[

Next

Verbose Logging

](/docs/Order/order-logging/verbose-logging)

---


## Order Status Log

[Order](/docs/Order)[Order Logging](/docs/Order/order-logging)

# Order Status Log

Track shipment status transitions with precise timestamps and duration between changes for fulfillment performance analysis.


## [Order Status Log](#order-status-log)

The Order Status Log tracks shipment status transitions with precise timestamps and the duration between each change. Unlike the [Event Log](./event-log) (which logs all kinds of events), the Order Status Log focuses specifically on status progression and is stored directly on each Shipment object.

### [Configuration](#configuration)

Enable the Order Status Log in your tenant settings:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "OrderSettings": {
      "UseOrderStatusLog": true
    }

Each status is logged only once per shipment. If an order re-enters a previous status, it will not create a duplicate entry.

### [Data Model](#data-model)

The `orderStatusLog` array on each shipment contains entries with:

Property

Type

Description

`status`

string

The order status that was entered

`timestamp`

DateTime

UTC timestamp when the status change occurred

`durationSincePreviousMs`

long?

Milliseconds since the previous status change (`null` for the first entry)

### [API Access](#api-access)

The status log is available on shipments via the public API:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "shipments": [
        {
          "shipmentId": "SHIP-001",
          "orderStatusLog": [
            {
              "status": "New",
              "timestamp": "2025-01-15T10:30:00Z",
              "durationSincePreviousMs": null
            },
            {
              "status": "Processing",
              "timestamp": "2025-01-15T10:45:00Z",
              "durationSincePreviousMs": 900000
            },
            {
              "status": "Shipped",
              "timestamp": "2025-01-15T14:20:00Z",
              "durationSincePreviousMs": 12900000
            }
          ]
        }
      ]
    }

### [Reports](#reports)

When Order Status Log is enabled, two reporting features become available under **Reports** > **Order Reports** in the Omnium UI.

#### [Average Handling Time by Status (Chart)](#average-handling-time-by-status-chart)

A horizontal bar chart that shows the average time orders spend in each status, measured in hours. The chart aggregates `durationSincePreviousMs` across all shipments matching your filters and displays one bar per status, sorted by longest duration first.

The chart updates dynamically when you change the report filters (date range, order statuses, order types, stores).

#### [Order Progress Report (Export)](#order-progress-report-export)

A downloadable report that shows the status duration timeline for every shipment. Each row represents a shipment, and each configured order status gets its own column showing the duration in seconds since the previous status transition.

The report columns are:

Column

Description

OrderNumber

Order number

OrderId

Order ID

Store

Store name

ShipmentId

Shipment ID

ShipmentStatus

Current shipment status

ShippingMethod

Shipping method name

Created

Order created date

Completed

Order completed date

_<Status columns>_

One column per order status, showing duration in seconds since the previous status

The Order Progress Report is available in the export dropdown on the Order Reports page. It only appears when `UseOrderStatusLog` is enabled.

### [Use Cases](#use-cases)

*   **Measuring fulfillment performance**: Calculate how long orders spend in each status (e.g., time from "New" to "Picked", or "Packed" to "Shipped")
*   **Identifying bottlenecks**: Compare processing durations across warehouses or order types to find slow steps
*   **SLA compliance tracking**: Monitor whether orders are being processed within agreed timeframes

[

Previous

Event Log

](/docs/Order/order-logging/event-log)[

Next

Workflow Execution Results

](/docs/Order/order-logging/workflow-execution-results)

---


## Verbose Logging

[Order](/docs/Order)[Order Logging](/docs/Order/order-logging)

# Verbose Logging

Optional detailed logging that creates individual Event Log entries for every workflow step execution, useful for troubleshooting.


## [Verbose Logging](#verbose-logging)

Verbose Logging is an optional feature that creates additional [Event Log](./event-log) entries for every individual workflow step execution. This is useful for troubleshooting workflow issues but comes with a performance cost.

### [What It Adds](#what-it-adds)

**Without verbose logging** (default), the Event Log records:

*   Workflow **started** event
*   Workflow **completed** event (with aggregated results as attachments)

**With verbose logging enabled**, you also get:

*   Individual **step execution** events (category: `WorkflowStep`) for each workflow step
*   **Skipped steps** with reasons why they were skipped
*   Detailed timing for each step

This makes it much easier to diagnose which specific step failed or why a step was skipped, without needing to parse the aggregated workflow results.

### [Configuration](#configuration)

Enable verbose logging in your tenant settings:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "OrderSettings": {
      "UseVerboseLogging": true
    }

Verbose logging significantly increases the number of Event Log entries created per order. This can impact Elasticsearch storage and query performance. Use it for troubleshooting, but consider disabling it in production once the issue is resolved.

[

Previous

Order Errors

](/docs/Order/order-logging/order-errors)[

Next

Click and Collect

](/docs/Order/order-click-and-collect)

---


## Workflow Execution Results

[Order](/docs/Order)[Order Logging](/docs/Order/order-logging)

# Workflow Execution Results

Understand the results produced by each workflow step when processing orders, including status, errors, and duration.


## [Workflow Execution Results](#workflow-execution-results)

Each time a workflow runs on an order, every workflow step produces an `OrderActionExecutionResult`. These results are attached to the [Event Log](./event-log) entry for the workflow completion event, giving you detailed insight into what each step did.

### [Result Model](#result-model)

Property

Type

Description

`actionStatus`

string

Outcome of the step (e.g., success, error)

`actionType`

string

Type of action performed

`errorReason`

string

Error details if the step failed

`message`

string

Human-readable result message

`messageHeading`

string

Message heading/title

`duration`

TimeSpan

How long the step took to execute

`cancelWorkflow`

bool

Whether this step canceled the remaining workflow

`triggerNewStatus`

string

If set, the order transitioned to this new status

`orderStatusChanged`

bool

Whether the order status changed as a result

`isInvisible`

bool

Whether the result is hidden in the UI

### [How to Access](#how-to-access)

Workflow execution results are available via:

*   **Event Log attachments**: Look for Event Log entries with category `Workflow`. The results are stored as attachments with type `workflowJson`.
*   **Order detail page in the UI**: After a workflow runs, the execution results are displayed on the order detail page showing the outcome of each step.

[

Previous

Order Status Log

](/docs/Order/order-logging/order-status-log)[

Next

Order Comments

](/docs/Order/order-logging/order-comments)

---


## Orders

# Orders

Order management in Omnium — lifecycle, workflows, returns, click & collect, and API reference.

Orders are the core of Omnium. An order can originate from any sales channel — a webshop, POS, phone order, or B2B portal — and flow through configurable workflows that handle payment, inventory, fulfillment, and notifications automatically.

Each order follows a lifecycle defined by its **order type**, moving through statuses like New, InProgress, Ship, and Completed. At each status transition, **workflow steps** execute the business logic you've configured.

* * *


## [In this section](#in-this-section)

[

API Reference

Import, update, search, and manage orders via the API



](/docs/Order/api-reference)[

Configuration

Order types, statuses, workflow configuration, and settings



](/docs/Order/order-config)[

Order Lifecycle

How orders flow from creation to completion, with statuses and transitions



](/docs/Order/order-lifecycle)[

Click & Collect (BOPIS)

Buy online, pick up in store — setup, workflows, and integration



](/docs/Order/order-click-and-collect)[

Returns

Return API, configuration, and return workflow steps



](/docs/Order/Returns)[

Workflow Steps Reference

All available workflow steps — allocation, payment, inventory, shipments, and more



](/docs/Order/workflow-steps)[

Workflows Overview

How workflows are structured and how order types connect to them



](/docs/Order/order-workflows)[

FAQ

Common questions about order handling in Omnium



](/docs/Order/order-faq)

[

Previous

Stores, Markets & Warehouses

](/docs/Stores/stores-markets-warehouses)[

Next

Order Guide

](/docs/Order/order-api)