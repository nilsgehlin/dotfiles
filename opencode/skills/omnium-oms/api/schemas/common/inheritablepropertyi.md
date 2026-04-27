# Common / Shared Schemas — OmniumInheritablePropertyItem to OmniumProjectPartner

## OmniumInheritablePropertyItem

**Fields:**

- `isCustomValueOptionAllowed`: boolean
- `isMultiSelectEnabled`: boolean
- `key`: string, nullable
- `keyGroup`: string, nullable
- `productLanguagesInheritValue`: boolean
- `readOnly`: boolean
- `siblingsInheritValue`: boolean
- `value`: string, nullable
- `valueOptions`: List<`string`>, nullable
- `valueType`: string, nullable
- `variantsInheritValue`: boolean

---


## OmniumInvoice

Invoices

**Fields:**

- `amount`: number (decimal) — In the order currency, typically USD, SEK, NOK.
- `amountExcludingTax`: number (decimal) — Amount excluding tax
- `amountOutstanding`: number (decimal) — The amount outstanding
- `amountRoundoff`: number (decimal) — Amount of round off to nearest integer
- `assets`: List<`OmniumAsset`>, nullable — Assets
- `comment`: string, nullable — Invoice comment
- `created`: string (date-time) — Created date
- `currency`: string, nullable — Invoice currency
- `customerAddress`: → `OmniumOrderAddress`
- `customerEmail`: string, nullable — Customer email
- `customerId`: string, nullable — Customer ID
- `customerName`: string, nullable — Customer name
- `customerType`: string, nullable — Customer type (Business / Private)
- `deliveryAddress`: → `OmniumOrderAddress`
- `deliveryDate`: string (date-time) — Deliver date
- `externalIds`: List<`OmniumExternalId`>, nullable — External IDs
- `id`: string, nullable — Invoice ID
- `invoiceDate`: string (date-time) — Invoice date
- `invoiceDueDate`: string (date-time) — Invoice due date
- `invoiceNumber`: string, nullable — Invoice number
- `invoiceSenderAddress`: → `OmniumOrderAddress`
- `invoiceType`: string, nullable — Invoice type [Ingoing, Outgoing, ]
- `isCreditNote`: boolean — True if invoice is a credit note
- `kid`: string, nullable — Invoice KID-number (Norwegian customer identification number)
- `lineItems`: List<`OmniumOrderLine`>, nullable — Invoiced order lines
- `marketId`: string, nullable — Invoice market ID
- `modified`: string (date-time) — Modified date
- `orderId`: string, nullable — Original order Id
- `origin`: string, nullable — Where the invoice originated (Which system provided the ID)
- `paymentMethodName`: string, nullable — Payment method
- `payments`: List<`OmniumPayment`>, nullable — All order payments
- `projectId`: string, nullable — Id of related project
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `storeId`: string, nullable — Invoice store ID
- `url`: string, nullable — Invoice URL (invoice PDF or other external url)

---


## OmniumInvoiceOmniumInvoiceTotalsOmniumSearchResultWithTotals

Generic class for receiving search results with facets and totals

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumInvoice`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits
- `totals`: → `OmniumInvoiceTotals`

---


## OmniumInvoiceOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumInvoice`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumInvoiceSearchRequest

**Fields:**

- `createdFrom`: string (date-time), nullable — Search Invoices by CreatedDate
- `createdTo`: string (date-time), nullable — Search Invoices by CreatedDate
- `customerId`: string, nullable — Search Invoices by CustomerId
- `customerName`: string, nullable — Search Invoices by CustomerName
- `email`: string, nullable — Search Invoices by Email
- `includeTotals`: boolean — Include the `totals` field in the response
- `invoiceId`: string, nullable — Search Invoices by Id
- `invoiceTypes`: List<`string`>, nullable — Search Invoices by invoice types
- `isPaid`: boolean, nullable — Search Invoices by payment statust
- `marketIds`: List<`string`>, nullable — Limit search by market IDs
- `orderId`: string, nullable — Search Invoices by OrderId
- `page`: integer (int32) — Paged search - page
- `phone`: string, nullable — Search Invoices by Phone
- `projectId`: string, nullable — Search Invoices by ProjectId
- `properties`: List<`OmniumPropertyItem`>, nullable — Search Invoices by property values and or keys (match all)
- `query`: string, nullable — Free text search Invoices (search applies to fields Id, OrderId, ProjectId, CustomerName, CustomerId
- `sortOrder`: string, nullable — Sort result. Available options [CreatedAscending, CreatedDescending, ModifiedAscending, ModifiedDesc
- `storeIds`: List<`string`>, nullable — Limit search by store IDs
- `take`: integer (int32) — Paged search - max number of invoices to return

---


## OmniumInvoiceTotals

Response model for

**Fields:**

- `totalAmountExcludingVatSum`: number (double), nullable
- `totalAmountSum`: number (double), nullable

---


## OmniumLineItemPropertiesPatch

Used for patch update properties on a orderline

**Fields:**

- `lineItemId`: string, nullable — id to update
- `properties`: List<`OmniumPropertyItem`>, nullable — Properties to update

---


## OmniumLineItemRequestModel

Model for adding many line items to cart

**Fields:**

- `priceStoreId`: string, nullable — Only use when buying from a store with a higher unit price than the default price
- `quantity`: number (decimal), nullable — Quantity of product to add to cart. If null and selectedUnitQty is given, this will be updated to se
- `selectedUnit`: string, nullable — The selected unit of measurement on order line if product is sold in multiple units (Null if sold un
- `selectedUnitConversionFactor`: number (decimal), nullable — Conversion factor from default unit to selected unit
- `selectedUnitQuantity`: number (decimal), nullable — The quantity ordered in the selected unit of measurement.
- `skuId`: string, nullable — Sku id of product to add to cart
- `unit`: string, nullable — Quantity unit - e.g. Meter,Pcs,Litre, etc

---


## OmniumLineItemReturn

Request object for adding return line items

**Fields:**

- `creditAmount`: number (decimal), nullable — Amount to credit on a returnItem pr item. Total orderLine credit amount will be creditAmount * quant
- `internalWarehouseLocation`: string, nullable — Use this to specify location within the warehouse. In case you have separate locations for returned 
- `isStockUpdated`: boolean — Whether the return order line should update stock (inventory) value. If set to 'true', the stock wou
- `lineItemId`: string, nullable — ID of line item to return
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties to set on the return order line
- `returnQuantity`: number (decimal) — Quantity returned
- `returnReason`: string, nullable — Return reason. Free text.
- `returnType`: string, nullable — Return type ID

---


## OmniumLineItemUpdate

Request model for updating line items

**Fields:**

- `canceledQuantity`: number (decimal) — Cancelled quantity
- `cost`: number (decimal), nullable — Cost price
- `deliveredQuantity`: number (decimal) — Delivered quantity
- `lineItemId`: string, nullable — LineItem / Order line ID
- `readyForPickupQuantity`: number (decimal)
- `reallocateQuantity`: number (decimal) — Reallocate quantity (Will try to reallocate the quantity to other warehouse if possible)
- `splitQuantity`: number (decimal) — Used when you only want to split shipment and not deliver

---


## OmniumLineItemUpdateRequest

Model for adding many line items to cart

**Fields:**

- `forceNewOrderLine`: boolean — If set to true, a new order line will be created even if there is an existing order line with the sa
- `priceStoreId`: string, nullable — Only use when buying from a store with a higher unit price than the default price
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties that will be added to the order line
- `quantity`: number (decimal), nullable — Quantity to add. Defaults to 1 if not provided. If unitId is specified then this refers to the units
- `skuId`: string, nullable — Sku id of product to add to cart
- `unitId`: string, nullable — EAN for product unit - If set then the quantity will refer to the unit's quantity. If no matching un

---


## OmniumMarket

Market

**Fields:**

- `countryCode`: string, nullable — Two letter country code ("EN", "NO", etc...)
- `currency`: string, nullable — Default market currency (USD, EUR, NOK etc)
- `defaultTaxRate`: number (decimal), nullable — Default tax rate for market
- `documentFooter`: string, nullable — Footer in documents like order receipt pdf. Used as fallback if store does not have value in Documen
- `isActive`: boolean, nullable — True if market is active. False if temporary unavailable.
- `isDefaultMarket`: boolean, nullable — True if market should be used by default for new orders
- `isTaxExcluded`: boolean, nullable — True if tax should not be added to orders
- `isoLanguageCode`: string, nullable — ISO Language/Region-code (en-US, nb-NO, de-DE, etc...)
- `language`: string, nullable — Market language name (English, Norwegian, German, etc...)
- `languageCode`: string, nullable — Market language code (two letter ISO: no, en, etc...)
- `marketGroupId`: string, nullable — Used for CompanyId in D365, but can also be used as a key to group multiple markets
- `marketGroupLabel`: string, nullable — Used for labeling market groups in UI
- `marketId`: string, nullable — Unique market ID (ENG, NOR, SWE, etc)
- `marketName`: string, nullable — Name of market
- `marketType`: string, nullable — B2C / B2B / Possible other values for other tenants
- `productContentLanguage`: string, nullable — Default market content language for products (en, se, no, etc)
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `shipmentOptions`: List<`OmniumShipmentOption`>, nullable — List of shipment options available for market
- `websiteUrl`: string, nullable — Public website url

---


## OmniumMarketGroup

Market group

**Fields:**

- `groupId`: string, nullable — Unique market group ID
- `groupName`: string, nullable — Name of market group
- `marketIds`: List<`string`>, nullable — IDs of markets belonging to this group

---


## OmniumOpeningHours

Class for storing store opening hours

**Fields:**

- `isOpen`: boolean — False if closed entire day, true if open this day
- `openFrom`: string — Closed stores should be set to 00:00:00 (TimeSpan.Zero)
- `openTo`: string — Closed stores should be set to 00:00:00 (TimeSpan.Zero)

---


## OmniumOpeningHoursPatch

Class for storing store opening hours

**Fields:**

- `isOpen`: boolean, nullable — False if closed entire day, true if open this day
- `openFrom`: string, nullable — Closed stores should be set to 00:00:00 (TimeSpan.Zero)
- `openTo`: string, nullable — Closed stores should be set to 00:00:00 (TimeSpan.Zero)

---


## OmniumOpeninghour

**Fields:**

- `day`: string, nullable
- `from`: string, nullable
- `to`: string, nullable

---


## OmniumPatchLineItemIdsRequest

Request model for patching line item IDs across order, shipments, and return forms

**Fields:**

- `lineItemIdMappings`: List<`LineItemIdMapping`>, nullable — List of line item ID mappings (old ID to new ID)
- `orderId`: string, nullable — Order ID to patch line item IDs for (Required)

---


## OmniumPatchLineItemIdsResult

Result model for patching line item IDs

**Fields:**

- `details`: → `PatchLineItemIdsDetails`
- `errorMessage`: string, nullable — Any error messages
- `isModified`: boolean — Whether any modifications were made
- `notFoundCount`: integer (int32) — Number of line item IDs that were not found
- `totalRequested`: integer (int32) — Total number of line item IDs that were requested to be updated
- `updatedCount`: integer (int32) — Number of line item IDs successfully updated

---


## OmniumPractice

Represents practice or training transactions that should not be included in actual financial totals.
Note: This is not a standard POS concept and may be specific to certain systems like Sitoo.

**Fields:**

- `amount`: number (decimal) — Total amount of practice/training transactions (not included in financial totals).
- `count`: integer (int32) — Number of practice/training transactions.

---


## OmniumPrice

Calculated: Current price (lowest available price) - property is read only, will be set by Omnium when returned to sales channels

**Fields:**

- `code`: string, nullable — The product identifier for the price
- `cost`: number (decimal) — Product cost price
- `currencyCode`: string, nullable — Currency code. E.g. USD, EUR, NOK
- `customerGroup`: string, nullable — Id for the customer group if this a customer group specific price
- `customerId`: string, nullable — Id for the customer if this is a customer specific price
- `discountAmount`: number (decimal) — The amount the original price is discounted
- `discountPercent`: number (decimal) — Discount amount in percentage
- `externalId`: string, nullable — Optional: If ExternalId is set, this will override the convention based ID generated by Omnium. This
- `isBackorder`: boolean — If true, the product have no reorder level, and will usually not be in stock
- `isCustomerClubSpecificPrice`: boolean — True if price is customer club specific
- `isExternalPromotion`: boolean, nullable — If true, the promotion engine is external for this price, and the Omnium promotion engine will not p
- `isTaxExcluded`: boolean — If true, tax should be excluded from the unit price specified. Tax will be added in later calculatio
- `marketGroupId`: string, nullable — Market group ID the price is valid in
- `marketId`: string, nullable — Market ID the price is valid in
- `marketType`: string, nullable — Market type for this price. B2B or B2C for instance.
- `minQuantity`: number (decimal) — Minimum purchase quantity for getting this price
- `modified`: string (date-time), nullable — When the price was last modified
- `originalUnitPrice`: number (decimal) — Original unit price (before discounts)
- `priceListId`: string, nullable — Price list id. Used if price is related to a price list
- `priceListItemId`: string, nullable — Calculated: Reference to the specific price list item that created this price
- `priceType`: string, nullable — The price type field allows the usage of special types of prices, such as a blocking price ("B") whi
- `productId`: string, nullable — Calculated: ProductId of product. Will only be set when using separate prices.
- `promotionId`: string, nullable — Promotion id. Used if price is created for a promotion / campaign
- `promotionName`: string, nullable — Promotion name. Used if price is create for a promotion / campaign
- `promotionPriority`: integer (int32), nullable — Promotion priority. Used if price is create for a promotion / campaign
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties. Key value pairs with any non strongly typed properties.
- `recommendedRetailPrice`: number (decimal) — Recommended retail price - to inform customers on B2B sites
- `skuId`: string, nullable — (Obsolete) - Use Code instead. Sku specific price (product is updated if SkuId is empty).
- `storeId`: string, nullable — Store ID the price is valid in
- `tags`: List<`string`>, nullable — Tags for categorizing/labeling prices (e.g. "Last Chance", "Clearance"). Downstream systems can use 
- `taxRate`: number (decimal), nullable — Use this taxrate if product tax differ from market default taxRate. If null, market tax rate will be
- `unit`: string, nullable — Type of unit the price is for
- `unitPrice`: number (decimal) — Price for single item (after applied discounts)
- `validFrom`: string (date-time) — Price available from this date
- `validUntil`: string (date-time), nullable — Price available until this date

---


## OmniumPriceDeleteRequest

Request for deleting prices

**Fields:**

- `ignoreDates`: boolean — If true, prices for variant will replace existing prices with other dates. If false, only prices wit
- `ignoreValidUntilDate`: boolean — If true, prices for variant will replace existing prices with other dates for the "ValidUntil" prope
- `prices`: List<`OmniumPrice`>, nullable — Prices to delete. If this is null, all prices for the given productId will be deleted. If empty list
- `productId`: string, nullable — ProductId of the product to delete prices for. (If multiple language versions, all versions will be 

---


## OmniumPriceOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPrice`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPriceReference

**Fields:**

- `currencyCode`: string, nullable
- `date`: string (date-time)
- `isCurrentPrice`: boolean, nullable
- `marketId`: string, nullable
- `priceListId`: string, nullable
- `promotionId`: string, nullable
- `promotionName`: string, nullable
- `unitPrice`: number (decimal)

---


## OmniumPriceSearchRequest

Contains all parameters for doing a price search. At least one parameter must be set

**Fields:**

- `customerGroupId`: string, nullable — Filter prices on Customer Group ID
- `customerId`: string, nullable — Filter prices on customer ID
- `isCustomerSpecificPrice`: boolean, nullable — Filter prices by customer specific prices. Set to 'true' to get only customer specific prices. Set t
- `lastModified`: string (date-time), nullable — Set LastModified to a specific DateTime to get items only modified after that time
- `marketId`: string, nullable — Filter prices on market ID
- `priceType`: string, nullable — Filter prices on price type
- `productCodes`: List<`string`>, nullable — Filter prices on product codes (SKU / Product ID)
- `scrollSize`: integer (int32), nullable — Optional: The number of items returned for each scroll request. Default value is 1000. Max is 20000 
- `unit`: string, nullable — Filter prices on unit

---


## OmniumPriceTypeEnum

**Enum values:** `['Default', 'PriceFactor']`

---


## OmniumPriceUpdateRequest

Price update request

**Fields:**

- `ignoreDates`: boolean — If true, prices for variant will replace existing prices with other dates. If false, only prices wit
- `ignoreValidUntilDate`: boolean — If true, prices for variant will replace existing prices with other dates for the "ValidUntil" prope
- `prices`: List<`OmniumPrice`>, nullable — Prices to update
- `productId`: string, nullable — ProductId of the product to update. (If multiple language versions, all versions will be updated.)

---


## OmniumProject

Class containing information for projects, e.g. a claim from a customer, or a service provided to an end customer

**Fields:**

- `addresses`: List<`OmniumAddress`>, nullable — Project addresses
- `attachments`: List<`OmniumAsset`>, nullable — File attachments to project
- `attachmentsRootDirectory`: string, nullable — Blob storage root directory for attachments on this project
- `canceled`: string (date-time), nullable — Cancellation date of the project.
- `cancellationCode`: string, nullable — Cancellation code - reason for cancelling project
- `cancellationReason`: string, nullable — Reason for cancelling project - free text
- `changeOrders`: List<`OmniumProjectChangeOrder`>, nullable — Project change orders
- `comments`: List<`OmniumComment`>, nullable — Comments only visible to partners
- `contactPersons`: List<`OmniumContactPerson`>, nullable — Contact persons
- `created`: string (date-time) — Date project is created (UTC)
- `customer`: → `OmniumProjectCustomer`
- `customerComments`: List<`OmniumComment`>, nullable — Comments visible to customers
- `deadline`: string (date-time), nullable — Deadline based on current workflow step (UTC)
- `errors`: List<`OmniumEntityError`>, nullable — List of errors
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external project IDs
- `externalReference`: string, nullable — An external reference to project (optional)
- `formData`: List<`OmniumProjectFormEntry`>, nullable — Custom project data (e.g. from at public form)
- `hasMultiplePartners`: boolean — True if project has more than one partner
- `id`: string, nullable — Unique Project ID. Is set by Omnium.
- `logItems`: List<`OmniumProjectLog`>, nullable — Log items (tracking each step in the project process) (Obsolete - can be fetched from ProjectLog-end
- `modified`: string (date-time) — Date project is modified (UTC)
- `name`: string, nullable — Project name
- `partner`: → `OmniumBusinessCustomer`
- `partnerCheckList`: List<`OmniumProjectCheckListItem`>, nullable — Project checklist
- `partners`: List<`OmniumProjectPartner`>, nullable — Project partners (used if project type supports multiple partners)
- `products`: List<`OmniumProjectProductReference`>, nullable — Products associated with the project
- `projectAdditionalValue`: number (decimal) — Additional project value. To manually adjust project value. Will be added to project value together 
- `projectBudgetValue`: number (decimal) — Project budget value (Calculated if project has transactions)
- `projectCategory`: string, nullable — Project category (e.g. Claim, Service)
- `projectDate`: string (date-time), nullable — Describing the date when the main activity of the project is performed.
- `projectNumber`: string, nullable — Project number
- `projectParts`: List<`OmniumProjectPart`>, nullable — Project parts / sections
- `projectTransactionTotal`: → `OmniumProjectTransaction`
- `projectTypeName`: string, nullable — Name of project's project type.
- `projectValue`: number (decimal) — Project value (Calculated if project has transactions)
- `publicUrl`: string, nullable — URL to public project website
- `rejectedByPartners`: List<`string`>, nullable — List of partnerIds for partners who have rejected a project
- `status`: string, nullable — Project status (Active / Completed / New etc). Populate from constant class OmniumProjectStatus.
- `storeContact`: → `OmniumContactPerson`
- `storeId`: string, nullable — Store handling the project
- `stores`: List<`OmniumProjectStore`>, nullable — Additional stores with access to project
- `subType`: string, nullable — Project subtype
- `tags`: List<`string`>, nullable — Project tags
- `transactionSummary`: → `OmniumProjectTransaction`
- `transactions`: List<`OmniumProjectTransaction`>, nullable — Project level transactions
- `type`: string, nullable — Project type ID
- `versionId`: string, nullable — Project version
- `workflowStep`: → `OmniumProjectWorkflowStep`
- `workflowSteps`: List<`OmniumProjectWorkflowStep`>, nullable — All project workflow steps

---


## OmniumProjectCancelRequest

**Fields:**

- `cancellationCode`: string, nullable — Cancellation code
- `cancellationReason`: string, nullable — Cancellation reason
- `cancelledBy`: string, nullable — The party who cancelled the project
- `comment`: string, nullable — Comment
- `projectId`: string, nullable — Project ID

---


## OmniumProjectCheckListItem

Project type check list item for tasks to be performed on each project

**Fields:**

- `comment`: string, nullable — Comment on performed task
- `completed`: string (date-time), nullable — Date and time task was completed
- `completedById`: string, nullable — ID of user performing task
- `completedByName`: string, nullable — Name of user performing task
- `isCompleted`: boolean — Is task completed?
- `text`: string, nullable — Description of task

---


## OmniumProjectDailyReport

Daily project summary

**Fields:**

- `cancelledProjects`: integer (int32)
- `completedProjects`: integer (int32)
- `date`: string (date-time)
- `newProjects`: integer (int32)
- `projectTypeName`: string, nullable
- `storeId`: string, nullable
- `storeName`: string, nullable
- `timeToComplete`: string
- `timeToRespond`: string
- `unclarifiedProjects`: integer (int32)

---


## OmniumProjectFormEntry

Key / values for additional project information

**Fields:**

- `key`: string, nullable — Property key
- `keyGroup`: string, nullable — For grouping properties
- `value`: string, nullable — Property value
- `valueType`: string, nullable — Data type (Number, Xhtml, String, DateTime, Boolean, etc)

---


## OmniumProjectFormEntryAdvancedSearch

**Fields:**

- `excludedFormEntries`: List<`OmniumProjectFormEntry`>, nullable — FormEntries to exclude
- `projectFormEntriesAdvancedFilter`: List<`array`>, nullable — Advanced filters for filtering on form entries. The inner list is AND-conditions and the outer lists

---


## OmniumProjectLog

Project log items (added by Omnium upon project updates)

**Fields:**

- `comment`: string, nullable — Comment from customer
- `data`: string, nullable — Log data
- `date`: string (date-time) — Date log item is created
- `dueDate`: string (date-time), nullable — When the current workflow step is due
- `dueText`: string, nullable — Comment of due date
- `hidden`: boolean — If true, log item should be hidden from customers or partners
- `hiddenFromCustomer`: boolean — If true, log item should be hidden from customer
- `hiddenFromPartner`: boolean — If true, log item should be hidden from partner
- `id`: string, nullable — Id
- `newWorkflowStepName`: string, nullable — New workflow step when project is updated
- `previousWorkflowStepName`: string, nullable — The current / previous workflow step when project is updated
- `projectId`: string, nullable — ProjectId
- `text`: string, nullable — Logtext
- `user`: string, nullable — User updating project

---


## OmniumProjectLogOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProjectLog`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProjectLogSearchRequest

**Fields:**

- `page`: integer (int32)
- `projectId`: string, nullable
- `take`: integer (int32)

---


## OmniumProjectOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumProject`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumProjectOmniumVersion

**Fields:**

- `created`: string (date-time)
- `createdBy`: string, nullable
- `id`: string, nullable
- `type`: string, nullable
- `value`: → `OmniumProject`
- `versionId`: string, nullable

---


## OmniumProjectPart

Project part

**Fields:**

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


## OmniumProjectPartner

**Fields:**

- `address`: → `OmniumAddress`
- `addresses`: List<`OmniumAddress`>, nullable — Partner addresses
- `contacts`: List<`OmniumContactPerson`>, nullable — Partner contact persons
- `email`: string, nullable — Partner email address
- `id`: string, nullable — Partner ID (Omnium business customer)
- `name`: string, nullable — Partner name
- `phone`: string, nullable — Partner phone number
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `role`: string, nullable — Partner role (E.g. Carpenter)

---
