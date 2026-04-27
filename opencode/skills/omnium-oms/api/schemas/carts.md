# Cart Schemas

## Schemas in this file

- [OmniumAddProductOptionRequestValue](#omniumaddproductoptionrequestvalue)
- [OmniumAddProductOptionsRequest](#omniumaddproductoptionsrequest)
- [OmniumCart](#omniumcart)
- [OmniumCartCommentRequest](#omniumcartcommentrequest)
- [OmniumCartOmniumResult](#omniumcartomniumresult)
- [OmniumCartOmniumSearchResult](#omniumcartomniumsearchresult)
- [OmniumCartOmniumValidationResult](#omniumcartomniumvalidationresult)
- [OmniumCartResponseModel](#omniumcartresponsemodel)
- [OmniumCartSearchRequest](#omniumcartsearchrequest)
- [OmniumCartTemplate](#omniumcarttemplate)
- [OmniumCartTemplateCreateCartRequest](#omniumcarttemplatecreatecartrequest)
- [OmniumCartTemplateOmniumSearchResult](#omniumcarttemplateomniumsearchresult)
- [OmniumCartTemplateSearchRequestModel](#omniumcarttemplatesearchrequestmodel)
- [OmniumCartUpdateRequest](#omniumcartupdaterequest)
- [OmniumProductOption](#omniumproductoption)
- [OmniumProductOptionValue](#omniumproductoptionvalue)
- [OmniumProductOptionValueViewModel](#omniumproductoptionvalueviewmodel)
- [OmniumProductOptionViewModel](#omniumproductoptionviewmodel)
- [OmniumProductOptionsViewModel](#omniumproductoptionsviewmodel)

---

## OmniumAddProductOptionRequestValue

Model used when creating product options

**Fields:**

- `price`: number (decimal), nullable — Optional: Set a price for the product option. If price is not specific, the price from the product s
- `skuId`: string, nullable — Sku of the product options
- `title`: string, nullable — Title of the product options
- `value`: string, nullable — Value of the product options

---

## OmniumAddProductOptionsRequest

For adding one or more product options to a product in cart

**Fields:**

- `cartId`: string **required** — Cart id for the existing cart
- `parentLineItemId`: string **required** — LineItemId for the existing product that you wish to add product options to
- `productOptions`: List<`OmniumAddProductOptionRequestValue`> **required** — The list of product options to add

---

## OmniumCart

The cart class is the main class used for handling both carts and offers given to a customer. Could be online carts, or offers from physical stores

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
- `customerGroups`: List<`string`>, nullable — Customer groups (for discount calculation)
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
- `expiredDate`: string (date-time), nullable — Expiration date of cart. If passed, the cart should not be visible to customer.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external IDs. External IDs are visible in Omnium's UI and useful for display, searching and 
- `followUpDate`: string (date-time), nullable — Order follow-up date
- `groups`: List<`OmniumOrderGroup`>, nullable — Order line groups
- `id`: string, nullable — Cart unique ID
- `ignorePromotions`: boolean, nullable — Should promotion prices be ignored when product is added to cart?
- `invoiceComment`: string, nullable — Invoice comment
- `isNewCustomer`: boolean, nullable — Indicates whether the customer is new. Set automatically by the workflow if the customer's creation 
- `isNotificationsDisabled`: boolean — If true, Omnium's notifications will not be triggered for the order
- `isReadOnly`: boolean — Should the cart be read only?
- `isReadOnlyByCustomer`: boolean — Should the order/cart be read only for the customer?
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
- `orderStatus`: string, nullable — Should be used when order needs a special status when created from cart
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

## OmniumCartCommentRequest

Request model for adding a comment to a cart

**Fields:**

- `cartId`: string, nullable — Cart ID
- `commentText`: string, nullable — The comment text/message content
- `commentType`: → `OmniumCommentType`
- `createdBy`: string, nullable — The sender/creator of the comment (e.g., external user, system or sales channel). Defaults to the cu
- `emailBcc`: string, nullable — Email BCC recipients (semicolon separated)
- `emailCc`: string, nullable — Email CC recipients (semicolon separated)
- `emailFrom`: string, nullable — Email from address. Falls back to store's default email if not specified.
- `emailSubject`: string, nullable — Email subject line
- `emailTo`: string, nullable — Email recipient address. Falls back to cart's customer email if not specified.
- `marketId`: string, nullable — Market ID (optional, uses cart's market if not specified)
- `sendEmail`: boolean — Send email notification to customer
- `sendSms`: boolean — Send SMS notification to customer
- `senderName`: string, nullable — Sender display name for email and SMS notifications. Falls back to store's default sender name if no
- `smsPhoneNumber`: string, nullable — Phone number for SMS. Falls back to cart's customer phone if not specified.
- `tags`: List<`string`>, nullable — Tags for categorizing/filtering comments

---

## OmniumCartOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumCart`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---

## OmniumCartOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumCart`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---

## OmniumCartOmniumValidationResult

**Fields:**

- `isValidatedSuccessful`: boolean
- `validationErrors`: List<`OmniumValidationError`>, nullable
- `validationMessage`: string, nullable
- `validationWarnings`: List<`OmniumValidationError`>, nullable
- `value`: → `OmniumCart`

---

## OmniumCartResponseModel

Cart response with validation

**Fields:**

- `cart`: → `OmniumCart`
- `validationResults`: → `OmniumValidationResult`

---

## OmniumCartSearchRequest

Cart search request

**Fields:**

- `changedSince`: string (date-time), nullable — Filter by changed date
- `createdFrom`: string (date-time), nullable — Filter by created from date
- `createdTo`: string (date-time), nullable — Filter by created to date
- `customerContact`: string, nullable — Filter by contact person
- `customerId`: string, nullable — Filter by customer
- `excludedTags`: List<`string`>, nullable — Exclude tags
- `followUpDateFrom`: string (date-time), nullable — Orders with follow-up from date
- `followUpDateTo`: string (date-time), nullable — Orders with follow-up to date
- `isActiveOnly`: boolean — Get only active carts
- `marketIds`: List<`string`>, nullable — Filter for market IDs
- `name`: string, nullable — Filter by cart name (Not to be confused with customer name)
- `orderTypes`: List<`string`>, nullable — Order types
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `projectId`: string, nullable — Filter by project
- `properties`: List<`OmniumPropertyItem`>, nullable — List with custom properties to search for
- `salesPersonId`: string, nullable — Filter by sales person ID
- `searchQuery`: string, nullable — Free text search query
- `sortOrder`: string, nullable — Sort order for the results. Defaults to modified date descending. Possible values: CreatedAscending,
- `statuses`: List<`string`>, nullable — Filter by cart statuses
- `storeIds`: List<`string`>, nullable — Filter for store IDs
- `tags`: List<`string`>, nullable — Filter by tags
- `take`: integer (int32) — Number of items to take

---

## OmniumCartTemplate

A cart templates contains a cart and meta data

**Fields:**

- `cart`: → `OmniumCart`
- `created`: string (date-time) — Created
- `id`: string, nullable — Cart template ID
- `modified`: string (date-time) — Modified
- `name`: string, nullable — Name of the cart template
- `properties`: List<`OmniumPropertyItem`>, nullable — Additional properties / meta data
- `salesPersonId`: string, nullable — Sales person ID
- `salesPersonName`: string, nullable — Sales person name

---

## OmniumCartTemplateCreateCartRequest

Cart template creation request

**Fields:**

- `cartTemplateId`: string, nullable — ID of the cart template that will be used to create a new cart

---

## OmniumCartTemplateOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumCartTemplate`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---

## OmniumCartTemplateSearchRequestModel

Cart templates search request

**Fields:**

- `cartTemplateId`: string, nullable — Filter by cart template ID
- `cartTemplateName`: string, nullable — Filter by cart template name
- `createdFrom`: string (date-time), nullable — Filter by creation from date
- `createdTo`: string (date-time), nullable — Filter by creation to date
- `page`: integer (int32) — Current page (for paging). Defaults to 1
- `query`: string, nullable — Free text query
- `salesPersonId`: string, nullable — Filter by sales person Id
- `take`: integer (int32) — Number of items to fetch. Defaults to 10

---

## OmniumCartUpdateRequest

**Fields:**

- `cartId`: string, nullable — ID of cart to edit
- `customerId`: string, nullable — CustomerId for the new cart - defaults to null
- `lineItemRequests`: List<`OmniumLineItemUpdateRequest`>, nullable — List of Product SKU ids and quantity (defaults to 1 if not provided). (Required)
- `marketId`: string, nullable — Market ID for new cart - default market if null
- `priceStoreId`: string, nullable — If set here, it applies to all items in LineItemRequests unless a specific {PriceStoreId} is provide
- `storeId`: string, nullable — Store ID for new cart - defaults to null

---

## OmniumProductOption

Additional options for a product

**Fields:**

- `isRequired`: boolean, nullable — Mark the product option as required
- `optionTitle`: string, nullable — Title of the option
- `prices`: List<`OmniumPrice`>, nullable — Product option specific prices (the prices will fall back to prices set on the original product if n
- `sku`: string, nullable — Sku reference for the product options
- `type`: string, nullable — Type of option
- `values`: List<`OmniumProductOptionValue`>, nullable — Available values for the product option

---

## OmniumProductOptionValue

The product option value is a pointer to a product in Omnium with the IsProductOption property set to 'true'

**Fields:**

- `maxSize`: number (decimal), nullable — Max input size for the text input type of option
- `sku`: string, nullable — Sku reference
- `title`: string, nullable — Title of the product option value
- `value`: string, nullable — Value

---

## OmniumProductOptionValueViewModel

The product option value is a pointer to a product in Omnium with the IsProductOption property set to 'true'.
The view model also contains a price, which is populated by the reference sku.

**Fields:**

- `maxSize`: number (decimal), nullable — Max input size for the text input type of option
- `price`: → `OmniumPrice`
- `sku`: string, nullable — Sku reference
- `title`: string, nullable — Title of the product option value
- `value`: string, nullable — Value

---

## OmniumProductOptionViewModel

Single product options view model

**Fields:**

- `isRequired`: boolean, nullable — If the product option should be mandatory for the product selected
- `optionTitle`: string, nullable — Title of the option
- `price`: → `OmniumPrice`
- `sku`: string, nullable — Sku reference
- `type`: string, nullable — Type of option
- `values`: List<`OmniumProductOptionValueViewModel`>, nullable — Available values for the product option, populated with prices

---

## OmniumProductOptionsViewModel

Product options view model, containing both product options and the reference product models

**Fields:**

- `productOptionViewModels`: List<`OmniumProductOptionViewModel`>, nullable — List of product options
- `products`: List<`OmniumProduct`>, nullable — Referenced product(s) from the product options

---
