# Price, Promotion & Voucher Schemas — BonusPointsPromotion to OmniumPromotionOmniumResult

## BonusPointsPromotion

**Fields:**

- `points`: number (decimal)
- `promotionId`: string, nullable
- `promotionName`: string, nullable

---


## Discount

**Fields:**

- `alwaysApply`: boolean
- `bundleLineItemId`: string, nullable
- `canBeCombinedWithOtherPromotions`: boolean
- `discountAmount`: number (decimal)
- `discountCode`: string, nullable
- `discountId`: string, nullable
- `discountName`: string, nullable
- `discountSource`: → `DiscountSource`
- `discountType`: → `DiscountType`
- `discountValue`: number (decimal)
- `effectivePriceBySkuId`: object, nullable
- `isBonusPointsReward`: boolean
- `isBundleDiscount`: boolean
- `maxDiscountAmount`: number (decimal)
- `priority`: integer (int32)
- `promotionFixedPriceReward`: → `PromotionFixedPriceReward`
- `promotionKitReward`: → `PromotionKitReward`
- `promotionMultiBuyReward`: → `PromotionMultiBuyReward`
- `rewardType`: → `RewardType`
- `roundingPolicy`: string, nullable
- `skuIds`: List<`string`>, nullable
- `stores`: List<`string`>, nullable
- `tags`: List<`string`>, nullable
- `useDiscountedPriceAsBase`: boolean

---


## DiscountSource

**Enum values:** `['Manual', 'Campaign']`

---


## DiscountType

**Enum values:** `['None', 'LineItem', 'Order', 'Shipping', 'Manual', 'BonusPoints']`

---


## KitPromotionRewardType

Defines the type of reward [Percentage = 0, Fixed amount = 1, Fixed price = 2]

**Enum values:** `['Percentage', 'Amount', 'FixedPrice']`

---


## OmniumAnalyticsPromotion

**Fields:**

- `promotionIds`: List<`string`>, nullable
- `promotionNames`: List<`string`>, nullable

---


## OmniumDiscount

Represents a discount that can be applied to an order, line items, or shipping.
Add discounts to orderForm.discounts for order-level or line-item discounts,
or to shipment.discounts for shipping discounts.

**Fields:**

- `alwaysApply`: boolean — When true, this discount is always applied regardless of CanBeCombinedWithOtherPromotions on other d
- `canBeCombinedWithOtherPromotions`: boolean — When true, this discount can be stacked with other promotions. When false, applying this discount ma
- `discountAmount`: number (decimal) — The calculated discount amount in the order's currency. This is the actual monetary value that will 
- `discountCode`: string, nullable — Coupon or promotion code that triggered this discount. Used for tracking and for customers who enter
- `discountId`: string, nullable — Unique identifier for this discount. Used to track and reference specific discount instances.
- `discountName`: string, nullable — Display name for the discount, shown to customers and in reports. Example: "Summer Sale 20%", "3 for
- `discountSource`: string, nullable — Indicates how the discount was created. Values: "Manual" (added by user/API), "Campaign" (from promo
- `discountType`: string, nullable — Specifies at what level the discount is applied. Values: - "None" (0): No specific type - "LineItem"
- `discountValue`: number (decimal) — The discount value used together with RewardType to calculate the actual discount. - For RewardType 
- `isBonusPointsReward`: boolean — When true, the reward is given as customer club bonus points instead of a price reduction. Only appl
- `maxDiscountAmount`: number (decimal) — Maximum cap for the discount amount. Useful for percentage discounts where you want to limit the max
- `priority`: integer (int32) — Priority determines the order in which discounts are applied when multiple discounts exist. Lower va
- `promotionFixedPriceReward`: → `OmniumPromotionFixedPriceReward`
- `promotionMultiBuyReward`: → `OmniumPromotionMultiBuyReward`
- `rewardType`: string, nullable — Defines how DiscountValue is interpreted and applied. Values: - "None" (0): No reward - "Money" (1):
- `skuIds`: List<`string`>, nullable — List of SKU codes (product variant codes) that this discount applies to. Required for LineItem disco

---


## OmniumDiscountCoupon

Discount Coupon

**Fields:**

- `couponCode`: string, nullable — Coupon Code - Apply to cart to apply the discount
- `externalIds`: List<`OmniumExternalId`>, nullable — External Ids
- `id`: string, nullable — Unique identifier of this coupon
- `promotionId`: string, nullable — PromotionId
- `validFrom`: string (date-time), nullable — Coupon valid from
- `validTo`: string (date-time), nullable — Coupon expiration date

---


## OmniumDiscountRefund

Represents a discount applied to return/refund transactions.

**Fields:**

- `amount`: number (decimal) — Total discount amount (including VAT).
- `amountNet`: number (decimal) — Net discount amount (excluding VAT).
- `amountVat`: number (decimal) — VAT amount on the discount.
- `voucherCode`: string, nullable — Voucher or discount code used for this refund.

---


## OmniumDiscountSale

Represents a discount applied to sales transactions.

**Fields:**

- `amount`: number (decimal) — Total discount amount applied.
- `count`: integer (int32) — Number of times this discount was applied.
- `voucherCode`: string, nullable — Voucher or discount code used (optional).

---


## OmniumPriceList

Represents a price list in the OMS.

**Fields:**

- `costCurrencyCode`: string, nullable — Currency code for the cost price. Defaults to the same as CurrencyCode
- `costCurrencyExchangeRate`: number (decimal), nullable — The exchange rate from cost currency to the currency for the price list. If not given, it will be ca
- `created`: string (date-time), nullable — Created date
- `currencyCode`: string **required** — The currency code for the prices in this price list
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable — List of customer groups eligible for this price list. Limited to a maximum of 250 customer groups.
- `customerIds`: List<`string`>, nullable — List of customer IDs this price list applies to. Limited to a maximum of 250 customer IDs.
- `errors`: List<`OmniumEntityError`>, nullable — Calculated: If something is wrong with the price list
- `externalIds`: List<`OmniumExternalId`>, nullable — Optional external ids on the price list
- `id`: string **required** — Unique identifier for the price list.
- `isActive`: boolean — Calculated: True if the price list is activated.
- `isCustomerClubSpecificPrice`: boolean, nullable — If the prices should be customer specific
- `isExcludingTax`: boolean — If tax should be ignored on the price list
- `isPriceEditable`: boolean — Allow editing the calculated prices which are disabled by default
- `isPromotionsAllowed`: boolean, nullable — True if prices from the price list can be combined with promotions
- `isStoreCostPriceEnabled`: boolean — Enable store cost pricing with separate market/store group dimensions
- `marketGroupId`: string, nullable — Market group ID this price list applies to. All markets in the group will be included. Mutually excl
- `marketId`: string, nullable — Identifier for the market this price list applies to (deprecated - use MarketIds or MarketGroupId in
- `marketIds`: List<`string`>, nullable — List of market IDs this price list applies to. Replaces MarketId for multi-market support. Mutually 
- `modified`: string (date-time), nullable — Calculated: Modified date
- `name`: string **required** — The name of the price list.
- `priceFactor`: number (decimal), nullable — PriceFactor and PurchaseDiscountPercentage is used to calculate 'configurable product prices. PriceF
- `priceListType`: → `OmniumPriceListTypeEnum`
- `priceType`: → `OmniumPriceTypeEnum`
- `promotionId`: string, nullable — Reference to the owning promotion.
- `properties`: List<`OmniumPropertyItem`>, nullable — Optional properties on the price list
- `published`: string (date-time), nullable — Calculated: The time when the price list was activated
- `purchaseDiscountPercentage`: number (decimal) — Only relevant for configurable products when calculating cost price from inputted list price
- `roundingDecimals`: integer (int32), nullable — Number of decimal places to use when calculating unit price.
- `storeCostPriceMarketIds`: List<`string`>, nullable — Market IDs for store cost price dimension
- `storeCostPriceStoreGroupIds`: List<`string`>, nullable — Store group IDs for store cost price dimension
- `storeIds`: List<`string`>, nullable — List of store IDs where this price list is applicable. Limited to a maximum of 1000 store IDs.
- `supplierId`: string, nullable
- `tags`: List<`string`>, nullable — Tags for categorizing/labeling price lists (e.g. "Last Chance", "Clearance"). Downstream systems can
- `taxRate`: number (decimal), nullable — The tax rate for the price list. If not given, the default tax rate for the market will be set.
- `unit`: string, nullable — The unit of measurement for the price list (e.g., "KG", "PCS"). IMPORTANT: Only use this if price li
- `useLatestExchangeRateForCost`: boolean — When enabled, the latest available currency exchange rate is always used to calculate the cost
- `validFrom`: string (date-time), nullable — The start date and time from which the price list is valid.
- `validTo`: string (date-time), nullable — The end date and time until which the price list is valid. If null, the price list does not expire.

---


## OmniumPriceListItem

Represents an individual item in a price list within the OMS

**Fields:**

- `cost`: number (decimal) — The cost price in cost currency
- `costDiscount`: number (decimal) — Cost discount amount
- `costDiscountPercent`: number (decimal) — Calculated: Cost discount as percentage
- `costInPriceListCurrency`: number (decimal) — Calculated: The cost price in the price lists currency
- `created`: string (date-time), nullable — Time the item was created
- `discount`: number (decimal) — The discount for the price list item
- `discountPercent`: number (decimal) — Calculated: The given discount in percentage
- `discountedCost`: number (decimal) — Calculated: Cost after discount
- `discountedPrice`: number (decimal) — Calculated: UnitPrice - Discount
- `id`: string, nullable — Calculated: {PricelistId}_{SkuId}
- `isActive`: boolean, nullable — Calculated: True if the price is activated for the sku. Is set to active when price list is activate
- `name`: string, nullable — Name of the price list item
- `plannedRevenue`: number (decimal), nullable — Planned revenue calculated from PlannedSalesVolume x DiscountedPrice
- `plannedSalesVolume`: number (decimal), nullable — Planned sales volume (units) - primary planning input
- `planningComment`: string, nullable — Optional internal comment for planning context
- `priceListId`: string **required** — The Id of the price list this item is linked to
- `productId`: string, nullable — If skuId is provided, this will be calculated. If not, the priceListItem will apply on product level
- `profit`: number (decimal) — Calculated: UnitPriceExTax - CostInPriceListCurrency
- `profitMargin`: number (decimal) — Calculated: Profit/UnitPriceExTax
- `profitPercent`: number (decimal) — Calculated: Profit/Cost
- `skuId`: string, nullable — Optional: If the price list item should apply on variant level, specify the sku id.
- `storeCostPrice`: number (decimal) — Store cost price in price list currency
- `storeCostPriceAdditionPercent`: number (decimal) — Addition percentage on discounted cost to derive store cost price
- `storeCostPriceMargin`: number (decimal) — Store margin: (DiscountedPrice - StoreCostPrice) / DiscountedPrice * 100
- `storeDiscountedCostPrice`: number (decimal) — Calculated: Store discounted cost price
- `tags`: List<`string`>, nullable — Tags for categorizing/labeling price list items (e.g. "Last Chance", "Clearance"). Downstream system
- `taxRate`: number (decimal), nullable — Optional tax rate override for this item. If null, the price list's tax rate is used. Useful when sp
- `unitPrice`: number (decimal) — The unit price of the item
- `unitPriceBase`: number (decimal) — Calculated: Base unit price before adjustments

---


## OmniumPriceListItemOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPriceListItem`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPriceListItemPatch

Partial update model for a price list item. Only non-null fields will be applied.

**Fields:**

- `cost`: number (decimal), nullable — The cost price in cost currency
- `costDiscount`: number (decimal), nullable — Cost discount amount
- `discount`: number (decimal), nullable — The discount for the price list item
- `id`: string, nullable — The Id of the price list item to patch. Format: {PriceListId}_{SkuId} or {PriceListId}_{ProductId}. 
- `name`: string, nullable — Name of the price list item
- `plannedRevenue`: number (decimal), nullable — Planned revenue calculated from PlannedSalesVolume x DiscountedPrice
- `plannedSalesVolume`: number (decimal), nullable — Planned sales volume (units) - primary planning input
- `planningComment`: string, nullable — Optional internal comment for planning context
- `priceListId`: string, nullable — The price list this item belongs to. Used together with SkuId or ProductId to derive the Id when Id 
- `productId`: string, nullable — The product identifier. Used together with PriceListId to derive the Id when Id is not set. SkuId ta
- `skuId`: string, nullable — The SKU identifier. Used together with PriceListId to derive the Id when Id is not set.
- `storeCostPrice`: number (decimal), nullable — Store cost price in price list currency. Bidirectional with StoreCostPriceAdditionPercent — if one i
- `storeCostPriceAdditionPercent`: number (decimal), nullable — Addition percentage on discounted cost to derive store cost price. Bidirectional with StoreCostPrice
- `tags`: List<`string`>, nullable — Tags for categorizing/labeling price list items (e.g. "Last Chance", "Clearance").
- `taxRate`: number (decimal), nullable — Optional tax rate override for this item. If null, the price list's tax rate is used. Set to a value
- `unitPrice`: number (decimal), nullable — The unit price of the item

---


## OmniumPriceListItemPatchUpdateResult

**Fields:**

- `createdCount`: integer (int32)
- `errorCount`: integer (int32)
- `errorMessage`: string, nullable
- `isModified`: boolean
- `notFoundCount`: integer (int32)
- `notFoundIds`: List<`string`>, nullable
- `totalCount`: integer (int32)
- `unchangedCount`: integer (int32)
- `updatedCount`: integer (int32)

---


## OmniumPriceListItemSearchRequest

Price list item search request.

**Fields:**

- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take]).
- `priceListId`: string, nullable — Price list ID
- `priceListIds`: List<`string`>, nullable — Price list IDs
- `scrollSize`: integer (int32), nullable — Optional: The number of items returned for each scroll request. Default value is 1000. Max is 20000 
- `searchText`: string, nullable — Free text search
- `sortOrder`: string, nullable — Sort order for the results. Defaults to created date descending. Possible values: CreatedAscending,
- `take`: integer (int32) — Number of items to take.

---


## OmniumPriceListOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPriceList`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPriceListSearchRequest

Price list search request

**Fields:**

- `currencyCodes`: List<`string`>, nullable — Currency filter
- `includeEmptyMarketId`: boolean — If true, price lists with empty market IDs are returned
- `includeEmptyStoreIds`: boolean — If true, price lists with empty store IDs are returned
- `isActive`: boolean, nullable — If true, only active price lists are returned.
- `marketGroupIds`: List<`string`>, nullable — Market group filter
- `marketIds`: List<`string`>, nullable — Market filter
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take]).
- `searchText`: string, nullable — Free text search
- `sortOrder`: string, nullable — Sort order for the results. Defaults to created date descending. Possible values: CreatedAscending, 
- `storeIds`: List<`string`>, nullable — Store ID filter
- `supplierIds`: List<`string`>, nullable — Supplier filter
- `take`: integer (int32) — Number of items to take.

---


## OmniumPriceListTypeEnum

The price list can be used to populate only prices, only cost prices or both. The default value is Price.

**Enum values:** `['Price', 'CostPrice', 'PriceAndCostPrice']`

---


## OmniumPromotion

**Fields:**

- `activeFrom`: string (date-time)
- `activeTo`: string (date-time)
- `additionalCoupons`: List<`OmniumPromotionCoupon`>, nullable
- `alwaysApply`: boolean
- `canBeCombinedWithOtherPromotions`: boolean
- `convertToRegularPriceAt`: string (date-time), nullable — When set, indicates when the promotion price should be automatically converted to a regular price wi
- `convertedToRegularPriceAt`: string (date-time), nullable — When the conversion to regular price was executed.
- `couponCode`: string, nullable
- `createdDate`: string (date-time), nullable
- `customerClubMembersOnly`: boolean
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable
- `deactivated`: boolean
- `description`: string, nullable
- `excludedStoreGroups`: List<`string`>, nullable
- `excludedStores`: List<`string`>, nullable
- `filterOnWarehouseStores`: boolean
- `id`: string, nullable
- `indexIdentifier`: string, nullable
- `isConvertedToRegularPrice`: boolean — Whether this promotion has been converted to a regular price with Last Chance flag.
- `marketGroups`: List<`string`>, nullable
- `markets`: List<`string`>, nullable
- `name`: string, nullable
- `orderTypes`: List<`string`>, nullable
- `priceFilterMode`: string, nullable — Controls how the promotion filters products based on price type: None (default, no filtering), Exclu
- `priceTypeFilter`: string, nullable — Comma-separated flags indicating which price types to filter: Discounted, MemberPrice, or both (Disc
- `priority`: integer (int32)
- `promotionData`: → `OmniumPromotionType`
- `promotionService`: string, nullable
- `promotionTranslations`: List<`OmniumPromotionTranslation`>, nullable
- `properties`: List<`OmniumPropertyItem`>, nullable
- `storeGroups`: List<`string`>, nullable
- `stores`: List<`string`>, nullable
- `tags`: List<`string`>, nullable
- `tenantId`: string, nullable
- `title`: string, nullable
- `updatedDate`: string (date-time), nullable
- `useDiscountedPriceAsBase`: boolean — When true, the promotion discount is calculated from the discounted price instead of the original pr

---


## OmniumPromotionAdvancedReward

**Fields:**

- `discountUsageLimit`: integer (int32) — Number of times this discount can be applied on a cart. 0 is unlimited
- `isAdvancedRewardEnabled`: boolean — Is advanced reward settings enabled
- `isDiscountLeastExpensive`: boolean — Used on Multibuy if the least expensive product should be the one that will be discounted
- `isDiscountMostExpensive`: boolean — Used on Multibuy if the most expensive product should be the one that will be discounted

---


## OmniumPromotionAmount

**Fields:**

- `amount`: number (decimal)
- `currency`: string, nullable
- `marketId`: string, nullable

---


## OmniumPromotionCoupon

Represents a coupon for a promotion

**Fields:**

- `canOnlyBeUsedOnce`: boolean — Set to true if the coupon is only valid for a single use
- `couponCode`: string, nullable — Customer coupon code
- `used`: boolean — Set to true if the coupon is already used

---


## OmniumPromotionFixedPriceReward

Configuration for fixed price promotions (e.g., "4 items for 99.90").
Used when the discount's RewardType is "FixedPrice".
The promotion calculator will prioritize items from highest to lowest price.
Example: FixedPriceQuantity=4, FixedPricePrice=99.90 means "Buy any 4 items from the promotion for 99.90 total"

**Fields:**

- `fixedPricePrice`: number (decimal) — The total price for the bundle of items. Example: For "4 items for 99", set this to 99. The discount
- `fixedPriceQuantity`: integer (int32) — The number of items required to qualify for the fixed price. Example: For "4 items for 99", set this

---


## OmniumPromotionKitComponentGroup

**Fields:**

- `categoryAndBrandFilter`: → `OmniumCategoryAndBrandFilter`
- `discountedQuantity`: integer (int32) — Number of items from this component group that can be discounted in the kit (0 == discount all items
- `required`: boolean — Is this component group required to be present in the kit?
- `requiredQuantity`: integer (int32), nullable — Required quantity of items from this component group in the kit. (null == 1 or more).

---


## OmniumPromotionKitReward

Reward model for promotion kits (i.e., “Buy a one of each component and get a discount on the kit”).

**Fields:**

- `promotionKitComponentGroups`: List<`OmniumPromotionKitComponentGroup`>, nullable — Component groups that make up the kit.
- `rewardType`: → `KitPromotionRewardType`

---


## OmniumPromotionKitRewardPatch

Reward patch model for kit promotions.

**Fields:**

- `rewardType`: → `KitPromotionRewardType`

---


## OmniumPromotionMultiBuyReward

Configuration for multi-buy promotions (e.g., "Buy 2, get 1 free" / "3 for 2").
Used when the discount's RewardType is "MultiBuys".
By default, the calculator prioritizes items from lowest to highest price (cheapest item is discounted).
This can be changed with the SortMultibuyItemsDescending setting.
Example "3 for 2": RequiredBuyAmount=2, NumberOfDiscountedItems=1, Percentage=100

**Fields:**

- `conditionalPricing`: → `OmniumConditionalPricingSettings`
- `isFixedPrice`: boolean, nullable — Set to true for fixed price promotions (e.g., "3 for $99"). When true, use PromotionAmounts to speci
- `numberOfDiscountedItems`: integer (int32) — Number of additional items that receive the discount when RequiredBuyAmount is met. Example "3 for 2
- `percentage`: number (decimal) — The percentage discount applied to the discounted items (0-100). Set to 100 for "free" items. Set to
- `promotionAdvancedReward`: → `OmniumPromotionAdvancedReward`
- `promotionAmounts`: List<`OmniumPromotionAmount`>, nullable — Amounts for the promotion. Used for giving a fixed amount or fixed price discount.
- `quantityTiers`: List<`OmniumPromotionQuantityTier`>, nullable — List of quantity-based tiers. Each tier defines a quantity threshold and its associated pricing. Tie
- `requiredBuyAmount`: integer (int32) — Number of items the customer must buy at full price to qualify for the discount. Example "3 for 2": 
- `useConditionalPricing`: boolean — Enable conditional pricing behavior where promotional prices are only shown when condition is met
- `usePercentage`: boolean — Use percentage for the promotion. Set to true if the promotion should give a percentage discount. Fa
- `useTieredPricing`: boolean — Enable quantity-based tiered pricing. When true, use QuantityTiers instead of single-tier settings. 

---


## OmniumPromotionMultiBuyRewardPatch

Reward model for multi-buy promotions (i.e., "2 for the price of 1"). Only used if reward type is "MultiBuys".

**Fields:**

- `isFixedPrice`: boolean, nullable — Set to true for fixed price promotions (e.g., "3 for $99"). When true, use PromotionAmounts to speci
- `numberOfDiscountedItems`: integer (int32), nullable — Number of discounted items if required buy amount is fulfilled
- `percentage`: number (decimal), nullable — Percentage discount (0-100) when UsePercentage is true. Not used when IsFixedPrice is true (use Prom
- `promotionAmounts`: List<`OmniumPromotionAmount`>, nullable — Amounts for the promotion. Used for giving a fixed amount discount.
- `requiredBuyAmount`: integer (int32), nullable — Required amount of items to buy to get a discount on additional items
- `usePercentage`: boolean, nullable — Use percentage for the promotion. Set to true if the promotion should give a percentage discount. Fa

---


## OmniumPromotionOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPromotion`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---
