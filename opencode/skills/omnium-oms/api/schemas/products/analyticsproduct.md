# Product Schemas — OmniumAnalyticsProduct to OmniumProductGroupings

## OmniumAnalyticsProduct

**Fields:**

- `brand`: string, nullable
- `catalogNodes`: List<`string`>, nullable
- `categories`: List<`string`>, nullable
- `color`: string, nullable
- `ean`: string, nullable
- `gender`: string, nullable
- `isExcludedFromAnalytics`: boolean
- `mainCategory`: string, nullable
- `name`: string, nullable
- `parentId`: string, nullable
- `productId`: string, nullable
- `productType`: string, nullable
- `size`: string, nullable
- `skuId`: string, nullable

---


## OmniumAssortmentCode

Assortment code

**Fields:**

- `assortmentCodeId`: string, nullable — Id of the assortment code - could be anything
- `validFrom`: string (date-time), nullable — Optional: Valid from date/time
- `validTo`: string (date-time), nullable — Optional: Valid to date/time

---


## OmniumCategoryAndBrandFilter

**Fields:**

- `brands`: List<`string`>, nullable
- `categories`: List<`OmniumProductCategory`>, nullable
- `excludedBrands`: List<`string`>, nullable
- `excludedCategories`: List<`OmniumProductCategory`>, nullable
- `excludedProducts`: List<`OmniumPromotionProduct`>, nullable
- `excludedProperties`: List<`OmniumPropertyItem`>, nullable
- `excludedSeasons`: List<`string`>, nullable
- `products`: List<`OmniumPromotionProduct`>, nullable
- `properties`: List<`OmniumPropertyItem`>, nullable
- `requiredCategories`: List<`OmniumProductCategory`>, nullable
- `seasons`: List<`string`>, nullable

---


## OmniumCostPrice

Product cost price

**Fields:**

- `cost`: number (decimal), nullable — The cost price, including discount amount. Cost or OriginalCost is required. The other will be calcu
- `currencyCode`: string, nullable — Currency code. E.g. USD, EUR, NOK
- `discountAmount`: number (decimal), nullable — Discount amount
- `discountCode`: string, nullable — Name of discount campaign
- `ean`: string, nullable — The ean the cost price is valid for
- `marketGroupId`: string, nullable — Market group ID the cost price is valid in
- `marketId`: string, nullable — Market ID the cost price is valid in
- `modified`: string (date-time), nullable — When the price was last modified
- `originalCost`: number (decimal), nullable — The original cost price before discount.
- `productId`: string, nullable — Calculated: ProductId of product.
- `skuId`: string, nullable — The SkuId the cost price is valid for. If empty, the cost price will be linked to the product, and b
- `storeGroupId`: string, nullable — Store group ID the cost price is valid in
- `storeId`: string, nullable — Store ID the cost price is valid in
- `supplier`: string, nullable — The related supplier for the cost price
- `type`: string, nullable — The type of cost price - if you have different types of cost prices
- `unit`: string, nullable — The unit the cost price is valid for
- `validFrom`: string (date-time), nullable — Cost price available from this date
- `validUntil`: string (date-time), nullable — Cost price available until this date

---


## OmniumCostPriceDeleteRequest

**Fields:**

- `costPrices`: List<`OmniumCostPrice`>, nullable — Cost prices to delete. If list is null, all cost prices for the product will be deleted. If list is 
- `productId`: string, nullable — Products ProductId to delete cost prices for

---


## OmniumCostPriceOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumCostPrice`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumCostPriceSearchRequest

Contains all parameters for doing a cost price search.

**Fields:**

- `lastModified`: string (date-time), nullable — Set LastModified to a specific DateTime to get items only modified after that time
- `marketIds`: List<`string`>, nullable — Filter prices on market IDs
- `productCodes`: List<`string`>, nullable — Filter prices on product codes (SKU / Product ID)
- `storeGroupId`: string, nullable — Filter prices on store group ID
- `storeIds`: List<`string`>, nullable — Filter prices on store IDs
- `validFrom`: string (date-time), nullable — Filter prices on valid from date. If null, the search will not filter by this property.
- `validUntil`: string (date-time), nullable — Filter prices on valid until date. If null, the search will not filter by this property.

---


## OmniumCostPriceUpdateRequest

**Fields:**

- `costPrices`: List<`OmniumCostPrice`>, nullable — Cost prices to add or update
- `ignoreDates`: boolean — If true, prices for variant will replace existing prices with other dates. If false, only prices wit
- `ignoreValidUntilDate`: boolean — If true, prices for variant will replace existing prices with other dates for the "ValidUntil" prope
- `productId`: string, nullable — Products ProductId to update cost prices for

---


## OmniumExcludedProductFieldOptions

Options for excluding fields

**Fields:**

- `isAssetsExcluded`: boolean, nullable — Exclude all assets (not MainImageUrl)
- `isEverythingExcluded`: boolean, nullable — Exclude all properties, except for ID. This would only be useful when used together with IncludedFie
- `isInventoryExcluded`: boolean, nullable — Exclude all inventory
- `isPricesExcluded`: boolean, nullable — Excluded all prices
- `isProductCategoriesExcluded`: boolean, nullable — Exclude all product categories
- `isPropertiesExcluded`: boolean, nullable — Exclude all custom properties
- `isVariantsExcluded`: boolean, nullable — Exclude all variant data
- `specificFields`: List<`string`>, nullable — List of specific fields to exclude. Fields should be camel cased and levels should be seperated with

---


## OmniumGetTopSellingProductsRecommendationsRequest

**Fields:**

- `categoryIDs`: List<`string`>, nullable
- `includeProductData`: boolean
- `isInStockRequired`: boolean
- `marketIds`: List<`string`>, nullable
- `since`: string (date-time)
- `storeIds`: List<`string`>, nullable

---


## OmniumProduct

**Fields:**

- `additionalSuppliers`: List<`OmniumProductSupplier`>, nullable — List of additional suppliers
- `allowSupplierPackageBreak`: boolean, nullable — Indicates if supplier packages can be split to order quantities smaller than the full package size.
- `alternativeProductName`: string, nullable — Alternative product name
- `assets`: List<`OmniumAsset`>, nullable — Product media files
- `associatedProducts`: List<`string`>, nullable — Associated product IDs Obsolete - Use RelatedProducts instead
- `assortmentCodes`: List<`OmniumAssortmentCode`>, nullable — Assortment codes for the product
- `availableInventory`: number (decimal) — Calculated: Number of items available in stock. If this is a product with variants, it will be a sum
- `averageRating`: number (double) — Calculated - Average rating for this product
- `badges`: List<`OmniumProductBadge`>, nullable — List of product badges or labels to display on product
- `brand`: string, nullable — Product brand
- `catalog`: string, nullable — Label to categorize or group products. In Omnium this is used to show statistics grouped by this lab
- `catalogNodes`: List<`string`>, nullable — Catalog nodes/categories. Simple list of strings of category names. Consider using the Categories pr
- `categories`: List<`OmniumProductCategory`>, nullable — Product categories. If category enrichment is turned on, only CategoryId are required when adding or
- `colli`: List<`OmniumProductColli`>, nullable — List of colli, used for shipment
- `color`: string, nullable — Product color
- `completionStatus`: → `OmniumCompletionStatus`
- `components`: List<`OmniumProductComponent`>, nullable — Product components (used when product is a package)
- `cost`: number (decimal) — Product net cost
- `costCurrency`: string, nullable — Currency code. E.g. USD, EUR, NOK
- `costInDefaultCurrency`: number (decimal), nullable — Cost in default currency
- `countryOfOrigin`: string, nullable — Country of origin
- `created`: string (date-time) — Date product is created
- `customsCode`: string, nullable — Customs code for the product
- `description`: string, nullable — Product description
- `discontinued`: string (date-time), nullable — Product discontinuation date. If discontinued date has passed, it should not be reordered from suppl
- `discountBlocked`: boolean, nullable — Permanent discount prohibition
- `ean`: string, nullable — EAN code
- `endDate`: string (date-time) — Product activation end date. Product is not active if date is in the past. Obsolete - Use StopPublis
- `entryType`: string, nullable — Product entry type
- `errors`: List<`OmniumEntityError`>, nullable — A list of errors (or warnings) for the product. Typically this is used in integrations where there w
- `excludeFromPromotions`: boolean, nullable — Set to true if this product should be excluded from promotions
- `expectedDeliveryDate`: string (date-time), nullable — Date when the product is expected back in stock. Calculated by purchase order services, or set exter
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external product IDs. Could be ids in eCommerce platform etc
- `fixedPriceCode`: string, nullable — Price protection category (e.g. book law)
- `fixedPriceEndDate`: string (date-time), nullable — Discounts are blocked until this date
- `freightClass`: string, nullable — Freight class
- `gender`: string, nullable — Gender
- `gtins`: List<`string`>, nullable — GTIN codes
- `id`: string, nullable — Required for products: Product unique ID. If your product catalog has multiple languages, the ID sho
- `inventory`: List<`OmniumProductInventory`>, nullable — Calculated: This is populated automatically by default based on inventory and updated by a scheduled
- `inventoryStatus`: string, nullable — Status of current inventory, based on AvailableInventory. Could be 'OutOfStock', 'LowInStock' or 'Hi
- `isActive`: boolean — True if product is active. False if it should be hidden from customers.
- `isBackorder`: boolean — If true, the product have no reorder level, and will usually not be in stock
- `isBundle`: boolean — True if product is a bundle of other products (unlike package, price is sum of components)
- `isExcludedFromAnalytics`: boolean — Set to true if this product should be excluded from analytics (e.g., gift cards that would inflate s
- `isInStock`: boolean — Calculated: This is populated automatically by default based on inventory and updated by a scheduled
- `isKit`: boolean — True if product is a pre-assembled kit made of other products (unlike package and bundle, kits have 
- `isLocalProduct`: boolean, nullable — Only relevant when IsLocalProductsEnabled is enabled in productSettings. When enabled, both 'IsLocal
- `isMainProductVariant`: boolean — If true, this variant should represent the product in flattened variant lists. This can also be used
- `isNotRatable`: boolean, nullable — Set to true if this product should be excluded from rating emails/forms
- `isPackage`: boolean — True if product is package of other products (unlike bundle, price is specified for package)
- `isSerializableProduct`: boolean — If true, the product is serializable, and order line should contain serial number when completed
- `isSku`: boolean — True if product is stock keeping unit / product that can be sold. Should always be set to true for p
- `isVirtual`: boolean, nullable — Virtual products will not affect inventory.
- `isWriteProtected`: boolean — True if product is write protected by user. PIM integrations should not override product information
- `language`: string, nullable — Product language code. This should match 'ProductContentLanguage' on a stored market in Omnium. Typi
- `leadTime`: integer (int32), nullable — Lead time in days
- `location`: string, nullable — The location of the product in the warehouse.
- `locationOverstock`: List<`string`>, nullable — Overstock locations (extra inventory locations)
- `lowestPriceHistory`: List<`OmniumPriceReference`>, nullable — Price history (lowest prices for each market)
- `mainCategoryId`: string, nullable — This is the main category for the product, and should be one of the CategoryIds in Categories. If Ca
- `mainCategoryName`: string, nullable — Calculated field: If MainCategoryId is given, and exists as a category in Omnium, this property will
- `mainImageUrl`: string, nullable — Product main image url. If not set, this will be populated from the product assets, using the asset 
- `marketGroupIds`: List<`string`>, nullable — List of available market group IDs
- `marketIds`: List<`string`>, nullable — List of available market IDs. If not set, the product will be available for all markets.
- `maxQuantity`: number (decimal) — Max inventory quantity (what should be in stock after new supply)
- `minQuantity`: number (decimal) — Minimum inventory quantity (point of reordering)
- `modified`: string (date-time) — Date product is modified
- `name`: string, nullable — Product name
- `parentId`: string, nullable — The ParentId should only be set for products that has a third product level, which is above product 
- `popularitySortIndices`: List<`OmniumCustomSortIndex`>, nullable — Calculated: List of market specific popularity indices
- `popularityStandardSortIndex`: → `OmniumCustomSortIndex`
- `price`: → `OmniumPrice`
- `prices`: List<`OmniumPrice`>, nullable — List of all product prices - all currencies, campaigns, customer prices etc
- `productGroup`: → `OmniumProductGroup`
- `productId`: string, nullable — Unique product Id, without language conventions. Variants on a product should have the same value fo
- `productOptions`: List<`OmniumProductOption`>, nullable — Available product options for the product
- `productType`: string, nullable — Optional: Specifies if this product is of a specific kind. An example of this is the type "ProductOp
- `promotionIds`: List<`string`>, nullable — Promotions associated with the product
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties. Key value pairs with any non strongly typed properties.
- `published`: string (date-time) — Date product is published
- `ratingCount`: integer (int32) — Calculated - Number of ratings for this product
- `relatedProducts`: List<`OmniumRelatedProduct`>, nullable — Related products
- `salesStartDate`: string (date-time), nullable — Embargo date: product cannot be sold before this date
- `season`: string, nullable — Product season
- `seoInfo`: → `OmniumSeoInfo`
- `seoInformation`: List<`OmniumSeoInfo`>, nullable — Product information for search engine optimization Obsolete - Use SeoInfo instead
- `shortDescription`: string, nullable — Short product description
- `siblings`: List<`string`>, nullable — List of sibling product IDs Obsolete - Use RelatedProducts instead
- `size`: string, nullable — Product size
- `sizeType`: string, nullable — Product size type
- `skuId`: string, nullable — Product unique SKU (but equal for all language versions). This should only be set for variants, or i
- `sortIndex`: integer (int32) — Calculated sort index
- `sortIndexBase`: integer (int32) — Calculated sort index base set by Omnium services
- `sortIndexBoost`: integer (int32) — Sort index set by API / GUI
- `specification`: string, nullable — Product Specification
- `startDate`: string (date-time) — Product activation date. Product is not active if date is in the future. Obsolete - Use Published pr
- `status`: string, nullable — Status is set by Omnium. "Published" is default. When delete a product in GUI. Status will be update
- `stopPublished`: string (date-time), nullable — Product activation end date. Can be null
- `storeIds`: List<`string`>, nullable — List of available store IDs. If not set, the product will be available for all stores.
- `supplierColor`: string, nullable — Color from supplier
- `supplierId`: string, nullable — Main supplier ID
- `supplierLeadTime`: integer (int32), nullable — Supplier lead time in days
- `supplierName`: string, nullable — Name of main product supplier
- `supplierPackagingQuantity`: number (decimal), nullable — Supplier packaging quantity (D-Pack)
- `supplierPackagingUnit`: string, nullable — Unit for supplier sku
- `supplierSkuId`: string, nullable — External product ID from supplier, used when creating purchase orders
- `tags`: List<`string`>, nullable — List of tags.
- `taxCategory`: string, nullable — Product tax category
- `unit`: string, nullable — Product unit, used for describing what unit the quantities are in
- `units`: List<`OmniumProductUnit`>, nullable — List of additional units
- `variants`: List<`OmniumProductVariant`>, nullable — List of variants
- `warehouseInventories`: List<`OmniumWarehouseInventory`>, nullable — Warehouse inventories Obsolete - Use Inventory api endpoint instead
- `weight`: number (double), nullable — Product weight in kilograms (kg)

---


## OmniumProductAlertRequest

**Fields:**

- `email`: string, nullable — Email address to send the alert to
- `id`: string, nullable — ProductAlert ID (Will be set to Guid if not set)
- `marketId`: string, nullable — MarketId determines language variant of the notification.
- `phone`: string, nullable — Phone number to send the alert to
- `skuId`: string **required** — SkuID of the product to alert on
- `storeId`: string, nullable — StoreID of the store to monitor inventory for, if not set, will monitor all warehouses.

---


## OmniumProductAlertSearchRequest

**Fields:**

- `created`: string (date-time) — Date the ProductAlert was created
- `email`: List<`string`>, nullable — Email of the customer
- `id`: List<`string`>, nullable — Id of the ProductAlert object
- `isActive`: boolean, nullable — ProductAlert is active
- `notificationSentDate`: string (date-time), nullable — Date the ProductAlert was sent
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `phone`: List<`string`>, nullable — Phone number of the customer
- `productAlertDeletedDate`: string (date-time), nullable — Date the ProductAlert was deleted
- `skuId`: List<`string`>, nullable — SkuId of product
- `storeId`: List<`string`>, nullable — StoreId of the original request
- `storeName`: List<`string`>, nullable — StoreName of the original request
- `take`: integer (int32) — Number of productAlerts to take
- `warehouseCodes`: List<`string`>, nullable — WarehouseCodes to monitor

---


## OmniumProductBadge

Product badge or label to display on product

**Fields:**

- `text`: string, nullable — Text on badge
- `type`: string, nullable — Label or badge type (Sales, Season, etc)

---


## OmniumProductCategory

Product category

**Fields:**

- `assets`: List<`OmniumAsset`>, nullable — Product category media files
- `categoryId`: string, nullable — Product category ID (Without language prefix). Required when adding a new category
- `description`: string, nullable — Product category short description
- `googleProductCategoryId`: string, nullable — Google's category id of the item (see [Google product taxonomy](https://support.google.com/merchants
- `id`: string, nullable — Product category ID (Calculated, unique, including language prefix: {CategoryId}_{Language})
- `imageUrl`: string, nullable — Image Url
- `isHidden`: boolean — True if category should be hidden to end users
- `isMainCategory`: boolean — Is product category a primary category
- `language`: string, nullable — Product category language code
- `metaDescription`: string, nullable — Meta description
- `metaKeywords`: string, nullable — Meta keywords
- `metaTitle`: string, nullable — Meta title
- `name`: string, nullable — Product category name
- `parentId`: string, nullable — Parent category ID
- `productSearchId`: string, nullable — Product search ID. If this property has value, the category is a dynamic category representing a sav
- `properties`: List<`OmniumPropertyItem`>, nullable — Properties
- `sortIndex`: integer (int32) — Sort index

---


## OmniumProductCategoryOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProductCategory`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProductCategoryOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProductCategory`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProductCategoryPatch

Product category patch model for partial updates

**Fields:**

- `assets`: List<`OmniumAsset`>, nullable — Product category media files
- `categoryId`: string, nullable — Product category ID (Without language prefix)
- `description`: string, nullable — Product category short description
- `fieldsToForceNull`: List<`string`>, nullable — Force nullable category fields to null. Use the property path, e.g. "Description".
- `googleProductCategoryId`: string, nullable — Google's category id of the item (see Google product taxonomy).
- `id`: string, nullable — Product category ID (Calculated, unique, including language prefix: {CategoryId}_{Language}). Used t
- `imageUrl`: string, nullable — Image Url
- `isHidden`: boolean, nullable — True if category should be hidden to end users
- `isMainCategory`: boolean, nullable — Is product category a primary category
- `keepExistingAssets`: boolean, nullable — Set to 'false' if you want to update the whole 'Assets' list. If true, new assets will be added to t
- `keepExistingProperties`: boolean, nullable — Set to 'false' if you want to update the whole 'properties' list. If true, new properties will be ad
- `language`: string, nullable — Product category language code
- `metaDescription`: string, nullable — Meta description
- `metaKeywords`: string, nullable — Meta keywords
- `metaTitle`: string, nullable — Meta title
- `name`: string, nullable — Product category name
- `parentId`: string, nullable — Parent category ID
- `productSearchId`: string, nullable — Product search ID. If this property has value, the category is a dynamic category representing a sav
- `properties`: List<`OmniumPropertyItem`>, nullable — Properties
- `sortIndex`: integer (int32), nullable — Sort index

---


## OmniumProductCategoryRelationsRequest

Request object for adding multiple categories to multiple products

**Fields:**

- `productCategoryId`: string, nullable — Product Category ID
- `productId`: string, nullable — Product ID

---


## OmniumProductCategorySearchRequest

Search request object for products

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Filter by facets
- `language`: string, nullable — Language filter (language code)
- `page`: integer (int32) — Page to fetch
- `parentIds`: List<`string`>, nullable — Filter by parent IDs
- `productCategoryId`: string, nullable — Search by category id
- `productCategoryIds`: List<`string`>, nullable — Filter by category IDs
- `ratingType`: string, nullable — Filter by rating
- `searchText`: string, nullable — Free text search
- `take`: integer (int32) — Number of items pr page

---


## OmniumProductCategoryTreeViewModel

View model for product category tree

**Fields:**

- `productCategory`: → `OmniumProductCategory`
- `productCount`: integer (int32) — Number of products in category
- `subCategories`: List<`OmniumProductCategoryTreeViewModel`>, nullable — List of product category sub items

---


## OmniumProductCategoryUpdateResult

Result of a product category patch operation

**Fields:**

- `errorCount`: integer (int32) — Number of errors encountered
- `errorMessage`: string, nullable — Error messages
- `isModified`: boolean — True if any category was modified
- `notFoundCount`: integer (int32) — Number of categories not found
- `notFoundIds`: List<`string`>, nullable — List of category IDs that were not found
- `totalCount`: integer (int32) — Total number of categories processed
- `unchangedCount`: integer (int32) — Number of categories unchanged
- `updatedCount`: integer (int32) — Number of categories updated

---


## OmniumProductColli

Shipment colli

**Fields:**

- `height`: number (double), nullable — Cm
- `isFreight`: boolean, nullable — True if colli must be sendt as freight
- `isSentSeparately`: boolean, nullable — True if colli must be set as single colli
- `length`: number (double), nullable — Cm
- `volume`: number (double), nullable — Dm3
- `weight`: number (double), nullable — Gram
- `width`: number (double), nullable — Cm

---


## OmniumProductComponent

Product package component

**Fields:**

- `componentId`: string, nullable — Component ID (Unique GUID)
- `componentName`: string, nullable — The display name of the component. Primarily relevant when using component options where no default 
- `id`: string, nullable — OBSOLETE Component product ID - Use ProductId instead
- `isRequired`: boolean — This property is for external use only and has no functional effect within Omnium.
- `options`: List<`OmniumComponentOption`>, nullable — A list of selectable options for this component. The SkuId is populated when an option is selected.
- `productId`: string, nullable — Component product ID
- `quantity`: number (decimal) — Quantity of component in package
- `skuId`: string, nullable — Component SkuId - use this to preselect variant in package.

---


## OmniumProductContentLanguage

**Fields:**

- `displayName`: string, nullable
- `languageCode`: string, nullable
- `translateKey`: string, nullable

---


## OmniumProductFacet

**Fields:**

- `name`: string, nullable
- `type`: string, nullable

---


## OmniumProductGroup

Product group

**Fields:**

- `id`: string, nullable — Product group ID
- `name`: string, nullable — Product group name

---


## OmniumProductGroupRefund

Represents refunds/returns grouped by product category.

**Fields:**

- `amount`: number (decimal) — Total refund amount for this product group.
- `count`: integer (int32) — Number of items refunded in this group.
- `name`: string, nullable — Name of the product group or category.
- `vatValue`: number (decimal) — VAT rate percentage applied to this product group.

---


## OmniumProductGroupings

Represents sales grouped by product category or group.

**Fields:**

- `amount`: number (decimal) — Total amount for this product group.
- `count`: integer (int32) — Number of items sold in this group.
- `name`: string, nullable — Name of the product group or category.
- `vatValue`: number (decimal), nullable — VAT rate percentage applied to this product group (optional).

---
