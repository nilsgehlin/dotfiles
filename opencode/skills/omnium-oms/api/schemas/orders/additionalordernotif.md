# Order Schemas — AdditionalOrderNotificationSettings to OmniumOrderForm

## AdditionalOrderNotificationSettings

**Fields:**

- `sendNotificationForEachShipmentMatchingFilters`: boolean

---


## OmniumAnalyticsOrder

**Fields:**

- `completed`: string (date-time), nullable — The date the order was completed (if applicable).
- `created`: string (date-time) — The date the order was created.
- `orderId`: string, nullable — The unique identifier for the order.
- `orderNumber`: string, nullable — The number associated with the order.
- `orderType`: string, nullable — The type of the order.
- `properties`: List<`OmniumAnalyticsPropertyItem`>, nullable — List of custom properties associated with the order.
- `salesPersonId`: string, nullable — The ID of the salesperson associated with the order.
- `salesPersonName`: string, nullable — The name of the salesperson associated with the order.
- `status`: string, nullable — The current status of the order.

---


## OmniumAnalyticsOrderLine

**Fields:**

- `analyticsOrderLineType`: string, nullable
- `contactPerson`: → `OmniumAnalyticsContactPerson`
- `currency`: string, nullable
- `customer`: → `OmniumAnalyticsCustomer`
- `id`: string, nullable
- `invoiceAddress`: → `OmniumAnalyticsAddress`
- `language`: string, nullable
- `market`: string, nullable
- `order`: → `OmniumAnalyticsOrder`
- `orderLine`: → `OmniumAnalyticsOrderLineInfo`
- `payment`: → `OmniumAnalyticsPayment`
- `pickupWarehouse`: → `OmniumAnalyticsStore`
- `product`: → `OmniumAnalyticsProduct`
- `promotion`: → `OmniumAnalyticsPromotion`
- `returnOrder`: → `OmniumAnalyticsReturnOrder`
- `returnWarehouse`: → `OmniumAnalyticsStore`
- `shipment`: → `OmniumAnalyticsShipment`
- `shippingAddress`: → `OmniumAnalyticsAddress`
- `store`: → `OmniumAnalyticsStore`
- `supplier`: → `OmniumAnalyticsSupplier`
- `warehouse`: → `OmniumAnalyticsStore`

---


## OmniumAnalyticsOrderLineGrouped

Quantities for order aggregations

**Fields:**

- `cancelledQuantity`: number (decimal) — Number of items cancelled
- `cost`: number (decimal) — Order line cost
- `currency`: string, nullable — Currency for all quantities
- `deliveredQuantity`: number (decimal) — Number of items delivered
- `group`: string, nullable — Aggregation group
- `profit`: number (decimal) — Order line profit
- `profitAsPercentageOfRevenueExTax`: number (decimal) — Profit in percent of revenue ex tax
- `quantity`: number (decimal) — Number of order lines
- `revenue`: number (decimal) — Order line revenue
- `revenueExTax`: number (decimal) — Order line revenue ex tax

---


## OmniumAnalyticsOrderLineGroupedOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumAnalyticsOrderLineGrouped`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumAnalyticsOrderLineGroupedSearchResponse

Response model for analytics search and aggregation data

**Fields:**

- `searchResult`: → `OmniumAnalyticsOrderLineGroupedOmniumSearchResult`
- `totals`: → `OmniumAnalyticsOrderLineGrouped`

---


## OmniumAnalyticsOrderLineInfo

**Fields:**

- `canceledDate`: string (date-time), nullable
- `canceledQuantity`: number (decimal)
- `costTotal`: number (decimal)
- `deliveredDate`: string (date-time), nullable
- `deliveredQuantity`: number (decimal)
- `discountedPrice`: number (decimal)
- `discountedPriceExclTax`: number (decimal)
- `extendedPrice`: number (decimal)
- `extendedPriceExclTax`: number (decimal)
- `lineItemId`: string, nullable
- `name`: string, nullable
- `profit`: number (decimal)
- `profitPercent`: number (decimal)
- `properties`: List<`OmniumAnalyticsPropertyItem`>, nullable — Properties
- `quantity`: number (decimal)
- `readyForPickupDate`: string (date-time), nullable
- `readyForPickupQuantity`: number (decimal), nullable
- `replacedDate`: string (date-time), nullable
- `replacedQuantity`: number (decimal), nullable
- `replacementReason`: string, nullable
- `replacementType`: string, nullable
- `returnQuantity`: number (decimal)
- `skuId`: string, nullable
- `taxRate`: number (decimal)

---


## OmniumAnalyticsOrderLineOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumAnalyticsOrderLine`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumAnalyticsOrderLineSearchRequest

Search analytics orders (analytics must be activated in configuration to yield results)

**Fields:**

- `brands`: List<`string`>, nullable — Brand filter
- `citys`: List<`string`>, nullable — City filter
- `colors`: List<`string`>, nullable — Color filter
- `completedFrom`: string (date-time), nullable — Completed date from filter (orders completed after given date)
- `completedTo`: string (date-time), nullable — Completed date to filter (orders completed before given date)
- `contactPersonEmails`: List<`string`>, nullable — Contact person e-mail filter
- `contactPersonPhones`: List<`string`>, nullable — Contact person phone filter
- `countryNames`: List<`string`>, nullable — Country name filter
- `createdFrom`: string (date-time), nullable — Created date from filter (orders crated after given date)
- `createdTo`: string (date-time), nullable — Created date to filter (orders created before given date)
- `currencies`: List<`string`>, nullable — Currency filter
- `customerIds`: List<`string`>, nullable — Customer ID filter
- `customerNames`: List<`string`>, nullable — Customer name filter
- `eanCodes`: List<`string`>, nullable — EAN / GTIN filter
- `groupBy`: string, nullable — Group by (Property name from AnalyticsOrderLine. E.g. "MainCategory", "SalesPersonName", "ProductNam
- `includeOrderLines`: boolean, nullable — Include order lines (default true)
- `includeReturns`: boolean — Include return order lines
- `includeShipping`: boolean — Include shipping order lines
- `isContactPersonIncluded`: boolean — Include order contact person information
- `isCustomerPropertiesIncluded`: boolean — Include customer information
- `isInvoiceAddressPropertiesIncluded`: boolean — Include invoice address information
- `isOrderDefaultPropertiesIncluded`: boolean — Include default properties from the order (Default property items are configurable in the configurat
- `isOrderPropertiesIncluded`: boolean — Include order information
- `isPaymentPropertiesIncluded`: boolean — Include payment information
- `isProductPropertiesIncluded`: boolean — Include product information
- `isPromotionPropertiesIncluded`: boolean — Include promotion information
- `isShipmentPropertiesIncluded`: boolean — Include shipment information
- `isShippingAddressPropertiesIncluded`: boolean — Include shipping address information
- `isStorePropertiesIncluded`: boolean — Include store information
- `isSupplierPropertiesIncluded`: boolean — Include supplier information
- `isWarehousePropertiesIncluded`: boolean — Include warehouse information
- `language`: string, nullable — Language filter
- `mainProductCategory`: List<`string`>, nullable — Main product category filter
- `marketIds`: List<`string`>, nullable — Market IDs filter
- `orderIds`: List<`string`>, nullable — Order ID filter
- `orderLineDeliveryStatuses`: List<`string`>, nullable — Order line delivery status filter
- `orderLineProperties`: List<`OmniumPropertyItem`>, nullable — Order line properties filter
- `orderNumbers`: List<`string`>, nullable — Order number filter
- `orderProperties`: List<`OmniumPropertyItem`>, nullable — Order properties filter
- `orderStatuses`: List<`string`>, nullable — Order status filter
- `orderTypes`: List<`string`>, nullable — Order type filter
- `page`: integer (int32) — Page number of the search results.
- `parentIds`: List<`string`>, nullable — Parent ID filter
- `paymentMethodNames`: List<`string`>, nullable — Payment method name filter
- `paymentStatuses`: List<`string`>, nullable — Payment status filter
- `pickupWarehouseCodes`: List<`string`>, nullable — Pickup warehouse codes filter
- `postalCodes`: List<`string`>, nullable — Postal code filter
- `productCategory`: List<`string`>, nullable — Product category name filter
- `productGenders`: List<`string`>, nullable — Gender filter
- `productIds`: List<`string`>, nullable — Product ID filter
- `productNames`: List<`string`>, nullable — Product name filter
- `productTypes`: List<`string`>, nullable — Product type filter
- `promotionNames`: List<`string`>, nullable — Promotion name filter
- `salesPersonIds`: List<`string`>, nullable — Sales person ID filter
- `salesPersonNames`: List<`string`>, nullable — Sales person name filter
- `searchText`: string, nullable — Free text search
- `shipmentDeliveryTypes`: List<`string`>, nullable — Shipment delivery types filter (Pickup / Delivery)
- `shippingMethodNames`: List<`string`>, nullable — Shipping method name filter
- `sizes`: List<`string`>, nullable — Size filter
- `skuIds`: List<`string`>, nullable — SkuID filter
- `sortOrder`: string, nullable — Sort order
- `storeIds`: List<`string`>, nullable — Store IDs filter
- `supplierNames`: List<`string`>, nullable — Supplier name filter
- `take`: integer (int32) — Number of records to retrieve per page.
- `warehouseCodes`: List<`string`>, nullable — Warehouse codes filter

---


## OmniumAnalyticsPayment

**Fields:**

- `paymentDisplayName`: string, nullable
- `paymentMethodName`: string, nullable
- `paymentStatus`: string, nullable

---


## OmniumAnalyticsReturnOrder

**Fields:**

- `created`: string (date-time)
- `returnOrderId`: string, nullable
- `rmaNumber`: string, nullable

---


## OmniumAnalyticsShipment

**Fields:**

- `shipmentDeliveryType`: string, nullable
- `shipmentTrackingLink`: string, nullable
- `shipmentTrackingNumber`: string, nullable
- `shippingLabel`: string, nullable
- `shippingMethodName`: string, nullable

---


## OmniumExchangeOrderOptions

Options for creating an exchange order from a return

**Fields:**

- `additionalPayments`: List<`OmniumPayment`>, nullable — If the exchange item(s) cost more then the original item, you must provide additional payments
- `exchangeOrderId`: string, nullable — Optional: Specify the ID which the newly created exchange order will get. If not specified, Omnium w
- `exchangeOrderLines`: List<`OmniumOrderLine`>, nullable — The order lines that will be purchased in the new exchange order - not the returned items. So if you
- `orderStatus`: string, nullable — Order status that the exchange order should be set to (New or Completed for instance)
- `orderType`: string, nullable — Specify which order type the replacement order should be. If not provided, it will be the same type 
- `outboundWarehouseCode`: string, nullable — Optional: The warehouse code to be used for the exchange order.  If not provided, it is inherited fr
- `shippingMethodName`: string, nullable — Optional: The shipping method which should be used for the exchange order If not set, the shipping m
- `storeId`: string, nullable — Optional: Explicitly sets the Store ID for the exchange order.  Priority order:  1. This value.  2. 

---


## OmniumGiftCard

Class for Gift card payment

**Fields:**

- `balance`: number (decimal) — Current balance on gift card
- `closed`: string (date-time), nullable — Date for when the gift card was closed
- `created`: string (date-time), nullable — Gift card created date
- `currency`: string, nullable — Gift card currency
- `customerEmail`: string, nullable — Customer email
- `customerId`: string, nullable — Unique customerId
- `customerName`: string, nullable — Name of customer
- `description`: string, nullable — Description
- `externalIds`: List<`OmniumExternalId`>, nullable — External ids
- `giftCardCode`: string, nullable — Gift card code/number
- `id`: string, nullable — Gift card id
- `isClosed`: boolean, nullable — Is gift card closed/not usable
- `marketId`: string, nullable — The market the gift card originates from.
- `modified`: string (date-time), nullable — Last modified date
- `transactions`: List<`OmniumGiftCardTransaction`>, nullable — Transactions, used to show the history of the gift card.
- `type`: → `OmniumGiftCardType`
- `validUntil`: string (date-time), nullable — Gift card valid date

---


## OmniumGiftCardOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumGiftCard`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumGiftCardOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumGiftCard`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumGiftCardSearchRequest

**Fields:**

- `createdFrom`: string (date-time), nullable — GiftCard created from date
- `createdTo`: string (date-time), nullable — GiftCard created before date
- `giftCardCodes`: List<`string`>, nullable — Search by multiple gift card codes.
- `isExpired`: boolean, nullable — Filter by gift cards expired or not.
- `marketId`: string, nullable — Filter by gift card created in specific market.
- `marketIds`: List<`string`>, nullable — Filter by gift cards created in specific markets.
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `take`: integer (int32) — Number of items to take

---


## OmniumGiftCardTransaction

Transactions on gift cards

**Fields:**

- `amount`: number (decimal) — Amount of the transaction, in the given Currency.
- `amountInGiftCardCurrency`: number (decimal), nullable — The amount given in the gift card currency, in case the transaction was made in a different currency
- `currency`: string, nullable — The currency of the transaction. If null, the currency is the same as for the gift card.
- `date`: string (date-time) — The time when the transaction was made.
- `description`: string, nullable — Optional explanation of the transaction.
- `exchangeRate`: number (decimal), nullable — The exchange rate used to convert the amount to the gift card currency.
- `id`: string, nullable — The id of the transaction.
- `reference`: string, nullable — Reference to where the transaction originated from. E.g. order number og receipt number.
- `salesPersonId`: string, nullable — The id of the sales person who made the transaction, if originates from pos.
- `storeId`: string, nullable — In which store this transaction was made.

---


## OmniumGiftCardType

**Enum values:** `['GiftCard', 'CreditNote']`

---


## OmniumOrder

Omnium order object

**Fields:**

- `assets`: List<`OmniumAsset`>, nullable — Order assets (documents, media, files)
- `billingAddress`: → `OmniumOrderAddress`
- `billingCurrency`: string, nullable — Currency of the order. e.g. "USD","NOK"
- `completed`: string (date-time), nullable — CALCULATED: Order completed date
- `contactPerson`: → `OmniumContactPerson`
- `created`: string (date-time) — The creation date of the order
- `customerClubMemberId`: string, nullable — If Customer is member of customer club, set Customer ID as member ID.
- `customerContact`: string, nullable — Customer contact person
- `customerEmail`: string, nullable — Customer e-mail
- `customerId`: string, nullable — The ID of the customer that has placed the order. Typically this is set to the customers phone numbe
- `customerName`: string, nullable — Full name of customer
- `customerNumber`: string, nullable — In most cases, the customer number could be set to the same value as the CustomerId. However, in som
- `customerPhone`: string, nullable — Customer phone number with prefix. e.g. +4740000000
- `customerPickupDeadline`: string (date-time), nullable — CALCULATED: Customer deadline for picking up order
- `customerReference`: string, nullable — Reference provided by customer.
- `customerRequisition`: string, nullable — Customer requisition provided by customer
- `customerType`: string, nullable — B2B or B2C (Business customer or private customer)
- `discountTotalIncVat`: number (decimal) — (OBSOLETE: Use property on OrderForm instead) Total order discount
- `errors`: List<`OmniumEntityError`>, nullable — List of errors on the current order.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external IDs. External IDs are visible in Omnium's UI and useful for display, searching and 
- `followUpDate`: string (date-time), nullable — Order follow-up date
- `groups`: List<`OmniumOrderGroup`>, nullable — Order line groups
- `id`: string, nullable — Unique order ID. This must and will be unique across all markets defined in Omnium.
- `invoiceComment`: string, nullable — Invoice comment
- `isNewCustomer`: boolean, nullable — Indicates whether the customer is new. Set automatically by the workflow if the customer's creation 
- `isNotificationsDisabled`: boolean — If true, Omnium's notifications will not be triggered for the order
- `isReadOnly`: boolean — If true, the order is not editable in Omnium. Typically used for completed PoS orders, historic data
- `lineItemsCost`: number (decimal) — Calculated: Total cost of the order. The cost price
- `marketId`: string, nullable — Market ID e.g. "US", "NOR", "SWE". This must match the value of the market(s) defined in Omnium.
- `modified`: string (date-time) — CALCULATED: Order last modified date
- `modifiedBy`: string, nullable — CALCULATED: Modified by
- `netTotal`: number (decimal) — Calculated: OrderForm total - returnForms total
- `netTotalExclTax`: number (decimal) — Calculated: OrderForm total excl tax - returnForms total excl tax
- `nextOrderStatus`: string, nullable — Status order should be moved to. (Updated by UpdateOrderStatusScheduledTask)
- `orderForm`: → `OmniumOrderForm`
- `orderNotes`: List<`OmniumComment`>, nullable — Order comments, for internal use / not for customer
- `orderNumber`: string, nullable — In most cases, this property will be identical to the Id property. However, if you have orders from 
- `orderOrigin`: string, nullable — The origin of the order should identify where the order was created. Typical values are "OMS", "ERP"
- `orderType`: string, nullable — Order type e.g. "Online", "Pos". The order type must match a order type defined in the Omnium order 
- `paymentTermsNet`: integer (int32), nullable — Net payment terms (in days). Used for invoice due dates.
- `paymentType`: string, nullable — OBSOLETE: Use orderForm.payments instead.
- `projectId`: string, nullable — OBSOLETE: Use ProjectIds instead. Project ID - used if order is part of a project
- `projectIds`: List<`string`>, nullable — Project IDs - used if order is part of projects
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `publicOrderNotes`: List<`OmniumComment`>, nullable — Order comments, visible for customer
- `readyForPickup`: string (date-time), nullable — Calculated: When the order was set to ready for pickup. The property can be set by workflow step wit
- `received`: string (date-time), nullable — The received date of the order
- `relatedOrders`: List<`string`>, nullable — List of related order IDs
- `remainingPayment`: number (decimal) — CALCULATED: The remaining payment amount if the difference between the authorized amount and total a
- `replacementOrderIds`: List<`string`>, nullable — List of replacement order IDs for this order
- `requestedDeliveryDate`: string (date-time), nullable — Delivery date requested by customer
- `returnOrderForms`: List<`OmniumReturnOrderForm`>, nullable — The returns for the current order. An order could have one or multiple return order forms.
- `salesChannel`: string, nullable — Name of sales channel
- `salesPersonId`: string, nullable — Id of seller of the order - typically set to the e-mail of the user in Omnium, but could be set to a
- `salesPersonName`: string, nullable — Name of the seller of the order
- `secretKey`: string, nullable — A unique secret key for the order. Can be used for secure order lookups.
- `session`: string, nullable — Session code used for referencing a web session
- `shippingDiscountTotal`: number (decimal) — (OBSOLETE: Use property on OrderForm instead) Shipping discount amount
- `shippingSubTotal`: number (decimal) — Total shipping cost
- `status`: string, nullable — The current order status. This must match a status defined in the order settings in Omnium. Typical 
- `storeId`: string, nullable — The store Id identifies the store that sells the orders. Should match an ID of an existing store. A 
- `storePickDate`: string (date-time), nullable — CALCULATED: Employee deadline for picking order
- `subTotal`: number (decimal) — (OBSOLETE: Use property on OrderForm instead) Order total without shipment cost
- `subTotalExclTax`: number (decimal) — (OBSOLETE: Use property on OrderForm instead) Order total without shipment cost and without tax
- `subscriptionId`: string, nullable — Subscription ID - used if order is part of a subscription. The Id should match an existing subscript
- `tags`: List<`string`>, nullable — Order tags (Used by notification filters, and for grouping / filtering orders)
- `taxTotal`: number (decimal) — (OBSOLETE: Use property on OrderForm instead) Total tax amount
- `total`: number (decimal) — (OBSOLETE: Use property on OrderForm instead) Order total, including shipment cost, tax, and discoun
- `totalExclTax`: number (decimal) — (OBSOLETE: Use property on OrderForm instead) Order total, including shipment cost and discounts, bu
- `updateStatusDate`: string (date-time), nullable — Date when order should be moved to next status. (Updated by UpdateOrderStatusScheduledTask)
- `versionId`: string, nullable — Read only: Current version ID

---


## OmniumOrderActionExecutionResult

Result from single workflow action

**Fields:**

- `actionStatus`: string, nullable — "Success", "Warning or "Error".
- `actionType`: string, nullable — Order action type (e.g. "Notification", "CapturePayment", "ReduceInventory", etc)
- `cancelWorkflow`: boolean — Is this step cancelling further workflow execution
- `errorReason`: string, nullable — Error description
- `isInvisible`: boolean — True if workflow step and result should be hidden for end user
- `translateKey`: string, nullable — Translation key for result description

---


## OmniumOrderAddress

Order address

**Fields:**

- `apartmentNumber`: string, nullable — Apartment number e.g. "0402"
- `city`: string, nullable — City name
- `countryCode`: string, nullable — Country code for shipment e.g. "SE", "DK"
- `countryName`: string, nullable — Country name, e.g. "USA", "Norway" ...
- `daytimePhoneNumber`: string, nullable — Contact phone number
- `email`: string, nullable — Contact email
- `eveningPhoneNumber`: string, nullable — Contact phone number at evening
- `externalId`: string, nullable — If address has id from other external system
- `firstName`: string, nullable — Recipient first name
- `lastName`: string, nullable — Recipient last name
- `line1`: string, nullable — Address line 1
- `line2`: string, nullable — Address line 2
- `name`: string, nullable — Address name (Organization address name for B2B / FirstName + LastName for B2C)
- `organization`: string, nullable — Organization name
- `organizationalNumber`: string, nullable — Organization number (e.g. VAT number, company registration number)
- `phone`: string, nullable — Contact phone number
- `postalCode`: string, nullable — Postal / ZIP code
- `regionCode`: string, nullable — Region code for shipping
- `regionName`: string, nullable — Region name e.g. "Buskerud"
- `state`: string, nullable — State e.g. "Arizona", "California" etc.
- `streetNumber`: string, nullable — Street / House number - if not included in Line 1. See Customer settings

---


## OmniumOrderCommentRequest

Request model for adding a comment to an order

**Fields:**

- `commentText`: string, nullable — The comment text/message content
- `commentType`: → `OmniumCommentType`
- `createdBy`: string, nullable — The sender/creator of the comment (e.g., external user, system or sales channel). Defaults to the cu
- `emailBcc`: string, nullable — Email BCC recipients (semicolon separated)
- `emailCc`: string, nullable — Email CC recipients (semicolon separated)
- `emailFrom`: string, nullable — Email from address. Falls back to store's default email if not specified.
- `emailSubject`: string, nullable — Email subject line
- `emailTo`: string, nullable — Email recipient address. Falls back to order's customer email if not specified.
- `marketId`: string, nullable — Market ID (optional, uses order's market if not specified)
- `orderId`: string, nullable — Order ID
- `sendEmail`: boolean — Send email notification to customer
- `sendSms`: boolean — Send SMS notification to customer
- `senderName`: string, nullable — Sender display name for email and SMS notifications. Falls back to store's default sender name if no
- `smsPhoneNumber`: string, nullable — Phone number for SMS. Falls back to order's customer phone if not specified.
- `tags`: List<`string`>, nullable — Tags for categorizing/filtering comments

---


## OmniumOrderExportModel

Used for webhooks and export

**Fields:**

- `order`: → `OmniumOrder`
- `returnOrderForm`: → `OmniumReturnOrderForm`
- `shipment`: → `OmniumShipment`

---


## OmniumOrderExportRequest

Request model for exporting orders to a connector

**Fields:**

- `connectorId`: string, nullable — The connector ID to export orders to, for example "f60203b3-82fa-4f5c-8578-7777d4faf5e4", "19527b9b-
- `connectorName`: string, nullable — Exporter name, the name of the exporter for example "inretrn", "sitoo"
- `orderIds`: List<`string`> **required** — List of order IDs to export

---


## OmniumOrderForm

Order form, containing shipments, payments and line items for order

**Fields:**

- `authorizedPaymentTotal`: number (decimal) — Total amount authorized by payment providers
- `capturedPaymentTotal`: number (decimal) — Total amount captured by payment providers
- `cartId`: string, nullable — Unique ID of cart
- `cartName`: string, nullable — Name of cart / offer, such as "A special offer for a special customer". This is typically used in sc
- `charges`: List<`OmniumCharge`>, nullable — Obsolete: Add order lines instead. A list of additional charges for the order
- `couponCodes`: List<`string`>, nullable — List of CouponCodes added by user
- `creditPaymentTotal`: number (decimal) — Total amount credited by payment providers
- `discountAmount`: number (decimal) — Calculated: Total discount amount
- `discounts`: List<`OmniumDiscount`>, nullable — All discounts
- `fullRefund`: boolean — True if order should be fully refunded
- `grossRoundoff`: number (decimal), nullable — Set by external systems. Is added to orderform.total.
- `handlingTotal`: number (decimal) — Cost of handling
- `isPriority`: boolean, nullable — Possible to mark the order with priority
- `lineItems`: List<`OmniumOrderLine`>, nullable — All order lines / products
- `orderLevelTax`: number (decimal) — Order level tax amount
- `payments`: List<`OmniumPayment`>, nullable — All order payments
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `purchaseOrderId`: string, nullable — Purchase order ID (if order was created from a purchase order)
- `shipments`: List<`OmniumShipment`>, nullable — All order shipments
- `shippingCreditedTotal`: number (decimal) — Calculated: Total shipping cost credited
- `shippingDiscountTotal`: number (decimal) — Calculated:Total shipping discounts
- `shippingSubTotal`: number (decimal) — Calculated: Shipping cost without discounts
- `shippingSubTotalExclTax`: number (decimal) — Calculated: shipping cost without discounts excl tax
- `shippingTotal`: number (decimal) — Calculated: Total shipping cost.
- `subTotal`: number (decimal) — Calculated: Order total without shipment cost
- `subTotalExclTax`: number (decimal) — Calculated: Order total without shipment cost and without tax
- `taxTotal`: number (decimal) — Calculated: Total tax amount (line item level and order level)
- `total`: number (decimal) — Calculated: Order total, including shipment cost, tax, and discounts
- `totalExclTax`: number (decimal) — Calculated: Order total, including shipment cost and discounts, but without tax

---
