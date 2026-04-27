# Prices & Promotions — Lists, Rules & Campaigns — Prices

## Prices

# Prices

How prices work in Omnium — price levels, promotions, price lists, prioritization, and tax handling.


## [Introduction](#introduction)

This guide explains how prices work in Omnium, including how they are structured, stored, and retrieved. It covers price levels, ID generation, and options for managing large price sets. You will also find details on using external price services and handling market-specific pricing.

* * *


## [In this section](#in-this-section)

[

Pricing & Promotions Overview

How price creation, storage, promotions, and delivery to customers fit together



](/docs/Prices/pricing-and-promotions)[

Setting Up Prices

Choose the right approach for your integration and keep your price model efficient



](/docs/Prices/SettingUpPrices)[

Promotions

Promotion types, API endpoints, priorities, and combination rules



](/docs/Prices/Promotions)[

Campaigns

Plan, execute, and measure promotional campaigns with revenue targets and performance tracking



](/docs/Prices/Campaigns)[

Price Lists

Create and manage price lists for grouped pricing



](/docs/Prices/PriceLists)[

Price Prioritization

How prices are filtered, sorted, and selected based on context



](/docs/Prices/PricePrioritization)[

Lowest Price History

Automatic tracking of lowest valid price for regulatory compliance



](/docs/Prices/lowest-price)[

Prices and Tax

Tax-inclusive and tax-exclusive pricing across different contexts



](/docs/Prices/PricesAndTax)

* * *


## [Product Prices](#product-prices)

### [Price Levels](#price-levels)

Prices can be set at two levels:

1.  Product-level
2.  Variant-level (not recommended!)

We **recommend setting all prices at the product level**.

If a specific variant requires a different price, it should still be defined at the product level using the `skuId` field to indicate which variant the price applies to.

If all variants share the same price, define **one product-level price** without specifying a `skuId`.

> Defining prices directly inside each variant is possible, but not recommended. It can slightly reduce performance when filtering or sorting by price, and often results in bloated product models by duplicating prices across all variants - even when the prices are identical.

**Important:**  
If both a general price (without `skuId`) and a variant-specific price (with `skuId`) exist, the **variant-specific price will always be prioritized** for the matching variant.

* * *

### [Best Practice Examples](#best-practice-examples)

**Note:** The examples below have been simplified to focus on pricing. Both the product and price models include additional properties not shown here.

#### [✅ Recommended: All variants have the same price or the product does not have variants](#-recommended-all-variants-have-the-same-price-or-the-product-does-not-have-variants)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "some-product",
      "prices": [
        {
          "unitPrice": 500
        }
      ]
    }

#### [✅ Recommended: One variant has a different price](#-recommended-one-variant-has-a-different-price)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "some-product",
      "prices": [
        {
          "unitPrice": 500
        },
        {
          "unitPrice": 2000,
          "skuId": "golden-sku"
        }
      ]
    }

#### [✅ Recommended: All variants have different prices](#-recommended-all-variants-have-different-prices)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "some-product",
      "prices": [
        {
          "unitPrice": 500,
    	  "skuId": "sku1"
        },
        {
          "unitPrice": 600,
          "skuId": "sku2"
        },
        {
          "unitPrice": 700,
          "skuId": "sku3"
        }
      ]
    }

#### [❌ Not Recommended: Prices defined directly on variants](#-not-recommended-prices-defined-directly-on-variants)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "some-product",
      "variants": [
        {
          "skuId": "golden-sku",
          "prices": [
            {
              "unitPrice": 2000
            }
          ]
        },
        {
          "skuId": "other-sku1",
          "prices": [
            {
              "unitPrice": 500
            }
          ]
        },
        {
          "skuId": "other-sku2",
          "prices": [
            {
              "unitPrice": 500
            }
          ]
        }
      ]
    }

### [Price ID Generation](#price-id-generation)

Price IDs follow this convention:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {CustomerId}_{CustomerGroup}_{VariantId}_{MarketId}_{MarketGroupId}_{CurrencyCode}_{SalesCode}_{PromotionId}_{StoreId}_{PriceListId}_{ValidUntil}_{ValidFrom}

Override this convention using an `ExternalId` for prices fetched from external systems.

### [Key Features](#key-features)

*   **Market-Specific Prices:** Prices can also be specific to customers, groups, or stores.
*   **External Promotion Support:** Use `IsExternalPromotion` for prices tied to external systems.
*   **Flexible Date Handling:** Use `null` for dates if no validity range is required.

### [Separate Prices](#separate-prices)

For products with **100+ prices**, prices can be stored separately to avoid bloated product models. Bloated models are slower to fetch and update.

When separate prices are enabled:

*   Product searches (e.g. for PLPs) will still return products **with prices included**, but only the relevant price for the current market, customer, etc.
*   As a bonus, you can also use **dedicated price search endpoints** to search or retrieve prices directly at price-level (e.g. for reporting or customer-specific logic).

> ⚠️ Query performance on product searches will generally be slower with separate prices enabled. Only use this if you have very large price sets – for example, **customer-specific pricing** with **hundreds or thousands of prices per SKU**.

#### [Alternative: Search Prices via Product Search](#alternative-search-prices-via-product-search)

Instead of using dedicated price search endpoints, you could search for prices by using the **product scroll search endpoint** with specific field filtering:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "marketId": "NOR",
      "modifiedFrom": "2025-12-17T06:10:41.133Z",
      "includedFields": {
        "specificFields": [
          "prices"
        ]
      }
    }

You can use any search parameters to get exactly the products (and prices) that you need. For instance, you can also filter by product IDs:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "marketId": "NOR",
      "productIds": [
        "1234"
      ],
      "includedFields": {
        "specificFields": [
          "prices"
        ]
      }
    }

Please contact support if you believe you need to use separate prices, and we'll help you migrate the current data.

### [External Price Service](#external-price-service)

It is possible to set up an external price service that fetches prices from a third-party system that you are hosting yourself.

⚠️ **Important:**  
This is **not commonly needed** when using Omnium.  
It’s intended for rare edge cases where your pricing system cannot be synchronized to Omnium through normal means.

If external prices is setup, prices will be fetched via the external service when:

*   Searching for products
*   Adding items to cart
*   Recalculating prices in cart

You may also store prices in Omnium as usual, allowing you to combine Omnium-managed prices with prices fetched from an external service.

An example where this would be the case would be if you have customer specific prices with an extremly complex price calculation that is hard (or impossible) to migrate from. You could then serve the customer specific prices form the external price service, but still keep the non-customer specific prices in Omnium.

#### [Payload example](#payload-example)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "customerId": "5002497",
      "customerProperties": [
        {
          "key": "Hobby",
          "value": "fishing"
        }
      ],
      "marketId": "NOR",
      "skus": [
        {
          "sku": "123",
          "price": {
            "marketId": "NOR",
            "unitPrice": 9.90,
            "currencyCode": "NOK",
            "isTaxExcluded": true
            // ... additional price properties
          },
          "isBundle": false,
          "isPackage": false,
          "quantity": 3,
          "components": [],
          "properties": [
            {
              "key": "SomeExternalSystemReference",
              "value": "ZXC"
            }
          ]
        }
      ]
    }

*   The included `price` field contains the price from Omnium (if available).
*   Included product and customer properties can be configured. By default, **no custom properties** are included unless explicitly specified.

#### [Expected Response](#expected-response)

The external price service should return an  
[OmniumExternalPriceResponse](https://apitest.omnium.no/documentation/index.html#/model-OmniumExternalPriceResponse)

⚠️ **Important:** The external price service must be optimized for speed. A slow response will degrade performance for both product search and cart operations in Omnium.

#### [Setup Example](#setup-example)

The external price service is added as a connector. Below is an example on how you could set this up with JSON:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "connectors": [
      {
        "name": "ExternalPricesConnector",
        "properties": [
          {
            "key": "GetPricesUrl",
            "value": "https://some.url.to/a/price/service"
          },
          {
            "key": "IncludedProductProperties",
            "value": "SomeProductProp||SomeOtherProperty"
          },
          {
            "key": "IsNonMarketSpecificPriceFallbackEnabled",
            "value": "true",
            "valueType": "Boolean"
          },
          {
            "key": "IncludedCustomerProperties",
            "value": "SomeCustomerProp||SomeOtherCustomerProp"
          }
        ],
        "customHeaders": [
          {
            "key": "custom-auth-or-whatever",
            "value": "xxx"
          }
        ]
      }
    ]

**Configuration Properties:**

*   **GetPricesUrl**: The endpoint URL for your external price service
*   **IncludedProductProperties**: Custom product properties (from the "Properties" attribute) to include in the request, separated by `||`
*   **IncludedCustomerProperties**: Custom customer properties (from the "Properties" attribute) to include in the request, separated by `||`
*   **IsNonMarketSpecificPriceFallbackEnabled**: When set to `true`, enables fallback to non-market-specific prices if market-specific prices are not available
*   **customHeaders**: Any custom headers required for authentication or other purposes

* * *

[

Previous

API Reference

](/docs/Customer/Cases/cases-api)[

Next

Pricing and Promotions Overview

](/docs/Prices/pricing-and-promotions)

---


## Campaigns

[Prices](/docs/Prices)

# Campaigns

Plan, execute, and measure promotional campaigns in Omnium — group promotions, set revenue targets, and track performance in real time.


## [Introduction](#introduction)

Campaigns in Omnium let you group related promotions under a single umbrella, plan revenue targets, and track actual performance against those targets. A campaign represents a coordinated marketing effort — such as a seasonal sale, a product launch, or a clearance event — that may involve multiple promotions running across different markets and stores.

Campaigns provide structure and visibility across the full lifecycle: from initial planning, through the active sales period, to post-campaign performance analysis.

* * *


## [In this section](#in-this-section)

[

API Reference

REST API reference for managing campaigns programmatically — endpoints, models, and integration patterns



](/docs/Prices/Campaigns/campaign-api)[

Campaign Overview

Core concepts, lifecycle statuses, and how campaigns relate to promotions and price lists



](/docs/Prices/Campaigns/overview)[

Managing Campaigns

Create, edit, copy, and delete campaigns through the Omnium UI



](/docs/Prices/Campaigns/managing-campaigns)[

Campaign Promotions

Link promotions to campaigns and manage promotion assignments



](/docs/Prices/Campaigns/campaign-promotions)[

Campaign Planning

Set revenue targets and sales volume forecasts at campaign, promotion, and SKU level



](/docs/Prices/Campaigns/campaign-planning)[

Campaign Performance

Track revenue, sales volume, and variance against targets with real-time analytics



](/docs/Prices/Campaigns/campaign-performance)

* * *


## [How Campaigns Fit into Omnium](#how-campaigns-fit-into-omnium)

Campaigns sit above promotions in the pricing hierarchy. While [promotions](/docs/Prices/Promotions) define the discount rules and [price lists](/docs/Prices/PriceLists) define the specific prices, campaigns provide the organizational layer that ties them together for planning and measurement.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

                             CAMPAIGN
      ┌───────────────────────────────────────────────┐
      │  "Summer Sale 2026"                           │
      │  Planning → Active → Completed → Archived     │
      │  Revenue target: 500,000 NOK                  │
      └───────────────────┬───────────────────────────┘
                          │
                ┌─────────┼─────────┐
                ▼         ▼         ▼
           Promotion  Promotion  Promotion
           "20% off   "3 for 2   "Free
            shoes"     socks"    shipping"
                │         │
                ▼         ▼
           Price List  Price List
           (SKU-level  (SKU-level
            prices)     prices)

Each campaign can have multiple linked promotions. Promotions that use price lists carry SKU-level planning data (planned sales volume and revenue), enabling detailed forecasting and post-campaign analysis.

* * *


## [Related Documentation](#related-documentation)

Topic

Link

Promotion types and rules

[Promotions](/docs/Prices/Promotions)

Pricing overview

[Pricing & Promotions Overview](/docs/Prices/pricing-and-promotions)

Price list management

[Price Lists](/docs/Prices/PriceLists)

Price selection rules

[Price Prioritization](/docs/Prices/PricePrioritization)

[

Previous

Price Filters

](/docs/Prices/Promotions/priceFilterApiReference)[

Next

API Reference

](/docs/Prices/Campaigns/campaign-api)

---


## Lowest price history

[Prices](/docs/Prices)

# Lowest price history

Automatically tracks the lowest valid price for products over a set period to ensure compliance with pricing regulations such as the EU Omnibus Directive.


## [Introduction](#introduction)

The lowest price history feature automatically tracks and records the lowest valid price for each product (and variant) per market over a configurable time window (e.g., the last 30 days).

This is primarily used to comply with the **EU Omnibus Directive** (Directive 2019/2161), which requires that any announced price reduction must reference the lowest price that was applied during a period of at least 30 days before the reduction.

When enabled, Omnium maintains a `lowestPriceHistory` array on each product. This array contains one entry per market, representing the lowest price recorded within the configured time window. The data is available through both the Omnium UI and the public API.

* * *


## [Setup](#setup)

### [1\. Set the historical threshold](#1-set-the-historical-threshold)

Define how far back in time prices should be tracked:

1.  Navigate to: `Configuration → Products`
2.  Under **Lowest Price**, set the number of days (e.g., `30`)

Setting this value to `0` disables the feature entirely. Only prices within this time window will be considered when calculating the lowest historical price.

### [2\. Add the scheduled task](#2-add-the-scheduled-task)

A scheduled task must be added to automatically recalculate lowest prices:

1.  Navigate to: `Configuration → Advanced → Scheduled Task`
2.  Click the three-dot menu and select **Add**
3.  Set the following:
    *   **Implementation type:** `Product lowest price`
    *   **Schedule:** A cron expression for how often the task should run, e.g., daily at midnight (`0 0 * * *`) or every 30 minutes (`*/30 * * * *`)

The scheduled task processes all active products, evaluates their prices, and updates the `lowestPriceHistory` accordingly.

> **Tip:** Even without the scheduled task, price history is also updated whenever a product is saved (created or updated) through the API. The scheduled task ensures that all products stay up to date even when prices expire or new price windows begin.

* * *


## [How it works](#how-it-works)

### [Price evaluation criteria](#price-evaluation-criteria)

When determining the lowest price, only prices that meet **all** of the following criteria are considered:

*   Belongs to the relevant **market**
*   Has a **start date** that is today or earlier (future-dated prices are excluded)
*   Has not **expired** (end date is either not set or is in the future)
*   Is **not** linked to a specific `customerId`, `customerGroupId`, or `storeGroupId` (customer-specific and store-group-specific prices are excluded)

### [Tracking per market](#tracking-per-market)

Lowest price history is tracked **separately for each market**. A product sold in markets "NOR" and "SWE" will have separate entries in `lowestPriceHistory` — one for each market.

### [Variant handling](#variant-handling)

*   Each **variant** maintains its own `lowestPriceHistory`.
*   The **parent product** reflects the lowest price across all its variants for each market. This means you can check either the parent or individual variants depending on your use case.

### [What happens when prices change](#what-happens-when-prices-change)

Each time the scheduled task runs or a product is updated:

1.  **Old entries are pruned** — price records older than the configured threshold are removed.
2.  **The current valid price is compared** against the stored history.
3.  **If the price has changed**, the previous price is recorded as a historical entry (with `isCurrentPrice: false`), and a new current entry is added (with `isCurrentPrice: true`).
4.  **If no change occurred**, the existing records remain as-is.

This means the system keeps a rolling record of price changes within the time window, and always identifies which entry represents the current price vs. historical ones.

* * *


## [API reference](#api-reference)

### [The `lowestPriceHistory` property](#the-lowestpricehistory-property)

The lowest price history is exposed as the `lowestPriceHistory` array on product models. It is available on:

*   `OmniumProduct` — returned by single-product GET endpoints and scroll endpoints
*   `OmniumProductListItemViewModel` — returned by the search endpoint

Each entry in the array is an `OmniumPriceReference` object:

Property

Type

Description

`unitPrice`

`decimal`

The recorded price amount. **This is the lowest historical price** when `isCurrentPrice` is not `true`.

`currencyCode`

`string`

Currency code (e.g., `"NOK"`, `"SEK"`, `"EUR"`).

`marketId`

`string`

The market this price applies to (e.g., `"NOR"`).

`date`

`datetime`

When this price was recorded.

`promotionId`

`string`

ID of the associated promotion, if any.

`promotionName`

`string`

Name of the associated promotion, if any.

`priceListId`

`string`

ID of the price list this price originated from, if any.

`isCurrentPrice`

`bool?`

`true` if this represents the current active price. `null` or absent if this is a historical entry.

> **Key insight:** Through the API, the array is mapped so that each market has **one representative entry** — the lowest non-current (historical) price. If no historical price exists yet (e.g., the price has not changed within the window), the current price is returned instead.

### [Endpoints that return lowest price history](#endpoints-that-return-lowest-price-history)

All product retrieval endpoints include `lowestPriceHistory` when the feature is enabled:

Method

Endpoint

Response model

GET

`/api/products/{productId}`

`OmniumProduct`

GET

`/api/products/{productId}/ByMarket/{marketId}`

`OmniumProduct`

GET

`/api/products/{productId}/ByStore/{storeId}`

`OmniumProduct`

GET

`/api/products/{productId}/ByCustomer/`

`OmniumProduct`

POST

`/api/products/SearchProducts`

`OmniumProductListItemViewModel[]`

POST

`/api/products/Scroll`

`OmniumProduct[]`

GET

`/api/products/Scroll/{scrollId}`

`OmniumProduct[]`

There is no dedicated endpoint for price history alone — it is always part of the product response.

### [Example: Get a product with lowest price history](#example-get-a-product-with-lowest-price-history)

**Request:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/products/12345

**Response (simplified):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "12345",
      "title": "Winter Jacket",
      "prices": [
        {
          "unitPrice": 599.00,
          "currencyCode": "NOK",
          "marketId": "NOR",
          "validFrom": "2026-03-01T00:00:00Z"
        }
      ],
      "lowestPriceHistory": [
        {
          "unitPrice": 499.00,
          "currencyCode": "NOK",
          "marketId": "NOR",
          "date": "2026-03-10T12:00:00Z",
          "promotionId": "spring-sale-2026",
          "promotionName": "Spring Sale",
          "priceListId": null,
          "isCurrentPrice": null
        }
      ],
      "variants": [
        {
          "skuId": "12345-S",
          "lowestPriceHistory": [
            {
              "unitPrice": 499.00,
              "currencyCode": "NOK",
              "marketId": "NOR",
              "date": "2026-03-10T12:00:00Z",
              "isCurrentPrice": null
            }
          ]
        }
      ]
    }

In this example:

*   The product currently costs **599 NOK** (see `prices`).
*   The lowest price in the configured period was **499 NOK** during the "Spring Sale" promotion (see `lowestPriceHistory`).
*   Since `isCurrentPrice` is `null`, this is a **historical** entry — i.e., the lowest price was lower than the current price.

### [Example: Search for products and read lowest price history](#example-search-for-products-and-read-lowest-price-history)

**Request:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products/SearchProducts

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "marketId": "NOR",
      "take": 10,
      "includedFields": {
        "specificFields": ["lowestPriceHistory", "prices"]
      }
    }

**Response (simplified):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "totalHits": 142,
      "result": [
        {
          "id": "12345",
          "lowestPriceHistory": [
            {
              "unitPrice": 499.00,
              "currencyCode": "NOK",
              "marketId": "NOR",
              "date": "2026-03-10T12:00:00Z",
              "isCurrentPrice": null
            }
          ]
        }
      ]
    }

### [Example: Scroll all products to export lowest price data](#example-scroll-all-products-to-export-lowest-price-data)

Use the scroll endpoint when you need to retrieve lowest price history for a large number of products:

**Step 1 — Initial request:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products/Scroll

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "marketId": "NOR",
      "includedFields": {
        "specificFields": ["lowestPriceHistory", "prices"]
      }
    }

**Step 2 — Continue scrolling** (if `scrollId` is returned):

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/products/Scroll/{scrollId}

Repeat step 2 until no more results are returned.

* * *


## [Interpreting the data](#interpreting-the-data)

### [Finding the lowest historical price](#finding-the-lowest-historical-price)

The `lowestPriceHistory` array through the API contains **one entry per market**, representing the lowest price during the configured period.

To find the lowest historical price for a specific market:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    // JavaScript example
    const product = await fetchProduct("12345");
     
    const lowestForNOR = product.lowestPriceHistory
      ?.find(entry => entry.marketId === "NOR");
     
    if (lowestForNOR) {
      console.log(`Lowest price (NOR): ${lowestForNOR.unitPrice} ${lowestForNOR.currencyCode}`);
      // Output: "Lowest price (NOR): 499 NOK"
    }

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    // C# example
    var product = await client.GetAsync<OmniumProduct>("api/products/12345");
     
    var lowestForNOR = product.LowestPriceHistory?
        .FirstOrDefault(x => x.MarketId == "NOR");
     
    if (lowestForNOR != null)
    {
        Console.WriteLine($"Lowest price (NOR): {lowestForNOR.UnitPrice} {lowestForNOR.CurrencyCode}");
        // Output: "Lowest price (NOR): 499 NOK"
    }

### [Displaying a price reduction notice](#displaying-a-price-reduction-notice)

When showing a price reduction on a product page (e.g., for Omnibus compliance), compare the current price with the lowest historical price:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    const currentPrice = product.prices?.find(p => p.marketId === "NOR");
    const lowestHistorical = product.lowestPriceHistory?.find(p => p.marketId === "NOR");
     
    if (currentPrice && lowestHistorical) {
      // Display both prices — the Omnibus directive requires showing the lowest
      // price from the reference period alongside any announced price reduction.
      console.log(`Now: ${currentPrice.unitPrice} — Lowest in last 30 days: ${lowestHistorical.unitPrice}`);
    }

### [When `lowestPriceHistory` is empty or missing](#when-lowestpricehistory-is-empty-or-missing)

*   **Feature is not enabled:** The `lowestPriceHistoryDays` setting is `0` or not configured.
*   **No valid prices exist:** The product has no valid prices for any market (e.g., all prices are future-dated or expired).
*   **Scheduled task has not run yet:** If the task was just enabled, it needs to run at least once to populate history. Saving the product through the API will also trigger an initial calculation.

* * *
