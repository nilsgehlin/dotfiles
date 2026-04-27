# Products — Catalog, Categories & Assets — [Category Settings](#category-settings)

## [Category Settings](#category-settings)

These settings control how products are organized into categories.

Property

Type

Default

Description

rootCategoryId

string

null

The ID of the root category for the product hierarchy. Products outside this hierarchy will not be displayed in category navigation.

seasonCategoryId

string

null

The ID of the category used for seasonal products.

separateRootCategoryColors

bool

false

When enabled, each root category can have its own color scheme in the UI.

isProductCategoryParentsAdded

bool

false

When enabled, parent categories are automatically added to products when a child category is assigned.

isProductCategoryEnriched

bool

false

When enabled, category data (names, paths) is enriched onto the product during save operations.

isNonexistentCategoryIdsRemoved

bool

false

When enabled, category IDs that reference non-existent categories are automatically removed from products during save.

### [Sample](#sample-9)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "RootCategoryId": "catalog",
      "SeasonCategoryId": "seasonal",
      "SeparateRootCategoryColors": false,
      "IsProductCategoryParentsAdded": true,
      "IsProductCategoryEnriched": true,
      "IsNonexistentCategoryIdsRemoved": true
    }

* * *


## [Product Content Languages](#product-content-languages)

Configure multiple languages for product content.

Property

Type

Default

Description

productContentLanguages

array

null

Available languages for product content

defaultProductContentLanguageCode

string

null

Default language code for new products

isMainLanguageIdWithLanguageSuffix

bool

false

When enabled, the main language product ID includes a language suffix.

Each language has:

Property

Type

Description

languageCode

string

ISO language code (e.g., "en", "no", "sv")

displayName

string

Human-readable language name

translateKey

string

Translation key for the language name

### [Sample](#sample-10)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsProductLanguagesEnabled": true,
      "DefaultProductContentLanguageCode": "en",
      "ProductContentLanguages": [
        { "LanguageCode": "en", "DisplayName": "English", "TranslateKey": "Language_English" },
        { "LanguageCode": "no", "DisplayName": "Norwegian", "TranslateKey": "Language_Norwegian" },
        { "LanguageCode": "sv", "DisplayName": "Swedish", "TranslateKey": "Language_Swedish" }
      ]
    }

* * *


## [Search Settings](#search-settings)

These settings control how products are searched and how search results are ranked.

Property

Type

Default

Description

isVariantSearchEnabled

bool

false

When enabled, variants can be searched independently. When disabled, only parent products are searchable.

### [Product Search Settings](#product-search-settings)

The `productSearchSettings` object contains all search-related configuration:

#### [Fuzzy Search and Synonyms](#fuzzy-search-and-synonyms)

Property

Type

Default

Description

isFuzzinessAuto

bool

false

Enables fuzzy matching, allowing search results even when users make minor spelling mistakes.

isSynonymsApplied

bool

false

Enables synonym matching. Configure synonyms separately in the Synonyms section.

#### [Search Boosting](#search-boosting)

Boosting increases the relevance score of products matching certain criteria. Boost values range from 0 to 4, where 1 is neutral, values below 1 decrease relevance, and values above 1 increase relevance.

Property

Type

Default

Description

isPopularityBoosted

bool

false

Enable popularity-based boosting

popularityBoosting

double

1.0

Boost multiplier for popular products (0-4)

isPromotionBoosted

bool

false

Enable promotion-based boosting

promotionBoosting

double

1.0

Boost multiplier for promoted products (0-4)

isInStockBoosted

bool

false

Enable in-stock boosting

inStockBoosting

double

1.0

Boost multiplier for in-stock products (0-4)

isNewerProductsBoosted

bool

false

Enable boosting for newer products

newerProductsBoosting

double

1.0

Boost multiplier for newer products (0-4)

newerProductsBoostingNumberOfDays

int

90

Products published within this many days are considered "newer"

prefixBoost

double

1.0

Boost for prefix matches (when search term matches beginning of a word)

#### [How Boosting Works](#how-boosting-works)

Search scores are calculated by multiplying the base relevance score by each enabled boost factor. For example:

*   Base score: 10
*   In-stock boost enabled (1.5): 10 × 1.5 = 15
*   Promotion boost enabled (1.2): 15 × 1.2 = 18
*   Final score: 18

Higher scores appear higher in search results.

#### [Property Boosting](#property-boosting)

You can boost specific product properties to make them more influential in search:

Property

Type

Description

boostedProperties

array

Custom property boost configuration

Each boosted property has:

Property

Type

Description

propertyName

string

Name of the property to boost

boostValue

double

Boost multiplier (0-10)

isSearchable

bool

Whether this property should be included in search

#### [Advanced Search Settings](#advanced-search-settings)

Property

Type

Default

Description

aggregationSize

int

100

Maximum number of filter options returned for facets

isPricesExcludedFromSearch

bool

false

When enabled, prices are excluded from search, improving performance for large catalogs

### [Sample](#sample-11)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsVariantSearchEnabled": false,
      "ProductSearchSettings": {
        "IsFuzzinessAuto": true,
        "IsSynonymsApplied": true,
        "IsPopularityBoosted": true,
        "PopularityBoosting": 1.3,
        "IsPromotionBoosted": true,
        "PromotionBoosting": 1.5,
        "IsInStockBoosted": true,
        "InStockBoosting": 1.2,
        "IsNewerProductsBoosted": true,
        "NewerProductsBoosting": 1.4,
        "NewerProductsBoostingNumberOfDays": 60,
        "PrefixBoost": 1.5,
        "AggregationSize": 150,
        "BoostedProperties": [
          { "PropertyName": "name", "BoostValue": 3.0, "IsSearchable": true },
          { "PropertyName": "sku", "BoostValue": 5.0, "IsSearchable": true },
          { "PropertyName": "brand", "BoostValue": 2.0, "IsSearchable": true },
          { "PropertyName": "description", "BoostValue": 1.0, "IsSearchable": true }
        ]
      }
    }

* * *


## [Product Facets](#product-facets)

Facets provide filtering options in product search results.

Property

Type

Description

productFacets

array

Configured facets for product search

Each facet has:

Property

Type

Description

name

string

Property name to create facet from

type

string

Facet type: "term", "range", "nested"

isCustomProperty

bool

When true, the facet is created from custom properties rather than built-in fields

### [Facet Types](#facet-types)

Type

Description

Use Case

term

Exact value matching

Brand, color, category

range

Numeric ranges

Price, size

nested

Nested document facets

Complex properties

### [Sample](#sample-12)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "ProductFacets": [
        { "Name": "brand", "Type": "term" },
        { "Name": "color", "Type": "term" },
        { "Name": "price", "Type": "range" },
        { "Name": "size", "Type": "term" },
        { "Name": "categoryIds", "Type": "term" }
      ]
    }

* * *


## [Properties Configuration](#properties-configuration)

These settings control default properties, highlighted properties, and property lists.

### [Default Properties](#default-properties)

Property

Type

Description

defaultProperties

array

Default properties added to all products

Each property can include:

Property

Type

Description

name

string

Property name

value

string

Default value

dataType

string

Data type (string, number, boolean, date)

isInheritedByVariants

bool

Whether this property is inherited by variants

isInheritedByLanguageVariants

bool

Whether this property is inherited by language variants

isInheritedBySiblings

bool

Whether this property is inherited by sibling products

### [Highlighted Properties](#highlighted-properties)

Property

Type

Description

highlightedProperties

array

Property names to display prominently in the product UI

### [Related Product Keys](#related-product-keys)

Property

Type

Description

relatedProductKeys

array

Keys for defining product relationships (e.g., "accessories", "alternatives", "upsells")

### [Tags](#tags)

Property

Type

Description

tagSettings

array

Available tag definitions for products

Each tag has:

Property

Type

Description

name

string

Tag identifier

translationKey

string

Translation key for display

### [Brands](#brands)

Property

Type

Description

brands

array

Available brand definitions

Each brand has:

Property

Type

Description

name

string

Brand name

description

string

Brand description

isActive

bool

Whether the brand is active

isPublicVisible

bool

Whether the brand is visible to customers

### [Property Lists](#property-lists)

Property lists allow you to define reusable sets of properties:

Property

Type

Description

propertyLists

array

Defined property lists

Each property list has:

Property

Type

Description

id

string

Unique identifier

name

string

Display name

properties

array

Properties in this list

### [Sample](#sample-13)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "DefaultProperties": [
        { "Name": "brand", "Value": "", "DataType": "string", "IsInheritedByVariants": true },
        { "Name": "material", "Value": "", "DataType": "string", "IsInheritedByVariants": true }
      ],
      "HighlightedProperties": ["brand", "material", "countryOfOrigin"],
      "RelatedProductKeys": ["accessories", "alternatives", "upsells", "crossSells"],
      "TagSettings": [
        { "Name": "new", "TranslationKey": "Tag_New" },
        { "Name": "sale", "TranslationKey": "Tag_Sale" },
        { "Name": "bestseller", "TranslationKey": "Tag_Bestseller" }
      ],
      "Brands": [
        { "Name": "Acme", "Description": "Acme Corporation", "IsActive": true, "IsPublicVisible": true }
      ],
      "PropertyLists": [
        {
          "Id": "clothing",
          "Name": "Clothing Properties",
          "Properties": [
            { "Name": "material", "Value": "" },
            { "Name": "careInstructions", "Value": "" }
          ]
        }
      ]
    }

* * *


## [Inheritance Settings](#inheritance-settings)

When `isInheritanceEnabled` is true, you can configure which properties are inherited between products.

Property

Type

Description

variantsInheritStatus

array

Property names that variants inherit from parent products

productLanguagesInheritStatus

array

Property names that language variants inherit from the main language product

siblingsInheritStatus

array

Property names that sibling products inherit from each other

### [How Inheritance Works](#how-inheritance-works)

1.  **Parent to Variant**: When a property is in `variantsInheritStatus`, changes to that property on the parent product automatically propagate to all variants.
    
2.  **Main Language to Language Variants**: When a property is in `productLanguagesInheritStatus`, changes to that property on the main language product propagate to all language variants.
    
3.  **Sibling Inheritance**: When a property is in `siblingsInheritStatus`, changes to that property on one sibling product propagate to all related siblings.
    

### [Inheritance Priority](#inheritance-priority)

When a property can be inherited from multiple sources, the priority is:

1.  Direct value on the product (highest priority)
2.  Inherited from parent
3.  Inherited from main language
4.  Inherited from sibling

### [Sample](#sample-14)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsInheritanceEnabled": true,
      "VariantsInheritStatus": ["brand", "material", "countryOfOrigin", "careInstructions"],
      "ProductLanguagesInheritStatus": ["price", "images", "categoryIds"],
      "SiblingsInheritStatus": ["brand"]
    }

* * *


## [Additional Settings](#additional-settings)

### [HTML Editor](#html-editor)

Property

Type

Default

Description

isHtmlEditorRawByDefault

bool

false

When enabled, the HTML editor opens in raw HTML mode by default rather than WYSIWYG mode.

isHtmlEditorLinksAbsolute

bool

false

When enabled, links created in the HTML editor use absolute URLs.

### [Lowest Price Tracking](#lowest-price-tracking)

Property

Type

Default

Description

lowestPriceHistoryDays

int

0

Number of days to track price history for calculating lowest price. Required for EU Omnibus Directive compliance. Set to 30 for standard compliance.

### [Currencies](#currencies)

Property

Type

Description

currencies

array

Available currency codes for products (e.g., \["USD", "EUR", "NOK"\])

### [Cart Display](#cart-display)

Property

Type

Default

Description

isVariantNameDefaultOnCart

bool

false

When enabled, variant names are displayed on cart line items instead of parent product names.

### [Sort Index](#sort-index)

Property

Type

Default

Description

omniumSortIndexProviderPromotionBoost

int

0

Boost value applied to promoted products in the sort index.

### [Sample](#sample-15)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "IsHtmlEditorRawByDefault": false,
      "IsHtmlEditorLinksAbsolute": false,
      "LowestPriceHistoryDays": 30,
      "Currencies": ["NOK", "SEK", "EUR"],
      "IsVariantNameDefaultOnCart": true
    }

* * *


## [Product Ratings](#product-ratings)

Configure product rating functionality.

Property

Type

Default

Description

productRatingSettings.ratingNeedsVerificationThreshold

int

null

Minimum rating count before verification is required

productRatingSettings.verifyRatingNotificationDelayInMinutes

int

null

Minutes to wait before sending verification notification

productRatingSettings.marketSpecificRatings

bool

false

When enabled, ratings are specific to markets rather than global

### [Sample](#sample-16)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "ProductRatingSettings": {
        "RatingNeedsVerificationThreshold": 5,
        "VerifyRatingNotificationDelayInMinutes": 1440,
        "MarketSpecificRatings": true
      }
    }

* * *


## [Product Alerts](#product-alerts)

Configure product alert functionality.

Property

Type

Default

Description

productAlertSettings.isProductAlertEnabled

bool

false

Enable product alerts feature

productAlertSettings.alertIsDeactivatedThreshold

int

0

Number of days a product must be inactive before generating an alert

### [Sample](#sample-17)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "ProductAlertSettings": {
        "IsProductAlertEnabled": true,
        "AlertIsDeactivatedThreshold": 30
      }
    }

* * *


## [Product Statuses](#product-statuses)

Configure custom product statuses.

Property

Type

Description

productStatuses

array

Available product status definitions

### [Sample](#sample-18)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "ProductStatuses": [
        { "Name": "draft", "TranslationKey": "ProductStatus_Draft" },
        { "Name": "review", "TranslationKey": "ProductStatus_Review" },
        { "Name": "approved", "TranslationKey": "ProductStatus_Approved" },
        { "Name": "published", "TranslationKey": "ProductStatus_Published" }
      ]
    }

* * *


## [Product Types](#product-types)

Product types allow you to define different categories of products with their own specific properties. For detailed configuration options, see [Product Types](/docs/product/configuration/product-types).

* * *


## [Completion Rates](#completion-rates)

Completion rates allow you to measure how complete your product data is by assigning points to different properties. For detailed configuration options, see [Completion Rates](/docs/product/configuration/completion-rates).

* * *


## [Customs and Compliance](#customs-and-compliance)

Configure customs codes for international shipping compliance.

Property

Type

Description

customsCodes

array

Available customs/tariff codes

### [Sample](#sample-19)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "CustomsCodes": [
        { "Code": "6109.10", "Description": "T-shirts, singlets and other vests, of cotton" },
        { "Code": "6403.99", "Description": "Other footwear with outer soles of rubber, plastics, leather" }
      ]
    }

* * *


## [Supplier Settings](#supplier-settings)

Configure supplier-related settings for products.

Property

Type

Default

Description

supplierSettings.defaultProperties

array

\-

Default properties for suppliers

supplierSettings.useLocalSupplier

bool

false

When enabled, supplier assortment is automatically set based on user access rights

supplierSettings.prioritizeStoreGroupsOnCreate

bool

false

When enabled and useLocalSupplier is true, store group IDs are added to supplier assortment instead of store IDs

supplierSettings.tagSettings

array

\-

Available tags for suppliers

supplierSettings.addressTypes

array

\-

Available address types for suppliers

defaultSupplierLeadTime

int

null

Default lead time in days for supplier orders

### [Sample](#sample-20)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "ProductSettings": {
      "DefaultSupplierLeadTime": 14,
      "SupplierSettings": {
        "UseLocalSupplier": true,
        "PrioritizeStoreGroupsOnCreate": false,
        "DefaultProperties": [
          { "Name": "paymentTerms", "Value": "Net 30" }
        ],
        "TagSettings": [
          { "Name": "preferred", "TranslationKey": "SupplierTag_Preferred" }
        ],
        "AddressTypes": ["warehouse", "billing", "returns"]
      }
    }

* * *


## [Complete Configuration Example](#complete-configuration-example)

Below is a comprehensive example showing all ProductSettings configured:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ProductSettings": {
        "ReadOnly": false,
        "ShowFilters": true,
        "IsProductCreateDisabled": false,
        "FilterByActiveAsDefault": true,
     
        "HasPackages": true,
        "DisablePackageAutoBreakdownOnAddProductFromOrder": false,
        "AllocatePackagePricesToComponents": true,
     
        "IsProductStatisticsEnabled": true,
        "IsIncompleteProductsEnabled": false,
        "IsProductOptionsEnabled": true,
        "IsProductLanguagesEnabled": true,
        "IsInheritanceEnabled": true,
        "IsLocalProductsEnabled": false,
     
        "IsAssortmentStoreIdRequired": false,
        "IsAssortmentCodesRequired": false,
        "IsMultipleAssortmentCodesAllowed": true,
        "RequireProductMarket": true,
     
        "IsOmniumUrlProviderEnabled": true,
        "OmniumUrlProviderTemplate": "/products/{categoryPath}/{sku}",
     
        "PriceManagement": true,
        "HasExternalPrices": false,
        "HasCustomerSpecificPrices": true,
        "HasSeparatePrices": true,
        "DeleteExpiredPricesThreshold": 30,
        "IsProductAssortmentUpdatedByPrices": true,
        "IsProductPriceSetToLowestVariantPrice": true,
     
        "CostPriceManagement": true,
        "DefaultProductCostCurrency": "NOK",
        "HasSeparateCostPrices": false,
     
        "IsLocationEqualForAllVariants": false,
        "SyncExistingVariantsAcrossLanguages": true,
        "DisableIsActiveSyncForVariants": false,
     
        "IsImagesAutoResizedOnUpload": true,
        "AssetPurposeKeys": ["main", "thumbnail", "lifestyle"],
     
        "RootCategoryId": "catalog",
        "IsProductCategoryParentsAdded": true,
        "IsProductCategoryEnriched": true,
        "IsNonexistentCategoryIdsRemoved": true,
     
        "IsProductLanguagesEnabled": true,
        "DefaultProductContentLanguageCode": "en",
        "ProductContentLanguages": [
          { "LanguageCode": "en", "DisplayName": "English" },
          { "LanguageCode": "no", "DisplayName": "Norwegian" }
        ],
     
        "IsVariantSearchEnabled": false,
        "ProductSearchSettings": {
          "IsFuzzinessAuto": true,
          "IsSynonymsApplied": true,
          "IsPopularityBoosted": true,
          "PopularityBoosting": 1.3,
          "IsPromotionBoosted": true,
          "PromotionBoosting": 1.5,
          "IsInStockBoosted": true,
          "InStockBoosting": 1.2,
          "PrefixBoost": 1.5
        },
     
        "ProductFacets": [
          { "Name": "brand", "Type": "term" },
          { "Name": "color", "Type": "term" },
          { "Name": "price", "Type": "range" }
        ],
     
        "DefaultProperties": [
          { "Name": "brand", "Value": "" }
        ],
        "HighlightedProperties": ["brand", "material"],
        "RelatedProductKeys": ["accessories", "alternatives"],
     
        "VariantsInheritStatus": ["brand", "material"],
        "ProductLanguagesInheritStatus": ["price", "images"],
     
        "LowestPriceHistoryDays": 30,
        "Currencies": ["NOK", "SEK", "EUR"],
     
        "ProductRatingSettings": {
          "MarketSpecificRatings": true
        },
     
        "ProductAlertSettings": {
          "IsProductAlertEnabled": true,
          "AlertIsDeactivatedThreshold": 30
        }
      }
    }

* * *


## [Troubleshooting](#troubleshooting-1)

### [Common Issues](#common-issues)

Problem

Possible Cause

Solution

Products not appearing in search

`requireProductMarket` is enabled but product has no market

Assign a market to the product

Prices not showing

`hasSeparatePrices` is enabled but prices not configured

Ensure prices are created with the separate prices API

Variants not searchable

`isVariantSearchEnabled` is disabled

Enable variant search (may require data refresh)

Product won't activate

`disableIsActiveSyncForVariants` is enabled and no variants are active

Activate at least one variant first

Category filters empty

`productFacets` doesn't include categoryIds

Add categoryIds to facet configuration

Images not resizing

`isImagesAutoResizedOnUpload` is disabled

Enable auto-resize and configure aspect ratios

### [Performance Considerations](#performance-considerations)

*   **Many prices per product**: Use `hasSeparatePrices` and set appropriate `maxSeparatePriceSize`
*   **Slow search**: Review `boostedProperties` and disable unnecessary ones
*   **Bulk imports**: Enable `isPriceUpdateOperationDelayed` for batch processing
*   **Large catalogs**: Contact Omnium support for optimization recommendations

[

Previous

Updates

](/docs/Product/api-reference/product-updates)[

Next

Product Types

](/docs/Product/configuration/product-types)

---


## Gift Cards

[Product](/docs/Product)

# Gift Cards

This page describes the technical configuration required to enable \*\*gift cards\*\* in Omnium, as well as API usage for buying and paying with gift cards.

**Related Documentation:** For user-facing documentation, see [Gift cards in the Help Center](https://help.omnium.no/hc/en-us/articles/34257045792145-Gift-cards).


## [Activating the Gift Card Module](#activating-the-gift-card-module)

Gift cards are a separate module in Omnium and require a **separate license** to use.

Contact [petter@omnium.no](mailto:petter@omnium.no) to activate the module for your tenant.


## [1\. Payment Method](#1-payment-method)

Gift cards are configured as a payment method with the following settings:

**Note:** `providerName` specifies the provider used. "Omnium" is the default built-in Omnium provider.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "name": "GiftCard",
      "paymentMethodName": "GiftCard",
      "providerName": "Omnium",
      "displayName": "Gavekort",
      "vueTemplate": "empty-payment",
      "displayInCart": true
    }

You also need to add the corresponding _connector_ under connector settings:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "connectors": [
          {
              "name": "Omnium",
              "implementations": [
                  "IGiftCardProvider"
              ]
          }
      ]
    }

If you are using other providers other than the built in Omnium provider, you can change the name to the corresponding provider


## [2\. Order Workflow](#2-order-workflow)

For the first status when an order is added (typically **New**), the following workflow steps must be added:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "name": "CreateAndSendGiftCards",
        "active": true,
        "isInvisible": true
      },
      {
        "name": "ReserveGiftCards",
        "active": true,
        "isInvisible": true
      }
    ]

These steps handle:

*   **CreateAndSendGiftCards** – generates the gift card and sends it to the customer.
*   **ReserveGiftCards** – ensures the gift card is reserved in the system.


## [3\. Order Settings](#3-order-settings)

Gift card–specific settings must be defined in the order configuration:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "GiftCardSku": "1215694",       // SKU or ProductId of the gift card product.
      "GiftCardValidMonths": 12,       // Validity period in months
      "GiftCardCompletedStatus": null       // Optional: Will default to "VirtualShip" if not set, but you can modify this to set your own desired status
    }

The `giftCardSku` setting supports two matching modes:

1.  SKU-based: Matches order line items by their SKU code
2.  ProductId-based: Matches all variants of a product by ProductId

Use Case: This enables creating multiple gift card variants with predefined prices:

*   giftCard100 → $100 gift card
*   giftCard200 → $200 gift card
*   giftCard500 → $500 gift card

Behavior: When `giftCardSku` is set to a ProductId:

*   All order line items with matching ProductId will be processed as gift cards
*   Each variant maintains its own PlacedPrice (the gift card value)


## [Creating Gift Cards from Orders](#creating-gift-cards-from-orders)

### [How gift cards are created](#how-gift-cards-are-created)

Gift cards are generated from **order lines** that contain gift card products.  
If multiple gift cards are purchased in a single order, each one is created and processed individually.

### [Key parameters for gift card creation](#key-parameters-for-gift-card-creation)

*   **Gift card SKU**: The product code must be set in system settings (see _Order Settings_ above).
*   **Valid until**: If not explicitly set, the expiration date defaults to **12 months** from the order creation date.
*   **Amount**: Determined by the order line price.
*   **Gift card code**: Each gift card is assigned a **unique code**.
