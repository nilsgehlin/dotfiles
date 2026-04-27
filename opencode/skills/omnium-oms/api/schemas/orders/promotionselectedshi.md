# Order Schemas — OmniumPromotionSelectedShipmentMethods to OmniumSubscriptionSearchRequest

## OmniumPromotionSelectedShipmentMethods

**Fields:**

- `marketId`: string, nullable
- `shippingMethodNames`: List<`string`>, nullable

---


## OmniumReturnOrderForm

Return order form

**Fields:**

- `authorizedPaymentTotal`: number (decimal) — Total amount authorized by payment providers
- `capturedPaymentTotal`: number (decimal) — Total amount captured by payment providers
- `cartId`: string, nullable — Unique ID of cart
- `cartName`: string, nullable — Name of cart / offer, such as "A special offer for a special customer". This is typically used in sc
- `charges`: List<`OmniumCharge`>, nullable — Obsolete: Add order lines instead. A list of additional charges for the order
- `claim`: → `OmniumClaim`
- `couponCodes`: List<`string`>, nullable — List of CouponCodes added by user
- `created`: string (date-time) — Date created
- `creditAmount`: number (decimal) — Amount to credit
- `creditPayment`: boolean — True if payment should be credited
- `creditPaymentTotal`: number (decimal) — Total amount credited by payment providers
- `discountAmount`: number (decimal) — Calculated: Total discount amount
- `discounts`: List<`OmniumDiscount`>, nullable — All discounts
- `errors`: List<`OmniumEntityError`>, nullable — List of errors on the return.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external return order IDs
- `fullRefund`: boolean — True if order should be fully refunded
- `grossRoundoff`: number (decimal), nullable — Set by external systems. Is added to orderform.total.
- `handlingTotal`: number (decimal) — Cost of handling
- `isPriority`: boolean, nullable — Possible to mark the order with priority
- `lineItems`: List<`OmniumOrderLine`>, nullable — All order lines / products
- `modified`: string (date-time) — Date modified
- `orderLevelTax`: number (decimal) — Order level tax amount
- `payments`: List<`OmniumPayment`>, nullable — All order payments
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `purchaseOrderId`: string, nullable — Purchase order ID (if order was created from a purchase order)
- `replacementOrderIds`: List<`string`>, nullable — References to any replacement orders related to the return
- `returnCharges`: List<`OmniumReturnCharge`>, nullable — List of charges on the return (Currently only internal use for ChargeNotPickedUpAmount / ChargeShipm
- `returnComment`: string, nullable — Return comment, used to describe reason for return
- `returnId`: string, nullable — Return ID
- `returnType`: string, nullable — Return type
- `rmaNumber`: string, nullable — RMA (return merchandise authorization) number
- `sentNotificationIds`: List<`string`>, nullable — Notification IDs sent on this order
- `shipments`: List<`OmniumShipment`>, nullable — All order shipments
- `shippingCreditedTotal`: number (decimal) — Calculated: Total shipping cost credited
- `shippingDiscountTotal`: number (decimal) — Calculated:Total shipping discounts
- `shippingSubTotal`: number (decimal) — Calculated: Shipping cost without discounts
- `shippingSubTotalExclTax`: number (decimal) — Calculated: shipping cost without discounts excl tax
- `shippingTotal`: number (decimal) — Calculated: Total shipping cost.
- `status`: string, nullable — Return status
- `storeId`: string, nullable — Store ID or warehouse where the product is returned
- `subTotal`: number (decimal) — Calculated: Order total without shipment cost
- `subTotalExclTax`: number (decimal) — Calculated: Order total without shipment cost and without tax
- `taxTotal`: number (decimal) — Calculated: Total tax amount (line item level and order level)
- `total`: number (decimal) — Calculated: Order total, including shipment cost, tax, and discounts
- `totalExclTax`: number (decimal) — Calculated: Order total, including shipment cost and discounts, but without tax
- `userId`: string, nullable — User ID creating the return

---


## OmniumReturnOrderFormPatch

Return order form

**Fields:**

- `authorizedPaymentTotal`: number (decimal), nullable — Total amount authorized by payment providers
- `capturedPaymentTotal`: number (decimal), nullable — Total amount captured by payment providers
- `cartId`: string, nullable — ID of original cart
- `cartName`: string, nullable — Name of cart / offer
- `chargeShipmentCostAmount`: number (decimal), nullable — Patch amount for shipment cost charged the customer
- `charges`: List<`OmniumCharge`>, nullable — A list of additional charges for the order
- `claim`: → `OmniumClaim`
- `couponCodes`: List<`string`>, nullable — List of CouponCodes added by user
- `created`: string (date-time), nullable — Date created
- `creditAmount`: number (decimal), nullable — Amount to credit
- `creditPayment`: boolean, nullable — True if payment should be credited
- `creditShipmentAmount`: number (decimal), nullable — Patch amount for shipment cost to credit customer
- `discountAmount`: number (decimal), nullable — Total discount amount
- `discounts`: List<`OmniumDiscount`>, nullable — All discounts
- `errors`: List<`OmniumEntityError`>, nullable — List of errors on the return.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external return order IDs
- `fullRefund`: boolean, nullable — True if order should be fully refunded
- `handlingTotal`: number (decimal), nullable — Cost of handling
- `isPriority`: boolean, nullable — Possible to mark the order with priority
- `lineItems`: List<`OmniumOrderLinePatch`>, nullable — All order lines / products
- `modified`: string (date-time), nullable — Date modified
- `orderLevelTax`: number (decimal), nullable — Order level tax amount
- `payments`: List<`OmniumPaymentPatch`>, nullable — All order payments
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `replaceLineItemsArray`: boolean — Use this if you want to entirely replace the returnItemsArray and not patch existing lines. This wil
- `replacementOrderIds`: List<`string`>, nullable — References to any replacement orders related to the return
- `returnComment`: string, nullable — Return comment, used to describe reason for return
- `returnId`: string, nullable — Return ID
- `returnType`: string, nullable — Return type
- `rmaNumber`: string, nullable — RMA (return merchandise authorization) number
- `sentNotificationIds`: List<`string`>, nullable — Notification IDs sent on this order
- `shipments`: List<`OmniumShipmentPatch`>, nullable — All order shipments
- `shippingDiscountTotal`: number (decimal), nullable — Total shipping discounts
- `shippingSubTotal`: number (decimal), nullable — Shipping cost without discounts
- `shippingSubTotalExclTax`: number (decimal), nullable — shipping cost without discounts excl tax
- `shippingTotal`: number (decimal), nullable — Total shipping cost
- `shouldAddMissingLineItems`: boolean — If it should add missing items when patching returnOrderLines
- `status`: string, nullable — Return status
- `storeId`: string, nullable — Store ID or warehouse where the product is returned
- `subTotal`: number (decimal), nullable — Ordrer total without shipment cost
- `subTotalExclTax`: number (decimal), nullable — Ordrer total without shipment cost and without tax
- `taxTotal`: number (decimal), nullable — Total tax amount (line item level and order level)
- `total`: number (decimal), nullable — Order total, including shipment cost, tax, and discounts
- `totalExclTax`: number (decimal), nullable — Order total, including shipment cost and discounts, but without tax
- `userId`: string, nullable — User ID creating the return

---


## OmniumReturnOrderSearchRequest

Search request object for return orders

**Fields:**

- `createdFrom`: string (date-time), nullable — Created from
- `createdTo`: string (date-time), nullable — Created to
- `customerId`: string, nullable — Customer ID
- `customerName`: string, nullable — Customer name
- `email`: string, nullable — Customer e-mail
- `id`: string, nullable — Return order ID
- `modifiedFrom`: string (date-time), nullable — Modified from date
- `modifiedTo`: string (date-time), nullable — Modified before date
- `orderNumber`: string, nullable — Order number
- `page`: integer (int32) — Page
- `phone`: string, nullable — Customer phone
- `projectId`: string, nullable — Project ID
- `rmaNumber`: string, nullable — RMA number
- `searchText`: string, nullable — Search text
- `selectedStores`: List<`string`>, nullable — Selected store IDs
- `take`: integer (int32) — Take

---


## OmniumReturnOrderViewModel

Model for return lists

**Fields:**

- `customerEmail`: string, nullable — Customer e-mail
- `customerId`: string, nullable — Customer ID
- `customerName`: string, nullable — Customer name
- `customerPhone`: string, nullable — Customer phone
- `orderId`: string, nullable — Order ID return is related to
- `orderNumber`: string, nullable — Order number
- `orderStoreName`: string, nullable — Order store name
- `returnOrderForm`: → `OmniumReturnOrderForm`
- `returnStoreId`: string, nullable — Returned to store ID
- `returnStoreName`: string, nullable — Returned to store name

---


## OmniumReturnOrderViewModelOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumReturnOrderViewModel`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumShipment

Representing a shipment

**Fields:**

- `address`: → `OmniumOrderAddress`
- `comment`: string, nullable — Shipment comments
- `completed`: string (date-time), nullable — Completed date
- `contactPerson`: → `OmniumContactPerson`
- `discounts`: List<`OmniumDiscount`>, nullable — Shipment discounts
- `expectedDeliveryDate`: string (date-time), nullable — Expected/Requested delivery date for this shipment
- `expectedShipmentDate`: string (date-time), nullable — Calculated - Expected shipment date (based on ATP)
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external shipment IDs
- `goodsDescription`: string, nullable — Describe shipment content
- `isAllocated`: boolean — Determines if shipment is allocated, set to true if shipment should not be reallocated.
- `lineItems`: List<`OmniumOrderLine`>, nullable — Shipment line items / order lines
- `orderStatus`: string, nullable — The shipment order status is used in workflows for partial shipments the same way as the order statu
- `orderStatusLog`: List<`OmniumOrderStatusLogItem`>, nullable — Timeline of all status changes for this shipment, including timestamps  and duration between statuse
- `packages`: List<`OmniumShipmentPackage`>, nullable — Shipment packages, used by third party shipping providers
- `pickUpPointInformation`: → `OmniumShippingPickUpPoint`
- `pickUpWarehouseCode`: string, nullable — Warehouse shipment is sent to (optional) for pickup. Should correspond to a store ID in Omnium.
- `prevStatus`: string, nullable — Previous status. Automatically set by Omnium's workflow
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `returnLabelLink`: string, nullable — Link to return shipment label
- `returnTrackingLink`: string, nullable — Tracking link if return shipment is booked
- `returnTrackingNumber`: string, nullable — Tracking number if return shipment is booked
- `servicePointId`: string, nullable — Id to third party shipment service/pickup point. If you only have id set this prop. If you have comp
- `shipmentId`: string, nullable — Unique identification for shipment. Required for all shipments.
- `shipmentLabelLink`: string, nullable — Shipping label link
- `shipmentTaxRate`: number (decimal), nullable — Shipment tax rate. If tax is 25%, value here should be 25.00. If not set, default tax rate from mark
- `shipmentTrackingLink`: string, nullable — Tracking link for external shipping provider
- `shipmentTrackingNumber`: string, nullable — Tracking number from external shipping provider
- `shippingCreditedTotal`: number (decimal) — Total shipping cost credited
- `shippingDiscountAmount`: number (decimal) — Calculated - Total discounts for shipping. Calculated from the discount list
- `shippingLabel`: string, nullable — User friendly name - Automatically populated from ShipmentOptions defined in Omnium as part of the o
- `shippingMethodId`: string, nullable — ID of shipping method
- `shippingMethodName`: string, nullable — Name of shipping method for this shipment. Should correspond to a shipment type in Omnium. Typical v
- `shippingMethodProductId`: string, nullable — Shipping method product ID. Used for external shipping providers that has shipping method product ID
- `shippingSubTotal`: number (decimal) — Shipping cost, without discounts
- `shippingSubTotalExclTax`: number (decimal) — Calculated - Shipping cost without discounts excl tax
- `shippingTax`: number (decimal) — Shipment cost tax
- `shippingTotal`: number (decimal) — Calculated - Total shipping cost (Calculated, shippingSubTotal - shippingDiscountAmount)
- `status`: string, nullable — Shipment status
- `subTotal`: number (decimal) — Calculated - Sum of all lineItems
- `taxTotal`: number (decimal) — LineItems tax total + shippingTax
- `total`: number (decimal) — Calculated - Sum of all lineItems and shipping cost
- `transit`: boolean — True if shipment is between two warehouses
- `virtualWarehouseCode`: string, nullable — Only relevant when using Virtual Stock Locations - Specifies which of the virtual Warehouses the inv
- `warehouseCode`: string, nullable — Warehouse shipment is sent from. Should correspond to a store ID in Omnium.

---


## OmniumShipmentDimensions

Shipment package dimensions

**Fields:**

- `heightInCm`: integer (int32) — Pacakge height in cm
- `lengthInCm`: integer (int32) — Pacakge length in cm
- `widthInCm`: integer (int32) — Pacakge width in cm

---


## OmniumShipmentLineItemsUpdateModel

Shipment line items update model for adding existing line items to a shipment

**Fields:**

- `lineItemIds`: List<`string`>, nullable — Ids of existing line items to add to shipment
- `shipmentId`: string, nullable — Id of shipment to add line items to

---


## OmniumShipmentOption

Information about a specific shipment product, provider(Bring, Postnord, HeltHjem...), returns, price etc.

**Fields:**

- `addTaxOnProviderPrice`: boolean — Should tax be added to provider shipping cost
- `additionalCustomerPricePercentage`: number (decimal) — Most providers gives you a cost price for the shipment. If needed, add a surcharge here in percentag
- `consigneeType`: string, nullable — CONSUMER or BUSINESS, is used by providers. Check with correct provider
- `consignorType`: string, nullable — CONSUMER or BUSINESS, is used by providers. Check with correct provider
- `countryCode`: string, nullable — Two letter countryCode. Providers use this to get pickupPoints
- `defaultPackage`: → `OmniumDefaultPackage`
- `defaultWarehouseCode`: string, nullable — Set if you use a default warehouse to send from
- `deliveryTime`: string, nullable — Default delivery time for this option
- `description`: string, nullable — A user friendly description of this shipment option
- `discountAmount`: number (decimal) — Amount of discount given to the customer
- `discountLabel`: string, nullable — Discount label
- `discountedPrice`: number (decimal) — If there is a discounted price for the shipment
- `discountedPriceExclTax`: number (decimal) — Discounted price excl tax
- `discountedPriceTax`: number (decimal) — Discounted price tax
- `externalShippingMethodName`: string, nullable — Should be used for additional ID or mapping to external systems.
- `getPriceFromProvider`: boolean — Set if prices should be calculated by provider, based on cart/order and address
- `getServicePoints`: boolean — If we should search for pickUp/service points, based on customer address
- `hideFromApi`: boolean — Not visible in public api
- `hideInOms`: boolean — Not visible in Oms gui
- `includeGoodsDescription`: boolean — Some providers needs a description of the goods. Then this should be true
- `isDefaultShipment`: boolean — Used internally as a fallback if no other shipment options is found
- `isWarehouseSetAutomatically`: boolean — Used if shipment options is added from Oms, and warehouse should be set automatically
- `label`: string, nullable — Friendly name for this shipment option.
- `labelTranslationKey`: string, nullable — Translation key for this shipment option.
- `logoUrl`: string, nullable — Provider logo
- `numberOfCollisMandatory`: boolean — Set if it is mandatory to send in number of collies
- `pickUpPoints`: List<`OmniumPickUpPoint`>, nullable — Pickup points returned by a provider
- `printerId`: string, nullable — Used by providers that support cloud print Only in use if shipping option require special printer, e
- `properties`: List<`OmniumPropertyItem`>, nullable
- `providerNotification`: boolean — If provider should use notifications(Send out sms/emails from Bring/Postnord)
- `providerServices`: string, nullable — Provider specific values(comma separated) e.g "postnord_notification_email", "postnord_notification_
- `servicePointProvider`: string, nullable — If provider for pickUp/service points differ from ShippingGateway
- `servicePointRequired`: boolean — If this shipment options require a pickUp/service point
- `shipmentDeliveryType`: string, nullable — "Delivery" or "PickUp". "Delivery" is used when shipment is sent from store. "PickUp" is used when c
- `shipmentProduct`: string, nullable — The product to book. E.g "PICKUP_PARCEL", "mypack". Get this value from provider
- `shipmentProductName`: string, nullable — Some providers need both ShipmentProduct and ShipmentProductName. Then ShipmentProduct will be "1254
- `shipmentReturnProduct`: string, nullable — If return label should be created. Add provider name for return here. "MYPACK_COLLECT_RETURN"
- `shippingCompany`: string, nullable — If PickUp Point provider diff from ShippingGateway. GateWay is Logistra, and pickupPoint service is 
- `shippingGateway`: string, nullable — Provider gateway to use, e.g Bring, PostNord.
- `shippingMethodId`: string, nullable — Unique id for this option(if ShippingMethodName is not enough
- `shippingMethodName`: string, nullable — Unique name to identify the shipping product. This value should match what the sales channel adds to
- `shippingPriceGateway`: string, nullable — If shipment prices and valid shipment options should be calculated by provider, but booking should n
- `shippingSubTotal`: number (decimal) — Set if a default shipping cost is used
- `shippingSubTotalExclTax`: number (decimal) — Shipping cost excl tax
- `shippingTax`: number (decimal) — Tax on shipping cost
- `shouldParseDescription`: boolean — Used by special magento cases. Ask us if needed
- `taxRate`: number (decimal) — Tax rate for the options, if differ from market tax rate. Only in used if we should calculate prices
- `translateKey`: string, nullable — Internal name for this shipment type. Use label for public
- `validOnMarkets`: List<`string`>, nullable — The markets this shipment option is valid for
- `vueTemplate`: string, nullable — Internal url to correct edit template

---


## OmniumShipmentPackage

Used by shipping providers to calculate freight cost and space on trucks

**Fields:**

- `barcode`: string, nullable — Package Barcode, for goods reception for example
- `dimensions`: → `OmniumShipmentDimensions`
- `goodsDescription`: string, nullable — Package description, if provider needs this
- `id`: string, nullable — Package ID
- `lineItemReferences`: List<`ShipmentPackageLineItemReference`>, nullable — This lets you bind packages to LineItems and quantity
- `shipmentTracking`: → `OmniumShipmentTracking`
- `volume`: number (double), nullable — Package volume in Liters
- `weightInKg`: number (double) — Package weight in Kg

---


## OmniumShipmentPatch

Representing a shipment

**Fields:**

- `address`: → `OmniumOrderAddress`
- `comment`: string, nullable — Shipment comments
- `contactPerson`: → `OmniumContactPerson`
- `discounts`: List<`OmniumDiscount`>, nullable — Shipment discounts
- `expectedDeliveryDate`: string (date-time), nullable — Expected/Requested delivery date for this shipment
- `expectedShipmentDate`: string (date-time), nullable — Calculated - Expected shipment date (based on ATP)
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external shipment IDs
- `lineItems`: List<`OmniumOrderLinePatch`>, nullable — Shipment line items
- `orderStatus`: string, nullable — The shipment order status is used in workflows for partial shipments the same way as the order statu
- `packages`: List<`OmniumShipmentPackage`>, nullable — Shipment packages, used by third party shipping providers
- `pickUpPointInformation`: → `OmniumShippingPickUpPoint`
- `pickUpWarehouseCode`: string, nullable — Warehouse shipment is sent to (optional)
- `prevStatus`: string, nullable — Previous status
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `returnLabelLink`: string, nullable — Link to return shipment label
- `returnTrackingLink`: string, nullable — Tracking link if return shipment is booked
- `returnTrackingNumber`: string, nullable — Tracking number if return shipment is booked
- `servicePointId`: string, nullable — Id to third party shipment service/pickup point. If you only have id set this prop. If you have comp
- `shipmentId`: string, nullable — Unique identification for shipment
- `shipmentTaxRate`: number (decimal), nullable — Shipment tax rate. If tax is 25%, value here should be 25.00. If not set, default tax rate from mark
- `shipmentTrackingLink`: string, nullable — Tracking link for external shipping provider
- `shipmentTrackingNumber`: string, nullable — Tracking number from external shipping provider
- `shippingDiscountAmount`: number (decimal), nullable — Total discounts for shipping
- `shippingLabel`: string, nullable — User friendly name - Populated from ShipmentOptions
- `shippingMethodId`: string, nullable — ID of shipping method
- `shippingMethodName`: string, nullable — Name of shipping method
- `shippingMethodProductId`: string, nullable — Shipping method product ID
- `shippingSubTotal`: number (decimal), nullable — Shipping cost, without discounts
- `shippingSubTotalExclTax`: number (decimal), nullable — Shipping cost without discounts excl tax
- `shippingTax`: number (decimal), nullable — Shipment cost tax
- `shippingTotal`: number (decimal), nullable — Total shipping cost (Calculated, shippingSubTotal - shippingDiscountAmount)
- `status`: string, nullable — Shipment status
- `subTotal`: number (decimal), nullable — Sum of all lineItems
- `taxTotal`: number (decimal), nullable — LineItems tax total + shippingTax
- `total`: number (decimal), nullable — Sum of all lineItems and shipping cost
- `transit`: boolean, nullable — True if shipment is between two warehouses
- `warehouseCode`: string, nullable — Warehouse shipment is sent from

---


## OmniumShipmentTracking

Tracking for each package/colli. Used if shipping provider returns more than one trackinglink/number. Some providers does not support one tracking for shipment with multiple packages

**Fields:**

- `shipmentLabelLink`: string, nullable — Link to Shipment label
- `shipmentTrackingLink`: string, nullable — Provider tracking link
- `shipmentTrackingNumber`: string, nullable — Provider tracking number

---


## OmniumShippingPickUpPoint

Object describing a pickUpPoint for a shipment

**Fields:**

- `address`: → `OmniumPickUpPointAddress`
- `name`: string, nullable — A describing name for the pickUp point
- `openingHours`: List<`OmniumPickUpPointOpeningHour`>, nullable — If Opening hours is available, this will containe a list of days and from - to.
- `servicePointId`: string, nullable — Id for this shippingPoint. Id can come from a shippingProvider, and used for lookup.

---


## OmniumSubPayment

Represents a sub-category of a payment method with detailed breakdown.

**Fields:**

- `moneyCaptured`: number (decimal) — Amount that has been captured/settled.
- `moneyInAdvance`: number (decimal) — Amount paid in advance (deposits, prepayments).
- `moneyReserved`: number (decimal) — Amount reserved but not yet captured (authorizations).
- `moneySubTotal`: number (decimal) — Subtotal for this payment sub-type.
- `name`: string, nullable — Name of the sub-payment type.

---


## OmniumSubscription

Omnium subscription model

**Fields:**

- `cartTemplate`: → `OmniumCart` **required**
- `createPendingOrders`: boolean — Create pending orders for subscription
- `created`: string (date-time) — When the subscription was created
- `customerEmail`: string, nullable — Customer e-mail
- `customerId`: string, nullable — The ID of the customer - should be an unique value
- `customerName`: string, nullable — Name of customer
- `customerNumber`: string, nullable — The customer number
- `customerPhone`: string, nullable — Customer phone number with prefix. e.g. +4740000000
- `endDate`: string (date-time), nullable — End date of the subscription
- `errors`: List<`OmniumEntityError`>, nullable — Errors and warnings
- `externalIds`: List<`OmniumExternalId`>, nullable — External IDs
- `id`: string, nullable — Unique subscription ID
- `intervalDays`: integer (int32) — Interval in days between each order
- `isAnonymized`: boolean — Marked as anonymized              s
- `lastFailedVerificationAttempt`: string (date-time), nullable — When subscription verification last failed
- `modified`: string (date-time) — Last time the subscription was updated
- `modifiedBy`: string, nullable — User (or system) that last modified the entity
- `nextOrderDate`: string (date-time), nullable — Date when next order should be created
- `numberOfPendingOrders`: integer (int32), nullable — Number of pending orders to create (Default: 3)
- `numberOfVerificationAttempts`: integer (int32), nullable — Number of failed verification attempts. Should be reset when a successful verification attempt
- `payments`: List<`OmniumPayment`>, nullable — Subscription payment - recurring payment reference
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `schedule`: string, nullable — Subscription schedule - Cron expression
- `startDate`: string (date-time), nullable — Start date of the subscription
- `status`: string **required** — Subscription current status
- `subscriptionOrderCreationTime`: string — Time of day when the subscription order should be created

---


## OmniumSubscriptionOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumSubscription`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumSubscriptionSearchRequest

Subscription search request

**Fields:**

- `customerEmail`: string, nullable — Customer e-mail
- `customerId`: string, nullable — Customer Id
- `customerName`: string, nullable — Customer name
- `customerNumber`: string, nullable — Customer Number
- `customerPhone`: string, nullable — Customer phone number
- `externalIds`: List<`string`>, nullable — Search subscriptions with external IDs
- `marketIds`: List<`string`>, nullable — Limit search by store IDs
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `property`: → `OmniumPropertyItem`
- `storeIds`: List<`string`>, nullable — Limit search by store IDs
- `take`: integer (int32) — Number of orders to take

---
