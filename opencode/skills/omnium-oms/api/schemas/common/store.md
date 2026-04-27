# Common / Shared Schemas — OmniumStore to Practice

## OmniumStore

Physical store, Web shop, Warehouse, or other department of the company

**Fields:**

- `additionalOpeningHours`: List<`OmniumSpecialOpeningHours`>, nullable — Additional opening hours at specific dates, overriding regular opening hours. For instance during ho
- `address`: → `OmniumStoreAddress`
- `assortmentExcludeCategoryIds`: List<`string`>, nullable — CategoryIds excluded from the store's assortment. This is the categoryId from OmniumProductCategory,
- `assortmentIncludeCategoryIds`: List<`string`>, nullable — CategoryIds included in the store's assortment. This is the categoryId from OmniumProductCategory, a
- `availableOnMarkets`: List<`string`>, nullable — A list of market ids
- `availableReturnLocations`: List<`OmniumStoreWarehouse`>, nullable — A list of available return locations
- `availableWarehouses`: List<`OmniumStoreWarehouse`>, nullable — A list of available warehouses
- `bank`: string, nullable — Bank name of the store
- `bestBets`: List<`string`>, nullable — Best bets
- `comment`: string, nullable — Comment or description of the store
- `created`: string (date-time) — Date store is created (utc)
- `customerPickupDeadlineLimit`: string — Time limit for customer to pick up their order
- `defaultOrderType`: string, nullable — The default order type that will be used when creating a cart for this store
- `description`: string, nullable — Full store description
- `documentFooter`: string, nullable — Footer in documents like order receipt pdf. If store does not have value, fallback to document foote
- `email`: string, nullable — Store e-mail
- `employees`: List<`OmniumEmployee`>, nullable — List of employees at store
- `externalIds`: List<`string`>, nullable — Store IDs from external systems
- `externalIdsList`: List<`OmniumExternalId`>, nullable — IDs from external systems (key value list)
- `fridayOpeningHours`: → `OmniumOpeningHours`
- `googlePlaceId`: string, nullable — ID of Google Place (optional)
- `hasVirtualStockLocations`: boolean, nullable — Indicates that the warehouse has virtual warehouses in front. Only viable for physical warehouses. O
- `iban`: string, nullable — International bank account number of the store
- `id`: string **required** — Store ID (Unique ID)
- `imageUrl`: string, nullable — Url to store image
- `isInactive`: boolean, nullable — Store is inactive
- `isPrimaryStore`: boolean — True if this store is the primary store
- `isPrimaryWarehouse`: boolean — True if this is a primary company warehouse
- `isPublicVisible`: boolean — True if store information should be visible to end customers
- `isVirtual`: boolean, nullable — Indicates a virtual warehouse. Only to be used with virtual stock locations in Omnium.
- `isWarehouse`: boolean — True if store can have inventory
- `isWebWarehouse`: boolean — True if warehouse inventory should be available for sale on web
- `latitude`: string, nullable — Location latitude
- `logoUrl`: string, nullable — Url to store logo
- `longitude`: string, nullable — Location longitude
- `modified`: string (date-time) — Date store is modified (utc)
- `mondayOpeningHours`: → `OmniumOpeningHours`
- `name`: string, nullable — Store or warehouse name
- `notificationEmailAddresses`: List<`string`>, nullable — Email addresses used for notifications(recipient)
- `notificationPhoneNumbers`: List<`string`>, nullable — Phone numbers used for notifications(recipient)
- `organizationalNumber`: string, nullable — Organizational number of the store
- `phoneNumber`: string, nullable — Store phone number
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `saturdayOpeningHours`: → `OmniumOpeningHours`
- `shippingAddress`: → `OmniumStoreAddress`
- `shortDescription`: string, nullable — Short store description
- `storeExtendedPickLimit`: string — Extended time limit for store to pick an order
- `storeGroupId`: string, nullable — Store group ID
- `storePickLimit`: string — Time limit for store to pick an order
- `storeRoleIds`: List<`string`>, nullable — Roles the store has
- `sundayOpeningHours`: → `OmniumOpeningHours`
- `swift`: string, nullable — SWIFT code of the store
- `thursdayOpeningHours`: → `OmniumOpeningHours`
- `tuesdayOpeningHours`: → `OmniumOpeningHours`
- `url`: string, nullable — Store URL (URL to home page, web shop, etc)
- `useCustomPickLimits`: boolean — Indicates if this store uses custom pick limits instead of global settings
- `wednesdayOpeningHours`: → `OmniumOpeningHours`
- `zipCodeRanges`: List<`OmniumZipCodeRange`>, nullable — Range of zip codes the store delivers to

---


## OmniumStoreAddress

Class to store a stores physical address

**Fields:**

- `city`: string, nullable — City
- `contactPersonName`: string, nullable — Contact person
- `country`: string, nullable — Country
- `countryCode`: string, nullable — Country code
- `email`: string, nullable — Email
- `name`: string, nullable — Store address name
- `region`: string, nullable — Region (optional)
- `regionCode`: string, nullable — Region code (optional)
- `streetName`: string, nullable — Street name
- `streetNumber`: string, nullable — Street number
- `zipcode`: string, nullable — Zip / postal code

---


## OmniumStoreOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumStore`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumStoreOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumStore`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumStorePatch

Physical store, Web shop, Warehouse, or other department of the company

**Fields:**

- `additionalOpeningHours`: List<`OmniumSpecialOpeningHoursPatch`>, nullable — Additional opening hours at specific dates, overriding regular opening hours. For instance during ho
- `address`: → `OmniumStoreAddress`
- `availableOnMarkets`: List<`string`>, nullable — A list of market ids
- `availableReturnLocations`: List<`OmniumStoreWarehousePatch`>, nullable — A list of available return locations
- `availableWarehouses`: List<`OmniumStoreWarehousePatch`>, nullable — A list of available warehouses
- `comment`: string, nullable — Comment or description of the store
- `created`: string (date-time), nullable — Date store is created (utc)
- `customerPickupDeadlineLimit`: string, nullable — Time limit for customer to pick up their order
- `description`: string, nullable — Full store description
- `documentFooter`: string, nullable — Footer in documents like order receipt pdf. If store does not have value, fallback to document foote
- `email`: string, nullable — Store e-mail
- `employees`: List<`OmniumEmployee`>, nullable — List of employees at store
- `externalIds`: List<`string`>, nullable — Store IDs from external systems
- `externalIdsList`: List<`OmniumExternalId`>, nullable — IDs from external systems (key value list)
- `fridayOpeningHours`: → `OmniumOpeningHoursPatch`
- `googlePlaceId`: string, nullable — ID of Google Place (optional)
- `id`: string, nullable — Store ID (Unique ID)
- `imageUrl`: string, nullable — Url to store image
- `isInactive`: boolean, nullable — Store is inactive (soft delete)
- `isPrimaryStore`: boolean, nullable — True if this store is the primary store
- `isPrimaryWarehouse`: boolean, nullable — True if this is a primary company warehouse
- `isPublicVisible`: boolean, nullable — True if store information should be visible to end customers
- `isWarehouse`: boolean, nullable — True if store can have inventory
- `isWebWarehouse`: boolean, nullable — True if warehouse inventory should be available for sale on web
- `latitude`: string, nullable — Location latitude
- `logoUrl`: string, nullable — Url to store logo
- `longitude`: string, nullable — Location longitude
- `modified`: string (date-time), nullable — Date store is modified (utc)
- `mondayOpeningHours`: → `OmniumOpeningHoursPatch`
- `name`: string, nullable — Store or warehouse name
- `notificationEmailAddresses`: List<`string`>, nullable — Email addresses used for notifications(recipient)
- `notificationPhoneNumbers`: List<`string`>, nullable — Phone numbers used for notifications(recipient)
- `organizationalNumber`: string, nullable — Organizational number of the store
- `phoneNumber`: string, nullable — Store phone number
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `saturdayOpeningHours`: → `OmniumOpeningHoursPatch`
- `shippingAddress`: → `OmniumStoreAddress`
- `shortDescription`: string, nullable — Short store description
- `storeExtendedPickLimit`: string, nullable — Extended time limit for store to pick an order
- `storeGroupId`: string, nullable — Store group ID
- `storePickLimit`: string, nullable — Time limit for store to pick an order
- `storeRoleIds`: List<`string`>, nullable — Roles the store has
- `sundayOpeningHours`: → `OmniumOpeningHoursPatch`
- `thursdayOpeningHours`: → `OmniumOpeningHoursPatch`
- `tuesdayOpeningHours`: → `OmniumOpeningHoursPatch`
- `url`: string, nullable — Store URL (URL to home page, web shop, etc)
- `useCustomPickLimits`: boolean, nullable — Indicates if this store uses custom pick limits instead of global settings
- `wednesdayOpeningHours`: → `OmniumOpeningHoursPatch`

---


## OmniumStoreSearchRequest

Search request object for stores

**Fields:**

- `createdFrom`: string (date-time), nullable — Stores created from date (utc)
- `createdTo`: string (date-time), nullable — Stores created before date (utc)
- `email`: string, nullable — Search store by email
- `externalIds`: List<`string`>, nullable — Search stores with external IDs
- `includeInactive`: boolean, nullable — If null or false all inactive stores are excluded from search result
- `isInactive`: boolean, nullable — Null returns all stores, true returns only inactive stores, false returns only active stores (isInac
- `isWarehouse`: boolean, nullable — If true, only warehouses will be returned, if false, only stores not warehouse will be returned. Nul
- `marketGroupId`: string, nullable — Search by market group
- `marketIds`: List<`string`>, nullable — Search by markets
- `modifiedFrom`: string (date-time), nullable — Stores modified from date (utc)
- `modifiedTo`: string (date-time), nullable — Stores modified before date (utc)
- `page`: integer (int32) — Page to fetch
- `property`: → `OmniumPropertyItem`
- `searchText`: string, nullable — Search text
- `sortOrder`: string, nullable — Sort order. E.g. ModifiedAscending, ModifiedDescending, CreatedAscending, CreatedDescending, ZipCode
- `storeGroupId`: string, nullable — Search by store group
- `storeIds`: List<`string`>, nullable — Search by individual stores
- `take`: integer (int32) — Number of items pr page
- `zipCodeRangeFilter`: integer (int32), nullable — Return only stores with ZipCode Range including the specified ZipCode

---


## OmniumStoreUpdateResult

**Fields:**

- `errorCount`: integer (int32)
- `errorMessage`: string, nullable
- `isModified`: boolean
- `notFoundCount`: integer (int32)
- `totalCount`: integer (int32)
- `unchangedCount`: integer (int32)
- `updatedCount`: integer (int32)

---


## OmniumStoreWarehouse

Available warehouse for a store

**Fields:**

- `priority`: integer (int32)
- `warehouseCode`: string, nullable

---


## OmniumStoreWarehousePatch

Available warehouse for a store

**Fields:**

- `priority`: integer (int32)
- `warehouseCode`: string, nullable

---


## OmniumTagSettings

**Fields:**

- `name`: string, nullable
- `translationKey`: string, nullable

---


## OmniumTermsAggregationData

Terms aggregations

**Fields:**

- `docCount`: integer (int64), nullable — Number of items
- `key`: string, nullable — Term key

---


## OmniumTermsAggregationDataListOmniumBucket

Bucket

**Fields:**

- `type`: string, nullable — Value type
- `value`: List<`OmniumTermsAggregationData`>, nullable — Value

---


## OmniumTimeEntry

Time entry related to project.

**Fields:**

- `activityId`: string, nullable — ActivityId
- `activityName`: string, nullable — Name of the activity
- `comment`: string, nullable — Comment
- `date`: string (date-time), nullable — Date of the time entry
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external ids connected to the time entry
- `hours`: integer (int32), nullable — The number of hours for the time entry
- `id`: string, nullable — Id
- `projectId`: string, nullable — Id of related project
- `status`: string, nullable — Status [Active, Approved, Draft]
- `timeCode`: string, nullable — Time code
- `timeCodeName`: string, nullable — Time code name
- `userId`: string, nullable — Id of the user connected to the time entry

---


## OmniumTimeEntrySearchRequest

**Fields:**

- `activityId`: string, nullable
- `activityName`: string, nullable
- `dateFrom`: string (date-time), nullable
- `dateTo`: string (date-time), nullable
- `externalIds`: List<`string`>, nullable
- `ids`: List<`string`>, nullable
- `page`: integer (int32)
- `projectId`: string, nullable
- `status`: string, nullable
- `take`: integer (int32)
- `timeCode`: string, nullable
- `timeCodeName`: string, nullable
- `userId`: string, nullable

---


## OmniumTokenResponse

**Fields:**

- `accessToken`: string, nullable
- `expiresIn`: integer (int32)
- `tokenType`: string, nullable

---


## OmniumTranslationKeys

**Fields:**

- `id`: string, nullable
- `translationKey`: string, nullable

---


## OmniumTriggerRequest

Used for triggering actions specifically configured for the tenant

**Fields:**

- `referenceId`: string, nullable — Optional: ID to a reference in context of the trigger. An order or customer would typically be a ref
- `triggerName`: string **required** — Trigger name

---


## OmniumUnitConversion

**Fields:**

- `isoCode`: string, nullable
- `ociCode`: string, nullable

---


## OmniumUnitConversionList

**Fields:**

- `unitConversionListId`: string, nullable
- `unitConversionListName`: string, nullable
- `unitConversions`: List<`OmniumUnitConversion`>, nullable

---


## OmniumUpdateLineItemStatusPatch

Update line item

**Fields:**

- `isShippingCostKeptForExistingShipment`: boolean — Is shipping cost kept for existing shipment. If true, shipping cost will not be transferred to the n
- `lineItemUpdates`: List<`OmniumLineItemUpdate`> **required** — Line items to update
- `shipmentInfo`: → `OmniumUpdateShipmentInfo`
- `status`: string, nullable — New status to update to
- `userId`: string, nullable — User ID

---


## OmniumUpdateStatusPatch

Update status patch

**Fields:**

- `returnId`: string, nullable — For return order workflows (ReturnOrderForm.Id)
- `shipmentInfo`: → `OmniumUpdateShipmentInfo`
- `skipRunWorkflow`: boolean — If set to true, order will only be saved, and no workflows will run
- `status`: string **required** — New status to update to
- `userId`: string, nullable — User ID

---


## OmniumUserModel

The OmniumUserModel contains data about users in Omnium

**Fields:**

- `b2CId`: string, nullable — Azure B2C Id for user
- `email`: string, nullable — User's contact email
- `employees`: List<`OmniumEmployee`>, nullable — List of Employees sharing this user entity.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external user IDs. Could be ids from other SCIM providers
- `firstName`: string, nullable — User's first name
- `id`: string, nullable — User unique ID
- `imageUrl`: string, nullable — Url to user image
- `lastLogin`: string (date-time) — Last time the user logged in to Omnium
- `lastName`: string, nullable — User's last name
- `multiEmployeeUser`: boolean — Set to true for users that are shared between multiple users. Each employee should have a pin code t
- `phone`: string, nullable — User's phone number
- `projectTypes`: List<`string`>, nullable — Project types of interest to user
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties for user
- `roles`: List<`string`>, nullable — List of roles assigned to user

---


## OmniumUserPatch

OmniumUserPatch is used to patch existing omnium users

**Fields:**

- `email`: string, nullable — User's contact email
- `firstName`: string, nullable — User's first name
- `imageUrl`: string, nullable — Url to user image
- `keepExistingCustomProperties`: boolean, nullable — Set to 'false' if you want to update the whole 'properties' list. If true, new properties will be ad
- `lastName`: string, nullable — User's last name
- `phone`: string, nullable — User's phone number
- `projectTypes`: List<`string`>, nullable — Project types of interest to user
- `properties`: List<`OmniumPropertyItem`>, nullable — User properties, (key values)
- `propertiesRemovalConditions`: List<`OmniumPropertyItem`>, nullable — Specifies conditions for removing existing properties before proceeding with the patch operation. Ea
- `roles`: List<`string`>, nullable — List of roles assigned to user

---


## OmniumValidationError

**Fields:**

- `message`: string, nullable
- `referenceId`: string, nullable
- `translateKey`: string, nullable
- `validationType`: string, nullable

---


## OmniumValidationResult

**Fields:**

- `isValidatedSuccessful`: boolean
- `validationErrors`: List<`OmniumValidationError`>, nullable
- `validationMessage`: string, nullable
- `validationWarnings`: List<`OmniumValidationError`>, nullable

---


## OmniumValueAggregate

Value aggregations

**Fields:**

- `value`: number (double), nullable
- `valueAsString`: string, nullable

---


## OmniumValueAggregateOmniumBucket

Bucket

**Fields:**

- `type`: string, nullable — Value type
- `value`: → `OmniumValueAggregate`

---


## OmniumVatGroup

Represents sales grouped by VAT rate or tax code.

**Fields:**

- `amount`: number (decimal) — Total amount for transactions in this VAT group.
- `count`: integer (int32) — Number of transactions in this VAT group.
- `name`: string, nullable — Name or description of this VAT group.
- `vatValue`: number (decimal), nullable — VAT rate percentage (e.g., 25.00 for 25%).

---


## OmniumVatGroupRefund

Represents refunds/returns grouped by VAT rate.

**Fields:**

- `amount`: number (decimal) — Total refund amount for this VAT group.
- `count`: integer (int32) — Number of refund transactions in this VAT group.
- `name`: string, nullable — Name or description of this VAT group.
- `vatValue`: number (decimal) — VAT rate percentage (e.g., 25.00 for 25%).

---


## OmniumVersionListItem

**Fields:**

- `created`: string (date-time)
- `createdBy`: string, nullable
- `id`: string, nullable
- `type`: string, nullable
- `versionId`: string, nullable

---


## OmniumVirtualWarehouseAllocation

Virtual Warehouse Allocation

**Fields:**

- `deliveredQuantity`: number (decimal) — Quantity of the line item that has been delivered
- `id`: string, nullable — Unique Id for the allocation - will default to a guid
- `quantity`: number (decimal) — Number of items
- `warehouseCode`: string, nullable — Virtual Warehouse Code

---


## OmniumVirtualWarehouseAllocationToSplit

Virtual Warehouse Allocation identifier for split operations.
Use either Id or WarehouseCode to identify which allocation to split.

**Fields:**

- `id`: string, nullable — Unique Id of the allocation to split. If specified, takes priority over WarehouseCode.
- `quantity`: number (decimal) — Quantity to move from this allocation to the new line.
- `warehouseCode`: string, nullable — Warehouse code of the allocation to split. Used when Id is not specified.

---


## OmniumVisitingaddress

**Fields:**

- `city`: string, nullable
- `country`: string, nullable
- `countryCode`: string, nullable
- `postalCode`: string, nullable
- `streetName`: string, nullable
- `streetNumber`: string, nullable

---


## OmniumWorkflowStep

**Fields:**

- `active`: boolean — True if step should be run
- `connector`: string, nullable — Connector to use for workflow step
- `disabledForMarkets`: List<`string`>, nullable — List of market IDs where the workflow step should be disabled (overrides enabled property)
- `disabledForStoreGroups`: List<`string`>, nullable — List of store group IDs where the workflow step should be disabled (overrides enabled property)
- `disabledForStores`: List<`string`>, nullable — List of storeIds where the workflow step should be disabled (overrides enabled property)
- `disabledForTags`: List<`string`>, nullable — List of order tags where the workflow step should be disabled (ovverides enabled property)
- `enabledForMarkets`: List<`string`>, nullable — List of markets where this workflow step should be enabled (all markets available if empty)
- `enabledForStoreGroups`: List<`string`>, nullable — List of store group IDs where this workflow step should be enabled (all store groups available if em
- `enabledForStores`: List<`string`>, nullable — List of storeIds where this workflow step should be enabled (all stores available if empty)
- `enabledForTags`: List<`string`>, nullable — List of order tags where the workflow step should be disabled (available if empty)
- `isInvisible`: boolean — True if result should not be shown in GUI
- `name`: string, nullable — Workflow step name
- `properties`: List<`OmniumPropertyItem`>, nullable — Workflow step properties
- `runAfterOrderIsSaved`: boolean — True if step should run after order is saved
- `stopOnError`: boolean — If true, the workflow will continue if current step fails to execute
- `translateKey`: string, nullable — Translation key for workflow step name

---


## OmniumWorkflowStepRequest

Workflow step response

**Fields:**

- `comment`: string, nullable — Workflow step comment
- `data`: string, nullable
- `date`: string (date-time), nullable — Date
- `partnerId`: string, nullable — Partner ID sending request
- `partnerName`: string, nullable — Partner name sending the request
- `projectId`: string, nullable — Project ID
- `updateType`: string, nullable — Next or previous or specific step
- `userId`: string, nullable — User id sending the request
- `userName`: string, nullable — User name sending the request
- `workflowStepId`: string, nullable — Specific step

---


## OmniumZReport

Represents a Z-Report, a financial summary report generated when closing a cash register or POS terminal.
Contains sales, returns, payment methods, and cash management information for a specific register period.

**Fields:**

- `address`: → `OmniumAddress`
- `cashManagement`: → `OmniumCashManagement`
- `comment`: string, nullable — Optional comment or notes entered by staff when closing the register.
- `companyName`: string, nullable — Name of the company operating the store.
- `currencyCode`: string, nullable — Primary currency code for this register (ISO 4217 three-letter code, e.g., "USD", "EUR", "SEK").
- `currencyConversions`: List<`OmniumCurrencyConversions`>, nullable — Foreign currency conversion details for registers handling multiple currencies.
- `dateCreated`: string (date-time) — Date and time when the Z-Report was created/generated.
- `discountRefunds`: List<`OmniumDiscountRefund`>, nullable — Discounts applied to return/refund transactions during this register period.
- `discountSales`: List<`OmniumDiscountSale`>, nullable — Discounts applied to sales transactions during this register period.
- `drawerOpenings`: integer (int32) — Number of times the cash drawer was manually opened (excluding automatic openings during transaction
- `grandTotalRefund`: number (decimal) — The total gross money value for all refunds.
- `grandTotalSales`: number (decimal) — The total gross money value for all sales.
- `grandZReportTotal`: → `OmniumZReportTotal`
- `paymentRefunds`: List<`OmniumPaymentRefund`>, nullable — Payment methods used for refund transactions during this register period.
- `payments`: List<`OmniumZReportPayment`>, nullable — Payment methods used for sales transactions during this register period.
- `practice`: → `OmniumPractice`
- `productGroupRefunds`: List<`OmniumProductGroupRefund`>, nullable — Refunds/returns grouped by product category or product group.
- `productGroupings`: List<`OmniumProductGroupings`>, nullable — Sales grouped by product category or product group.
- `receiptCount`: integer (int32) — Total number of receipts printed during this register period.
- `refundItemsCount`: integer (int32) — Total number of individual items refunded (not transactions, but actual product units).
- `refundTotalNet`: number (decimal) — The net refund amount (excluding VAT/tax).
- `returns`: → `OmniumZReportTotal`
- `roundOff`: number (decimal) — Rounding adjustment applied to transactions (e.g., for cash payments that need rounding to nearest c
- `sales`: → `OmniumZReportTotal`
- `salesItemsCount`: integer (int32) — Total number of individual items sold (not transactions, but actual product units).
- `salesTaxesRefund`: List<`object`>, nullable — Detailed sales tax breakdown for refund transactions (format varies by POS system).
- `salesTaxesSales`: List<`object`>, nullable — Detailed sales tax breakdown for sales transactions (format varies by POS system).
- `salesTotalNet`: number (decimal) — The net sales amount (excluding VAT/tax).
- `salesType`: → `OmniumSalesType`
- `sitooZReportUnique`: → `SitooZReportUnique`
- `storeName`: string, nullable — Name of the store where this report was generated.
- `summaryRoundOff`: number (decimal) — Total rounding adjustments in the summary.
- `summarySalesTax`: number (decimal) — Total sales tax/VAT amount in the summary.
- `summarySubtotal`: number (decimal) — Subtotal amount before tax and rounding adjustments.
- `user`: string, nullable — Name of the staff member who operated the register or generated this report.
- `vatGroupRefunds`: List<`OmniumVatGroupRefund`>, nullable — Refunds/returns grouped by VAT rate or tax code.
- `vatGroups`: List<`OmniumVatGroup`>, nullable — Sales grouped by VAT rate or tax code.
- `vatNumber`: string, nullable — VAT registration number or company identifier used for tax purposes.
- `zreportId`: string, nullable — Unique identifier for this Z-Report.

---


## OmniumZReportFilter

**Fields:**

- `fromDate`: string (date-time)
- `marketIds`: List<`string`>, nullable
- `toDate`: string (date-time)

---


## OmniumZReportTotal

Represents a total with amount and count (used for sales, returns, grand totals).

**Fields:**

- `amount`: number (decimal) — Total monetary amount.
- `count`: integer (int32) — Number of transactions contributing to this total.

---


## OmniumZipCodeRange

Class representing an interval of zip codes

**Fields:**

- `marketId`: string, nullable — Market availability
- `zipCodeFrom`: string, nullable — Zip code range start (including this)
- `zipCodeTo`: string, nullable — Zip codes range end (including this)

---


## Package

**Fields:**

- `barcode`: string, nullable
- `dimensions`: → `Dimensions`
- `goodsDescription`: string, nullable
- `id`: string, nullable
- `lineItemReferences`: List<`ShipmentPackageLineItemReference`>, nullable
- `shipmentTracking`: → `ShipmentTracking`
- `volume`: number (double), nullable
- `weightInKg`: number (double)

---


## PatchLineItemIdsDetails

Details of line item ID updates by location

**Fields:**

- `orderFormLineItemsUpdated`: integer (int32) — Number of line items updated in order.OrderForm.LineItems
- `returnOrderFormLineItemsUpdated`: integer (int32) — Number of line items updated across all return order forms
- `shipmentLineItemsUpdated`: integer (int32) — Number of line items updated across all shipments

---


## PendingNotification

**Fields:**

- `notification`: → `INotification`
- `notificationGroup`: string, nullable
- `notificationId`: string, nullable
- `notificationName`: string, nullable
- `notificationPartitionKey`: string, nullable
- `recipient`: string, nullable
- `sendDate`: string (date-time)

---


## Practice

**Fields:**

- `amount`: string, nullable
- `count`: integer (int32)

---
