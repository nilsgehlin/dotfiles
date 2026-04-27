# Customers — B2C, B2B, Loyalty & CRM — API Reference

## API Reference

[Customer](/docs/Customer)

# API Reference

This guide explains how to manage customer data in Omnium. It covers both private and business customers. The API allows you to handle customer interactions efficiently.


## [Customers](#customers)

Omnium allows you to manage customer data for both private and business customers. Below are the key details for each customer type and their associated features.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fcustomers.5cb8d15c.png&w=3840&q=75)

* * *


## [Private and Business Customers](#private-and-business-customers)

Omnium provides models for both **private** and **business** customers:

*   **Private Customers:** [Omnium Private Customer Model](https://api.omnium.no/documentation/index.html#/model-OmniumPrivateCustomer)
*   **Business Customers:** [Omnium Business Customer Model](https://api.omnium.no/documentation/index.html#/model-OmniumBusinessCustomer)

* * *

[

Previous

Customers

](/docs/Customer)[

Next

Configuration

](/docs/Customer/customer-config)

---


## Cases

[Customer](/docs/Customer)

# Cases

Built-in CRM and support case system for managing customer inquiries, issues, and communication.

**Add-on Module** — Cases is not included in the standard Omnium license. Contact your Omnium representative for access or pricing details.

Omnium includes a full **Cases** module — a built-in CRM/support case system for tracking customer inquiries, issues, and requests. Cases can be created manually by staff, automatically from inbound emails, or programmatically via the API.

Each case tracks a subject, description, priority, status, assigned agent, and related entities (customers, orders, projects, carts, products). Cases support public and internal notes, email and SMS notifications, file attachments, and a dashboard with analytics.

* * *


## [In this section](#in-this-section)

[

Overview & Concepts

What cases are, key concepts, data model, and status lifecycle



](/docs/Customer/Cases/cases-overview)[

Configuration

Enable cases, configure statuses, priorities, tags, and case numbering



](/docs/Customer/Cases/cases-config)[

Managing Cases

List, create, edit, assign, change status, bulk operations, and linking



](/docs/Customer/Cases/cases-management)[

Notes & Communication

Public and internal notes, email/SMS notifications, reply templates



](/docs/Customer/Cases/cases-notes-and-communication)[

Dashboard & Analytics

Key stats, charts by status/priority/assignee, and filtering



](/docs/Customer/Cases/cases-dashboard)[

Inbound Email

Automatic case creation from customer emails via SendGrid



](/docs/Customer/Cases/cases-inbound-email)[

API Reference

Public API endpoints, models, search, and code examples



](/docs/Customer/Cases/cases-api)

[

Previous

Newsletter

](/docs/Customer/newsletter)[

Next

Overview & Concepts

](/docs/Customer/Cases/cases-overview)

---


## Configuration

[Customer](/docs/Customer)

# Configuration

Learn how to configure customer settings in Omnium, including identification, creation controls, address handling, consent management, and B2B features. This guide covers all customer-related configuration options for administrators and developers.

Customer settings control how customer records are created, validated, and managed throughout Omnium. These settings affect both B2C (private customers) and B2B (business customers) workflows.

* * *


## [Customer identification](#customer-identification)

These settings control how customers are uniquely identified and validated within the system.

Property

Type

Default

Description

RequireUniqueCustomerEmails

bool

false

When enabled, the system enforces unique email addresses across all customers. Attempting to create or update a customer with a duplicate email will fail.

RequireUniqueCustomerPhoneNumbers

bool

false

When enabled, the system enforces unique phone numbers across all customers. Useful when phone number is a primary identifier.

CustomerIdField

string

null

Use an alternative field as the customer identifier. Valid values are `Email` or `Phone`. When set, the specified field's value is used as the customer ID instead of a system-generated ID.

Enabling unique email or phone number requirements may cause import failures if your existing customer data contains duplicates. Clean up duplicates before enabling these settings.

### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "RequireUniqueCustomerEmails": true,
      "RequireUniqueCustomerPhoneNumbers": false,
      "CustomerIdField": "Email"
    }

* * *


## [Customer creation control](#customer-creation-control)

These settings control when and how customers are automatically created in Omnium.

Property

Type

Default

Description

IsB2CGetOrCreateDisabled

bool

false

When enabled, disables all automatic B2C (private) customer creation. Existing customers can still be retrieved, but new customers will not be created automatically.

IsB2BGetOrCreateDisabled

bool

false

When enabled, disables all automatic B2B (business) customer creation. Existing customers can still be retrieved, but new customers will not be created automatically.

IsB2CGetOrCreateFromOrderDisabled

bool

false

When enabled, prevents B2C customer creation specifically from order processing. Orders can still reference existing customers.

IsB2BGetOrCreateFromOrderDisabled

bool

false

When enabled, prevents B2B customer creation specifically from order processing. Orders can still reference existing customers.

The "GetOrCreate" settings affect the workflow step that attempts to find or create a customer based on order data. Use the more specific "FromOrder" settings to disable customer creation only during order processing while allowing creation through other channels.

### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "IsB2CGetOrCreateDisabled": false,
      "IsB2BGetOrCreateDisabled": false,
      "IsB2CGetOrCreateFromOrderDisabled": true,
      "IsB2BGetOrCreateFromOrderDisabled": true
    }

* * *


## [Address configuration](#address-configuration)

These settings control how customer addresses are validated and stored.

Property

Type

Default

Description

RequiredAddressProperties

string\[\]

\[\]

List of address field names that must be provided when creating or updating customer addresses. Common values include: `Line1`, `City`, `PostalCode`, `CountryCode`.

IsStreetNumberSeparated

bool

false

When enabled, the street number is stored in a separate field from the street name. Useful for integrations with systems that require separated address components.

UpdateCustomerOnEditShipmentAddress

bool

false

When enabled, editing a shipment address on an order will also update the corresponding address on the customer record.

### [Available address properties](#available-address-properties)

The following property names can be used in `RequiredAddressProperties`:

*   `Line1` - Primary address line (street address)
*   `Line2` - Secondary address line (apartment, suite, etc.)
*   `Line3` - Additional address line
*   `City` - City name
*   `PostalCode` - Postal/ZIP code
*   `CountryCode` - ISO country code
*   `State` - State or region
*   `StreetNumber` - House/building number (when separated)

### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "RequiredAddressProperties": [
        "Line1",
        "City",
        "PostalCode",
        "CountryCode"
      ],
      "IsStreetNumberSeparated": true,
      "UpdateCustomerOnEditShipmentAddress": true
    }

* * *


## [Access control](#access-control)

These settings control how access to customer records is restricted.

Property

Type

Default

Description

RequireStoreIdsForAccess

bool

false

When enabled, customers are only accessible to users with matching store assignments. Customers must have a `StoreIds` property containing the stores they belong to, and users can only view/edit customers assigned to their stores.

Store-based access control is useful for multi-store environments where customer data should be segregated by location. This setting affects both the UI and API access.

### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "RequireStoreIdsForAccess": true
    }

* * *


## [Version tracking and statistics](#version-tracking-and-statistics)

These settings control customer record versioning and analytics data collection.

Property

Type

Default

Description

TrackVersions

bool

false

When enabled, Omnium maintains a version history of customer records. Each update creates a new version, allowing you to view historical changes.

UseStatsCustomerQueues

bool

false

When enabled, customer records are copied to dedicated statistics queues for analytics processing. Enable this for advanced customer analytics and reporting.

ExportPrivateCustomers

bool

false

When enabled, private customers are included in exports to external systems (e.g., ERP integrations).

### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "TrackVersions": true,
      "UseStatsCustomerQueues": true,
      "ExportPrivateCustomers": false
    }

* * *


## [Consent management](#consent-management)

These settings configure customer consent types for GDPR compliance and marketing preferences.

Property

Type

Default

Description

ConsentTypes

array

\[\]

Consent types available for B2C (private) customers. See [Consent type object](#consent-type-object) below.

BusinessConsentTypes

array

\[\]

Consent types available for B2B (business) customers. See [Consent type object](#consent-type-object) below.

FilterOnGlobalConsents

bool

false

When enabled, consent filtering applies at a global level rather than per-customer. Use this when consents should be managed centrally.

CopyConsentsToCustomerClubMember

bool

false

When enabled, consents from the customer record are automatically synchronized to the associated customer club membership.

### [Consent type object](#consent-type-object)

Property

Type

Description

Type

string

Unique identifier for the consent type (e.g., "EmailMarketing", "SMS", "ThirdParty")

Content

string

Description or translation key for the consent

IsRequired

bool

Whether this consent is mandatory for customer registration

IsFeatured

bool

Whether this consent should be prominently displayed in the UI

### [Sample](#sample-5)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "ConsentTypes": [
        {
          "Type": "EmailMarketing",
          "Content": "Consent_EmailMarketing",
          "IsRequired": false,
          "IsFeatured": true
        },
        {
          "Type": "SmsMarketing",
          "Content": "Consent_SmsMarketing",
          "IsRequired": false,
          "IsFeatured": true
        },
        {
          "Type": "ThirdPartySharing",
          "Content": "Consent_ThirdPartySharing",
          "IsRequired": false,
          "IsFeatured": false
        }
      ],
      "BusinessConsentTypes": [
        {
          "Type": "B2BNewsletter",
          "Content": "Consent_B2BNewsletter",
          "IsRequired": false,
          "IsFeatured": true
        }
      ],
      "FilterOnGlobalConsents": false,
      "CopyConsentsToCustomerClubMember": true
    }

* * *


## [Phone number formatting](#phone-number-formatting)

These settings control how phone numbers are validated and formatted for customers. Separate settings are available for private and business customers.

Property

Type

Default

Description

PrivateCustomerPhoneFormatSettings

object

null

Phone number formatting rules for B2C customers. See [Phone format settings object](#phone-format-settings-object) below.

BusinessCustomerPhoneFormatSettings

object

null

Phone number formatting rules for B2B customers. See [Phone format settings object](#phone-format-settings-object) below.

### [Phone format settings object](#phone-format-settings-object)

Property

Type

Description

RequireCountryCode

bool

When true, phone numbers must include a country code

RemoveCountryCode

bool

When true, country codes are stripped from stored phone numbers

UsePlusInCountryCode

bool

When true, country codes use the + prefix (e.g., +47)

UseZeroZeroInCountryCode

bool

When true, country codes use 00 prefix instead of + (e.g., 0047)

DefaultCountryCode

string

Default country code applied when none is provided (e.g., "47" for Norway)

ExpectedPhoneNumberFormats

array

Validation rules for phone numbers by country. See [Phone format object](#phone-format-object) below.

### [Phone format object](#phone-format-object)

Property

Type

Description

CountryCode

string

The country code this format applies to (e.g., "47", "46")

MinExpectedNumberLength

int

Minimum number of digits (excluding country code)

MaxExpectedNumberLength

int

Maximum number of digits (excluding country code)

### [Sample](#sample-6)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "PrivateCustomerPhoneFormatSettings": {
        "RequireCountryCode": true,
        "RemoveCountryCode": false,
        "UsePlusInCountryCode": true,
        "UseZeroZeroInCountryCode": false,
        "DefaultCountryCode": "47",
        "ExpectedPhoneNumberFormats": [
          {
            "CountryCode": "47",
            "MinExpectedNumberLength": 8,
            "MaxExpectedNumberLength": 8
          },
          {
            "CountryCode": "46",
            "MinExpectedNumberLength": 9,
            "MaxExpectedNumberLength": 10
          }
        ]
      },
      "BusinessCustomerPhoneFormatSettings": {
        "RequireCountryCode": true,
        "UsePlusInCountryCode": true,
        "DefaultCountryCode": "47",
        "ExpectedPhoneNumberFormats": [
          {
            "CountryCode": "47",
            "MinExpectedNumberLength": 8,
            "MaxExpectedNumberLength": 8
          }
        ]
      }
    }

* * *


## [Customer relations (B2B)](#customer-relations-b2b)

These settings define relationship types between B2B customers, useful for complex corporate structures where one company may handle invoicing while another receives goods.

Property

Type

Default

Description

RelationTypes

array

\[\]

Available relationship types between customers. See [Customer relation object](#customer-relation-object) below.

### [Customer relation object](#customer-relation-object)

Property

Type

Description

Name

string

Display name for the relationship type

IsInvoiceReceiver

bool

When true, related customers with this relationship receive invoices

IsGoodsReceiver

bool

When true, related customers with this relationship receive goods

### [Sample](#sample-7)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "RelationTypes": [
        {
          "Name": "InvoiceCustomer",
          "IsInvoiceReceiver": true,
          "IsGoodsReceiver": false
        },
        {
          "Name": "DeliveryCustomer",
          "IsInvoiceReceiver": false,
          "IsGoodsReceiver": true
        },
        {
          "Name": "HeadquartersCustomer",
          "IsInvoiceReceiver": true,
          "IsGoodsReceiver": true
        }
      ]
    }

* * *


## [Contact roles (B2B)](#contact-roles-b2b)

These settings define available roles for contacts within B2B customer organizations.

Property

Type

Default

Description

ContactRoleTypes

array

\[\]

Available role types for B2B contacts. See [Contact role object](#contact-role-object) below.

### [Contact role object](#contact-role-object)

Property

Type

Description

Name

string

Display name for the contact role

### [Sample](#sample-8)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "ContactRoleTypes": [
        { "Name": "Purchaser" },
        { "Name": "AccountsPayable" },
        { "Name": "TechnicalContact" },
        { "Name": "PrimaryContact" }
      ]
    }

* * *


## [Customer categorization](#customer-categorization)

These settings control how customers are categorized and displayed.

### [Tags](#tags)

Property

Type

Default

Description

TagSettings

array

\[\]

Available tags for categorizing customers. See [Tag object](#tag-object) below.

#### [Tag object](#tag-object)

Property

Type

Description

Name

string

Tag identifier used in the system

TranslationKey

string

Translation key for displaying the tag in the UI

### [Default properties](#default-properties)

Property

Type

Default

Description

DefaultProperties

array

\[\]

Custom properties automatically added to new customer records. See [Default property object](#default-property-object) below.

#### [Default property object](#default-property-object)

Property

Type

Description

Key

string

Property name/identifier

Value

string

Default value for the property

ValueType

string

Data type (String, Number, Boolean, Date)

KeyGroup

string

Optional grouping for organizing properties

ValueOptions

string\[\]

Predefined options for dropdown selection

IsCustomValueOptionAllowed

bool

Allow custom values outside the predefined options

IsMultiSelectEnabled

bool

Allow selecting multiple values

ReadOnly

bool

Make the property read-only after creation

### [Highlighted external IDs](#highlighted-external-ids)

Property

Type

Default

Description

HighlightedExternalIds

string\[\]

\[\]

External ID types to display prominently on customer records

### [Customer facets](#customer-facets)

Property

Type

Default

Description

CustomerFacets

array

\[\]

Filterable facets for customer search. See [Facet object](#facet-object) below.

#### [Facet object](#facet-object)

Property

Type

Description

Name

string

Facet name/identifier

Type

string

Facet type (determines how values are aggregated)

IsCustomProperty

bool

When true, fetches facet values from the properties list even if a matching field name exists

### [Sample](#sample-9)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "TagSettings": [
        { "Name": "VIP", "TranslationKey": "CustomerTag_VIP" },
        { "Name": "Wholesale", "TranslationKey": "CustomerTag_Wholesale" },
        { "Name": "NewCustomer", "TranslationKey": "CustomerTag_New" }
      ],
      "DefaultProperties": [
        {
          "Key": "CustomerSegment",
          "Value": "",
          "ValueType": "String",
          "ValueOptions": ["Retail", "Wholesale", "Enterprise"],
          "IsCustomValueOptionAllowed": false,
          "IsMultiSelectEnabled": false,
          "ReadOnly": false
        },
        {
          "Key": "PreferredContactMethod",
          "Value": "Email",
          "ValueType": "String",
          "ValueOptions": ["Email", "Phone", "SMS"],
          "IsCustomValueOptionAllowed": false
        }
      ],
      "HighlightedExternalIds": [
        "ERPCustomerId",
        "LoyaltyProgramId"
      ],
      "CustomerFacets": [
        { "Name": "CustomerSegment", "Type": "keyword", "IsCustomProperty": true },
        { "Name": "CountryCode", "Type": "keyword", "IsCustomProperty": false }
      ]
    }

* * *


## [Loyalty integration](#loyalty-integration)

Property

Type

Default

Description

UseExternalBonusPointsProvider

bool

false

When enabled, bonus points are managed by an external loyalty system instead of Omnium's built-in customer club. Use this when integrating with third-party loyalty platforms.

When using an external bonus points provider, ensure the appropriate connector is configured to synchronize points data between systems.

### [Sample](#sample-10)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "UseExternalBonusPointsProvider": true
    }

* * *


## [PunchOut settings (B2B)](#punchout-settings-b2b)

PunchOut settings configure B2B procurement integrations using OCI (Open Catalog Interface) or cXML protocols. These settings enable e-procurement systems to "punch out" to Omnium for catalog browsing and cart creation.

Property

Type

Default

Description

PunchOutSettings

object

null

Configuration for B2B PunchOut/OCI integration. See [PunchOut settings object](#punchout-settings-object) below.

### [PunchOut settings object](#punchout-settings-object)

Property

Type

Description

UnitConversionLists

array

Named lists for converting between ISO unit codes and OCI unit codes. See [Unit conversion list object](#unit-conversion-list-object) below.

### [Unit conversion list object](#unit-conversion-list-object)

Property

Type

Description

UnitConversionListName

string

Display name for the conversion list

UnitConversionListId

string

Unique identifier for the conversion list (assigned to specific B2B customers)

UnitConversions

array

List of unit code mappings. See [Unit conversion object](#unit-conversion-object) below.

### [Unit conversion object](#unit-conversion-object)

Property

Type

Description

IsoCode

string

Standard ISO unit code (e.g., "PCE", "KGM", "MTR")

OciCode

string

OCI/cXML unit code used by the procurement system (e.g., "EA", "KG", "M")

Different procurement systems may use different unit codes. Create separate conversion lists for each customer or procurement system with specific mapping requirements.

### [Sample](#sample-11)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CustomerSettings": {
      "PunchOutSettings": {
        "UnitConversionLists": [
          {
            "UnitConversionListName": "SAP Standard",
            "UnitConversionListId": "sap-standard",
            "UnitConversions": [
              { "IsoCode": "PCE", "OciCode": "EA" },
              { "IsoCode": "KGM", "OciCode": "KG" },
              { "IsoCode": "MTR", "OciCode": "M" },
              { "IsoCode": "LTR", "OciCode": "L" }
            ]
          },
          {
            "UnitConversionListName": "Oracle Procurement",
            "UnitConversionListId": "oracle-procurement",
            "UnitConversions": [
              { "IsoCode": "PCE", "OciCode": "Each" },
              { "IsoCode": "KGM", "OciCode": "Kilogram" },
              { "IsoCode": "MTR", "OciCode": "Meter" }
            ]
          }
        ]
      }
    }

* * *


## [Complete configuration example](#complete-configuration-example)

Below is a comprehensive example showing all customer settings configured together:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "CustomerSettings": {
        "RequireUniqueCustomerEmails": true,
        "RequireUniqueCustomerPhoneNumbers": false,
        "CustomerIdField": null,
     
        "IsB2CGetOrCreateDisabled": false,
        "IsB2BGetOrCreateDisabled": false,
        "IsB2CGetOrCreateFromOrderDisabled": false,
        "IsB2BGetOrCreateFromOrderDisabled": false,
     
        "RequiredAddressProperties": [
          "Line1",
          "City",
          "PostalCode",
          "CountryCode"
        ],
        "IsStreetNumberSeparated": false,
        "UpdateCustomerOnEditShipmentAddress": true,
     
        "RequireStoreIdsForAccess": false,
     
        "TrackVersions": true,
        "UseStatsCustomerQueues": true,
        "ExportPrivateCustomers": false,
     
        "ConsentTypes": [
          {
            "Type": "EmailMarketing",
            "Content": "Consent_EmailMarketing",
            "IsRequired": false,
            "IsFeatured": true
          },
          {
            "Type": "SmsMarketing",
            "Content": "Consent_SmsMarketing",
            "IsRequired": false,
            "IsFeatured": true
          }
        ],
        "BusinessConsentTypes": [
          {
            "Type": "B2BNewsletter",
            "Content": "Consent_B2BNewsletter",
            "IsRequired": false,
            "IsFeatured": true
          }
        ],
        "FilterOnGlobalConsents": false,
        "CopyConsentsToCustomerClubMember": true,
     
        "PrivateCustomerPhoneFormatSettings": {
          "RequireCountryCode": true,
          "RemoveCountryCode": false,
          "UsePlusInCountryCode": true,
          "UseZeroZeroInCountryCode": false,
          "DefaultCountryCode": "47",
          "ExpectedPhoneNumberFormats": [
            {
              "CountryCode": "47",
              "MinExpectedNumberLength": 8,
              "MaxExpectedNumberLength": 8
            }
          ]
        },
        "BusinessCustomerPhoneFormatSettings": {
          "RequireCountryCode": true,
          "UsePlusInCountryCode": true,
          "DefaultCountryCode": "47",
          "ExpectedPhoneNumberFormats": [
            {
              "CountryCode": "47",
              "MinExpectedNumberLength": 8,
              "MaxExpectedNumberLength": 8
            }
          ]
        },
     
        "RelationTypes": [
          {
            "Name": "InvoiceCustomer",
            "IsInvoiceReceiver": true,
            "IsGoodsReceiver": false
          },
          {
            "Name": "DeliveryCustomer",
            "IsInvoiceReceiver": false,
            "IsGoodsReceiver": true
          }
        ],
     
        "ContactRoleTypes": [
          { "Name": "Purchaser" },
          { "Name": "AccountsPayable" },
          { "Name": "TechnicalContact" }
        ],
     
        "TagSettings": [
          { "Name": "VIP", "TranslationKey": "CustomerTag_VIP" },
          { "Name": "Wholesale", "TranslationKey": "CustomerTag_Wholesale" }
        ],
     
        "DefaultProperties": [
          {
            "Key": "CustomerSegment",
            "Value": "",
            "ValueType": "String",
            "ValueOptions": ["Retail", "Wholesale", "Enterprise"],
            "IsCustomValueOptionAllowed": false,
            "IsMultiSelectEnabled": false,
            "ReadOnly": false
          }
        ],
     
        "HighlightedExternalIds": [
          "ERPCustomerId",
          "LoyaltyProgramId"
        ],
     
        "CustomerFacets": [
          { "Name": "CustomerSegment", "Type": "keyword", "IsCustomProperty": true }
        ],
     
        "UseExternalBonusPointsProvider": false,
     
        "PunchOutSettings": {
          "UnitConversionLists": [
            {
              "UnitConversionListName": "Standard Units",
              "UnitConversionListId": "standard",
              "UnitConversions": [
                { "IsoCode": "PCE", "OciCode": "EA" },
                { "IsoCode": "KGM", "OciCode": "KG" }
              ]
            }
          ]
        }
      }
    }

[

Previous

API Reference

](/docs/Customer/customer-api)[

Next

Customer Management

](/docs/Customer/customer-management)

---


## Customer Club

[Customer](/docs/Customer)

# Customer Club

This guide explains the customer club functionality in Omnium. It covers both private and business customers, as well as how to use features like the Customer Club, track points, and update customer profiles. The API allows you to handle customer interactions efficiently.
