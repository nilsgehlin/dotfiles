# Order Schemas — OmniumOrderFormPatch to OmniumOrderPatchUpdateResult

## OmniumOrderFormPatch

Order form, containing shipments, payments and line items for order

**Fields:**

- `authorizedPaymentTotal`: number (decimal), nullable — Total amount authorized by payment providers
- `capturedPaymentTotal`: number (decimal), nullable — Total amount captured by payment providers
- `cartId`: string, nullable — ID of original cart
- `cartName`: string, nullable — Name of cart / offer
- `chargeShipmentCostAmount`: number (decimal), nullable — Patch amount for shipment cost charged the customer
- `charges`: List<`OmniumCharge`>, nullable — A list of additional charges for the order
- `couponCodes`: List<`string`>, nullable — List of CouponCodes added by user
- `creditShipmentAmount`: number (decimal), nullable — Patch amount for shipment cost to credit customer
- `discountAmount`: number (decimal), nullable — Total discount amount
- `discounts`: List<`OmniumDiscount`>, nullable — All discounts
- `fullRefund`: boolean, nullable — True if order should be fully refunded
- `handlingTotal`: number (decimal), nullable — Cost of handling
- `isPriority`: boolean, nullable — Possible to mark the order with priority
- `lineItems`: List<`OmniumOrderLinePatch`>, nullable — All order lines / products
- `orderLevelTax`: number (decimal), nullable — Order level tax amount
- `payments`: List<`OmniumPaymentPatch`>, nullable — All order payments
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `shipments`: List<`OmniumShipmentPatch`>, nullable — All order shipments
- `shippingDiscountTotal`: number (decimal), nullable — Total shipping discounts
- `shippingSubTotal`: number (decimal), nullable — Shipping cost without discounts
- `shippingSubTotalExclTax`: number (decimal), nullable — shipping cost without discounts excl tax
- `shippingTotal`: number (decimal), nullable — Total shipping cost
- `subTotal`: number (decimal), nullable — Ordrer total without shipment cost
- `subTotalExclTax`: number (decimal), nullable — Ordrer total without shipment cost and without tax
- `taxTotal`: number (decimal), nullable — Total tax amount (line item level and order level)
- `total`: number (decimal), nullable — Order total, including shipment cost, tax, and discounts
- `totalExclTax`: number (decimal), nullable — Order total, including shipment cost and discounts, but without tax

---


## OmniumOrderGroup

Used for grouping order lines

**Fields:**

- `description`: string, nullable — Order group description
- `id`: string, nullable — Order group ID
- `name`: string, nullable — Order group name

---


## OmniumOrderLine

Order line

**Fields:**

- `alternativeProductName`: string, nullable — Additional or alternative product name
- `brand`: string, nullable — Enriched by product data - name of brand
- `campaignId`: string, nullable — Optional campaign id
- `cancelComment`: string, nullable — Comment regarding cancellation
- `cancelReason`: string, nullable — Reason / type of order line cancellation
- `canceledDate`: string (date-time), nullable
- `canceledQuantity`: number (decimal) — Number of items cancelled
- `code`: string, nullable — SKU
- `color`: string, nullable — Enriched by product data - name of color
- `comment`: string, nullable — Order line comment
- `components`: List<`OmniumProductComponent`>, nullable — Used for specification of package products
- `cost`: number (decimal) — Enriched from product data: Item cost
- `costTotal`: number (decimal) — Calculated - Total cost for all items
- `createPurchaseOrder`: boolean, nullable — If true, purchase order should be created from order line
- `creditedAmount`: number (decimal) — Calculated - credited amount for order line
- `customerPickupDeadline`: string (date-time), nullable — Deadline for when the customer needs to pick up the order line (Used for partial deliveries)
- `deliveredDate`: string (date-time), nullable — Date of orderline delivery
- `deliveredQuantity`: number (decimal) — Number of items delivered
- `discountReasonCode`: string, nullable — Reason code for manual discount applied to this order line (audit trail).
- `discounted`: number (decimal) — Total line item discount
- `discountedExclTax`: number (decimal) — Total line item discount without tax
- `discountedPrice`: number (decimal) — Calculated - Total line item price with all item discounts applied. Without order discounts.
- `discountedPriceExclTax`: number (decimal) — Calculated - Total line item price with all item discounts applied. Without order discounts. Without
- `displayName`: string, nullable — Product display name
- `ean`: string, nullable — Product EAN / GTIN number
- `expectedDeliveryDate`: string (date-time), nullable — Expected delivery date for order line
- `extendedPrice`: number (decimal) — Calculated - Total line item price with all discounts applied, including item and order level discou
- `extendedPriceExclTax`: number (decimal) — Calculated - Total line item price with all discounts applied, including item and order level discou
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external order line IDs
- `groupId`: string, nullable — Order line group ID (should correspond to ID on order.groups)
- `gtins`: List<`string`>, nullable — GTIN numbers
- `imageUrl`: string, nullable — Enriched by product data: Product image URL
- `internalWarehouseLocation`: string, nullable — Date of orderline delivery
- `isAwaitingPurchaseOrder`: boolean, nullable — If true, order line is reserved on an incoming purchase order. Order lines with this flag will not b
- `isBackorder`: boolean — Product on order line can be back-ordered
- `isBundle`: boolean — If true, product is a bundle with components. Prices are unchanged on broken down components and sho
- `isConfigurableProduct`: boolean — Indicates whether the order line represents a configurable product. This value is set when a configu
- `isExcludedFromPromotions`: boolean, nullable — If true promotion prices are not recalculated for this order line.
- `isGift`: boolean — If item should be sent as a gift
- `isPackage`: boolean — (OBSOLETE: Use 'IsPackageProduct' or 'IsPackageBrokeDown' instead) If true, product is a package wit
- `isPackageBrokeDown`: boolean — If true, package/bundle breakdown is skipped
- `isPackageProduct`: boolean — If true, product is a package with components. Packages have their own 'package' price (price requir
- `isReadOnly`: boolean — Mark the order line as read only.
- `isReadOnlyByCustomer`: boolean — Mark the order line as read only for the customer. Typically used for carts where there should be or
- `isSerializableProduct`: boolean, nullable — Indicates whether the product requires a serial number
- `isSkuAccessory`: boolean, nullable — Indicates whether the order line represents a product option/accessory that is attached to another l
- `isVirtualProduct`: boolean — Indicates whether the product on the order line is a virtual product. Virtual products, such as gift
- `lineItemDiscountAmount`: number (decimal) — (OBSOLETE: Use property on Discounted instead) Calculated - Total line item discount.
- `lineItemDiscountAmountExclTax`: number (decimal) — (OBSOLETE: Use property on DiscountedPriceExclTax instead) Calculated - Total line item discount exc
- `lineItemId`: string, nullable — Line item ID / Order Line ID - REQUIRED
- `modifiedReason`: string, nullable — Reason for order line modification
- `orderDiscountAmount`: number (decimal) — Calculated - This order line's share of the order level discounts
- `orderLineBonusPoints`: → `OmniumOrderLineBonusPoints`
- `orderLineDiscounts`: List<`OmniumOrderLineDiscount`>, nullable — Discounts valid for this order line
- `originalExtendedPricePerUnit`: number (decimal), nullable — Calculated - Original extended price per unit before cancellation, used for credit calculations when
- `packageLineItemId`: string, nullable — Package line item ID (used if product is part of package)
- `packageSkuId`: string, nullable — Package sku ID / Code (used if product is part of package)
- `placedPrice`: number (decimal) — The price for one item, without discounts, i.e. list price
- `placedPriceExclTax`: number (decimal) — Calculated - The price for one item, without discounts, i.e. list price, without tax
- `priceListId`: string, nullable — Calculated - Reference to connected price list. Used in the context of 'PriceFactor'
- `priceListItemId`: string, nullable — Calculated - Reference to connected price list item. Used in the context of 'PriceFactor'
- `productId`: string, nullable — Enriched by product data: Product ID
- `productType`: string, nullable — Product type
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `quantity`: number (decimal) — Number of ordered items
- `readyForPickupDate`: string (date-time), nullable — Date orderLine is ready for pick up
- `readyForPickupQuantity`: number (decimal), nullable — Number of items ready for pick up
- `replacedDate`: string (date-time), nullable — Replaced date (if a replacement order has been created)
- `replacedQuantity`: number (decimal), nullable — Number of items replaced (if a replacement order has been created)
- `replacementReason`: string, nullable — Reason for replacement
- `replacementType`: string, nullable — Type of replacement (should correspond to preconfigured list of replacement types)
- `requestedDeliveryDate`: string (date-time), nullable — Requested delivery date for the orderline
- `reservedInventory`: boolean — Calculated: True if inventory is reserved
- `reservedInventoryDeliveryId`: string, nullable — Calculated: Reservation delivery ID
- `reservedInventoryPurchaseOrderId`: string, nullable — Calculated: Reserved inventory purchase order ID
- `reservedInventoryPurchaseOrderLineId`: string, nullable — Calculated: Reserved purchase order line ID
- `reservedInventoryQuantity`: number (decimal) — Calculated: Reserved inventory
- `returnDate`: string (date-time), nullable — Date returned
- `returnQuantity`: number (decimal) — Number of items returned
- `returnReason`: string, nullable — Return reason comment
- `returnType`: string, nullable — Return type ID (should correspond to preconfigured list of return types)
- `selectedUnit`: string, nullable — The selected unit of measurement on order line if product is sold in multiple units (Null if sold un
- `selectedUnitConversionFactor`: number (decimal), nullable — Conversion factor from default unit to selected unit
- `selectedUnitQuantity`: number (decimal), nullable — The quantity ordered in the selected unit of measurement.
- `serialNumber`: string, nullable — Serial number for order line
- `size`: string, nullable — Enriched by product data - item size
- `storePickDate`: string (date-time), nullable — Deadline for when the store needs to pick the order line (Used for partial deliveries)
- `suggestedRetailPrice`: number (decimal) — Suggested retail price. Not used in any calculations. Only used for reports or statistics by third p
- `suggestedRetailPriceExclTax`: number (decimal) — Suggested retail price without tax. Not used in any calculations. Only used for reports or statistic
- `supplierId`: string, nullable — Supplier ID
- `supplierName`: string, nullable — Supplier name
- `supplierSkuId`: string, nullable — Supplier Sku ID
- `taxRate`: number (decimal), nullable — Tax rate in percent. If tax is 25%, value here should be 25.00. If not set(null) tax from market wil
- `taxTotal`: number (decimal) — Calculated - Total tax for order line
- `unit`: string, nullable — Quantity unit - e.g. Meter,Pcs,Litre, etc
- `updateStock`: boolean — Used by order return. If we should increase stock
- `webSiteProductUrl`: string, nullable — Public website URL to product

---


## OmniumOrderLineBonusPoints

Bonus point information for one order line

**Fields:**

- `earnedPoints`: number (decimal) — Points after the order is processed
- `newPointsOnHold`: number (decimal) — Points that will be valid when order is processed

---


## OmniumOrderLineDiscount

Represents a discount applied specifically to an order line item.
This is used when retrieving orders to show which discounts were applied to each line item.
For line-item discounts from FixedPrice or MultiBuys promotions, the discount amounts are distributed across the involved order lines.

**Fields:**

- `alwaysApply`: boolean — When true, this discount is always applied regardless of CanBeCombinedWithOtherPromotions on other d
- `canBeCombinedWithOtherPromotions`: boolean — When true, this discount can be stacked with other promotions. When false, applying this discount ma
- `discountAmount`: number (decimal) — The calculated discount amount in the order's currency. This is the actual monetary value that will 
- `discountAmountPrItem`: number (decimal) — The discount amount per single item/unit on this order line. Total line discount = DiscountAmountPrI
- `discountCode`: string, nullable — Coupon or promotion code that triggered this discount. Used for tracking and for customers who enter
- `discountId`: string, nullable — Unique identifier for this discount. Used to track and reference specific discount instances.
- `discountName`: string, nullable — Display name for the discount, shown to customers and in reports. Example: "Summer Sale 20%", "3 for
- `discountSource`: string, nullable — Indicates how the discount was created. Values: "Manual" (added by user/API), "Campaign" (from promo
- `discountValue`: number (decimal) — The discount value used together with RewardType to calculate the actual discount. - For RewardType 
- `isBonusPointsReward`: boolean — When true, the reward is given as customer club bonus points instead of a price reduction. Only appl
- `maxDiscountAmount`: number (decimal) — Maximum cap for the discount amount. Useful for percentage discounts where you want to limit the max
- `priority`: integer (int32) — Priority determines the order in which discounts are applied when multiple discounts exist. Lower va
- `promotionFixedPriceReward`: → `OmniumPromotionFixedPriceReward`
- `promotionMultiBuyReward`: → `OmniumPromotionMultiBuyReward`
- `rewardType`: string, nullable — Defines how DiscountValue is interpreted and applied. Values: - "None" (0): No reward - "Money" (1):

---


## OmniumOrderLineIdRequest

Request object for order ID and corresponding line items

**Fields:**

- `lineItemIds`: List<`string`>, nullable — List of line item IDs
- `orderId`: string, nullable — Order ID

---


## OmniumOrderLinePatch

Order line patch

**Fields:**

- `alternativeProductName`: string, nullable — Additional or alternative product name
- `brand`: string, nullable — Brand name
- `campaignId`: string, nullable — Optional campaign id
- `cancelComment`: string, nullable — Comment regarding cancellation
- `cancelReason`: string, nullable — Reason / type of order line cancellation
- `canceledDate`: string (date-time), nullable — Date of cancellation
- `canceledQuantity`: number (decimal), nullable — Number of items cancelled
- `code`: string, nullable — Product / SKU number
- `color`: string, nullable — Item color
- `comment`: string, nullable — Order line comment
- `cost`: number (decimal), nullable — Item cost
- `costTotal`: number (decimal), nullable — Total cost for all items
- `creditedAmount`: number (decimal), nullable — Line item credited amount
- `customerPickupDeadline`: string (date-time), nullable — Deadline for when the customer needs to pick up the order line (Used for partial deliveries)
- `deliveredDate`: string (date-time), nullable — DateTime of delivery of lineItem
- `deliveredQuantity`: number (decimal), nullable — Number of items delivered
- `discountReasonCode`: string, nullable — Reason code for manual discount applied to this order line (audit trail).
- `discounted`: number (decimal), nullable — Total line item discount
- `discountedExclTax`: number (decimal), nullable — Total line item discount without tax
- `discountedPrice`: number (decimal), nullable — Calculated - Total line item price with all item discounts applied. Without order disounts.
- `discountedPriceExclTax`: number (decimal), nullable — Calculated - Total line item price with all item discounts applied. Without order disounts. Without 
- `displayName`: string, nullable — Product display name
- `ean`: string, nullable — Product EAN / GTIN number
- `expectedDeliveryDate`: string (date-time), nullable — Expected delivery date for order line
- `extendedPrice`: number (decimal), nullable — Calculated - Total line item price with all discounts applied, including item and order level discou
- `extendedPriceExclTax`: number (decimal), nullable — Calculated - Total line item price with all discounts applied, including item and order level discou
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external order line IDs
- `gtins`: List<`string`>, nullable — Product GTIN number
- `imageUrl`: string, nullable — Product image URL
- `internalWarehouseLocation`: string, nullable — For return: Use this to specify the warehouseLocation within a warehouse, Example Broken/Used/SellAs
- `isAwaitingPurchaseOrder`: boolean, nullable — If true, order line is reserved on an incoming purchase order
- `isConfigurableProduct`: boolean — Indicates whether the order line represents a configurable product. This value is set when a configu
- `isGift`: boolean, nullable — If item should be sent as a gift
- `isPackage`: boolean, nullable — If true, product is a product with components
- `isReadOnly`: boolean, nullable — Is order line read only for customer
- `isSerializableProduct`: boolean, nullable — Indicates whether the product requires a serial number
- `isSkuAccessory`: boolean, nullable — Indicates whether the order line represents a product option/accessory that is attached to another l
- `isVirtualProduct`: boolean, nullable — Indicates whether the product on the order line is a virtual product. Virtual products, such as gift
- `keepExistingCustomProperties`: boolean, nullable — Set to 'false' if you want to update the whole 'properties' list. If true, new properties will be ad
- `lineItemId`: string, nullable — Line item ID
- `orderDiscountAmount`: number (decimal), nullable — Calculated - This orderlines share of the order level discounts
- `orderLineBonusPoints`: → `OmniumOrderLineBonusPoints`
- `orderLineDiscounts`: List<`OmniumOrderLineDiscount`>, nullable — Discounts valid for this orderline
- `packageLineItemId`: string, nullable — Package line item ID (used if product is part of package)
- `packageSkuId`: string, nullable — Package sku ID / Code (used if product is part of package)
- `placedPrice`: number (decimal), nullable — The price for one item, without discounts, i.e. list price
- `placedPriceExclTax`: number (decimal), nullable — The price for one item, without discounts, i.e. list price, without tax
- `priceListId`: string, nullable — Calculated - Reference to connected price list. Used in the context of 'PriceFactor'
- `priceListItemId`: string, nullable — Calculated - Reference to connected price list item. Used in the context of 'PriceFactor'
- `productId`: string, nullable — Product ID
- `productType`: string, nullable — Product type
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `propertiesRemovalConditions`: List<`OmniumPropertyItem`>, nullable — Specifies conditions for removing existing properties before proceeding with the patch operation. Ea
- `quantity`: number (decimal), nullable — Number of items
- `replacedDate`: string (date-time), nullable — Replaced date
- `replacedQuantity`: number (decimal), nullable — Number of items replaced
- `replacementReason`: string, nullable — Reason for replacement
- `replacementType`: string, nullable — Type of replacement
- `requestedDeliveryDate`: string (date-time), nullable — DateTime of requested delivery date for line item
- `reservedInventory`: boolean, nullable — True if inventory is reserved
- `reservedInventoryDeliveryId`: string, nullable — Reservation delivery ID
- `reservedInventoryPurchaseOrderId`: string, nullable — Reserved inventory purchase order ID
- `reservedInventoryPurchaseOrderLineId`: string, nullable — Reserved purchase order line ID
- `reservedInventoryQuantity`: number (decimal), nullable — Reserved inventory
- `returnDate`: string (date-time), nullable — Date returned
- `returnQuantity`: number (decimal), nullable — Number of items returned
- `returnReason`: string, nullable — Return reason comment
- `returnType`: string, nullable — Return type ID (should correspond to preconfigured list of return types)
- `selectedUnit`: string, nullable — The selected unit of measurement on order line if product is sold in multiple units (Null if sold un
- `selectedUnitConversionFactor`: number (decimal), nullable — Conversion factor from default unit to selected unit
- `selectedUnitQuantity`: number (decimal), nullable — The quantity ordered in the selected unit of measurement.
- `serialNumber`: string, nullable — Serial number for order line
- `size`: string, nullable — Item size
- `storePickDate`: string (date-time), nullable — Deadline for when the store needs to pick the order line (Used for partial deliveries)
- `suggestedRetailPrice`: number (decimal), nullable — Suggested retail price. Not used in any calculations. Only used for reports or statistics by third p
- `suggestedRetailPriceExclTax`: number (decimal), nullable — Suggested retail price withoud tax. Not used in any calculations. Only used for reports or statistic
- `supplierId`: string, nullable — Supplier ID
- `supplierName`: string, nullable — Supplier name
- `supplierSkuId`: string, nullable — Supplier SKU ID
- `taxRate`: number (decimal), nullable — Tax rate in percent. If tax is 25%, value here should be 25.00. If not set(null) tax from market wil
- `taxTotal`: number (decimal), nullable — Total tax for order line
- `unit`: string, nullable — Quantity unit - e.g. Meter,Pcs,Litre, etc
- `updateStock`: boolean, nullable — Used by order return. If we should increase stock
- `webSiteProductUrl`: string, nullable — Public website URL to product

---


## OmniumOrderLineSettings

**Fields:**

- `defaultProperties`: List<`OmniumDefaultPropertyItem`>, nullable
- `splitMultibuyPromotionOrderLines`: boolean

---


## OmniumOrderLineUpdateResult

**Fields:**

- `errorCount`: integer (int32)
- `errorMessage`: string, nullable
- `isModified`: boolean
- `notFoundCount`: integer (int32)
- `totalCount`: integer (int32)
- `unchangedCount`: integer (int32)
- `updatedCount`: integer (int32)

---


## OmniumOrderOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumOrder`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumOrderOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumOrder`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumOrderOmniumVersion

**Fields:**

- `created`: string (date-time)
- `createdBy`: string, nullable
- `id`: string, nullable
- `type`: string, nullable
- `value`: → `OmniumOrder`
- `versionId`: string, nullable

---


## OmniumOrderOmniumWorkflowActionRequest

Represents a request to perform a workflow action in the Omnium system.
This generic class allows for flexibility by supporting various models,
such as orders, purchase orders, or products, in different workflows.

**Fields:**

- `value`: → `OmniumOrder`
- `workflowStep`: → `OmniumWorkflowStep`

---


## OmniumOrderPatch

Omnium order patch object

**Fields:**

- `assets`: List<`OmniumAsset`>, nullable — Order assets (documents, media, files)
- `billingAddress`: → `OmniumOrderAddress`
- `billingCurrency`: string, nullable — Currency of the order. e.g. "USD","NOK"
- `contactPerson`: → `OmniumContactPerson`
- `created`: string (date-time), nullable — Order created date
- `customerClubMemberId`: string, nullable — If Customer is member of customer club, set Customer ID as member ID.
- `customerContact`: string, nullable — Customer contact person
- `customerEmail`: string, nullable — Customer e-mail
- `customerGroups`: List<`string`>, nullable — Customer groups (for discount calculation)
- `customerId`: string, nullable — The ID of the customer - should be a unique value
- `customerName`: string, nullable — Name of customer
- `customerNumber`: string, nullable — The customer number
- `customerPhone`: string, nullable — Customer phone number with prefix. e.g. +4740000000
- `customerPickupDeadline`: string (date-time), nullable — Customer deadline for picking up order
- `customerReference`: string, nullable — Reference provided by customer
- `customerRequisition`: string, nullable — Customer requisition provided by customer
- `customerType`: string, nullable — B2B or B2C (Business customer or private customer / consumer)
- `errors`: List<`OmniumEntityError`>, nullable — List of errors on the current order.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external order IDs
- `followUpDate`: string (date-time), nullable — Order follow-up date
- `forceUpdate`: List<`string`>, nullable — Used to update nullable prop like datetime to null, if original object has value, and you want to se
- `id`: string, nullable — Unique order ID
- `ignorePromotions`: boolean, nullable — Promotion prices will be ignored when product added to cart
- `invoiceComment`: string, nullable — Invoice comment
- `isNotificationsDisabled`: boolean, nullable — If true, notifications will not be sent to customer
- `isReadOnly`: boolean, nullable — If true, the order is not editable in Omnium. Used for completed PoS orders, historic data etc
- `keepExistingCustomProperties`: boolean, nullable — Set to 'false' if you want to update the whole 'properties' list. If true, new properties will be ad
- `keepExistingListItems`: boolean, nullable — Determines behaviour when updating list where items does not have unique id (properties, errors). If
- `marketId`: string, nullable — Market ID e.g. US, NOR, SWE
- `modifiedBy`: string, nullable — Modified by
- `nextOrderStatus`: string, nullable — Status order should be moved to. (Updated by UpdateOrderStatusScheduledTask)
- `orderForm`: → `OmniumOrderFormPatch`
- `orderNotes`: List<`OmniumComment`>, nullable — Order comments, for internal use / not for customer
- `orderNumber`: string, nullable — Order identifier - does not have to be unique for each store, market etc
- `orderOrigin`: string, nullable — The origin of the order should identify where the order was created. Typical values are "OMS", "ERP"
- `orderType`: string, nullable — Order type e.g. "Online", "Pos"...
- `paymentType`: string, nullable — Name of payment provider
- `projectId`: string, nullable — Project ID - used if order is part of a project
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `propertiesRemovalConditions`: List<`OmniumPropertyItem`>, nullable — Specifies conditions for removing existing properties before proceeding with the patch operation. Ea
- `publicOrderNotes`: List<`OmniumComment`>, nullable — Order comments, visible for customer
- `received`: string (date-time), nullable — Order received date
- `relatedOrders`: List<`string`>, nullable — List of related order IDs
- `remainingPayment`: number (decimal), nullable — Amount not paid
- `replacementOrderIds`: List<`string`>, nullable — List of replacement order IDs for this order
- `requestedDeliveryDate`: string (date-time), nullable — Delivery date requested by customer
- `returnOrderForms`: List<`OmniumReturnOrderFormPatch`>, nullable — Returns
- `salesChannel`: string, nullable — Name of sales channel
- `salesPersonId`: string, nullable — id of seller
- `salesPersonName`: string, nullable — Name of seller
- `session`: string, nullable — Session code used for referencing a web session
- `status`: string, nullable — Order status, e.g. "New", "InProgress", "Cancelled", etc.
- `storeId`: string, nullable — Store ID responsible for order
- `storePickDate`: string (date-time), nullable — Employee deadline for picking order
- `subscriptionId`: string, nullable — Subscription ID - used if order is part of a subscription
- `tags`: List<`string`>, nullable — Order tags (Used by notification filters, and for grouping / filtering orders)
- `updateStatusDate`: string (date-time), nullable — Date when order should be moved to next status. (Updated by UpdateOrderStatusScheduledTask)

---


## OmniumOrderPatchUpdateResult

**Fields:**

- `errorCount`: integer (int32)
- `errorMessage`: string, nullable
- `isModified`: boolean
- `notFoundCount`: integer (int32)
- `totalCount`: integer (int32)
- `unchangedCount`: integer (int32)
- `updatedCount`: integer (int32)

---
