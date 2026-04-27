# Common / Shared Schemas — Price to TemplateAttachmentReference

## Price

**Fields:**

- `cost`: number (decimal)
- `currencyCode`: string, nullable
- `customerGroup`: string, nullable
- `customerGroupName`: string, nullable
- `customerId`: string, nullable
- `discountAmount`: number (decimal)
- `discountCustomerGroupId`: string, nullable
- `discountCustomerId`: string, nullable
- `discountPercent`: number (decimal)
- `discountProductGroupId`: List<`string`>, nullable
- `externalId`: string, nullable
- `hasDiscount`: boolean
- `isBackorder`: boolean
- `isCustomerClubSpecificPrice`: boolean
- `isDefaultPrice`: boolean
- `isExternalPrice`: boolean, nullable
- `isExternalPromotion`: boolean, nullable
- `isTaxExcluded`: boolean
- `marketGroupId`: string, nullable
- `marketId`: string, nullable
- `marketName`: string, nullable
- `marketType`: string, nullable
- `maxQuantity`: number (decimal)
- `minQuantity`: number (decimal)
- `modified`: string (date-time), nullable
- `originalUnitPrice`: number (decimal)
- `priceCode`: string, nullable
- `priceListId`: string, nullable
- `priceListItemId`: string, nullable
- `priceType`: string, nullable
- `productId`: string, nullable
- `promotionId`: string, nullable
- `promotionName`: string, nullable
- `promotionPriority`: integer (int32), nullable
- `properties`: List<`PropertyItem`>, nullable
- `recommendedRetailPrice`: number (decimal)
- `salesCode`: string, nullable
- `storeGroupId`: string, nullable
- `storeId`: string, nullable
- `tags`: List<`string`>, nullable
- `taxRate`: number (decimal), nullable
- `unit`: string, nullable
- `unitPrice`: number (decimal)
- `validFrom`: string (date-time)
- `validUntil`: string (date-time), nullable
- `variantId`: string, nullable

---


## ProblemDetails

*(No properties defined — likely a wrapper or marker type)*

---


## PropertyItem

**Fields:**

- `key`: string, nullable
- `keyGroup`: string, nullable
- `value`: string, nullable
- `valueType`: string, nullable

---


## RecurringSettings

**Fields:**

- `active`: boolean
- `endDate`: string (date-time), nullable
- `lastRecurrence`: string (date-time), nullable
- `recurringDay0`: boolean
- `recurringDay1`: boolean
- `recurringDay2`: boolean
- `recurringDay3`: boolean
- `recurringDay4`: boolean
- `recurringDay5`: boolean
- `recurringDay6`: boolean
- `recurringDayOfMonth`: integer (int32)
- `recurringDayOfWeek`: integer (int32)
- `recurringMonthOfYear`: integer (int32)
- `recurringSeparationCount`: integer (int32)
- `recurringTime`: integer (int32)
- `recurringType`: string, nullable
- `recurringWeekOfMonth`: integer (int32)
- `startDate`: string (date-time), nullable
- `time`: string (date-time), nullable

---


## ReturnCharge

**Fields:**

- `amount`: number (decimal)
- `key`: string, nullable

---


## Reward

**Fields:**

- `percentage`: number (decimal)
- `percentageSteps`: List<`PromotionPercentageStep`>, nullable
- `promotionAmounts`: List<`PromotionAmount`>, nullable
- `usePercentage`: boolean

---


## RewardType

**Enum values:** `['None', 'Money', 'Percentage', 'Free', 'FixedPrice', 'Gift', 'MultiBuys', 'Kit']`

---


## SalesType

**Fields:**

- `giftCardCount`: integer (int32)
- `productCount`: integer (int32)
- `serviceCount`: integer (int32)

---


## ScimEmail

Email addresses for the user

**Fields:**

- `primary`: boolean, nullable — A Boolean value indicating the 'primary' or preferred attribute value
- `type`: string, nullable — A label indicating the attribute's function (e.g., 'work' or 'home')
- `value`: string, nullable — Email address value

---


## ScimError

SCIM Error response

**Fields:**

- `detail`: string, nullable — A detailed human-readable message
- `schemas`: List<`string`>, nullable — The URIs that are used to indicate the namespaces of the SCIM schemas
- `scimType`: string, nullable — A SCIM detail error keyword
- `status`: integer (int32) — The HTTP status code

---


## ScimGroup

SCIM Group resource based on urn:ietf:params:scim:schemas:core:2.0:Group

**Fields:**

- `displayName`: string, nullable — A human-readable name for the Group
- `externalId`: string, nullable — An identifier for the resource as defined by the provisioning client
- `id`: string, nullable — Unique identifier for the SCIM resource
- `members`: List<`ScimGroupMember`>, nullable — A list of members of the Group
- `meta`: → `ScimMeta`
- `schemas`: List<`string`>, nullable — The URIs that are used to indicate the namespaces of the SCIM schemas

---


## ScimGroupMember

A member of a SCIM group

**Fields:**

- `display`: string, nullable — A human-readable name for the member
- `ref`: string, nullable — The URI corresponding to a SCIM resource that is a member of this Group
- `type`: string, nullable — A label indicating the type of resource (e.g., 'User' or 'Group')
- `value`: string, nullable — The identifier of the member of this Group (omnium user id)

---


## ScimGroupScimListResponse

SCIM List Response for paginated queries

**Fields:**

- `itemsPerPage`: integer (int32), nullable — The number of resources returned in a list response page
- `resources`: List<`ScimGroup`>, nullable — A multi-valued list of complex objects containing the requested resources
- `schemas`: List<`string`>, nullable — The URIs that are used to indicate the namespaces of the SCIM schemas
- `startIndex`: integer (int32), nullable — The 1-based index of the first result in the current set of list results
- `totalResults`: integer (int32) — The total number of results returned by the list or query operation

---


## ScimMeta

Metadata about a SCIM resource

**Fields:**

- `created`: string, nullable — The DateTime that the resource was added to the service provider
- `lastModified`: string, nullable — The most recent DateTime that the details of this resource were updated
- `location`: string, nullable — The URI of the resource being returned
- `resourceType`: string, nullable — The name of the resource type of the resource

---


## ScimPatchOperation

A single SCIM patch operation

**Fields:**

- `op`: string, nullable — The operation to perform (add, remove, replace)
- `path`: string, nullable — The attribute path describing the target of the operation
- `value`: object, nullable — The value to be used in the operation

---


## ScimPatchRequest

SCIM PATCH request based on urn:ietf:params:scim:api:messages:2.0:PatchOp

**Fields:**

- `operations`: List<`ScimPatchOperation`>, nullable — A list of patch operations to be performed
- `schemas`: List<`string`>, nullable — The URIs that are used to indicate the namespaces of the SCIM schemas

---


## ScimPhoneNumber

Phone number for the user

**Fields:**

- `primary`: boolean, nullable — A Boolean value indicating the 'primary' or preferred attribute value
- `type`: string, nullable — A label indicating the attribute's function (e.g., 'work', 'home', 'mobile')
- `value`: string, nullable — Phone number value

---


## ScimRole

Role for the user

**Fields:**

- `display`: string, nullable — A human-readable name for the role
- `primary`: boolean, nullable — A Boolean value indicating the 'primary' or preferred attribute value
- `type`: string, nullable — A label indicating the attribute's function
- `value`: string, nullable — The value of the role (omnium role id)

---


## ScimUser

SCIM User resource based on urn:ietf:params:scim:schemas:core:2.0:User

**Fields:**

- `active`: boolean — A Boolean value indicating the User's administrative status
- `displayName`: string, nullable — The name of the User, suitable for display to end-users
- `emails`: List<`ScimEmail`>, nullable — Email addresses for the user
- `externalId`: string, nullable — An identifier for the resource as defined by the provisioning client
- `groups`: List<`ScimUserGroup`>, nullable — A list of groups to which the user belongs
- `id`: string, nullable — Unique identifier for the SCIM resource
- `meta`: → `ScimMeta`
- `name`: → `ScimUserName`
- `phoneNumbers`: List<`ScimPhoneNumber`>, nullable — Phone numbers for the User
- `roles`: List<`ScimRole`>, nullable — A list of roles for the User
- `schemas`: List<`string`>, nullable — The URIs that are used to indicate the namespaces of the SCIM schemas
- `userName`: string, nullable — Unique identifier for the User, typically used by the user to directly authenticate

---


## ScimUserGroup

Group membership for the user

**Fields:**

- `display`: string, nullable — A human-readable name for the Group
- `ref`: string, nullable — The URI of the corresponding 'Group' resource
- `type`: string, nullable — A label indicating the attribute's function (e.g., 'direct' or 'indirect')
- `value`: string, nullable — The identifier of the User's group

---


## ScimUserName

The components of the user's real name

**Fields:**

- `familyName`: string, nullable — The family name of the User, or last name
- `formatted`: string, nullable — The full name, including all middle names, titles, and suffixes
- `givenName`: string, nullable — The given name of the User, or first name

---


## ScimUserScimListResponse

SCIM List Response for paginated queries

**Fields:**

- `itemsPerPage`: integer (int32), nullable — The number of resources returned in a list response page
- `resources`: List<`ScimUser`>, nullable — A multi-valued list of complex objects containing the requested resources
- `schemas`: List<`string`>, nullable — The URIs that are used to indicate the namespaces of the SCIM schemas
- `startIndex`: integer (int32), nullable — The 1-based index of the first result in the current set of list results
- `totalResults`: integer (int32) — The total number of results returned by the list or query operation

---


## SitooVatGroupDetail

**Fields:**

- `moneyTotal`: string, nullable
- `moneyTotalNet`: string, nullable
- `moneyTotalVat`: string, nullable
- `vatValue`: number (decimal)

---


## SitooZReportUnique

**Fields:**

- `address`: → `OmniumAddress`
- `cashManagement`: → `CashManagement`
- `comment`: string, nullable
- `currencyCode`: string, nullable
- `currencyConversions`: List<`object`>, nullable
- `dateAdded`: string (date-time)
- `dateOpened`: string (date-time)
- `discountsRefund`: List<`SitooDiscountDetail`>, nullable
- `eshopId`: integer (int32)
- `grandTotalRefund`: string, nullable
- `grandTotalSales`: string, nullable
- `manufacturerId`: string, nullable
- `paymentsRefund`: List<`SitooPaymentDetail`>, nullable
- `practice`: → `Practice`
- `productGroupsRefund`: List<`SitooProductGroupDetail`>, nullable
- `refundItemsCount`: integer (int32)
- `refundTotalNet`: string, nullable
- `registerId`: string, nullable
- `registerKey`: string, nullable
- `registerNumber`: integer (int32)
- `roundOff`: string, nullable
- `salesItemsCount`: integer (int32)
- `salesTaxesRefund`: List<`object`>, nullable
- `salesTaxesSales`: List<`object`>, nullable
- `salesTotalNet`: string, nullable
- `salesType`: → `SalesType`
- `staffUserId`: string, nullable
- `storeId`: string, nullable
- `summaryRoundOff`: string, nullable
- `summarySalesTax`: string, nullable
- `summarySubtotal`: string, nullable
- `vatGroupsRefund`: List<`SitooVatGroupDetail`>, nullable

---


## SmsMessage

**Fields:**

- `from`: string, nullable
- `market`: string, nullable
- `notificationId`: string, nullable
- `referenceId`: string, nullable
- `tenantId`: string, nullable
- `text`: string, nullable
- `to`: List<`string`>, nullable

---


## TemplateAttachmentReference

**Fields:**

- `templateReference`: string, nullable

---
