# Prices & Promotions — Lists, Rules & Campaigns — [Overview](#overview)

## [Overview](#overview)

The promotion system in Omnium is a flexible, multi-layered discount engine that supports several types of discounts — including order-level, product-level, and shipping promotions. Promotions are automatically applied to carts and orders based on configured criteria.

### [Key Components](#key-components)

The Omnium promotion system consists of:

*   **Omnium UI** – The primary interface for creating and managing promotions
*   **Promotion API** – For advanced management, automation, or integrations
*   **Promotion Engine** – Automatic application of discounts to orders and carts
*   **Promotion Types** – Various discount models for different business scenarios


## [Promotion Types](#promotion-types)

The system supports eight promotion types:

### [Product-Level Promotions (Order Line)](#product-level-promotions-order-line)

*   **Category/Brand Promotions** (`promotionType: 1`) – Discounts on specific categories or brands. Configure using `categoryAndBrandFilter` with the `reward` object.
*   **Multi-Buy Promotions** (`promotionType: 2`) – Quantity-based promotions such as "Buy 2 get 1 free", "3 for 2", or tiered discounts when purchasing multiple items.
    *   **Conditional Pricing** – Advanced MultiBuy feature that controls when promotional prices are displayed based on cart conditions
    *   **Tiered Pricing** – Progressive pricing based on quantity thresholds
*   **Kit Promotions** (`promotionType: 4`) – Bundle product discounts where customers must buy items from multiple component groups
*   **Product Search Promotions** (`promotionType: 5`) – Dynamic discounts based on product search criteria (tags, price range, stock status, etc.)
*   **Price List Promotions** (`promotionType: 6`) – Apply discounts from a predefined price list. Configure using `priceListId`. See [Price List Promotions](./priceListPromotionApiReference) for detailed documentation.
*   **Cost Price Promotions** (`promotionType: "CostPricePromotion"`) – Dynamically calculate selling prices from product cost prices with a configurable markup percentage. Links to a price list containing cost prices and applies the formula: `CostPrice x (1 + Markup%) x (1 + Tax%)`. See [Cost Price API Reference](./costPriceApiReference) for detailed documentation.

### [Order-Level Promotions](#order-level-promotions)

*   **Order Amount Promotions** (`promotionType: 3`) – Discounts based on order total and/or quantity (e.g. "$10 off orders over $100", "10% off when you buy 5+ items"). See [Order Amount API Reference](./orderAmountApiReference) for detailed documentation including minimum quantity and condition operator features.

### [Shipping Promotions](#shipping-promotions)

*   **Shipping Promotions** (`promotionType: 0`) – Free or discounted shipping based on order amount conditions. Configure using `shippingMethods` and `amountCondition`.


## [API Documentation](#api-documentation)

For detailed API documentation, including request/response schemas and examples:

*   [Promotions API Swagger Documentation](https://apitest.omnium.no/documentation/index.html#/Promotions) - Interactive API explorer
*   [MultiBuy & Mix and Match API Reference](./multibuyApiReference) - Comprehensive guide for MultiBuy promotions
*   [Kit Promotions API Reference](./kitPromotionApiReference) - Complete guide for bundle/kit promotions
*   [Conditional Pricing API Reference](./conditionalPricingApiReference) - Control when promotional prices are displayed based on cart conditions
*   [Tiered Pricing API Reference](./tieredPricingApiReference) - Guide for quantity-based tiered pricing
*   [Product Search API Reference](./productSearchApiReference) - Documentation for product search promotions
*   [Order Amount API Reference](./orderAmountApiReference) - Complete guide including minimum quantity and AND/OR conditions
*   [Price List Promotions](./priceListPromotionApiReference) - How price list promotions combine price lists with promotion features
*   [Cost Price API Reference](./costPriceApiReference) - Documentation for cost-plus pricing promotions
*   [Price Filters API Reference](./priceFilterApiReference) - Control which products are eligible based on their price type (discounted, member prices)


## [Automatic Promotion Application](#automatic-promotion-application)

Promotions are automatically applied to carts and orders when processed by Omnium. The system evaluates all active promotions that match the current market, store, and order context, and applies the relevant discounts before recalculating totals.

### [Cart Promotion Control](#cart-promotion-control)

Carts can be excluded from promotion evaluation by setting `IgnorePromotions = true`.


## [Promotion Priority System](#promotion-priority-system)

Promotions use a two-level priority system:

### [1\. Service Type Priority (Primary)](#1-service-type-priority-primary)

Promotions are processed in order by promotion service type:

1.  Order line promotions (product-level discounts)
2.  Shipping promotions
3.  Order-level promotions

### [2\. Promotion Priority (Secondary)](#2-promotion-priority-secondary)

Within each service type, promotions are sorted by:

1.  **Priority value** (ascending — lower numbers = higher priority)
2.  **Reward percentage** (descending — higher discounts first)

**Tip:** Don’t use priorities like 1, 2, 3. Use 100, 200, 300. It makes it easier to insert new campaigns later without editing existing ones.


## [Promotion Combination Logic](#promotion-combination-logic)

### [Combination Rules](#combination-rules)

Promotions can be combined based on the `CanBeCombinedWithOtherPromotions` property:

*   **`true`** – Can combine with other promotions
*   **`false`** – Cannot combine (mutually exclusive)

### [Additional Combination Controls](#additional-combination-controls)

*   **`AlwaysApply`** – Forces promotion application regardless of combination rules
*   **`DisallowCombinationWithCouponDiscounts`** – Prevents combination with coupon-based discounts
*   **`CanNotBeCombinedWithTags`** – List of promotion tags that prevent combination

### [Combination Evaluation](#combination-evaluation)

The system evaluates combination rules during promotion processing, filtering out conflicting promotions before final application.


## [Market and Store Filtering](#market-and-store-filtering)

### [Market Filtering](#market-filtering)

Promotions must specify target markets in the `markets` property. They will only apply to orders from those markets.

### [Store Filtering](#store-filtering)

Store filtering has two modes, controlled by `filterOnWarehouseStores`:

#### [Standard Store Filtering (`filterOnWarehouseStores = false`)](#standard-store-filtering-filteronwarehousestores--false)

*   Promotion applies if the order’s store ID is in the promotion’s `stores` list
*   Used for store-specific promotions

#### [Warehouse Store Filtering (`filterOnWarehouseStores = true`)](#warehouse-store-filtering-filteronwarehousestores--true)

*   Filters order lines by matching warehouse codes in shipments
*   Used for promotions targeting specific fulfillment locations

**Store Filtering Logic:**

*   If no stores are specified, the promotion applies to all stores
*   If `filterOnWarehouseStores` is false, checks the order’s store ID against the promotion’s store list
*   If `filterOnWarehouseStores` is true, filtering happens at shipment level


## [Order Type Filtering](#order-type-filtering)

Promotions can be restricted to specific order types using the `orderTypes` property.

**Order Type Filtering:**

*   If no order types are specified, the promotion applies to all order types (the most common setup)
*   If order types are specified, it only applies to matching orders

**Important:** Promotions with `orderTypes` specified do **not** generate product prices automatically, as they depend on order context. These prices won’t appear in PLPs or product pages but will be applied once items are added to the cart.


## [Price Generation](#price-generation)

### [Automatic Price Generation](#automatic-price-generation)

Some promotion types automatically generate product prices so they can be displayed in product list pages (PLP) or product detail pages (PDP).  
These prices are stored on the products themselves, or in the separate price index if _separate prices_ is enabled, allowing them to be fetched and displayed like regular prices.

Other promotion types, such as multi-buy or order-level promotions, are only evaluated when items are added to a cart. Their value depends on the full order context, for example, a "3 for 2" offer can’t produce a single discounted price until all three items are in the cart.

A promotion will generate product prices when:

1.  The promotion type supports price generation
2.  `isBonusPointsReward` is false
3.  `orderTypes` is not set
4.  No coupon code is required

### [Promotion Types and Price Generation](#promotion-types-and-price-generation)

Promotion Type

Generates Prices

Shipping Promotions (0)

No

Category/Brand Promotions (1)

Yes

Multi-Buy Promotions (2)

No

Order Amount Promotions (3)

No

Kit Promotions (4)

No

Product Search Promotions (5)

Yes

Price List Promotions (6)

Yes

Cost Price Promotions

Yes


## [Price Filters](#price-filters)

Price filters allow you to control which products are eligible for a promotion based on their price type. This is useful when you want to prevent promotions from stacking on top of already-discounted or member-specific prices, or conversely, when you want a promotion to apply only to products that are already on sale or have member pricing.

### [How It Works](#how-it-works)

Price filtering is controlled by three properties on the promotion:

Property

Type

Description

`priceFilterMode`

string

Controls the filtering behavior: `None` (default), `Exclude`, or `Include`

`priceTypeFilter`

string

Which price types to filter on: `Discounted`, `MemberPrice`, or both (`Discounted, MemberPrice`)

`useDiscountedPriceAsBase`

bool

When `true`, calculates the discount from the already-discounted price instead of the original price

### [Price Filter Mode](#price-filter-mode)

*   **`None`** (default) — No filtering. All products are eligible regardless of their price type.
*   **`Exclude`** — Products matching the selected price types are removed from the promotion.
*   **`Include`** — Only products matching the selected price types are eligible for the promotion.

### [Price Types](#price-types)

The `priceTypeFilter` property uses a flags-based system:

*   **`Discounted`** — Regular sale/discounted prices where the product has a discount amount and is not a customer club specific price.
*   **`MemberPrice`** — Customer club specific prices (member prices).
*   **`Discounted, MemberPrice`** — Both types (combined).

**Classification priority:** Member prices always take priority. A price marked as a customer club specific price is always classified as `MemberPrice`, regardless of whether it also has a discount amount.

### [Use Discounted Price as Base](#use-discounted-price-as-base)

When `useDiscountedPriceAsBase` is set to `true`, the promotion calculates its discount from the already-discounted price instead of the original price. This is only relevant when the promotion allows discounted products (i.e., when discounted prices are not excluded).

**Example:** A product has an original price of $100 and a sale price of $80. With a 10% promotion:

*   **`useDiscountedPriceAsBase: false`** (default) — 10% off $100 = $10 discount
*   **`useDiscountedPriceAsBase: true`** — 10% off $80 = $8 discount

### [Where Price Filters Apply](#where-price-filters-apply)

Price filters apply in two contexts:

1.  **Price generation** — When the promotion generates product prices for display in product listings and detail pages, the filter determines which existing prices are eligible for promotional pricing.
2.  **Cart/order evaluation** — When the promotion is evaluated at checkout, the filter determines which order lines are eligible for the discount based on the product's prices.

### [Common Use Cases](#common-use-cases)

Scenario

Configuration

Never discount already-discounted products

`priceFilterMode: "Exclude"`, `priceTypeFilter: "Discounted"`

Never discount member prices

`priceFilterMode: "Exclude"`, `priceTypeFilter: "MemberPrice"`

Only discount products that are already on sale

`priceFilterMode: "Include"`, `priceTypeFilter: "Discounted"`

Exclude both discounted and member prices

`priceFilterMode: "Exclude"`, `priceTypeFilter: "Discounted, MemberPrice"`

Apply discount on top of sale price (stacking)

`priceFilterMode: "None"`, `useDiscountedPriceAsBase: true`

For full API documentation including request/response examples, see the [Price Filters API Reference](./priceFilterApiReference).


## [Coupon Management](#coupon-management)

### [Coupon Types](#coupon-types)

1.  **Primary Coupon** – Single coupon code for the promotion
2.  **Additional Coupons** – Multiple coupon codes for the same promotion
3.  **Personal Coupons** – Customer-specific coupons assigned to individual customers

### [Coupon Usage Tracking](#coupon-usage-tracking)

Coupon usage is tracked, and single-use coupons cannot be redeemed more than once. Attempts to reuse a redeemed coupon will result in an error.

### [External Coupon Providers](#external-coupon-providers)

The system supports integration with external coupon validation systems for loyalty programs and third-party discount providers.


## [Best Practices](#best-practices)

### [1\. Promotion Design](#1-promotion-design)

*   Use clear and consistent priority values
*   Consider combination rules when creating campaigns
*   Test with different order types if you use order-type restrictions
*   Validate market and store targeting before deployment

### [2\. Testing](#2-testing)

*   Test combinations well before major campaigns like Black Friday
*   Verify market and store filtering with realistic order data
*   Use realistic data volumes during testing
*   Validate price generation for promotion types that support it

[

Previous

Setting Up Prices

](/docs/Prices/SettingUpPrices)[

Next

MultiBuy

](/docs/Prices/Promotions/multibuyApiReference)

---


## Setting Up Prices

[Prices](/docs/Prices)

# Setting Up Prices

How to set up and manage prices in Omnium - choosing the right approach for your integration, using price lists for manual management, and keeping your price model efficient.


## [Where Do Prices Come From?](#where-do-prices-come-from)

Products in Omnium need prices. But where should those prices come from, and how do you keep them up to date?

If you're integrating with an ERP or pricing system, you'll typically sync prices via API. If product managers or store managers need to manage prices manually (or override ERP prices for specific stores), you can use price lists in the Omnium UI.


## [Choosing Your Approach](#choosing-your-approach)

There are three ways to get prices into Omnium:

Approach

Best For

**Price API**

Automated sync from ERP or pricing systems. Prices update immediately.

**Price Lists**

User-managed prices in the Omnium UI, with an activation workflow. Great for store-specific overrides.

**Product API**

Including prices when you create or update products. Useful if prices are part of your product feed.

These approaches can be combined. For example, you might sync base prices from an ERP via the Price API, and use Price Lists for store-specific overrides. You can also edit prices directly on products in the Omnium UI.

* * *


## [Managing Prices via API](#managing-prices-via-api)

If your prices come from an ERP, PIM, or other external system, use the price API to sync them to Omnium. Prices take effect immediately after the API call, no activation step required.

### [Endpoint](#endpoint)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/prices/AddMany

### [Request Structure](#request-structure)

The API expects a list of price update requests. Each request targets a specific product:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "productId": "PROD-001",
        "prices": [
          {
            "code": "SKU-001",
            "unitPrice": 299.00,
            "currencyCode": "NOK",
            "marketId": "NOR",
            "validFrom": "2025-01-01T00:00:00Z"
          }
        ],
        "ignoreDates": true
      }
    ]

### [What the API Handles](#what-the-api-handles)

The `ignoreDates` and `ignoreValidUntilDate` parameters control how existing prices are matched when updating:

Parameter

Default

What It Does

`ignoreDates`

`false`

When `true`, replaces existing prices regardless of their validity dates

`ignoreValidUntilDate`

`false`

When `true`, matches on `validFrom` only (ignores `validUntil`)

**Typical usage:**

*   Use `ignoreDates: true` for full price syncs where you want to replace all existing prices
*   Use `ignoreDates: false` when updating prices for specific date ranges

### [Price Fields](#price-fields)

For a complete list of price fields, see the [Prices overview](./index). The most commonly used fields are:

Field

Description

`code`

SKU identifier. Omit this for product-level prices (applies to all variants).

`unitPrice`

The selling price

`currencyCode`

Currency (e.g., `NOK`, `SEK`, `EUR`)

`marketId`

Target market

`storeId`

Target store (for store-specific prices)

`validFrom` / `validUntil`

Validity period

`customerId` / `customerGroup`

For customer-specific pricing

### [Discounts and the Promotion Engine](#discounts-and-the-promotion-engine)

If you're sending discounted prices from an external system, you should typically set `isExternalPromotion: true`. This tells Omnium that the discount comes from an external source, so the Omnium promotion engine won't apply additional discounts on top.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "code": "SKU-001",
      "unitPrice": 499.00,
      "originalUnitPrice": 599.00,
      "discountAmount": 100.00,
      "currencyCode": "NOK",
      "marketId": "NOR",
      "isExternalPromotion": true
    }

* * *


## [Including Prices in Product Updates](#including-prices-in-product-updates)

If your product feed already includes prices, you can include them when creating or updating products via the Product API. The prices go in the `prices` array on the product. See the [Prices overview](./index) for the recommended structure.

This is convenient when prices and product data come from the same source. For dedicated price syncs, use the Price API instead.

* * *


## [Managing Prices via Price Lists](#managing-prices-via-price-lists)

Price lists let users manage prices through the Omnium UI without needing API access. They're useful for:

*   Store managers adjusting prices for their location
*   Regional pricing that differs from the base price
*   Controlled price changes with activation/deactivation workflow

### [How Price Lists Work](#how-price-lists-work)

1.  Create a price list with target market, stores, and validity dates
2.  Add products with their prices
3.  **Activate** the price list. Prices are transferred to the products.
4.  **Deactivate** when done. Prices are removed from the products.

Price lists are a **management tool**. When you activate a price list, the prices are transferred to the products themselves.

> **Important:** The actual prices used in carts and orders always come from the product, not from the price list directly.

### [When to Use Price Lists](#when-to-use-price-lists)

Price lists work well when:

*   Users need to manage prices without API access
*   You want controlled activation/deactivation of price changes
*   You need an audit trail for price changes

Price lists are **not** the best fit when:

*   Prices are fully managed by an external system
*   You need prices to update immediately without an activation step
*   Prices change multiple times per day

### [Creating a Price List](#creating-a-price-list)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/pricelists/AddPriceList

**Required fields:** `id`, `name`, `currencyCode`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "oslo-flagship-2025",
      "name": "Oslo Flagship Store Prices",
      "currencyCode": "NOK",
      "marketId": "NOR",
      "storeIds": ["STORE-OSLO-01"],
      "priceListType": "Price",
      "validFrom": "2025-01-01T00:00:00Z",
      "validTo": "2025-12-31T23:59:59Z"
    }

### [Adding Items](#adding-items)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/pricelists/AddPriceListItems

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "priceListId": "oslo-flagship-2025",
        "skuId": "SKU-001",
        "unitPrice": 449.00
      }
    ]

Each item needs `priceListId` plus either `skuId` (variant-level) or `productId` (product-level).

### [Activating and Deactivating](#activating-and-deactivating)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/pricelists/ActivatePriceList/{priceListId}
    POST /api/pricelists/DeactivatePriceList/{priceListId}

### [Price List Types](#price-list-types)

PriceListType

What It Creates

`Price`

Sales prices only

`CostPrice`

Cost prices only

`PriceAndCostPrice`

Both

* * *


## [Common Pattern: RRP with Store Overrides](#common-pattern-rrp-with-store-overrides)

A typical setup combines both approaches:

1.  **Base prices (RRP)** synced from ERP via the price API
2.  **Store-specific overrides** managed through price lists in the UI

### [Example](#example)

**Step 1:** ERP syncs the base price

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/prices/AddMany

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "productId": "PROD-001",
        "prices": [
          {
            "code": "SKU-001",
            "unitPrice": 499.00,
            "currencyCode": "NOK",
            "marketId": "NOR",
            "validFrom": "2025-01-01T00:00:00Z"
          }
        ],
        "ignoreDates": true
      }
    ]

This price applies to all stores in the NOR market.

**Step 2:** Store manager creates a price list for their store with a lower price (449.00)

**Step 3:** When activated, the store-specific price takes precedence for that store (see [Price Prioritization](./PricePrioritization))

**Step 4:** When deactivated, the base RRP applies again

This pattern gives your ERP control over base pricing while letting store managers adjust prices locally.

* * *


## [Separate Price Storage](#separate-price-storage)

By default, prices are stored directly on the product. For products with many prices (150+ per product), this can make product documents large and slow to update.

Omnium supports storing prices separately from the product. When enabled:

*   Product searches still return the relevant price for the current context
*   You get dedicated price search endpoints for bulk operations
*   Price updates don't touch the product itself

**Trade-off:** Product searches will be slower with separate prices enabled. Only use this if you have very large price sets that would otherwise bloat your product documents.

This is primarily useful for **B2B scenarios with extensive customer-specific pricing**, for example when a single product might have hundreds or thousands of different prices for different customers.

> The API works the same way regardless of how prices are stored internally. Contact support if you think you need this enabled.

* * *


## [Cost Price Options](#cost-price-options)

Cost prices can be stored in several ways:

Option

Description

Considerations

**Product.Cost**

Single cost value on the product

Simple, but only one cost per product

**Price.Cost**

Cost field on each price

Tied to the number of prices you have

**Separate Cost Prices**

Dedicated cost price documents

Most flexible, supports additional dimensions

Separate cost prices support fields not available on regular prices:

Field

Description

`storeGroupId`

Target a group of stores

`supplier`

Supplier identifier

`type`

Cost price type

### [Cost Price API](#cost-price-api)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/costprices/AddMany
    POST /api/costprices/Search
    DELETE /api/costprices

* * *


## [Price Dimensions](#price-dimensions)

Prices can be targeted using these dimensions:

Dimension

Description

`marketId`

Specific market

`marketGroupId`

Group of markets

`storeId`

Specific store

`customerId`

Specific customer

`customerGroup`

Customer group (B2B)

`validFrom` / `validUntil`

Validity period

`unit`

Unit-specific (e.g., "box", "pallet")

Note: `storeGroupId` is available on cost prices and price lists, but not on regular prices. For store-group pricing, use a price list with multiple `storeIds`.

* * *


## [Best Practices](#best-practices)

### [Keep Your Price Model Slim](#keep-your-price-model-slim)

Products with hundreds of prices are slower to fetch and update. A few tricks help:

**Use market groups instead of duplicating prices.**

If you have multiple markets that share the same price (e.g., regional franchises or sales channels), group them:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      { "unitPrice": 100, "marketGroupId": "RETAIL", "currencyCode": "NOK" }
    ]

One price covers all markets in the group.

**Use product-level prices when variants share the same price.**

If all your size variants cost the same, skip the `code` field entirely:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      { "unitPrice": 100, "currencyCode": "NOK", "marketId": "NOR" }
    ]

This single price applies to all variants on the product.

**Define a base price and only add overrides where needed:**

The [price prioritization rules](./PricePrioritization) ensure the most specific price is selected. You don't need to define every combination, just the base price and any exceptions.

* * *


## [Related](#related)

*   [Prices Overview](./index) - Price structure, ID generation, external price services
*   [Price Prioritization](./PricePrioritization) - How prices are selected when multiple valid prices exist
*   [Price Lists](./PriceLists) - Detailed price list functionality
*   [Prices and Tax](./PricesAndTax) - Tax handling
*   [Promotions](./Promotions/promotions) - Campaign discounts and promotion engine

[

Previous

Pricing and Promotions Overview

](/docs/Prices/pricing-and-promotions)[

Next

Promotions

](/docs/Prices/Promotions)