# Order Schemas — OmniumUpdateShipmentInfo to SitooPaymentDetail

## OmniumUpdateShipmentInfo

Class for updating shipment method and tracking info

**Fields:**

- `comment`: string, nullable — If set, comment will be replaced on shipment
- `externalIds`: List<`OmniumExternalId`>, nullable — Add or update external IDs to shipment
- `labelLink`: string, nullable — Link to shipping label
- `orderStatus`: string, nullable — If set, order status will be updated on shipment only, unless all shipments have same status
- `packages`: List<`OmniumShipmentPackage`>, nullable — Shipment packages, with dimensions and optional tracking information
- `pickUpPointInformation`: → `OmniumShippingPickUpPoint`
- `properties`: List<`OmniumPropertyItem`>, nullable — Add or update external IDs to shipment
- `returnLabelLink`: string, nullable — link to return shipping label
- `returnTrackingLink`: string, nullable — Link to return tracking
- `returnTrackingNumber`: string, nullable — Return tracking number
- `servicePointId`: string, nullable — Id to third party shipment service/pickup point. If you only have id set this prop. If you have comp
- `shipmentId`: string, nullable — Shipment to update. If id does not exists in Omnium, new shipment is created(only for partially upda
- `shipmentMethodName`: string, nullable — Set this if shipmentMethodName is changed, or this is a new shipment
- `shippingMethodProductId`: string, nullable — If set, shipping method product ID will be replaced on shipment
- `trackingNumber`: string, nullable — Tracking number from carrier
- `trackingUrl`: string, nullable — Tracking url from carrier
- `warehouseCode`: string, nullable — Warehouse shipment is sent from

---


## OmniumZReportPayment

Represents a payment method used for sales transactions.

**Fields:**

- `amount`: number (decimal) — Total amount received through this payment method.
- `count`: integer (int32) — Number of transactions using this payment method.
- `name`: string, nullable — Name of the payment method (e.g., "Cash", "Credit Card", "Mobile Payment").
- `subPayments`: List<`OmniumSubPayment`>, nullable — Breakdown of this payment method into sub-categories (optional).

---


## Order

**Fields:**

- `assets`: List<`Asset`>, nullable
- `bankTransactionId`: string, nullable
- `billingAddress`: → `OrderAddress`
- `billingCurrency`: string, nullable
- `canceled`: string (date-time), nullable
- `completed`: string (date-time), nullable
- `contactPerson`: → `ContactPerson`
- `correlationId`: string, nullable
- `cost`: number (decimal)
- `created`: string (date-time)
- `customerClubMemberId`: string, nullable
- `customerContact`: string, nullable
- `customerEmail`: string, nullable
- `customerGroups`: List<`string`>, nullable
- `customerId`: string, nullable
- `customerName`: string, nullable
- `customerNumber`: string, nullable
- `customerOrderNumber`: string, nullable
- `customerPhone`: string, nullable
- `customerPickupDeadline`: string (date-time), nullable
- `customerReference`: string, nullable
- `customerRequisition`: string, nullable
- `customerType`: string, nullable
- `discountTotalIncVat`: number (decimal)
- `documentStatus`: string, nullable
- `errors`: List<`EntityError`>, nullable
- `esMetadata`: → `EsMetaData`
- `externalIds`: List<`ExternalId`>, nullable
- `followUpDate`: string (date-time), nullable
- `groups`: List<`OrderGroup`>, nullable
- `id`: string, nullable
- `indexIdentifier`: string, nullable
- `invoiceComment`: string, nullable
- `invoiceIds`: List<`string`>, nullable
- `isAnonymized`: boolean
- `isNewCustomer`: boolean
- `isNotificationsDisabled`: boolean
- `isReadOnly`: boolean
- `isReallocated`: boolean
- `isReservable`: boolean, nullable
- `marketId`: string, nullable
- `modified`: string (date-time)
- `modifiedBy`: string, nullable
- `name`: string, nullable
- `netTotal`: number (decimal)
- `netTotalExclTax`: number (decimal)
- `nextOrderStatus`: string, nullable
- `orderForm`: → `OrderForm`
- `orderNotes`: List<`Comment`>, nullable
- `orderNumber`: string, nullable
- `orderType`: string, nullable
- `orgNr`: string, nullable
- `origin`: string, nullable
- `paymentTermsNet`: integer (int32), nullable
- `paymentType`: string, nullable
- `pendingNotificationIds`: List<`PendingNotification`>, nullable
- `projectId`: string, nullable
- `projectIds`: List<`string`>, nullable
- `properties`: List<`PropertyItem`>, nullable
- `publicOrderNotes`: List<`Comment`>, nullable
- `readyForPickup`: string (date-time), nullable
- `received`: string (date-time), nullable
- `relatedOrders`: List<`string`>, nullable
- `remainingPayment`: number (decimal), nullable
- `replacementOrderIds`: List<`string`>, nullable
- `requestedDeliveryDate`: string (date-time), nullable
- `returnOrderForms`: List<`ReturnOrderForm`>, nullable
- `salesChannel`: string, nullable
- `salesPersonId`: string, nullable
- `salesPersonName`: string, nullable
- `secretKey`: string, nullable
- `session`: string, nullable
- `status`: string, nullable
- `storeId`: string, nullable
- `storePickDate`: string (date-time), nullable
- `subscriptionId`: string, nullable
- `tags`: List<`string`>, nullable
- `tenantId`: string, nullable
- `updateStatusDate`: string (date-time), nullable
- `versionId`: string, nullable

---


## OrderAddress

**Fields:**

- `apartmentNumber`: string, nullable
- `city`: string, nullable
- `countryCode`: string, nullable
- `countryName`: string, nullable
- `daytimePhoneNumber`: string, nullable
- `email`: string, nullable
- `eveningPhoneNumber`: string, nullable
- `externalId`: string, nullable
- `firstName`: string, nullable
- `lastName`: string, nullable
- `line1`: string, nullable
- `line2`: string, nullable
- `locationName`: string, nullable
- `name`: string, nullable
- `organization`: string, nullable
- `organizationalNumber`: string, nullable
- `phone`: string, nullable
- `postalCode`: string, nullable
- `postalCodeInt`: integer (int32)
- `properties`: List<`PropertyItem`>, nullable
- `purposes`: List<`string`>, nullable
- `regionCode`: string, nullable
- `regionName`: string, nullable
- `state`: string, nullable
- `streetNumber`: string, nullable

---


## OrderExportResult

**Fields:**

- `item`: → `Order`
- `logItems`: List<`ExportLogItem`>, nullable

---


## OrderForm

**Fields:**

- `authorizedPaymentTotal`: number (decimal)
- `capturedPaymentTotal`: number (decimal)
- `cartId`: string, nullable
- `cartName`: string, nullable
- `charges`: List<`Charge`>, nullable
- `couponCodes`: List<`string`>, nullable
- `creditPaymentTotal`: number (decimal)
- `discountAmount`: number (decimal)
- `discountTotalIncVat`: number (decimal)
- `discounts`: List<`Discount`>, nullable
- `fullRefund`: boolean
- `grossRoundoff`: number (decimal), nullable
- `handlingTotal`: number (decimal)
- `isPriority`: boolean
- `lineItems`: List<`OrderLine`>, nullable
- `orderLevelTax`: number (decimal)
- `payments`: List<`Payment`>, nullable
- `properties`: List<`PropertyItem`>, nullable
- `purchaseOrderId`: string, nullable
- `shipments`: List<`Shipment`>, nullable
- `shippingCreditedTotal`: number (decimal)
- `shippingDiscountTotal`: number (decimal)
- `shippingSubTotal`: number (decimal)
- `shippingSubTotalExclTax`: number (decimal)
- `shippingTotal`: number (decimal)
- `status`: string, nullable
- `subTotal`: number (decimal)
- `subTotalExclTax`: number (decimal)
- `taxTotal`: number (decimal)
- `total`: number (decimal)
- `totalExclTax`: number (decimal)

---


## OrderGroup

**Fields:**

- `description`: string, nullable
- `id`: string, nullable
- `name`: string, nullable

---


## OrderLine

**Fields:**

- `alternativeProductName`: string, nullable
- `brand`: string, nullable
- `campaignId`: string, nullable
- `cancelComment`: string, nullable
- `cancelReason`: string, nullable
- `canceledDate`: string (date-time), nullable
- `canceledQuantity`: number (decimal)
- `code`: string, nullable
- `color`: string, nullable
- `comment`: string, nullable
- `componentId`: string, nullable
- `components`: List<`ProductComponent`>, nullable
- `cost`: number (decimal)
- `costTotal`: number (decimal)
- `countryOfOrigin`: string, nullable
- `createPurchaseOrder`: boolean, nullable
- `creditedAmount`: number (decimal)
- `customsCode`: string, nullable
- `deliveredDate`: string (date-time), nullable
- `deliveredQuantity`: number (decimal)
- `discountReasonCode`: string, nullable
- `discountedPrice`: number (decimal)
- `discountedPriceExclTax`: number (decimal)
- `discounts`: List<`OrderLineDiscount`>, nullable
- `displayName`: string, nullable
- `ean`: string, nullable
- `expectedDeliveryDate`: string (date-time), nullable
- `extendedPrice`: number (decimal)
- `extendedPriceExclTax`: number (decimal)
- `externalIds`: List<`ExternalId`>, nullable
- `groupId`: string, nullable
- `gtins`: List<`string`>, nullable
- `imageUrl`: string, nullable
- `internalWarehouseLocation`: string, nullable
- `isAwaitingPurchaseOrder`: boolean, nullable
- `isBackorder`: boolean
- `isBundle`: boolean
- `isConfigurableProduct`: boolean
- `isExcludedFromPromotions`: boolean, nullable
- `isGift`: boolean
- `isPackage`: boolean
- `isPackageBrokeDown`: boolean
- `isPackageProduct`: boolean
- `isReadOnly`: boolean
- `isReadOnlyByCustomer`: boolean
- `isSerializableProduct`: boolean
- `isSkuAccessory`: boolean
- `isVirtualProduct`: boolean
- `lineItemDiscountAmount`: number (decimal)
- `lineItemDiscountAmountExclTax`: number (decimal)
- `lineItemId`: string, nullable
- `location`: string, nullable
- `modifiedReason`: string, nullable
- `nobbNumber`: string, nullable
- `orderDiscountAmount`: number (decimal)
- `orderDiscountAmountExTax`: number (decimal)
- `orderLineBonusPoints`: → `OrderLineBonusPoints`
- `originalExtendedPricePerUnit`: number (decimal), nullable
- `originalMultiBuyLineItemId`: string, nullable
- `packageLineItemId`: string, nullable
- `packageName`: string, nullable
- `packageSkuId`: string, nullable
- `placedPrice`: number (decimal)
- `placedPriceExclTax`: number (decimal)
- `priceListId`: string, nullable
- `priceListItemId`: string, nullable
- `productId`: string, nullable
- `productType`: string, nullable
- `properties`: List<`PropertyItem`>, nullable
- `quantity`: number (decimal)
- `readyForPickupDate`: string (date-time), nullable
- `readyForPickupQuantity`: number (decimal), nullable
- `reallocateQuantity`: number (decimal)
- `replacedDate`: string (date-time), nullable
- `replacedQuantity`: number (decimal), nullable
- `replacementReason`: string, nullable
- `replacementType`: string, nullable
- `requestedDeliveryDate`: string (date-time), nullable
- `reservedInventory`: boolean
- `reservedInventoryDeliveryId`: string, nullable
- `reservedInventoryPurchaseOrderId`: string, nullable
- `reservedInventoryPurchaseOrderLineId`: string, nullable
- `reservedInventoryQuantity`: number (decimal)
- `returnDate`: string (date-time), nullable
- `returnQuantity`: number (decimal)
- `returnReason`: string, nullable
- `returnType`: string, nullable
- `season`: string, nullable
- `selectedUnit`: string, nullable
- `selectedUnitConversionFactor`: number (decimal), nullable
- `selectedUnitPrice`: number (decimal), nullable
- `selectedUnitQuantity`: number (decimal), nullable
- `serialNumber`: string, nullable
- `shipmentPackageId`: string, nullable
- `size`: string, nullable
- `suggestedRetailPrice`: number (decimal)
- `suggestedRetailPriceExclTax`: number (decimal)
- `supplierId`: string, nullable
- `supplierName`: string, nullable
- `supplierSkuId`: string, nullable
- `taxCategory`: string, nullable
- `taxRate`: number (decimal), nullable
- `taxTotal`: number (decimal)
- `terms`: string, nullable
- `unit`: string, nullable
- `updateStock`: boolean
- `volume`: number (double), nullable
- `webSiteProductUrl`: string, nullable

---


## OrderLineBonusPoints

**Fields:**

- `bonusPointsPromotions`: List<`BonusPointsPromotion`>, nullable
- `earnedPoints`: number (decimal)
- `estimatedPoints`: number (decimal)
- `newPointsOnHold`: number (decimal)

---


## OrderLineDiscount

**Fields:**

- `alwaysApply`: boolean
- `bundleLineItemId`: string, nullable
- `canBeCombinedWithOtherPromotions`: boolean
- `discountAmount`: number (decimal)
- `discountAmountPrItem`: number (decimal)
- `discountCode`: string, nullable
- `discountId`: string, nullable
- `discountName`: string, nullable
- `discountSource`: → `DiscountSource`
- `discountValue`: number (decimal)
- `effectivePriceBySkuId`: object, nullable
- `isBonusPointsReward`: boolean
- `isBundleDiscount`: boolean
- `maxDiscountAmount`: number (decimal)
- `priority`: integer (int32)
- `promotionFixedPriceReward`: → `PromotionFixedPriceReward`
- `promotionKitReward`: → `PromotionKitReward`
- `promotionMultiBuyReward`: → `PromotionMultiBuyReward`
- `quantityUsedInDiscount`: number (decimal)
- `rewardType`: → `RewardType`
- `useDiscountedPriceAsBase`: boolean

---


## OrderLineReplacementRequestModel

Orderline replacement request model

**Fields:**

- `lineItemId`: string **required** — Orderline id to replace
- `quantity`: integer (int32) **required** — Quantity to replace
- `replacementReason`: string, nullable — Replacement reason
- `replacementType`: string, nullable — Replacement type (Should correspond to predefined list of replacement types)
- `skuId`: string, nullable — You can add a SkuId of a product if you want to replace the current product on the orderline with a 

---


## OrderStatusLogItem

**Fields:**

- `durationSincePreviousMs`: integer (int64), nullable
- `status`: string, nullable
- `timestamp`: string (date-time)

---


## Payment

**Fields:**

- `amount`: number (decimal)
- `authorizationCode`: string, nullable
- `authorizationExpires`: string (date-time), nullable
- `comment`: string, nullable
- `created`: string (date-time), nullable
- `customerName`: string, nullable
- `externalIds`: List<`ExternalId`>, nullable
- `id`: string, nullable
- `internalReference`: string, nullable
- `invoiceId`: string, nullable
- `invoiceNumber`: string, nullable
- `isManuallyAdded`: boolean
- `orderLineReferences`: List<`PaymentOrderLineReference`>, nullable
- `paidDate`: string (date-time), nullable
- `paymentMethodId`: string (uuid)
- `paymentMethodName`: string, nullable
- `paymentNumber`: string, nullable
- `paymentType`: string, nullable
- `properties`: List<`PropertyItem`>, nullable
- `reason`: string, nullable
- `reservationId`: string, nullable
- `shipmentId`: string, nullable
- `status`: string, nullable
- `storeId`: string, nullable
- `transactionId`: string, nullable
- `transactionType`: string, nullable
- `validationCode`: string, nullable

---


## PaymentOrderLineReference

**Fields:**

- `lineItemId`: string, nullable

---


## PickUpPointInformation

**Fields:**

- `deliveryAddress`: → `Deliveryaddress`
- `name`: string, nullable
- `servicePointId`: string, nullable

---


## ReturnOrderForm

**Fields:**

- `amoutToCreditWithoutOrderlines`: number (decimal)
- `authorizedPaymentTotal`: number (decimal)
- `capturedPaymentTotal`: number (decimal)
- `cartId`: string, nullable
- `cartName`: string, nullable
- `charges`: List<`Charge`>, nullable
- `claim`: → `Claim`
- `couponCodes`: List<`string`>, nullable
- `created`: string (date-time)
- `createdBy`: string, nullable
- `creditAmount`: number (decimal)
- `creditPayment`: boolean
- `creditPaymentTotal`: number (decimal)
- `discountAmount`: number (decimal)
- `discountTotalIncVat`: number (decimal)
- `discounts`: List<`Discount`>, nullable
- `errors`: List<`EntityError`>, nullable
- `externalIds`: List<`ExternalId`>, nullable
- `fullRefund`: boolean
- `grossRoundoff`: number (decimal), nullable
- `handlingTotal`: number (decimal)
- `id`: string, nullable
- `isPriority`: boolean
- `lineItems`: List<`OrderLine`>, nullable
- `modified`: string (date-time)
- `orderLevelTax`: number (decimal)
- `origin`: string, nullable
- `payments`: List<`Payment`>, nullable
- `properties`: List<`PropertyItem`>, nullable
- `purchaseOrderId`: string, nullable
- `replacementOrderIds`: List<`string`>, nullable
- `returnCharges`: List<`ReturnCharge`>, nullable
- `returnComment`: string, nullable
- `returnType`: string, nullable
- `rmaNumber`: string, nullable
- `sentNotificationIds`: List<`string`>, nullable
- `shipments`: List<`Shipment`>, nullable
- `shippingCreditedTotal`: number (decimal)
- `shippingDiscountTotal`: number (decimal)
- `shippingSubTotal`: number (decimal)
- `shippingSubTotalExclTax`: number (decimal)
- `shippingTotal`: number (decimal)
- `status`: string, nullable
- `storeId`: string, nullable
- `subTotal`: number (decimal)
- `subTotalExclTax`: number (decimal)
- `taxTotal`: number (decimal)
- `total`: number (decimal)
- `totalExclTax`: number (decimal)
- `userId`: string, nullable

---


## Shipment

**Fields:**

- `additionalShipmentDocumentLinks`: List<`PropertyItem`>, nullable
- `address`: → `OrderAddress`
- `comment`: string, nullable
- `completed`: string (date-time), nullable
- `contactPerson`: → `ContactPerson`
- `currencyCode`: string, nullable
- `deliveryTime`: string, nullable
- `discounts`: List<`Discount`>, nullable
- `expectedDeliveryDate`: string (date-time), nullable
- `expectedShipmentDate`: string (date-time), nullable
- `externalIds`: List<`ExternalId`>, nullable
- `goodsDescription`: string, nullable
- `isInventoryReserved`: boolean
- `isReallocated`: boolean
- `labelLink`: string, nullable
- `lineItems`: List<`OrderLine`>, nullable
- `numberOfCollis`: integer (int32)
- `orderStatus`: string, nullable
- `orderStatusLog`: List<`OrderStatusLogItem`>, nullable
- `orderType`: string, nullable
- `packages`: List<`Package`>, nullable
- `payments`: List<`Payment`>, nullable
- `pickListId`: string, nullable
- `pickUpPointInformation`: → `PickUpPointInformation`
- `pickUpWarehouseCode`: string, nullable
- `prevStatus`: string, nullable
- `properties`: List<`PropertyItem`>, nullable
- `providerInternalConsignmentId`: string, nullable
- `providerInternalReturnConsignmentId`: string, nullable
- `returnLabelLink`: string, nullable
- `returnTrackingLink`: string, nullable
- `returnTrackingNumber`: string, nullable
- `servicePointId`: string, nullable
- `shipmentId`: string, nullable
- `shipmentPackedBy`: string, nullable
- `shipmentTaxRate`: number (decimal), nullable
- `shipmentTrackingLink`: string, nullable
- `shipmentTrackingNumber`: string, nullable
- `shippingCreditedTotal`: number (decimal)
- `shippingDiscountAmount`: number (decimal)
- `shippingLabel`: string, nullable
- `shippingMethodId`: string, nullable
- `shippingMethodName`: string, nullable
- `shippingMethodProductId`: string, nullable
- `shippingSubTotal`: number (decimal)
- `shippingSubTotalExclTax`: number (decimal)
- `shippingTax`: number (decimal)
- `shippingTotal`: number (decimal)
- `status`: string, nullable
- `subTotal`: number (decimal)
- `taxTotal`: number (decimal)
- `total`: number (decimal)
- `transit`: boolean
- `tryReallocateDeadline`: string (date-time), nullable
- `useApiForLabel`: boolean
- `virtualWarehouseCode`: string, nullable
- `warehouseCode`: string, nullable

---


## ShipmentPackageLineItemReference

Used to add a link between packages and LineItems

**Fields:**

- `lineItemId`: string, nullable

---


## ShipmentTracking

**Fields:**

- `shipmentLabelLink`: string, nullable
- `shipmentTrackingLink`: string, nullable
- `shipmentTrackingNumber`: string, nullable

---


## SitooPaymentDetail

**Fields:**

- `moneyTotal`: number (decimal)
- `name`: string, nullable

---
