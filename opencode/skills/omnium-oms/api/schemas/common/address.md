# Common / Shared Schemas — Address to OmniumIncludedFieldsOptions

## Address

**Fields:**

- `apartmentNumber`: string, nullable
- `city`: string, nullable
- `countryCode`: string, nullable
- `countryName`: string, nullable
- `email`: string, nullable
- `externalId`: string, nullable
- `line1`: string, nullable
- `line2`: string, nullable
- `locationName`: string, nullable
- `name`: string, nullable
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


## AdvancedNotificationSettings

**Fields:**

- `onlyForCompleteOrderUpdate`: boolean
- `partiallyShipments`: boolean

---


## Asset

**Fields:**

- `altText`: string, nullable
- `assetId`: string, nullable
- `assetType`: string, nullable
- `base64EncodedContent`: string, nullable
- `container`: string, nullable
- `contentType`: string, nullable
- `created`: string (date-time)
- `description`: string, nullable
- `externalUrl`: string, nullable
- `fileLoaderType`: string, nullable
- `fileName`: string, nullable
- `forceUpload`: boolean, nullable
- `internalName`: string, nullable
- `isMainImage`: boolean
- `length`: integer (int64)
- `modified`: string (date-time)
- `name`: string, nullable
- `parentId`: string, nullable
- `properties`: List<`PropertyItem`>, nullable
- `purpose`: string, nullable
- `sortOrder`: integer (int32), nullable
- `url`: string, nullable

---


## CashManagement

**Fields:**

- `cashBank`: string, nullable
- `cashBankFinal`: string, nullable
- `cashCounted`: string, nullable
- `cashDiff`: string, nullable
- `cashExpected`: string, nullable
- `cashIn`: string, nullable
- `cashOut`: string, nullable
- `cashPetty`: string, nullable
- `cashSalesRefunds`: string, nullable

---


## Charge

**Fields:**

- `amount`: number (decimal)
- `code`: string, nullable
- `isInvoiced`: boolean

---


## Claim

**Fields:**

- `projectId`: string, nullable
- `projectType`: string, nullable

---


## Comment

**Fields:**

- `attachmentReferences`: List<`TemplateAttachmentReference`>, nullable
- `attachments`: List<`Asset`>, nullable
- `bcc`: string, nullable
- `cc`: string, nullable
- `changed`: string (date-time)
- `created`: string (date-time)
- `creator`: string, nullable
- `customerId`: string, nullable
- `deliveryMethod`: string, nullable
- `deliveryReceipient`: string, nullable
- `detail`: string, nullable
- `emailFromAddress`: string, nullable
- `emailFromName`: string, nullable
- `emailSubject`: string, nullable
- `esMetadata`: → `EsMetaData`
- `id`: string, nullable
- `indexIdentifier`: string, nullable
- `lineItemId`: string, nullable
- `objectId`: string, nullable
- `objectType`: string, nullable
- `parentId`: string, nullable
- `smsFrom`: string, nullable
- `smsReceipient`: string, nullable
- `tags`: List<`string`>, nullable
- `tenantId`: string, nullable
- `title`: string, nullable
- `type`: string, nullable
- `userId`: string, nullable

---


## ComponentOption

**Fields:**

- `priceOffsets`: List<`Price`>, nullable
- `productId`: string, nullable
- `skuId`: string, nullable

---


## ConditionalPricingSettings

**Fields:**

- `showPricesOnlyWhenConditionMet`: boolean

---


## Dimensions

**Fields:**

- `heightInCm`: integer (int32)
- `lengthInCm`: integer (int32)
- `widthInCm`: integer (int32)

---


## EmailMessage

**Fields:**

- `attachmentReferences`: List<`TemplateAttachmentReference`>, nullable
- `attachments`: List<`FileInfo`>, nullable
- `bcc`: List<`string`>, nullable
- `bodyText`: string, nullable
- `cc`: List<`string`>, nullable
- `customHeaders`: object, nullable
- `customTemplateFile`: string, nullable
- `externalTemplate`: → `TemplateAttachmentReference`
- `fromAddress`: string, nullable
- `fromName`: string, nullable
- `htmlText`: string, nullable
- `market`: string, nullable
- `notificationId`: string, nullable
- `referenceId`: string, nullable
- `replyToAddress`: string, nullable
- `storeId`: string, nullable
- `subject`: string, nullable
- `tenantId`: string, nullable
- `to`: List<`string`>, nullable

---


## EntityError

**Fields:**

- `comment`: string, nullable
- `details`: string, nullable
- `key`: string, nullable
- `message`: string, nullable
- `occured`: string (date-time)
- `referenceId`: string, nullable
- `severity`: string, nullable
- `status`: string, nullable

---


## EsMetaData

**Fields:**

- `origin`: string, nullable
- `primaryTerm`: integer (int64), nullable
- `sequenceNumber`: integer (int64), nullable
- `size`: integer (int32), nullable

---


## ExportLogItem

**Fields:**

- `created`: boolean
- `errorLogged`: boolean
- `errorReason`: string, nullable
- `isSuccess`: boolean
- `status`: string, nullable
- `timestamp`: string (date-time), nullable
- `translateKey`: string, nullable
- `type`: string, nullable

---


## ExternalId

**Fields:**

- `id`: string, nullable
- `providerName`: string, nullable

---


## FileInfo

**Fields:**

- `base64EncodedContent`: string, nullable
- `container`: string, nullable
- `contentType`: string, nullable
- `created`: string (date-time)
- `externalUrl`: string, nullable
- `fileLoaderType`: string, nullable
- `internalName`: string, nullable
- `length`: integer (int64)
- `modified`: string (date-time)
- `name`: string, nullable
- `url`: string, nullable

---


## INotification

**Fields:**

- `additionalOrderNotificationSettings`: → `AdditionalOrderNotificationSettings`
- `advancedNotificationSettings`: → `AdvancedNotificationSettings`
- `allowResend`: boolean
- `canBeCreated`: boolean
- `canBeRecurring`: boolean
- `canBeScheduled`: boolean
- `canConfigureResend`: boolean
- `canHaveAdditionalOrderNotificationSettings`: boolean
- `canHaveMarketFilters`: boolean
- `canHaveOrderFilters`: boolean
- `canHaveReturnFilters`: boolean
- `canHaveSubscriptionFilters`: boolean
- `canSendOutsideOfOpeningHours`: boolean
- `customerFilterExcludeTag`: List<`string`>, nullable
- `customerFilterIncludeTag`: List<`string`>, nullable
- `customerFilterTagActive`: boolean
- `defaultAttachments`: List<`string`>, nullable
- `disabled`: boolean
- `emailBcc`: string, nullable
- `emailCc`: string, nullable
- `emailMessageTemplate`: → `EmailMessage`
- `emailMessageTemplateVariants`: List<`EmailMessage`>, nullable
- `emailTo`: string, nullable
- `filterAdvancedActive`: boolean
- `filterExcludeTag`: List<`string`>, nullable
- `filterIncludeTag`: List<`string`>, nullable
- `filterMarket`: List<`string`>, nullable
- `filterMarketActive`: boolean
- `filterOrderStatus`: List<`string`>, nullable
- `filterOrderStatusActive`: boolean
- `filterOrderType`: List<`string`>, nullable
- `filterOrderTypeActive`: boolean
- `filterShipmentOptionTypeActive`: boolean
- `filterShipmentOptions`: List<`string`>, nullable
- `filterSubscriptionStatus`: List<`string`>, nullable
- `filterTagActive`: boolean
- `id`: string, nullable
- `name`: string, nullable
- `notificationMainType`: → `NotificationMainType`
- `recurringReminder`: boolean
- `recurringSettings`: → `RecurringSettings`
- `selectedTimeSpanType`: string, nullable
- `sendAfter`: integer (int32)
- `sendAfterAbsoluteTime`: string (date-time), nullable
- `sendAfterType`: string, nullable
- `shouldSendEmail`: boolean
- `shouldSendImmediately`: boolean
- `shouldSendSms`: boolean
- `smsMessageTemplate`: → `SmsMessage`
- `smsMessageTemplateVariants`: List<`SmsMessage`>, nullable
- `smsTo`: string, nullable
- `triggeredByScheduler`: boolean

---


## LineItemIdMapping

Mapping from old line item ID to new line item ID

**Fields:**

- `newLineItemId`: string, nullable — The new line item ID to replace with (Required)
- `oldLineItemId`: string, nullable — The current/old line item ID to be replaced (Required)

---


## NotificationMainType

**Enum values:** `['OnlineOrder', 'PosOrder', 'ClickAndCollect', 'Project', 'CustomerClub', 'Rating', 'Invoice', 'GiftCard', 'Errors', 'ProductAlert', 'ProductLowStockAlert', 'ExpiringPayments', 'Payment', 'PurchaseOrder']`

---


## OmniumAddress

Address class

**Fields:**

- `apartmentNumber`: string, nullable — Apartment number
- `city`: string, nullable — City (E.g. New York, Oslo, Tokyo)
- `countryCode`: string, nullable — Country code
- `countryName`: string, nullable — Country name
- `email`: string, nullable — Optional property - Email address on billing address
- `externalId`: string, nullable — Optional property - used for mapping addresses to other external systems
- `line1`: string, nullable — Address line 1 (E.g. street address)
- `line2`: string, nullable — Address line 2 (E.g. building number, floor, etc)
- `locationName`: string, nullable — Name of location
- `name`: string, nullable — Name of address (location / customer / business)
- `phone`: string, nullable — Optional property - Phone number on billing address
- `postalCode`: string, nullable — Postal / ZIP code
- `properties`: List<`OmniumPropertyItem`>, nullable — Address properties, (key values)
- `purposes`: List<`string`>, nullable — Home/Billing/Invoice/++. This should not be set from a text field, but be selected from a set of con
- `regionCode`: string, nullable — Region code (optional)
- `regionName`: string, nullable — Region name (optional)
- `state`: string, nullable — State or county
- `streetNumber`: string, nullable — Street / House number - if not included in Line 1. See Customer settings

---


## OmniumAddressSearchRequest

Search request object for OmniumAddress

**Fields:**

- `purposes`: List<`string`>, nullable — Address must contain at least one of the supplied purposes
- `zipCodeRanges`: List<`OmniumZipCodeRange`>, nullable — Zip code of address must be within one of the supplied ranges

---


## OmniumAnalyticsAddress

**Fields:**

- `apartmentNumber`: string, nullable
- `city`: string, nullable
- `countryCode`: string, nullable
- `countryName`: string, nullable
- `firstName`: string, nullable
- `lastName`: string, nullable
- `line1`: string, nullable
- `line2`: string, nullable
- `name`: string, nullable
- `organization`: string, nullable
- `postalCode`: string, nullable
- `regionCode`: string, nullable
- `regionName`: string, nullable
- `state`: string, nullable
- `streetNumber`: string, nullable

---


## OmniumAnalyticsPropertyItem

Custom property item for order

**Fields:**

- `key`: string, nullable — The key of the property.
- `keyGroup`: string, nullable — The group to which the property belongs.
- `value`: string, nullable — The value of the property.
- `valueType`: string, nullable — The type of the value.

---


## OmniumAnalyticsStore

**Fields:**

- `storeGroupId`: string, nullable
- `storeId`: string, nullable
- `storeName`: string, nullable

---


## OmniumAspectRatio

**Fields:**

- `height`: integer (int32)
- `isDefault`: boolean, nullable
- `name`: string, nullable
- `translateKey`: string, nullable
- `width`: integer (int32)

---


## OmniumAsset

**Fields:**

- `altText`: string, nullable — Optional - Image alternative text
- `assetId`: string, nullable — Optional - ID of asset. If not provided, an id will be generated
- `assetType`: string, nullable — Optional - Type of asset
- `contentType`: string, nullable — Calculated - File type, e.g. image/jpg
- `created`: string (date-time) — Date created
- `description`: string, nullable — Optional - Asset description
- `externalUrl`: string, nullable — External URL (original URL, will be uploaded and Omnium url will be added to Url). If FileName is no
- `fileName`: string, nullable — Preferred file name, used when uploaded to Omnium. Required to contain the correct file extension. F
- `forceUpload`: boolean, nullable — Force upload external url to Omnium (if both external and internal url exists)
- `isMainImage`: boolean — If true, asset will be used as main image on parent item
- `length`: integer (int64) — Calculated - File size in bytes
- `modified`: string (date-time) — Date modified
- `name`: string, nullable — Optional - Asset name
- `parentId`: string, nullable — Optional - ID of parent media or directory
- `properties`: List<`OmniumPropertyItem`>, nullable — Optional - List of properties. Key value pairs with any non strongly typed properties.
- `purpose`: string, nullable — Optional - Asset purpose or use
- `sortOrder`: integer (int32), nullable — Optional - Item sort index. Default is position in list
- `url`: string, nullable — Calculated: Omnium url

---


## OmniumCashManagement

Represents cash management details for a cash register, tracking expected vs. actual cash amounts.

**Fields:**

- `cashBank`: number (decimal) — Cash deposited to bank during the register period.
- `cashBankFinal`: number (decimal) — Final amount deposited to bank after closing.
- `cashCounted`: number (decimal) — Actual cash amount counted when closing the register.
- `cashDiff`: number (decimal) — Difference between expected and counted cash (CashCounted - CashExpected). Positive indicates overag
- `cashExpected`: number (decimal) — Calculated expected cash amount in the register (opening + sales - refunds - petty - bank).
- `cashIn`: number (decimal) — Opening cash amount when the register was opened.
- `cashOut`: number (decimal) — Cash removed from register when closing (e.g., for deposit or safe).
- `cashPetty`: number (decimal) — Petty cash withdrawals (small expenses paid from register).
- `cashSalesRefunds`: number (decimal) — Net cash from sales and refunds during the register period.

---


## OmniumCharge

Omnium order charge object

**Fields:**

- `amount`: number (decimal) — Charge amount
- `code`: string, nullable — Charge code / identifier

---


## OmniumChart

Class for displaying generic charts from Omnium

**Fields:**

- `chartData`: → `OmniumChartData`
- `chartType`: string, nullable — Chart type

---


## OmniumChartData

Class containing generic Omnium Charts with labels and data sets

**Fields:**

- `datasets`: List<`OmniumChartDataset`>, nullable — Chart dataset
- `labels`: List<`string`>, nullable — This typically is dates - 01.01, 01.02 / Jan, feb / 2018 , 2019

---


## OmniumChartDataset

Chart data set

**Fields:**

- `data`: List<`number`>, nullable — Chart data
- `label`: string, nullable — The text that is displayed on the bar/pie slice/line - for example a store name, product name/id, 'R

---


## OmniumClaim

Class containing connection between a claim project and a return

**Fields:**

- `projectId`: string, nullable — Claim project ID
- `projectType`: string, nullable — Project type ID for claim

---


## OmniumComment

Object used for adding and getting comments on all models

**Fields:**

- `attachments`: List<`OmniumAsset`>, nullable — List of attachments
- `created`: string (date-time) — Comment created date
- `creator`: string, nullable — Name of comment creator
- `customerId`: string, nullable — Comment customer ID
- `deliveryMethod`: string, nullable — Type of notification (Available types: [Email, Sms, EmailAndSms])
- `detail`: string, nullable — Comment main content
- `emailFromAddress`: string, nullable — Email address displayed as sender of the email
- `emailFromName`: string, nullable — Name displayed as sender of the email
- `emailRecipient`: string, nullable — Recipient of email notification (must be valid email address)
- `emailSubject`: string, nullable — Email subject
- `id`: string, nullable — Comment ID
- `lineItemId`: string, nullable — Optional line item reference
- `objectId`: string, nullable — Id of object to which the comment is related (i.e. projectId if a ObjectType is Project)
- `objectType`: string, nullable — The type of object to which the comment is related (Available types: [Project])
- `parentId`: string, nullable — Parent comment ID
- `sendNotification`: boolean, nullable — Send out notification. Requires delivery method and recipient(-s)
- `smsFrom`: string, nullable — Name displayed as sender of the sms (if empty - set to StandardSmsSender from settings)
- `smsRecipient`: string, nullable — Recipient of sms notification (must be valid phone number)
- `tags`: List<`string`>, nullable — Comment tags (for categories / anchors / threads)
- `title`: string, nullable — Comment header
- `type`: string, nullable — Specifies type of comment (Available types: [ProjectCustomerComment, ProjectInternalComment, Project
- `userId`: string, nullable — ID of comment creator

---


## OmniumCommentPatch

Object used for patching specific comment values

**Fields:**

- `attachments`: List<`OmniumAsset`>, nullable — List of attachments
- `creator`: string, nullable — Name of comment creator
- `customerId`: string, nullable — Comment customer ID
- `detail`: string, nullable — Comment main content
- `id`: string **required** — Id of comment to patch
- `lineItemId`: string, nullable — Optional line item reference
- `objectId`: string, nullable — Id of object to which the comment is related (i.e. projectId if a ObjectType is Project)
- `objectType`: string, nullable — The type of object to which the comment is related (Available types: [Project])
- `parentId`: string, nullable — Parent comment ID
- `tags`: List<`string`>, nullable — Comment tags (for categories / anchors / threads)
- `title`: string, nullable — Comment header
- `type`: string, nullable — Specifies type of comment (Available types: [ProjectCustomerComment, ProjectInternalComment, Project
- `userId`: string, nullable — ID of comment creator

---


## OmniumCommentSearchRequest

**Fields:**

- `commentTypes`: List<`string`>, nullable
- `objectIds`: List<`string`>, nullable
- `objectTypes`: List<`string`>, nullable
- `page`: integer (int32)
- `take`: integer (int32)

---


## OmniumCommentType

Type of comment

**Enum values:** `['Public', 'Internal']`

---


## OmniumCompletionRateFilter

Filter options for product completion rate

**Fields:**

- `field`: string, nullable — Filter by a specific field name to check if it is completed or not. Use together with IsCompleted.
- `isCompleted`: boolean, nullable — When used with Field: true returns products where the field is completed, false returns products whe
- `isSkuOnly`: boolean, nullable — Only check for existing values on SKU's. If enabled, this will only retrieve products where the sele
- `isValid`: boolean, nullable — Filter by completion validity. True returns only products where all required fields are filled in. F
- `max`: integer (int32), nullable — Maximum completion rate percentage (0-100)
- `min`: integer (int32), nullable — Minimum completion rate percentage (0-100)

---


## OmniumCompletionStatus

Completion status for a product, tracking whether required fields are filled in.

**Fields:**

- `isValid`: boolean, nullable — Whether the product meets all required field criteria
- `maxPoints`: number (double), nullable — Maximum possible completion points
- `percentage`: number (double), nullable — Completion percentage (0-100)
- `points`: number (double), nullable — Current completion points

---


## OmniumComponentOption

Represents a selectable option for a package component.

**Fields:**

- `priceOffsets`: List<`OmniumPrice`>, nullable — Relevant only for packages (not bundles). Price offsets applied to the package price when this optio
- `productId`: string, nullable — The product ID associated with this option. Only required if SkuId is not specified. This allows all
- `skuId`: string, nullable — The SKU ID of the selectable option.

---


## OmniumConditionOperator

Defines how multiple promotion conditions are combined

**Enum values:** `['And', 'Or']`

---


## OmniumConditionalPricingSettings

Configuration settings for conditional pricing behavior in MultiBuy promotions

**Fields:**

- `showPricesOnlyWhenConditionMet`: boolean — Show promotional prices on product pages only when condition is met. When false, promotional prices 

---


## OmniumCoordinate

**Fields:**

- `easting`: number (float)
- `northing`: number (float)
- `srId`: string, nullable

---


## OmniumCurrencyConversions

Represents foreign currency conversion details for registers handling multiple currencies.

**Fields:**

- `currencyCode`: string, nullable — The currency code of the foreign currency (3-letter ISO 4217, e.g., "EUR", "GBP", "NOK").
- `moneyCounted`: number (decimal) — The actual counted amount for cash in the register in the foreign currency when closing.
- `moneyCountedBase`: number (decimal) — The counted amount converted to the base/default currency of the register.
- `moneyExpected`: number (decimal) — The calculated expected amount for cash in the register in the foreign currency before counting.
- `moneyExpectedBase`: number (decimal) — The expected amount converted to the base/default currency of the register.

---


## OmniumCustomSortIndex

Custom sort index for sorting on custom values such as popularity

**Fields:**

- `marketId`: string, nullable — Relevant market ID for the current sort index
- `value`: number (double) — The sort value.

---


## OmniumDatePlanner

**Fields:**

- `created`: string (date-time)
- `datePlannerItems`: List<`OmniumDatePlannerItem`>, nullable
- `id`: string, nullable
- `modified`: string (date-time)

---


## OmniumDatePlannerItem

**Fields:**

- `date`: string (date-time)
- `dateTo`: string (date-time), nullable
- `description`: string, nullable
- `isRange`: boolean
- `isTimeSpanEnabled`: boolean
- `name`: string, nullable
- `timeFrom`: string, nullable
- `timeTo`: string, nullable

---


## OmniumDefaultDimensions

Default package dimensions

**Fields:**

- `heightInCm`: integer (int32) — Height in cm
- `lengthInCm`: integer (int32) — Length in cm
- `widthInCm`: integer (int32) — Width in cm

---


## OmniumDefaultPackage

Default package info sent to provider. Used if no specific info is added on cart/order

**Fields:**

- `defaultDimensions`: → `OmniumDefaultDimensions`
- `goodsDescription`: string, nullable — Default goods description
- `weightInKg`: number (double) — Default package weight in kg. Can be changed on a order/cart

---


## OmniumDefaultPropertyItem

**Fields:**

- `isCustomValueOptionAllowed`: boolean — Allow adding custom values.
- `isMultiSelectEnabled`: boolean — Only relevant for the "DropDown" valueType. If true, multiple values can be selected.
- `key`: string, nullable — Property key
- `keyGroup`: string, nullable — For grouping properties
- `readOnly`: boolean — Make property read only
- `value`: string, nullable — Property value
- `valueOptions`: List<`string`>, nullable — For predefined options (multiselect)
- `valueType`: string, nullable — Data type (Number, Xhtml, String, DateTime, Boolean, etc)

---


## OmniumEmailAttachment

Attachment to emailmessage. There are two separate ways of using this model - Url or Base64EncodedContent.
1. Url - If you your attachment is already located in omnium specify the resource url of the attachment.
2. Base64EncodedContent - You can add the attachment as a Base64Encoded string. (Max length is set to  100 000)

**Fields:**

- `base64EncodedContent`: string, nullable — File content base64-encoded
- `contentType`: string, nullable — File type, e.g. image/jpg
- `fileName`: string, nullable — Attachment name
- `fileUrl`: string, nullable — Url pointing to blob in omnium storage containing the file to attach

---


## OmniumEmailMessage

Class for sending email

**Fields:**

- `attachments`: List<`OmniumEmailAttachment`>, nullable — Email attachments
- `bcc`: List<`string`>, nullable — List of Bcc email addresses
- `bodyText`: string, nullable — Email body text(no html)
- `cc`: List<`string`>, nullable — List of cc email addresses
- `fromAddress`: string, nullable — Email from/sender address
- `fromName`: string, nullable — Email from/sender name
- `htmlText`: string, nullable — Email body text with
- `logText`: string, nullable — Text displayed in log for this event
- `market`: string, nullable — If email should only be sent for a specific market(used for translation)
- `referenceId`: string, nullable — Reference id for external systems like Sendgrid
- `storeId`: string, nullable — Omnium store id. If email should be sendt in context of a store
- `subject`: string, nullable — Email subject
- `to`: List<`string`>, nullable — List of recipients email addresses

---


## OmniumEmployee

Class for storing employees

**Fields:**

- `email`: string, nullable — Employee e-mail
- `firstName`: string, nullable — Employee first name
- `imageUrl`: string, nullable — Image url
- `isInactive`: boolean — [Only relevant on OmniumUserModel] Is Inactive
- `lastName`: string, nullable — Employee last name
- `phone`: string, nullable — Employee phone
- `pin`: string, nullable — [Only relevant on OmniumUserModel] Employee pin for logging into multi user
- `position`: string, nullable — Employee position (CEO, Customer service, Warehouse associate, etc)
- `userName`: string, nullable — Omnium user name (used to connect users and employees)

---


## OmniumEntityError

Generic entity error

**Fields:**

- `comment`: string, nullable — Error comment
- `details`: string, nullable — Error details
- `key`: string, nullable — Error type
- `message`: string, nullable — Short error message
- `occurred`: string (date-time) — Date and time the error occurred
- `referenceId`: string, nullable — Internal reference
- `severity`: string, nullable — Error severity: Error, Warning, Information
- `status`: string, nullable — Current status: New, Solved, Deleted

---


## OmniumEventLogCompareRequest

**Fields:**

- `previousEventSearchRequest`: → `OmniumEventLogSearch`
- `searchRequest`: → `OmniumEventLogSearch`

---


## OmniumEventLogItem

**Fields:**

- `eventLogModel`: → `OmniumEventLogModelType`
- `eventLogType`: → `OmniumEventLogType`
- `id`: string, nullable — Event log item ID
- `market`: string, nullable — The market the event occured in context of
- `objectId`: string, nullable — ID of the object that the event occured for
- `status`: string, nullable — The status of the object
- `storeId`: string, nullable — The market the event occured in context of
- `timestamp`: string (date-time) — Timestamp for when the event occured (UTC)
- `userId`: string, nullable — The ID of the user who triggered the event
- `userName`: string, nullable — The name of the user who triggered the event

---


## OmniumEventLogItemOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumEventLogItem`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumEventLogModelType

Event Log Model Types

**Enum values:** `['Order', 'BusinessCustomer', 'PrivateCustomer', 'Project', 'Product', 'PriceList', 'Inventory', 'Store', 'Cart', 'User', 'Delivery', 'PurchaseOrder', 'Supplier', 'Return', 'Promotion', 'TenantSettings', 'ScheduledTask', 'Notification', 'PickList', 'IncompleteProduct', 'EventSubscription', 'Webhook']`

---


## OmniumEventLogSearch

**Fields:**

- `status`: string, nullable — The status of the object

---


## OmniumEventLogSearchRequest

Search request for event log items

**Fields:**

- `createdFrom`: string (date-time), nullable — Events created after this time
- `createdTo`: string (date-time), nullable — Events created before this time
- `eventLogItemId`: string, nullable — ID of OmniumEventLogItem
- `eventLogModel`: → `OmniumEventLogModelType`
- `eventLogType`: → `OmniumEventLogType`
- `marketIds`: List<`string`>, nullable — Events created in context of given markets
- `objectId`: string, nullable — ID of the object that the event occured for
- `page`: integer (int32) — Page to fetch
- `status`: string, nullable — Status of the object
- `storeIds`: List<`string`>, nullable — Events created in context of given stores
- `take`: integer (int32) — Number of items pr page
- `user`: string, nullable — The ID of the user who triggered the event

---


## OmniumEventLogType

Event log type

**Enum values:** `['Created', 'Added', 'Deleted', 'Updated', 'Canceled', 'Notification', 'Information', 'Published', 'Workflow', 'WorkflowStep', 'Exported', 'Comment', 'Error']`

---


## OmniumExternalId

IDs from a subsystem

**Fields:**

- `id`: string, nullable — External ID
- `providerName`: string, nullable — Provider setting the ID

---


## OmniumExternalPriceResponse

The response to return when using an external price service

**Fields:**

- `prices`: List<`OmniumPrice`>, nullable — List of prices to return

---


## OmniumFacet

Facet

**Fields:**

- `count`: integer (int64) — Number of items with this facet
- `name`: string, nullable — Facet name, e.g. red, green, small, medium, etc.
- `value`: string, nullable — Used for facets that required different values for filtering and displaying. Category name/ID for in

---


## OmniumFacetViewModel

View model for facets

**Fields:**

- `facetType`: string, nullable — Facet type (E.g. size, color, etc)
- `facets`: List<`OmniumFacet`>, nullable — List of facets (E.g. red, green, large, medium, etc)

---


## OmniumFileDownloadRequest

**Fields:**

- `path`: string **required** — Relative path of the file

---


## OmniumGetMultipleResponse

The response contains found orders and the IDs of orders not found (if any).

**Fields:**

- `missingIds`: List<`string`>, nullable — IDs of orders that were not found
- `orders`: List<`OmniumOrder`>, nullable — The orders that were found

---


## OmniumIncludedFieldsOptions

Options for including fields

**Fields:**

- `specificFields`: List<`string`>, nullable — The list of fields to include. Fields should be camel cased and levels should be seperated with a do

---
