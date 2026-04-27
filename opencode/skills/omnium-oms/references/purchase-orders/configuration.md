# Purchase Orders — Suppliers, Deliveries & Goods Reception — Configuration

## Configuration

[Purchase Orders](/docs/PurchaseOrders)[Deliveries](/docs/PurchaseOrders/Deliveries)

# Configuration

Configure delivery settings in Omnium — delivery numbering, goods reception behavior, shipment status updates, automatic status calculation, and delivery exports.


## [Delivery settings overview](#delivery-settings-overview)

Delivery configuration is spread across two areas in Omnium:

*   **Delivery-specific settings** — Delivery numbering, status management, and export connectors (documented on this page)
*   **Purchase order settings** — Goods reception behavior, internal transfers, and ETA propagation (documented under [Purchase Order Configuration](/docs/PurchaseOrders/purchase-order-config#delivery-settings))

Most delivery-related settings are configured through **Settings > Purchase Order Settings** in the Omnium UI.

* * *


## [Delivery numbering](#delivery-numbering)

Delivery IDs are generated automatically using the **Number Options** system. The number type used for deliveries is `DeliveryNumberOptions`.

When a delivery is created without an explicit ID, Omnium looks up the number options configuration:

1.  Check the selected market for a `DeliveryNumberOptions` entry
2.  If not found, check the generic number options
3.  If no configuration exists, fall back to a sequential number starting at 1

### [Default behavior](#default-behavior)

If no `DeliveryNumberOptions` is configured, deliveries use the following defaults:

Property

Default value

Key

`DeliveryNumber`

StartSequence

`1`

Prefix

(empty)

Service

`SequentialNumberService`

### [Configuration](#configuration)

Delivery numbering is configured as a number option entry on the market or in the generic number options. See [Number Options](/docs/configuration/numberoptions) for the full configuration model.

### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "NumberType": "DeliveryNumberOptions",
      "Key": "DeliveryNumber",
      "StartSequence": 10000,
      "Prefix": "DEL-",
      "Service": "SequentialNumberService",
      "IsReadOnly": true
    }

This produces delivery IDs like `DEL-10000`, `DEL-10001`, `DEL-10002`, etc.

* * *


## [Goods reception settings](#goods-reception-settings)

These settings control what happens after goods reception is processed. They are part of `PurchaseOrderSettings` and configured through **Settings > Purchase Order Settings** in the Omnium UI.

### [Purchase order completion](#purchase-order-completion)

Property

Type

Default

Description

`GoodsReceptionCompletedStatus`

`string`

`null`

The purchase order status to set when all line items have been fully received or canceled. If not configured, the purchase order status is not changed automatically on completion. The value must match a configured [purchase order status](/docs/PurchaseOrders/purchase-order-config#purchase-order-statuses) name.

When configured, the purchase order workflow is executed for the new status, running any configured workflow steps (e.g., ATP recalculation, export).

### [Shipment order status update](#shipment-order-status-update)

After goods reception, Omnium can automatically update the shipment-level order status for customer orders that were waiting for the received goods. This is useful for triggering downstream workflows (e.g., moving orders to a "Ready to ship" status).

Property

Type

Default

Description

`GoodsReceptionShipmentOrderStatusUpdate`

`string`

`null`

The order status to set on shipments whose reserved order lines were fulfilled by the goods reception. Leave empty to disable.

`GoodsReceptionRunShipmentWorkflow`

`bool`

`true`

Whether to run the order workflow after updating the shipment order status. Only applies if `GoodsReceptionShipmentOrderStatusUpdate` is configured.

The shipment status update runs as a background task after the main goods reception processing completes. It only affects shipments that have order lines with an active purchase order reservation (`IsAwaitingPurchaseOrder`) matching the received purchase order lines.

When `GoodsReceptionRunShipmentWorkflow` is enabled (the default), setting the shipment order status also triggers the order type's workflow for that status. This allows you to chain actions — for example, automatically sending a "ready for pickup" notification when goods arrive.

When disabled, only the status value is updated without running the workflow. This is useful if you want to update the status for visibility but handle further actions separately.

### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "GoodsReceptionCompletedStatus": "Completed",
      "GoodsReceptionShipmentOrderStatusUpdate": "ReadyToShip",
      "GoodsReceptionRunShipmentWorkflow": true
    }

* * *


## [Estimated time of arrival](#estimated-time-of-arrival)

Property

Type

Default

Description

`SetEstimatedTimeOfArrivalFromPurchaseOrder`

`bool`

`false`

When enabled, the purchase order's `RequestedDeliveryDate` is automatically used as the `EstimatedTimeOfArrival` on deliveries created from that purchase order.

When the ETA is set on a delivery, it is used by the ATP system to calculate when inventory will become available. This affects customer-facing delivery estimates and order allocation decisions.

### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "SetEstimatedTimeOfArrivalFromPurchaseOrder": true
    }

* * *


## [Internal transfers for pickup warehouses](#internal-transfers-for-pickup-warehouses)

When goods are received at a central warehouse but customer orders are destined for a different pickup location, Omnium can automatically create internal transfer purchase orders to move the stock.

Property

Type

Default

Description

`CreateInternalTransfersForPickUpWarehouses`

`bool`

`false`

When enabled, goods reception automatically creates internal transfer purchase orders for orders with a pickup warehouse different from the receiving warehouse.

`CreateInternalTransfersForPickUpWarehousesStatus`

`string`

`null`

The status to assign to automatically created internal transfer purchase orders. If not set, transfers are created with the default initial status.

### [How it works](#how-it-works)

During goods reception, when this setting is enabled:

1.  Omnium identifies customer orders reserved against the received purchase order lines
2.  For orders where the shipment's `PickUpWarehouseCode` differs from the delivery warehouse, a transfer is needed
3.  For each unique target warehouse, an internal transfer purchase order is created
4.  Line items are copied with the required quantities (grouped by SKU)
5.  Customer order reservations are reallocated from the original purchase order to the new internal transfer
6.  The order line keeps `IsAwaitingPurchaseOrder = true` until the internal transfer is completed

### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "CreateInternalTransfersForPickUpWarehouses": true,
      "CreateInternalTransfersForPickUpWarehousesStatus": "New"
    }

* * *


## [Automatic order line splitting](#automatic-order-line-splitting)

Property

Type

Default

Description

`OrderTypesWithAutomaticLineSplitting`

`List<string>`

`null`

List of order types where order lines are automatically split when customer reservations exceed the available quantity on a delivery.

When a delivery is created and the available quantity for a purchase order line is less than what is reserved by customer orders, the order lines with excess reservations are automatically split. The portion matching the available quantity can proceed to fulfillment, while the remainder stays reserved against the purchase order.

This only applies to orders with an order type included in this list. If the list is empty or not configured, automatic splitting is disabled.

### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "PurchaseOrderSettings": {
      "OrderTypesWithAutomaticLineSplitting": ["Online", "ClickAndCollect"]
    }

* * *


## [Delivery status management](#delivery-status-management)

Delivery status is automatically calculated based on the quantities on the associated purchase order lines. See [Delivery Lifecycle](/docs/PurchaseOrders/Deliveries#delivery-lifecycle) for details on how statuses are determined.

### [Disabling automatic status](#disabling-automatic-status)

Automatic status calculation can be disabled per delivery by setting `IsAutoDeliveryStatusDisabled` to `true` on the delivery. This is a per-delivery setting, not a tenant-level configuration.

When disabled:

*   The delivery status is not automatically updated during goods reception
*   The status must be managed manually via the API or UI
*   The status must be a valid delivery status (`New`, `Confirmed`, `InProgress`, `Completed`, `OnHold`, `Cancelled`)

This is useful when external systems manage the delivery lifecycle and Omnium should not override the status.

* * *


## [Delivery exports](#delivery-exports)

Deliveries can be exported to external systems using delivery export connectors. When a delivery is created or updated, configured exporters are triggered automatically.

Delivery export connectors are configured as part of the connector setup in Omnium. The available connectors depend on which integration modules are enabled for your tenant.

Delivery exports can also be triggered as a purchase order workflow step using the `ExportDeliveries` action. This runs all configured delivery export connectors for deliveries associated with the purchase order. See [Purchase Order Statuses](/docs/PurchaseOrders/purchase-order-config#purchase-order-statuses) for workflow step configuration.

* * *


## [Complete configuration example](#complete-configuration-example)

Below is a comprehensive example showing all delivery-related settings configured together:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "PurchaseOrderSettings": {
        "GoodsReceptionCompletedStatus": "Completed",
        "GoodsReceptionShipmentOrderStatusUpdate": "ReadyToShip",
        "GoodsReceptionRunShipmentWorkflow": true,
        "SetEstimatedTimeOfArrivalFromPurchaseOrder": true,
        "CreateInternalTransfersForPickUpWarehouses": true,
        "CreateInternalTransfersForPickUpWarehousesStatus": "New",
        "OrderTypesWithAutomaticLineSplitting": ["Online", "ClickAndCollect"]
      }
    }

Delivery numbering is configured separately as a number option:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "NumberOptions": [
        {
          "NumberType": "DeliveryNumberOptions",
          "Key": "DeliveryNumber",
          "StartSequence": 10000,
          "Prefix": "DEL-",
          "Service": "SequentialNumberService",
          "IsReadOnly": true
        }
      ]
    }

[

Previous

Deliveries

](/docs/PurchaseOrders/Deliveries)[

Next

Goods Reception

](/docs/PurchaseOrders/Deliveries/goods-reception)

---


## Goods Reception

[Purchase Orders](/docs/PurchaseOrders)[Deliveries](/docs/PurchaseOrders/Deliveries)

# Goods Reception

How goods reception works in Omnium — receiving delivered goods into warehouse inventory, releasing order reservations, and handling partial deliveries.


## [Overview](#overview)

**Goods reception** is the process of recording that goods from a delivery have physically arrived at the warehouse. It is the final step that connects the procurement workflow to warehouse inventory and order fulfillment.

When goods reception is performed, Omnium:

1.  Increases warehouse inventory for the received products
2.  Releases customer order reservations from the purchase order to warehouse stock
3.  Updates the delivery status
4.  Recalculates Available-to-Promise (ATP) values
5.  Optionally updates product cost prices
6.  Optionally creates internal transfers for pickup warehouse orders

Goods reception is performed by submitting a list of **goods reception lines**, each identifying a purchase order line item and the quantity received.

* * *


## [Goods Reception Line](#goods-reception-line)

Each goods reception line represents a single product received at a warehouse.

Property

Type

Required

Description

`LineItemId`

`string`

Yes

The ID of the purchase order line item being received

`DeliveredQuantity`

`decimal`

Yes

The quantity received. Must be zero or greater

`WarehouseCode`

`string`

Yes

The warehouse code where goods are being received

`CostPrice`

`decimal`

No

Reserved for future use. The cost recorded on the inventory transaction is derived from the purchase order line

`UpdateProductCostPrice`

`bool`

No

If `true`, the product variant's cost price and currency are updated with the values from the purchase order line

`GoodsReceptionId`

`string`

No

Idempotency key to prevent duplicate processing. Recommended for API integrations

`ReceiveAsUnallocated`

`bool`

No

VSL only. If `true`, inventory is added to the physical warehouse without distributing to virtual stock locations

`AllocateBasedOnRules`

`bool?`

No

VSL only. Overrides the purchase order line setting. If `true`, uses inventory rules to distribute across virtual warehouses

* * *


## [API Endpoints](#api-endpoints)

Omnium provides two endpoints for performing goods reception.

### [Endpoint 1: Delivery-Scoped](#endpoint-1-delivery-scoped)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Deliveries/{deliveryId}/ProcessGoodsReception

Processes goods reception for line items belonging to a specific delivery. The system validates that the provided line items belong to the specified delivery.

This endpoint performs an **idempotency check** using `GoodsReceptionId` values before processing.

### [Endpoint 2: Generic](#endpoint-2-generic)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Deliveries/ProcessGoodsReception

Processes goods reception for line items across any delivery. The line items are resolved to their deliveries automatically based on the purchase order data.

Both endpoints accept the same request body: an array of goods reception lines.

### [Validation](#validation)

Both endpoints validate the request before processing:

*   At least one goods reception line must be provided
*   Each line must reference a valid warehouse code
*   The warehouse must be a warehouse (not a regular store)
*   Virtual warehouses cannot be targeted directly — use the physical warehouse and let Omnium handle VSL allocation internally

* * *


## [How Goods Reception Works](#how-goods-reception-works)

When goods reception is submitted, Omnium performs the following steps in sequence:

### [Step 1: Resolve Purchase Orders and Deliveries](#step-1-resolve-purchase-orders-and-deliveries)

The system looks up the purchase orders and deliveries associated with the submitted line item IDs.

### [Step 2: Update Purchase Order Line Quantities](#step-2-update-purchase-order-line-quantities)

For each goods reception line, the corresponding purchase order line is updated:

*   `DeliveredQuantity` is increased by the received quantity
*   `DeliveredDate` is set to the current time (on the first reception)

### [Step 3: Update Purchase Order Status](#step-3-update-purchase-order-status)

If **all** line items on a purchase order have been fully delivered or canceled (i.e., `DeliveredQuantity + CanceledQuantity = Quantity` for every line), and a `GoodsReceptionCompletedStatus` is [configured](/docs/PurchaseOrders/Deliveries/delivery-config), the purchase order status is automatically updated to the configured value.

### [Step 4: Update Product Cost Prices](#step-4-update-product-cost-prices)

If `UpdateProductCostPrice` is set to `true` on a goods reception line, the product variant's `Cost` and `CostCurrency` are updated with the values from the purchase order line. This is useful when the actual purchase cost should be reflected on the product.

### [Step 5: Release Order Reservations](#step-5-release-order-reservations)

Customer orders that were reserved against the received purchase order lines are updated:

*   `IsAwaitingPurchaseOrder` is cleared
*   `ExpectedDeliveryDate` is cleared
*   The order line is now reserved against warehouse stock instead of the purchase order

This means the order can proceed to fulfillment. See [Reservations](/docs/PurchaseOrders/purchase-order-reservations) for the full reservation lifecycle.

If [internal transfers for pickup warehouses](/docs/PurchaseOrders/Deliveries/delivery-config) are enabled, orders destined for a pickup warehouse keep the `IsAwaitingPurchaseOrder` flag until the internal transfer is completed.

### [Step 6: Increase Warehouse Inventory](#step-6-increase-warehouse-inventory)

Inventory is increased in the receiving warehouse for each goods reception line. The inventory update includes:

*   The SKU and warehouse code
*   The delivered quantity
*   The unit cost (calculated from the purchase order line's discounted price excluding tax)
*   The cost currency and invoice date from the delivery

If inventory conflicts occur due to concurrent updates, Omnium retries the update automatically.

### [Step 7: Create Internal Transfers (if configured)](#step-7-create-internal-transfers-if-configured)

If `CreateInternalTransfersForPickUpWarehouses` is enabled and there are orders reserved to this delivery with a pickup warehouse different from the delivery warehouse, Omnium automatically creates **internal transfer purchase orders** to move the goods to the pickup warehouses.

For each target warehouse, the system:

1.  Creates a new internal transfer purchase order from the delivery warehouse to the pickup warehouse
2.  Copies the relevant line items with the required quantities
3.  Reallocates the customer order reservations to the new internal transfer

### [Step 8: Update Delivery Status](#step-8-update-delivery-status)

The delivery status is recalculated based on the updated quantities across all its line items:

*   If all line items are fully delivered or canceled → **Completed**
*   If some line items have been delivered but others are still pending → **InProgress**

When a purchase order line is fully delivered (`DeliveredQuantity + CanceledQuantity = Quantity`), any remaining order reservations against that line are released to warehouse stock.

If `IsAutoDeliveryStatusDisabled` is set on the delivery, automatic status calculation is skipped.

### [Step 9: Recalculate Reserved Inventory and ATP](#step-9-recalculate-reserved-inventory-and-atp)

After inventory is updated:

1.  **Reserved inventory** is recalculated for all affected SKUs
2.  If **ATP providers** are configured, ATP values are recalculated and exported

### [Step 10: Update Shipment Status](#step-10-update-shipment-status)

If `GoodsReceptionShipmentOrderStatusUpdate` is [configured](/docs/PurchaseOrders/Deliveries/delivery-config), the shipment order status for affected orders is updated to the configured value. This runs as a background task after goods reception completes.

* * *


## [Partial Goods Reception](#partial-goods-reception)

Goods reception can be performed partially — you do not need to receive all expected quantities at once. Each time goods reception is performed:

*   The `DeliveredQuantity` on the purchase order line is **incremented** by the received amount
*   The delivery status transitions to **InProgress** once any quantity has been received
*   When all line items reach their full quantity (delivered + canceled), the delivery moves to **Completed**

This allows you to receive goods in multiple batches as they arrive.

* * *


## [Idempotency](#idempotency)

To prevent duplicate processing when integrating via the API, use the `GoodsReceptionId` field on each goods reception line.

Before processing, the delivery-scoped endpoint checks whether any inventory transaction already exists with the submitted `GoodsReceptionId` values. If a match is found, the request is rejected with a `400 Bad Request` response listing the duplicate IDs.

The `GoodsReceptionId` is stored on the resulting inventory transaction for audit and traceability.

It is strongly recommended to always provide a `GoodsReceptionId` when performing goods reception via the API. Without it, there is no built-in protection against accidental duplicate submissions, which would result in double inventory increases.

* * *


## [Cost Price Updates](#cost-price-updates)

When `UpdateProductCostPrice` is set to `true` on a goods reception line, the product variant's cost information is updated:

*   `Cost` is set to the purchase order line's placed price (excluding tax)
*   `CostCurrency` is set to the purchase order line's currency

This is useful when the actual purchase price from the supplier should be reflected on the product record for reporting or margin calculations.

The unit cost recorded on the inventory transaction is always calculated as the purchase order line's discounted price excluding tax divided by the line quantity, regardless of the `UpdateProductCostPrice` flag.

* * *


## [Virtual Stock Locations (VSL)](#virtual-stock-locations-vsl)

When the receiving warehouse uses **Virtual Stock Locations**, goods reception includes additional allocation logic.

By default, received inventory is distributed across the warehouse's virtual stock locations according to the allocations defined on the purchase order line. This behavior can be modified per goods reception line:

*   **`ReceiveAsUnallocated = true`** — Inventory is added to the physical warehouse without distributing to virtual locations. The inventory remains unallocated until manually or automatically assigned.
*   **`AllocateBasedOnRules = true`** — Instead of using the explicit allocations from the purchase order line, the inventory rule engine distributes the received quantity across virtual locations based on configured rules.

Virtual warehouses cannot be targeted directly in the API. Always specify the physical warehouse code and let Omnium handle the virtual allocation internally.

* * *


## [Processing Flow Diagram](#processing-flow-diagram)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Goods Reception Request
    │
    ├─ Validate warehouse codes
    ├─ Check GoodsReceptionId for duplicates (idempotency)
    │
    ├─ For each goods reception line:
    │  ├─ Find matching purchase order line
    │  ├─ Increase DeliveredQuantity on PO line
    │  └─ Build inventory update (quantity, cost, warehouse)
    │
    ├─ Update purchase order status (if all lines complete)
    ├─ Update product cost prices (if requested)
    │
    ├─ Release order reservations
    │  └─ Clear IsAwaitingPurchaseOrder on reserved order lines
    │
    ├─ Apply inventory updates to warehouse
    │  └─ Retry on conflict (up to 2 retries)
    │
    ├─ Create internal transfers for pickup warehouses (if configured)
    │
    ├─ Recalculate delivery status
    │  ├─ InProgress (partial) or Completed (all done)
    │  └─ Release remaining order reservations for completed lines
    │
    ├─ Recalculate reserved inventory for affected SKUs
    ├─ Update shipment order status (background task, if configured)
    └─ Recalculate ATP (if ATP providers configured)

[

Previous

Configuration

](/docs/PurchaseOrders/Deliveries/delivery-config)[

Next

Environments

](/docs/Environments)

---


## Reservations

[Purchase Orders](/docs/PurchaseOrders)

# Reservations

Learn how order lines are reserved against purchase orders, how reservations transfer to warehouse stock during goods reception, and how to manage reservations via the API.


## [How purchase order reservations work](#how-purchase-order-reservations-work)

When a customer places an order and the required stock is not available in a warehouse but is expected on an incoming purchase order, Omnium can allocate the order line to that purchase order. This is handled by the Available-to-Promise (ATP) system, which looks ahead at expected inventory from purchase orders and matches it to customer demand.

When an order line is allocated to a purchase order, the following properties are set on the order line:

Property

Description

`IsAwaitingPurchaseOrder`

Set to `true` — indicates the line is waiting for goods from a purchase order

`ReservedInventoryPurchaseOrderId`

Reference to the purchase order

`ReservedInventoryPurchaseOrderLineId`

Reference to the specific purchase order line

`ReservedInventoryDeliveryId`

Reference to the expected delivery

`ExpectedDeliveryDate`

The date the goods are expected to arrive

`ReservedInventory`

Set to `true` — the line has a reservation

At this point, the inventory is reserved against the purchase order, not against warehouse stock.

* * *


## [Goods reception: reservation transfer](#goods-reception-reservation-transfer)

When goods reception is performed in Omnium, the system automatically transitions the reservation from the purchase order to the warehouse. This happens in two steps:

1.  **Inventory is increased** in the receiving warehouse based on the delivered quantity.
2.  **The purchase order reservation is released** — `IsAwaitingPurchaseOrder` and `ExpectedDeliveryDate` are cleared from the order line, and `ReservedInventory` remains `true`, now representing a reservation against warehouse stock.

After goods reception, the purchase order references (`ReservedInventoryPurchaseOrderId` and `ReservedInventoryPurchaseOrderLineId`) are kept on the order line for traceability and reporting purposes. The `IsAwaitingPurchaseOrder` flag is what differentiates an order line still waiting for purchase order goods from one that has already been received into the warehouse.

If [internal transfers for pickup warehouses](/docs/PurchaseOrders/purchase-order-config#internal-transfers) are enabled and the order line has a pickup warehouse, the `IsAwaitingPurchaseOrder` flag is kept until the internal transfer is completed.

* * *


## [Shipment and inventory reduction](#shipment-and-inventory-reduction)

When an order shipment is sent and reaches a status with the "Updating inventory" workflow step, the reserved inventory is reduced from the warehouse. At this point, the order line is already reserved against warehouse stock (not the purchase order), so the standard inventory reduction workflow applies.

The full lifecycle of a reservation is:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    1. Order placed → ATP allocates to purchase order
       (IsAwaitingPurchaseOrder = true, reserved against PO)
    
    2. Goods reception performed → reservation transfers
       (IsAwaitingPurchaseOrder = null, reserved against warehouse)
    
    3. Shipment sent → inventory reduced
       (Reserved quantity reduced, warehouse stock decreased)

* * *


## [Managing reservations via the API](#managing-reservations-via-the-api)

If goods reception is handled in an external system (e.g., an ERP), the reservation transfer does not happen automatically in Omnium. In this scenario, you need to manage the transition yourself:

1.  **Update inventory** — ensure the warehouse inventory in Omnium is increased by the ERP integration when goods are received.
2.  **Clear the purchase order allocation** — remove the `IsAwaitingPurchaseOrder` flag from the order line via the API. This signals to Omnium that the order line should now allocate against warehouse stock.

If `IsAwaitingPurchaseOrder` is not cleared after external goods reception, the order line will remain allocated to the purchase order and will not be available for warehouse fulfillment, even if the inventory has been increased.

### [Relevant order line properties](#relevant-order-line-properties)

Property

Type

API action

`IsAwaitingPurchaseOrder`

bool?

Set to `null` or `false` to release the PO allocation

`ExpectedDeliveryDate`

DateTime?

Clear when the PO allocation is released

`ReservedInventoryPurchaseOrderId`

string

Can be kept for traceability or cleared

`ReservedInventoryPurchaseOrderLineId`

string

Can be kept for traceability or cleared

* * *
