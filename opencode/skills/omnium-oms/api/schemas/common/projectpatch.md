# Common / Shared Schemas — OmniumProjectPatch to OmniumStatsAggregateOmniumBucket

## OmniumProjectPatch

Class containing information for projects, e.g. a claim from a customer, or a service provided to an end customer

**Fields:**

- `addresses`: List<`OmniumAddress`>, nullable — Project addresses
- `attachments`: List<`OmniumAsset`>, nullable — File attachments to project
- `cancellationCode`: string, nullable — Cancellation code - reason for cancelling project
- `cancellationReason`: string, nullable — Reason for cancelling project - free text
- `changeOrders`: List<`OmniumProjectChangeOrder`>, nullable — Project change orders
- `comments`: List<`OmniumComment`>, nullable — Comments only visible to partners
- `contactPersons`: List<`OmniumContactPerson`>, nullable — Contact persons
- `created`: string (date-time), nullable — Date project is created (UTC)
- `customer`: → `OmniumPrivateCustomer`
- `customerComments`: List<`OmniumComment`>, nullable — Comments visible to customers
- `deadline`: string (date-time), nullable — Deadline based on current workflow step (UTC)
- `errors`: List<`OmniumEntityError`>, nullable — List of errors
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external project IDs
- `externalReference`: string, nullable — An external reference to project (optional)
- `formData`: List<`OmniumProjectFormEntry`>, nullable — Custom project data (e.g. from at public form)
- `hasMultiplePartners`: boolean, nullable — True if project has more than one partner
- `id`: string, nullable — Unique Project ID. Is set by Omnium.
- `logItems`: List<`OmniumProjectLog`>, nullable — Log items (tracking each step in the project process)
- `modified`: string (date-time), nullable — Date project is modified (UTC)
- `name`: string, nullable — Project name
- `partner`: → `OmniumBusinessCustomer`
- `partnerCheckList`: List<`OmniumProjectCheckListItem`>, nullable — Project checklist
- `partners`: List<`OmniumProjectPartner`>, nullable — Project partners (used if project type supports multiple partners)
- `projectBudgetValue`: number (decimal), nullable — Project budget value (Calculated if project has transactions)
- `projectCategory`: string, nullable — Project category (e.g. Claim, Service)
- `projectNumber`: string, nullable — Project number
- `projectParts`: List<`OmniumProjectPart`>, nullable — Project parts / sections
- `projectTransactionTotal`: → `OmniumProjectTransaction`
- `projectValue`: number (decimal), nullable — Project value (Calculated if project has transactions)
- `publicUrl`: string, nullable — URL to public project website
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


## OmniumProjectSearchRequest

**Fields:**

- `active`: boolean — Search only active projects
- `addressFilter`: → `OmniumAddressSearchRequest`
- `city`: string, nullable — Customer city
- `contactPersonEmails`: List<`string`>, nullable — Filter by contact person emails
- `contactPersonPhones`: List<`string`>, nullable — Filter by contact person phone numbers
- `createdFrom`: string (date-time), nullable — Project created after date
- `createdTo`: string (date-time), nullable — Project created before date
- `customerId`: string, nullable — Customer name
- `customerName`: string, nullable — Customer name
- `email`: string, nullable — Customer e-mail
- `excludeRejectedPartnerIds`: List<`string`>, nullable — Filter by projects without rejected partner ids in list
- `excludeTags`: List<`string`>, nullable — Exclude projects with tags
- `externalIds`: List<`string`>, nullable — Filter by external IDs
- `externalIdsProvider`: string, nullable — If set, only external IDs with given provider is returned
- `formEntries`: List<`OmniumProjectFormEntry`>, nullable — Filter by form entries
- `includeComments`: boolean, nullable — If true or null - attaches comments to projects before returning
- `isUrgent`: boolean — If true, only projects with expired workflow steps (urgent) are returned
- `modifiedFrom`: string (date-time), nullable — Project modified after date
- `modifiedTo`: string (date-time), nullable — Project modified before date
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `partnerId`: string, nullable — Partner ID
- `partnerName`: string, nullable — Partner name
- `phone`: string, nullable — Customer phone number
- `postalCode`: string, nullable — Customer postal code
- `projectFormEntryAdvancedSearch`: → `OmniumProjectFormEntryAdvancedSearch`
- `projectId`: string, nullable — Project ID
- `projectNumber`: string, nullable — Project number
- `projectTypeIds`: List<`string`>, nullable — Project type IDs
- `query`: string, nullable — Search query
- `rejectedPartnerIds`: List<`string`>, nullable — Filter projects by rejected partner ids in list
- `sortOrder`: string, nullable — Sort order
- `statuses`: List<`string`>, nullable — Statuses  (E.g. New, Completed, WorkflowCompleted, CancelledByCustomer etc)
- `stepIds`: List<`string`>, nullable — Filter by current step ids
- `stepName`: string, nullable — Filter by current step name
- `storeContact`: string, nullable — Search projects by store contact
- `storeIds`: List<`string`>, nullable — Filter by store IDs
- `tags`: List<`string`>, nullable — Filter by tags
- `take`: integer (int32) — Number of items to take

---


## OmniumProjectStore

Store referenced by project

**Fields:**

- `address`: → `OmniumStoreAddress`
- `email`: string, nullable — Store email
- `name`: string, nullable — Store name
- `phone`: string, nullable — Store phone
- `properties`: List<`OmniumPropertyItem`>, nullable — Store properties
- `role`: string, nullable — Store role in project
- `storeId`: string, nullable — Store ID

---


## OmniumProjectTask

Project task item

**Fields:**

- `comment`: string, nullable — Comment on performed task
- `completed`: string (date-time), nullable — Date and time task was completed
- `completedById`: string, nullable — ID of user performing task
- `completedByName`: string, nullable — Name of user performing task
- `created`: string (date-time), nullable — Created
- `id`: string, nullable — Unique identifier for the task
- `isCompleted`: boolean — Is task completed?
- `properties`: List<`OmniumPropertyItem`>, nullable — Properties
- `text`: string, nullable — Description of task

---


## OmniumProjectTransaction

Project revenue or cost transaction

**Fields:**

- `budgetCost`: number (decimal) — Budget cost
- `budgetDeviation`: number (decimal) — Budget deviation (Calculated)
- `budgetDeviationPercent`: number (decimal) — Budget deviation in percent (Calculated)
- `budgetRevenue`: number (decimal) — Budget revenue
- `budgetValue`: number (decimal) — Budget value (Calculated)
- `cost`: number (decimal) — Transaction cost (actual)
- `description`: string, nullable — Transaction description
- `id`: string, nullable — Unique transaction identifier
- `revenue`: number (decimal) — Transaction revenue (actual)
- `value`: number (decimal) — Transaction value (Calcualted)

---


## OmniumProjectTransactionSummary

Project transaction summaries

**Fields:**

- `changeTransactionSummary`: → `OmniumProjectTransaction`
- `partsTransactionSummary`: → `OmniumProjectTransaction`
- `projectId`: string, nullable — Unique project identifier
- `totalHits`: integer (int64) — Number of projects matching the search criteria
- `totalTransactionSummary`: → `OmniumProjectTransaction`

---


## OmniumProjectType

A type of project, with definitions of workflow steps. Used as template when Omnium is creating new projects.

**Fields:**

- `active`: boolean — True if project type is active
- `availablePartnerIds`: List<`string`>, nullable — Business customer IDs that can be related to project as partners
- `canHaveMultiplePartners`: boolean — True if project can have multiple partners
- `defaultOrderType`: string, nullable — Default order type for new carts created from projects
- `defaultProperties`: List<`OmniumDefaultPropertyItem`>, nullable — Default values for schema on project type
- `finishOnLastStep`: boolean — True if projects of this type should get status completed on last workflow step
- `internalCheckList`: List<`OmniumProjectCheckListItem`>, nullable — Check list items for project type
- `isPartnerDisabled`: boolean — True if projects of this type cannot be assigned to partners
- `partnerCheckList`: List<`OmniumProjectCheckListItem`>, nullable — Project type checklist
- `projectCategory`: string, nullable — Project type category (e.g. Claim, Service)
- `projectTypeDescription`: string, nullable — Description of the project type
- `projectTypeId`: string, nullable — Unique project type ID
- `projectTypeName`: string, nullable — Name of project type
- `publicUrl`: string, nullable — Internal check list items for project type
- `setDeliveryAddressToMainStoreAddress`: boolean — Set cart delivery/billing address from project main store
- `terms`: string, nullable — Terms text for projects with project type
- `workflowSteps`: List<`OmniumProjectWorkflowStep`>, nullable — All steps defining the project workflow

---


## OmniumProjectTypePatch

Patch object for project types

**Fields:**

- `active`: boolean, nullable — True if project type is active
- `availablePartnerIds`: List<`string`>, nullable — Business customer IDs that can be related to project as partners
- `isPartnerDisabled`: boolean, nullable — True if projects of this type cannot be assigned to partners
- `projectCategory`: string, nullable — Project type category (e.g. Claim, Service)
- `projectTypeId`: string, nullable — Unique project type ID
- `projectTypeName`: string, nullable — Name of project type

---


## OmniumProjectTypeReport

Project type report

**Fields:**

- `cancelledProjects`: integer (int32) — Total number of projects cancelled in the period
- `completedProjects`: integer (int32) — Total number of projects finished in the period
- `newProjects`: integer (int32) — Total number of projects created in the period
- `projectTypeName`: string, nullable — Project type
- `timeToComplete`: string — Average completion time for completed projects
- `timeToRespond`: string — Average response time for projects responded to
- `totalProjects`: integer (int32) — Total number of projects in the period (not deleted, not cancelled, not finished)

---


## OmniumProjectTypeReportRequest

Request for generating project type stats

**Fields:**

- `fromDate`: string (date-time) **required** — From date
- `storeIds`: List<`string`>, nullable — Filter by store IDs
- `toDate`: string (date-time) **required** — To date

---


## OmniumProjectUpdateRequest

Class used for updating projects

**Fields:**

- `addresses`: List<`OmniumAddress`>, nullable — Project addresses
- `cancellationCode`: string, nullable — Cancellation code (should correspond to cancellation reasons in settings)
- `cancellationReason`: string, nullable — Custom cancellation reason (free text)
- `changeOrders`: List<`OmniumProjectChangeOrder`>, nullable — Project change orders
- `contactPersons`: List<`OmniumContactPerson`>, nullable — Contact persons
- `customer`: → `OmniumProjectCustomer`
- `deadline`: string (date-time), nullable — Deadline based on current workflow step (UTC)
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external project IDs
- `externalReference`: string, nullable — An external reference to project (optional)
- `formData`: List<`OmniumProjectFormEntry`>, nullable — Custom project data (e.g. from at public form)
- `id`: string, nullable — Unique Project ID. Is set by Omnium.
- `name`: string, nullable — Project name
- `partner`: → `OmniumBusinessCustomer`
- `partners`: List<`OmniumProjectPartner`>, nullable — Project partners (used if project type supports multiple partners)
- `projectNumber`: string, nullable — Project number
- `projectParts`: List<`OmniumProjectPart`>, nullable — Project parts
- `projectValue`: number (decimal), nullable — Project value
- `publicUrl`: string, nullable — URL to public project website
- `storeContact`: → `OmniumContactPerson`
- `storeId`: string, nullable — Store handling the project
- `stores`: List<`OmniumProjectStore`>, nullable — Additional stores with access to project
- `tags`: List<`string`>, nullable — Project tags
- `transactions`: List<`OmniumProjectTransaction`>, nullable — Project transactions

---


## OmniumProjectWorkflowStep

A single step of the project workflow

**Fields:**

- `acceptText`: string, nullable — Text on accept button (moving forward to the next step)
- `current`: boolean — True if this step is the current workflow step
- `dateCompleted`: string (date-time), nullable — Date the step was completed (if null, the step was never completed)
- `dateText`: string, nullable — Text describing a date input. User should be able to add date if this property has value.
- `declineText`: string, nullable — Text on decline button (moving backwards to the previous step)
- `description`: string, nullable — Description of the step (what should be done by users during this step)
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external order IDs
- `hiddenFromCustomer`: boolean — If step should be hidden from customer
- `hiddenFromPartner`: boolean — If step should be hidden from partner
- `id`: string, nullable — Step ID (provided by Omnium)
- `index`: integer (int32) — Index (for sorting)
- `isCommentsDisabled`: boolean — If user should be able to enter comments on this step
- `name`: string, nullable — Name of the step
- `startDate`: string (date-time), nullable — Date the step was started

---


## OmniumPropertyItem

Generic property item (key values)

**Fields:**

- `key`: string, nullable — Property key
- `keyGroup`: string, nullable — For grouping properties
- `value`: string, nullable — Property value
- `valueType`: string, nullable — Data type (Number, Xhtml, String, DateTime, Boolean, etc)

---


## OmniumPunchOutSettings

**Fields:**

- `unitConversionLists`: List<`OmniumUnitConversionList`>, nullable

---


## OmniumRating

Class for rating other entities, like products, customers, stores, etc

**Fields:**

- `attentionRequired`: boolean, nullable — Requires attention by customer service
- `comment`: string, nullable — Rating comment
- `date`: string (date-time) — Rated date
- `displayOnlyFirstName`: boolean — Display only firstname. To be used on website if user wants to be anonymous
- `id`: string, nullable — Rating ID
- `imageUrl`: string, nullable — Product image
- `marketId`: string, nullable — Market ID
- `objectId`: string, nullable — ID of the object being evaluated (Partner ID, Product ID, etc)
- `objectName`: string, nullable — Name of the object being evaluated (Product name, project name etc)
- `parentId`: string, nullable — Parent rating ID
- `parentObjectId`: string, nullable — Parent ID For product ratings this will be product.ParentId and can be used to set rating count and 
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties for any other rating info
- `raterDisplayName`: string, nullable — Name of the rater. To be used on website. Can be only first name if DisplayOnlyFirstName is true. El
- `raterId`: string, nullable — Rater ID (typical customer ID)
- `raterName`: string, nullable — Name of the rater
- `ratingReply`: → `OmniumRatingReply`
- `skuId`: string, nullable — SkuId of the object being evaluated (if product rating)
- `storeId`: string, nullable — Store ID
- `type`: string, nullable — Rating type (E.g. Customer, Product, etc)
- `value`: integer (int32) — Rating score

---


## OmniumRatingOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumRating`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumRatingOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumRating`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumRatingReply

Class for creating a comment/answer to a rating/review

**Fields:**

- `comment`: string, nullable — Comment/answere to a rating/review
- `created`: string (date-time) — Reply date
- `replyAuthorDisplayName`: string, nullable — Public diplayed author of reply. Could be "Customer service" etc.
- `replyAuthorId`: string, nullable — Author of the reply

---


## OmniumReplacementRequestModel

Request model for replacement order

**Fields:**

- `amountToCredit`: number (decimal), nullable — Optional: By default, a 'dummy' credit payment will be added to the original order, equal to the val
- `comment`: string, nullable — Comment will be added to the replacement payment, and as a property on the replacement order.
- `orderId`: string **required** — Order id of the exsisting order to replace orderlines from.
- `orderLineReplacements`: List<`OrderLineReplacementRequestModel`> **required** — Request models for orderlines to replace

---


## OmniumReplacementSettings

**Fields:**

- `deletedMetaDataOnOrder`: List<`string`>, nullable
- `deletedMetaDataOnOrderLine`: List<`string`>, nullable
- `isMetaDataDeleted`: boolean
- `isReplacementOrderUnreplaceable`: boolean
- `replacementTypes`: List<`OmniumTranslationKeys`>, nullable

---


## OmniumReturnCharge

Return charge

**Fields:**

- `amount`: number (decimal) — Charge amount
- `key`: string, nullable — Charge type

---


## OmniumReturnRequestModel

Request model for order/order line returns

**Fields:**

- `chargeShipmentCost`: boolean — Should user pay for the shipping return cost
- `chargeShipmentCostAmount`: number (decimal) — Amout for return shipping cost. If ChargeShipmentCost is true and ChargeShipmentCostAmount is 0, the
- `comment`: string, nullable — Return comment
- `creditAmount`: number (decimal), nullable — Amount already credited on this return.
- `creditPayment`: boolean — Should payment be credited
- `creditShipment`: boolean — Should shipment be credited
- `creditShipmentAmount`: number (decimal), nullable — Amount to credit for shipment. If not specified, the original order's shipping cost will be used. Us
- `handlingTotal`: number (decimal) — Used if there is handling cost/fee
- `omniumExchangeOrderOptions`: → `OmniumExchangeOrderOptions`
- `projectTypeId`: string, nullable — If the return has a connection to a project type
- `properties`: List<`OmniumPropertyItem`>, nullable — Properties
- `returnType`: string, nullable — Type of return
- `returns`: List<`OmniumLineItemReturn`>, nullable — Returned orderlines
- `rmaNumber`: string, nullable — Return rma identifier
- `status`: string, nullable — Status for the return
- `storeId`: string, nullable — Store id for the return
- `userId`: string, nullable — User handeling the return

---


## OmniumReturnSettings

**Fields:**

- `defaultUpdateStock`: boolean
- `returnTypes`: List<`OmniumReturnType`>, nullable

---


## OmniumReturnType

**Fields:**

- `id`: string, nullable
- `translationKey`: string, nullable
- `updateInventory`: boolean, nullable

---


## OmniumRole

The OmniumRole contains data about roles in Omnium

**Fields:**

- `displayName`: string, nullable — Display name
- `externalIds`: List<`OmniumExternalId`>, nullable — IDs from external systems (key value list)
- `id`: string, nullable — User role ID

---


## OmniumSalesType

Represents sales breakdown by item type (products, services, gift cards).
Note: This is not a standard POS concept and may be specific to certain systems like Sitoo.

**Fields:**

- `giftCardCount`: integer (int32) — Number of gift cards sold.
- `productCount`: integer (int32) — Number of physical product items sold.
- `serviceCount`: integer (int32) — Number of service items sold.

---


## OmniumSearchRatingRequest

Search request for ratings

**Fields:**

- `includeOnlyRatingsWithComments`: boolean, nullable — If true filter on ratings with comments.
- `marketIds`: List<`string`>, nullable — List of marketids to filter on
- `objectId`: string, nullable — The object id to get ratings from (e.g. 12345)
- `page`: integer (int32) — Page number, fallback to 1
- `parentObjectId`: string, nullable — Parent ID For product ratings this will be product.ParentId. Search for ratings where products share
- `requiresAttention`: boolean, nullable — Filter on ratings that requires attention by customer service (no value -> all)
- `storeIds`: List<`string`>, nullable — List of storeIds to filter on
- `take`: integer (int32) — Number of elements, fallback to 10
- `type`: string, nullable — The object class to get ratings from (e.g. BusinessCustomer, Product, etc)

---


## OmniumSearchRequest

Generic search request

**Fields:**

- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `searchQuery`: string, nullable — Free text search query
- `take`: integer (int32) — Number of items to take

---


## OmniumSeoInfo

Product info for search engine optimization

**Fields:**

- `description`: string, nullable — Meta description
- `excludeFromFeed`: boolean, nullable — If true, the product will be excluded from product feed
- `keywords`: string, nullable — Meta keywords
- `languageCode`: string, nullable — Language code
- `title`: string, nullable — Page title
- `uri`: string, nullable — Page URI
- `uriSegment`: string, nullable — Page uri segment

---


## OmniumShippingOption

Shipping option to use on cart / order

**Fields:**

- `deliveryTime`: string, nullable — Shipping provider, approx. delivery time
- `description`: string, nullable — Short description about the shipping option
- `discountAmount`: number (decimal) — Amount of shipping discount, incl tax
- `discountLabel`: string, nullable — Label for discount e.g., "Free shipping for orders above 1000 Nok"
- `discountedPrice`: number (decimal) — The actual shipping cost, if discounted
- `discountedPriceExclTax`: number (decimal) — The actual shipping cost, if discounted, excl tax
- `discountedPriceTax`: number (decimal) — Discounted price tax amount
- `label`: string, nullable — Shipping option friendly name
- `pickUpPoints`: List<`OmniumShippingPickUpPoint`>, nullable — A list of pickUp points the customer can select from. Can be null
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `shippingCompany`: string, nullable — Shipping company e.g., PostNord, Bring, UPS
- `shippingMethodName`: string, nullable — Unique name for this shipping method
- `shippingSubTotal`: number (decimal) — Shipping cost before any discounts
- `shippingSubTotalExclTax`: number (decimal) — Shipping cost before any discounts, excl tax
- `shippingTax`: number (decimal) — Shipment cost tax, before any discounts
- `taxRate`: number (decimal) — Tax rate

---


## OmniumSmsMessage

Class for sending sms

**Fields:**

- `fromName`: string, nullable — Email from/sender name
- `logText`: string, nullable — Text displayed in log for this event
- `marketId`: string, nullable — If email should only be sendt for a specific market(used for translation)
- `referenceId`: string, nullable — Reference id for external systems like Sendgrid
- `storeId`: string, nullable — Sender Store ID
- `text`: string, nullable — Body text (no html)
- `to`: List<`string`>, nullable — List of recipients email addresses

---


## OmniumSpecialOpeningHours

Class for storing special opening hours

**Fields:**

- `closed`: boolean — True if store is closed on this day
- `date`: string (date-time) — Date for special opening hours
- `label`: string, nullable — Special opening hours label / reason
- `openingHours`: → `OmniumOpeningHours`

---


## OmniumSpecialOpeningHoursPatch

Class for storing special opening hours

**Fields:**

- `closed`: boolean, nullable — True if store is closed on this day
- `date`: string (date-time), nullable — Date for special opening hours
- `label`: string, nullable — Special opening hours label / reason
- `openingHours`: → `OmniumOpeningHoursPatch`

---


## OmniumStatsAggregate

Aggregated statistics

**Fields:**

- `average`: number (double), nullable — Average value
- `count`: integer (int64) — Number of items
- `max`: number (double), nullable — Maximum value
- `min`: number (double), nullable — Minimum value
- `sum`: number (double), nullable — Sum of values

---


## OmniumStatsAggregateOmniumBucket

Bucket

**Fields:**

- `type`: string, nullable — Value type
- `value`: → `OmniumStatsAggregate`

---
