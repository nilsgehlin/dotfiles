# Customers — B2C, B2B, Loyalty & CRM — [Customer Club — Feature Overview](#customer-club--feature-overview)

## [Customer Club — Feature Overview](#customer-club--feature-overview)

The **Customer Club** in Omnium (requires an additional license) provides a loyalty and membership framework designed to enhance customer engagement and reward repeat purchases. When enabled, it offers:

### [Key Capabilities](#key-capabilities)

*   **Membership management**
    
    *   Create approved or pending memberships
    *   Track and update consents
    *   Access customer segmentation features
    *   Support for newsletters (additional license required)
*   **Bonus point system**
    
    *   Earn points on purchases
    *   Use points as a payment method via the BonusPoints provider
    *   Award **sign-up points** to new customers
    *   Support birthday points and point-expiration rules
*   **Checkout and cart logic**
    
    *   Automatic evaluation of membership status and consents
    *   Promotion and campaign compatibility even when Customer Club is disabled (limited functionality)

### [API & Integration Features](#api--integration-features)

*   Endpoints to create, update, and delete memberships
*   Access to customer point balances for payment flows
*   Support for pending memberships that can later be completed via a consent-approval flow

### [Automated Notifications](#automated-notifications)

*   Membership completion (for pending members)
*   Birthday points
*   Points expiring soon
*   Current point balance updates

### [Workflow Integration](#workflow-integration)

*   Workflow steps for calculating, earning, canceling, and capturing bonus points
*   Payment authorization and capture using the BonusPoints payment provider


## [API Usage](#api-usage)

*   If the **Customer Club** is enabled, use the **Customer Club Member** API endpoints to manage membership data.
*   If the feature is disabled, the `isCustomerClubMember` attribute in the customer data is used to check membership status. This provides limited functionality but still supports promotions and campaigns.


## [Customer Club Model](#customer-club-model)

For more details on the Customer Club structure, refer to the [Omnium Customer Club Member Model](https://api.omnium.no/documentation/index.html#/model-OmniumCustomerClubMember).

#### [Customer Club Api](#customer-club-api)

*   [Add approved member](https://api.omnium.no/documentation/index.html#/Customers%20%7C%20B2C/PrivateCustomersAddNewCustomerClubMemberWithConsentList). Use this when the customer is able to read and approve consents.
*   [Add pending member](https://api.omnium.no/documentation/index.html#/Customers%20%7C%20B2C/PrivateCustomersAddNewPendingCustomerClubMember). Use this if the customer is in a physical store and cannot approve consents online. This endpoint adds a pending membership. The customer can earn bonus points, but cannot use them until the consents are approved. Set up a notification in Omnium of type "CustomerClub-complete-membership". In this notification, you can send the customer an SMS with a link to your website where they can log in and approve consents.
*   [Update consents](https://api.omnium.no/documentation/index.html#/Customers%20%7C%20B2C/PrivateCustomersUpdateCustomerClubMemberConsentList). Update consents to "approved" or change consent preferences
*   [Delete membership](https://api.omnium.no/documentation/index.html#/Customers%20%7C%20B2C/PrivateCustomersRemoveCustomerClubMember). Delete the customer club membership. The private customer object is not deleted — only the customer club membership object and all related bonus points are removed.

#### [Customer Club Notifications](#customer-club-notifications)

*   CustomerClub-complete-membership: As described above, this can be used to send the customer a link for approving consents online. If configured, it will be triggered when using the Add pending membership endpoint.
*   CustomerClub-birthday-points: If birthday points are configured in the settings, this notification will be triggered on the customer’s birthday. It requires the **CustomerClubBirthdayScheduledTask** to be configured.
*   CustomerClub-points-expire: Based on the setting **Notification threshold for points expiration**, this notification sends the customer an email with details about bonus points that are about to expire. Require the **CustomerClubExpireSoonNotificationScheduledTask** to be configured.
*   CustomerClub-points-balance: Gives the customer a email with it's bonus point balance. Settings used for this is **Lowest point balance** (min balance before sending notification) and **Minimun days between notifications** (how often should the customer get this notification).

#### [Bonus points and workflow steps](#bonus-points-and-workflow-steps)

##### [Earn bonus points](#earn-bonus-points)

Make sure to configure setting for **Default bonus level** and **Days in which points are valid**

*   Customer Club - Calculate new points on hold: This workflow step should be added to your first order status. It calculates the bonus points the customer will earn for the order.
*   Customer Club - Move from on hold to earned points: This workflow step should be added to your status when order is completed. It moves points on hold to earned.
*   Customer Club - Cancel new points on hold: This workflow step should be added to your status when order is completed and on canceled status. It cancels all points earned on items that will not be shipped.

##### [Use bonus points as payment](#use-bonus-points-as-payment)

*   Configure a bonus point payment provider: Add a new payment provider in settings. Use the Provider: **BonusPoints** and set also **BonusPoints** as payment method name. In your checkout on the ecom site, use [Get customer club member](https://api.omnium.no/documentation/index.html#/Customers%20%7C%20B2C/PrivateCustomersGetCustomerClubMember). If customer is a member, you can use the **currentBalance** for payment.
    
*   [Add payment](https://api.omnium.no/documentation/index.html#/Carts%20%7C%20Checkout/CartAddPaymentToCart). Set **paymentMethodName** to "BonusPoints" and **TransactionType** to "AwaitingAuthorization". Here is a example:
    

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "amount": 89,
        "paymentMethodName": "BonusPoints",
        "status": "Processed",
        "transactionId": "eac499a4-71e6-4217-a9f8-73c860a6b027",
        "transactionType": "AwaitingAuthorization",
        "created": "2025-08-22T11:30:27.717+00:00"
    }

*   Add workflow step **Authorize payment** on your first order status as the first step. This will check the customers point balance and change the payment to "Authorization".
*   The **BonusPoints** payment provider acts as a standard payment provider like Klarna, Adyen etc. So if you have added workflow step "Capture payment", bonus points will be capture when order is completed. Same for credit.

* * *

[

Previous

Customer Management

](/docs/Customer/customer-management)[

Next

Newsletter

](/docs/Customer/newsletter)

---


## Customer Management

[Customer](/docs/Customer)

# Customer Management

How to work with B2C and B2B customers in Omnium — data model, API patterns, search, privacy, and integration.


## [Overview](#overview)

Omnium manages two distinct customer types: **private customers** (B2C) for individual consumers, and **business customers** (B2B) for companies and organizations. Both types share a common foundation — addresses, external IDs, consents, tags, custom properties — but differ in the features built on top.

Private Customer (B2C)

Business Customer (B2B)

**Identity**

First name + last name

Company name

**Contacts**

Single person

Multiple contact persons (up to 1,000)

**Financial**

Bonus points (loyalty)

Credit management (balance, limit, per market)

**Product access**

Shared catalog

Restricted assortment per customer

**Discounts**

Coupons, customer club promotions

Price groups, discount groups

**Procurement**

N/A

PunchOut / OCI / cXML support

**Privacy**

GDPR anonymization

Standard deletion

**Loyalty**

Customer club membership, tiers, points

N/A

* * *


## [Customer Data Model](#customer-data-model)

### [Common Fields](#common-fields)

Every customer — B2C and B2B — has the following:

Field

Description

`customerId`

Unique identifier (GUID by default, or email/phone if configured)

`customerNumber`

Human-readable number (auto-generated or imported)

`email`, `phone`

Primary contact details

`address`

Primary address

`addresses`

Additional addresses (up to 200), each with a purpose (shipping, billing, invoice)

`storeIds`

Stores this customer belongs to

`marketId`

Market this customer belongs to

`preferredLanguage`, `preferredCurrency`

Communication and pricing preferences

`customerGroups`

Groups for segmentation and targeting

`externalIds`

Mappings to external systems (ERP, e-commerce, CRM)

`consents`

Active consent records (marketing, newsletter, etc.)

`tags`

Searchable labels for categorization

`properties`

Custom key-value pairs for extending the data model

`isInactive`

Soft-delete flag

`isGlobal`

Whether the customer is visible across all stores

For the full model definition, see the Swagger documentation: [Private Customer model](https://api.omnium.no/documentation/index.html#/model-OmniumPrivateCustomer) and [Business Customer model](https://api.omnium.no/documentation/index.html#/model-OmniumBusinessCustomer).

### [Private Customer (B2C) Fields](#private-customer-b2c-fields)

In addition to the common fields:

Field

Description

`firstName`, `lastName`

Personal name

`gender`

Optional gender

`birthDate`

Date of birth (used for birthday promotions)

`bonusPoints`

Current loyalty point balance

`isCustomerClubMember`

Whether the customer has an active club membership

`discountCoupons`

Assigned discount coupons

### [Business Customer (B2B) Fields](#business-customer-b2b-fields)

In addition to the common fields:

Field

Description

`name`

Company name

`taxId`

VAT or registration number

`contacts`

List of contact persons (up to 1,000), each with name, email, phone, roles, and address

`businessCustomerCredit`

Credit management per market (balance, limit, remaining, denied status)

`discountGroups`

Assigned discount groups

`priceGroups`

Assigned price groups

`isAssortmentRestricted`

Whether the customer sees a restricted product catalog

`assortmentCodes`

Codes defining which product categories are visible

`punchOutDomain`

e-Procurement domain for OCI/cXML integration

* * *


## [API Endpoints](#api-endpoints)

Omnium provides three sets of customer endpoints. Use the type-specific endpoints when you know the customer type; use the generic endpoint for operations that work across both types.

### [Generic Customers](#generic-customers)

**Base URL:** `/api/customers`

Method

Endpoint

Description

GET

`/api/customers/{id}`

Get a customer by ID (returns either type)

POST

`/api/customers`

Add a customer

POST

`/api/customers/Update`

Full update

PATCH

`/api/customers/Patch`

Partial update (only supplied fields change)

DELETE

`/api/customers/{id}`

Anonymize (GDPR)

POST

`/api/customers/Search`

Search across all customers

POST

`/api/customers/AddMany`

Bulk add (max 100)

PUT

`/api/customers/AddOrUpdateMany`

Bulk add or update (max 100)

### [Private Customers (B2C)](#private-customers-b2c)

**Base URL:** `/api/privatecustomers`

All generic operations, plus:

Method

Endpoint

Description

GET

`/api/privatecustomers/{id}/club`

Get customer club membership

POST

`/api/privatecustomers/Scroll`

Scroll through large result sets

GET

`/api/privatecustomers/Scroll/{scrollId}`

Continue scrolling

### [Business Customers (B2B)](#business-customers-b2b)

**Base URL:** `/api/businesscustomers`

All generic operations, plus:

Method

Endpoint

Description

POST

`/api/businesscustomers/{id}/AddContactPerson`

Add a contact person

POST

`/api/businesscustomers/{id}/UpdateContactPerson`

Update a contact person

DELETE

`/api/businesscustomers/{id}/RemoveContactPerson`

Remove a contact person

GET

`/api/businesscustomers/GetBusinessCustomerByContactEmail?email=...`

Find company by contact email

GET

`/api/businesscustomers/GetBusinessCustomerByContactPhone?phoneNumber=...`

Find company by contact phone

GET

`/api/businesscustomers/{id}/SalesLimitations`

Get purchase restrictions

POST

`/api/businesscustomers/Scroll`

Scroll through large result sets

For complete endpoint details, see the [Swagger documentation](https://api.omnium.no/documentation/customers).

* * *


## [Creating Customers](#creating-customers)

### [From the API](#from-the-api)

Create a private customer:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/privatecustomers
    {
      "firstName": "Sarah",
      "lastName": "Johnson",
      "email": "sarah@example.com",
      "phone": "+12125551234",
      "birthDate": "1985-03-20",
      "address": {
        "line1": "123 Main Street",
        "city": "New York",
        "postalCode": "10001",
        "countryCode": "US",
        "purposes": ["Shipping", "Billing"]
      },
      "storeIds": ["store-nyc"],
      "marketId": "market-us",
      "preferredLanguage": "en",
      "preferredCurrency": "USD",
      "tags": ["newsletter"],
      "consents": [
        {
          "type": "EmailMarketing",
          "date": "2026-02-14T10:00:00Z",
          "status": true,
          "source": "Web"
        }
      ]
    }

Create a business customer with a contact person:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/businesscustomers
    {
      "name": "Acme Industries LLC",
      "taxId": "US-87-1234567",
      "email": "info@acme-industries.com",
      "phone": "+13125559876",
      "address": {
        "line1": "456 Commerce Drive",
        "city": "Chicago",
        "postalCode": "60601",
        "countryCode": "US",
        "purposes": ["Billing"]
      },
      "contacts": [
        {
          "firstName": "Mike",
          "lastName": "Davis",
          "email": "mike@acme-industries.com",
          "phone": "+13125554321",
          "roles": ["Purchaser"],
          "isPrimaryContact": true,
          "notify": true
        }
      ],
      "storeIds": ["store-chicago"],
      "marketId": "market-us",
      "discountGroups": ["wholesale"]
    }

### [Automatically from Orders](#automatically-from-orders)

When an order arrives from your e-commerce platform, the **Get or Create Customer** workflow step can automatically create or update the customer record based on the order data. This behavior is configurable — see [Customer creation control](/docs/Customer/customer-config#customer-creation-control) for the settings.

* * *


## [Searching Customers](#searching-customers)

The Search endpoint supports filtering, sorting, and pagination:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/privatecustomers/Search
    {
      "query": "sarah",
      "marketIds": ["market-us"],
      "tags": ["newsletter"],
      "isInactive": false,
      "sortOrder": "ModifiedDescending",
      "take": 25,
      "page": 0
    }

### [Available Filters](#available-filters)

Filter

Description

`query`

Free-text search across name, email, phone, and address fields

`email`, `phone`, `taxId`

Exact match on contact fields

`customerId`, `customerIds`, `customerNumbers`

Look up specific customers

`storeIds`, `marketIds`

Filter by store or market

`customerGroups`

Filter by group membership

`tags`, `excludedTags`

Filter by tags

`externalIds`

Filter by external system IDs

`consentTypes`

Find customers with specific consents

`isInactive`, `isGlobal`, `isCustomerClubMember`

Status filters

`createdFrom`, `createdTo`, `modifiedFrom`, `modifiedTo`

Date range filters

`postalCodeFrom`, `postalCodeTo`

Postal code range

`properties`

Filter by custom property values

### [Scrolling for Large Datasets](#scrolling-for-large-datasets)

For bulk exports or migrations, use the Scroll endpoint instead of paginated Search. Scroll handles large volumes efficiently by maintaining a cursor:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/privatecustomers/Scroll
    {
      "marketIds": ["market-nor"],
      "take": 1000
    }

The response includes a `scrollId`. Use it to retrieve the next batch:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/privatecustomers/Scroll/{scrollId}

Continue until no more results are returned. See the [scrolling guide](/docs/Integrations/scrolling) for details.

### [Delta Queries](#delta-queries)

To retrieve only customers that changed since your last sync:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/privatecustomers/GetAll?changedSince=2026-02-13T00:00:00Z&page=0&pageSize=100

See the [delta queries guide](/docs/Integrations/delta) for best practices.

* * *


## [Updating Customers](#updating-customers)

### [Full Update](#full-update)

Replaces the entire customer record. You must send all fields — omitted fields are reset to their defaults.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/privatecustomers/Update
    {
      "id": "cust-12345",
      "firstName": "Sarah",
      "lastName": "Johnson",
      "email": "sarah.new@example.com",
      ...
    }

### [Partial Update (PATCH)](#partial-update-patch)

Only the fields you include are changed. Other fields are left untouched.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/privatecustomers/Patch
    {
      "id": "cust-12345",
      "email": "sarah.new@example.com",
      "tags": ["newsletter", "vip"]
    }

Use PATCH for most updates. It's safer — you won't accidentally clear fields you didn't intend to change. See the [PATCH patterns section](/docs/GettingStartedWithAPI/api-developer-guide#updating-resources-patch) in the API Developer Guide for details on how properties and lists are merged.

### [Bulk Operations](#bulk-operations)

Add or update up to 100 customers in a single request:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/privatecustomers/AddOrUpdateMany
    [
      { "customerId": "cust-001", "firstName": "Sarah", ... },
      { "customerId": "cust-002", "firstName": "James", ... }
    ]

Customers that already exist (matched by ID) are updated; new customers are created.

* * *


## [Customer Groups](#customer-groups)

Customer groups let you organize customers for targeted promotions, pricing, or reporting.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/CustomerGroups/Add
    {
      "id": "wholesale-partners",
      "name": "wholesale-partners",
      "displayName": "Wholesale Partners",
      "properties": [
        { "key": "discountTier", "value": "gold" }
      ]
    }

Assign a customer to a group by including the group reference in the customer's `customerGroups` list:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/businesscustomers/Patch
    {
      "id": "cust-67890",
      "customerGroups": [
        { "id": "wholesale-partners", "name": "Wholesale Partners" }
      ]
    }

* * *


## [External IDs and Integration](#external-ids-and-integration)

Customers can be linked to multiple external systems using the `externalIds` field. Each entry has a `source` (system name) and `value` (ID in that system):

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "externalIds": [
      { "source": "Shopify", "value": "gid://shopify/Customer/12345" },
      { "source": "D365", "value": "CUST-00042" },
      { "source": "VoyadoContactId", "value": "abc-def-123" }
    ]

External IDs are used for:

*   **Import matching** — When importing customers, Omnium uses external IDs to find existing records and avoid duplicates
*   **Cross-system lookups** — Search for a customer by their ID in another system
*   **Export enrichment** — Workflow steps can copy external IDs from the customer to the order for downstream integrations

You can highlight specific external ID types in the admin UI — see the [configuration guide](/docs/Customer/customer-config#highlighted-external-ids) for details.

* * *


## [Addresses](#addresses)

Customers can have a primary `address` and a list of additional `addresses`. Each address has a purpose (or multiple purposes) that indicates how it's used:

Purpose

Description

Shipping

Where goods are delivered

Billing

Where invoices are sent

Invoice

Formal invoice address

Home

Residential address

An address includes: `line1`, `line2`, `city`, `postalCode`, `countryCode`, `countryName`, `state`, `phone`, `email`, `name` (label), and optional `externalId` for integration mapping.

* * *


## [B2B Contact Persons](#b2b-contact-persons)

Business customers can have multiple contact persons, each with their own role, contact details, and address. This models real-world organizations where different people handle purchasing, finance, and receiving.

### [Adding a Contact Person](#adding-a-contact-person)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/businesscustomers/{id}/AddContactPerson
    {
      "firstName": "Emily",
      "lastName": "Clark",
      "email": "emily@acme-industries.com",
      "phone": "+13125558765",
      "roles": ["AccountsPayable"],
      "isPrimaryContact": false,
      "notify": true
    }

### [Looking Up Companies by Contact](#looking-up-companies-by-contact)

Find the business customer associated with a specific person:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/businesscustomers/GetBusinessCustomerByContactEmail?email=emily@acme-industries.com

* * *


## [B2B Credit Management](#b2b-credit-management)

Business customers can have credit limits tracked per market:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "businessCustomerCredit": [
      {
        "marketId": "market-nor",
        "creditBalance": 50000,
        "creditLimit": 100000,
        "creditRemaining": 50000,
        "creditCurrency": "NOK",
        "isCreditDenied": false
      },
      {
        "marketId": "market-swe",
        "creditBalance": 20000,
        "creditLimit": 75000,
        "creditRemaining": 55000,
        "creditCurrency": "SEK",
        "isCreditDenied": false
      }
    ]

When `isCreditDenied` is `true`, the customer is blocked from placing orders on credit in that market.

* * *


## [B2B Assortment Restrictions](#b2b-assortment-restrictions)

Business customers can have restricted product catalogs, so they only see the products relevant to their contract:

*   Set `isAssortmentRestricted` to `true`
*   Assign `assortmentCodes` that map to product categories

For detailed configuration, see [Customer categories and assortment](/docs/Product/product-assortment/customer-categories).

* * *


## [Customer Relations (B2B)](#customer-relations-b2b)

Business customers can be linked to each other using relations. Common patterns:

*   **Invoice receiver** — Company A orders, Company B receives the invoice
*   **Goods receiver** — Company A orders, Company C receives the delivery

Relations are configured in the [customer configuration](/docs/Customer/customer-config#customer-relations-b2b) and assigned on the customer record via the `customerRelations` field.

* * *


## [Customer Merge and Deduplication](#customer-merge-and-deduplication)

When duplicate customer records exist, you can merge them using the privacy endpoint:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/customerprivacy/ChangePrivateCustomerId?fromCustomerId=old-id&toCustomerId=keep-id

What happens during a merge:

*   All orders, loyalty points, comments, and attachments from the source customer are moved to the target customer
*   The source customer record is deleted
*   An event is logged for audit purposes

For batch merges (up to 50 at a time):

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/customerprivacy/ChangePrivateCustomerIdBatch
    [
      { "fromCustomerId": "duplicate-1", "toCustomerId": "keep-1" },
      { "fromCustomerId": "duplicate-2", "toCustomerId": "keep-2" }
    ]

Business customers can also be merged using `ChangeBusinessCustomerId`.

* * *


## [Privacy and Anonymization (GDPR)](#privacy-and-anonymization-gdpr)

When a customer exercises their right to be forgotten, anonymize their data:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    DELETE /api/customers/{id}

This:

*   Removes all personal data (name, email, phone, addresses)
*   Marks the customer as anonymized
*   Preserves order records for business continuity (without personal data)
*   Is irreversible

Anonymization is available for private customers. For business customers, use standard deletion via `DELETE /api/businesscustomers/{id}`.

* * *


## [Consents](#consents)

Omnium tracks customer consents for GDPR compliance and marketing preferences. Each consent records what was agreed to, when, and through which channel:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "consents": [
      {
        "type": "EmailMarketing",
        "date": "2026-02-14T10:00:00Z",
        "content": "I agree to receive marketing emails",
        "source": "Web",
        "status": true,
        "marketIds": ["market-nor"]
      }
    ]

Consent types are configured per tenant — see the [consent management section](/docs/Customer/customer-config#consent-management) in the configuration guide. Changes to consents are tracked in `consentHistory` for audit purposes.

* * *


## [Customer Club (Loyalty)](#customer-club-loyalty)

Omnium includes a built-in loyalty program with bonus points, tiers, and automated notifications. For setup and API usage, see the dedicated [Customer Club guide](/docs/Customer/customer-club).

Key concepts:

*   **Points** are earned on purchases and can be used as payment via the BonusPoints payment provider
*   **Tiers** segment members by spending level (e.g., Bronze, Silver, Gold)
*   **Birthday and sign-up points** reward engagement milestones
*   **Points expire** after a configurable number of days
*   **Workflow steps** handle point calculation, earning, and cancellation throughout the order lifecycle

* * *


## [Integration with Orders](#integration-with-orders)

Customers and orders are connected through the order's `customerId` field. When an order is processed, workflow steps can:

1.  **Create or find the customer** — The "Get or Create Customer" step matches the order's email/phone to an existing customer or creates a new one
2.  **Enrich the order** — Copy customer properties, external IDs, or payment terms onto the order for downstream processing
3.  **Update the customer** — Sync address changes from the order back to the customer record (if configured)
4.  **Calculate loyalty points** — Award bonus points based on the order total

* * *
