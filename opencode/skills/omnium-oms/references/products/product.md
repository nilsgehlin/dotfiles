# Products — Catalog, Categories & Assets — Product

## Product

# Product

Introduction to products in Omnium


## [Product modeling and variations in Omnium](#product-modeling-and-variations-in-omnium)

This section provides an overview of how to model products and handle variations in the Omnium system. It covers product types, including single SKUs, products with variants, siblings, and package products. It also includes key considerations and best practices for managing product variations efficiently to ensure optimal performance and clarity.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fproducts.7aacc5a6.png&w=3840&q=75)

* * *


## [In this section](#in-this-section)

[

API Reference

Search, create, update, and manage products via the API



](/docs/Product/api-reference)[

Configuration

Product settings, product types, and completion rates



](/docs/Product/configuration)[

Assortment

Control product visibility across stores, markets, and customers



](/docs/Product/product-assortment)[

Local Products

Store-specific assortments with localized editing and access control



](/docs/Product/local-products)[

Categories

Hierarchical organization, multi-language support, and automatic creation



](/docs/Product/product-categories)[

Assets

Product images, documents, and media with automatic resizing and CDN delivery



](/docs/Product/product-assets)[

Components

Packages, bundles, and kits combining multiple products



](/docs/Product/product-components)[

Gift Cards

Technical configuration and API usage for buying and paying with gift cards



](/docs/Product/giftcards)[

Identifiers

Understanding Id, ProductId, SkuId, ParentId, and VariantParentId



](/docs/Product/product-identifiers)

* * *


## [Product types and variations](#product-types-and-variations)

### [Single SKU](#single-sku)

*   A product that represents a single **Stock Keeping Unit (SKU)**.
*   No variations or series (e.g., no multiple colors or sizes).

**Example**: Individual bicycle pedals.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fproductsingleskus.2be4a178.png&w=3840&q=75)

* * *

### [Product with variants](#product-with-variants)

*   Contains variations such as **size** or **color**.
*   Includes a list of SKUs referred to as variants.
*   Pricing is often set at the parent level but can also differ for each variant.
*   **Recommendation**: Vary by only one property (e.g., size OR color).

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fproductswithvariants.30229d5d.png&w=3840&q=75)

* * *

### [Sibling products](#sibling-products)

*   Can be **Single SKUs** or **Products with Variants**.
*   Share the same **Parent ID**, connecting them as a series.
*   Commonly used in **fashion** to display variations (e.g., colors).

**Example**: Jerseys in different colors with sizes as variants. ![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fproductsiblings.28e89374.png&w=3840&q=75)

* * *

### [Other product variations](#other-product-variations)

*   **Package Products**: Products that include multiple components.
*   **Products with Options**: Allow users to customize certain features (e.g., engraved text).

* * *


## [Product Languages](#product-languages)

In Omnium, product languages are configured through the **Omnium configuration page**. Each language version of a product is represented as a separate product using a language-based ID convention. For example:

*   `yellow_tennis_sock_no` (Norwegian)
*   `yellow_tennis_sock_en` (English)
*   `yellow_tennis_sock_se` (Swedish)

### [Market Configuration](#market-configuration)

Markets are configured with a `productContentLanguage`, defining which language versions should be used. Language versions that share the same `ProductId` are grouped together in the UI. **Inheritance** can be configured so updates in one language automatically apply to others.

* * *


## [Key considerations for product modeling](#key-considerations-for-product-modeling)

### [Managing Variants](#managing-variants)

*   **Limit Variants**: Avoid products with more than 50 variants. If necessary, reconsider your product model.
*   **Data Duplication**: Keep shared information at the product level to avoid duplication.
*   **Performance**: Variants are stored within the product document, so each variant update affects the entire product. Variants are not individually searchable.

### [Sibling Products](#sibling-products-1)

Are siblings by convention, by sharing the same **ParentId**. Can be setup to inherit properties from each other.  
**Example Use Case**: For a t-shirt in 10 colors and 5 sizes, create 10 sibling products (one for each color) with 5 size variants each (Instead of a single product with 50 variants!).

#### [Example structure:](#example-structure)

Product 1: **Yellow shirt**

*   **ID**: shirt-yellow\_no
*   **ProductId**: shirt-yellow
*   **ParentId**: shirt
*   Variants: Sizes S, M, L

Product 2: **Blue shirt**

*   **ID**: shirt-blue\_no
*   **ProductId**: shirt-blue
*   **ParentId**: shirt
*   Variants: Sizes S, M, L

... and so on

### [Best practices](#best-practices)

*   **Centralize Data**: Store most information at the product level. Only variant-specific data should be stored in variants.
*   **Use Null Values**: Avoid empty strings and empty collections; use `null` instead.
*   **Focus on Simplicity**: Create multiple focused products rather than overly complex ones.
*   **Avoid Unused Custom Properties**: Use product types for editable properties in the UI.
*   **Avoid "Monster Products"**

### [Handling "Monster Products" 👹](#handling-monster-products-)

> Monster products" refer to products that have become excessively large due to too many variants, properties, or other factors. These large products can negatively impact performance and storage efficiency. An example would be a product with more 100+ variants and with a huge amount of custom properties, prices and cateogories stored on each variant.

*   **Reduce Variant Numbers**: Limit the number of variants for each product. If a product has too many variants with unique pricing or properties per variant, organizing them as **sibling products** is a much more suitable approach.
*   **Centralize Shared Data**: Avoid data duplication by keeping common information at the product level. Store only variant-specific data within the variants.

* * *


## [Industry-specific examples](#industry-specific-examples)

### [Electronics](#electronics)

*   **Scenario**: A smartphone with different storage capacities and colors.
*   **Recommendation**: Separate products by storage (e.g., "Smartphone 64GB" and "Smartphone 128GB") with color variants.

### [Footwear](#footwear)

*   **Scenario**: Shoes available in multiple colors and sizes.
*   **Recommendation**: Separate products by color (e.g., "Red Sneakers" and "Blue Sneakers") with size and width as variants.

### [Appliances](#appliances)

*   **Scenario**: Washing machines with different load capacities and energy ratings.
*   **Recommendation**: Separate products by load capacity (e.g., "7kg Washing Machine" and "10kg Washing Machine") with energy rating variants.

* * *


## [Product Assortment](#product-assortment)

Omnium provides multiple mechanisms to control which products are visible in different stores, markets, and to specific customers. For comprehensive documentation on all assortment options, see [Product Assortment](/docs/Product/product-assortment).

Key assortment mechanisms include:

*   **Store/Market IDs** - Direct assignment of products to stores and markets
*   **Assortment Codes** - Time-based groupings for seasonal and customer-specific catalogs
*   **Store Categories** - Automatic assignment based on product categories configured on stores
*   **Price-Based Assortment** - Automatic assignment based on price store/market data
*   **Customer Categories** - Customer-specific category restrictions for B2B scenarios

* * *

[

Previous

Warehouse Locations

](/docs/Inventory/warehouse-locations)[

Next

Assets

](/docs/Product/api-reference/assets)

---


## Configuration

[Product](/docs/Product)

# Configuration

Complete guide to product settings and configuration options in Omnium

Product settings control how products are managed, displayed, searched, and priced in Omnium. These settings are configured in the tenant settings under **Settings → Products**.

This guide covers all available product configuration options organized by functional area.

* * *


## [General Product Settings](#general-product-settings)

These settings control the core product management behavior in Omnium.

Property

Type

Default

Description

readOnly

bool

false

When enabled, products cannot be modified through the Omnium UI. Use this for tenants where products are managed exclusively through external systems (ERP, PIM).

showFilters

bool

true

Controls whether filter options are displayed in the product list view.

isProductCreateDisabled

bool

false

When enabled, users cannot create new products through the Omnium UI. Products can still be created via API or imports.

filterByActiveAsDefault

bool

false

When enabled, the product list defaults to showing only active products. Users can still toggle this filter to see inactive products.

### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "ReadOnly": false,
      "ShowFilters": true,
      "IsProductCreateDisabled": false,
      "FilterByActiveAsDefault": true
    }

* * *


## [Packages and Bundles](#packages-and-bundles)

Packages (also called bundles) allow you to sell multiple products together as a single unit. These settings control how packages behave.

Property

Type

Default

Description

hasPackages

bool

false

Enables package/bundle product functionality. When enabled, you can create products that contain other products as components.

disablePackageAutoBreakdownOnAddProductFromOrder

bool

false

When enabled, packages remain as single line items when added to orders. When disabled (default), packages are automatically expanded into their component products.

allocatePackagePricesToComponents

bool

false

When enabled, the package price is proportionally distributed across component line items, and the package line's extended price is set to zero. This prevents double-counting in order totals.

### [Package Price Allocation](#package-price-allocation)

When `allocatePackagePricesToComponents` is enabled, Omnium calculates component prices as follows:

1.  The total package price is determined
2.  Each component receives a proportional share based on its original price relative to the sum of all component prices
3.  The package line item's ExtendedPrice is set to 0

**Example:**

A package priced at 100 contains:

*   Product A (original price: 60)
*   Product B (original price: 40)

With allocation enabled:

*   Product A receives: 100 × (60/100) = 60
*   Product B receives: 100 × (40/100) = 40
*   Package line: 0

This ensures the order total remains 100, not 200.

Changing `allocatePackagePricesToComponents` affects how order totals are calculated. Review existing orders before enabling this setting in production.

### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "HasPackages": true,
      "DisablePackageAutoBreakdownOnAddProductFromOrder": false,
      "AllocatePackagePricesToComponents": true
    }

* * *


## [Product Features](#product-features)

These settings enable or disable specific product functionality.

Property

Type

Default

Description

isProductStatisticsEnabled

bool

false

Enables collection of product statistics and analytics, such as view counts and sales performance.

isIncompleteProductsEnabled

bool

false

When enabled, products can be saved without all required fields populated. Useful during import processes or when building products incrementally.

isProductOptionsEnabled

bool

false

Enables product options functionality, allowing configurable products with user-selectable options.

isProductLanguagesEnabled

bool

false

Enables multi-language product content. Products can have different names, descriptions, and content for each language.

isInheritanceEnabled

bool

false

Enables property inheritance between parent products and variants. See [Inheritance Settings](#inheritance-settings) for details.

isLocalProductsEnabled

bool

false

Enables store-specific product editing. When enabled, products can be marked as "local" to specific stores, allowing store staff to manage their own product content.

### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsProductStatisticsEnabled": true,
      "IsIncompleteProductsEnabled": false,
      "IsProductOptionsEnabled": true,
      "IsProductLanguagesEnabled": true,
      "IsInheritanceEnabled": true,
      "IsLocalProductsEnabled": false
    }

* * *


## [Assortment Settings](#assortment-settings)

Assortment settings control how products are organized and filtered by store, market, or assortment codes.

Property

Type

Default

Description

isAssortmentStoreIdRequired

bool

false

When enabled, products must be linked to at least one store through assortment configuration. Products without store assignments will not appear in store-specific views.

isAssortmentCodesRequired

bool

false

When enabled, products must have at least one assortment code assigned. Product searches without assortment codes will only return products without assortment codes assigned.

isMultipleAssortmentCodesAllowed

bool

false

When enabled, products can be assigned multiple assortment codes. When disabled, only one assortment code per product is allowed.

requireProductMarket

bool

false

When enabled, products must be assigned to at least one market to be searchable.

requireStoreIdsForAccess

bool

null

When enabled, users can only view and edit products that are assigned to stores they have access to.

### [Assortment Codes](#assortment-codes)

Assortment codes allow you to categorize products for different sales channels, customer segments, or purposes.

Property

Type

Description

assortmentCodes

array

Available assortment code definitions

Each assortment code has:

Property

Type

Description

id

string

Unique identifier for the assortment code

translationKey

string

Translation key for displaying the assortment code name

### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsAssortmentStoreIdRequired": true,
      "IsAssortmentCodesRequired": false,
      "IsMultipleAssortmentCodesAllowed": true,
      "RequireProductMarket": true,
      "AssortmentCodes": [
        { "Id": "retail", "TranslationKey": "AssortmentCode_Retail" },
        { "Id": "wholesale", "TranslationKey": "AssortmentCode_Wholesale" },
        { "Id": "online", "TranslationKey": "AssortmentCode_Online" }
      ]
    }

* * *


## [URL Settings](#url-settings)

These settings control how product URLs are generated.

Property

Type

Default

Description

isOmniumUrlProviderEnabled

bool

false

Enables the built-in URL provider for generating product URLs. When enabled, Omnium automatically generates URLs based on the template.

omniumUrlProviderTemplate

string

null

Template string for generating product URLs. Supports placeholders like `{productId}`, `{sku}`, `{name}`.

### [URL Template Placeholders](#url-template-placeholders)

The URL template supports the following placeholders:

Placeholder

Description

`{productId}`

The product's unique identifier

`{sku}`

The product's SKU

`{name}`

The product's name (URL-encoded)

`{categoryPath}`

The product's category path

### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsOmniumUrlProviderEnabled": true,
      "OmniumUrlProviderTemplate": "/products/{categoryPath}/{sku}"
    }

* * *


## [Price Settings](#price-settings)

These settings control how product prices are managed and stored.

Property

Type

Default

Description

priceManagement

bool

false

Enables price management features in the Omnium UI. When enabled, prices can be viewed and edited directly on products.

hasExternalPrices

bool

false

Indicates that prices come from an external system. When enabled, Omnium expects prices to be provided via API or integration rather than managed internally.

hasCustomerSpecificPrices

bool

false

Enables customer-specific or customer-group-specific pricing. When enabled, different customers or customer groups can see different prices for the same product.

hidePricesInUi

bool

false

When enabled, prices are hidden in the Omnium user interface. Useful when prices are confidential or managed elsewhere.

### [Price Storage Model](#price-storage-model)

Omnium supports different price storage models depending on your business requirements:

Property

Type

Default

Description

hasSeparatePrices

bool

false

When enabled, prices are stored separately from the product record. This model is required for large price lists, time-based pricing, or when you need to query prices independently.

isPricesStoredOnlyOnProduct

bool

false

When enabled, prices are stored directly on the product (the simplest model).

maxSeparatePriceSize

int

150

Maximum number of prices returned when fetching a product with separate prices. Set to 0 to disable price fetching (useful when prices are only used for filtering).

**Choosing a Price Storage Model:**

*   **Prices on Product** (default): Best for simple pricing with few price variants.
*   **Separate Prices**: Best for complex pricing scenarios with many price lists, time-based prices, or customer-specific pricing. Required when you have hundreds of prices per product.

Changing the price storage model is a significant decision that should be made during initial setup. Contact Omnium support before changing this on an existing tenant.

### [Product Assortment from Prices](#product-assortment-from-prices)

These settings automatically update product visibility based on price data:

Property

Type

Default

Description

isProductAssortmentUpdatedByPrices

bool

false

When enabled, product store/market/market group assignments are automatically updated based on the assortment information on the product's prices.

isProductAssortmentUpdatedByStoreCategories

bool

false

When enabled, product store/market/market group assignments are automatically updated based on the categories assigned to stores.

Only one of these options should be enabled at a time. They are mutually exclusive approaches to managing product assortment.

### [Price Cleanup](#price-cleanup)

Property

Type

Default

Description

deleteExpiredPricesThreshold

int

null

Number of days after expiration before prices are automatically deleted. Only applicable when using separate prices. Leave null to disable automatic cleanup.

### [Advanced Price Settings](#advanced-price-settings)

Property

Type

Default

Description

isDefaultPriceOverridingPrices

bool

false

When enabled, default prices override other prices during import operations.

isUpdatePricesAlwaysMarkedAsModified

bool

false

When enabled, any price update triggers a product "Modified" timestamp update, even if the price value hasn't actually changed.

isPriceMarketIgnoredOnProductSearch

bool

false

When enabled, product search ignores market filtering when retrieving prices.

isVariantPricesJoined

bool

false

When enabled, variant prices are aggregated together in search results.

isPriceUpdateOperationDelayed

bool

false

When enabled, price update operations are queued for batch processing rather than processed immediately. Improves performance for bulk price updates.

isProductPriceSetToLowestVariantPrice

bool

false

When enabled, the parent product's price is automatically set to the lowest variant price during product enrichment.

### [Sample](#sample-5)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "PriceManagement": true,
      "HasExternalPrices": false,
      "HasCustomerSpecificPrices": true,
      "HasSeparatePrices": true,
      "DeleteExpiredPricesThreshold": 30,
      "IsProductAssortmentUpdatedByPrices": true,
      "IsProductPriceSetToLowestVariantPrice": true
    }

* * *


## [Cost Price Settings](#cost-price-settings)

These settings control how product cost prices are managed.

Property

Type

Default

Description

costPriceManagement

bool

true

Enables cost price management features. When enabled, cost prices can be viewed and edited on products.

defaultProductCostCurrency

string

null

Default currency code for cost prices (e.g., "USD", "EUR", "NOK").

### [Cost Price Storage](#cost-price-storage)

Property

Type

Default

Description

hasSeparateCostPrices

bool

false

When enabled, cost prices are stored as separate indexed documents (similar to separate prices). Required for multi-supplier scenarios with different cost prices.

isUsePriceCostPrice

bool

false

When enabled, cost price is read from price-level data rather than product-level. Use when different price lists have different cost prices.

deleteExpiredCostPricesThreshold

int

null

Number of days after expiration before cost prices are automatically deleted. Only applicable with separate cost prices.

### [Sample](#sample-6)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "CostPriceManagement": true,
      "DefaultProductCostCurrency": "NOK",
      "HasSeparateCostPrices": false,
      "IsUsePriceCostPrice": false,
      "DeleteExpiredCostPricesThreshold": 90
    }

* * *


## [Variant Settings](#variant-settings)

These settings control the relationship between parent products and their variants.

Property

Type

Default

Description

isLocationEqualForAllVariants

bool

false

When enabled, all variants of a product must share the same location/shelf position.

syncExistingVariantsAcrossLanguages

bool

false

When enabled and product languages are used, existing variants are synchronized across all language versions of a product.

disableIsActiveSyncForVariants

bool

false

Controls how the `isActive` status synchronizes between products and variants. See detailed explanation below.

### [Product and Variant `isActive` Synchronization](#product-and-variant-isactive-synchronization)

The `disableIsActiveSyncForVariants` setting controls how the active/inactive status is synchronized between products and their variants.

#### [When Sync Is Disabled (`disableIsActiveSyncForVariants: true`)](#when-sync-is-disabled-disableisactivesyncforvariants-true)

*   A product can only be activated if at least one variant is already active
*   If all variants are deactivated, the product is automatically deactivated
*   Activating a variant later does **not** automatically re-activate the product—you must explicitly activate the product again
*   Deactivating a product does **not** change variant status

To activate a product when sync is disabled, you must update the product and at least one variant in the same request:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/Products/{productId}
     
    {
      "isActive": true,
      "variants": [
        { "variantId": "{variantId}", "isActive": true }
      ]
    }

#### [When Sync Is Enabled (`disableIsActiveSyncForVariants: false`)](#when-sync-is-enabled-disableisactivesyncforvariants-false)

*   Setting a product to `isActive = false` also deactivates all variants
*   Setting a product to `isActive = true`:
    *   If all variants were inactive → they are set to active
    *   If some variants were already active → their states remain unchanged
*   Activating or deactivating individual variants does **not** affect the product status

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/Products/{productId}
     
    { "isActive": false }

Result: Product and all variants become inactive.

#### [Best Practices](#best-practices)

**If sync is disabled:**

*   Always activate at least one variant before activating the product
*   Use product activation only after a variant is active

**If sync is enabled:**

*   Use product-level activation/deactivation to manage all variants in bulk

#### [Troubleshooting](#troubleshooting)

Problem

Cause

Solution

Product won't stay active

All variants are inactive while sync is disabled

Activate a variant first via the API

Product deactivated automatically

All variants were deactivated while sync was disabled

Activate at least one variant

Variants didn't update when product was activated

With sync enabled, variants only update if they were all inactive

This is expected behavior; mixed states are preserved

### [Sample](#sample-7)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsLocationEqualForAllVariants": false,
      "SyncExistingVariantsAcrossLanguages": true,
      "DisableIsActiveSyncForVariants": true
    }

* * *


## [Image and Asset Settings](#image-and-asset-settings)

These settings control how product images and assets are handled.

Property

Type

Default

Description

isImagesAutoResizedOnUpload

bool

false

When enabled, uploaded images are automatically resized according to the configured maximum size and aspect ratios.

assetPurposeKeys

List<string>

null

List of purpose keys for categorizing assets (e.g., "main", "thumbnail", "lifestyle", "technical").

### [Image File Types](#image-file-types)

Configure allowed image file types and compression settings:

Property

Type

Description

imageFileTypes

array

Allowed image file types with compression options

Each file type option has:

Property

Type

Description

fileType

string

File extension (e.g., "jpg", "png", "webp")

compressionOptions

object

Compression settings

isDefault

bool

Whether this is the default format

### [Image Aspect Ratios](#image-aspect-ratios)

Configure standard aspect ratios for product images:

Property

Type

Description

imageAspectRatios

array

Available aspect ratio configurations

Each aspect ratio has:

Property

Type

Description

name

string

Display name for the aspect ratio

translateKey

string

Translation key

width

int

Width in pixels

height

int

Height in pixels

isDefault

bool

Whether this is the default aspect ratio

### [Image Maximum Size](#image-maximum-size)

Property

Type

Description

imageMaxSize

object

Maximum dimensions for uploaded images

### [Sample](#sample-8)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsImagesAutoResizedOnUpload": true,
      "AssetPurposeKeys": ["main", "thumbnail", "lifestyle", "detail"],
      "ImageFileTypes": [
        {
          "FileType": "jpg",
          "CompressionOptions": { "Quality": 85 },
          "IsDefault": true
        },
        {
          "FileType": "webp",
          "CompressionOptions": { "Quality": 80 },
          "IsDefault": false
        }
      ],
      "ImageAspectRatios": [
        { "Name": "Square", "Width": 1000, "Height": 1000, "IsDefault": true },
        { "Name": "Portrait", "Width": 800, "Height": 1200, "IsDefault": false }
      ],
      "ImageMaxSize": { "Width": 2000, "Height": 2000 }
    }

* * *
