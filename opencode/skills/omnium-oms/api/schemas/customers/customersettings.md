# Customer Schemas — OmniumCustomerSettings to OmniumSalesLimitation

## OmniumCustomerSettings

**Fields:**

- `defaultProperties`: List<`OmniumDefaultPropertyItem`>, nullable
- `isB2BGetOrCreateDisabled`: boolean
- `isB2BGetOrCreateFromOrderDisabled`: boolean
- `isB2CGetOrCreateDisabled`: boolean
- `isB2CGetOrCreateFromOrderDisabled`: boolean
- `punchOutSettings`: → `OmniumPunchOutSettings`
- `requiredAddressProperties`: List<`string`>, nullable
- `tagSettings`: List<`OmniumTagSettings`>, nullable
- `useExternalBonusPointsProvider`: boolean
- `useStatsCustomerQueues`: boolean — If set, private customers will be copied to statsCustomers

---


## OmniumCustomerUpdateResult

**Fields:**

- `errorCount`: integer (int32)
- `errorMessage`: string, nullable
- `isModified`: boolean
- `notFoundCount`: integer (int32)
- `totalCount`: integer (int32)
- `unchangedCount`: integer (int32)
- `updatedCount`: integer (int32)

---


## OmniumPrivateCustomer

Private customer

**Fields:**

- `additionalMarketIds`: List<`string`>, nullable — Additional customer markets (beyond the primary MarketId)
- `address`: → `OmniumAddress`
- `addresses`: List<`OmniumAddress`>, nullable — Customer additional addresses
- `assortmentExcludeCategoryIds`: List<`string`>, nullable — Product category IDs to exclude from customer's assortment. Products in these categories will not be
- `assortmentIncludeCategoryIds`: List<`string`>, nullable — Product category IDs to include in customer's assortment. Only products in these categories will be 
- `birthDate`: string (date-time), nullable — Date of birth
- `bonusPoints`: integer (int32) — Number of bonus points earned by customer
- `consentHistory`: List<`OmniumConsentHistory`>, nullable — Consent history
- `consents`: List<`OmniumConsent`>, nullable — Customer consents
- `created`: string (date-time), nullable — Date and time the customer was created
- `customerDetails`: string, nullable — Customer details (brief summary for customer service representatives)
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable — Customer groups
- `customerId`: string **required** — Unique ID
- `customerNumber`: string, nullable — Customer identifier - does not have to be unique for each store, etc
- `customerRelations`: List<`OmniumCustomerRelation`>, nullable — Related customers
- `discountCoupons`: List<`OmniumDiscountCoupon`>, nullable — Personal discount coupons
- `email`: string, nullable — Customer e-mail
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external customer IDs
- `firstName`: string, nullable — First name
- `fullName`: string, nullable — Calculated - Full name
- `gender`: string, nullable — Gender
- `isCustomerClubMember`: boolean — True if customer is part of customer club
- `isGlobal`: boolean, nullable — If true, customer is available in all markets / stores
- `isInactive`: boolean, nullable — True if customer is inactive, and should not be able to make purchases
- `lastName`: string, nullable — Last name
- `marketGroupId`: string, nullable — Customer market group
- `marketId`: string, nullable — Customer primary market
- `modified`: string (date-time), nullable — Date and time the customer was modified
- `modifiedBy`: string, nullable — Name of the user or system the last modified the item
- `paymentTerms`: string, nullable — Payment terms (free text)
- `paymentTermsNet`: integer (int32), nullable — Net payment terms (days)
- `phone`: string, nullable — Customer phone number
- `preferredCurrency`: string, nullable — Customer preferred currency code (E.g. USD, NOK, EUR)
- `preferredLanguage`: string, nullable — Preferred customer language code
- `preferredShippingMethod`: string, nullable — Customer's preferred shipping method name (default selected in new carts)
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer properties, (key values)
- `storeIds`: List<`string`>, nullable — Customer favorite stores
- `tags`: List<`string`>, nullable — Tags for customer
- `url`: string, nullable — Customer url

---


## OmniumPrivateCustomerInfo

GDPR response object, containing user personal info (order, customer and project information)

**Fields:**

- `orders`: List<`OmniumOrder`>, nullable — Customer orders
- `privateCustomer`: → `OmniumPrivateCustomer`
- `projects`: List<`OmniumProject`>, nullable — Customer projects

---


## OmniumPrivateCustomerOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPrivateCustomer`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPrivateCustomerOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPrivateCustomer`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPrivateCustomerPatch

Private customer patch request

**Fields:**

- `additionalMarketIds`: List<`string`>, nullable — Additional customer markets (beyond the primary MarketId)
- `address`: → `OmniumAddress`
- `addresses`: List<`OmniumAddress`>, nullable — Customer additional addresses
- `birthDate`: string (date-time), nullable — Date of birth
- `bonusPoints`: integer (int32), nullable — Number of bonus points earned by customer
- `consents`: List<`OmniumConsent`>, nullable — Customer consents
- `customerDetails`: string, nullable — Customer details (brief summary for customer service representatives)
- `customerGroups`: List<`OmniumCustomerGroupReference`>, nullable — Customer groups
- `customerId`: string **required** — Unique ID
- `customerNumber`: string, nullable — Customer identifier - does not have to be unique for each store, etc
- `customerRelations`: List<`OmniumCustomerRelation`>, nullable — Related customers
- `email`: string, nullable — Customer e-mail
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external customer IDs
- `firstName`: string, nullable — First name
- `gender`: string, nullable — Gender
- `isCustomerClubMember`: boolean, nullable — True if customer is part of customer club
- `isGlobal`: boolean, nullable — If true, customer is available in all markets / stores
- `isInactive`: boolean, nullable — True if customer is inactive, and should not be able to make purchases
- `keepExistingCustomProperties`: boolean, nullable — Set to 'false' if you want to update the whole 'properties' list. If true, new properties will be ad
- `lastName`: string, nullable — Last name
- `marketGroupId`: string, nullable — Customer market group
- `marketId`: string, nullable — Customer primary market
- `paymentTerms`: string, nullable — Payment terms (free text)
- `paymentTermsNet`: integer (int32), nullable — Net payment terms (days)
- `phone`: string, nullable — Customer phone number
- `preferredCurrency`: string, nullable — Customer preferred currency code (E.g. USD, NOK, EUR)
- `preferredLanguage`: string, nullable — Preferred customer language code
- `preferredShippingMethod`: string, nullable — Customer's preferred shipping method name (default selected in new carts)
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer properties, (key values)
- `propertiesRemovalConditions`: List<`OmniumPropertyItem`>, nullable — Specifies conditions for removing existing properties before proceeding with the patch operation. Ea
- `storeIds`: List<`string`>, nullable — Customer favorite stores
- `tags`: List<`string`>, nullable — Tags for business customer
- `url`: string, nullable — Customer url

---


## OmniumPrivateCustomerViewModel

Info about customer and customer club membership

**Fields:**

- `customerClubMember`: → `OmniumCustomerClubMember`
- `privateCustomer`: → `OmniumPrivateCustomer`

---


## OmniumProjectCustomer

Project customer (private or business)

**Fields:**

- `additionalMarketIds`: List<`string`>, nullable — Additional customer markets (beyond the primary MarketId)
- `address`: → `OmniumAddress`
- `addresses`: List<`OmniumAddress`>, nullable — Customer additional addresses
- `assortmentExcludeCategoryIds`: List<`string`>, nullable — Product category IDs to exclude from customer's assortment. Products in these categories will not be
- `assortmentIncludeCategoryIds`: List<`string`>, nullable — Product category IDs to include in customer's assortment. Only products in these categories will be 
- `birthDate`: string (date-time), nullable — Date of birth
- `bonusPoints`: integer (int32) — Number of bonus points earned by customer
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
- `discountCoupons`: List<`OmniumDiscountCoupon`>, nullable — Personal discount coupons
- `discountGroups`: List<`string`>, nullable — List of customers discount groups
- `email`: string, nullable — Customer e-mail
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external customer IDs
- `firstName`: string, nullable — First name
- `fullName`: string, nullable — Calculated - Full name
- `gender`: string, nullable — Gender
- `isAssortmentRestricted`: boolean, nullable — Set to 'true' if the business customer has a restricted assortment. This is controlled by prices. If
- `isCustomerClubMember`: boolean — True if customer is part of customer club
- `isGlobal`: boolean, nullable — If true, customer is available in all markets / stores
- `isInactive`: boolean, nullable — True if customer is inactive, and should not be able to make purchases
- `lastName`: string, nullable — Last name
- `logo`: → `OmniumAsset`
- `marketGroupId`: string, nullable — Customer market group
- `marketId`: string, nullable — Customer primary market
- `modified`: string (date-time), nullable — Date and time the customer was modified
- `modifiedBy`: string, nullable — Name of the user or system the last modified the item
- `name`: string, nullable — Name of company
- `paymentTerms`: string, nullable — Payment terms (free text)
- `paymentTermsNet`: integer (int32), nullable — Net payment terms (days)
- `phone`: string, nullable — Customer phone number
- `preferredCurrency`: string, nullable — Customer preferred currency code (E.g. USD, NOK, EUR)
- `preferredLanguage`: string, nullable — Preferred customer language code
- `preferredShippingMethod`: string, nullable — Customer's preferred shipping method name (default selected in new carts)
- `priceGroups`: List<`string`>, nullable — List of customers price groups
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer properties, (key values)
- `storeIds`: List<`string`>, nullable — Customer favorite stores
- `tags`: List<`string`>, nullable — Tags for customer
- `taxId`: string, nullable — Tax ID, or other governmental identification number
- `url`: string, nullable — Customer url

---


## OmniumSalesLimitation

Class for Sales Limitation

**Fields:**

- `code`: string, nullable — Could be SKU / Product Id / Product Group ID / Barcode
- `customerId`: string, nullable — Customer ID
- `from`: string (date-time) — Excluded from
- `marketGroupId`: string, nullable — Market group ID
- `salesLimitationType`: string, nullable — SKU / ProductId / ProductGroupId / Barcode
- `to`: string (date-time) — Excluded to

---
