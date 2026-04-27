# Inventory — Stock, ATP & Warehouse — [Configuration](#configuration)

## [Configuration](#configuration)

### [Tenant Settings](#tenant-settings)

Setting

Type

Default

Description

InventoryManagement.OmniStockLowInStockThreshold

decimal

10

The inventory threshold for determining stock levels. Products with aggregate inventory above this value are `HighInStock`; at or below are `LowInStock`.

### [Store Configuration](#store-configuration)

For OmniStock to work, stores must be configured with the correct roles and relationships:

#### [OmniStock Store (Online Sales Channel)](#omnistock-store-online-sales-channel)

Property

Required Value

Description

StoreRoleIds

Must include `"OmniStock"`

Marks this store as an online sales channel

AvailableWarehouses

At least one entry

Links to warehouses that can fulfill orders for this channel

AvailableOnMarkets

At least one market

Defines which markets this store serves

#### [ShipFromStore (Fulfillment Location)](#shipfromstore-fulfillment-location)

Property

Required Value

Description

StoreRoleIds

Must include `"ShipFromStore"`

Marks this store/warehouse as a fulfillment source

IsWarehouse

`true`

Identifies the store as a warehouse

AvailableOnMarkets

At least one market

Used for profitability threshold calculations

OmniStockRules

Optional

Business rules controlling product eligibility

### [Assortment Configuration](#assortment-configuration)

Products are matched to warehouses using assortment rules. Two approaches are supported:

1.  **Direct assignment**: The product's `StoreIds` list explicitly includes the warehouse ID
2.  **Category-based rules**: The warehouse's `AssortmentIncludeProductCategoryIds` and `AssortmentExcludeProductCategoryIds` control which product categories are in its assortment

If the product has a `StoreIds` list, only stores in that list are considered. Otherwise, the category-based rules on the warehouse are evaluated.

* * *


## [Product Data Model](#product-data-model)

OmniStock writes the following fields on each product:

### [Product.OmniStock](#productomnistock)

**Type**: `List<string>` (nullable)

A list of OmniStock store IDs where the product is available for online purchase. Set to `null` if the product is not available at any store.

### [Product.OmniStockLevels](#productomnistocklevels)

**Type**: `List<OmniStockLevel>`

Per-store stock level indicators, set on each variant (or on the product itself if it has no variants).

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "omniStockLevels": [
        { "storeId": "Webshop-NO", "stockLevel": "HighInStock" },
        { "storeId": "Webshop-SE", "stockLevel": "LowInStock" }
      ]
    }

Stock levels are set for **all** OmniStock stores, including those where the product is out of stock. This allows frontends to reliably check availability without needing to interpret a missing entry.

* * *


## [Setup Guide](#setup-guide)

### [Step 1: Configure Warehouses as ShipFromStore](#step-1-configure-warehouses-as-shipfromstore)

For each warehouse or store that should fulfill online orders, ensure:

1.  Set `IsWarehouse` to `true`
2.  Add `"ShipFromStore"` to `StoreRoleIds`
3.  Set `AvailableOnMarkets` to the relevant markets
4.  Optionally configure `OmniStockRules` to control product eligibility

### [Step 2: Create OmniStock Stores](#step-2-create-omnistock-stores)

For each online sales channel, create a store with:

1.  Add `"OmniStock"` to `StoreRoleIds`
2.  Set `AvailableWarehouses` linking to the ShipFromStore locations, with priority values
3.  Set `AvailableOnMarkets` to the markets this channel serves

### [Step 3: Configure Threshold](#step-3-configure-threshold)

Set the `OmniStockLowInStockThreshold` in tenant settings to control the boundary between High and Low stock level indicators.

### [Step 4: Ensure Products Have Inventory](#step-4-ensure-products-have-inventory)

Products must have inventory records at the linked warehouses. Inventory is typically imported via the [Inventory API](/docs/Inventory/inventory-api).

### [Step 5: Verify](#step-5-verify)

After the scheduled task runs, products should have `OmniStock` and `OmniStockLevels` populated. You can verify by querying products via the API and checking these fields.

* * *


## [Integration Scenarios](#integration-scenarios)

### [Scenario 1: Single Webshop with Multiple Warehouses](#scenario-1-single-webshop-with-multiple-warehouses)

A retailer has one online store serving Norway, with a central warehouse and two stores that also fulfill online orders.

**Configuration:**

*   Create warehouse stores: `CentralWarehouse`, `Store-Oslo`, `Store-Bergen` — all with ShipFromStore role
*   Create OmniStock store: `Webshop-NO` with OmniStock role, linked to all three warehouses
*   Set warehouse priorities: Central=1, Oslo=2, Bergen=3

**Result:** Products with stock at any of the three locations appear as available on the webshop. Order allocation uses priority to prefer the central warehouse.

### [Scenario 2: Multi-Market with Separate Channels](#scenario-2-multi-market-with-separate-channels)

A retailer operates online stores in Norway and Sweden, each served by different warehouses.

**Configuration:**

*   `CentralWarehouse` (ShipFromStore, markets: NO, SE)
*   `Store-Stockholm` (ShipFromStore, market: SE)
*   `Webshop-NO` (OmniStock, linked to: CentralWarehouse)
*   `Webshop-SE` (OmniStock, linked to: CentralWarehouse, Store-Stockholm)

**Result:** Norwegian customers see availability based on central warehouse stock. Swedish customers see combined availability from both the central warehouse and Stockholm store.

### [Scenario 3: Selective Ship-from-Store with Rules](#scenario-3-selective-ship-from-store-with-rules)

A retailer wants physical stores to fulfill online orders, but only for certain product categories and only when profitable.

**Configuration:**

*   Physical stores have ShipFromStore role with OmniStockRules:
    *   `includedCategoryIds`: \["clothing", "accessories"\]
    *   `excludedBrands`: \["PremiumBrand"\] (only sold in-store)
    *   `profitabilityThreshold`: 100
    *   `currencyCode`: "NOK"

**Result:** Only clothing and accessories with at least 100 NOK margin (excluding PremiumBrand) will be available for ship-from-store fulfillment.

* * *


## [Troubleshooting](#troubleshooting)

### [Product Not Showing as Available Online](#product-not-showing-as-available-online)

1.  **Check store roles**: Verify the OmniStock store has `"OmniStock"` in `StoreRoleIds` and linked warehouses have `"ShipFromStore"`
2.  **Check warehouse linking**: Confirm the OmniStock store's `AvailableWarehouses` includes the correct warehouse codes
3.  **Check inventory**: Verify the product has inventory records at the linked warehouses with quantity > 0
4.  **Check assortment**: Confirm the product is in the warehouse's assortment (via `StoreIds` or category rules)
5.  **Check OmniStock rules**: Review the warehouse's `OmniStockRules` — the product may be excluded by brand, season, category, promotion, or profitability threshold
6.  **Wait for scheduled task**: OmniStock updates are processed by a background task. Changes may take a few minutes to reflect.

### [Product Available at Wrong Stores](#product-available-at-wrong-stores)

1.  Review the `AvailableWarehouses` configuration on each OmniStock store
2.  Check that warehouse `AvailableOnMarkets` matches the intended markets
3.  Verify assortment category rules are correctly configured on the warehouses

### [Stock Level Incorrect](#stock-level-incorrect)

1.  Verify the `OmniStockLowInStockThreshold` tenant setting
2.  Check that inventory is correctly reported at all linked warehouses
3.  Remember that stock levels are aggregated across all eligible warehouses for each store

### [Full Recalculation Triggered Unexpectedly](#full-recalculation-triggered-unexpectedly)

A full recalculation runs when the system detects changes to any of the following on stores with ShipFromStore or OmniStock roles:

*   Store role assignments
*   Available markets
*   Linked warehouses (codes or priorities)
*   OmniStock rules (any field)

Review recent store configuration changes to identify the trigger.

[

Previous

Configuration

](/docs/Inventory/inventory-config)[

Next

Inventory ATP

](/docs/Inventory/inventory-atp)

---


## Virtual Stock Locations

[Inventory](/docs/Inventory)

# Virtual Stock Locations

Learn how to configure virtual stock locations in Omnium.


## [Virtual Stock Locations (VSL)](#virtual-stock-locations-vsl)

Virtual Stock Locations (VSLs) allow you to partition physical warehouse inventory across multiple virtual warehouses. This is particularly useful when you need to allocate inventory to different sales channels (e.g., online store, marketplace, B2B portal) from a single physical warehouse while maintaining separate inventory tracking for each channel.

### [How VSLs Work](#how-vsls-work)

When VSLs are enabled, each physical warehouse can have multiple virtual stock locations associated with it. Inventory at the physical warehouse level represents the total available stock, while each VSL tracks how much of that stock is allocated to a specific channel or purpose.

**Key concepts:**

*   **Physical warehouse**: The actual storage location containing the physical inventory
*   **Virtual stock location**: A logical partition of the physical warehouse's inventory
*   **Unallocated inventory**: Physical inventory that has not been assigned to any VSL

The relationship between physical and virtual inventory is:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Physical Inventory = Sum of VSL Inventories + Unallocated Inventory

### [Enabling VSLs](#enabling-vsls)

To enable virtual stock locations, set the `UseVirtualStockLocations` property to `true`:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "UseVirtualStockLocations": true
    }

### [Setting Up Warehouses for VSL](#setting-up-warehouses-for-vsl)

When introducing virtual stock locations, the recommended approach is to create new warehouses for the virtual locations while keeping the existing physical warehouses unchanged. This ensures Omnium handles inventory and reservations correctly and avoids breaking functionality or displaying historical data incorrectly.

**Configuration steps:**

1.  **Mark virtual warehouses**: Set "Is virtual" on each virtual warehouse
2.  **Mark physical warehouses**: Set "Has virtual stock locations" on physical warehouses that will use VSLs
3.  **Link warehouses**: Set the physical warehouse as the "related warehouse" on each virtual warehouse
4.  **Update sales channels**: Point sales channels to the virtual warehouses instead of the physical warehouse

**Important**: Once VSLs are introduced, no sales channels should be directly linked to the physical warehouse. All stores served by a physical warehouse with VSLs should have one of the virtual warehouses as their available warehouse.

### [VSL Configuration Settings](#vsl-configuration-settings)

Property

Type

Default

Description

UseVirtualStockLocations

bool

false

Enables virtual stock location functionality. When enabled, inventory can be partitioned across multiple virtual warehouses linked to a physical warehouse.

ApplyVslRulesOnInventoryUpdatesFromApi

bool

false

Feature flag that controls whether inventory rules are applied when inventory is updated via the API. See [Applying Rules to API Inventory Updates](#applying-rules-to-api-inventory-updates) for details.

WarehouseAllocationAvailableForStoreRoles

List<string>

\[\]

Restricts warehouse allocation operations to stores with specific roles. Leave empty to allow all stores to perform allocations.

### [Sample Configuration](#sample-configuration)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "UseVirtualStockLocations": true,
      "ApplyVslRulesOnInventoryUpdatesFromApi": true,
      "WarehouseAllocationAvailableForStoreRoles": ["Warehouse", "Distribution"]
    }

* * *


## [Inventory Rules](#inventory-rules)

Inventory rules define how incoming inventory should be distributed across virtual stock locations. Rules are evaluated based on priority and can target specific products, categories, or brands.

### [Rule Properties](#rule-properties)

Property

Type

Description

Name

string

Display name for the rule

Description

string

Optional description explaining the rule's purpose

PhysicalWarehouseCode

string

The physical warehouse this rule applies to

SkuIds

List<string>

Optional list of specific SKU IDs this rule applies to

CategoryIds

List<string>

Optional list of category IDs this rule applies to

Brands

List<string>

Optional list of brand names this rule applies to

Priority

int

Execution order (lower numbers execute first)

IsDynamic

bool

Whether this rule should apply to API-triggered inventory changes

IsActive

bool

Whether the rule is currently active

WarehouseAllocations

List

The allocation definitions for each VSL

### [Rule Matching](#rule-matching)

Rules are matched to products based on the following criteria (in order of specificity):

1.  **SKU match**: If `SkuIds` contains the product's SKU
2.  **Category match**: If `CategoryIds` contains any of the product's categories
3.  **Brand match**: If `Brands` contains the product's brand

A rule applies to a product if any of the configured criteria match. If multiple rules match a product, they are processed in priority order (lowest priority number first).

### [Warehouse Allocations](#warehouse-allocations)

Each rule contains one or more warehouse allocations that define how inventory should be distributed to VSLs.

Property

Type

Description

WarehouseCode

string

The virtual warehouse code to allocate to

Type

string

Allocation type: "Minimum", "Fixed", or "Percent"

Amount

decimal

The amount for Fixed (quantity) or Percent (percentage) allocations

MinimumQuantity

int

The minimum quantity to maintain (for Minimum type)

Priority

int

Order within this rule's allocations (lower numbers first)

### [Allocation Types](#allocation-types)

Inventory rules support three allocation types, processed in the following order:

#### [1\. Minimum Allocation](#1-minimum-allocation)

Ensures a minimum quantity is always maintained at a VSL before other allocations occur. Use this when a channel must always have at least a certain amount of stock available.

**Example**: Ensure the B2B portal always has at least 10 units of a product.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "WarehouseCode": "VSL-B2B",
      "Type": "Minimum",
      "MinimumQuantity": 10,
      "Priority": 1
    }

#### [2\. Fixed Allocation](#2-fixed-allocation)

Allocates an exact quantity to a VSL. Use this when a channel should receive a specific number of units regardless of the total incoming quantity.

**Example**: Always allocate exactly 50 units to the marketplace.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "WarehouseCode": "VSL-MARKETPLACE",
      "Type": "Fixed",
      "Amount": 50,
      "Priority": 2
    }

#### [3\. Percent Allocation](#3-percent-allocation)

Distributes remaining inventory proportionally across VSLs based on percentages. Percent allocations are processed after Minimum and Fixed allocations have been satisfied.

**Example**: Split remaining inventory 60/40 between online store and outlet.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "WarehouseCode": "VSL-ONLINE",
        "Type": "Percent",
        "Amount": 60,
        "Priority": 3
      },
      {
        "WarehouseCode": "VSL-OUTLET",
        "Type": "Percent",
        "Amount": 40,
        "Priority": 3
      }
    ]

### [Allocation Processing Order](#allocation-processing-order)

When inventory arrives, allocations are processed in this order:

1.  **Minimum allocations**: Fill minimum quantity requirements for each VSL
2.  **Fixed allocations**: Allocate fixed quantities to each VSL
3.  **Percent allocations**: Distribute remaining quantity by percentage

Within each type, allocations are processed by their priority value (lower numbers first).

### [Complete Rule Example](#complete-rule-example)

The following example shows a complete inventory rule that:

*   Applies to products in the "Electronics" category
*   Ensures the B2B channel has at least 5 units
*   Allocates a fixed 20 units to the marketplace
*   Distributes remaining inventory 70/30 between online and outlet

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Electronics Allocation Rule",
      "Description": "Standard allocation for electronics products",
      "PhysicalWarehouseCode": "WAREHOUSE-MAIN",
      "CategoryIds": ["electronics"],
      "Priority": 1,
      "IsDynamic": false,
      "IsActive": true,
      "WarehouseAllocations": [
        {
          "WarehouseCode": "VSL-B2B",
          "Type": "Minimum",
          "MinimumQuantity": 5,
          "Priority": 1
        },
        {
          "WarehouseCode": "VSL-MARKETPLACE",
          "Type": "Fixed",
          "Amount": 20,
          "Priority": 2
        },
        {
          "WarehouseCode": "VSL-ONLINE",
          "Type": "Percent",
          "Amount": 70,
          "Priority": 3
        },
        {
          "WarehouseCode": "VSL-OUTLET",
          "Type": "Percent",
          "Amount": 30,
          "Priority": 3
        }
      ]
    }

* * *


## [Dynamic Inventory Rules](#dynamic-inventory-rules)

Dynamic rules are a special type of inventory rule designed to maintain inventory balance across VSLs when inventory is **reduced** (e.g., from sales orders). While standard rules primarily handle allocation when inventory **increases** (such as during goods reception), dynamic rules ensure that the configured distribution percentages are maintained as inventory is consumed.

### [Standard vs Dynamic Rules](#standard-vs-dynamic-rules)

Aspect

Standard Rules

Dynamic Rules

Primary trigger

Inventory increases (goods reception)

Inventory decreases (sales, adjustments)

Purpose

Allocate incoming inventory to VSLs

Maintain balance across VSLs as inventory is consumed

Allocation types

Minimum, Fixed, Percent

Percent only

Use case

Initial distribution of new stock

Ongoing rebalancing during sales activity

### [How Dynamic Rules Work](#how-dynamic-rules-work)

When inventory is reduced at a VSL (for example, due to a sales order), dynamic rules:

1.  Identify all VSLs with dynamic percentage allocations for the affected SKU
2.  Reduce inventory proportionally from other VSLs in the same allocation group
3.  Redistribute the remaining inventory to maintain the target percentage ratios

**Example**: If you have two VSLs configured at 60/40 split and a sale reduces inventory at the first VSL, the system will rebalance by adjusting inventory at the second VSL to maintain the 60/40 ratio.

### [Dynamic Rule Limitations](#dynamic-rule-limitations)

Dynamic rules only support **Percent** allocation types. Minimum and Fixed allocations are not applied during dynamic redistribution. This is because dynamic rules are designed to maintain proportional distribution rather than absolute quantities.

### [When to Use Dynamic Rules](#when-to-use-dynamic-rules)

Use dynamic rules when:

*   You need to maintain consistent inventory ratios across channels as sales occur
*   One channel selling should proportionally affect inventory availability at other channels
*   You want automatic rebalancing without manual intervention

### [Configuration](#configuration)

Create a dynamic rule by setting `IsDynamic: true`:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Dynamic Channel Distribution",
      "PhysicalWarehouseCode": "WAREHOUSE-MAIN",
      "Priority": 1,
      "IsDynamic": true,
      "IsActive": true,
      "WarehouseAllocations": [
        {
          "WarehouseCode": "VSL-ONLINE",
          "Type": "Percent",
          "Amount": 60,
          "Priority": 1
        },
        {
          "WarehouseCode": "VSL-OUTLET",
          "Type": "Percent",
          "Amount": 40,
          "Priority": 1
        }
      ]
    }

* * *


## [Applying Rules to API Inventory Updates](#applying-rules-to-api-inventory-updates)

When inventory is updated via the API (rather than through goods reception or sales orders), you can control whether inventory rules should be applied using the `ApplyVslRulesOnInventoryUpdatesFromApi` setting.

### [Configuration](#configuration-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "InventoryManagement": {
      "UseVirtualStockLocations": true,
      "ApplyVslRulesOnInventoryUpdatesFromApi": true
    }

### [When to Enable](#when-to-enable)

Enable this setting when:

*   External systems (ERP, WMS) push inventory updates via API
*   You want these API updates to be automatically distributed according to your allocation rules
*   The API updates represent physical inventory changes that should affect VSL allocations

### [When to Disable](#when-to-disable)

Disable this setting when:

*   API updates should directly modify the specified inventory location without redistribution
*   External systems manage VSL allocations themselves
*   You need precise control over which inventory location receives the update

* * *


## [Unallocated Inventory](#unallocated-inventory)

Unallocated inventory represents physical warehouse stock that has not been assigned to any virtual stock location. This can occur when:

*   Inventory arrives without matching allocation rules
*   VSL allocations don't consume all available inventory
*   Manual adjustments are made to physical inventory

### [Monitoring Unallocated Inventory](#monitoring-unallocated-inventory)

The system tracks unallocated inventory per SKU per physical warehouse. A positive unallocated value indicates inventory available for allocation. A negative value indicates **overallocation** — more inventory has been allocated to VSLs than exists at the physical warehouse.

### [Handling Negative Inventory Spikes](#handling-negative-inventory-spikes)

When a negative spike occurs in physical warehouse inventory (e.g., from external inventory corrections), the system reacts to prevent overallocation:

**Scenario 1: Unallocated inventory can absorb the change**

If the unallocated inventory is greater than or equal to the negative spike, the unallocated inventory absorbs the change. The unallocated inventory decreases along with the physical inventory level, while VSL inventory levels remain unchanged.

**Scenario 2: Unallocated inventory cannot fully absorb the change**

If the unallocated inventory is less than the negative spike:

1.  The system first absorbs as much as possible by reducing unallocated inventory to zero
2.  The remaining difference is corrected by reducing inventory at the VSL with the highest inventory level
3.  If needed, reductions are spread across multiple VSLs until the overallocation is resolved

### [Automatic Overallocation Correction](#automatic-overallocation-correction)

Overallocation (negative unallocated inventory) can occur due to:

*   Timing issues between sales and inventory updates
*   Manual inventory adjustments
*   Integration delays

The system includes an automatic correction mechanism via a scheduled task that runs approximately every minute. This task:

1.  Identifies overallocated inventory (negative unallocated values)
2.  Reduces VSL inventory levels to correct the overallocation
3.  Reduces from VSLs with the highest available inventory first

This prevents overselling by ensuring VSL inventory levels don't exceed actual physical stock. Note that correction may not be instantaneous but should complete within a reasonable time.

### [Best Practices](#best-practices)

*   Monitor unallocated inventory levels regularly
    *   There is both a UI and dashboard gadget for displaying unallocatedInventories
*   Ensure allocation rules account for all expected inventory
*   Configure percent allocations to total 100% when possible
*   Use the automatic overallocation correction as a safety net, not a primary mechanism

* * *


## [Purchase Orders and Goods Reception](#purchase-orders-and-goods-reception)

Inventory rules integrate with the purchase order and goods reception workflow to allocate incoming inventory to VSLs.

### [Allocation During Goods Reception](#allocation-during-goods-reception)

When goods are received against a purchase order, the system can allocate the received quantity to VSLs in two ways:

1.  **Rule-based allocation**: Apply inventory rules to determine VSL distribution
2.  **Quantity-based allocation**: Distribute based on pre-defined allocations on the purchase order line

### [Rule-Based Allocation](#rule-based-allocation)

When a goods reception line has `AllocateBasedOnRules` set to true (or inherits this from the purchase order line), the system:

1.  Retrieves active inventory rules matching the received SKU
2.  Evaluates allocations based on current VSL inventory levels
3.  Creates virtual goods reception lines for each VSL

This is useful when you want consistent allocation behavior regardless of how the purchase order was created.

### [Quantity-Based Allocation](#quantity-based-allocation)

If the purchase order line already has VSL allocations defined (`VirtualWarehouseAllocations`), the goods reception distributes the received quantity proportionally to each VSL based on remaining undelivered quantities.

This is useful when:

*   Allocations were determined during purchase order creation
*   Different products on the same PO need different allocation strategies
*   Manual override of standard rules is required

### [Unallocated Goods Reception](#unallocated-goods-reception)

Goods can be received as unallocated by setting `ReceiveAsUnallocated` on the goods reception line. This adds inventory to the physical warehouse without distributing to VSLs, increasing the unallocated inventory pool.

* * *


## [Integration Scenarios](#integration-scenarios)

### [Scenario 1: Multi-Channel Retail](#scenario-1-multi-channel-retail)

A retailer operates an online store, a marketplace presence, and physical stores. They want to allocate warehouse inventory across these channels.

**Configuration:**

*   Create VSLs for each channel: `VSL-ONLINE`, `VSL-MARKETPLACE`, `VSL-STORES`
*   Create inventory rules with percent allocations (e.g., 50% online, 30% marketplace, 20% stores)
*   Enable dynamic rules for API updates from ERP

### [Scenario 2: Priority Channel Allocation](#scenario-2-priority-channel-allocation)

A business wants to ensure their premium B2B channel always has stock before allocating to retail.

**Configuration:**

*   Create a rule with minimum allocation for B2B (e.g., maintain 20 units)
*   Add percent allocations for remaining inventory to retail channels
*   Rules ensure B2B gets priority before retail allocation

### [Scenario 3: Product-Specific Distribution](#scenario-3-product-specific-distribution)

Different product categories require different channel strategies. Electronics sell well online while apparel sells better in stores.

**Configuration:**

*   Create category-specific rules with different allocation percentages
*   Electronics rule: 80% online, 20% stores
*   Apparel rule: 30% online, 70% stores
*   Use priority to control which rule applies when products match multiple rules

* * *
