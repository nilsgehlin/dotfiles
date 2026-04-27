# Purchase Orders — Suppliers, Deliveries & Goods Reception — Purchase Orders

## Purchase Orders

# Purchase Orders

Manage procurement in Omnium — create purchase orders, track supplier deliveries, handle goods reception, and reserve customer orders against incoming stock.

Purchase orders in Omnium represent orders placed with suppliers to replenish inventory. They support the full procurement lifecycle — from creating orders based on reorder suggestions, through supplier confirmation, to goods reception at the warehouse.

Purchase orders can also represent **internal transfers** between warehouses, where one warehouse acts as the supplier for another.

* * *


## [In this section](#in-this-section)

[

API Reference

Create, update, and manage purchase orders via the API



](/docs/PurchaseOrders/purchase-order-api)[

Configuration

Purchase order types, statuses, and settings



](/docs/PurchaseOrders/purchase-order-config)[

Reservations

How customer orders are reserved against incoming purchase order stock



](/docs/PurchaseOrders/purchase-order-reservations)[

Suppliers

Supplier management, API, configuration, and ERP integration



](/docs/PurchaseOrders/Suppliers)[

Deliveries

Goods reception, delivery tracking, and warehouse receiving



](/docs/PurchaseOrders/Deliveries)

[

Previous

Identifiers in API Import

](/docs/Product/product-identifiers/api-import)[

Next

API Reference

](/docs/PurchaseOrders/purchase-order-api)

---


## API Reference

[Purchase Orders](/docs/PurchaseOrders)

# API Reference

Complete guide to the Purchase Order API in Omnium. Learn how to create, manage, and fulfill purchase orders, handle deliveries and goods reception, and integrate with your procurement workflows.


## [Introduction](#introduction)

Purchase orders in Omnium represent orders placed with suppliers to replenish inventory. They support the full procurement lifecycle — from creating orders based on reorder suggestions, through supplier confirmation, to goods reception at the warehouse.

Purchase orders can also represent **internal transfers** between warehouses, where one warehouse acts as the supplier for another.

### [Purchase order lifecycle](#purchase-order-lifecycle)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
    │     New      │────►│  Confirmed   │────►│  InProgress  │────►│  Completed   │
    │              │     │              │     │              │     │              │
    │ Create PO    │     │ Send to      │     │ Awaiting     │     │ All goods    │
    │ Add lines    │     │ supplier     │     │ delivery     │     │ received     │
    │ Validate     │     │ Set ETA      │     │              │     │              │
    └──────┬───────┘     └──────┬───────┘     └──────┬───────┘     └──────────────┘
           │                    │                    │
           │  ┌──────────────┐  │                    │
           └─►│   Canceled   │◄─┘                    │
              │              │◄──────────────────────┘
              │ PO no longer │
              │ needed       │
              └──────────────┘

A purchase order can be canceled from any status that is not marked as completed or read-only.

### [How purchase orders connect to other entities](#how-purchase-orders-connect-to-other-entities)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌─────────────────────┐
    │   Supplier          │ ◄─── SupplierId on PO
    │   (or Warehouse)    │
    └─────────┬───────────┘
              │ supplies
              ▼
    ┌─────────────────────┐       ┌─────────────────────┐
    │   Purchase Order    │──────►│   Delivery          │
    │                     │       │                     │
    │ • Line items        │       │ • Goods reception   │
    │ • Requested ETA     │       │ • Tracking info     │
    │ • Supplier info     │       │ • Invoice details   │
    │ • Tags & properties │       │ • Received qtys     │
    └─────────┬───────────┘       └─────────┬───────────┘
              │ reserves                     │ updates
              ▼                              ▼
    ┌─────────────────────┐       ┌─────────────────────┐
    │   Sales Orders      │       │   Inventory         │
    │                     │       │                     │
    │ Orders waiting for  │       │ Stock levels updated │
    │ incoming stock      │       │ on goods reception  │
    └─────────────────────┘       └─────────────────────┘

### [Base URL and authentication](#base-url-and-authentication)

All purchase order endpoints are available at:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    https://api.omnium.no/api/PurchaseOrders

Endpoints require one of two authorization roles:

Role

Access

**PurchaseOrderReadGroups**

GET endpoints, adding comments

**PurchaseOrderAdminGroups**

All write operations (POST, PUT, PATCH, DELETE)

* * *


## [Purchase order model](#purchase-order-model)

The `OmniumPurchaseOrder` model is used for creating, updating, and retrieving purchase orders. Below are the most important properties grouped by usage.

### [Key properties](#key-properties)

Property

Type

Description

**Id**

string

Unique purchase order ID. Auto-generated if not provided on creation.

**Status**

string

Current status (must match a configured purchase order status)

**SupplierId**

string

ID of the supplier

**SupplierName**

string

Supplier display name

**StoreId**

string

Receiving warehouse/store ID

**RequestedDeliveryDate**

DateTime?

When you need the goods delivered

**PurchaseOrderForm**

object

Contains line items and totals

**IsDelivery**

bool

When `true`, a delivery entity is created/synced with this PO

**DeliveryId**

string

ID of the associated delivery

### [Financial properties](#financial-properties)

Property

Type

Description

SubTotal

decimal

Sum of all line item totals

SubTotalExclTax

decimal

Subtotal excluding tax

TaxTotal

decimal

Total tax amount

Total

decimal

Grand total including tax

TotalExclTax

decimal

Grand total excluding tax

BillingCurrency

string

Currency code (e.g., "NOK", "EUR")

### [Supplier and purchaser](#supplier-and-purchaser)

Property

Type

Description

SupplierId

string

Supplier identifier

SupplierName

string

Supplier name

SupplierEmail

string

Supplier contact email

SupplierPhone

string

Supplier contact phone

SupplierWarehouseCode

string

Set for internal transfers — the warehouse supplying the goods

PurchaserId

string

ID of the person who created the PO

PurchaserName

string

Name of the person who created the PO

### [Metadata](#metadata)

Property

Type

Description

PurchaseOrderNumber

string

Human-readable PO number

ReferenceNumber

string

External reference (e.g., supplier's order number)

Name

string

Optional name/description for the PO

Origin

string

Where the PO was created from

MarketId

string

Associated market

Tags

List<string>

Tags for filtering and workflow routing

Properties

List<OmniumPropertyItem>

Custom key-value properties

ExternalIds

List<OmniumExternalId>

IDs from external systems (ERP, WMS, etc.)

Errors

List<OmniumEntityError>

Validation errors on the PO

VersionId

string

Optimistic concurrency version

Created

DateTime?

Creation timestamp

Modified

DateTime?

Last modification timestamp

### [Comments](#comments)

Property

Type

Description

PurchaseOrderNotes

List<OmniumComment>

Internal comments (visible only to your team)

PublicPurchaseOrderNotes

List<OmniumComment>

Public comments (can be sent to the supplier)

* * *


## [Purchase order line model](#purchase-order-line-model)

Each purchase order contains a `PurchaseOrderForm` with a list of `LineItems`. A line item represents a product being ordered from the supplier.

### [Essential line properties](#essential-line-properties)

Property

Type

Description

**LineItemId**

string

Unique line ID (auto-generated if not provided)

**Code**

string

Product SKU

**Quantity**

decimal

Quantity to order

**PlacedPrice**

decimal

Unit cost price including tax

**PlacedPriceExclTax**

decimal

Unit cost price excluding tax

**Currency**

string

Price currency

### [Quantity tracking](#quantity-tracking)

These fields track the fulfillment progress of each line:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌─────────────────────────────────────────────────────┐
    │                    Quantity: 100                     │
    │                                                     │
    │  ┌──────────────┐  ┌──────────┐  ┌───────────────┐ │
    │  │ Delivered: 60│  │Cancel: 10│  │ Remaining: 30 │ │
    │  └──────────────┘  └──────────┘  └───────────────┘ │
    └─────────────────────────────────────────────────────┘

Property

Type

Description

Quantity

decimal

Total quantity ordered

DeliveredQuantity

decimal

Quantity received via goods reception

CanceledQuantity

decimal

Quantity that has been canceled

CountedQuantity

decimal

Quantity verified during counting

### [Product information](#product-information)

Property

Type

Description

DisplayName

string

Product display name

Gtin

string

Global Trade Item Number (barcode)

Size

string

Product size

Color

string

Product color

Brand

string

Product brand

ImageUrl

string

Product image URL

SupplierSkuId

string

Supplier's own SKU reference

### [Pricing](#pricing)

Property

Type

Description

PlacedPrice

decimal

Unit price (before discounts)

PlacedPriceExclTax

decimal

Unit price excluding tax

ExtendedPrice

decimal

Total line price (quantity x price, with discounts)

ExtendedPriceExclTax

decimal

Extended price excluding tax

DiscountedPrice

decimal

Price after line-level discounts

LineItemDiscountAmount

decimal

Discount amount

TaxRate

decimal

Tax rate percentage

TaxTotal

decimal

Tax total for the line

### [Delivery and warehouse](#delivery-and-warehouse)

Property

Type

Description

DeliveryId

string

ID of the delivery this line belongs to

EstimatedTimeOfArrival

DateTime?

Expected arrival date for this line

WarehouseCode

string

Receiving warehouse (if different from the PO's store)

Location

string

Specific inventory location within the warehouse

UpdateStock

bool

Whether goods reception should update inventory

UpdateCostPrice

bool

Whether to update the product's cost price on receipt

### [Packaging and units](#packaging-and-units)

Property

Type

Description

Unit

string

Unit of measurement

SupplierPackagingQuantity

decimal?

D-Pack quantity (supplier's package size)

AllowSupplierPackageBreak

bool?

Whether partial packages can be ordered

SelectedUnit

string

Selected unit if product supports multiple units

SelectedUnitConversionFactor

decimal?

Conversion factor from default unit

SelectedUnitQuantity

decimal?

Quantity expressed in the selected unit

IsPackage

bool

Whether this is a bundled/package product

Components

List<OmniumProductComponent>

Component products in a package

### [Virtual warehouse allocations](#virtual-warehouse-allocations)

For warehouses with virtual stock locations (VSL), line items can be pre-allocated to specific locations:

Property

Type

Description

VirtualWarehouseAllocations

List<OmniumVirtualWarehouseAllocation>

Allocations to virtual stock locations

AllocateBasedOnRules

bool

Auto-allocate to VSLs using inventory rules

IsDisabledForAllocation

bool

Exclude this line from allocation

Each `OmniumVirtualWarehouseAllocation` contains:

Property

Type

Description

Id

string

Allocation ID

WarehouseCode

string

Virtual warehouse code

Quantity

decimal

Allocated quantity

DeliveredQuantity

decimal

Quantity delivered to this location

* * *


## [Creating a purchase order](#creating-a-purchase-order)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders

Creates a new purchase order. If `Id` is not provided, Omnium generates one automatically.

### [Minimal example](#minimal-example)

The simplest purchase order needs a supplier, a receiving store, and at least one line item:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "supplierId": "supplier-acme",
      "supplierName": "Acme Supplies",
      "storeId": "warehouse-central",
      "billingCurrency": "NOK",
      "status": "New",
      "requestedDeliveryDate": "2026-03-15T00:00:00Z",
      "purchaseOrderForm": {
        "lineItems": [
          {
            "code": "WIDGET-001",
            "displayName": "Standard Widget",
            "quantity": 500,
            "placedPrice": 12.50,
            "placedPriceExclTax": 10.00,
            "taxRate": 25,
            "currency": "NOK"
          },
          {
            "code": "WIDGET-002",
            "displayName": "Premium Widget",
            "quantity": 200,
            "placedPrice": 25.00,
            "placedPriceExclTax": 20.00,
            "taxRate": 25,
            "currency": "NOK"
          }
        ]
      }
    }

**Response:** Returns the created `OmniumPurchaseOrder` with auto-generated `Id`, `LineItemId` values, and calculated totals.

### [Creating an internal transfer](#creating-an-internal-transfer)

Internal transfers move stock between your own warehouses. Set `SupplierWarehouseCode` to the source warehouse:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "supplierWarehouseCode": "warehouse-central",
      "storeId": "store-oslo",
      "status": "New",
      "purchaseOrderForm": {
        "lineItems": [
          {
            "code": "WIDGET-001",
            "quantity": 50,
            "placedPrice": 12.50,
            "placedPriceExclTax": 10.00,
            "taxRate": 25,
            "currency": "NOK"
          }
        ]
      }
    }

### [Creating with a delivery](#creating-with-a-delivery)

When `IsDelivery` is set to `true`, Omnium automatically creates a `Delivery` entity linked to the purchase order. This enables goods reception tracking:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "supplierId": "supplier-acme",
      "storeId": "warehouse-central",
      "status": "New",
      "isDelivery": true,
      "purchaseOrderForm": {
        "lineItems": [
          {
            "code": "WIDGET-001",
            "quantity": 500,
            "placedPrice": 12.50,
            "placedPriceExclTax": 10.00,
            "taxRate": 25,
            "currency": "NOK"
          }
        ]
      }
    }

* * *


## [Retrieving purchase orders](#retrieving-purchase-orders)

### [Get a single purchase order](#get-a-single-purchase-order)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/PurchaseOrders/{purchaseOrderId}

Returns the full purchase order with all line items, properties, and metadata.

### [Get extended purchase order](#get-extended-purchase-order)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/PurchaseOrders/Extended/{purchaseOrderId}

Returns the purchase order along with related store and supplier details, plus extended line items that include customer order references. This is useful when you need to see which customer orders are waiting for items on this PO.

**Response structure:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "purchaseOrder": { /* full OmniumPurchaseOrder */ },
      "supplier": { /* OmniumSupplier with contact info */ },
      "store": { /* OmniumStore with warehouse details */ },
      "purchaseOrderLines": [
        {
          "purchaseOrderLine": { /* line item details */ },
          "customerOrderNumber": "ORD-12345"
        }
      ]
    }

### [Search purchase orders](#search-purchase-orders)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/Search

Search and filter purchase orders with pagination. Supports text search, status filtering, date ranges, and more.

**Example: Find all confirmed POs from a specific supplier**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "supplierId": "supplier-acme",
      "selectedStatuses": ["Confirmed", "InProgress"],
      "take": 20,
      "page": 0,
      "sortOrder": "CreatedDescending"
    }

**Example: Find POs containing a specific product**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "productNumbers": ["WIDGET-001", "WIDGET-002"],
      "selectedStatuses": ["New"],
      "take": 50,
      "page": 0
    }

**Example: Find POs by date range and tags**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "createdFrom": "2026-01-01T00:00:00Z",
      "createdTo": "2026-01-31T23:59:59Z",
      "tags": ["Urgent"],
      "take": 100,
      "page": 0
    }

**Response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "totalHits": 42,
      "result": [
        { /* OmniumPurchaseOrder */ },
        { /* OmniumPurchaseOrder */ }
      ]
    }

#### [Available search parameters](#available-search-parameters)

Parameter

Type

Description

SearchText

string

Free-text search across PO fields

OrderNumber

string

Search by PO number

Email

string

Search by supplier email

Phone

string

Search by supplier phone

SupplierId

string

Filter by supplier ID

SupplierName

string

Filter by supplier name

SupplierWarehouseCode

string

Filter by supplier warehouse (internal transfers)

OrderType

string

`"PurchaseOrder"` or `"InternalTransfer"`

SelectedStatuses

List<string>

Filter by one or more statuses

SelectedStores

List<string>

Filter by receiving store names

ProductNumbers

List<string>

Filter by product SKUs

Tags

List<string>

Include POs with these tags

ExcludedTags

List<string>

Exclude POs with these tags

ExternalIds

List<string>

Search by external ID values

CreatedFrom / CreatedTo

DateTime?

Creation date range

ModifiedFrom / ModifiedTo

DateTime?

Modification date range

RequestedDeliveryDateFrom / RequestedDeliveryDateTo

DateTime?

Delivery date range

Urgent

bool

Only include urgent POs

Take

int

Page size

Page

int

Page number (0-based)

SortOrder

string

Sort order (see below)

#### [Sort order options](#sort-order-options)

Value

Description

IdAscending / IdDescending

Sort by purchase order ID

StatusAscending / StatusDescending

Sort by status

SupplierAscending / SupplierDescending

Sort by supplier name

CreatedAscending / CreatedDescending

Sort by creation date

EtaAscending / EtaDescending

Sort by estimated delivery date

ReferenceNumberAscending / ReferenceNumberDescending

Sort by reference number

### [Scroll through large result sets](#scroll-through-large-result-sets)

For processing large volumes of purchase orders, use the scroll API instead of paginated search. The scroll API maintains a cursor for efficient iteration.

**Step 1: Initialize the scroll**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/PurchaseOrders/Scroll

Request body is the same as the search endpoint (but `Page` is ignored).

**Step 2: Continue scrolling**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/PurchaseOrders/Scroll/{scrollId}

Use the `scrollId` from the previous response to get the next batch. Continue until the result set is empty.

**Response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "scrollId": "DXF1ZXJ5QW5kRmV0Y2g...",
      "totalHits": 5000,
      "result": [
        { /* OmniumPurchaseOrder */ }
      ]
    }

* * *
