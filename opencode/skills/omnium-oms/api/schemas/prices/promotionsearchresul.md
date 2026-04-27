# Price, Promotion & Voucher Schemas — OmniumPromotionOmniumSearchResult to SitooDiscountDetail

## OmniumPromotionOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPromotion`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPromotionPatch

Request for adding a promotion

**Fields:**

- `activeFrom`: string (date-time), nullable — Start date of the promotion
- `activeTo`: string (date-time), nullable — End date of the promotion.
- `additionalCoupons`: List<`OmniumPromotionCoupon`>, nullable — Additional coupon codes for the promotion. (Personal coupon codes / single usage coupon codes).
- `alwaysApply`: boolean, nullable — Promotion can be combined also with promotions that have are canBeCombinedWithOtherPromotions = fals
- `canBeCombinedWithOtherPromotions`: boolean, nullable — Promotion can be combined with other promotions on the same orderLine (e.g. 10% off + 5$ off).
- `convertToRegularPriceAt`: string (date-time), nullable — When set, indicates when the promotion price should be automatically converted to a regular price wi
- `couponCode`: string, nullable — Coupon code for the promotion. If not set, the promotion will be applied automatically.
- `customerClubMembersOnly`: boolean, nullable — Promotion is valid only for customers that are members of the customer club.
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable — Promotion is only valid for customers in these customer groups.
- `excludedStoreGroups`: List<`string`>, nullable — Promotion will not apply for carts with stores in these store groups. Exclude takes priority over in
- `excludedStores`: List<`string`>, nullable — Promotion will not apply for carts with these stores. Exclude takes priority over include.
- `filterOnWarehouseStores`: boolean, nullable — Only discount for products sent from chosen stores. (Only applies if stores are set). Default is fal
- `forcePriceUpdate`: boolean, nullable — Force update of all product prices for this promotion, regardless of whether changes are detected. T
- `id`: string, nullable — Unique Id of the promotion, GUID will be generated if not provided.
- `isBonusPointsReward`: boolean, nullable — Is reward given in bonus points instead of discount (CustomerClub and CategoryOrBrand promotions onl
- `marketGroups`: List<`string`>, nullable — Promotion is only valid for carts with these market groups.
- `markets`: List<`string`>, nullable — Promotion is only valid for carts with these markets.
- `name`: string, nullable — Name of the promotion
- `orderTypes`: List<`string`>, nullable — Promotion is valid only for these order types (e.g. online, clickAndCollect, pos).
- `priceFilterMode`: string, nullable — Controls how the promotion filters products based on price type: None (default, no filtering), Exclu
- `priceTypeFilter`: string, nullable — Comma-separated flags indicating which price types to filter: Discounted, MemberPrice, or both (Disc
- `priority`: integer (int32), nullable — Priority of the promotion. Promotions with higher priority will be applied first. 0 is the highest p
- `promotionData`: → `OmniumPromotionTypePatch`
- `promotionTranslations`: List<`OmniumPromotionTranslation`>, nullable — Title and Description translations for different markets.
- `properties`: List<`OmniumPropertyItem`>, nullable — Additional properties / meta data
- `storeGroups`: List<`string`>, nullable — Promotion is only valid for carts with these store groups.
- `stores`: List<`string`>, nullable — Promotion is only valid for carts with these stores.
- `tags`: List<`string`>, nullable — Tag for filtering promotions. E.g. "BlackFriday"
- `title`: string, nullable — Descriptive title of the promotion
- `useDiscountedPriceAsBase`: boolean, nullable — When true, the promotion discount is calculated from the discounted price instead of the original pr

---


## OmniumPromotionPatchUpdateResult

**Fields:**

- `errorCount`: integer (int32)
- `errorMessage`: string, nullable
- `isModified`: boolean
- `notFoundCount`: integer (int32)
- `totalCount`: integer (int32)
- `unchangedCount`: integer (int32)
- `updatedCount`: integer (int32)

---


## OmniumPromotionPercentageStep

**Fields:**

- `amount`: number (decimal)
- `currency`: string, nullable
- `marketId`: string, nullable
- `percentage`: number (decimal)

---


## OmniumPromotionQuantityTier

Represents a quantity-based pricing tier for MultiBuy promotions in the public API.
Enables tiered discounts like "2 for 499 NOK, 3 for 649 NOK, 4 for 799 NOK".

**Fields:**

- `currency`: string, nullable — Currency for this tier (e.g., "NOK", "SEK", "DKK").
- `discountAmount`: number (decimal) — Discount amount per item for this tier. Used when UsePercentage is false and IsFixedPrice is false.
- `fixedPrice`: number (decimal) — Fixed price for this quantity tier. Used when promotion IsFixedPrice is true. Example: For "2 for 49
- `marketId`: string, nullable — Market ID for this tier (e.g., "NO", "SE", "DK").
- `percentage`: number (decimal) — Discount percentage for this tier. Used when UsePercentage is true. Value should be between 0-100 (e
- `quantity`: integer (int32) — The quantity threshold for this tier (e.g., 2, 3, 4). Customers must purchase at least this many ite

---


## OmniumPromotionRequest

Request for adding a promotion

**Fields:**

- `activeFrom`: string (date-time) **required** — Start date of the promotion
- `activeTo`: string (date-time) **required** — End date of the promotion.
- `additionalCoupons`: List<`OmniumPromotionCoupon`>, nullable — Additional coupon codes for the promotion. (Personal coupon codes / single usage coupon codes).
- `alwaysApply`: boolean — Promotion can be combined also with promotions that have are canBeCombinedWithOtherPromotions = fals
- `canBeCombinedWithOtherPromotions`: boolean — Promotion can be combined with other promotions on the same orderLine (e.g. 10% off + 5$ off).
- `convertToRegularPriceAt`: string (date-time), nullable — When set, indicates when the promotion price should be automatically converted to a regular price wi
- `couponCode`: string, nullable — Coupon code for the promotion. If not set, the promotion will be applied automatically.
- `customerClubMembersOnly`: boolean — Promotion is valid only for customers that are members of the customer club.
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable — Promotion is only valid for customers in these customer groups.
- `excludedStoreGroups`: List<`string`>, nullable — Promotion will not apply for carts with stores in these store groups. Exclude takes priority over in
- `excludedStores`: List<`string`>, nullable — Promotion will not apply for carts with these stores. Exclude takes priority over include.
- `filterOnWarehouseStores`: boolean — Only discount for products sent from chosen stores. (Only applies if stores are set). Default is fal
- `id`: string, nullable — Unique Id of the promotion, GUID will be generated if not provided.
- `isBonusPointsReward`: boolean — Is reward given in bonus points instead of discount (CustomerClub and CategoryOrBrand promotions onl
- `marketGroups`: List<`string`>, nullable — Promotion is only valid for carts with these market groups.
- `markets`: List<`string`> **required** — Promotion is only valid for carts with these markets.
- `name`: string, nullable — Name of the promotion
- `orderTypes`: List<`string`>, nullable — Promotion is valid only for these order types (e.g. online, clickAndCollect, pos).
- `priceFilterMode`: string, nullable — Controls how the promotion filters products based on price type: None (default, no filtering), Exclu
- `priceTypeFilter`: string, nullable — Comma-separated flags indicating which price types to filter: Discounted, MemberPrice, or both (Disc
- `priority`: integer (int32) — Priority of the promotion. Promotions with higher priority will be applied first. 0 is the highest p
- `promotionData`: → `OmniumPromotionTypeRequest`
- `promotionTranslations`: List<`OmniumPromotionTranslation`>, nullable — Title and Description translations for different markets.
- `properties`: List<`OmniumPropertyItem`>, nullable — Additional properties / meta data
- `storeGroups`: List<`string`>, nullable — Promotion is only valid for carts with these store groups.
- `stores`: List<`string`>, nullable — Promotion is only valid for carts with these stores.
- `tags`: List<`string`>, nullable — Tag for filtering promotions. E.g. "BlackFriday"
- `title`: string, nullable — Descriptive title of the promotion
- `useDiscountedPriceAsBase`: boolean — When true, the promotion discount is calculated from the discounted price instead of the original pr

---


## OmniumPromotionReward

Reward for a promotion

**Fields:**

- `percentage`: number (decimal) — Percentage for the promotion. Used for giving a percentage discount.
- `percentageSteps`: List<`OmniumPromotionPercentageStep`>, nullable — Percentage steps for the promotion. Used for giving increasing discounts based on the amount spent.
- `promotionAmounts`: List<`OmniumPromotionAmount`>, nullable — Amounts for the promotion. Used for giving a fixed amount discount.
- `usePercentage`: boolean — Use percentage for the promotion. Set to true if the promotion should give a percentage discount. Fa

---


## OmniumPromotionRewardPatch

Reward for a promotion

**Fields:**

- `percentage`: number (decimal), nullable — Percentage for the promotion. Used for giving a percentage discount.
- `percentageSteps`: List<`OmniumPromotionPercentageStep`>, nullable — Percentage steps for the promotion. Used for giving increasing discounts based on the amount spent.
- `promotionAmounts`: List<`OmniumPromotionAmount`>, nullable — Amounts for the promotion. Used for giving a fixed amount discount.
- `usePercentage`: boolean, nullable — Use percentage for the promotion. Set to true if the promotion should give a percentage discount. Fa

---


## OmniumPromotionSearchRequest

Represents a search request for promotions in the system, including filtering by active dates and markets.

**Fields:**

- `activatedBeforeDate`: string (date-time), nullable — Promotions that have started before this date.  Only promotions where {Promotion.ActiveFrom <= activ
- `activeFrom`: string (date-time), nullable — Promotions that will become active after this date.  Only promotions where {Promotion.ActiveFrom >= 
- `activeTo`: string (date-time), nullable — Promotions that will end before this date.  Only promotions where {Promotion.ActiveTo <= activeTo} w
- `endedAfterDate`: string (date-time), nullable — Promotions that will end after this date.  Only promotions where {Promotion.ActiveTo >= endedAfterDa
- `marketIds`: List<`string`>, nullable — List of marketids to filter on
- `modifiedFrom`: string (date-time), nullable — Only return promotions modified on or after this date. Useful for delta queries / polling for change
- `modifiedTo`: string (date-time), nullable — Only return promotions modified on or before this date.
- `page`: integer (int32) — Page number, fallback to 1
- `promotionTypes`: List<`string`>, nullable — List of promotion types to filter on. Valid types: ShippingPromotion, CategoryOrBrandPromotion, Prod
- `take`: integer (int32) — Number of elements, fallback to 10

---


## OmniumPromotionTranslation

**Fields:**

- `description`: string, nullable
- `market`: string, nullable
- `title`: string, nullable

---


## OmniumPromotionType

**Fields:**

- `amountCondition`: List<`OmniumPromotionAmount`>, nullable
- `calculateProductPricesCouponCodeNotApplied`: boolean
- `categoryAndBrandFilter`: → `OmniumCategoryAndBrandFilter`
- `conditionOperator`: → `OmniumConditionOperator`
- `discountedCategories`: List<`OmniumProductCategory`>, nullable
- `discountedProducts`: List<`OmniumPromotionProduct`>, nullable
- `lastPriceUpdate`: string (date-time), nullable
- `minQuantity`: integer (int32), nullable — Minimum total quantity of items required in the order (Only applies if PromotionType is OrderAmountP
- `priceListId`: string, nullable — The Id of the price list to use for this promotion (Only applies if PromotionType is PriceListPromot
- `productSearchRequest`: → `OmniumProductSearchRequest`
- `promotionKitReward`: → `OmniumPromotionKitReward`
- `promotionMultiBuyReward`: → `OmniumPromotionMultiBuyReward`
- `promotionType`: string, nullable
- `reward`: → `OmniumPromotionReward`
- `shippingMethods`: List<`OmniumPromotionSelectedShipmentMethods`>, nullable
- `totalHits`: integer (int64)

---


## OmniumPromotionTypePatch

Promotion type data

**Fields:**

- `amountCondition`: List<`OmniumPromotionAmount`>, nullable — Amount conditions for the promotion (Only applies if PromotionType is ShippingPromotion).
- `categoryAndBrandFilter`: → `OmniumCategoryAndBrandFilter`
- `conditionOperator`: → `OmniumConditionOperator`
- `discountedCategories`: List<`OmniumProductCategory`>, nullable — Discounted categories for Mix and match promotions. E.g buy one item of category A, get one item of 
- `discountedProducts`: List<`OmniumPromotionProduct`>, nullable — Discounted products for Mix and match promotions. E.g buy one item of product or category A, get one
- `minQuantity`: integer (int32), nullable — Minimum total quantity of items required in the order (Only applies if PromotionType is OrderAmountP
- `priceListId`: string, nullable — The Id of the price list to use for this promotion (Only applies if PromotionType is PriceListPromot
- `productSearchRequest`: → `OmniumProductSearchRequest`
- `promotionKitReward`: → `OmniumPromotionKitRewardPatch`
- `promotionMultiBuyReward`: → `OmniumPromotionMultiBuyRewardPatch`
- `promotionType`: → `PromotionType`
- `reward`: → `OmniumPromotionRewardPatch`
- `shippingMethods`: List<`OmniumPromotionSelectedShipmentMethods`>, nullable — Defines the shipping methods that the promotion is valid for (Only applies if PromotionType is Shipp

---


## OmniumPromotionTypeRequest

Promotion type data

**Fields:**

- `amountCondition`: List<`OmniumPromotionAmount`>, nullable — Amount conditions for the promotion (Applies to ShippingPromotion and OrderAmountPromotion). For Shi
- `categoryAndBrandFilter`: → `OmniumCategoryAndBrandFilter`
- `conditionOperator`: → `OmniumConditionOperator`
- `discountedCategories`: List<`OmniumProductCategory`>, nullable — Discounted categories for Mix and match promotions. E.g buy one item of category A, get one item of 
- `discountedProducts`: List<`OmniumPromotionProduct`>, nullable — Discounted products for Mix and match promotions. E.g buy one item of product or category A, get one
- `minQuantity`: integer (int32), nullable — Minimum total quantity of items required in the order (Only applies if PromotionType is OrderAmountP
- `priceListId`: string, nullable — The Id of the price list to use for this promotion (Only applies if PromotionType is PriceListPromot
- `productSearchRequest`: → `OmniumProductSearchRequest`
- `promotionKitReward`: → `OmniumPromotionKitReward`
- `promotionMultiBuyReward`: → `OmniumPromotionMultiBuyReward`
- `promotionType`: → `PromotionType`
- `reward`: → `OmniumPromotionReward`
- `shippingMethods`: List<`OmniumPromotionSelectedShipmentMethods`>, nullable — Defines the shipping methods that the promotion is valid for (Only applies if PromotionType is Shipp

---


## OmniumVoucher

Vouchers

**Fields:**

- `amount`: number (decimal) — The amount the voucher is worth
- `created`: string (date-time), nullable — Created date
- `currency`: string, nullable — Currency of the voucher amount
- `customerId`: string, nullable — Id of customer owning the voucher
- `expiryDate`: string (date-time), nullable — Expiry date of the Voucher
- `externalIds`: List<`OmniumExternalId`>, nullable — External IDs
- `id`: string, nullable — Voucher ID
- `modified`: string (date-time), nullable — Modified date
- `status`: string, nullable — Voucher status [Available, Applied, Redeemed, Expired]
- `voucherNumber`: string, nullable — Voucher number

---


## OmniumVoucherOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumVoucher`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumVoucherOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumVoucher`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumVoucherSearchRequest

**Fields:**

- `customerIds`: List<`string`>, nullable — Search Vouchers by customerIds
- `page`: integer (int32) — Paged search - page
- `sortOrder`: string, nullable — Sort result. Available options [CreatedAscending, CreatedDescending, ModifiedAscending, ModifiedDesc
- `statuses`: List<`string`>, nullable — Search Vouchers by statuses [Available, Applied, Redeemed, Expired]
- `take`: integer (int32) — Paged search - max number of invoices to return

---


## PromotionAdvancedReward

**Fields:**

- `discountUsageLimit`: integer (int32)
- `isAdvancedRewardEnabled`: boolean
- `isDiscountLeastExpensive`: boolean
- `isDiscountMostExpensive`: boolean

---


## PromotionAmount

**Fields:**

- `amount`: number (decimal)
- `currency`: string, nullable
- `marketId`: string, nullable

---


## PromotionFixedPriceReward

**Fields:**

- `fixedPrice`: number (decimal)
- `fixedPriceQuantity`: integer (int32)

---


## PromotionKitComponentGroup

**Fields:**

- `discountedQuantity`: integer (int32)
- `required`: boolean
- `requiredQuantity`: integer (int32), nullable
- `skuIds`: List<`string`>, nullable

---


## PromotionKitReward

**Fields:**

- `promotionKitComponentGroups`: List<`PromotionKitComponentGroup`>, nullable
- `reward`: → `Reward`
- `rewardType`: string, nullable

---


## PromotionMultiBuyReward

**Fields:**

- `conditionalPricing`: → `ConditionalPricingSettings`
- `isFixedPrice`: boolean, nullable
- `isMixAndMatch`: boolean
- `numberOfDiscountedItems`: integer (int32)
- `promotionAdvancedReward`: → `PromotionAdvancedReward`
- `quantityTiers`: List<`PromotionQuantityTier`>, nullable
- `requiredBuyAmount`: integer (int32)
- `reward`: → `Reward`
- `skuIdsForDiscountedProducts`: List<`string`>, nullable
- `useConditionalPricing`: boolean
- `useTieredPricing`: boolean

---


## PromotionPercentageStep

**Fields:**

- `amount`: number (decimal)
- `currency`: string, nullable
- `marketId`: string, nullable
- `percentage`: number (decimal)

---


## PromotionQuantityTier

**Fields:**

- `currency`: string, nullable
- `discountAmount`: number (decimal)
- `fixedPrice`: number (decimal)
- `marketId`: string, nullable
- `percentage`: number (decimal)
- `quantity`: integer (int32)

---


## PromotionType

Defines the type of promotion [ShippingPromotion = 0, CategoryOrBrandPromotion = 1, MultiBuyPromotion = 2, OrderAmountPromotion = 3, KitPromotion = 4, ProductSearchPromotion = 5, PriceListPromotion = 6]

**Enum values:** `['ShippingPromotion', 'CategoryOrBrandPromotion', 'MultiBuyPromotion', 'OrderAmountPromotion', 'KitPromotion', 'ProductSearchPromotion', 'PriceListPromotion']`

---


## SitooDiscountDetail

**Fields:**

- `moneyTotal`: string, nullable
- `moneyTotalNet`: string, nullable
- `moneyTotalVat`: string, nullable
- `voucherCode`: string, nullable

---
