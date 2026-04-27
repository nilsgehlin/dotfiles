# Order Schemas — OmniumOrderSearchRequest to OmniumProjectChangeOrder

## OmniumOrderSearchRequest

Order search request

**Fields:**

- `completedFrom`: string (date-time), nullable — Orders completed from date
- `completedTo`: string (date-time), nullable — Orders completed before date
- `contactPersonEmail`: string, nullable — Contact person e-mail
- `contactPersonPhone`: string, nullable — Contact person phone number
- `createdFrom`: string (date-time), nullable — Orders created from date
- `createdTo`: string (date-time), nullable — Orders created before date
- `customerContact`: string, nullable — Customer contact person
- `customerId`: string, nullable — Customer Id
- `customerIds`: List<`string`>, nullable — Customer Ids
- `customerName`: string, nullable — Customer name
- `customerNumber`: string, nullable — Customer Number
- `disableFacets`: boolean, nullable — Set to true to disable facet generation. Disabling facets will improve performance and reduce data p
- `email`: string, nullable — Customer e-mail
- `excludedShipmentExternalIdProviders`: List<`string`>, nullable — Exclude orders where all shipments has external Ids from given providers
- `excludedStatuses`: List<`string`>, nullable — Exclude orders with given statuses
- `excludedTags`: List<`string`>, nullable — Filter by excluding tags
- `externalIds`: List<`string`>, nullable — Search orders with external IDs
- `followUpDateFrom`: string (date-time), nullable — Orders with follow-up from date
- `followUpDateTo`: string (date-time), nullable — Orders with follow-up to date
- `futureDeliveries`: boolean — Only show future deliveries (orders with future requested delivery date)
- `hasErrors`: boolean — Only show orders with errors
- `inventoryStatus`: string, nullable — Limit search to inventory status ("InStock", "PartiallyInStock", "NotInStock")
- `modifiedFrom`: string (date-time), nullable — Orders modified from date
- `modifiedTo`: string (date-time), nullable — Orders modified before date
- `orderNumber`: string, nullable — Order number or order ID
- `orderType`: string, nullable — Limit to single order type
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `paymentStatuses`: List<`string`>, nullable — Limit search to payment statuses ("OverPaid", "Paid", "NotPaid" or "PartiallyPaid")
- `paymentTransactionDateFrom`: string (date-time), nullable — Filter orders by payment transaction by date (from)
- `paymentTransactionDateTo`: string (date-time), nullable — Filter orders by payment transaction by date (to)
- `paymentTransactionStatus`: string, nullable — Filter orders by payment transaction status ("Failed" for instance)
- `paymentTransactionTypes`: List<`string`>, nullable — Filter orders by payment transaction types ("Authorization", "Capture" for instance)
- `phone`: string, nullable — Customer phone number
- `picklistIds`: List<`string`>, nullable — Only orders which appear on the pick list.
- `productNumbers`: List<`string`>, nullable — Limit to orders containing selected product numbers
- `productSerialNumbers`: List<`string`>, nullable — Limit to order containing selected product serial numbers
- `productTypes`: List<`string`>, nullable — Limit to order containing selected product types
- `projectId`: string, nullable — Search orders by project ID
- `properties`: List<`OmniumPropertyItem`>, nullable — Search orders by properties, value, key, keyGroup or valueType
- `property`: → `OmniumPropertyItem`
- `readyForPickupFrom`: string (date-time), nullable — Orders ready to pick up from date
- `readyForPickupTo`: string (date-time), nullable — Orders ready to pick up before date
- `salesChannels`: List<`string`>, nullable — Sales channels
- `salesPersonId`: string, nullable — Sales person ID (e-mail of Omnium user)
- `searchText`: string, nullable — Free search text
- `secretKey`: string, nullable — Search by order secret key
- `selectedDiscounts`: List<`string`>, nullable — Limit to orders containing selected discounts
- `selectedMarkets`: List<`string`>, nullable — Limit search by market IDs
- `selectedStatuses`: List<`string`>, nullable — Limit search to selected order statuses
- `selectedStores`: List<`string`>, nullable — Limit search by store IDs
- `shipmentExternalIds`: List<`string`>, nullable — Search orders with shipment external IDs
- `shippingMethodName`: string, nullable — Shipping method name
- `shippingMethodNames`: List<`string`>, nullable — Shipping method names
- `showOrdersWithAuthExpires`: boolean — Search orders with payment authorize about to expire
- `sortOrder`: string, nullable — Sort order for the results. Defaults to created date descending. Possible values: CreatedAscending, 
- `subscriptionId`: string, nullable — Search orders by subscription ID
- `tags`: List<`string`>, nullable — Filter by tags
- `take`: integer (int32) — Number of orders to take
- `urgent`: boolean — Urgent orders (pick limit or pickup limit exceeded)

---


## OmniumOrderSettings

**Fields:**

- `availableManualWorkflowSteps`: List<`OmniumOrderWorkflowStep`>, nullable
- `defaultExchangeTerms`: string, nullable
- `defaultReplacementOrderType`: string, nullable — If set, replacement orders that are created will get this type. If not set, the type will be inherit
- `giftCardCompletedStatus`: string, nullable
- `giftCardSku`: string, nullable
- `giftCardTemplate`: string, nullable
- `includedOrderTypesForRevenueStats`: List<`string`>, nullable — If set, these order types will be included in key numbers, average order values and revenue stats. I
- `isInvoiceOriginal`: boolean
- `isOrderCalculatorRunOnImport`: boolean
- `orderLineSettings`: → `OmniumOrderLineSettings`
- `replacementSettings`: → `OmniumReplacementSettings`
- `returnSettings`: → `OmniumReturnSettings`
- `shouldCustomerExternalIdsBeSavedOnOrder`: boolean
- `shouldCustomerPropertiesBeSavedOnOrder`: boolean
- `shouldOrderExternalIdsBeSavedOnCustomer`: boolean
- `shouldOrderMarketIdBeSavedOnCustomer`: boolean
- `shouldOrderPropertiesBeSavedOnCustomer`: boolean
- `shouldOrderStoreIdBeSavedOnCustomer`: boolean
- `showOrderLinesExTax`: boolean
- `showOrderTotalsExTax`: boolean
- `tagSettings`: List<`OmniumTagSettings`>, nullable
- `uneditableExternalIDs`: boolean
- `useStatsOrderQueues`: boolean — If set, orders will be copied to statsOrders

---


## OmniumOrderStatus

**Fields:**

- `availableSteps`: List<`string`>, nullable — List of available next order statuses. Used if EnforceAvailableStepsPolicy is set to true
- `condition`: string, nullable — Condition for showing order status (if more statuses has the same sort order)
- `displayName`: string, nullable — Alternative order status name
- `enforceAvailableStepsPolicy`: boolean, nullable — Set to true if selectable order statues should be retrived from AvailableSteps property.
- `isCanceledStatus`: boolean — True if orders with this status are canceled
- `isDeliveredStatus`: boolean — True if orders with this status are delivered to customer
- `isInProgressStatus`: boolean — True if orders with this status are in progress
- `isMainFilter`: boolean — Is main filter
- `isPicked`: boolean — True if orders with this status are canceled. Used by picklist to set correct status when order is r
- `mainOrderStatus`: string, nullable — If all shipments(split shipment orders) on the order has same status, order will be updated to MainO
- `name`: string, nullable — Order status name
- `order`: integer (int32) — Status sort order index
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `shipmentStatusUpdate`: string, nullable — If set, the shipments on order will get this status
- `translateKey`: string, nullable — Translation key for order status
- `updateStatusButtonIsDisabledInGui`: boolean — If true, the button for updating to the next order status will be disabled
- `workflowSteps`: List<`OmniumOrderWorkflowStep`>, nullable — Workflow steps to run

---


## OmniumOrderStatusLogItem

Represents a single step in an order's status timeline, including the timestamp of the status change and the duration since the previous step.

**Fields:**

- `durationSincePreviousMs`: integer (int64), nullable — The duration in milliseconds since the previous status was recorded. Null for the first status.
- `status`: string, nullable — The status the order entered at this point in the timeline.
- `timestamp`: string (date-time) — The exact time when the order first entered this status. Stored in UTC.

---


## OmniumOrderType

**Fields:**

- `defaultExternalIdProvider`: string, nullable — External ID provider (Added to list of external IDs)
- `defaultOrderType`: boolean — True if order is default. Autofilter by default types in order list.
- `deriveOrderStatusFromShipments`: boolean — When enabled, order head status is derived from the main status of the highest qualifying sort order
- `disableWorkflow`: boolean — Temporary disable workflow for order type
- `enableCreateFromCart`: boolean — True if it is possible to create order type from cart
- `enableEdit`: boolean — Is order editable in GUI
- `name`: string, nullable — Order type name (E.g. Online, ClickAndCollect, Pos, etc)
- `orderStatuses`: List<`OmniumOrderStatus`>, nullable — List of available order statuses

---


## OmniumOrderWorkflowExecutionPatchResult

Order workflow execution result

**Fields:**

- `isAborted`: boolean — True if workflow failed and is aborted
- `orderActionExecutionResults`: List<`OmniumOrderActionExecutionResult`>, nullable — List of action results
- `orderPatch`: → `OmniumOrderPatch`

---


## OmniumOrderWorkflowExecutionResult

Order workflow execution result

**Fields:**

- `isAborted`: boolean — True if workflow failed and is aborted
- `order`: → `OmniumOrder`
- `orderActionExecutionResults`: List<`OmniumOrderActionExecutionResult`>, nullable — List of action results

---


## OmniumOrderWorkflowStep

**Fields:**

- `acceptText`: string, nullable — Text on accept button (moving forward to the next step)
- `active`: boolean — True if step should be run
- `connector`: string, nullable — Connector to use for workflow step
- `current`: boolean — True if this step is the current workflow step
- `dateCompleted`: string (date-time), nullable — Date the step was completed (if null, the step was never completed)
- `dateText`: string, nullable — Text describing a date input. User should be able to add date if this property has value.
- `declineText`: string, nullable — Text on decline button (moving backwards to the previous step)
- `description`: string, nullable — Description of the step (what should be done by users during this step)
- `disabledForMarkets`: List<`string`>, nullable — List of market IDs where the workflow step should be disabled (overrides enabled property)
- `disabledForShipmentOptions`: List<`string`>, nullable — List of shipmentOptionNames where the workflow step should be disabled (overrides enabled property)
- `disabledForStores`: List<`string`>, nullable — List of storeIds where the workflow step should be disabled (overrides enabled property)
- `disabledForWarehouses`: List<`string`>, nullable — List of warehouses where this workflow step should be disabled (overrides enabled property)
- `enabledForMarkets`: List<`string`>, nullable — List of markets where this workflow step should be enabled (all markets available if empty)
- `enabledForShipmentOptions`: List<`string`>, nullable — List of shipmentOptionNames where this workflow step should be enabled (all shipmentOptions availabl
- `enabledForStores`: List<`string`>, nullable — List of storeIds where this workflow step should be enabled (all stores available if empty)
- `enabledForWarehouses`: List<`string`>, nullable — List of warehouses where this workflow step should be enabled (all warehouses available if empty)
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external order IDs
- `hiddenFromCustomer`: boolean — If step should be hidden from customer
- `hiddenFromPartner`: boolean — If step should be hidden from partner
- `id`: string, nullable — Step ID (provided by Omnium)
- `index`: integer (int32) — Index (for sorting)
- `isCommentsDisabled`: boolean — If user should be able to enter comments on this step
- `isInvisible`: boolean — True if result should not be shown in GUI
- `name`: string, nullable — Workflow step name
- `properties`: List<`OmniumPropertyItem`>, nullable — Workflow step properties
- `runAfterOrderIsSaved`: boolean — True if step should run after order is saved
- `startDate`: string (date-time), nullable — Date the step was started
- `stopOnError`: boolean — If true, the workflow will continue if current step fails to execute
- `translateKey`: string, nullable — Translation key for workflow step name
- `workflowStepConditions`: List<`OmniumOrderWorkflowStepCondition`>, nullable — Workflow conditions

---


## OmniumOrderWorkflowStepCondition

**Fields:**

- `type`: string, nullable

---


## OmniumPayment

Represents a payment transaction on an order or cart.
Each payment record represents a single transaction with a payment provider.
An order can have multiple payments (e.g., partial payment with gift card + credit card).
            
Payment flow:
1. Customer completes checkout in your storefront
2. Frontend initiates payment with the provider (Klarna, Vipps, etc.)
3. Provider returns transaction details (TransactionId, Amount, Status)
4. Frontend calls Omnium API to register the payment on the cart
5. Cart is placed as an order
6. Omnium can later capture, refund, or void the payment through the provider
            
Multiple payments: When an order has multiple payments (e.g., gift card + Klarna),
they are processed in the order they appear in the payments list.

**Fields:**

- `amount`: number (decimal) — The monetary amount for this payment transaction. For Authorization: The reserved/authorized amount 
- `authorizationCode`: string, nullable — Authorization code returned by the payment provider. Used for reference and reconciliation with the 
- `authorizationExpires`: string (date-time), nullable — Expiration date/time for the authorization from the payment provider. After this date, the authoriza
- `comment`: string, nullable — Free-text comment or note about the payment. Useful for manual payments or special circumstances.
- `created`: string (date-time), nullable — Timestamp when this payment record was created/registered in Omnium.
- `customerName`: string, nullable — Name of the customer associated with this payment.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external system identifiers for this payment. Useful for linking the payment to records in E
- `id`: string, nullable — Unique identifier for this specific payment record in Omnium. Different from TransactionId which is 
- `implementationClass`: string, nullable — Not in use - reserved for internal purposes.
- `internalReference`: string, nullable — Internal reference for linking this payment to other business documents. Can be used for RMA numbers
- `invoiceId`: string, nullable — Reference to an invoice if this payment is linked to an invoice document. Used for invoice-based pay
- `isManuallyAdded`: boolean — Indicates if this payment was manually added through the Omnium UI rather than from a payment provid
- `orderLineReferences`: List<`OmniumPaymentOrderLineReference`>, nullable — References to order line items associated with this payment. Used to correlate credit/refund payment
- `paidDate`: string (date-time), nullable — The original date when the payment was made. May differ from Created if the payment was pre-paid or 
- `paymentId`: integer (int32) — Deprecated. Use TransactionId instead.
- `paymentMethodId`: string (uuid) — Deprecated. Use PaymentMethodName instead.
- `paymentMethodName`: string, nullable — Identifies the payment provider. Must match a configured provider name in Omnium. Examples: "Klarna"
- `paymentType`: string, nullable — Sub-type or method within the payment provider. Examples: "Invoice", "Card", "Swish", "DirectDebit" 
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties for provider-specific data or additional metadata. Can store any key-value pairs n
- `reason`: string, nullable — Description or reason for the payment, especially useful for refunds/credits. Example: "Return of da
- `shipmentId`: string, nullable — The shipment ID this payment is associated with. Used when payments are split across multiple shipme
- `status`: string, nullable — Current status of this payment transaction. Values: - "Processed": Transaction completed successfull
- `storeId`: string, nullable — The store or warehouse ID associated with this payment. Used for multi-store scenarios where payment
- `transactionId`: string, nullable — Unique transaction identifier from the payment provider. This is the provider's reference for the tr
- `transactionType`: string, nullable — The type of payment transaction.              Common values for API consumers: - "Authorization": Pa
- `validationCode`: string, nullable — Deprecated. Not in use.

---


## OmniumPaymentFilters

Payment transaction filters - Specified filters for selecting one or more payments

**Fields:**

- `ids`: List<`string`>, nullable — Id
- `paymentMethodNames`: List<`string`>, nullable — Payment method name
- `statuses`: List<`string`>, nullable — Payment status, e.g. "Processed", "Failed"
- `transactionIds`: List<`string`>, nullable — Payment ID from provider
- `transactionTypes`: List<`string`>, nullable — Transaction type, e.g. "Authorization", "Capture", "Credit", etc...

---


## OmniumPaymentOption

Class for diffenret payment options

**Fields:**

- `apiToken`: string, nullable — Provider token
- `authorizationBaseUrl`: string, nullable — Url to authorization(if differ from BaseUrl) payment provider
- `authorizationTimeInDays`: integer (int32) — Default expiration time in days for authorization amount
- `baseUrl`: string, nullable — Url to payment provider
- `clientId`: string, nullable — Provider ClientId/key
- `displayInCart`: boolean — Visible in a cart/checkout
- `displayName`: string, nullable — Friendly name for payment option
- `editable`: boolean — Possible to change props
- `isEmptyPayment`: boolean — Used if this is dummy provider(not going to 3 party)
- `logoUrl`: string, nullable — Provider logo url
- `merchantId`: string, nullable — Provider id
- `name`: string, nullable — Name of the payment option/provider
- `paymentMethodName`: string, nullable — Unique name to identify this payment option.
- `providerName`: string, nullable — Unique name to identify this payment option if PaymentMethodName needs to be something special. If P
- `termsUrl`: string, nullable — Url to website payment terms

---


## OmniumPaymentOrderLineReference

References an order line item associated with a payment.
Used to correlate credit/refund payments with specific line items on return orders.

**Fields:**

- `lineItemId`: string, nullable — The line item ID this payment is associated with.

---


## OmniumPaymentPatch

Payment transaction

**Fields:**

- `amount`: number (decimal), nullable — Total payment amount
- `authorizationCode`: string, nullable — Payment provider authorization code / transaction id
- `authorizationExpires`: string (date-time), nullable — Date from external payment provider when payment will expire (for capture)
- `comment`: string, nullable — Comment
- `created`: string (date-time), nullable — When the payment was created/registered
- `customerName`: string, nullable — Name of customer
- `externalIds`: List<`OmniumExternalId`>, nullable — External IDs
- `id`: string, nullable — Unique for each transaction
- `internalReference`: string, nullable — Internal reference (RMA number, order number, etc)
- `isManuallyAdded`: boolean, nullable — If user added payment transaction in gui, not from provider
- `paidDate`: string (date-time), nullable — Original date of payment. Could differ from "Created" if it has been pre-paid for instance
- `paymentMethodId`: string (uuid), nullable — Payment GUID
- `paymentMethodName`: string, nullable — Provider ID
- `paymentType`: string, nullable — Payment type e.g. "Invoice", ""
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `reason`: string, nullable — Description / reason for the payment
- `shipmentId`: string, nullable — ShipmentId for this transaction
- `status`: string, nullable — Payment status
- `storeId`: string, nullable — StoreId/WarehouseId for this transaction
- `transactionId`: string, nullable — Payment ID for provider
- `transactionType`: string, nullable — Transaction type, e.g. "Authorization", "Capture", "Credit", etc...
- `validationCode`: string, nullable — Not in use

---


## OmniumPaymentRefund

Represents a payment method used for refund transactions.

**Fields:**

- `amount`: number (decimal) — Total amount refunded through this payment method.
- `count`: integer (int32) — Number of refund transactions using this payment method.
- `name`: string, nullable — Name of the payment method used for refund.
- `subPayments`: List<`OmniumSubPayment`>, nullable — Breakdown of refund payment method into sub-categories (optional).

---


## OmniumPaymentReportSearchRequest

Search request object for payment transactions

**Fields:**

- `createdFrom`: string (date-time), nullable — Transaction created date from
- `createdTo`: string (date-time), nullable — Transaction created date to
- `marketIds`: List<`string`>, nullable — Transaction market Ids
- `paidFrom`: string (date-time), nullable — Transaction paid date from
- `paidTo`: string (date-time), nullable — Transaction paid date to
- `paymentMethodName`: string, nullable — Payment method
- `storeIds`: List<`string`>, nullable — Transaction store Ids

---


## OmniumPaymentSummary

Payment summary report

**Fields:**

- `orderStoreId`: string, nullable — Order store id
- `paymentDate`: string (date-time) — Payment date
- `paymentMethod`: string, nullable — payment method
- `taxRates`: List<`OmniumPaymentSummaryTaxRate`>, nullable — Total captured and credited per tax rate
- `totalCreditedExclVat`: number (decimal) — Total credited excl VAT
- `totalCreditedInclVat`: number (decimal) — Total credited incl VAT
- `totalExclVat`: number (decimal) — Total excl VAT
- `totalInclVat`: number (decimal) — Total incl VAT

---


## OmniumPaymentSummaryOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPaymentSummary`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPaymentSummaryTaxRate

Payment summary for tax rate

**Fields:**

- `taxRate`: number (decimal) — Tax rate
- `totalCapture`: number (decimal) — Total incl VAT
- `totalCredit`: number (decimal) — Total credited incl VAT

---


## OmniumPaymentTransaction

Payment transaction

**Fields:**

- `amount`: number (decimal) — Transaction amount
- `authorizationCode`: string, nullable — Payment authorization code
- `billingCurrency`: string, nullable — Billing Currency
- `comment`: string, nullable — Payment comment
- `created`: string (date-time), nullable — Payment transaction date
- `currencyCode`: string, nullable — Currency
- `customerName`: string, nullable — Customer name
- `externalIds`: string, nullable — Store External IDs
- `id`: string, nullable — Unique id for transaction
- `internalReference`: string, nullable — Internal reference
- `lineItems`: integer (int32) — Number of line items on order / shipment
- `orderCreated`: string (date-time) — Order date
- `orderNumber`: string, nullable — Order number
- `orderStoreId`: string, nullable — Store ID for the order
- `orderStoreName`: string, nullable — Store name for the order
- `orderTotal`: number (decimal) — Order total (all payments)
- `paidDate`: string (date-time), nullable — Payment Date
- `paymentMarketId`: string, nullable — Market ID for payment transaction
- `paymentMethodName`: string, nullable — Payment provider ID
- `paymentNumber`: string, nullable — Payment number
- `paymentProviderFee`: number (decimal) — Payment provider fee
- `paymentStoreId`: string, nullable — Store ID for payment transaction
- `paymentStoreName`: string, nullable — Store name for payment transaction
- `remainingPayment`: number (decimal), nullable — Remaining order payment
- `reservationId`: string, nullable — Payment reservation ID
- `salesChannel`: string, nullable — Sales channel
- `settlementReference`: string, nullable — Settlement reference
- `shipmentId`: string, nullable — Shipment ID triggering transaction
- `shippingLabel`: string, nullable — Shipping label
- `shippingTotal`: number (decimal) — Shipping total (shipping cost)
- `status`: string, nullable — Order / shipment status
- `transactionDate`: string (date-time), nullable — Date of transaction (In use for settlements only).
- `transactionId`: string, nullable — Payment provider transaction ID
- `transactionType`: string, nullable — Transaction type (Capture / Credit)

---


## OmniumPaymentTransactionOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPaymentTransaction`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPickList

A pick list for retrieving items from the warehouse.

**Fields:**

- `created`: string (date-time) — Date pick list was created (UTC).
- `id`: string, nullable — Unique ID.
- `modified`: string (date-time) — Date pick list was modified (UTC).
- `name`: string, nullable — Name of pickList.
- `pickListOrderItems`: List<`OmniumPickListOrderItem`>, nullable — The orders the items in this pick list appear on.
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties, key - value pairs.
- `status`: string, nullable — Status of the pick list.
- `warehouseCode`: string, nullable — Unique ID of warehouse.
- `warehouseName`: string, nullable — Name of warehouse.

---


## OmniumPickListOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPickList`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPickListOrderItem

**Fields:**

- `orderId`: string, nullable — ID of an order, .
- `shipmentId`: string, nullable — Id of a shipment.

---


## OmniumPickListPatch

**Fields:**

- `id`: string, nullable
- `properties`: List<`OmniumPropertyItem`>, nullable
- `status`: string, nullable

---


## OmniumPickListSearchRequest

PickList search request.

**Fields:**

- `createdFrom`: string (date-time), nullable — PickLists created from date.
- `createdTo`: string (date-time), nullable — PickLists created to date.
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take]).
- `sortOrder`: string, nullable — Sort order for the results. Defaults to created date descending. Possible values: CreatedAscending, 
- `take`: integer (int32) — Number of orders to take.

---


## OmniumPickUpPoint

**Fields:**

- `coordinate`: → `OmniumCoordinate`
- `deliveryAddress`: → `OmniumDeliveryaddress`
- `name`: string, nullable
- `openingHours`: List<`OmniumOpeninghour`>, nullable
- `routeDistance`: integer (int32)
- `routingCode`: string, nullable
- `servicePointId`: string, nullable
- `visitingAddress`: → `OmniumVisitingaddress`

---


## OmniumPickUpPointAddress

**Fields:**

- `city`: string, nullable
- `country`: string, nullable
- `countryCode`: string, nullable
- `postalCode`: string, nullable
- `street`: string, nullable
- `streetName`: string, nullable
- `streetNumber`: string, nullable

---


## OmniumPickUpPointOpeningHour

**Fields:**

- `day`: string, nullable
- `from`: string, nullable
- `to`: string, nullable

---


## OmniumProjectChangeOrder

Project change order

**Fields:**

- `approved`: string (date-time) — Approved date
- `approvedBy`: string, nullable — Approved by
- `cartIds`: List<`string`>, nullable — Cart IDs connected to project part
- `created`: string (date-time) — Date created
- `description`: string, nullable — Description of project part
- `id`: string, nullable — Project part unique identifier
- `modified`: string (date-time) — Date modified
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `status`: string, nullable — Project part status [Sent, Rejected, Approved, Cancelled]
- `tasks`: List<`OmniumProjectTask`>, nullable — Tasks for project part
- `title`: string, nullable — Project part title
- `transactionSummary`: → `OmniumProjectTransaction`
- `transactions`: List<`OmniumProjectTransaction`>, nullable — Project part level transactions

---
