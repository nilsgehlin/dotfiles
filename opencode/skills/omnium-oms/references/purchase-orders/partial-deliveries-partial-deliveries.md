# Purchase Orders — Suppliers, Deliveries & Goods Reception — [Partial deliveries](#partial-deliveries)

## [Partial deliveries](#partial-deliveries)

When a purchase order delivery only partially fulfills the expected quantity, Omnium handles this based on the `OrderTypesWithAutomaticLineSplitting` [configuration](/docs/PurchaseOrders/purchase-order-config#delivery-settings). When enabled for an order type, Omnium automatically splits the order line so that the received portion can proceed to fulfillment while the remaining quantity stays allocated to the purchase order.

[

Previous

Configuration

](/docs/PurchaseOrders/purchase-order-config)[

Next

Suppliers

](/docs/PurchaseOrders/Suppliers)

---


## Suppliers

[Purchase Orders](/docs/PurchaseOrders)

# Suppliers

Learn about suppliers in Omnium — how they relate to purchase orders, products, lead times, and inventory replenishment.


## [What Is a Supplier?](#what-is-a-supplier)

A **Supplier** in Omnium represents a company or entity that provides goods to your business. Suppliers are a central part of the procurement workflow and connect directly to [purchase orders](/docs/PurchaseOrders/purchase-order-api) and [products](/docs/Product).

Every purchase order in Omnium references a supplier, and products can be linked to one or more suppliers. This relationship enables Omnium to track where goods come from, manage lead times, and generate replenishment suggestions.

> A supplier can be an external vendor, a wholesaler, or even an internal store that fulfills stock transfers between locations.

* * *


## [Suppliers and Purchase Orders](#suppliers-and-purchase-orders)

When a purchase order is created, it is linked to a supplier via `SupplierId`. The supplier's name, email, and phone number are stored directly on the purchase order for quick reference.

For **internal transfers** between your own warehouses or stores, the supplier can reference an Omnium store using the `OmniumStoreId` field. This makes it possible to use the purchase order workflow for internal stock movements, where one of your own stores acts as the supplier. The `SupplierWarehouseCode` on the purchase order identifies the source warehouse for the transfer.

* * *


## [Suppliers and Products](#suppliers-and-products)

Products can be associated with suppliers in two ways:

### [Primary Supplier](#primary-supplier)

Each product has a `SupplierId` and `SupplierName` field that identifies the product's main supplier.

### [Additional Suppliers](#additional-suppliers)

A product can also have a list of **additional suppliers**, each with its own details:

Property

Description

`SupplierId`

Unique identifier for the supplier

`SupplierName`

Supplier display name

`SupplierSkuId`

The product's SKU in the supplier's own system

This is useful when the same product can be sourced from multiple vendors, each using their own article numbers.

* * *


## [Lead Time](#lead-time)

**Lead time** is the number of days from when a purchase order is placed until the goods are expected to arrive. In Omnium, lead time is managed at the supplier level and propagated to products:

*   **`DefaultLeadTime`** — The supplier's standard delivery time in days.
*   **`DefaultLeadTimeSafetyMarginDays`** — An additional buffer (in days) added on top of the lead time to account for delays or variability.

When a supplier's lead time is updated, Omnium automatically propagates the new value to all products linked to that supplier. This keeps product-level lead time data in sync without requiring manual updates on each product.

Lead time values are used by Omnium's inventory and replenishment features to calculate when to reorder stock and when incoming goods are expected to arrive.

* * *


## [Order Interval](#order-interval)

The **`DefaultOrderIntervalDays`** property defines the typical purchasing cycle for a supplier — how many days between each order you typically place.

This value is used together with lead time when calculating reorder suggestions. It represents how many days of demand you want each purchase order to cover.

* * *


## [Logistics and Terms](#logistics-and-terms)

Suppliers support several properties for managing commercial and shipping terms:

Property

Description

`Incoterms`

The delivery terms agreement (e.g., FOB, DDP, EXW)

`ShippingProvider`

The supplier's standard freight carrier (e.g., PostNord, DHL)

`ShipmentCost`

Default shipping cost for orders from this supplier

`PaymentTerms`

Agreed payment terms in days (e.g., 30 = Net 30)

`PreferredCurrency`

Currency for transactions with this supplier (ISO code)

`PreferredLanguage`

Language for communication with this supplier (ISO code)

* * *


## [Reorder Suggestions](#reorder-suggestions)

Omnium can automatically calculate **reorder suggestions** for each supplier. These suggestions are computed from analytics data and help you decide when and how much to order.

Reorder suggestions are grouped by **warehouse** and include:

Property

Description

`WarehouseCode`

The warehouse the suggestion applies to

`Quantity`

Current quantity needing replenishment

`ReorderQuantity`

Quantity that should be reordered

`SuggestedReorderQuantity`

System-calculated recommended order quantity

`OrdersToPurchase`

Number of pending orders driving the demand

`Count`

Number of products included in the suggestion

Reorder suggestions are recalculated periodically by a scheduled task and stored on the supplier record. They can also be triggered manually from the Omnium UI.

You can filter and search suppliers by their reorder suggestions, making it easy to identify which suppliers need purchase orders placed.

* * *


## [Store and Access Control](#store-and-access-control)

Suppliers can be linked to specific **stores** and **store groups** using the `StoreIds` and `StoreGroupIds` properties. This serves two purposes:

1.  **Organizational grouping** — Associate a supplier with the stores it serves.
2.  **Access control** — When the **Local Supplier** setting is enabled, non-admin users will only see suppliers that are linked to their assigned stores. This restricts visibility so that store-level users only work with relevant suppliers.

When local supplier mode is active and a new supplier is created by a non-admin user, Omnium automatically assigns the supplier to the user's available stores or store groups, depending on configuration.

* * *


## [Contact Persons](#contact-persons)

A supplier can have multiple **contact persons**, each with their own name, email, phone number, and role. This allows you to maintain a directory of contacts for different purposes (e.g., ordering, invoicing, support).

* * *


## [Addresses](#addresses)

Suppliers support both a **primary address** and a list of **additional addresses**. Additional addresses can represent different locations such as billing addresses, delivery addresses, or warehouse locations.

* * *


## [External IDs](#external-ids)

The `ExternalIds` list allows you to store identifiers from external systems (e.g., ERP supplier numbers, accounting system IDs). Each external ID has a `Type` and `Value`, making it easy to maintain cross-system references.

* * *


## [Tags and Custom Properties](#tags-and-custom-properties)

*   **Tags** — Free-text labels for categorization and filtering. Tags make it easy to group suppliers by type, region, or any other criteria relevant to your business.
*   **Properties** — Key-value pairs for storing custom data. These can be pre-configured with default properties in the supplier settings, and are fully searchable.

* * *


## [Version History](#version-history)

Omnium maintains a version history for supplier records. Each time a supplier is updated, a new version is created. You can retrieve previous versions to audit changes over time. The current version is identified by `VersionId`, and the prior version by `PreviousVersionId`.

* * *


## [Supplier Model](#supplier-model)

Property

Type

Description

`Id`

string

Unique supplier identifier

`Name`

string

Supplier display name

`OmniumStoreId`

string

Linked Omnium store ID (for internal transfers)

`TaxId`

string

Tax registration / VAT number

`Email`

string

Primary email address

`Phone`

string

Primary phone number

`Address`

Address

Primary address

`Addresses`

List<Address>

Additional addresses (billing, delivery, etc.)

`Contacts`

List<ContactPerson>

Contact persons at the supplier

`PreferredLanguage`

string

ISO language code

`PreferredCurrency`

string

ISO currency code

`DefaultLeadTime`

int?

Standard lead time in days

`DefaultLeadTimeSafetyMarginDays`

int?

Safety buffer in days added to lead time

`DefaultOrderIntervalDays`

int?

Purchasing cycle interval in days

`PaymentTerms`

int?

Payment terms in days

`Incoterms`

string

Delivery terms (FOB, DDP, EXW, etc.)

`ShippingProvider`

string

Standard freight carrier

`ShipmentCost`

decimal

Default shipping cost

`StoreIds`

List<string>

Linked store IDs

`StoreGroupIds`

List<string>

Linked store group IDs

`Tags`

List<string>

Categorization tags

`Properties`

List<PropertyItem>

Custom key-value properties

`ExternalIds`

List<ExternalId>

External system identifiers

`VersionId`

string

Current version identifier

`PreviousVersionId`

string

Previous version identifier

`Created`

DateTime?

Record creation timestamp

`Modified`

DateTime?

Last modification timestamp

[

Previous

Reservations

](/docs/PurchaseOrders/purchase-order-reservations)[

Next

Configuration

](/docs/PurchaseOrders/Suppliers/supplier-config)

---


## Integration Guide

[Purchase Orders](/docs/PurchaseOrders)[Suppliers](/docs/PurchaseOrders/Suppliers)

# Integration Guide

Step-by-step guide for integrating supplier data from an external system (such as M3, Dynamics 365, or SAP) into Omnium using the Suppliers API.


## [Overview](#overview)

This guide walks through how to synchronize supplier data from an external ERP system into Omnium using the public Suppliers API. It covers the most common integration pattern: pushing supplier master data from the ERP into Omnium, keeping both systems in sync.

The guide uses a generic ERP as the example, but the same approach applies to any system — M3, Dynamics 365, SAP, or custom solutions.

* * *


## [Key concepts](#key-concepts)

### [Upsert behavior](#upsert-behavior)

The `PUT /api/Suppliers` endpoint is an **upsert** — it creates the supplier if it doesn't exist, or updates it if it does. You don't need separate logic for insert vs. update.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Suppliers
    ├─ Supplier ID exists?   → Update existing record
    └─ Supplier ID missing?  → Create new record

This means your integration can use the same endpoint and payload for both initial import and ongoing synchronization.

### [Full replacement](#full-replacement)

The update is a **full replacement**. Any fields omitted from the request body are reset to their default values (null, 0, or empty). Always include all fields you want to keep.

If you only want to update a few fields, first read the existing supplier with `GET /api/Suppliers/{id}`, merge your changes, then send the full object back with `PUT`.

### [External IDs for cross-referencing](#external-ids-for-cross-referencing)

Use the `ExternalIds` field to store the supplier's ID in your ERP system. This makes it easy to look up suppliers in Omnium by their ERP identifier.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "externalIds": [
      { "providerName": "M3", "id": "Y10500" }
    ]

Property

Description

`providerName`

Name of the external system (e.g., `M3`, `SAP`, `Dynamics365`)

`id`

The supplier's identifier in that system

* * *


## [Recommended payload](#recommended-payload)

Only the `id` field is required. All other fields are optional. Below is a payload with the fields most commonly used in ERP integrations.

### [Minimal example](#minimal-example)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Suppliers
     
    {
      "id": "SUPPLIER-40100",
      "name": "Pacific Coast Distributors",
      "externalIds": [
        { "providerName": "M3", "id": "Y40100" }
      ]
    }

### [Full example with common fields](#full-example-with-common-fields)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Suppliers
     
    {
      "id": "SUPPLIER-40100",
      "name": "Pacific Coast Distributors LLC",
      "taxId": "82-3456789",
      "email": "purchasing@paccoast.com",
      "phone": "+1-503-555-0172",
      "preferredCurrency": "USD",
      "preferredLanguage": "en",
      "defaultLeadTime": 10,
      "defaultLeadTimeSafetyMarginDays": 3,
      "defaultOrderIntervalDays": 14,
      "paymentTerms": 30,
      "incoterms": "FOB",
      "shippingProvider": "UPS",
      "shipmentCost": 45.00,
      "address": {
        "name": "Pacific Coast Distributors LLC",
        "line1": "2200 NW Industrial Ave",
        "line2": "Suite 300",
        "city": "Portland",
        "state": "OR",
        "postalCode": "97209",
        "countryCode": "US",
        "countryName": "United States"
      },
      "contacts": [
        {
          "firstName": "Sarah",
          "lastName": "Mitchell",
          "email": "sarah.mitchell@paccoast.com",
          "phone": "+1-503-555-0180",
          "roles": ["Sales"],
          "isPrimaryContact": true
        },
        {
          "firstName": "James",
          "lastName": "Rivera",
          "email": "james.rivera@paccoast.com",
          "phone": "+1-503-555-0185",
          "roles": ["Logistics"]
        }
      ],
      "externalIds": [
        { "providerName": "M3", "id": "Y40100" }
      ],
      "tags": ["domestic", "preferred"],
      "storeIds": ["warehouse-west", "warehouse-central"]
    }

### [Field reference for ERP integrations](#field-reference-for-erp-integrations)

The table below highlights the fields most relevant for ERP synchronization. For the complete model, see the [API Reference](/docs/PurchaseOrders/Suppliers/supplier-api#supplier-model).

Field

Type

Description

**id**

string

**Required.** Unique supplier identifier. Use the same ID consistently across syncs.

**name**

string

Supplier company name

**taxId**

string

Tax ID, EIN, or VAT number

**email**

string

Primary email for order communication

**phone**

string

Primary phone number

**preferredCurrency**

string

ISO currency code (e.g., `USD`, `EUR`, `GBP`)

**preferredLanguage**

string

ISO language code (e.g., `en`, `de`, `fr`)

**defaultLeadTime**

int

Standard delivery time in days

**paymentTerms**

int

Payment terms in days (e.g., `30` for Net 30)

**incoterms**

string

Delivery terms (e.g., `FOB`, `DDP`, `EXW`, `CIF`)

**address**

object

Primary address (see [Address model](/docs/PurchaseOrders/Suppliers/supplier-api#address-model))

**contacts**

array

Contact persons (see [Contact model](/docs/PurchaseOrders/Suppliers/supplier-api#contact-person-model))

**externalIds**

array

Cross-references to ERP and other systems

* * *


## [Integration patterns](#integration-patterns)

### [Pattern 1: Full sync (initial import)](#pattern-1-full-sync-initial-import)

For the initial import of all suppliers, use `PUT /api/Suppliers/UpdateMany` to send suppliers in batches.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Suppliers/UpdateMany
     
    [
      {
        "id": "SUPPLIER-40100",
        "name": "Pacific Coast Distributors LLC",
        "email": "purchasing@paccoast.com",
        "preferredCurrency": "USD",
        "defaultLeadTime": 10,
        "externalIds": [
          { "providerName": "M3", "id": "Y40100" }
        ]
      },
      {
        "id": "SUPPLIER-40200",
        "name": "Great Lakes Supply Co",
        "email": "orders@greatlakessupply.com",
        "preferredCurrency": "USD",
        "defaultLeadTime": 7,
        "externalIds": [
          { "providerName": "M3", "id": "Y40200" }
        ]
      },
      {
        "id": "SUPPLIER-40300",
        "name": "Southeastern Materials Inc",
        "email": "sales@sematerials.com",
        "preferredCurrency": "USD",
        "defaultLeadTime": 14,
        "externalIds": [
          { "providerName": "M3", "id": "Y40300" }
        ]
      }
    ]

All supplier IDs in a single `UpdateMany` request must be unique. Duplicate IDs will return a `400 Bad Request` error.

### [Pattern 2: Incremental sync (ongoing updates)](#pattern-2-incremental-sync-ongoing-updates)

For ongoing synchronization, send only the suppliers that have changed since the last sync. Use the single `PUT /api/Suppliers` endpoint for individual updates, or `UpdateMany` for batches.

The recommended flow:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    1. ERP detects changed suppliers since last sync
    2. For each changed supplier:
       a. GET /api/Suppliers/{id}         → Read current state from Omnium
       b. Merge ERP changes onto the existing object
       c. PUT /api/Suppliers              → Save the merged result
    3. Record the sync timestamp for next run

If you control all supplier data from the ERP (i.e., Omnium users don't edit supplier fields that the ERP also manages), you can skip the read-merge step and push directly.

### [Pattern 3: Looking up suppliers by ERP ID](#pattern-3-looking-up-suppliers-by-erp-id)

To find a supplier in Omnium using the ERP system's ID:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Suppliers/Search
     
    {
      "externalIds": ["Y40100"],
      "take": 1,
      "page": 1
    }

This searches across all `ExternalIds` on all suppliers and returns matches regardless of `providerName`. If you have multiple external systems, the supplier ID values should be unique across providers, or you can narrow results by checking the `providerName` in the response.

* * *


## [Choosing a supplier ID strategy](#choosing-a-supplier-id-strategy)

The `id` field is the primary key in Omnium. Choose a consistent strategy:

Strategy

Example

Pros

Cons

Use the ERP ID directly

`Y40100`

Simple, no mapping needed

May conflict if multiple ERPs exist

Prefix with system name

`M3-Y40100`

Avoids conflicts across systems

Slightly longer IDs

Generate a stable ID

`supplier-40100`

Clean, system-agnostic

Requires mapping table or ExternalIds

Regardless of strategy, always store the ERP ID in `ExternalIds` so you can search for suppliers by their ERP identifier.

* * *


## [Error handling](#error-handling)

Status

Meaning

Action

`200 OK`

Supplier created or updated

Success — continue

`400 Bad Request`

Missing `id` field, empty body, or duplicate IDs in batch

Check the error message and fix the payload

`401 Unauthorized`

Invalid or missing API token

Verify authentication credentials

`403 Forbidden`

Token lacks **SupplierAdmin** role

Check API user role assignments

* * *


## [Tips for a robust integration](#tips-for-a-robust-integration)

*   **Always include `externalIds`** — This is the easiest way to maintain cross-references between systems.
*   **Use `UpdateMany` for batch imports** — More efficient than individual calls when syncing multiple suppliers.
*   **Handle the full-replacement behavior** — If Omnium users also edit suppliers, read before writing to avoid overwriting their changes.
*   **Set `defaultLeadTime`** — This drives Omnium's purchase order and reorder suggestion features. Changes automatically propagate to all linked products.
*   **Monitor `Modified` timestamps** — Use the [Search endpoint](/docs/PurchaseOrders/Suppliers/supplier-api#search-suppliers) with `ModifiedFrom` to detect changes made in Omnium that need to sync back to the ERP.

[

Previous

API Reference

](/docs/PurchaseOrders/Suppliers/supplier-api)[

Next

Deliveries

](/docs/PurchaseOrders/Deliveries)