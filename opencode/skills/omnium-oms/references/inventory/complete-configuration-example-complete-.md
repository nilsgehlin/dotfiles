# Inventory — Stock, ATP & Warehouse — [Complete configuration example](#complete-configuration-example)

## [Complete configuration example](#complete-configuration-example)

Below is a comprehensive example showing all inventory management settings configured together:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "InventoryManagement": {
        "IsEnabled": true,
        "IsWriteEnabled": true,
        "IsReservationWriteEnabled": true,
     
        "IsAvailableInventoryIgnoringReserved": false,
        "IsProductInventoryWarehouseSpecific": true,
     
        "IsInventoryReservationTriggeredOnOrderCreation": false,
        "IsCheckExpectedDeliveryDateEnabled": true,
     
        "IsExpiredProductsAutoDeactivated": true,
        "IsProductInventoryExportDisabled": false,
        "SkipModifiedDateOnInventoryUpdate": false,
        "IsInventoryDeletedWhenProductIsDeleted": true,
     
        "IsInventoryValidationDisabledForNonPromotions": false,
        "IgnoredOrderTypesForAssortmentInventoryValidator": ["Pos"],
     
        "AtpProviders": [
          {
            "Key": "OmniumAtpProvider",
            "AtpCalculationType": null
          }
        ],
     
        "InventoryValueProviders": [
          {
            "Key": "FifoInventoryValueProvider"
          }
        ],
     
        "IsOrderReallocationBasedOnOrderStore": false,
        "UseVirtualStockLocations": false,
        "IsWarehouseLocationManagementEnabled": false,
        "WarehouseAllocationAvailableForStoreRoles": []
      }
    }

[

Previous

API Reference

](/docs/Inventory/inventory-api)[

Next

OmniStock

](/docs/Inventory/omnistock)

---


## Inventory ATP

[Inventory](/docs/Inventory)

# Inventory ATP

Understanding Available-To-Promise (ATP) calculations and how Omnium determines product availability and delivery dates

Available-To-Promise (ATP) is the ability to determine when products will be available for delivery based on current inventory, reservations, and incoming purchase orders. ATP calculations help provide realistic delivery date promises to customers and optimize inventory allocation across orders.

Omnium provides a pluggable ATP provider system that can calculate availability using internal data or integrate with external systems like ERP.

* * *


## [What is ATP?](#what-is-atp)

ATP answers the question: **"When can I deliver this product to the customer?"**

Unlike simple stock checks that only consider current inventory, ATP looks forward in time by considering:

*   **Current on-hand inventory** - Physical stock available now
*   **Reserved inventory** - Stock already committed to other orders
*   **Incoming inventory** - Future deliveries from purchase orders
*   **Reservations on future stock** - Orders already allocated to incoming purchase orders

This allows Omnium to:

*   Promise delivery dates even when current stock is insufficient
*   Allocate incoming purchase order quantities to waiting orders
*   Update product expected delivery dates automatically
*   Validate orders against realistic availability

* * *


## [Key Concepts](#key-concepts)

### [ATP Entry](#atp-entry)

ATP data is stored on inventory items as a list of future availability entries. Each entry represents expected inventory from a purchase order delivery.

Property

Description

Date

Expected delivery date from the purchase order

Quantity

Total quantity expected to be delivered

ReservedQuantity

Quantity already reserved for existing orders

AvailableQuantity

Quantity available for new orders (Quantity minus ReservedQuantity)

PurchaseOrderId

Reference to the source purchase order

PurchaseOrderLineId

Reference to the specific line item

DeliveryId

Reference to the delivery (if partial deliveries)

### [ATP Request](#atp-request)

When calculating ATP, a request specifies what availability information is needed.

Property

Description

Sku

The product SKU to check availability for

Quantity

The quantity needed

RequestedDeliveryDate

Optional target date - if specified, ATP checks if quantity is available by this date

WarehouseCodes

Optional list of warehouses to check (defaults to all)

### [ATP Result](#atp-result)

The result of an ATP calculation provides availability information.

Property

Description

Sku

The requested SKU

AvailableNow

Current available quantity (on-hand minus reserved)

AvailableAt

Date when the requested quantity will be available

Quantity

The quantity that can be fulfilled

CanBeDelivered

Whether the request can be fulfilled (by the requested date if specified)

AtpCalculationType

Identifier for the calculation type (from provider settings)

* * *


## [How ATP Works in Omnium](#how-atp-works-in-omnium)

### [ATP Data Flow](#atp-data-flow)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Purchase Orders with Expected Delivery Dates
                  |
                  v
    +---------------------------+
    | ATP Index Recalculation   |
    | - Get active PO lines     |
    | - Calculate reservations  |
    | - Build ATP entries       |
    +---------------------------+
                  |
                  v
    +---------------------------+
    | Store ATP on Inventory    |
    | (per SKU/warehouse)       |
    +---------------------------+
                  |
                  v
    +---------------------------+
    | ATP Calculation           |
    | - Sum current + future    |
    | - Check vs. requested qty |
    | - Determine delivery date |
    +---------------------------+
                  |
                  v
    +---------------------------+
    | Update product delivery   |
    | dates and validate orders |
    +---------------------------+

### [When ATP is Calculated](#when-atp-is-calculated)

ATP recalculation is triggered in several scenarios:

1.  **Order workflow** - The `CalculateAtp` order action recalculates ATP for SKUs in the order when orders reach certain statuses (typically `New` or `OrderCanceled`)
2.  **Purchase order changes** - When purchase orders are created, updated, or deliveries arrive
3.  **Manual trigger** - ATP can be recalculated on demand for specific SKUs
4.  **Background processing** - ATP can be queued for asynchronous recalculation

### [ATP Calculation Algorithm](#atp-calculation-algorithm)

When calculating whether a quantity can be delivered:

1.  **Get current availability**
    
    *   Calculate available now as: on-hand inventory minus reserved inventory
2.  **If no ATP entries exist** - Only current stock is considered
    
3.  **If ATP entries exist** - Accumulate future availability by date:
    
    *   Sort ATP entries by date (earliest first)
    *   For each entry, add available quantity to cumulative total
    *   Check if cumulative meets the requested quantity
    *   If a requested delivery date is specified, verify the date is achievable
4.  **Return result** with the earliest date when quantity is available
    

### [Package Products](#package-products)

For package products (bundles), ATP is calculated specially:

*   Each component's ATP is calculated separately
*   The package delivery date is the **latest** component delivery date
*   If any component cannot be delivered, the package cannot be delivered
*   Components that are available now don't affect the delivery date

* * *


## [ATP Providers](#atp-providers)

ATP providers implement the actual calculation logic. Omnium supports multiple providers that can be configured per tenant.

Provider

Key

Description

[Omnium ATP Provider](/docs/Inventory/inventory-atp/omnium-atp-provider)

`OmniumAtpProvider`

Built-in provider using Omnium's inventory and purchase order data

Dynamics 365 Brav

`BravAtpProvider`

Integration with Dynamics 365 Brav for external ATP calculations

### [No Provider Configured](#no-provider-configured)

When no ATP provider is configured:

*   ATP data is not calculated or stored on inventory items
*   Product expected delivery dates are not automatically updated
*   Cart/order validation only considers current inventory levels
*   The `CalculateAtp` order action has no effect

This is suitable when:

*   Inventory is managed entirely in an external system
*   You only need simple stock availability (in stock / out of stock)
*   Expected delivery dates are managed manually or through other mechanisms

* * *


## [ATP Validation](#atp-validation)

Omnium validates cart and order inventory considering ATP data:

1.  **Skips validation** for pre-orders (pre-orders don't require current availability)
2.  **Checks current availability** against line item quantities
3.  **If RequestedDeliveryDate is set** - Also considers ATP entries up to that date
4.  **Returns validation errors** for items that cannot be fulfilled

The validator considers inventory from all available warehouses for the order's store, including:

*   Directly assigned warehouses
*   Primary warehouses
*   Warehouses linked through store configuration

* * *


## [Order Actions](#order-actions)

### [CalculateAtp Order Action](#calculateatp-order-action)

**Key:** `CalculateAtp`

Recalculates ATP for products in the order that have purchase order reservations.

**Default Statuses:** `New`, `OrderCanceled`

**Properties:**

Property

Type

Description

SkipProductUpdate

Boolean

When true, skips updating product expected delivery dates after ATP calculation

**Behavior:**

1.  Gets SKUs from order lines with reserved inventory from purchase orders
2.  Updates ATP data on inventory items
3.  Unless `SkipProductUpdate` is true, also updates product expected delivery dates

* * *


## [Product Expected Delivery Date](#product-expected-delivery-date)

ATP calculations can automatically update the `ExpectedDeliveryDate` on product variants. This provides visibility into when out-of-stock products will be available.

The update process:

1.  Calculate ATP for product SKUs
2.  For regular products: Set expected delivery date based on when quantity becomes available
3.  For packages: Set to the latest component delivery date
4.  Only updates products whose delivery date actually changed
5.  Triggers product events for audit trail

**Note:** Only primary warehouses are considered when updating product delivery dates.

* * *


## [Configuration](#configuration)

ATP providers are configured in tenant settings:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "InventoryManagement": {
        "AtpProviders": [
          {
            "Key": "OmniumAtpProvider",
            "AtpCalculationType": null
          }
        ]
      }
    }

Property

Type

Description

Key

string

Provider identifier (must match a registered provider)

AtpCalculationType

string

Optional type parameter passed to the provider for custom behavior

For detailed configuration, see [Inventory Configuration](/docs/Inventory/inventory-config#atp-providers).

* * *


## [Related Topics](#related-topics)

*   [Inventory Configuration](/docs/Inventory/inventory-config)
*   [Virtual Stock Locations](/docs/Inventory/virtual-stock-locations)
*   [Inventory API](/docs/Inventory/inventory-api)

[

Previous

OmniStock

](/docs/Inventory/omnistock)[

Next

Omnium ATP Provider

](/docs/Inventory/inventory-atp/omnium-atp-provider)

---


## Inventory Value

[Inventory](/docs/Inventory)

# Inventory Value

Understanding inventory valuation methods and how Omnium calculates inventory cost values

Inventory valuation is the process of assigning monetary value to your stock. Accurate inventory valuation is essential for financial reporting, cost of goods sold (COGS) calculations, and understanding the true value of your inventory assets.

Omnium provides pluggable inventory value providers that implement different costing methods to suit various business needs and accounting requirements.

* * *


## [How Inventory Value Works](#how-inventory-value-works)

When inventory changes occur (receiving stock, shipping orders, adjustments), Omnium uses the configured inventory value provider to:

1.  **Calculate unit cost** - Determine the cost per unit for the inventory change
2.  **Update inventory value** - Recalculate the total value of inventory on hand
3.  **Track cost history** - Maintain batch records for providers that support it
4.  **Handle multi-currency** - Convert costs to the default currency when needed

### [Inventory Value Flow](#inventory-value-flow)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Inventory Update Received
            |
            v
    +------------------+
    | Get configured   |
    | value provider   |
    +------------------+
            |
            v
    +------------------+
    | Update default   |
    | inventory cost   |
    +------------------+
            |
            v
    +------------------+
    | Process update   |
    | (provider logic) |
    +------------------+
            |
            v
    +------------------+
    | Recalculate      |
    | batch quantities |
    +------------------+
            |
            v
    +------------------+
    | Save inventory   |
    | and transactions |
    +------------------+

* * *


## [Available Providers](#available-providers)

Omnium includes three built-in inventory value providers, each implementing a different costing methodology:

Provider

Key

Batch Tracking

Best For

[Default](/docs/Inventory/inventory-value/default-provider)

`DefaultInventoryValueProvider`

No

Simple inventory, consistent pricing

[Average Cost](/docs/Inventory/inventory-value/average-provider)

`AverageInventoryValueProvider`

Yes

Standard accounting, price smoothing

[FIFO](/docs/Inventory/inventory-value/fifo-provider)

`FifoInventoryValueProvider`

Yes

Manufacturing, perishables, variable costs

* * *


## [Key Concepts](#key-concepts)

### [Inventory Batches](#inventory-batches)

The Average and FIFO providers track inventory in batches. Each batch represents a specific receipt of inventory with its own cost information:

Property

Description

Transaction date

When the batch was received

Quantity

Available quantity in the batch

Cost price

Per-unit cost in the default currency

Billing cost

Per-unit cost in the original purchase currency

Billing currency

Currency used when purchasing this batch

Exchange rate

Exchange rate applied for currency conversion

Currency date

Date used for exchange rate lookup

Batches are ordered by transaction date, with the oldest batches processed first when reducing inventory.

### [Multi-Currency Support](#multi-currency-support)

Inventory costs can be tracked in multiple currencies. The Average and FIFO providers:

*   Store the original billing currency and cost
*   Apply exchange rates at the time of receipt
*   Convert all costs to the tenant's default cost currency for consistent valuation
*   Track the currency date used for exchange rate lookups

The default cost currency is configured in the tenant's product settings.

### [Inventory Value vs. Inventory Cost](#inventory-value-vs-inventory-cost)

*   **Inventory Cost**: The per-unit cost of the item
*   **Inventory Value**: The total value of inventory on hand, calculated as `Cost x Quantity`

For batch-tracking providers, the total inventory value equals the sum of all batch values.

* * *


## [Daily Value Snapshots](#daily-value-snapshots)

Omnium can create daily snapshots of your total inventory value across all warehouses. These snapshots are useful for:

*   Financial reporting
*   Trend analysis
*   Audit trails
*   External system synchronization

A scheduled task runs daily to create these snapshots. Each snapshot includes:

*   Warehouse-level breakdown
*   Original currency values
*   Converted values in configured currencies

* * *


## [Configuration](#configuration)

Inventory value providers are configured in tenant settings under `InventoryManagement.InventoryValueProviders`:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "InventoryManagement": {
        "IsEnabled": true,
        "IsWriteEnabled": true,
        "InventoryValueProviders": [
          {
            "Key": "FifoInventoryValueProvider"
          }
        ]
      },
      "ProductSettings": {
        "DefaultProductCostCurrency": "USD",
        "Currencies": ["USD", "EUR", "NOK"]
      }
    }

Only one inventory value provider can be active at a time. If no provider is configured, the `DefaultInventoryValueProvider` is used.

For more configuration options, see [Inventory Configuration](/docs/Inventory/inventory-config#inventory-value-providers).

* * *


## [Choosing a Provider](#choosing-a-provider)

Consider these factors when selecting an inventory value provider:

Factor

Default

Average

FIFO

**Setup complexity**

Minimal

Low

Low

**Storage overhead**

Low

Higher (batches)

Higher (batches)

**Price fluctuation handling**

None

Smoothed

Precise

**COGS accuracy**

Approximate

Good

Best

**Audit trail**

None

Full

Full

**Multi-currency**

Basic

Full

Full

**Recommendations:**

*   **Default**: Use when product costs are stable and you don't need detailed cost tracking
*   **Average**: Use for standard retail/wholesale operations where cost smoothing is acceptable
*   **FIFO**: Use for manufacturing, perishable goods, or when precise COGS tracking is required

* * *


## [Related Topics](#related-topics)

*   [Inventory Configuration](/docs/Inventory/inventory-config)
*   [Virtual Stock Locations](/docs/Inventory/virtual-stock-locations)
*   [Inventory API](/docs/Inventory/inventory-api)

[

Previous

Omnium ATP Provider

](/docs/Inventory/inventory-atp/omnium-atp-provider)[

Next

Default Provider

](/docs/Inventory/inventory-value/default-provider)

---


## OmniStock

[Inventory](/docs/Inventory)

# OmniStock

Aggregate inventory across multiple warehouses and stores to determine online product availability.


## [What is OmniStock?](#what-is-omnistock)

OmniStock is Omnium's inventory aggregation engine that determines which products should be shown as available for online purchase. It combines inventory from multiple physical warehouses and stores into a unified view of online availability per sales channel.

At its core, OmniStock answers: **"Can this product be ordered online, and which warehouses can fulfill it?"**

For each product, OmniStock evaluates:

*   Which warehouses have stock for the product
*   Whether the product is in the warehouse's assortment
*   Whether the warehouse is allowed to ship the product (based on business rules)
*   The aggregate stock level across all eligible warehouses

The result is stored on the product as two fields:

*   **`OmniStock`** — a list of store IDs where the product is available for online purchase
*   **`OmniStockLevels`** — stock level indicators (High/Low/Out of Stock) per store

* * *


## [Key Concepts](#key-concepts)

### [Store Roles](#store-roles)

OmniStock uses two store roles to define the relationship between online sales channels and fulfillment locations:

Role

Purpose

**OmniStock**

An online store (sales channel) that aggregates inventory from multiple warehouses. This is typically a webshop — not a physical location.

**ShipFromStore**

A warehouse or physical store that can fulfill online orders. Must have `IsWarehouse = true`.

An **OmniStock store** defines _where_ products are sold online. A **ShipFromStore** defines _where_ products are shipped from.

### [Warehouse Linking](#warehouse-linking)

Each OmniStock store has an `AvailableWarehouses` list that links it to one or more ShipFromStore locations. Each linked warehouse has a priority value used during order allocation to determine fulfillment preference.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌─────────────────────────────────┐
    │  OmniStock Store ("Webshop-NO") │
    │  Role: OmniStock                │
    │  AvailableWarehouses:           │
    │    ├─ CentralWarehouse (pri: 1) │
    │    ├─ Store-Oslo (pri: 2)       │
    │    └─ Store-Bergen (pri: 3)     │
    └─────────────────────────────────┘
             │          │          │
             ▼          ▼          ▼
       ┌──────────┐ ┌─────────┐ ┌──────────┐
       │ Central  │ │  Oslo   │ │  Bergen  │
       │Warehouse │ │  Store  │ │  Store   │
       │ Role:    │ │ Role:   │ │ Role:    │
       │ ShipFrom │ │ ShipFrom│ │ ShipFrom │
       │ Store    │ │ Store   │ │ Store    │
       └──────────┘ └─────────┘ └──────────┘

A product is considered available on the OmniStock store if **at least one** of the linked warehouses has stock and passes all business rules.

### [Stock Levels](#stock-levels)

OmniStock calculates a stock level per store per SKU (variant). The levels are determined by comparing aggregate available inventory against a configurable threshold:

Stock Level

Condition

**HighInStock**

Available inventory > threshold

**LowInStock**

Available inventory > 0 but ≤ threshold

**OutOfStock**

Available inventory = 0

The threshold is configured tenant-wide via the `OmniStockLowInStockThreshold` setting (default: 10 units). Available inventory is the sum across all eligible warehouses for that store.

* * *


## [How OmniStock Works](#how-omnistock-works)

OmniStock runs as a **scheduled background task** that periodically evaluates all products and updates their online availability. The process follows these steps:

### [1\. Identify Eligible Stores and Warehouses](#1-identify-eligible-stores-and-warehouses)

The system loads all stores with the **OmniStock** role that have at least one linked warehouse, and builds a lookup map:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Webshop-NO": ["CentralWarehouse", "Store-Oslo", "Store-Bergen"],
      "Webshop-SE": ["CentralWarehouse", "Store-Stockholm"]
    }

### [2\. Evaluate Each Product](#2-evaluate-each-product)

For each active product, the system evaluates every OmniStock store by checking its linked warehouses against a series of conditions:

1.  **Warehouse has ShipFromStore role** — only warehouses with this role can fulfill orders
2.  **Product is in warehouse assortment** — checked via the product's `StoreIds` list or category-based assortment rules on the warehouse
3.  **OmniStock rules are satisfied** — business rules configured on the warehouse (see [OmniStock Rules](#omnistock-rules))
4.  **Inventory exists** — at least one linked warehouse must have stock for the product (or one of its variants)

### [3\. Update Product Availability](#3-update-product-availability)

The product's `OmniStock` field is set to the list of OmniStock store IDs where the product passed all checks. The `OmniStockLevels` field is populated with per-store stock level indicators for each variant.

### [Delta vs Full Recalculation](#delta-vs-full-recalculation)

The scheduled task uses two processing modes:

Mode

Trigger

Scope

**Delta**

Default on every run

Only processes products modified since the last run and products affected by recent inventory changes

**Full recalculation**

Store configuration changes detected

Re-evaluates every active product from scratch

**Store change detection**: The system takes a snapshot of relevant store properties (roles, markets, linked warehouses, and OmniStock rules) and caches it. If the snapshot differs from the cached version on the next run, a full recalculation is triggered. This ensures that changes like adding a new warehouse or modifying exclusion rules are reflected across all products.

* * *


## [OmniStock Rules](#omnistock-rules)

OmniStock rules are business rules configured per warehouse (ShipFromStore) that control which products are eligible for online fulfillment from that location. Rules are optional — if no rules are configured on a warehouse, all products in its assortment with available inventory will be eligible.

Rules are configured on the store's `OmniStockRules` property.

### [Rule Properties](#rule-properties)

Property

Type

Description

ExcludedBrands

List<string>

Products with these brands will not be available from this warehouse

ExcludedSeasons

List<string>

Products with these seasons will not be available from this warehouse

ExcludedPromotionIds

List<string>

Products on these promotions will not be available. Only currently active promotions are checked — future or expired promotions are ignored.

IncludedCategoryIds

List<string>

Only products in these categories will be available. If both included and excluded categories are set, the included list is applied first, then exclusions are removed.

ExcludedCategoryIds

List<string>

Products in these categories will not be available

ExcludedProductIds

List<string>

Specific products that will never be available from this warehouse

ProfitabilityThreshold

decimal?

Minimum profit margin (unit price minus cost) required for the product to be available. Requires `CurrencyCode` to be set.

CurrencyCode

string?

Currency used for profitability calculation. The system finds a matching market and evaluates the product's price in that currency.

### [Rule Evaluation Order](#rule-evaluation-order)

Rules are evaluated in the following order. If any rule fails, the product is excluded from that warehouse:

1.  **Brand exclusion** — Is the product's brand in the excluded list?
2.  **Season exclusion** — Is the product's season in the excluded list?
3.  **Promotion exclusion** — Is the product on an excluded active promotion?
4.  **Category inclusion/exclusion** — Does the product satisfy category rules?
5.  **Product exclusion** — Is the product explicitly excluded?
6.  **Profitability threshold** — Does the product meet the minimum margin?

### [Example: Store API Configuration](#example-store-api-configuration)

When creating or updating a store via the API, OmniStock rules are set on the `omniStockRules` property:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "Store-Oslo",
      "name": "Oslo Store",
      "isWarehouse": true,
      "storeRoleIds": ["ShipFromStore"],
      "availableOnMarkets": ["NO"],
      "omniStockRules": {
        "excludedBrands": ["BrandX", "BrandY"],
        "excludedSeasons": ["SS2023"],
        "excludedPromotionIds": ["promo-clearance-2024"],
        "includedCategoryIds": ["clothing", "accessories"],
        "excludedCategoryIds": ["clothing-outlet"],
        "excludedProductIds": ["PROD-123", "PROD-456"],
        "profitabilityThreshold": 50.00,
        "currencyCode": "NOK"
      }
    }

In this example, Store-Oslo will only ship products that:

*   Are not from BrandX or BrandY
*   Are not from the SS2023 season
*   Are not on the clearance promotion
*   Belong to clothing or accessories categories (but not clothing-outlet)
*   Are not PROD-123 or PROD-456
*   Have at least 50 NOK margin

* * *
