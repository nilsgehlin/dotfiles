# Products — Catalog, Categories & Assets — [Order Status Handling](#order-status-handling)

## [Order Status Handling](#order-status-handling)

Gift cards affect fulfillment and status updates. The system differentiates between **virtual** and **physical** shipments.

### [Virtual shipment for gift cards](#virtual-shipment-for-gift-cards)

*   The shipment method is set to **VirtualShipment** (see _Shipping Method_).
*   The order status is updated to **VirtualShip** after all gift cards are successfully created.

### [Order status transitions](#order-status-transitions)

*   **Gift card–only orders**: Status is automatically set to **VirtualShip** once the gift cards are created.
*   **Mixed orders** (gift cards + physical products): Gift cards are processed immediately; physical items follow the standard shipping flow.

### [Partial shipments](#partial-shipments)

For mixed orders, the system may create a **partial shipment** for the gift cards so customers receive their virtual cards immediately, while physical items continue through normal fulfillment.


## [Configuring Gift Card Products](#configuring-gift-card-products)

1.  **Create a virtual gift card product**  
    Define a product with 'IsVirtual' set to 'true'
    
2.  **Set the gift card SKU in settings**  
    Go to **Settings → Orders → Gift Cards** and enter the SKU for your gift card product(s).
    


## [4\. Order Status: `VirtualShip`](#4-order-status-virtualship)

Since gift cards will be "shipped" immediately and are a digital product, we need a "virtual" shipping order status.

Gift cards are considered a **virtual shipment** and require a dedicated order status:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "name": "VirtualShip",
      "displayName": "VirtualShip",
      "order": 0,
      "condition": "Delivery",
      "isDeliveredStatus": true,
      "shipmentStatusUpdate": "Released",
      "workflowSteps": [
        {
          "name": "CapturePayments",
          "active": true,
          "translateKey": "WorkflowStep_CapturePayments"
        },
        {
          "name": "CompleteShipment",
          "active": true,
          "translateKey": "WorkflowStep_CompleteShipment"
        },
        {
          "name": "Notification",
          "active": true,
          "translateKey": "WorkflowStep_Notification"
        },
        {
          "name": "RemoveAuthorizationExpires",
          "active": true,
          "isInvisible": true
        }
      ],
      "translateKey": "VirtualShippedCompleted"
    }

This status completes the order lifecycle for digital shipments (gift cards). The workflow steps (such as notifications) in the example are typical steps for this status, same as on your other completed statuses. The key workflow steps include:

*   **CapturePayments** – captures any pending payments.
*   **CompleteShipment** – completes the virtual shipment.
*   **Notification** – triggers customer notifications.
*   **ExportOrder** – optionally exports the order to an external system.


## [5\. Shipping Method](#5-shipping-method)

Define a **VirtualShipment** shipping method which will be used for gift cards (or other digital products):

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "shippingGateway": "Empty",
      "shippingMethodName": "VirtualShipment",
      "deliveryTime": "Umiddelbart",
      "vueTemplate": "standard-shipment-view",
      "shipmentDeliveryType": "Virtual",
      "label": "Virtuell frakt"
    }

*   `shipmentDeliveryType` must be set to `Virtual`.
*   `deliveryTime` is typically set to _immediate_ (`Umiddelbart`).


## [Summary](#summary)

To enable gift cards in Omnium:

1.  Add the **GiftCard** payment method.
2.  Configure workflow steps (`CreateAndSendGiftCards` and `ReserveGiftCards`) for order status `New`.
3.  Define order settings (`giftCardSku` and validity period).
4.  Add a `VirtualShip` order status with the required workflow steps.
5.  Configure a **virtual shipping method**.


## [Buying Gift Cards](#buying-gift-cards)

Gift cards can be added to carts the same way standard products are added to the cart, but if you want the gift card price to be dynamic (set by the customer for instance), you will need to add the order line using the gift card SKU and the selected price:

**API Endpoint:** `/api/Cart/{cartId}/OrderLines` → [Documentation](https://apitest.omnium.no/documentation/index.html#/Carts%20%7C%20Add/CartAddOrderLineToCart)

You can also specify additional properties on the order:

**Properties:** _GiftCardReceiverEmail, GiftCardReceiverMessage, GiftCardReceiverMessageHeading, GiftCardReceiverName_

**Note:** If you are only buying a gift card, the shipment added to cart should be of type "VirtualShipment". If buying gift card and other items, the workflow will automatically handle this and create a split shipment for the gift card.


## [Paying with Gift Cards](#paying-with-gift-cards)

*   **Validate gift card balance** using `/api/GiftCard​/{code}` → [Documentation](https://apitest.omnium.no/documentation/index.html#/Orders%20%7C%20Gift%20Cards/GiftCardGet)
*   **Add gift card payment to cart:** `/api/Cart/{cartId}/AddGiftCard/{giftCardCode}`
*   \*\* (Optionally) Remove gift card payment from cart:\*\* `/api/Cart/{cartId}/RemoveGiftCard/{giftCardCode}`

[

Previous

Component API Reference

](/docs/Product/product-components/api-reference)[

Next

Product Identifiers

](/docs/Product/product-identifiers)

---


## Local Products

[Product](/docs/Product)

# Local Products

Store-specific product assortments with localized editing and access control

Local Products is a feature that enables physical stores to manage their own product assortment independently from the global catalog. Store staff can create and edit products that are only visible and editable by users with access to the stores where the products are sold.

* * *


## [Overview](#overview)

In a multi-store retail environment, individual stores often need to manage products that are unique to their location — such as locally sourced goods, store-exclusive items, or products with store-specific pricing. The Local Products feature provides this capability while maintaining central oversight for administrators.

Aspect

Global Products

Local Products

Visibility

All users with product access

Only users with access to assigned stores

Editing

Any user with product edit permissions

Only users with access to assigned stores

Store assignment

Optional

Required — defines who can see and edit

Creation default

Standard for admin users

Automatic for non-admin users (when enabled)

Cost prices

Shared across stores

Can be separated per store

* * *


## [How It Works](#how-it-works)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Product Created
          │
          ▼
    ┌─────────────────────────────────┐
    │  IsLocalProduct = true?         │
    │  ┌─── No ──→ Standard product   │
    │  └─── Yes ──→ Continue ↓        │
    └─────────────────────────────────┘
          │
          ▼
    ┌─────────────────────────────────┐
    │  Assign StoreIds                │ ← From user's available stores
    │  (expands to include all stores │    or explicitly selected
    │   in same store groups)         │
    └─────────────────────────────────┘
          │
          ▼
    ┌─────────────────────────────────┐
    │  Access Control Applied         │
    │  • User must have access to at  │
    │    least one assigned store     │
    │  • Admins bypass all checks     │
    └─────────────────────────────────┘
          │
          ▼
    ┌─────────────────────────────────┐
    │  Search & UI Filtering          │
    │  • Products filtered by user's  │
    │    available stores             │
    │  • Non-editable products can    │
    │    optionally be shown          │
    └─────────────────────────────────┘

* * *


## [Key Product Properties](#key-product-properties)

Property

Type

Description

`isLocalProduct`

bool?

Flag marking the product as local. When `true`, store-based access control is enforced

`storeIds`

List<string>

Store IDs where this local product is available and editable

### [Example Product](#example-product)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "local-bread-001_no",
      "productId": "local-bread-001",
      "name": "Artisan Sourdough Bread",
      "isLocalProduct": true,
      "storeIds": ["oslo-grunerløkka", "oslo-majorstuen"],
      "marketIds": ["no"]
    }

* * *


## [Store Group Expansion](#store-group-expansion)

When a local product is assigned to a store, Omnium automatically expands the assignment to include **all stores in the same store group**. This ensures consistent availability across related locations.

For example, if store `oslo-grunerløkka` belongs to the store group `oslo-stores`, and that group also contains `oslo-majorstuen` and `oslo-sentrum`, all three stores are automatically assigned.

Store group expansion only applies to stores that the current user has access to. Existing assignments to stores outside the user's access are preserved and cannot be accidentally removed.

* * *


## [Search Filtering](#search-filtering)

When searching products with the local products filter enabled, the following parameters are available:

Parameter

Type

Description

`isLocalProduct`

bool?

Filter for local products only (`true`) or non-local products only (`false`)

`showNonEditableLocalProducts`

bool?

Include local products the user can see (via market access) but cannot edit

### [Example Search](#example-search)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Products/Search
    Content-Type: application/json
     
    {
      "isLocalProduct": true,
      "query": "sourdough"
    }

When `isLocalProduct` is `true` in a search request, the system automatically restricts results to stores the current user has access to — no additional store filtering is needed.

* * *


## [Variant Behavior](#variant-behavior)

Local product settings **cascade to variants**. When a parent product is marked as local and assigned to stores, the same assignments are applied to all its variants. This ensures consistent access control across the entire product family.

* * *


## [Feature Overview](#feature-overview)

Feature

Documentation

**Configuration**

[Enabling local products and related settings](/docs/Product/local-products/configuration)

**Access Control**

[User permissions, admin bypass, and UI behavior](/docs/Product/local-products/access-control)

**Cost Prices**

[Store-specific cost price management](/docs/Product/local-products/cost-prices)

* * *


## [Quick Start](#quick-start)

### [1\. Enable the Feature](#1-enable-the-feature)

Navigate to **Settings → Products** and enable **Local Products** under the "Assortment and Stores" section.

### [2\. Create a Local Product](#2-create-a-local-product)

Create a new product. If the user is not an administrator, the product is automatically marked as local and assigned to the user's available stores.

Administrators can manually mark any product as local by enabling the **Is Local** checkbox in the product editor.

### [3\. Assign to Stores](#3-assign-to-stores)

Select which stores should carry the product. The store list is limited to stores the user has access to. Store group expansion is applied automatically.

### [4\. Manage Access](#4-manage-access)

Only users with access to at least one of the product's assigned stores can view and edit it. Other users will see the product with editing disabled (if `showNonEditableLocalProducts` is enabled) or not at all.

* * *


## [Best Practices](#best-practices)

### [When to Use Local Products](#when-to-use-local-products)

*   **Locally sourced items** that are unique to certain store locations
*   **Store-exclusive promotions** or products
*   **Franchise models** where each location manages its own catalog
*   **Pop-up or seasonal store items** available only at specific locations

### [When NOT to Use Local Products](#when-not-to-use-local-products)

*   Products that should be available in all stores — use standard global products instead
*   Assortment that is better managed through [Store/Market IDs](/docs/Product/product-assortment/store-market-ids) or [Assortment Codes](/docs/Product/product-assortment/assortment-codes)
*   Scenarios where you only need to control visibility, not editing permissions

### [Recommendations](#recommendations)

1.  **Plan store groups carefully** — store group expansion means assignments can cascade
2.  **Use the search filter** to quickly switch between local and global product views
3.  **Combine with cost prices** for full store-level product management
4.  **Admins retain full access** — use admin accounts for cross-store product management

* * *


## [Troubleshooting](#troubleshooting)

Problem

Cause

Solution

User can't see a local product

User doesn't have access to any of the product's stores

Grant user access to the relevant store, or add the user's store to the product

User sees product but can't edit it

Product is in a market the user can access, but not in their stores

Assign product to user's store, or enable `showNonEditableLocalProducts` for read-only access

Product was automatically marked as local

Non-admin users automatically create local products when feature is enabled

This is expected behavior — admins can unmark the product if needed

Store assignments include unexpected stores

Store group expansion added related stores

Review store group configuration in **Settings → Stores**

Local product filter not visible

Feature is not enabled or user is admin

Enable `IsLocalProductsEnabled` in tenant settings — admins see all products and don't need the filter

[

Previous

B2B Pricing and Assortment Control

](/docs/Product/product-assortment/b2b-assortment)[

Next

Configuration

](/docs/Product/local-products/configuration)

---


## Product Assets

[Product](/docs/Product)

# Product Assets

Manage product images, documents, and media files in Omnium with automatic resizing and CDN delivery.

Product assets in Omnium provide a comprehensive system for managing images, documents, and other media files associated with products. Assets are stored securely with optional CDN delivery and support automatic preview image generation.

* * *


## [Key Concepts](#key-concepts)

### [What Are Product Assets?](#what-are-product-assets)

Product assets are files attached to products, typically images but also documents, videos, or any file type. Each product can have multiple assets with rich metadata including:

*   Main image designation
*   Alt text for accessibility
*   Custom properties
*   Sort order
*   Purpose/category classification

### [Storage Architecture](#storage-architecture)

Assets are stored using a multi-tier architecture:

Layer

Purpose

Metadata

Asset properties stored with products

Files

Binary file storage (managed by Omnium)

Delivery

CDN for fast global asset delivery (optional)

### [Asset Properties on Products](#asset-properties-on-products)

Products contain assets in two ways:

Property

Type

Description

`MainImageUrl`

string

URL to the primary product image

`Assets`

List<Asset>

Collection of all product assets

* * *


## [Feature Overview](#feature-overview)

### [Automatic Upload](#automatic-upload)

External asset URLs are automatically downloaded and stored in Omnium during product import or update operations.

### [Preview Image Generation](#preview-image-generation)

When enabled, Omnium automatically generates resized preview images at configured aspect ratios (e.g., thumbnails, hero images, square crops).

### [CDN Integration](#cdn-integration)

Asset URLs are automatically converted to CDN URLs when configured, ensuring fast global delivery.

### [Main Image Management](#main-image-management)

The `IsMainImage` flag and `MainImageUrl` property are automatically synchronized across products and variants.

* * *


## [Common Use Cases](#common-use-cases)

### [E-commerce Product Images](#e-commerce-product-images)

*   Primary product photos
*   Alternate angle images
*   Zoom images
*   Lifestyle/contextual images

### [Documentation](#documentation)

*   Product manuals (PDF)
*   Specification sheets
*   Care instructions

### [Marketing Assets](#marketing-assets)

*   Campaign images
*   Banner graphics
*   Social media assets

* * *


## [Documentation Sections](#documentation-sections)

Section

Description

[Configuration](/docs/Product/product-assets/configuration)

Image processing settings

[Asset Model](/docs/Product/product-assets/asset-model)

Complete property reference

[Product Assets](/docs/Product/product-assets/product-assets)

Working with assets on products

[Asset Upload](/docs/Product/product-assets/asset-upload)

Upload operations and services

[Preview Images](/docs/Product/product-assets/preview-images)

Automatic image resizing

[CDN](/docs/Product/product-assets/cdn)

CDN delivery for fast global access

[API Reference](/docs/Product/product-assets/api-reference)

API endpoints for assets

* * *


## [Quick Start](#quick-start)

### [1\. Add Assets to Products](#1-add-assets-to-products)

Include assets when creating or updating products:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "productId": "shirt-001",
      "mainImageUrl": "https://example.com/images/shirt-front.jpg",
      "assets": [
        {
          "externalUrl": "https://example.com/images/shirt-front.jpg",
          "isMainImage": true,
          "altText": "Blue cotton shirt - front view"
        },
        {
          "externalUrl": "https://example.com/images/shirt-back.jpg",
          "altText": "Blue cotton shirt - back view",
          "sortOrder": 2
        }
      ]
    }

### [2\. Assets Are Automatically Processed](#2-assets-are-automatically-processed)

Omnium will:

1.  Download external URLs to storage
2.  Generate preview images (if configured)
3.  Update asset URLs to internal/CDN URLs
4.  Index asset metadata with the product

[

Previous

Category API Reference

](/docs/Product/product-categories/api-reference)[

Next

Asset API Reference

](/docs/Product/product-assets/api-reference)

---


## Product Assortment

[Product](/docs/Product)

# Product Assortment

Complete guide to controlling product visibility across stores, markets, and customers in Omnium

Product assortment in Omnium controls which products are visible and purchasable in different contexts - stores, markets, and for specific customers. This guide covers all the mechanisms available for managing product assortment.

* * *


## [Overview](#overview)

Omnium provides multiple complementary mechanisms for controlling product assortment:

Mechanism

Description

Use Case

[Store/Market/Market Group IDs](/docs/Product/product-assortment/store-market-ids)

Direct assignment of products to stores and markets

Simple, direct product-to-store mapping

[Assortment Codes](/docs/Product/product-assortment/assortment-codes)

Time-based assortment groupings

Seasonal assortments, customer-specific catalogs

[Store Categories](/docs/Product/product-assortment/store-categories)

Automatic assignment based on product categories

Category-driven store assortment

[Price-Based Assortment](/docs/Product/product-assortment/price-based-assortment)

Automatic assignment based on price availability

Price-driven product visibility

[Customer Categories](/docs/Product/product-assortment/customer-categories)

Customer-specific category restrictions

B2B customer catalogs

[Additional Controls](/docs/Product/product-assortment/additional-controls)

IsActive, dates, inventory, and other flags

Fine-grained visibility control

* * *


## [How Assortment Works](#how-assortment-works)

When a user searches for products, Omnium applies multiple filters to determine which products are visible:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Product Search Request
            │
            ▼
    ┌───────────────────────────────────┐
    │  1. Store/Market ID Filtering     │ ← Products must match store/market context
    └───────────────────────────────────┘
            │
            ▼
    ┌───────────────────────────────────┐
    │  2. Assortment Code Filtering     │ ← If customer has assortment codes
    └───────────────────────────────────┘
            │
            ▼
    ┌───────────────────────────────────┐
    │  3. Category Filtering            │ ← Customer include/exclude categories
    └───────────────────────────────────┘
            │
            ▼
    ┌───────────────────────────────────┐
    │  4. IsActive/Date/Status Filters  │ ← Publication and availability
    └───────────────────────────────────┘
            │
            ▼
        Search Results

* * *


## [Key Product Properties](#key-product-properties)

Products have several properties that control their assortment:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "storeIds": ["store-001", "store-002"],
      "marketIds": ["no", "se"],
      "marketGroupIds": ["nordic"],
      "categoryIds": ["electronics", "phones"],
      "assortmentCodes": [
        {
          "assortmentCodeId": "retail",
          "validFrom": "2025-01-01T00:00:00Z",
          "validTo": null
        }
      ],
      "isActive": true,
      "published": "2025-01-01T00:00:00Z",
      "stopPublished": null
    }

* * *


## [Configuration Settings](#configuration-settings)

Assortment behavior is controlled through tenant settings under **Settings → Products**:

Setting

Type

Default

Description

`isAssortmentStoreIdRequired`

bool

false

Products must have matching store IDs to be visible

`isAssortmentCodesRequired`

bool

false

Products must have matching assortment codes

`isMultipleAssortmentCodesAllowed`

bool

false

Products can have multiple assortment codes

`requireProductMarket`

bool

false

Products must be assigned to a market

`isProductAssortmentUpdatedByPrices`

bool

false

Auto-sync assortment from prices

`isProductAssortmentUpdatedByStoreCategories`

bool

false

Auto-sync assortment from store categories

Only enable one of `isProductAssortmentUpdatedByPrices` or `isProductAssortmentUpdatedByStoreCategories` at a time. They represent mutually exclusive approaches to automatic assortment management.

* * *


## [Scheduled Tasks](#scheduled-tasks)

Omnium provides scheduled tasks to keep product assortment synchronized:

Task

Description

**Update assortment by store categories**

Syncs product StoreIds/MarketIds based on store category configurations

**Update assortment by prices**

Syncs product StoreIds/MarketIds based on price store/market assignments

These tasks can be configured to run nightly or as needed through the Omnium scheduled tasks interface.

* * *


## [Quick Start](#quick-start)

### [Scenario 1: Simple Store Assignment](#scenario-1-simple-store-assignment)

For basic store-specific products, directly assign store IDs:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/Products/{productId}
    {
      "storeIds": ["store-001", "store-002"],
      "marketIds": ["no"]
    }

### [Scenario 2: Category-Based Assortment](#scenario-2-category-based-assortment)

1.  Configure categories on stores in **Settings → Stores**
2.  Enable `isProductAssortmentUpdatedByStoreCategories` in tenant settings
3.  Assign categories to products - store assignments happen automatically

### [Scenario 3: Customer-Specific Catalog](#scenario-3-customer-specific-catalog)

1.  Set `AssortmentIncludeCategoryIds` on the customer
2.  When the customer searches, only products in those categories are visible

* * *


## [Feature Overview](#feature-overview)

Feature

Documentation

**Store/Market IDs**

Direct store and market assignment

**Assortment Codes**

Time-based assortment groupings

**Store Categories**

Automatic assignment via categories

**Price-Based**

Assignment based on price availability

**Customer Categories**

B2B customer restrictions

**Additional Controls**

IsActive, dates, inventory flags

* * *


## [Best Practices](#best-practices)

### [Choose the Right Approach](#choose-the-right-approach)

1.  **Small catalog, few stores**: Use direct StoreIds/MarketIds assignment
2.  **Category-driven assortment**: Use store categories with automatic sync
3.  **Price-driven availability**: Use price-based assortment sync
4.  **B2B with customer catalogs**: Use customer assortment codes and categories
5.  **Seasonal/temporal products**: Use assortment codes with validity dates

### [Performance Considerations](#performance-considerations)

*   Avoid combining multiple automatic sync methods
*   Run sync scheduled tasks during off-peak hours
*   For large catalogs, prefer category-based assignment over direct assignment

### [Common Patterns](#common-patterns)

**Multi-store Retail:**

*   Configure categories per store
*   Enable `isProductAssortmentUpdatedByStoreCategories`
*   Products automatically appear in stores matching their categories

**B2B with Customer Tiers:**

*   Define assortment codes for each tier (e.g., "bronze", "silver", "gold")
*   Assign assortment codes to customers and products
*   Enable `isAssortmentCodesRequired`

**Omnichannel:**

*   Use MarketIds for online/offline separation
*   Use StoreIds for location-specific inventory
*   Use assortment codes for promotional groupings

* * *


## [Troubleshooting](#troubleshooting)

Problem

Cause

Solution

Product not appearing in store

Missing StoreId or `isAssortmentStoreIdRequired` enabled

Add store ID to product or check settings

Customer can't see product

Customer has assortment restrictions

Check customer's AssortmentIncludeCategoryIds

Product visible when it shouldn't be

Multiple assortment mechanisms may conflict

Review all assortment properties on the product

Sync not working

Scheduled task not running or wrong setting enabled

Verify scheduled task status and settings

Date-based assortment not updating

ValidFrom/ValidTo not being checked

Ensure product uses correct date fields

[

Previous

Completion Rates

](/docs/Product/configuration/completion-rates)[

Next

Store and Market IDs

](/docs/Product/product-assortment/store-market-ids)

---


## Product Categories

[Product](/docs/Product)

# Product Categories

Complete guide to product categories in Omnium - hierarchical organization, multi-language support, automatic creation, and API usage.

Product categories in Omnium provide a hierarchical structure for organizing products. Categories support multi-language content, automatic creation from product data, and flexible enrichment options.
