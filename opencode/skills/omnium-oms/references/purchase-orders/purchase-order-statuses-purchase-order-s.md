# Purchase Orders — Suppliers, Deliveries & Goods Reception — [Purchase order statuses](#purchase-order-statuses)

## [Purchase order statuses](#purchase-order-statuses)

Purchase orders follow a configurable status workflow, similar to order types. Each status defines a step in the purchase order lifecycle, and can be configured with workflow steps that execute automatically when a purchase order enters that status.

Omnium includes a set of built-in status names that are used by default: **New**, **InProgress**, **Completed**, **OnHold**, **OrderCanceled**, and **Deleted**. You can override these or define entirely custom statuses to match your procurement workflow.

### [Purchase order status model](#purchase-order-status-model)

Property

Type

Description

**Name** \*

string

Unique status name identifier

**Order** \*

int

Sort order index defining the workflow sequence

DisplayName

string

User-facing display name in the UI

TranslateKey

string

Translation key for localized display

IsMainFilter

bool

Show this status as a main filter option in the purchase order list

IsCanceledStatus

bool

Mark orders with this status as canceled

IsConfirmedStatus

bool

Mark orders with this status as confirmed with the supplier

IsCompleted

bool

Mark orders with this status as completed

IsReadOnly

bool

Prevent editing of purchase orders in this status

WorkflowSteps

[List<WorkflowStep>](#workflow-steps)

Workflow steps to execute when entering this status

EnabledForTags

List<string>

Only show this status for purchase orders with these tags. If empty, the status is available for all purchase orders.

DisabledForTags

List<string>

Hide this status for purchase orders with these tags. Overrides EnabledForTags.

### [Workflow steps](#workflow-steps)

Workflow steps on purchase order statuses follow the same model as order workflow steps.

Property

Type

Description

**Name** \*

string

Workflow step name

**Connector** \*

string

Connector to use for the workflow step

Active

bool

Whether the step should run

RunAfterOrderIsSaved

bool

Run the step after the purchase order is saved

ContinueOnError

bool

Continue the workflow if this step fails

TranslateKey

string

Translation key for the workflow step name

IsInvisible

bool

Hide the result from the UI

### [Available workflow actions](#available-workflow-actions)

These are the built-in workflow actions available for purchase order statuses:

Action

Group

Description

Notification

Notifications

Send notifications when a purchase order enters a status

ReleaseSuggestions

Inventory

Release reorder suggestions associated with the purchase order

ExportPurchaseOrder

Export

Export the purchase order to all configured purchase order export connectors

SetExpectedDeliveryDate

Enrich

Set the expected delivery date based on supplier settings or default values

RecalculateAtpValues

Enrich

Recalculate Available-to-Promise (ATP) values for inventories included in the purchase order

ExportDeliveries

Export

Export deliveries connected to the purchase order to configured delivery export connectors

ValidateOnErrors

Validation

Check the purchase order for errors. If errors are found, the workflow stops and does not proceed further.

CreateOrderFromPurchaseOrder

Modify

Create an order from the purchase order, using the supplier as the store. Only works if the supplier is configured as a store in Omnium. Requires `OrderType` and `MarketId` properties.

AddSupplierTagsToOrders

Export

Copy all tags from the supplier to the purchase order

EnrichLineItemsWithComponents

Enrich

Automatically enrich line items with product components by matching SKUs

### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "PurchaseOrderStatuses": [
        {
          "Name": "New",
          "DisplayName": "New",
          "Order": 1,
          "IsMainFilter": true,
          "WorkflowSteps": [
            {
              "Name": "ValidateOnErrors",
              "Active": true
            }
          ]
        },
        {
          "Name": "Confirmed",
          "DisplayName": "Confirmed",
          "Order": 2,
          "IsMainFilter": true,
          "IsConfirmedStatus": true,
          "WorkflowSteps": [
            {
              "Name": "ExportPurchaseOrder",
              "Active": true
            },
            {
              "Name": "SetExpectedDeliveryDate",
              "Active": true
            }
          ]
        },
        {
          "Name": "InProgress",
          "DisplayName": "In Progress",
          "Order": 3,
          "IsMainFilter": true,
          "WorkflowSteps": []
        },
        {
          "Name": "Completed",
          "DisplayName": "Completed",
          "Order": 4,
          "IsMainFilter": true,
          "IsCompleted": true,
          "IsReadOnly": true,
          "WorkflowSteps": [
            {
              "Name": "RecalculateAtpValues",
              "Active": true
            }
          ]
        },
        {
          "Name": "OrderCanceled",
          "DisplayName": "Canceled",
          "Order": 5,
          "IsCanceledStatus": true,
          "IsReadOnly": true,
          "WorkflowSteps": []
        }
      ]
    }

* * *


## [General settings](#general-settings)

These settings control calculations used for reorder planning and inventory cost analysis.

Property

Type

Default

Description

StorageCostPercent

decimal

0

Storage cost as a percentage of inventory value. Used in inventory carrying cost calculations for reorder planning.

AverageDailyUsageDays

int

0

Number of historical days to use when calculating average daily usage (ADU) for products. A higher value provides a more stable average but is less responsive to recent demand changes.

LeadTimeSafetyMarginDays

int

0

Additional safety margin in days added to the supplier lead time. Accounts for variability in delivery times to reduce stockout risk.

DefaultAverageLeadTimeDays

int

0

Default lead time in days for suppliers that do not have a specific lead time configured. Used when calculating reorder points and expected delivery dates.

### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "StorageCostPercent": 12.5,
      "AverageDailyUsageDays": 90,
      "LeadTimeSafetyMarginDays": 3,
      "DefaultAverageLeadTimeDays": 14
    }

* * *


## [Reorder suggestions](#reorder-suggestions)

These settings control how reorder suggestions are generated and filtered.

Property

Type

Default

Description

ReorderSuggestionsMinQuantityRoundUp

bool

false

When enabled, suggested reorder quantities are rounded up to the nearest minimum order quantity defined on the product or supplier.

NonPurchasableAssortmentCodes

List<string>

null

Assortment codes that should be excluded from reorder suggestions. Products with any of these assortment codes will not appear in purchase order suggestions. Assortment codes are defined in product settings.

### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "ReorderSuggestionsMinQuantityRoundUp": true,
      "NonPurchasableAssortmentCodes": [
        "DISCONTINUED",
        "SEASONAL-ONLY",
        "CONSIGNMENT"
      ]
    }

* * *


## [Internal transfers](#internal-transfers)

These settings control automatic creation of internal transfer orders for pickup warehouses (e.g., stores that receive stock from a central warehouse).

Property

Type

Default

Description

CreateInternalTransfersForPickUpWarehouses

bool

false

When enabled, internal transfer orders are automatically created for warehouses configured as pickup locations. This is used when a central warehouse distributes stock to store locations.

CreateInternalTransfersForPickUpWarehousesStatus

string

null

The status to assign to automatically created internal transfer orders. If not set, transfers are created with the default initial status.

### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "CreateInternalTransfersForPickUpWarehouses": true,
      "CreateInternalTransfersForPickUpWarehousesStatus": "New"
    }

* * *


## [Delivery settings](#delivery-settings)

These settings control how deliveries (goods reception) are handled on purchase orders.

Property

Type

Default

Description

GoodsReceptionCompletedStatus

string

null

The purchase order status to set when goods reception is completed (all expected items have been received). If not configured, the status is not automatically changed on completion.

SetEstimatedTimeOfArrivalFromPurchaseOrder

bool

false

When enabled, the `RequestedDeliveryDate` from the purchase order is used as the `EstimatedTimeOfArrival` on deliveries created from the purchase order. Useful for propagating delivery expectations to downstream logistics.

IncludePackagesInPurchaseOrders

bool

false

When enabled, package information (bundled products and their components) is included in purchase order data. Enable this if your purchase orders need to track product packaging details.

OrderTypesWithAutomaticLineSplitting

List<string>

null

List of order types where order lines are automatically split when customer reservations exceed the available quantity on a delivery. For example, if a delivery has 10 units but 15 are reserved across orders, the order line with excess reservations is split so the available units can be allocated.

### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "GoodsReceptionCompletedStatus": "Completed",
      "SetEstimatedTimeOfArrivalFromPurchaseOrder": true,
      "IncludePackagesInPurchaseOrders": false,
      "OrderTypesWithAutomaticLineSplitting": ["Online", "ClickAndCollect"]
    }

* * *


## [ETA-based order status updates](#eta-based-order-status-updates)

When a purchase order's estimated delivery date changes, Omnium can automatically update the status of sales orders that are waiting for stock from that purchase order. This is useful for keeping customers informed about delivery timeline changes.

Property

Type

Default

Description

UpdateOrderStatusWhenEstimatedDeliveryDateChanged

bool

false

Enable automatic order status updates when the estimated delivery date changes on a purchase order. When enabled, the two properties below become active.

UpdateToStatus

string

null

The order status to set on affected sales orders when the estimated delivery date changes. Only applies when `UpdateOrderStatusWhenEstimatedDeliveryDateChanged` is enabled.

DisabledForStatuses

List<string>

null

Order statuses that should be excluded from automatic status updates. Orders in any of these statuses will not be updated even if the estimated delivery date changes. Only applies when `UpdateOrderStatusWhenEstimatedDeliveryDateChanged` is enabled.

The `UpdateToStatus` and `DisabledForStatuses` settings reference order statuses from your order type configuration, not purchase order statuses.

### [Sample](#sample-5)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "UpdateOrderStatusWhenEstimatedDeliveryDateChanged": true,
      "UpdateToStatus": "AwaitingDeliveryUpdate",
      "DisabledForStatuses": ["Completed", "Shipped", "Canceled"]
    }

* * *


## [Display and printing](#display-and-printing)

Property

Type

Default

Description

ShowCustomerReservationsOnPurchaseOrderPrint

bool

false

When enabled, customer reservations linked to purchase order line items are included on the printed purchase order document. Useful for suppliers who need to know which customers are waiting for specific items.

### [Sample](#sample-6)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "ShowCustomerReservationsOnPurchaseOrderPrint": true
    }

* * *


## [Properties and tags](#properties-and-tags)

### [Default properties](#default-properties)

Default properties are automatically available on purchase orders. They provide structured fields for capturing additional data specific to your procurement process.

Property

Type

Description

Key

string

Property identifier

Value

string

Default value

ValueType

string

Data type (String, Number, Boolean, Date)

KeyGroup

string

Grouping category for organizing properties in the UI

ValueOptions

List<string>

Available options for dropdown selection

IsCustomValueOptionAllowed

bool

Allow free-text values in addition to predefined options

IsMultiSelectEnabled

bool

Allow selecting multiple values from options

ReadOnly

bool

Make the property read-only after creation

### [Highlighted properties](#highlighted-properties)

Configure which property keys should be displayed prominently on the purchase order detail page. Properties listed here are shown in a highlighted section for quick reference.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "HighlightedProperties": [
        "Priority",
        "BuyerName",
        "PaymentTerms"
      ]
    }

### [Tags](#tags)

Tags allow you to categorize and filter purchase orders. Tags can also be used to control which statuses are available for a purchase order (via `EnabledForTags` and `DisabledForTags` on statuses).

Property

Type

Description

Name

string

Tag identifier

TranslationKey

string

Translation key for the tag label in the UI

### [Sample](#sample-7)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "DefaultProperties": [
        {
          "Key": "Priority",
          "Value": "Normal",
          "ValueType": "String",
          "ValueOptions": ["Low", "Normal", "High", "Urgent"],
          "IsCustomValueOptionAllowed": false
        },
        {
          "Key": "PaymentTerms",
          "Value": "",
          "ValueType": "String",
          "ReadOnly": false
        }
      ],
      "HighlightedProperties": ["Priority", "PaymentTerms"],
      "TagSettings": [
        { "Name": "Domestic", "TranslationKey": "Tag_Domestic" },
        { "Name": "Import", "TranslationKey": "Tag_Import" },
        { "Name": "Urgent", "TranslationKey": "Tag_Urgent" },
        { "Name": "Dropship", "TranslationKey": "Tag_Dropship" }
      ]
    }

* * *


## [Complete configuration example](#complete-configuration-example)

Below is a comprehensive example showing all purchase order settings configured together:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "PurchaseOrderSettings": {
        "PurchaseOrderStatuses": [
          {
            "Name": "New",
            "DisplayName": "New",
            "Order": 1,
            "IsMainFilter": true,
            "WorkflowSteps": [
              { "Name": "ValidateOnErrors", "Active": true }
            ]
          },
          {
            "Name": "Confirmed",
            "DisplayName": "Confirmed",
            "Order": 2,
            "IsMainFilter": true,
            "IsConfirmedStatus": true,
            "WorkflowSteps": [
              { "Name": "ExportPurchaseOrder", "Active": true },
              { "Name": "SetExpectedDeliveryDate", "Active": true }
            ]
          },
          {
            "Name": "InProgress",
            "DisplayName": "In Progress",
            "Order": 3,
            "IsMainFilter": true,
            "WorkflowSteps": []
          },
          {
            "Name": "Completed",
            "DisplayName": "Completed",
            "Order": 4,
            "IsMainFilter": true,
            "IsCompleted": true,
            "IsReadOnly": true,
            "WorkflowSteps": [
              { "Name": "RecalculateAtpValues", "Active": true }
            ]
          },
          {
            "Name": "OrderCanceled",
            "DisplayName": "Canceled",
            "Order": 5,
            "IsCanceledStatus": true,
            "IsReadOnly": true,
            "WorkflowSteps": []
          }
        ],
     
        "StorageCostPercent": 12.5,
        "AverageDailyUsageDays": 90,
        "LeadTimeSafetyMarginDays": 3,
        "DefaultAverageLeadTimeDays": 14,
     
        "ReorderSuggestionsMinQuantityRoundUp": true,
        "NonPurchasableAssortmentCodes": ["DISCONTINUED", "CONSIGNMENT"],
     
        "CreateInternalTransfersForPickUpWarehouses": true,
        "CreateInternalTransfersForPickUpWarehousesStatus": "New",
     
        "GoodsReceptionCompletedStatus": "Completed",
        "SetEstimatedTimeOfArrivalFromPurchaseOrder": true,
        "IncludePackagesInPurchaseOrders": false,
        "OrderTypesWithAutomaticLineSplitting": ["Online", "ClickAndCollect"],
     
        "UpdateOrderStatusWhenEstimatedDeliveryDateChanged": true,
        "UpdateToStatus": "AwaitingDeliveryUpdate",
        "DisabledForStatuses": ["Completed", "Shipped"],
     
        "ShowCustomerReservationsOnPurchaseOrderPrint": true,
     
        "DefaultProperties": [
          {
            "Key": "Priority",
            "Value": "Normal",
            "ValueType": "String",
            "ValueOptions": ["Low", "Normal", "High", "Urgent"]
          }
        ],
        "HighlightedProperties": ["Priority"],
     
        "TagSettings": [
          { "Name": "Domestic", "TranslationKey": "Tag_Domestic" },
          { "Name": "Import", "TranslationKey": "Tag_Import" },
          { "Name": "Urgent", "TranslationKey": "Tag_Urgent" }
        ]
      }
    }

[

Previous

API Reference

](/docs/PurchaseOrders/purchase-order-api)[

Next

Reservations

](/docs/PurchaseOrders/purchase-order-reservations)

---


## Deliveries

[Purchase Orders](/docs/PurchaseOrders)

# Deliveries

Learn about deliveries in Omnium — how they track inbound goods from suppliers and internal transfers, manage goods reception, and connect purchase orders to warehouse inventory.


## [What Is a Delivery?](#what-is-a-delivery)

A **Delivery** in Omnium represents an inbound shipment of goods to a warehouse. Deliveries are created from [purchase order](/docs/PurchaseOrders/purchase-order-api) line items and serve as the bridge between ordering goods from a supplier and receiving them into inventory.

Every delivery is associated with a receiving warehouse and contains one or more purchase order line items. The delivery tracks the shipment from creation through goods reception, updating inventory and releasing order reservations as goods arrive.

> When a supplier ships goods against a purchase order, a **delivery** is created to track the expected arrival. When the goods physically arrive at the warehouse, **goods reception** is performed against the delivery, which increases warehouse inventory and releases any customer order reservations that were waiting for those goods.

* * *


## [Delivery Types](#delivery-types)

Omnium supports two types of deliveries:

### [Purchase Order Deliveries](#purchase-order-deliveries)

Standard deliveries from external suppliers. A purchase order delivery is created when a supplier ships goods to your warehouse. The delivery tracks the shipment and is used to record goods reception when the shipment arrives.

### [Internal Transfers](#internal-transfers)

Deliveries that represent stock movements between your own warehouses. When goods are transferred from one warehouse location to another, an internal transfer delivery is created. The source warehouse is identified by the `SupplierWarehouseCode` property.

For internal transfers, inventory is reduced from the source warehouse immediately when the delivery is created. The receiving warehouse's inventory is increased when goods reception is performed.

The delivery type is determined automatically based on the purchase order. If the purchase order has a `SupplierWarehouseCode`, the delivery is created as an **InternalTransfer**. Otherwise, it is created as a **PurchaseOrder** delivery.

* * *


## [Delivery Lifecycle](#delivery-lifecycle)

### [Statuses](#statuses)

A delivery progresses through the following statuses:

Status

Description

`New`

The delivery has been created but no goods have been received yet

`Confirmed`

The supplier has confirmed the shipment

`InProgress`

Some goods have been received, but the delivery is not yet complete

`Completed`

All goods have been received or accounted for (delivered + canceled = ordered quantity)

`OnHold`

The delivery has been temporarily suspended

`Cancelled`

The delivery has been cancelled

### [Automatic Status Calculation](#automatic-status-calculation)

By default, Omnium automatically calculates the delivery status based on the quantities on the associated purchase order lines:

*   When **all** line items have their full quantity delivered or canceled, the status is set to **Completed**.
*   When **some** line items have delivered quantities but others are still pending, the status is set to **InProgress**.

This automatic calculation can be disabled per delivery by setting `IsAutoDeliveryStatusDisabled` to `true`, which allows the status to be managed manually via the API.

* * *


## [Creating Deliveries](#creating-deliveries)

Deliveries are created from purchase order line items. When creating a delivery, you specify which purchase order lines (and quantities) to include.

### [Full and Partial Quantities](#full-and-partial-quantities)

*   If the full quantity of a purchase order line is included in the delivery, the line is linked directly to the delivery.
*   If only a partial quantity is included, Omnium automatically **splits** the purchase order line. The original line is assigned to the delivery with the specified quantity, and a new line is created for the remaining quantity. Any existing order reservations are split proportionally between the two lines.

### [Adding to Existing Deliveries](#adding-to-existing-deliveries)

Line items from the same or different purchase orders can be added to an existing delivery. This is useful when a supplier consolidates multiple purchase orders into a single shipment.

### [Canceling Remaining Items](#canceling-remaining-items)

When creating a delivery, you can optionally cancel any remaining undelivered line items on the purchase order. This is useful when a supplier confirms they can only fulfill a partial order and the rest should not be expected.

* * *


## [Goods Reception](#goods-reception)

Goods reception is the process of recording that goods from a delivery have physically arrived at the warehouse. This is one of the most important operations in the delivery workflow, as it triggers several downstream effects.

When goods reception is performed, for each line item received:

1.  **Inventory is increased** — The warehouse stock for the received products is updated with the delivered quantities.
2.  **Order reservations are released** — Customer orders that were reserved against the purchase order line are transitioned to warehouse stock reservations. The `IsAwaitingPurchaseOrder` flag is cleared, allowing the order to proceed to fulfillment. See [Reservations](/docs/PurchaseOrders/purchase-order-reservations) for details.
3.  **Delivery status is updated** — The delivery status is recalculated based on the new delivered quantities.
4.  **ATP is recalculated** — Available-to-Promise values are updated for the affected products.
5.  **Cost prices are optionally updated** — If requested, the product's cost price can be updated based on the received goods.

Goods reception supports idempotency when a `GoodsReceptionId` is provided on each reception line. See the [Goods Reception](/docs/PurchaseOrders/Deliveries/goods-reception#idempotency) page for details on which endpoint performs the duplicate check.

For a complete guide on performing goods reception, see [Goods Reception](/docs/PurchaseOrders/Deliveries/goods-reception).

* * *


## [Deliveries and Order Fulfillment](#deliveries-and-order-fulfillment)

Deliveries play a key role in the order fulfillment chain when inventory is not immediately available:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    1. Customer places order → no warehouse stock available
    2. ATP system allocates order line to a purchase order line
       (order line marked as IsAwaitingPurchaseOrder = true)
    
    3. Delivery is created from the purchase order
    4. Goods reception is performed on the delivery
    
    5. Inventory is added to the warehouse
    6. Order reservation transfers from purchase order to warehouse stock
       (IsAwaitingPurchaseOrder cleared)
    
    7. Order is ready for fulfillment and shipment

When a delivery includes line items that have customer order reservations, the goods reception process automatically handles the transition. No manual intervention is required to release the reservations — this happens as part of the goods reception workflow.

* * *


## [Estimated Time of Arrival](#estimated-time-of-arrival)

Each delivery can have an **Estimated Time of Arrival (ETA)**, representing when the goods are expected to arrive at the warehouse.

The ETA serves two purposes:

*   **Operational planning** — Warehouse teams can plan ahead for incoming deliveries.
*   **ATP calculations** — The ETA is used by the Available-to-Promise system to determine when expected inventory will become available. This affects customer-facing delivery estimates and order allocation decisions.

When the ETA is updated on a delivery, Omnium recalculates ATP values for the affected products.

* * *


## [Tracking and Logistics](#tracking-and-logistics)

Deliveries support tracking information from the supplier or freight carrier:

Property

Description

`DeliveryTrackingNumber`

The tracking number provided by the supplier or carrier

`DeliveryTrackingLink`

A URL for tracking the shipment

`DeliveryProvider`

The name of the shipping provider or freight carrier

`Barcode`

Package or pallet barcode for warehouse scanning. Set during delivery creation via `PackageBarcode` on the purchase order line reference

* * *


## [Notes and Comments](#notes-and-comments)

Deliveries support two types of notes:

*   **Delivery Notes** — Internal comments visible only to Omnium users. Use these for operational notes, warehouse instructions, or internal coordination.
*   **Public Delivery Notes** — Comments that may be shared with external systems or partners via integrations.

* * *


## [Tags](#tags)

Deliveries can be tagged with free-text labels for categorization and filtering. Tags are inherited from the purchase order when a delivery is created and can also be managed directly on the delivery.

Tags are useful for grouping deliveries by season, campaign, priority, or any other business-relevant criteria.

* * *


## [Delivery Model](#delivery-model)

Property

Type

Description

`Id`

`string`

Unique delivery identifier

`DeliveryStatus`

`string`

Current status (`New`, `Confirmed`, `InProgress`, `Completed`, `OnHold`, `Cancelled`)

`OrderType`

`string`

Delivery type: `PurchaseOrder` or `InternalTransfer`

`WarehouseCode`

`string`

Code of the receiving warehouse

`SupplierWarehouseCode`

`string`

Code of the source warehouse (internal transfers only)

`Suppliers`

`List<string>`

Names of suppliers associated with this delivery

`SupplierIds`

`List<string>`

IDs of suppliers associated with this delivery

`EstimatedTimeOfDeparture`

`DateTime?`

Expected departure date from the supplier

`EstimatedTimeOfArrival`

`DateTime?`

Expected arrival date at the receiving warehouse

`DeliveryTrackingNumber`

`string`

Tracking number from the supplier or carrier

`DeliveryTrackingLink`

`string`

URL for shipment tracking

`DeliveryProvider`

`string`

Shipping provider or freight carrier name

`InvoiceNumber`

`string`

Supplier invoice number

`InvoiceDate`

`DateTime?`

Supplier invoice date

`IsCounted`

`bool`

Whether quantities have been physically verified

`IsAutoDeliveryStatusDisabled`

`bool`

If `true`, automatic status calculation is disabled

`DeliveryNotes`

`List<Comment>`

Internal comments

`PublicDeliveryNotes`

`List<Comment>`

Public/external comments

`Tags`

`List<string>`

Free-text labels for grouping and filtering

`Properties`

`List<PropertyItem>`

Custom key-value properties for extensibility

`Created`

`DateTime?`

Timestamp when the delivery was created

`Modified`

`DateTime?`

Timestamp when the delivery was last modified

[

Previous

Integration Guide

](/docs/PurchaseOrders/Suppliers/supplier-erp-integration)[

Next

Configuration

](/docs/PurchaseOrders/Deliveries/delivery-config)

---
