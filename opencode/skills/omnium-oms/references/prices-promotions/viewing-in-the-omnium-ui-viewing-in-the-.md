# Prices & Promotions — Lists, Rules & Campaigns — [Viewing in the Omnium UI](#viewing-in-the-omnium-ui)

## [Viewing in the Omnium UI](#viewing-in-the-omnium-ui)

When the feature is enabled, the lowest price history is visible in the Omnium UI:

*   **Product detail page:** A "Lowest Price" section displays the tracked price history per market, including the recorded price, currency, market, and date.
*   **Price editor:** When editing prices, a "Lowest Price" tab shows the full history and allows manual adjustments if needed.
*   **Configuration:** The threshold (number of days) is shown under `Configuration → Products → Lowest Price`.

[

Previous

Price prioritization rules

](/docs/Prices/PricePrioritization)[

Next

Prices and Tax

](/docs/Prices/PricesAndTax)

---


## Price list

[Prices](/docs/Prices)

# Price list

Create price lists to manage prices


## [Introduction](#introduction)

A price list is composed of two components: the price list and price list items. The price list contains information such as the type and market it applies to.  
The price list items represent the prices for each SKU.

Each price list item must correspond to a specific SKU, meaning that prices from the price list are always variant-specific.

It is possible to control whether prices should be applied at the variant level or the product level using the setting: `IsPricesStoredOnlyOnProduct`.

* * *


## [Create a New Price List](#create-a-new-price-list)

You can use a price list for different purposes, depending on the type you select:

*   **Default**: Standard price list functionality used to set prices directly.
*   **Price Factor**: Used as a conversion factor, not for assigning specific prices.

The **List Type** determines what kind of prices the price list generates. When activating the price list, you can choose to generate:

*   **Sales prices**
*   **Cost prices**
*   **Both**

For example, you might configure a price list to generate only cost prices for the products it includes.

* * *


## [Add Price List Items to a Price List](#add-price-list-items-to-a-price-list)

Price list items can be added using the user interface (GUI), Excel import, or the API.

* * *


## [Activate and Deactivate the Price List](#activate-and-deactivate-the-price-list)

When products are added to the cart, the price is taken from the product—not directly from the price list.  
This means that prices defined in the price list must be applied to the product in order to take effect. The **Activate** (or **Update**) button performs this function: it copies the price from the price list item to the product and marks the item as active.

As a result, whenever new items are added to a price list, the list must be updated (republished) to apply those prices to the products.

[

Previous

Campaign Performance

](/docs/Prices/Campaigns/campaign-performance)[

Next

Price prioritization rules

](/docs/Prices/PricePrioritization)

---


## Price prioritization rules

[Prices](/docs/Prices)

# Price prioritization rules

Before adding prices to a product, it's important to understand how prices are prioritized. This includes filtering, sorting and selecting defaults based on the contextual input and available price configurations.


## [Introduction](#introduction)

A product can have multiple prices depending on where it's sold and who is buying it. For example, different prices may apply based on the store, market, or specific customer.

Default prices are used in general product listings (e.g., product overview pages) and when a product is added to the shopping cart. These prices are selected based on a prioritization strategy that considers contextual information like market, store, customer, and other attributes.

Each price can have various conditions that determine its applicability:

**Condition**

**Explanation**

Market

A price is valid only in a specific market. The currency of the price must match the market's currency.

Store

A price can be valid for a specific store, or all stores.

Store Group

To target multiple stores, a store group can be used.

Customer

A price can be valid for one specific customer.

Customer Group

Only applicable in B2B markets; prices can be targeted to customer groups when market type is B2B.

Date

The validity of a price can be limited to a specific date interval.

Unit

Prices can apply to a specific unit (e.g., box, pallet). The unit price will be the total price for that unit.


## [Valid prices](#valid-prices)

A product may have many prices, and not all are valid in every context. When searching or displaying prices, only those valid in the current context (market, store, customer, etc.) will be returned.

The following matrix shows how different property values affect price validity:

**Property**

**Context.Property not given**

**Price.Property not given**

**Context.Property matches Price.Property**

**Explanation**

**Market**

✓

✓

✓

If no market is given, all prices are considered. If a price has no market, it’s valid in any market. Market groups are also considered. Currency must match.

**Store**

✓

✓

✓

Prices not scoped to any store are valid everywhere, but a store-specific price is prioritized..

**Store group**

❌

✓

✓

Store group prices require the context to include a matching group; otherwise, they are ignored.

**Customer**

❌

✓

✓

Prices with a customer ID are only valid for that customer. If no match on customerId, general prices apply.

**Customer group**

❌

✓

✓

Customer group specific prices are not valid in context without a specific customer group.

**Unit Matching**

✓

✓

✓

Unit-specific prices are used when context matches. Prices with no unit are fallback options.


## [Sorting strategy](#sorting-strategy)

When multiple valid prices exist, the system uses the following sorting strategy to determine which price to use first:

**Priority**

**Condition**

**Notes**

1st

`store?.Id == y.StoreId`

Prefer store-specific prices

2nd

`storeGroupIds?.Contains(x.StoreGroupId)`

Then check for store group

3rd

`x.Unit == unit`

Then match on unit

4th

`y.UnitPrice`

Then prefer lowest price

5th

`x.PromotionId` (descending)

Finally, use highest promotion ID


## [Default price strategy](#default-price-strategy)

When adding a product to the cart or displaying the default price in a list, the system looks for the best matching price using a hierarchical prioritization:

Prioritization Logic:

### [Notes on Market Condition](#notes-on-market-condition)

*   A price should always exist within the context of a market.
*   If no market is explicitly selected, the default market is used.
*   The default market is the one marked with IsDefaultMarket = true in the settings. If multiple markets are marked as default, the first one found is used.
*   The selected price must also match the currency and content language of the market.


## [Examples: Price Prioritization Scenarios](#examples-price-prioritization-scenarios)

These examples demonstrate how the system prioritizes prices under different combinations of conditions such as market, store, customer, units, dates, and promotions.

* * *

### [Example 1: Expired Price](#example-1-expired-price)

**Setup:**

Price ID

Valid From

Valid To

Price

P1

2025-01-01

2025-06-01

10

P2

2025-06-01

2025-12-31

12

**Context Date:**  
`2025-06-15`

**Selected Price:** `P2`  
**Reason:**

*   P1 is expired
*   P2 is within valid date range

* * *

### [Example 2: Store Group vs. Individual Store](#example-2-store-group-vs-individual-store)

**Setup:**

Price ID

Store

Store Group

Price

P1

—

groupA

20

P2

store1

—

19

**Context:**  
`Store = store1`, where `store1 ∈ groupA`

**Selected Price:** `P2`  
**Reason:**

*   Direct store match (P2) has higher priority than store group match (P1)

* * *

### [Example 3: Unit-Specific vs. General Price](#example-3-unit-specific-vs-general-price)

**Setup:**

Price ID

Unit

Price

P1

—

5

P2

kg

4.5

#### [Case A: `Unit = "kg"`](#case-a-unit--kg)

Selected Price: `P2` (unit-specific match)

#### [Case B: `Unit = (not specified)`](#case-b-unit--not-specified)

Selected Price: `P1` (general price)  
P2 is valid but not prioritized unless unit is requested

* * *

### [Example 4: Multiple Promotions and Lowest Price](#example-4-multiple-promotions-and-lowest-price)

**Setup:**

Price ID

Store

Unit Price

Promotion ID

P1

store1

7

100

P2

store1

6

200

P3

store1

6

150

**Context:**  
`Store = store1`

**Selected Price:** `P2`  
**Reason:**

*   All prices are valid
*   Prices P2 and P3 are tied on unit price
*   P2 wins due to higher Promotion ID (200 vs. 150)

* * *

### [Example 5: Default Market Behavior](#example-5-default-market-behavior)

**Market Setup:**

Market

IsDefaultMarket

US

✓

EU

**Price Setup:**

Price ID

Market

Price

P1

US

8

P2

—

9

#### [Case A: `No market specified`](#case-a-no-market-specified)

Selected Price: `P1` (from default market)

#### [Case B: `No price for default market`](#case-b-no-price-for-default-market)

Selected Price: `P2` (market-agnostic fallback)

* * *

### [Example 6: Customer and Store — Store Match Wins](#example-6-customer-and-store--store-match-wins)

**Setup:**

Price ID

Customer

Store

Price

P1

—

—

8

P2

customer1

—

9

P3

—

store1

10

**Context:**  
`Customer = customer1`, `Store = store1`

**Selected Price:** `P3`  
**Reason:**

*   P3 (store-specific) has higher priority than P2 (customer-specific)
*   Both P2 and P3 are more specific than the default (P1)

* * *

### [Example 7: Customer and Store — Exact Match Overrides](#example-7-customer-and-store--exact-match-overrides)

**Setup:**

Price ID

Customer

Store

Price

P1

customer1

store1

8

P2

customer1

—

9

P3

—

store1

7

**Context:**  
`Customer = customer1`, `Store = store1`

**Selected Price:** `P1`  
**Reason:**

*   P1 has an exact match for both customer and store
*   It overrides more general store-only or customer-only prices

* * *

### [Example 8: Store Group vs Customer — Store Wins](#example-8-store-group-vs-customer--store-wins)

**Setup:**

Price ID

Customer

Store Group

Price

P1

customer1

—

9

P2

—

group1

8

**Context:**  
`Customer = customer1`, `Store in group1`

**Selected Price:** `P2`  
**Reason:**

*   Store group match takes precedence over customer match (per prioritization strategy)

* * *

### [Example 9: No Match — Fallback to General](#example-9-no-match--fallback-to-general)

**Setup:**

Price ID

Customer

Store

Price

P1

—

—

13

**Context:**  
`Customer = customer1`, `Store = store1`

**Selected Price:** `P1`  
**Reason:**

*   No specific price for either store or customer
*   Falls back to general/default price

* * *

### [Example 10: Customer Group in B2C Market (Ignored)](#example-10-customer-group-in-b2c-market-ignored)

**Setup:**

Price ID

Customer Group

Market Type

Price

P1

—

B2C

15

P2

groupA

B2C

14

**Context:**  
`Market = B2C`, `CustomerGroup = groupA`

**Selected Price:** `P1`  
**Reason:**

*   Customer group pricing is ignored in B2C markets

* * *

[

Previous

Price list

](/docs/Prices/PriceLists)[

Next

Lowest price history

](/docs/Prices/lowest-price)

---


## Prices and Tax

[Prices](/docs/Prices)

# Prices and Tax

Prices can be defined with or without tax, and appear with or without tax in different contexts.


## [Overview](#overview)

Prices in the system can be defined **including** or **excluding** tax.  
However, tax handling depends on several contexts:

1.  **How prices are stored** – whether the price value includes tax.
2.  **How prices are used** – whether tax should be applied or removed when calculating totals (for example, in the cart).
3.  **How prices are displayed** – whether the user interface should show prices including or excluding tax.

These behaviors are controlled by a few key settings.

* * *


## [Key Settings](#key-settings)

Setting

Level

Description

`price.IsTaxExcluded`

Price

Indicates whether the stored price is **excluding tax** (`true`) or **including tax** (`false`).

`market.IsTaxExcluded`

Market

Defines whether tax should be **excluded in the cart** (for example, in a B2B market). This does **not** act as a default for `price.IsTaxExcluded`.

`price.TaxRate`

Price

The specific tax rate for this price.

`market.DefaultTaxRate`

Market

The default tax rate to use when a price does not define its own `TaxRate`.

* * *


## [Tax on Prices](#tax-on-prices)

Price values are represented by the `UnitPrice` property on the **Price** object.

*   If `price.IsTaxExcluded = false`, `UnitPrice` **includes tax**.
*   If `price.IsTaxExcluded = true`, `UnitPrice` **excludes tax**.
*   If `price.TaxRate` is not defined, the system falls back to:
    1.  `market.DefaultTaxRate`, or
    2.  the global default tax rate (0 if not configured).

Unit price includes tax

Unit prices excludes tax

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FPrice-setting-incTax.95f9779b.png&w=3840&q=75)

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FPrice-setting-exTax.a27a3f86.png&w=3840&q=75)

**Example:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    UnitPrice = 100
    TaxRate = 25%
    If IsTaxExcluded = false → Base = 80, Tax = 20
    If IsTaxExcluded = true → Base = 100, Tax = added when used


## [Tax in Cart](#tax-in-cart)

When prices are shown in a cart or order context, the tax behavior is determined by the **Market** settings.

Setting

Description

`market.IsTaxExcluded`

Determines whether tax should be **excluded from the cart total** (used for B2B contexts).

`market.ShowOrderLinesExcludingTax`

Controls whether **order lines** should be displayed without tax.

If `market.IsTaxExcluded = true`, the tax rate used in the cart will be set to **0**.  
This means that, regardless of whether the original price included or excluded tax, the **cart total** will not include tax.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FTax-settings-market.deae2382.png&w=3840&q=75)

* * *


## [Examples](#examples)

Case

Price: UnitPrice = 10, TaxRate = 25

Market

Result

1

Price **includes** tax

Market **includes** tax

Cart price = 10, Tax = 2

2

Price **excludes** tax

Market **includes** tax

Cart price = 12.5, Tax = 2.5

3

Price **includes** tax

Market **excludes** tax

Cart price = 8, Tax = 0

4

Price **excludes** tax

Market **excludes** tax

Cart price = 10, Tax = 0

* * *


## [Working with B2B Prices](#working-with-b2b-prices)

In a **Business-to-Business (B2B)** context:

*   The tax is usually **excluded** in the cart.
*   This is controlled by the `market.IsTaxExcluded` property.
*   The actual price definitions can still include or exclude tax (`price.IsTaxExcluded`).

This corresponds to **Case 3 and Case 4** in the examples above.

* * *


## [Override “Show Tax” Setting](#override-show-tax-setting)

The setting `market.ShowOrderLinesExcludingTax` determines whether order lines should be shown without tax. The tax display preference can also be overridden **per user profile**, rather than for the entire tenant.  
If a price is shown without tax, the label `ex. mva` (excluding VAT) will appear next to the price.

This can be set in the tax settings section in the profile view:

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FTax-setting-userProfile.637e170a.png&w=3840&q=75)

When a tax setting is set in the profile view, an icon will appear on the top of the page:

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FOverride-tax-setting.0d8039cf.png&w=3840&q=75)

[

Previous

Lowest price history

](/docs/Prices/lowest-price)[

Next

Projects

](/docs/Projects)

---


## Pricing and Promotions Overview

[Prices](/docs/Prices)

# Pricing and Promotions Overview

How pricing works in Omnium — the relationship between price creation, price storage, promotions, and how the right price reaches your customer.


## [The Big Picture](#the-big-picture)

Understanding pricing in Omnium starts with one key concept: **price creation and price storage are separate concerns**.

Prices in Omnium are always **stored on products** (or in a dedicated price index for large catalogs). But prices can be **created** by many different mechanisms — an API call, a price list, a promotion, or an external system. Once a price is created, it lives on the product like any other price, regardless of where it came from.

This separation means you can mix and match pricing strategies without changing how prices are consumed. Your e-commerce frontend, cart engine, and API integrations all read prices from the same place — the product — no matter how those prices got there.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

                            PRICE CREATION
      ┌───────────────────────────────────────────────┐
      │                                               │
      │  Price API    Price Lists    Promotions        │
      │  (ERP sync)   (UI mgmt)     (campaigns)       │
      │     │             │             │              │
      │  Product API  External      Future             │
      │  (in feed)    Price Svc     features           │
      │     │             │             │              │
      └─────┼─────────────┼─────────────┼──────────────┘
            │             │             │
            ▼             ▼             ▼
    
                         PRICE STORAGE
      ┌───────────────────────────────────────────────┐
      │     Products  (or separate price index)       │
      └───────────────────────────────────────────────┘
                            │
                            ▼
    
                       PRICE CONSUMPTION
      ┌───────────────────────────────────────────────┐
      │  Product pages · Cart / Checkout · API        │
      └───────────────────────────────────────────────┘

* * *


## [How Prices Are Created](#how-prices-are-created)

Omnium offers several ways to create prices, each suited to different scenarios:

Mechanism

How it works

Best for

**[Price API](/docs/Prices/SettingUpPrices#managing-prices-via-api)**

Send prices directly via `PUT /api/prices/AddMany`. Prices take effect immediately.

Automated sync from ERP or pricing systems

**[Price Lists](/docs/Prices/SettingUpPrices#managing-prices-via-price-lists)**

Create a price list in the UI, add products and prices, then activate. Prices are transferred to products on activation.

Store managers, controlled overrides, manual management

**[Product API](/docs/Prices/SettingUpPrices#including-prices-in-product-updates)**

Include prices in the `prices` array when creating or updating products.

Product feeds that include pricing

**[Promotions](/docs/Prices/Promotions)**

Define campaign rules. Promotion types that support price generation automatically create prices on matching products.

Campaigns, seasonal sales, category discounts

**[External Price Service](/docs/Prices)**

A connector fetches prices from your own pricing system at query time.

Edge cases where prices can't be synced to Omnium

These approaches can be combined freely. For example, you might sync base prices from an ERP via the Price API, use price lists for store-specific overrides, and use promotions for seasonal campaigns — all at the same time. The [price prioritization rules](/docs/Prices/PricePrioritization) determine which price wins when multiple apply.

* * *


## [How Prices Are Stored](#how-prices-are-stored)

All prices end up in one of two places:

*   **On the product** — The default. Prices are part of the product document and returned with every product query.
*   **In a separate price index** — For products with very large price sets (150+ prices per product, common in B2B with customer-specific pricing). Prices are stored separately but still returned with product searches.

The storage mechanism is transparent to consumers. Whether a price came from the API, a price list, or a promotion, it looks the same once stored.

For details on price structure, levels, and ID generation, see the [Prices reference](/docs/Prices).

* * *


## [How Prices Are Selected](#how-prices-are-selected)

When a product has multiple valid prices (different markets, stores, customers, date ranges), Omnium uses a prioritization strategy to select the most relevant one:

1.  **Unit-specific** prices take highest priority
2.  Then **store-specific** prices
3.  Then **store group** prices
4.  Then **customer-specific** prices
5.  Then **market-level** prices

Within each level, the lowest price wins. For the complete rules and examples, see [Price Prioritization](/docs/Prices/PricePrioritization).

* * *


## [How Promotions Fit In](#how-promotions-fit-in)

Promotions serve a dual purpose in the pricing system:

### [1\. Price generation (pre-cart)](#1-price-generation-pre-cart)

Some promotion types automatically generate prices on products when the promotion is active. These prices appear in product listings and search results, so customers see the promotional price before adding anything to their cart.

Promotion Type

Generates prices on products

Category / Brand

Yes

Product Search

Yes

Price List

Yes

Multi-Buy

No (depends on cart context)

Order Amount

No (depends on cart context)

Kit

No (depends on cart context)

Shipping

No (applies to shipping, not products)

When a price-generating promotion is activated, Omnium calculates the promotional price for every matching product and stores it alongside the product's other prices. When the promotion ends or is deactivated, those prices are removed.

### [2\. Cart-time discounts (at checkout)](#2-cart-time-discounts-at-checkout)

All promotion types are evaluated when items are in a cart. The promotion engine checks active promotions against the cart contents, customer, market, and store, and applies matching discounts. This is where context-dependent promotions like multi-buy ("3 for 2") and order-amount discounts ("10% off orders over 1,000 NOK") take effect.

* * *


## [Promotion Types at a Glance](#promotion-types-at-a-glance)

Type

Scope

Example

**[Category / Brand](/docs/Prices/Promotions)**

Order line

"20% off all Nike products"

**[Multi-Buy](/docs/Prices/Promotions/multibuyApiReference)**

Order line

"Buy 2, get 1 free" or "3 for 499 NOK"

**[Tiered Pricing](/docs/Prices/Promotions/tieredPricingApiReference)**

Order line

"1 for 199, 2 for 349, 3 for 449"

**[Conditional Pricing](/docs/Prices/Promotions/conditionalPricingApiReference)**

Order line

Custom prices that activate when multi-buy conditions are met

**[Kit / Bundle](/docs/Prices/Promotions/kitPromotionApiReference)**

Order line

"Complete outfit — 20% off when buying shirt + pants + shoes"

**[Product Search](/docs/Prices/Promotions/productSearchApiReference)**

Order line

"15% off all items tagged 'clearance'"

**Price List**

Order line

Apply prices from a specific price list as a promotion

**[Order Amount](/docs/Prices/Promotions/orderAmountApiReference)**

Order

"100 NOK off orders over 1,000 NOK"

**Shipping**

Shipping

"Free shipping on orders over 500 NOK"

* * *


## [Promotion Conditions and Targeting](#promotion-conditions-and-targeting)

Every promotion can be targeted using a combination of conditions:

### [Who sees it](#who-sees-it)

Condition

Description

**Markets**

Apply only in specific markets

**Stores**

Apply only in specific stores (or exclude specific stores)

**Customer groups**

Apply only to customers in specific groups

**Customer club members**

Restrict to loyalty program members

**Order types**

Apply only to certain order types (e.g., B2C only)

### [What it applies to (product-level promotions)](#what-it-applies-to-product-level-promotions)

Filter

Description

**Categories**

Include or exclude product categories

**Brands**

Include or exclude brands

**Products / SKUs**

Target or exclude specific products

**Seasons**

Include or exclude seasonal collections

**Properties**

Filter by custom product properties (e.g., color, material)

### [When it's active](#when-its-active)

Condition

Description

**Active from / to**

Date range for the promotion

**Coupon code**

Require a code to activate

**Minimum order amount**

Require a minimum cart value

**Minimum quantity**

Require a minimum number of items

* * *


## [Coupon Codes](#coupon-codes)

Promotions can optionally require a coupon code. Three types are supported:

Type

Description

**Primary coupon**

A single code for the promotion (e.g., `SUMMER25`)

**Additional coupons**

Multiple codes for the same promotion, optionally single-use

**Personal coupons**

Codes assigned to individual customers (via their customer profile or the loyalty program)

When a coupon code is required, the promotion does not generate prices on products — it only applies at cart time when the customer enters the code.

* * *


## [Promotion Priority and Stacking](#promotion-priority-and-stacking)

### [Priority](#priority)

Promotions are evaluated in order:

1.  **By type** — Order-line promotions first, then shipping, then order-level
2.  **By priority value** — Lower numbers are evaluated first (use increments like 100, 200, 300 to leave room for future campaigns)
3.  **By discount value** — Higher discounts are preferred when priorities are equal

### [Stacking rules](#stacking-rules)

Setting

Effect

`CanBeCombinedWithOtherPromotions`

When `false`, this promotion is mutually exclusive — only the best single promotion applies

`AlwaysApply`

Forces the promotion to apply regardless of other stacking rules

`DisallowCombinationWithCouponDiscounts`

Prevents combining with any coupon-activated promotion

`CanNotBeCombinedWithTags`

Prevents combining with promotions that have specific tags

Test your promotion combinations before major campaigns. Unexpected stacking can lead to larger discounts than intended. Use the priority system and combination rules to control the outcome.

* * *


## [Common Pricing Patterns](#common-pricing-patterns)

### [Base prices with store overrides](#base-prices-with-store-overrides)

1.  Sync base prices (RRP) from your ERP via the Price API
2.  Store managers create price lists in the UI for local adjustments
3.  Price prioritization ensures the store-specific price wins when available

### [B2B customer-specific pricing](#b2b-customer-specific-pricing)

1.  Sync customer-specific prices via the Price API with the `customerId` or `customerGroup` field
2.  Enable separate price storage if you have large price sets
3.  Customer group promotions give additional discounts on top

### [Seasonal campaigns](#seasonal-campaigns)

1.  Create a promotion with date range, category/brand filters, and discount
2.  Omnium generates promotional prices on matching products
3.  Customers see the campaign price in search results and product pages
4.  When the campaign ends, promotional prices are automatically removed

### [Coupon-only campaigns](#coupon-only-campaigns)

1.  Create a promotion with a coupon code and no date-based price generation
2.  The promotion only applies when the customer enters the code at checkout
3.  Useful for influencer codes, loyalty rewards, or targeted offers

* * *


## [Related Documentation](#related-documentation)

Topic

Link

Price structure and storage

[Prices Reference](/docs/Prices)

Getting prices into Omnium

[Setting Up Prices](/docs/Prices/SettingUpPrices)

Which price wins

[Price Prioritization](/docs/Prices/PricePrioritization)

Price list management

[Price Lists](/docs/Prices/PriceLists)

Tax handling

[Prices and Tax](/docs/Prices/PricesAndTax)

Lowest price display

[Lowest Price](/docs/Prices/lowest-price)

Promotion engine details

[Promotions](/docs/Prices/Promotions)

Multi-buy promotions

[MultiBuy API Reference](/docs/Prices/Promotions/multibuyApiReference)

Kit / bundle promotions

[Kit Promotions API Reference](/docs/Prices/Promotions/kitPromotionApiReference)

Tiered pricing

[Tiered Pricing API Reference](/docs/Prices/Promotions/tieredPricingApiReference)

Conditional pricing

[Conditional Pricing API Reference](/docs/Prices/Promotions/conditionalPricingApiReference)

Order amount discounts

[Order Amount API Reference](/docs/Prices/Promotions/orderAmountApiReference)

Product search promotions

[Product Search API Reference](/docs/Prices/Promotions/productSearchApiReference)

[

Previous

Prices

](/docs/Prices)[

Next

Setting Up Prices

](/docs/Prices/SettingUpPrices)

---


## Promotions

[Prices](/docs/Prices)

# Promotions

Technical overview of Omnium's promotion system, including API endpoints, application logic, priorities, and combination rules.

# [Promotions](#promotions)

This page provides an overview of Omnium’s promotion system and how it works. It covers the main concepts, API endpoints, automatic application logic, priority handling, combination rules, and store/market filtering. Promotions are usually managed through the Omnium UI, but can also be created and maintained via API when needed (for instance, for automation or integration purposes).
