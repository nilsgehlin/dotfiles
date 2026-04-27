# Product Schemas — OmniumProductListItemViewModel to OmniumProductUnit

## OmniumProductListItemViewModel

View model for product list item

**Fields:**

- `alternativeProductName`: string, nullable — Alternative product name
- `assets`: List<`OmniumAsset`>, nullable
- `averageRating`: number (double) — Average rating for product
- `badges`: List<`OmniumProductBadge`>, nullable — List of product badges or labels to display on product
- `brand`: string, nullable — Product brand
- `catalog`: string, nullable — Catalog name
- `catalogNodes`: List<`string`>, nullable — Catalog nodes (if multiple)
- `categories`: List<`OmniumProductCategory`>, nullable — Product categories
- `categoryIds`: List<`string`>, nullable — List of category IDs
- `colli`: List<`OmniumProductColli`>, nullable — List of colli, used for shipment
- `color`: string, nullable — Product color
- `components`: List<`OmniumProductComponent`>, nullable — Components included in product - only relevant if products is package/bundle
- `cost`: number (decimal) — Product net cost
- `costInDefaultCurrency`: number (decimal), nullable — Product cost in default currency
- `costPrices`: List<`OmniumCostPrice`>, nullable — List of product cost prices retrieved from separate index. Only relevant if HasSeparateCostPrices = 
- `countryOfOrigin`: string, nullable — Product country of origin
- `description`: string, nullable — Product description
- `discontinued`: string (date-time), nullable — Product discontinuation date. If discontinued date has passed, it should not be reordered from suppl
- `ean`: string, nullable — EAN code
- `expectedDeliveryDate`: string (date-time), nullable — Total inventory quantity for all warehouses
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external IDs. External IDs are visible in Omnium's UI and useful for display, searching and 
- `gender`: string, nullable — Product gender
- `gtins`: List<`string`>, nullable — GTIN codes
- `id`: string, nullable — Product unique ID
- `inventory`: List<`OmniumProductInventory`>, nullable — List of warehouse inventory for the product.
- `isActive`: boolean — True if product is active. False if it should be hidden from customers.
- `isBackorder`: boolean — If true, the product have no reorder level, and will usually not be in stock
- `isBundle`: boolean — True if product is a bundle of other products (unlike package, price is sum of components)
- `isMainProductVariant`: boolean — If true, this variant should represent the product in flattened variant lists
- `isPackage`: boolean — True if product is package of other products (unlike bundle, price is specified for package)
- `isSku`: boolean — True if product is stock keeping unit / product or variant that can be sold
- `isVirtual`: boolean, nullable — If true the product inventory status is ignored. Inventory for these products will not be taken into
- `leadTime`: integer (int32), nullable — Lead time in days
- `lowestPriceHistory`: List<`OmniumPriceReference`>, nullable — Price history (lowest prices for each market)
- `mainCategoryId`: string, nullable — Main category id
- `mainCategoryName`: string, nullable — Main category name
- `mainImageUrl`: string, nullable — Product image url
- `marketIds`: List<`string`>, nullable — Market IDs
- `modified`: string (date-time), nullable — Used for manual sorting of products
- `name`: string, nullable — Product name
- `parentId`: string, nullable — Product parent ID
- `price`: → `OmniumPrice`
- `prices`: List<`OmniumPrice`>, nullable — List of prices
- `productCategories`: List<`OmniumProductCategory`>, nullable — Product categories
- `productId`: string, nullable — Product ID
- `productOptions`: List<`OmniumProductOption`>, nullable — Available product options for the product
- `productType`: string, nullable — Product type which product will inherit properties from
- `promotionIds`: List<`string`>, nullable — Promotions associated with the product
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties. Key value pairs with any non strongly typed properties.
- `published`: string (date-time), nullable — Published datetime.
- `ratingCount`: integer (int32) — Number of ratings for the product
- `relatedProducts`: List<`OmniumRelatedProduct`>, nullable — Related products
- `season`: string, nullable — Product season
- `seoInfo`: → `OmniumSeoInfo`
- `shortDescription`: string, nullable — Short product description
- `size`: string, nullable — Product size
- `sizeType`: string, nullable — Product size type
- `skuId`: string, nullable — Product SKU ID
- `sortIndex`: integer (int32), nullable — Calculated - Used for manual sorting of products (SortIndexBase + SortIndexBoost)
- `sortIndexBase`: integer (int32), nullable — Used for manual sorting of products
- `sortIndexBoost`: integer (int32), nullable — Used for manual sorting of products
- `specification`: string, nullable — Product specification
- `stopPublished`: string (date-time), nullable — Product activation end date. Can be null
- `storeIds`: List<`string`>, nullable — List of available store IDs. If not set, the product will be available for all stores.
- `supplierId`: string, nullable — Main supplier ID
- `supplierLeadTime`: integer (int32), nullable — Supplier lead time in days
- `supplierName`: string, nullable — Name of main product supplier
- `supplierSkuId`: string, nullable — External product ID from supplier
- `tags`: List<`string`>, nullable — List of product tags
- `unit`: string, nullable — Product unit, used for describing what unit the quantities are in
- `units`: List<`OmniumProductUnit`>, nullable — List of additional units
- `variants`: List<`OmniumProductListItemViewModel`>, nullable — List of variants
- `weight`: number (double), nullable — Product weight in kilograms (kg)

---


## OmniumProductListItemViewModelOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProductListItemViewModel`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProductListItemViewModelRecommendation

**Fields:**

- `product`: → `OmniumProductListItemViewModel`
- `recommendedId`: string, nullable
- `score`: number (double)

---


## OmniumProductOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProduct`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProductOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProduct`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProductPatch

Product patch

**Fields:**

- `additionalSuppliers`: List<`OmniumProductSupplier`>, nullable — List of additional product suppliers
- `allowSupplierPackageBreak`: boolean, nullable — Indicates if supplier packages can be split to order quantities smaller than the full package size.
- `alternativeProductName`: string, nullable — Alternative product name
- `assets`: List<`OmniumAsset`>, nullable — Product media files
- `associatedProducts`: List<`string`>, nullable — Associated product IDs
- `assortmentCodes`: List<`OmniumAssortmentCode`>, nullable — Assortment codes for the product
- `badges`: List<`OmniumProductBadge`>, nullable — List of product badges or labels to display on product
- `brand`: string, nullable — Product brand
- `catalog`: string, nullable — Catalog name
- `catalogNodes`: List<`string`>, nullable — Catalog nodes (if multiple)
- `categories`: List<`OmniumProductCategory`>, nullable — Product categories
- `categoryIdsToRemove`: List<`string`>, nullable — List of CategoryIds to remove from the product. This removes the categories from both CategoryIds an
- `colli`: List<`OmniumProductColli`>, nullable — List of colli, used for shipment
- `color`: string, nullable — Product color
- `components`: List<`OmniumProductComponent`>, nullable — Product components (used when product is a package)
- `cost`: number (decimal), nullable — Product net cost
- `costCurrency`: string, nullable — Currency code. E.g. USD, EUR, NOK
- `countryOfOrigin`: string, nullable — Country of origin
- `customsCode`: string, nullable — Customs code for the product
- `description`: string, nullable — Product description
- `discontinued`: string (date-time), nullable — Product discontinuation date. If discontinued date has passed, it should not be reordered from suppl
- `discountBlocked`: boolean, nullable — Permanent discount prohibition
- `dontOverwriteExistingPropertyValues`: boolean, nullable — Set to 'true' if you want to skip updating properties that already exists and has a value. If you wa
- `ean`: string, nullable — EAN code
- `entryType`: string, nullable — Product entry type
- `excludeFromPromotions`: boolean, nullable — Set to true if this product should be excluded from promotions
- `expectedDeliveryDate`: string (date-time), nullable — Expected delivery date
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external product IDs. Could be ids in eCommerce platform etc
- `fieldsToForceNull`: List<`string`>, nullable — Force nullable product fields to null. Use the property path, e.g. "SeoInfo.Description".
- `fixedPriceCode`: string, nullable — Price protection category (e.g. book law)
- `fixedPriceEndDate`: string (date-time), nullable — Discounts are blocked until this date
- `freightClass`: string, nullable — Freight class
- `gender`: string, nullable — Gender
- `gtins`: List<`string`>, nullable — GTIN codes
- `id`: string, nullable — Product unique ID
- `isActive`: boolean, nullable — True if product is active. False if it should be hidden from customers.
- `isBackorder`: boolean, nullable — If true, the product have no reorder level, and will usually not be in stock
- `isBundle`: boolean, nullable — True if product is a bundle of other products (unlike package, price is sum of components)
- `isInStock`: boolean, nullable — True if product is in stock
- `isKit`: boolean, nullable — True if product is a kit (product composed of other products, assembled at fulfillment)
- `isLocalProduct`: boolean, nullable — Only relevant when IsLocalProductsEnabled is enabled in productSettings. When enabled, both 'IsLocal
- `isMainProductVariant`: boolean, nullable — If true, this variant should represent the product in flattened variant lists
- `isNotRatable`: boolean, nullable — Set to true if this product should be excluded from rating emails/forms
- `isPackage`: boolean, nullable — True if product is package of other products (unlike bundle, price is specified for package)
- `isSerializableProduct`: boolean, nullable — If true, the product is serializable, and order line should contain serial number when completed
- `isSku`: boolean, nullable — True if product is stock keeping unit / product or variant that can be sold
- `isVirtual`: boolean, nullable — Virtual products will not affect inventory.
- `isWriteProtected`: boolean, nullable — True if product is write protected by user. PIM integrations should not override product information
- `keepExistingAssets`: boolean, nullable — Set to 'false' if you want to update the whole 'Assets' list. If true, new assets will be added to t
- `keepExistingCustomProperties`: boolean, nullable — Set to 'false' if you want to update the whole 'properties' list. If true, new properties will be ad
- `language`: string, nullable — Product language
- `leadTime`: integer (int32), nullable — Lead time in days
- `location`: string, nullable — The location of the product in the warehouse.
- `mainCategoryId`: string, nullable — Main category id
- `mainCategoryName`: string, nullable — Main category name
- `mainImageUrl`: string, nullable — Product image url
- `marketGroupIds`: List<`string`>, nullable — List of available market group IDs
- `marketIds`: List<`string`>, nullable — List of available market IDs
- `maxQuantity`: number (decimal), nullable — Max inventory quantity (what should be in stock after new supply)
- `minQuantity`: number (decimal), nullable — Minimum inventory quantity (point of reordering)
- `name`: string, nullable — Product name
- `parentId`: string, nullable — Product parent ID
- `prices`: List<`OmniumPrice`>, nullable — List of all product prices - all currencies, campaigns, customer prices etc
- `productId`: string, nullable — Product ID
- `productOptions`: List<`OmniumProductOption`>, nullable — Available product options for the product
- `productType`: string, nullable — Type of product
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties. Key value pairs with any non strongly typed properties.
- `propertiesRemovalConditions`: List<`OmniumPropertyItem`>, nullable — Specifies conditions for removing existing properties before proceeding with the patch operation. Ea
- `published`: string (date-time), nullable — Date product is published
- `relatedProducts`: List<`OmniumRelatedProduct`>, nullable — Related products
- `removeExistingVariants`: boolean, nullable — If true, existing variants will be deleted and only variants in the variant patch will be added. 'Fa
- `salesStartDate`: string (date-time), nullable — Embargo date: product cannot be sold before this date
- `season`: string, nullable — Product season
- `seoInfo`: → `OmniumSeoInfo`
- `shortDescription`: string, nullable — Short product description
- `siblings`: List<`string`>, nullable — List of sibling product IDs
- `size`: string, nullable — Product size
- `sizeType`: string, nullable — Product size type
- `skuId`: string, nullable — Product unique ID
- `sortIndexBoost`: integer (int32), nullable — Sort index set by API / GUI
- `specification`: string, nullable — Product Specification
- `stopPublished`: string (date-time), nullable — Product activation end date. Can be null
- `storeIds`: List<`string`>, nullable — List of available store IDs
- `supplierColor`: string, nullable — Color from supplier
- `supplierId`: string, nullable — Main supplier ID
- `supplierLeadTime`: integer (int32), nullable — Supplier lead time in days
- `supplierName`: string, nullable — Name of main product supplier
- `supplierPackagingQuantity`: number (decimal), nullable — Supplier packaging quantity
- `supplierPackagingUnit`: string, nullable — Supplier packaging quantity
- `supplierSkuId`: string, nullable — External product ID from supplier, used when creating purchase orders
- `tags`: List<`string`>, nullable — List of tag IDs
- `taxCategory`: string, nullable — Product tax category
- `unit`: string, nullable — Product unit, used for describing what unit the quantities are in
- `units`: List<`OmniumProductUnit`>, nullable — List of additional units
- `variants`: List<`OmniumVariantPatch`>, nullable — List of variant patches.
- `weight`: number (double), nullable — Product weight

---


## OmniumProductPromotionIdSearchResult

Active promotions search result

**Fields:**

- `productCount`: integer (int32) — Number of products
- `promotionId`: string, nullable — Promotion ID
- `promotionName`: string, nullable — Promotion name

---


## OmniumProductPromotionIdSearchResultOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProductPromotionIdSearchResult`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProductSales

Class used for product sales Statistics

**Fields:**

- `cancelledStats`: List<`OmniumStatsAggregateOmniumBucket`>, nullable — Total number of cancelled items stats
- `costSum`: List<`OmniumValueAggregateOmniumBucket`>, nullable — Total product cost
- `extendedPriceSum`: List<`OmniumValueAggregateOmniumBucket`>, nullable — Total sales price
- `profitChartSeries`: → `OmniumChart`
- `quantityChartSeries`: → `OmniumChart`
- `quantityStats`: List<`OmniumStatsAggregateOmniumBucket`>, nullable — Total quantity stats
- `returnedStats`: List<`OmniumStatsAggregateOmniumBucket`>, nullable — Total number of return items stats
- `salesChannelTerms`: List<`OmniumTermsAggregationDataListOmniumBucket`>, nullable — Sales channel stats
- `statusTerms`: List<`OmniumTermsAggregationDataListOmniumBucket`>, nullable — Status stats
- `storeTerms`: List<`OmniumTermsAggregationDataListOmniumBucket`>, nullable — Store/shop stat

---


## OmniumProductSearchBoostedProperty

**Fields:**

- `boostValue`: number (double)
- `isSearchable`: boolean
- `propertyName`: string, nullable

---


## OmniumProductSearchRequest

Search request object for products

**Fields:**

- `assortmentCodeIds`: List<`string`>, nullable — Search by assortment codes.
- `completionRate`: → `OmniumCompletionRateFilter`
- `componentIds`: List<`string`>, nullable — Search for products by component IDs. Returns all products that contain any of the specified IDs in 
- `customerGroup`: string, nullable — Obsolete! Please use CustomerGroups instead. | Search by customer group. Only prices valid for custo
- `customerGroups`: List<`string`>, nullable — Search by customer groups. Only prices valid for customer group will be returned
- `customerId`: string, nullable — Search by customer ID. Only prices valid for customer will be returned
- `daysSincePublished`: integer (int32), nullable — Number of days since published. This will replace StartPublishFrom date.
- `excludedFields`: → `OmniumExcludedProductFieldOptions`
- `excludedProductCategoryIds`: List<`string`>, nullable — Product category IDs to exclude from search results. Products in these categories will not be return
- `excludedProductIds`: List<`string`>, nullable — List of specified product Ids to exclude. Typically used if you want to search for sibling products 
- `excludedTags`: List<`string`>, nullable — List of excluded tag names
- `externalIds`: List<`string`>, nullable — Search products with external IDs
- `facets`: List<`OmniumFacetViewModel`>, nullable — Product facets
- `gtins`: List<`string`>, nullable — Search by gtins on product. This searches for matches on fields EAN, GTINS and Units.EAN both on pro
- `ignoreCustomerAssortment`: boolean — If set to 'true', the customer in product search context's assortment codes will not be used in the 
- `inStockMarketIds`: List<`string`>, nullable — Select which market(s) the IsInStock filter should be applied to. If not set, IsInStock will return 
- `inStockWarehouseIds`: List<`string`>, nullable — Select which warehouse(s) the IsInStock filter should be applied to. If not set, IsInStock will retu
- `includedFields`: → `OmniumIncludedFieldsOptions`
- `isActive`: boolean — True will only return active products. False will return both active and inactive products.
- `isAssortmentCodesRequired`: boolean, nullable — When true, the product must have an assortment that matches one of the provided assortment codes and
- `isAvailableOnline`: boolean, nullable — When true, returns only products that are available online (have stock in online-enabled warehouses)
- `isBundle`: boolean, nullable — True will only return products that are bundles.
- `isCostOnSale`: boolean, nullable — Only works if separate cost prices are enabled in the configuration. True returns products with cost
- `isDeleted`: boolean — True will only return deleted products (Status == "Deleted"). Value is false by default, only return
- `isFacetsDisabled`: boolean, nullable — If set to true, facets (aggregations) will not be created and returned in the search request. Should
- `isInStock`: boolean, nullable — True returns products in stock. False returns products not in stock. Null returns both. Should be co
- `isInactive`: boolean — True will only return inactive products. Ignored if IsActive == true.
- `isLocalProduct`: boolean, nullable — Only relevant when IsLocalProductsEnabled is enabled in productSettings. Filter by local product
- `isMainProductVariant`: boolean, nullable — True returns only main variants.
- `isOnSale`: boolean, nullable — True returns products on sale. False returns products not on sale. Null returns both.
- `isPackage`: boolean, nullable — True will only return products that are packages.
- `isPricesExcluded`: boolean, nullable — If true, prices are searched, parsed and sorted in Omnium, but the price list is not returned
- `isProductLanguageFilterIgnored`: boolean, nullable — Ignore product language filter. If "ProductLanguage" is not specified in the request, we use the sel
- `isPublished`: boolean, nullable — |             If true - only returns products published today
- `isSku`: boolean, nullable — True will only return products that are SKUs (products without variants). False will only return pro
- `isUnionDeltaQuery`: boolean, nullable — When true, uses OR logic: returns products that are either modified since ModifiedFrom OR have price
- `marketGroupId`: string, nullable — Search by market group. Only products
- `marketGroupIds`: List<`string`>, nullable — Search by market groups.
- `marketId`: string, nullable — Search by market. Only prices valid for market will be returned
- `marketIds`: List<`string`>, nullable — Search by markets. Only prices valid for the markets will be returned
- `modifiedFrom`: string (date-time), nullable — Products modified from date
- `modifiedTo`: string (date-time), nullable — Products modified before date
- `page`: integer (int32) — Page to fetch
- `priceActivatedFrom`: string (date-time), nullable — Search for products with prices that became valid (activated) on or after this date/time
- `priceActivatedTo`: string (date-time), nullable — Search for products with prices that became valid (activated) on or before this date/time
- `priceDeactivatedFrom`: string (date-time), nullable — Search for products with prices that became invalid (deactivated) on or after this date/time
- `priceDeactivatedTo`: string (date-time), nullable — Search for products with prices that became invalid (deactivated) on or before this date/time
- `priceFrom`: number (decimal), nullable — Search for products with price above FromPrice
- `priceTo`: number (decimal), nullable — Search for products with price below ToPrice
- `productCategoryIds`: List<`string`>, nullable — Search by category ids
- `productIds`: List<`string`>, nullable — Search by product ids
- `productLanguage`: string, nullable — Language code e.g. en, no, es
- `productParentIds`: List<`string`>, nullable — Search by product parent ids
- `productType`: string, nullable — Product type
- `promotionIds`: List<`string`>, nullable — List of promotion IDs. Return only products with active prices with any of the promotion IDs.
- `property`: → `OmniumPropertyItem`
- `propertyListId`: string, nullable — Property list ID - Predefined property lists in settings for filtering
- `searchText`: string, nullable — Search text
- `seoUris`: List<`string`>, nullable — Search by SEO URI(s)
- `sortIndexThreshold`: integer (int32), nullable — If set result will not contain products with sort index lower than threshold
- `sortOrder`: string, nullable — Primary (1st) sort order. List of options can be found in docs: https://docs.omnium.no/docs/Product/
- `sortOrder2nd`: string, nullable — Secondary (2nd) sort order - if set, primary sort order (SortOrder) is required
- `sortOrder3rd`: string, nullable — Tertiary (3rd) sort order - if set,  primary (SortOrder) and secondary (SortOrder2nd) sort order is 
- `startPublishFrom`: string (date-time), nullable — Products published from date
- `startPublishTo`: string (date-time), nullable — Products published to date
- `stopPublishFrom`: string (date-time), nullable — Products stopped published from date
- `stopPublishTo`: string (date-time), nullable — Products stopped published from date
- `storeGroupIds`: List<`string`>, nullable — Search by store groups. Only products available for the stores in the store groups, and prices valid
- `storeId`: string, nullable — Search by store. Only products available for store, and prices valid for store will be returned
- `storeIdPriceFilter`: string, nullable — Only prices valid for store will be returned
- `storeIds`: List<`string`>, nullable — Search by stores. Only products available for stores, and prices valid for stores will be returned
- `supplierIds`: List<`string`>, nullable — Search by supplier.
- `supplierSkuIds`: List<`string`>, nullable — Search by supplier skuIds.
- `tags`: List<`string`>, nullable — Product tags
- `take`: integer (int32) — Number of items pr page

---


## OmniumProductSearchSettings

**Fields:**

- `aggregationSize`: integer (int32)
- `boostedProperties`: List<`OmniumProductSearchBoostedProperty`>, nullable
- `inStockBoosting`: number (double)
- `isFuzzinessAuto`: boolean
- `isInStockBoosted`: boolean
- `isPopularityBoosted`: boolean
- `isPricesExcludedFromSearch`: boolean
- `isPromotionBoosted`: boolean
- `popularityBoosting`: number (double)
- `prefixBoost`: number (double)
- `promotionBoosting`: number (double)

---


## OmniumProductSettings

**Fields:**

- `assetPurposeKeys`: List<`string`>, nullable
- `currencies`: List<`string`>, nullable
- `defaultProductCostCurrency`: string, nullable
- `defaultProperties`: List<`OmniumDefaultPropertyItem`>, nullable
- `hasCustomerSpecificPrices`: boolean
- `hasExternalPrices`: boolean
- `hasPackages`: boolean
- `highlightedProperties`: List<`string`>, nullable
- `imageAspectRatios`: List<`OmniumAspectRatio`>, nullable
- `imageMaxSize`: → `OmniumAspectRatio`
- `isAssortmentStoreIdRequired`: boolean
- `isDefaultPriceOverridingPrices`: boolean
- `isImagesAutoResizedOnUpload`: boolean
- `isIncompleteProductsEnabled`: boolean
- `isLocationEqualForAllVariants`: boolean
- `isOmniumSortIndexProviderEnabled`: boolean
- `isOmniumUrlProviderEnabled`: boolean
- `isPriceUpdateOperationDelayed`: boolean
- `isProductLanguagesEnabled`: boolean
- `isProductOptionsEnabled`: boolean
- `isProductPriceSetToLowestVariantPrice`: boolean — If set to true, product price will be updated to the lowest variant price when the product is enrich
- `isProductStatisticsEnabled`: boolean
- `isTableStorageDisabled`: boolean
- `isUpdatePricesAlwaysMarkedAsModified`: boolean — Set to true to force price updates with new "Modified" date, even if price has not changed
- `isVariantPricesJoined`: boolean
- `isVariantSearchEnabled`: boolean
- `omniumUrlProviderTemplate`: string, nullable
- `priceManagement`: boolean
- `productContentLanguages`: List<`OmniumProductContentLanguage`>, nullable
- `productFacets`: List<`OmniumProductFacet`>, nullable
- `productSearchSettings`: → `OmniumProductSearchSettings`
- `productTypes`: List<`OmniumProductTypeItem`>, nullable
- `readOnly`: boolean
- `relatedProductKeys`: List<`string`>, nullable
- `rootCategoryId`: string, nullable
- `seasonCategoryId`: string, nullable
- `showFilters`: boolean

---


## OmniumProductStatisticsSearchRequest

Search request object for products

**Fields:**

- `customerId`: string, nullable — Customer ID
- `from`: string (date-time), nullable — Date to search from
- `page`: integer (int32) — Page to fetch
- `productIds`: List<`string`>, nullable — Product facets
- `searchText`: string, nullable — Search text
- `take`: integer (int32) — Number of items pr page
- `to`: string (date-time), nullable — Date to search to

---


## OmniumProductSupplier

**Fields:**

- `supplierId`: string, nullable — Supplier ID
- `supplierName`: string, nullable — Name of product supplier
- `supplierSkuId`: string, nullable — External product ID from supplier, used when creating purchase orders

---


## OmniumProductTypeItem

**Fields:**

- `name`: string, nullable
- `productTypeItems`: List<`OmniumInheritablePropertyItem`>, nullable

---


## OmniumProductUnit

Model for additional product units with conversion factor

**Fields:**

- `basePriceUnit`: boolean, nullable — If true, this unit is main unit
- `conversionFactor`: number (decimal) — Conversion factor (number of this unit in main product unit)
- `ean`: string, nullable — Unit EAN / GTIN
- `height`: number (decimal), nullable — Unit height
- `isConsumerUnit`: boolean, nullable — True if unit is a consumer unit
- `isSupplierUnit`: boolean, nullable — True if unit is a supplier unit
- `length`: number (decimal), nullable — Unit length
- `supplierSkuId`: string, nullable — Supplier sku ID
- `unit`: string, nullable — Unit (E.g. lbs, kg, pcs, etc...)
- `unitType`: string, nullable — Unit type (F-pack / D-pack)
- `volume`: number (decimal), nullable — Unit volume in dm2
- `weight`: number (decimal), nullable — Unit weight
- `width`: number (decimal), nullable — Unit width

---
