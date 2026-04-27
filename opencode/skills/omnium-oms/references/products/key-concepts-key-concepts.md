# Products — Catalog, Categories & Assets — [Key Concepts](#key-concepts)

## [Key Concepts](#key-concepts)

### [Hierarchical Structure](#hierarchical-structure)

Categories form a tree structure through parent-child relationships:

*   Each category can have a **parent category** (`parentId` property)
*   Categories with no parent are **root categories**
*   Unlimited nesting levels are supported
*   The `rootCategoryId` tenant setting defines the primary catalog root

### [Multi-Language Support](#multi-language-support)

Categories are **language-specific**. Each category has:

*   A `categoryId` that identifies it across languages (e.g., `electronics`)
*   A composite `id` combining category and language (e.g., `electronics_en`, `electronics_no`)
*   Language-specific `name` and `description` fields

This means a category like "Electronics" exists as separate documents for each language, sharing the same `categoryId` but with localized content.

### [Relationship with Products](#relationship-with-products)

Products connect to categories in two ways:

Property

Type

Description

`categoryIds`

List<string>

Simple list of category IDs assigned to the product

`productCategories`

List<ProductCategory>

Enriched category objects with full details (name, description, etc.)

The `categoryIds` property stores the raw assignments. When [category enrichment](/docs/Product/product-categories/product-enrichment) is enabled, Omnium populates `productCategories` with complete category objects.

* * *


## [Feature Overview](#feature-overview)

Feature

Description

Learn More

**Configuration**

Tenant settings for category behavior

[Configuration](/docs/Product/product-categories/configuration)

**Category Model**

Full property reference

[Category Model](/docs/Product/product-categories/category-model)

**Category Tree**

Hierarchy and tree operations

[Category Tree](/docs/Product/product-categories/category-tree)

**Automatic Categories**

Create categories from brand/season data

[Automatic Categories](/docs/Product/product-categories/automatic-categories)

**Product Enrichment**

Populate products with category data

[Product Enrichment](/docs/Product/product-categories/product-enrichment)

**Dynamic Categories**

Categories based on saved searches

[Dynamic Categories](/docs/Product/product-categories/dynamic-categories)

**API Reference**

Endpoints for category management

[API Reference](/docs/Product/product-categories/api-reference)

* * *


## [Common Use Cases](#common-use-cases)

### [Catalog Navigation](#catalog-navigation)

Build category menus and navigation trees using the [category tree API](/docs/Product/product-categories/category-tree).

### [Brand-Based Organization](#brand-based-organization)

Automatically create and maintain brand categories using the [brand scheduled task](/docs/Product/product-categories/automatic-categories#brand-categories).

### [Seasonal Collections](#seasonal-collections)

Create season categories automatically from product season data using the [season scheduled task](/docs/Product/product-categories/automatic-categories#season-categories).

### [Dynamic Product Groups](#dynamic-product-groups)

Use [saved searches](/docs/Product/product-categories/dynamic-categories) to create categories like "New Arrivals" or "On Sale" without manual product assignment.

* * *


## [Quick Start](#quick-start)

1.  **Configure settings** - Set up category-related tenant settings in [Configuration](/docs/Product/product-categories/configuration)
2.  **Create categories** - Use the [API](/docs/Product/product-categories/api-reference) or Omnium UI to create your category structure
3.  **Assign to products** - Add category IDs to products via import or API
4.  **Enable enrichment** - Turn on [product enrichment](/docs/Product/product-categories/product-enrichment) to populate category details on products

[

Previous

Cost Prices

](/docs/Product/local-products/cost-prices)[

Next

Category Configuration

](/docs/Product/product-categories/configuration)

---


## Product Components

[Product](/docs/Product)

# Product Components

Create packages, bundles, and kits by combining multiple products as components in Omnium.

Product components enable you to create composite products that consist of multiple individual products. This feature supports packages, bundles, and kits - each with different behaviors for pricing, inventory, and order handling.

* * *


## [Key Concepts](#key-concepts)

### [What Are Product Components?](#what-are-product-components)

Components are references to other products that make up a composite product. A package or bundle product contains a list of components, where each component specifies:

*   Which product/SKU is included
*   The quantity of that product
*   Optional selectable variants
*   Price adjustments (for packages with options)

### [Package Types](#package-types)

Omnium supports three types of composite products:

Type

Flag

Description

Package

`IsPackage`

Fixed collection with specific components and optional price offsets

Bundle

`IsBundle`

Flexible collection, often with component options

Kit

`IsKit`

Pre-assembled collection with independent inventory

### [Component Properties on Products](#component-properties-on-products)

Products with components have these relevant properties:

Property

Type

Description

`IsPackage`

bool

Product is a package

`IsBundle`

bool

Product is a bundle

`IsKit`

bool

Product is a kit

`Components`

List<ProductComponent>

Collection of component products

* * *


## [Feature Overview](#feature-overview)

### [Automatic Inventory Calculation](#automatic-inventory-calculation)

When components have inventory, the package's available inventory is automatically calculated as the minimum number of complete packages that can be assembled.

### [Component Options](#component-options)

Components can offer selectable options, allowing customers to choose between variants:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "componentId": "shirt-component",
      "productId": "basic-shirt",
      "options": [
        { "skuId": "basic-shirt-blue" },
        { "skuId": "basic-shirt-red" },
        { "skuId": "basic-shirt-green" }
      ]
    }

### [Order Integration](#order-integration)

When packages are added to orders, they can either:

*   Remain as a single line item
*   Break down into individual component lines (configurable)

* * *


## [Common Use Cases](#common-use-cases)

### [Product Bundles (Package/Bundle)](#product-bundles-packagebundle)

Sell multiple products together at a discount:

*   "Starter Kit" - Includes camera, lens, and bag
*   "Gift Set" - Perfume + lotion + sample

### [Configurable Packages (Bundle)](#configurable-packages-bundle)

Allow customers to customize their package:

*   "Build Your Own Bundle" - Choose 3 items from a selection
*   "Meal Deal" - Pick main, side, and drink

### [Pre-Assembled Products (Kit)](#pre-assembled-products-kit)

Products physically assembled in the warehouse before sale:

*   **Gift bags** - Holiday or promotional gift bags with multiple items
*   **Chocolate boxes** - Assorted chocolates packed as a single unit
*   **Sample kits** - Product samples bundled for demos or testing
*   **Subscription boxes** - Monthly curated boxes assembled before shipping

### [Bill of Materials](#bill-of-materials)

Track component products for manufacturing or assembly:

*   Raw materials that combine into finished goods
*   Parts that make up a complete product

* * *


## [Documentation Sections](#documentation-sections)

Section

Description

[Configuration](/docs/Product/product-components/configuration)

Tenant settings for packages and bundles

[Component Model](/docs/Product/product-components/component-model)

Complete property reference

[Package Types](/docs/Product/product-components/package-types)

Differences between Package, Bundle, and Kit

[Inventory](/docs/Product/product-components/inventory)

How component inventory is calculated

[Orders](/docs/Product/product-components/orders)

How components work in orders

[API Reference](/docs/Product/product-components/api-reference)

API endpoints

* * *


## [Quick Start](#quick-start)

### [1\. Enable Packages](#1-enable-packages)

Enable the feature in tenant settings:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ProductSettings": {
        "HasPackages": true
      }
    }

### [2\. Create a Package Product](#2-create-a-package-product)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "productId": "starter-kit",
      "name": "Photography Starter Kit",
      "isPackage": true,
      "components": [
        {
          "componentId": "camera-component",
          "productId": "camera-model-x",
          "skuId": "camera-model-x-black",
          "quantity": 1
        },
        {
          "componentId": "lens-component",
          "productId": "standard-lens",
          "quantity": 1
        },
        {
          "componentId": "bag-component",
          "productId": "camera-bag",
          "quantity": 1
        }
      ]
    }

### [3\. Package Inventory Is Calculated Automatically](#3-package-inventory-is-calculated-automatically)

If components have inventory:

*   Camera: 10 available
*   Lens: 25 available
*   Bag: 8 available

Package inventory = 8 (limited by the bag with lowest availability)

[

Previous

CDN

](/docs/Product/product-assets/cdn)[

Next

Component Configuration

](/docs/Product/product-components/configuration)

---


## Product Identifiers

[Product](/docs/Product)

# Product Identifiers

Deep dive into the product identification system in Omnium - understanding Id, ProductId, SkuId, ParentId, and VariantParentId

Understanding how products are identified in Omnium is critical for API integration, Excel imports, and proper product modeling. This guide explains the five key identifier properties and how they relate to each other.

* * *


## [Overview](#overview)

Omnium uses a multi-layered identification system to support:

*   **Multi-language products** - Same product in different languages
*   **Product variants** - Size/color variations of a product
*   **Sibling products** - Related products grouped under a common parent
*   **SKU tracking** - Unique stock-keeping unit identification

The five identifier properties are:

Property

Purpose

Primary Use

`Id`

Unique document identifier

Required for all products and variants

`ProductId`

Logical product grouping

Links language versions together

`SkuId`

Stock-keeping unit

Identifies purchasable items

`ParentId`

Product family grouping

Links sibling products

`VariantParentId`

Variant-to-product link

Links variants to their parent product

* * *


## [The Identification Hierarchy](#the-identification-hierarchy)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

                        ParentId: "jacket-series"
                               │
                ┌──────────────┼──────────────┐
                │              │              │
         Product: Blue    Product: Red    Product: Green
         Id: jacket-blue_en   Id: jacket-red_en    Id: jacket-green_en
         ProductId: jacket-blue    ProductId: jacket-red   ProductId: jacket-green
                │
                ├─── Variant: Small (SkuId: jacket-blue-s)
                ├─── Variant: Medium (SkuId: jacket-blue-m)
                └─── Variant: Large (SkuId: jacket-blue-l)
                        │
                        └── VariantParentId: jacket-blue_en

* * *


## [Products With Variants vs Without Variants](#products-with-variants-vs-without-variants)

Omnium supports two product structures, and the ID usage differs between them:

### [Products WITH Variants](#products-with-variants)

When a product has variants (e.g., sizes), the **variant is the SKU** (the purchasable item):

Property

Product

Variant

`Id`

Required, unique (e.g., `123_en`)

Required, unique (e.g., `123_m`)

`ProductId`

Required (e.g., `123`)

Same as product (e.g., `123`)

`SkuId`

**Not used**

Required, unique (e.g., `123_m`)

`ParentId`

Optional (e.g., `12`)

Same as product (e.g., `12`)

`VariantParentId`

**Not used**

Points to product Id (e.g., `123_en`)

For products with variants, the `SkuId` exists only on the **variant level**. The parent product is not purchasable.

### [Products WITHOUT Variants (Single SKU)](#products-without-variants-single-sku)

When a product has no variants, the **product itself is the SKU**:

Property

Product

`Id`

Required, unique (e.g., `123_en`)

`ProductId`

Required (e.g., `123`)

`SkuId`

Required, unique (e.g., `123`)

`ParentId`

Optional (e.g., `12`)

`VariantParentId`

**Not used**

For single-SKU products, the `SkuId` is typically the same as `ProductId` since there are no variations.

* * *


## [Complete Example](#complete-example)

Here's a real-world example with two sibling products, each with size variants:

### [Product Structure](#product-structure)

**Parent/Family**: Jacket Series (ParentId: `12`)

**Product 1**: Jacket Blue (English)

*   Product 2 Size Medium
*   Product 2 Size Large

**Product 2**: Jacket Red (English)

*   Product 2 Size Medium
*   Product 2 Size Large

### [ID Values](#id-values)

Entity

Id

ProductId

SkuId

ParentId

VariantParentId

Product 123

`123_en`

`123`

\-

`12`

\-

Variant 123 Medium

`123_m`

`123`

`123_m`

`12`

`123_en`

Variant 123 Large

`123_l`

`123`

`123_l`

`12`

`123_en`

Product 456

`456_en`

`456`

\-

`12`

\-

Variant 456 Medium

`456_m`

`456`

`456_m`

`12`

`456_en`

Variant 456 Large

`456_l`

`456`

`456_l`

`12`

`456_en`

### [Visual Relationship](#visual-relationship)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Product                          Variant
    ─────────────────────────────────────────────────────
    Id: 123_en          ◄────────    Id: 123_m
    ProductId: 123      ════════     ProductId: 123
    SkuId: ✗                         SkuId: 123_m
    ParentId: 12        ════════     ParentId: 12
    VariantParentId: ✗  ◄────────    VariantParentId: 123_en

**Legend:**

*   `◄────` = Reference relationship (variant points to product)
*   `════` = Same value shared

* * *


## [Language Handling](#language-handling)

By convention in Omnium, the `Id` property includes a **language suffix**:

Language

Product Id Example

English

`jacket-blue_en`

Norwegian

`jacket-blue_no`

Swedish

`jacket-blue_sv`

Products that share the same `ProductId` but have different language suffixes are **language versions** of the same logical product:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    // English version
    {
      "id": "jacket-blue_en",
      "productId": "jacket-blue",
      "language": "en",
      "name": "Blue Jacket"
    }
     
    // Norwegian version
    {
      "id": "jacket-blue_no",
      "productId": "jacket-blue",
      "language": "no",
      "name": "Blå Jakke"
    }

The `ProductId` is shared across language versions. This allows Omnium to link translations together in the UI and enable property inheritance between languages.

* * *


## [Sibling Products with ParentId](#sibling-products-with-parentid)

The `ParentId` property groups related products as **siblings**. This is commonly used for:

*   Color variations (where each color has its own size variants)
*   Product series or collections
*   Model year variations

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    // Blue jacket - sibling 1
    {
      "id": "jacket-blue_en",
      "productId": "jacket-blue",
      "parentId": "jacket-series",
      "variants": [...]
    }
     
    // Red jacket - sibling 2
    {
      "id": "jacket-red_en",
      "productId": "jacket-red",
      "parentId": "jacket-series",
      "variants": [...]
    }

The `ParentId` can reference a product that **does not exist** in Omnium. It's simply a grouping identifier.

* * *


## [Best Practices](#best-practices)

### [ID Naming Conventions](#id-naming-conventions)

Property

Recommendation

`Id`

Use format: `{productId}_{language}` for products, `{productId}_{variantCode}` for variants

`ProductId`

Use a stable, language-agnostic identifier

`SkuId`

Match your ERP/inventory system SKU codes

`ParentId`

Use a meaningful grouping identifier

### [Common Patterns](#common-patterns)

**Pattern 1: Simple Product (No Variants)**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "SHOE-001_en",
      "productId": "SHOE-001",
      "skuId": "SHOE-001"
    }

**Pattern 2: Product with Size Variants**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "SHIRT-001_en",
      "productId": "SHIRT-001",
      "variants": [
        { "id": "SHIRT-001-S", "skuId": "SHIRT-001-S", "variantParentId": "SHIRT-001_en" },
        { "id": "SHIRT-001-M", "skuId": "SHIRT-001-M", "variantParentId": "SHIRT-001_en" },
        { "id": "SHIRT-001-L", "skuId": "SHIRT-001-L", "variantParentId": "SHIRT-001_en" }
      ]
    }

**Pattern 3: Color Siblings with Size Variants**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    // Each color is a separate product with shared ParentId
    {
      "id": "SHIRT-BLUE_en",
      "productId": "SHIRT-BLUE",
      "parentId": "SHIRT-SERIES",
      "variants": [...]
    },
    {
      "id": "SHIRT-RED_en",
      "productId": "SHIRT-RED",
      "parentId": "SHIRT-SERIES",
      "variants": [...]
    }

* * *


## [See Also](#see-also)

*   [ID Reference](/docs/Product/product-identifiers/id-reference) - Complete property reference for all identifier fields
*   [Excel Import](/docs/Product/product-identifiers/excel-import) - How to use identifiers in Excel imports
*   [Product Overview](/docs/Product) - General product modeling concepts

[

Previous

Gift Cards

](/docs/Product/giftcards)[

Next

ID Property Reference

](/docs/Product/product-identifiers/id-reference)