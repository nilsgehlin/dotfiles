# Customer Schemas — ContactPerson to OmniumCustomerSearchRequest

## ContactPerson

**Fields:**

- `address`: → `Address`
- `email`: string, nullable
- `externalIds`: List<`ExternalId`>, nullable
- `firstName`: string, nullable
- `id`: string, nullable
- `isPrimaryContact`: boolean
- `lastName`: string, nullable
- `notify`: boolean
- `phone`: string, nullable
- `privateCustomerId`: string, nullable
- `properties`: List<`PropertyItem`>, nullable
- `role`: string, nullable
- `roles`: List<`string`>, nullable

---


## OmniumAnalyticsContactPerson

**Fields:**

- `email`: string, nullable — Email address
- `firstName`: string, nullable — First name
- `lastName`: string, nullable — Last name
- `phone`: string, nullable — Phone number
- `privateCustomerId`: string, nullable — Private customer ID og the contact person (if ContactPerson is a registered customer)
- `role`: string, nullable — Role in company (deprecated - use Roles instead for multiple roles support)
- `roles`: List<`string`>, nullable — Roles in company

---


## OmniumAnalyticsCustomer

**Fields:**

- `customerEmail`: string, nullable
- `customerId`: string, nullable
- `customerName`: string, nullable
- `customerNumber`: string, nullable
- `customerPhone`: string, nullable
- `customerType`: string, nullable
- `isCustomerClubMember`: boolean
- `salesPersonId`: string, nullable

---


## OmniumBusinessCustomer

Business customer (Company)

**Fields:**

- `additionalMarketIds`: List<`string`>, nullable — Additional customer markets (beyond the primary MarketId)
- `address`: → `OmniumAddress`
- `addresses`: List<`OmniumAddress`>, nullable — Customer additional addresses
- `assets`: List<`OmniumAsset`>, nullable — Omnium assets for business customer
- `assortmentCodes`: List<`OmniumAssortmentCode`>, nullable — Assortment codes for the business customer - should match assortment products set on products. Produ
- `assortmentExcludeCategoryIds`: List<`string`>, nullable — Product category IDs to exclude from customer's assortment. Products in these categories will not be
- `assortmentIncludeCategoryIds`: List<`string`>, nullable — Product category IDs to include in customer's assortment. Only products in these categories will be 
- `businessCustomerCredit`: List<`OmniumBusinessCustomerCredit`>, nullable — Credit information for customer on different markets
- `consentHistory`: List<`OmniumConsentHistory`>, nullable — Consent history
- `consents`: List<`OmniumConsent`>, nullable — Customer consents
- `contacts`: List<`OmniumContactPerson`>, nullable — Contact persons in company
- `created`: string (date-time), nullable — Date and time the customer was created
- `creditBalance`: number (decimal), nullable — Customer's credit balance
- `creditLimit`: number (decimal), nullable — Customer's credit limit
- `creditRemaining`: number (decimal), nullable — Customer's remaining credits
- `customerDetails`: string, nullable — Customer details (brief summary for customer service representatives)
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable — Customer groups
- `customerId`: string **required** — Unique ID
- `customerNumber`: string, nullable — Customer identifier - does not have to be unique for each store, etc
- `customerRelations`: List<`OmniumCustomerRelation`>, nullable — Related customers
- `discountGroups`: List<`string`>, nullable — List of customers discount groups
- `email`: string, nullable — Customer e-mail
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external customer IDs
- `isAssortmentRestricted`: boolean, nullable — Set to 'true' if the business customer has a restricted assortment. This is controlled by prices. If
- `isCreditDenied`: boolean, nullable — Customer's credit is denied if true
- `isGlobal`: boolean, nullable — If true, customer is available in all markets / stores
- `isInactive`: boolean, nullable — True if customer is inactive, and should not be able to make purchases
- `logo`: → `OmniumAsset`
- `marketGroupId`: string, nullable — Customer market group
- `marketId`: string, nullable — Customer primary market
- `modified`: string (date-time), nullable — Date and time the customer was modified
- `modifiedBy`: string, nullable — Name of the user or system the last modified the item
- `name`: string, nullable — Name of company
- `notificationEmailAddresses`: List<`string`>, nullable — Emails for notifications (comma separated)
- `notificationPhoneNumbers`: List<`string`>, nullable — Phone numbers for notifications (comma separated)
- `paymentTerms`: string, nullable — Payment terms (free text)
- `paymentTermsNet`: integer (int32), nullable — Net payment terms (days)
- `phone`: string, nullable — Customer phone number
- `preferredCurrency`: string, nullable — Customer preferred currency code (E.g. USD, NOK, EUR)
- `preferredLanguage`: string, nullable — Preferred customer language code
- `preferredShippingMethod`: string, nullable — Customer's preferred shipping method name (default selected in new carts)
- `priceGroups`: List<`string`>, nullable — List of customers price groups
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer properties, (key values)
- `punchOutDomain`: string, nullable — When using punch-out domain
- `punchOutPropertyOverrides`: List<`OmniumPropertyItem`>, nullable — When using puch-out orders, this list will provide information about property mapping
- `punchOutUnitConversionList`: string, nullable — When using puch-out orders, unit conversion lists can be defined in settings. This reflects the corr
- `storeIds`: List<`string`>, nullable — Customer favorite stores
- `tags`: List<`string`>, nullable — Tags for business customer
- `taxId`: string, nullable — Tax ID, or other governmental identification number
- `url`: string, nullable — Customer url

---


## OmniumBusinessCustomerCredit

**Fields:**

- `creditBalance`: number (decimal), nullable — Customer's credit balance
- `creditCurrency`: string, nullable — Customer's credit currency
- `creditLimit`: number (decimal), nullable — Customer's credit limit
- `creditRemaining`: number (decimal), nullable — Customer's remaining credits
- `id`: string, nullable — The unique identifier of the credit information for the customer
- `isCreditDenied`: boolean, nullable — Customer's credit is denied if true
- `marketId`: string, nullable — The market for the credit information

---


## OmniumBusinessCustomerOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumBusinessCustomer`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumBusinessCustomerPatch

Business customer patch request

**Fields:**

- `additionalMarketIds`: List<`string`>, nullable — Additional customer markets (beyond the primary MarketId)
- `address`: → `OmniumAddress`
- `addresses`: List<`OmniumAddress`>, nullable — Customer additional addresses
- `consents`: List<`OmniumConsent`>, nullable — Customer consents
- `contacts`: List<`OmniumContactPerson`>, nullable — Contact persons in company
- `creditBalance`: number (decimal), nullable — Customer's credit balance
- `creditLimit`: number (decimal), nullable — Customer's credit limit
- `creditRemaining`: number (decimal), nullable — Customer's remaining credits
- `customerDetails`: string, nullable — Customer details (brief summary for customer service representatives)
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable — Customer groups
- `customerId`: string **required** — Unique ID
- `customerNumber`: string, nullable — Customer identifier - does not have to be unique for each store, etc
- `customerRelations`: List<`OmniumCustomerRelation`>, nullable — Related customers
- `email`: string, nullable — Customer e-mail
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external customer IDs
- `isAssortmentRestricted`: boolean, nullable — Set to 'true' if the business customer has a restricted assortment. This is controlled by prices. If
- `isCreditDenied`: boolean, nullable — Customer's credit is denied if true
- `isGlobal`: boolean, nullable — If true, customer is available in all markets / stores
- `isInactive`: boolean, nullable — True if customer is inactive, and should not be able to make purchases
- `keepExistingCustomProperties`: boolean, nullable — Set to 'false' if you want to update the whole 'properties' list. If true, new properties will be ad
- `marketGroupId`: string, nullable — Customer market group
- `marketId`: string, nullable — Customer primary market
- `name`: string, nullable — Name of company
- `notificationEmailAddresses`: List<`string`>, nullable — Emails for notifications (comma separated)
- `notificationPhoneNumbers`: List<`string`>, nullable — Phone numbers for notifications (comma separated)
- `paymentTerms`: string, nullable — Payment terms (free text)
- `paymentTermsNet`: integer (int32), nullable — Net payment terms (days)
- `phone`: string, nullable — Customer phone number
- `preferredCurrency`: string, nullable — Customer preferred currency code (E.g. USD, NOK, EUR)
- `preferredLanguage`: string, nullable — Preferred customer language code
- `preferredShippingMethod`: string, nullable — Customer's preferred shipping method name (default selected in new carts)
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer properties, (key values)
- `propertiesRemovalConditions`: List<`OmniumPropertyItem`>, nullable — Specifies conditions for removing existing properties before proceeding with the patch operation. Ea
- `punchOutDomain`: string, nullable — When using punch-out domain
- `punchOutPropertyOverrides`: List<`OmniumPropertyItem`>, nullable — When using puch-out orders, this list will provide information about property mapping
- `punchOutUnitConversionList`: string, nullable — When using puch-out orders, unit conversion lists can be defined in settings. This reflects the corr
- `storeIds`: List<`string`>, nullable — Customer favorite stores
- `tags`: List<`string`>, nullable — Tags for business customer
- `taxId`: string, nullable — Tax ID, or other governmental identification number
- `url`: string, nullable — Customer url

---


## OmniumChangeCustomerId

**Fields:**

- `fromCustomerId`: string **required**
- `toCustomerId`: string **required**

---


## OmniumConsent

Used for storing GDPR constens. All customers can have multiple consents of any kind.

**Fields:**

- `content`: string, nullable — Content / text describing consent given-
- `date`: string (date-time), nullable — Date of consent
- `description`: string, nullable — Consent description
- `marketIds`: List<`string`>, nullable — MarketIds for access control of consents
- `source`: string, nullable — Consent source. E.g. Web, PoS, customer service call, etc.
- `status`: boolean — True if active
- `type`: string, nullable — Consent type. Could have any value.

---


## OmniumConsentHistory

Store historic consents

**Fields:**

- `content`: string, nullable — Content / text describing consent given-
- `date`: string (date-time), nullable — Date of consent
- `description`: string, nullable — Consent description
- `marketIds`: List<`string`>, nullable — MarketIds for access control of consents
- `source`: string, nullable — Consent source. E.g. Web, PoS, customer service call, etc.
- `status`: boolean — True if active
- `type`: string, nullable — Consent type. Could have any value.

---


## OmniumContactPerson

Person class. Used for contact persons in businesses.

**Fields:**

- `address`: → `OmniumAddress`
- `email`: string, nullable — E-mail
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external contact person IDs
- `firstName`: string, nullable — First name
- `id`: string, nullable — Contact person ID
- `isPrimaryContact`: boolean — True if person is primary contact person for company
- `lastName`: string, nullable — Last name
- `notify`: boolean — True if this contact person receive notifications
- `phone`: string, nullable — Phone number
- `privateCustomerId`: string, nullable — Reference to private customer. Used to connect contact person to private customer as a private perso
- `properties`: List<`OmniumPropertyItem`>, nullable — Contact properties, (key values)
- `role`: string, nullable — Role in company (deprecated - use Roles instead for multiple roles support)
- `roles`: List<`string`>, nullable — Roles in company

---


## OmniumCustomerClubConsents

Consents for customer club

**Fields:**

- `approvedConsents`: boolean — Has customer approved consents
- `emailMarketing`: boolean — Has customer approved email marketing
- `smsMarketing`: boolean — Has customer approved sms marketing

---


## OmniumCustomerClubInterests

List of Interest the user can subscribe to

**Fields:**

- `displayName`: string, nullable — User friendly name of the interest
- `languageCode`: string, nullable — two letter lang code. Used if interest is only valid for one language/market
- `name`: string, nullable — Name of the interest

---


## OmniumCustomerClubMember

Class for customer club member

**Fields:**

- `birthDate`: string (date-time), nullable — Date of birth
- `consentHistory`: List<`OmniumConsentHistory`>, nullable
- `consents`: → `OmniumCustomerClubConsents`
- `customerClubConsents`: List<`OmniumConsent`>, nullable
- `customerId`: string, nullable — Unique customerId
- `customerName`: string, nullable — Full name of customer
- `email`: string, nullable — Customer e-mail
- `firstName`: string, nullable — First name
- `interests`: List<`string`>, nullable — Customer selected Interests
- `lastName`: string, nullable — Last name
- `marketId`: string, nullable — Customer market
- `memberSince`: string (date-time) — When the membership started
- `membershipEndDate`: string (date-time), nullable — When the membership ended
- `membersshipApproved`: string (date-time), nullable — When the membership was approved by customer(can be null if customer has not approved yet)
- `phone`: string, nullable — Customer phone number
- `properties`: List<`OmniumPropertyItem`>, nullable — Property list
- `salesPersonId`: string, nullable — Id of the person who recruited the member
- `storeId`: string, nullable — Id of signup store
- `summary`: → `OmniumCustomerClubPointsSummary`
- `tier`: → `OmniumCustomerClubMemberTier`
- `validPoints`: List<`OmniumCustomerClubValidPoints`>, nullable — List of valid points, with created and expire dates

---


## OmniumCustomerClubMemberOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumCustomerClubMember`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumCustomerClubMemberPatchRequest

Used to update a customerClub member, with consents and interests

**Fields:**

- `consents`: → `OmniumCustomerClubConsents`
- `interests`: List<`string`>, nullable — Interests. This will override existing interests
- `storeId`: string, nullable — Signup store id, could we webShop, or a physical store

---


## OmniumCustomerClubMemberSearchRequest

Customer club member search request

**Fields:**

- `customerIds`: List<`string`>, nullable — Filter by customerIds
- `emailMarketingConsent`: boolean, nullable — Filter by value of email marketing consent
- `marketIds`: List<`string`>, nullable — Filter by market IDs
- `page`: integer (int32) — Paged search - page
- `storeIds`: List<`string`>, nullable — Filter by store IDs
- `take`: integer (int32) — Paged search - number of items to retrieve

---


## OmniumCustomerClubMemberTier

**Fields:**

- `name`: string, nullable — Name for the tier
- `tierEnd`: string (date-time), nullable — Date for when the customer will leave the Tier/Level
- `tierId`: string, nullable — Id for the tier
- `tierStart`: string (date-time), nullable — Date for when the customer entered the Tier/Level
- `tierSummary`: → `OmniumCustomerClubMemberTierSummary`

---


## OmniumCustomerClubMemberTierSummary

**Fields:**

- `amount`: number (decimal), nullable — Current tier amount
- `amountToNextTier`: number (decimal), nullable — Amount to reach next tier
- `numberOfOrders`: integer (int32), nullable — Number of order in current tier perios

---


## OmniumCustomerClubPointsSummary

Summary for customer club member. Balance, used points, reserved points etc

**Fields:**

- `currentBalance`: number (decimal) — Points available for usage
- `expiredPoints`: number (decimal) — Points that has expired, and can not be used any more
- `newPointsOnHold`: number (decimal) — Points created by orders that are not prosessed
- `reservedPoints`: number (decimal) — Used points by orders that are not prosessed
- `totalIssuedPoints`: number (decimal) — Total issued points for this member
- `usedPoints`: number (decimal) — Total points used for this member

---


## OmniumCustomerClubValidPoints

Class with information about valid points, and expire date

**Fields:**

- `created`: string (date-time) — When points was generated
- `expireDate`: string (date-time) — When points will expire
- `orderId`: string, nullable — OrderId for this points. Can be empty if manually given
- `pointAmount`: number (decimal) — Amount of points valid for this periode
- `skuIds`: List<`string`>, nullable — ProductIds for this points, Can be empty if manually given

---


## OmniumCustomerCommentRequest

Request model for adding a comment to a customer

**Fields:**

- `commentText`: string, nullable — The comment text/message content
- `createdBy`: string, nullable — The sender/creator of the comment (e.g., "API", "System", external service name). Defaults to "API" 
- `customerId`: string, nullable — Customer ID (e.g., email address or customer number)
- `emailBcc`: string, nullable — Email BCC recipients (semicolon separated)
- `emailCc`: string, nullable — Email CC recipients (semicolon separated)
- `emailFrom`: string, nullable — Email from address. Falls back to store's default email if not specified.
- `emailSubject`: string, nullable — Email subject line
- `emailTo`: string, nullable — Email recipient address. Falls back to customer's email if not specified.
- `marketId`: string, nullable — Market ID (optional, uses customer's market if not specified)
- `sendEmail`: boolean — Send email notification to customer
- `sendSms`: boolean — Send SMS notification to customer
- `senderName`: string, nullable — Sender display name for email and SMS notifications. Falls back to store's default sender name if no
- `smsPhoneNumber`: string, nullable — Phone number for SMS. Falls back to customer's phone if not specified.
- `tags`: List<`string`>, nullable — Tags for categorizing/filtering comments

---


## OmniumCustomerGroup

Customer group

**Fields:**

- `created`: string (date-time), nullable — Customer group created date
- `displayName`: string, nullable — Customer group display name
- `externalIds`: List<`OmniumExternalId`>, nullable — Customer group external Ids
- `id`: string, nullable — Customer group ID
- `modified`: string (date-time), nullable — Customer group modified date
- `name`: string, nullable — Customer group name
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer group properties

---


## OmniumCustomerGroupOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumCustomerGroup`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumCustomerGroupReference

Customer group reference

**Fields:**

- `id`: string, nullable — Customer group ID
- `name`: string, nullable — Customer group name

---


## OmniumCustomerGroupSearchRequest

Customer group search request

**Fields:**

- `createdFrom`: string (date-time), nullable — Created from date
- `createdTo`: string (date-time), nullable — Created to date
- `customerGroupIds`: List<`string`>, nullable — List of Ids for customer groups to retrieve
- `externalIds`: List<`string`>, nullable — External Ids
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `searchText`: string, nullable — Search text
- `take`: integer (int32) — Number of items to take

---


## OmniumCustomerRelation

Customer reference for defining customers relations

**Fields:**

- `customerId`: string, nullable — ID of the customer referenced
- `customerType`: string, nullable — Customer type (B2B, B2C)
- `externalIds`: List<`OmniumExternalId`>, nullable — External IDs
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `relationType`: string, nullable — Relation type (InvoiceReceiver, GoodsReceiver, etc - configurable in settings)

---


## OmniumCustomerSearchRequest

Customer search request

**Fields:**

- `consentTypes`: List<`string`>, nullable — List of consent types. Will filter customers for any active consent of given types.
- `createdFrom`: string (date-time), nullable — Customer created from date
- `createdTo`: string (date-time), nullable — Customer created before date
- `customerGroups`: List<`string`>, nullable — Filter by customer groups
- `customerId`: string, nullable — Filter by customer
- `customerIds`: List<`string`>, nullable — Filter by multiple customer IDs
- `customerNumbers`: List<`string`>, nullable — Filter by multiple customer numbers
- `email`: string, nullable — Filter by customer email
- `excludedTags`: List<`string`>, nullable — Filter by excluding tags
- `externalIds`: List<`string`>, nullable — Search by external IDs
- `isCustomerClubMember`: boolean, nullable — If true, search will only include customers that are members of a customer club. If false, only non-
- `isGlobal`: boolean, nullable — If true, search will include all customers marked as global. If false all customers marked as global
- `isInactive`: boolean, nullable — If true, search will include all customers marked as inactive. If false all customers marked as inac
- `isMarketGroupIdsRequired`: boolean, nullable — Set to 'true' to exclude customers without any MarketGroupId set. If 'false', customers without mark
- `isStoreIdsRequired`: boolean, nullable — Set to 'true' to exclude customers without any Store IDs set. If 'false', customers without store ID
- `marketGroupIds`: List<`string`>, nullable — Filter for market group IDs
- `marketIds`: List<`string`>, nullable — Filter for market IDs
- `modifiedFrom`: string (date-time), nullable — Customer modified from date
- `modifiedTo`: string (date-time), nullable — Customer modified before date
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `phone`: string, nullable — Filter by customer phone
- `projectTypeId`: string, nullable — Filter on customers available as partners on a project type. (Only available on business customer se
- `properties`: List<`OmniumPropertyItem`>, nullable — List with custom properties to search for
- `query`: string, nullable — Search by free text query
- `searchStoreGroups`: boolean — If true, search will include all stores with same store group ID as for the stores with given StoreI
- `sortOrder`: string, nullable — Sort order (ModifiedAscending, ModifiedDescending, CreatedAscending, CreatedDescending)
- `storeGroupId`: string, nullable — Filter by store group ID (will override StoreIds if set)
- `storeIds`: List<`string`>, nullable — Filter for store IDs
- `tags`: List<`string`>, nullable — Customer tags
- `take`: integer (int32) — Number of items to take
- `taxId`: string, nullable — Filter by customer

---
