# Inventory — Stock, ATP & Warehouse — Inventory

## Inventory

# Inventory

Inventory management in Omnium — stock levels, ATP calculations, inventory valuation, and virtual stock locations.

Omnium can be main source of inventory for smaller customers. Monitoring and controlling the stock of products to ensure availability and avoid stockouts. For larger customers, ERP or WMS is usually managing inventory.

* * *


## [In this section](#in-this-section)

[

API Reference

Update, search, and manage inventory via the API



](/docs/Inventory/inventory-api)[

Configuration

Inventory tracking, reservations, ATP providers, and warehouse allocation



](/docs/Inventory/inventory-config)[

Available-To-Promise (ATP)

Forward-looking availability calculations and delivery date promises



](/docs/Inventory/inventory-atp)[

Inventory Valuation

Default, average cost, and FIFO valuation methods



](/docs/Inventory/inventory-value)[

OmniStock

Aggregate inventory across warehouses and stores for online product availability



](/docs/Inventory/omnistock)[

Virtual Stock Locations

Partition physical warehouse inventory across virtual locations for different sales channels



](/docs/Inventory/virtual-stock-locations)[

Warehouse Locations

Track inventory at physical locations within warehouses for precise stock placement and picking



](/docs/Inventory/warehouse-locations)

* * *


## [Available-To-Promise (ATP)](#available-to-promise-atp)

ATP calculations determine when products will be available for delivery by considering current inventory, reservations, and incoming purchase orders. This enables realistic delivery date promises to customers and optimized inventory allocation.

Key capabilities:

*   **Forward-looking availability**: Consider future purchase order deliveries, not just current stock
*   **Reservation tracking**: Track reservations against future inventory
*   **Automatic delivery dates**: Update product expected delivery dates based on ATP calculations
*   **Order validation**: Validate orders against realistic availability including future stock

For comprehensive documentation on ATP concepts and providers, see [Inventory ATP](/docs/Inventory/inventory-atp).


## [Inventory Valuation](#inventory-valuation)

Omnium supports multiple inventory valuation methods to calculate the cost value of your stock. These methods determine how costs are assigned when inventory is received and consumed.

Available valuation methods:

*   **Default**: Simple single-cost valuation without batch tracking
*   **Average Cost**: Weighted average method that smooths price fluctuations
*   **FIFO (First-In-First-Out)**: Precise batch tracking where oldest inventory is consumed first

For detailed documentation on each method, including examples and configuration, see [Inventory Value](/docs/Inventory/inventory-value).


## [OmniStock](#omnistock)

OmniStock aggregates inventory from multiple warehouses and stores to determine which products are available for online purchase. It evaluates business rules, assortment configuration, and inventory levels to produce per-store availability and stock level indicators on each product.

For comprehensive documentation on OmniStock, including setup, rules configuration, and integration scenarios, see [OmniStock](/docs/Inventory/omnistock).


## [Virtual Stock Locations (VSLs)](#virtual-stock-locations-vsls)

Virtual stock locations allow you to partition physical warehouse inventory across multiple virtual warehouses, enabling control over how much inventory different sales channels can access and sell from the same physical warehouse.

For comprehensive documentation on VSLs, including setup, inventory rules, and configuration, see [Virtual Stock Locations](/docs/Inventory/virtual-stock-locations).


## [Warehouse Locations](#warehouse-locations)

Warehouse location management allows you to track inventory at specific physical locations within a warehouse — such as racks, bays, shelves, or bins. This enables precise stock placement, faster picking, and location-aware fulfillment including automatic routing of returns to default locations.

For comprehensive documentation on warehouse locations, including setup, operations, and API reference, see [Warehouse Locations](/docs/Inventory/warehouse-locations).

[

Previous

Configuration

](/docs/Projects/projects-configuration)[

Next

API Reference

](/docs/Inventory/inventory-api)

---


## API Reference

[Inventory](/docs/Inventory)

# API Reference


## [About Inventory](#about-inventory)

Products in Omnium are enriched with inventory items. The inventory item carries information about:

*   Physical inventory
*   Reserved inventory
*   Available inventory
*   Inventory location

An inventory item identifier/key is created from the variant and warehouse code. The warehouse code is the ID of the store/warehouse where the inventory is located.

**Note**: Adding an inventory item with a warehouseCode and a variant will override any inventory item with the same warehouseCode and inventory.

### [Creating Inventory Items](#creating-inventory-items)

*   Add inventory in the GUI
*   Import/export inventory items in the GUI
*   Import through API

* * *

### [Inventory Item Model](#inventory-item-model)

For details, refer to the [Omnium Inventory Model](https://api.omnium.no/documentation/index.html#/model-OmniumWarehouseInventory).

* * *

### [Inventory Sample](#inventory-sample)

Inventory items for the store **OmniumBikeShop** could look like this:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "sku": "Topeak-43543512",
      "warehouseCode": "WebShop",
      "inventory": 19,
      "reservedInventory": 3,
      "location": null
    }

In the Omnium GUI, the inventory item can be displayed as shown below:

![Store in the GUI](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fomnium_inventory.4daa10de.jpg&w=3840&q=75)

* * *

### [Create Inventory Items](#create-inventory-items)

Add inventory items to Omnium by posting a list of `OmniumInventoryItem` to the [add many endpoint](https://api.omnium.no/documentation/index.html#/Inventory/post_api_Inventory_AddMany). If the item exists, it will be overridden by the object posted to the endpoint.

For more details, visit the [Create inventory items documentation](https://api.omnium.no/documentation/index.html#/Inventory/post_api_Inventory_AddMany).

* * *

### [Get Inventory Item](#get-inventory-item)

#### [Get Single Inventory Item](#get-single-inventory-item)

Inventory items are fetched via a GET request to the [inventory endpoint](https://api.omnium.no/documentation/index.html#/Inventory/get_api_Inventory__id_).

An optional parameter for warehouse IDs is available. If `warehouseIds` is empty, all inventory items for the SKU will be returned.

For more details, visit the [Get inventory item documentation](https://api.omnium.no/documentation/index.html#/Inventory/get_api_Inventory__id_).

#### [Search Inventory Items](#search-inventory-items)

Sample request for a delta query:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/inventory/search
    {
      "LastModified": "2019-11-21T17:32:28Z"
    }

Sample request for inventory for a specific market:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/inventory/search
    {
      "MarketId": "NOR"
    }

Sample response if the number of inventory items exceeds 1000 (totalHits):

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
          ...
        }
      ],
      "scrollId": "2f842421e06e4c60bb2c4f0d8b3ef60b"
    }

**Note**: If the total number of items exceeds 1000, the response will contain a **Scroll ID**, which can be used with the Scroll endpoint to fetch all remaining items.

For more details, visit the [Search inventory items documentation](https://api.omnium.no/documentation/index.html#/Inventory/post_api_Inventory_Search).

* * *

### [Update Inventory Item](#update-inventory-item)

To update an inventory item, send a PUT request with the inventory object to the inventory update endpoint.

For more details, visit the [Update inventory item documentation](https://api.omnium.no/documentation/index.html#/Products%20%7C%20Inventory/InventoryUpdate).

#### [Update Multiple Inventory Items](#update-multiple-inventory-items)

To update multiple inventory items, send a PUT request to the [inventory update many endpoint](https://api.omnium.no/documentation/index.html#/Products%20%7C%20Inventory/InventoryUpdateMany).

* * *

### [Delete Inventory Item](#delete-inventory-item)

To delete an inventory item, send a DELETE request to the inventory endpoint:

For more details, visit the [Delete inventory item documentation](https://api.omnium.no/documentation/index.html#/Products%20%7C%20Inventory/InventoryDelete).

**Note**:The inventory item will be permanently deleted and cannot be recovered.

* * *

### [More Inventory Information](#more-inventory-information)

#### [ATP Values](#atp-values)

**Available to Promise** (ATP) refers to the available quantities of the requested product and its expected delivery due dates.

For more details, visit the [ATP model documentation](https://api.omnium.no/documentation/index.html#/model-OmniumInventoryAtp).

* * *


## [API Integrations – Best Practices](#api-integrations--best-practices)

### [Updating Inventory in Omnium](#updating-inventory-in-omnium)

*   Use the [`InventoryUpdateMany`](https://api.omnium.no/documentation/index.html#/Products%20%7C%20Inventory/InventoryUpdateMany) endpoint.
    
    *   Automatically creates inventory items if they don't already exist.
    *   Skips updates for unchanged items to maintain high performance, even with a large amount of inventory items.
    *   Will only create inventory transactions for actual changes, so the transaction list stays clean and relevant.
*   Use batch sizes of 1000 for stability and performance.
    
*   If reservations are **managed externally** (i.e., outside Omnium):
    
    *   Set `isReservedInventoryOverwritten = true` in your `UpdateMany` request.
    *   This overwrites reservation values on the items.
    *   If left `null` or `false`, existing reservations remain unchanged.
*   **Avoid creating zero-value inventory items**:
    
    *   This reduces the number of inventory items and improves performance.
    *   Treat missing inventory items as having a value of zero.

* * *

### [Fetching Inventory from Omnium](#fetching-inventory-from-omnium)

*   **Full Sync** - Use the [`InventoryScroll`](https://api.omnium.no/documentation/index.html#/Products%20%7C%20Inventory/InventoryScroll) endpoint:
    
    *   Intended only for **occasional** full synchronizations.
    *   Note: It is a resource-heavy operation.
*   **Delta Updates** - Use the [`InventorySearch`](https://api.omnium.no/documentation/index.html#/Products%20%7C%20Inventory/InventorySearch) endpoint:
    
    *   Set the `LastModified` date parameter to fetch only changed data.
    *   Ideal for frequent, lightweight sync operations.
    *   Set `IsBatchesExcluded = true` when batch data is not required.
        *   This significantly reduces the payload size and improves performance. ([Learn more about FIFO](https://docs.omnium.no/docs/Inventory#fifo))

* * *


## [Inventory handling in product search API](#inventory-handling-in-product-search-api)

### [Overview](#overview)

The [Product Search API](https://api.omnium.no/documentation/index.html#/Products%20%7C%20Search/ProductsSearchProducts) returns product data, including an `inventory` field. This field is not queried from live inventory data—it is a snapshot stored on the product itself.

### [Architecture](#architecture)

Omnium stores inventory and products separately:

*   **Inventory data** — The source of truth, updated in real-time via the Inventory API
*   **Products** — Each product has an `inventory` field that holds a copy of relevant inventory data

The Product Search API returns product data, including the `inventory` field. To keep this field in sync with the actual inventory data, a scheduled task periodically copies changes.

### [Synchronization](#synchronization)

The [`ProductInventoryStatusScheduledTask`](/docs/configuration/scheduled-tasks/products/product-inventory-status) synchronizes inventory data to products. This is a **delta task** that processes changes since its last run.

How it works:

1.  On each run, the task queries for inventory changes since the previous execution
2.  It updates the `inventory` field on affected products
3.  It refreshes the product search to make changes visible

Data freshness is determined by the task schedule. For example:

*   Schedule `*/5 * * * *` (every 5 minutes) → inventory data on products can be up to 5 minutes stale
*   Schedule `*/1 * * * *` (every minute) → inventory data on products can be up to 1 minute stale

The task processes only changes since the last run, so execution time depends on the volume of inventory changes. Initial runs or periods with high inventory activity will take longer. See the [task configuration documentation](/docs/configuration/scheduled-tasks/products/product-inventory-status) for setup details.

Additionally, the [`CalculateAndUpdateProductInventory`](/docs/Order/workflow-steps/inventory/calculate-and-update-product-inventory) workflow step can be used in order workflows to immediately update product inventory for all SKUs in an order.

### [Behavior in Search Results](#behavior-in-search-results)

*   If a product has inventory in the queried market, the `inventory` field will be included in the response.
*   After an inventory change, the updated data will not appear in Product Search results until the synchronization runs (scheduled task or workflow step).
*   New products are automatically initialized with inventory status when the task runs.
*   New warehouses, or changes to existing warehouses are also handled automatically in the scheduled task

### [Example request](#example-request)

#### [Request](#request)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "page": 1,
      "take": 200,
      "storeId": "bike-shop-web-no",
      "productLanguage": "no",
      "sortOrder": "CreatedAscending",
      "isFacetsDisabled": true,
      "isActive": true,
      "excludedFields": {
        "isEverythingExcluded": true
      },
      "includedFields": {
        "specificFields": ["inventory"]
      },
      "productIds": ["V-553456", "DMR Vault Pedal"]
    }

### [Response examples](#response-examples)

#### [Case 1: Inventory Exists](#case-1-inventory-exists)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "productId": "V-553456",
      "inventory": [{
        "storeId": "bike-shop-web-no",
        "quantity": 10
      }]
    }

#### [Case 2: No inventory (Field absent)](#case-2-no-inventory-field-absent)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "productId": "V-553457"
    }

### [Important notes](#important-notes)

*   The `inventory` field will not be present if the product has no inventory.
*   If inventory was recently updated, the scheduled task may not have processed the changes yet.

[

Previous

Inventory

](/docs/Inventory)[

Next

Configuration

](/docs/Inventory/inventory-config)

---


## Configuration

[Inventory](/docs/Inventory)

# Configuration

Learn how to configure inventory management settings in Omnium. This guide covers inventory tracking, reservations, ATP providers, inventory valuation, and warehouse allocation.


## [Inventory management](#inventory-management)

Omnium provides comprehensive inventory management capabilities that can serve as the primary inventory source for smaller operations or integrate with external ERP/WMS systems for larger deployments. The inventory configuration controls how stock is tracked, reserved, valued, and allocated across warehouses and sales channels.

### [Core settings](#core-settings)

These settings control the fundamental inventory management behavior.

Property

Type

Default

Description

IsEnabled

bool

false

Master switch for the inventory management system. When disabled, all inventory-related functionality is turned off.

IsWriteEnabled

bool

false

Controls whether inventory modification operations (reduce, increase, update) are allowed. When disabled, inventory becomes read-only and cannot be modified through orders or manual adjustments.

IsReservationWriteEnabled

bool

false

Allows inventory reservations to be created independently of the general write setting. Enable this when you want to track reservations but prevent other inventory modifications.

#### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "IsEnabled": true,
      "IsWriteEnabled": true,
      "IsReservationWriteEnabled": true
    }

### [Inventory calculation](#inventory-calculation)

These settings control how available inventory is calculated and displayed.

Property

Type

Default

Description

IsAvailableInventoryIgnoringReserved

bool

false

When enabled, available inventory equals total inventory (reservations are ignored). When disabled, available inventory equals total minus reserved quantity. Enable this if reservations are managed externally.

IsProductInventoryWarehouseSpecific

bool

false

When enabled, inventory is tracked and displayed per warehouse. When disabled, inventory is aggregated across all warehouses for display purposes.

#### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "IsAvailableInventoryIgnoringReserved": false,
      "IsProductInventoryWarehouseSpecific": true
    }

### [Reservation processing](#reservation-processing)

These settings control how inventory reservations are processed when orders are created.

Property

Type

Default

Description

IsInventoryReservationTriggeredOnOrderCreation

bool

false

When enabled, inventory reservations are created immediately when a cart is converted to an order. When disabled, reservations are created by the IncreaseReservedInventory workflow step.

#### [UI location](#ui-location)

This setting can be configured in the Omnium admin interface:

**Administration** → **Tenant Settings** → **Inventory Management** tab → **Reserve inventory on cart conversion**

**Important:** When `IsInventoryReservationTriggeredOnOrderCreation` is enabled, you must remove the [Increase Reserved Inventory](/docs/Order/workflow-steps/inventory/increase-reserved-inventory) workflow step from the first order status (typically "New") to avoid double reservations.

#### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "IsInventoryReservationTriggeredOnOrderCreation": true
    }

### [Expected delivery](#expected-delivery)

These settings control expected delivery date handling.

Property

Type

Default

Description

IsCheckExpectedDeliveryDateEnabled

bool

false

When enabled, expected delivery dates are validated during order processing. This ensures that promised delivery dates can be met based on current inventory and incoming purchase orders.

#### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "IsCheckExpectedDeliveryDateEnabled": true
    }

### [Product lifecycle](#product-lifecycle)

These settings control how inventory updates affect product data.

Property

Type

Default

Description

IsExpiredProductsAutoDeactivated

bool

false

When enabled, products that have expired and are out of stock are automatically deactivated. Requires the ProductInventoryStatusScheduledTask to be running.

IsProductInventoryExportDisabled

bool

false

When enabled, product export is skipped when updating products with new inventory status. Use this to prevent unnecessary exports when inventory changes frequently.

SkipModifiedDateOnInventoryUpdate

bool

false

When enabled, the product's Modified timestamp is preserved when inventory status is updated. Use this when you don't want inventory changes to trigger modified-date-based processes.

IsInventoryDeletedWhenProductIsDeleted

bool

false

When enabled, inventory records are automatically deleted when their associated product is deleted. When disabled, inventory records are preserved (orphaned).

#### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "IsExpiredProductsAutoDeactivated": true,
      "IsProductInventoryExportDisabled": false,
      "SkipModifiedDateOnInventoryUpdate": true,
      "IsInventoryDeletedWhenProductIsDeleted": true
    }

### [Validation](#validation)

These settings control inventory validation behavior during order processing.

Property

Type

Default

Description

IsInventoryValidationDisabledForNonPromotions

bool

false

When enabled, inventory validation is skipped for items that are not part of a promotion. Use this when non-promotional items should not be blocked by inventory constraints.

IgnoredOrderTypesForAssortmentInventoryValidator

List<string>

\[\]

Order types that are exempt from assortment inventory validation. Orders of these types will not be validated against warehouse assortment rules.

#### [Sample](#sample-5)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "IsInventoryValidationDisabledForNonPromotions": false,
      "IgnoredOrderTypesForAssortmentInventoryValidator": ["Pos", "Manual"]
    }

* * *


## [ATP providers](#atp-providers)

Available-To-Promise (ATP) providers calculate when products will be available for delivery based on current inventory, reservations, and incoming purchase orders. ATP calculations help determine realistic delivery dates for customers.

For comprehensive documentation on ATP concepts, calculation algorithms, and how ATP is used throughout Omnium, see [Inventory ATP](/docs/Inventory/inventory-atp).

### [ATP provider settings](#atp-provider-settings)

Property

Type

Description

Key

string

Unique identifier for the ATP provider. Must match a registered provider type (e.g., "OmniumAtpProvider").

AtpCalculationType

string

Optional calculation type parameter passed to the provider. Provider-specific.

### [Built-in providers](#built-in-providers)

Provider

Description

[OmniumAtpProvider](/docs/Inventory/inventory-atp/omnium-atp-provider)

Built-in ATP provider that calculates availability based on Omnium's inventory and purchase order data. Considers current stock, reservations, and expected deliveries from purchase orders.

### [Sample](#sample-6)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "AtpProviders": [
        {
          "Key": "OmniumAtpProvider",
          "AtpCalculationType": null
        }
      ]
    }

* * *


## [Inventory value providers](#inventory-value-providers)

Inventory value providers calculate the cost value of inventory using different costing methods. These calculations are used for financial reporting and cost tracking.

For comprehensive documentation on inventory valuation concepts, batch tracking, and detailed provider comparisons, see [Inventory Value](/docs/Inventory/inventory-value).

### [Inventory value provider settings](#inventory-value-provider-settings)

Property

Type

Description

Key

string

Unique identifier for the inventory value provider. Must match a registered provider type.

### [Built-in providers](#built-in-providers-1)

Provider

Description

[FifoInventoryValueProvider](/docs/Inventory/inventory-value/fifo-provider)

Uses First-In-First-Out (FIFO) costing method. The cost of goods sold is based on the cost of the oldest inventory items. This method is useful for perishable goods or items with varying purchase costs over time.

[AverageInventoryValueProvider](/docs/Inventory/inventory-value/average-provider)

Uses weighted average costing method. The cost is calculated as the average cost of all inventory items. This method smooths out price fluctuations and is simpler to maintain.

[DefaultInventoryValueProvider](/docs/Inventory/inventory-value/default-provider)

Default provider that uses the product's standard cost price.

### [Sample](#sample-7)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "InventoryValueProviders": [
        {
          "Key": "FifoInventoryValueProvider"
        }
      ]
    }

* * *


## [Warehouse allocation](#warehouse-allocation)

These settings control how inventory is allocated across warehouses and how orders are assigned to fulfillment locations.

Property

Type

Default

Description

IsOrderReallocationBasedOnOrderStore

bool

false

When enabled, warehouse selection for order fulfillment is based on the order's associated store. This allows orders to be routed to the warehouse linked to the originating store.

UseVirtualStockLocations

bool

false

When enabled, virtual stock location (VSL) functionality is activated. VSLs allow you to partition physical warehouse inventory across multiple virtual warehouses for different sales channels. See [Virtual Stock Locations](/docs/Inventory/virtual-stock-locations) for details.

IsWarehouseLocationManagementEnabled

bool

false

When enabled, inventory can be tracked at specific physical locations within warehouses (e.g., racks, bays, shelves). Adds location breakdown to inventory items, location transfer operations, default location routing for returns, and fulfillment warnings. See [Warehouse Locations](/docs/Inventory/warehouse-locations) for details.

WarehouseAllocationAvailableForStoreRoles

List<string>

\[\]

List of store roles that are allowed to perform warehouse allocation operations. When set, only stores with these roles can allocate inventory. Leave empty to allow all stores.

### [Sample](#sample-8)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "IsOrderReallocationBasedOnOrderStore": true,
      "UseVirtualStockLocations": true,
      "IsWarehouseLocationManagementEnabled": false,
      "WarehouseAllocationAvailableForStoreRoles": ["Warehouse", "Distribution"]
    }

* * *
