# Product Schemas — OmniumProductUpdateResult to SitooProductGroupDetail

## OmniumProductUpdateResult

**Fields:**

- `errorCount`: integer (int32)
- `errorMessage`: string, nullable
- `isModified`: boolean
- `notFoundCount`: integer (int32)
- `notFoundIds`: List<`string`>, nullable
- `totalCount`: integer (int32)
- `unchangedCount`: integer (int32)
- `updatedCount`: integer (int32)

---


## OmniumProductVariant

Product variant

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
- `isMainProductVariant`: boolean — If true, this variant should represent the product in flattened variant lists. This can also be used
- `isNotRatable`: boolean, nullable — Set to true if this product should be excluded from rating emails/forms
- `isPackage`: boolean — True if product is package of other products (unlike bundle, price is specified for package)
- `isSerializableProduct`: boolean — If true, the product is serializable, and order line should contain serial number when completed
- `isSku`: boolean
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
- `skuId`: string, nullable — Product unique SKU (but equal for all language versions).
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
- `warehouseInventories`: List<`OmniumWarehouseInventory`>, nullable — Warehouse inventories Obsolete - Use Inventory api endpoint instead
- `weight`: number (double), nullable — Product weight in kilograms (kg)

---


## OmniumProductVariantOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProductVariant`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProductsAndVariantsUpdateResult

Result for path update of product and variants

**Fields:**

- `productUpdateResultTotal`: → `OmniumProductUpdateResult`
- `variantUpdateResultTotal`: → `OmniumProductUpdateResult`

---


## OmniumProjectProductReference

Used for listing products associated to a project

**Fields:**

- `name`: string, nullable — Product name
- `orderType`: string, nullable — Order type the product is related to
- `productId`: string, nullable — Product Id
- `quantity`: number (decimal) — Number of products
- `referenceType`: string, nullable — Reference type (available reference types are defined on project type)
- `skuId`: string, nullable — Product SkuId

---


## OmniumPromotionProduct

**Fields:**

- `brand`: string, nullable
- `isSku`: boolean
- `parentId`: string, nullable
- `productId`: string, nullable
- `productName`: string, nullable

---


## OmniumRecommendationsResult

**Fields:**

- `recommendations`: List<`OmniumProductListItemViewModelRecommendation`>, nullable

---


## OmniumRelatedProduct

Representing a collection of related product items by a given key. A key could be "Siblings", "Accessories", etc

**Fields:**

- `key`: string, nullable — Key describing relation. E.g. "Siblings", "Accessories", etc...
- `relatedProductItems`: List<`OmniumRelatedProductItem`>, nullable — Products related
- `translateKey`: string, nullable — TranslateKey used for translation in UI (but could of course also be used in your application)

---


## OmniumRelatedProductItem

**Fields:**

- `description`: string, nullable — Product description
- `name`: string, nullable — Product name
- `productId`: string, nullable — Product ID
- `skuId`: string, nullable — Sku ID

---


## OmniumSearchRecommendationsRequest

**Fields:**

- `boostedProperties`: List<`OmniumPropertyItem`>, nullable
- `cartId`: string, nullable
- `customerId`: string, nullable
- `excludedProperties`: List<`OmniumPropertyItem`>, nullable
- `includedProperties`: List<`OmniumPropertyItem`>, nullable
- `productIds`: List<`string`>, nullable
- `skuIds`: List<`string`>, nullable
- `storeIds`: List<`string`>, nullable

---


## OmniumVariantPatch

SkuId is required. If not set, the patch request will be skipped

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
- `location`: string, nullable — The location of the product in the warehouse.
- `mainImageUrl`: string, nullable — Product image url
- `marketGroupIds`: List<`string`>, nullable — List of available market group IDs
- `marketIds`: List<`string`>, nullable — List of available market IDs
- `maxQuantity`: number (decimal), nullable — Max inventory quantity (what should be in stock after new supply)
- `minQuantity`: number (decimal), nullable — Minimum inventory quantity (point of reordering)
- `name`: string, nullable — Product name
- `prices`: List<`OmniumPrice`>, nullable — List of all product prices - all currencies, campaigns, customer prices etc
- `productId`: string, nullable — Product ID
- `productOptions`: List<`OmniumProductOption`>, nullable — Available product options for the product
- `productType`: string, nullable — Type of product
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties. Key value pairs with any non strongly typed properties.
- `propertiesRemovalConditions`: List<`OmniumPropertyItem`>, nullable — Specifies conditions for removing existing properties before proceeding with the patch operation. Ea
- `published`: string (date-time), nullable — Date product is published
- `relatedProducts`: List<`OmniumRelatedProduct`>, nullable — Related products
- `salesStartDate`: string (date-time), nullable — Embargo date: product cannot be sold before this date
- `season`: string, nullable — Product season
- `seoInfo`: → `OmniumSeoInfo`
- `shortDescription`: string, nullable — Short product description
- `size`: string, nullable — Product size
- `sizeType`: string, nullable — Product size type
- `skuId`: string, nullable — Product unique ID
- `sortIndexBoost`: integer (int32), nullable — Sort index set by API / GUI
- `specification`: string, nullable — Product Specification
- `stopPublished`: string (date-time), nullable — Product activation end date. Can be null
- `storeIds`: List<`string`>, nullable — List of available store IDs
- `supplierColor`: string, nullable — Color from supplier
- `supplierId`: string, nullable — Main supplier ID
- `supplierName`: string, nullable — Name of main product supplier
- `supplierPackagingQuantity`: number (decimal), nullable — Supplier packaging quantity
- `supplierPackagingUnit`: string, nullable — Supplier packaging quantity
- `supplierSkuId`: string, nullable — External product ID from supplier, used when creating purchase orders
- `tags`: List<`string`>, nullable — List of tag IDs
- `taxCategory`: string, nullable — Product tax category
- `unit`: string, nullable — Product unit, used for describing what unit the quantities are in
- `units`: List<`OmniumProductUnit`>, nullable — List of additional units
- `weight`: number (double), nullable — Product weight

---


## ProductComponent

**Fields:**

- `componentId`: string, nullable
- `componentName`: string, nullable
- `id`: string, nullable
- `isRequired`: boolean
- `options`: List<`ComponentOption`>, nullable
- `productId`: string, nullable
- `quantity`: number (decimal)
- `skuId`: string, nullable

---


## SitooProductGroupDetail

**Fields:**

- `moneyTotal`: string, nullable
- `moneyTotalNet`: string, nullable
- `moneyTotalVat`: string, nullable
- `name`: string, nullable
- `numTotal`: integer (int32)
- `vatValue`: number (decimal)

---
