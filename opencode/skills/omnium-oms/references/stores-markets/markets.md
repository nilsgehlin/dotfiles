# Stores & Markets — Locations, Warehouses & Regions — Markets

## Markets

# Markets

Markets define regional context in Omnium — language, currency, tax, shipping, and more.


## [What Is a Market?](#what-is-a-market)

Markets are a core concept in Omnium. Almost everything in the system—orders, prices, products, customers can be associated with a market. Markets are used for access control and to control availability og various functionality in Omnium, and provides contextual environment that determines:

*   Language
*   Region
*   Currency
*   Tax configuration
*   Shipment options
*   Available connectors
*   Payment settings
*   Email templates
*   Number formatting
*   Return charge policies

An instructive example:

> When an order is placed, the **market** determines the currency used, whether prices include tax, the available shipping options, and which language and templates are used for communication (e.g., confirmation emails).

* * *


## [In this section](#in-this-section)

[

Configuration

Set up language, region, currency, tax, shipment options, and more per market



](/docs/Markets/markets-config)

* * *


## [Access Control](#access-control)

Access to most documents in Omnium is governed by **Market ID(s)**.

Entities like orders, carts, and products are tagged with a `marketId` or `marketIds`. A user with access only to Market `US` cannot access data associated with Market `UK`.

### [Feature Availability](#feature-availability)

Omnium supports market-specific feature toggles:

*   `EnabledForMarkets`
*   `DisabledForMarkets`

These properties are used in settings like payments, connectors, and workflows to control availability based on the market context.

* * *


## [Setup Considerations](#setup-considerations)

There are no limitations on the number of markets in Omnium.

Markets are usually configured based on:

*   Country, region, or state
*   Brand or concept
*   B2B vs. B2C use cases

### [Product Language and Currency](#product-language-and-currency)

Markets determine the product language and currency for placed orders.

*   Each **currency** and/or **product language** should have its own market (although multiple markets can share the same currency or product language).
*   Stores can be related to multiple markets. For example, if a web store serves multiple markets with different currencies or languages, the market determines the product language and price currency for the placed order.

### [B2B vs. B2C](#b2b-vs-b2c)

Markets help tailor experiences for B2B or B2C segments:

*   Control whether prices and orders include or exclude tax.
*   Adjust payment types, workflows, and communication accordingly.

### [Customer Communication](#customer-communication)

Market definitions also influence how you communicate with customers:

*   Customize **email templates** and **languages** by market.
*   Support different brands or concepts with separate market-specific configurations.

* * *


## [Market Model](#market-model)

Property

Type

Description

`MarketId`

`string`

Unique ID (e.g., ENG, NOR, SWE)

`MarketName`

`string`

Display name for the market

`IsDefaultMarket`

`bool`

Indicates if this is the default market for new orders

`IsActive`

`bool`

Whether the market is active

`IsTaxExcluded`

`bool`

Indicates if prices are shown excluding tax

`Language`

`string`

Market language name (e.g., English, German)

`LanguageCode`

`string`

ISO 639-1 code (e.g., `en`, `no`)

`IsoLanguageCode`

`string`

Full locale code (e.g., `en-US`, `nb-NO`)

`CountryCode`

`string`

Country code (e.g., `US`, `NO`)

`Currency`

`string`

Currency used in this market (e.g., USD, EUR, NOK)

`ProductContentLanguage`

`string`

Language used for product content

`ShipmentOptions`

`List<ShipmentOption>`

Available shipment methods

`NumberOptions`

`List<NumberOptions>`

Formatting preferences for numbers

`EmailClientSettings`

`EmailClientSettings`

Email configuration per market

`Connectors`

`List<ConnectorOptions>`

Integrations specific to the market

`ReturnCharges`

`ReturnCharges`

Return-related fees

`MarketGroupId`

`string`

Used for grouping (e.g., D365 Company ID)

`MarketGroupLabel`

`string`

Label used in the UI to identify grouped markets

`MarketType`

`string`

Indicates type: B2B or B2C

`DefaultTaxRate`

`decimal?`

Default tax rate if not overridden

`DefaultVatType`

`decimal?`

Default VAT code (e.g., accounting codes like 3, 52)

`DefaultPaymentType`

`string`

Payment type preselected for new carts

`Properties`

`List<PropertyItem>`

Custom properties for extensibility

* * *


## [Return Charges Model](#return-charges-model)

Property

Type

Description

`ReturnCost`

`decimal`

Fee charged to the customer for returns

`NotPickedUpCost`

`decimal`

Fee for unclaimed shipments

[

Previous

Sendgrid

](/docs/plugins/Other/Sendgrid)[

Next

Configuration

](/docs/Markets/markets-config)

---


## Configuration

[Markets](/docs/Markets)

# Configuration

Explore how to configure and manage markets in Omnium, including setting language, region, currency, tax, and shipment options. This guide helps you understand the key components and considerations for setting up markets for different customer needs and regions.


## [Omnium market setup](#omnium-market-setup)

All orders in Omnium require a market ID. The market contains lots of options, including:

*   Language and localization
*   Region and country
*   Currency
*   Tax configuration
*   Shipments
*   Number options
*   Email settings
*   Available connectors

There are no limitations on the number of markets. Based on the requirements, a market could be set up by country, state, or region, brand, or concept – or a combination of the above.


## [Considerations for market setup](#considerations-for-market-setup)

### [Product languages and currencies](#product-languages-and-currencies)

Markets are used to determine the product language and currency for placed orders. As a rule of thumb, every currency and/or product language should have its own market. Stores can be related to multiple markets, so in cases where a single store serves multiple markets (i.e., a web store that sells products in multiple countries with different currencies and/or languages), orders placed for the store in question will get its product language and price currency based on the market the order is placed in.

### [B2B vs B2C](#b2b-vs-b2c)

Another use case for markets is separation between B2C and B2B. In market settings, it is possible to configure whether prices and orders include or exclude tax. The `MarketType` property can be used to distinguish between B2C and B2B markets.

### [Customer communication](#customer-communication)

Communication with customers is also affected by the market structure. It is possible to design custom email templates for each market to support different languages and brands/concepts. The `WebsiteUrl` and `LogoUrl` properties can be customized per market for branded communications.

* * *


## [Market model](#market-model)

### [Core properties](#core-properties)

Property

Type

Description

**MarketId** \*

string

Unique market ID (e.g., "NOR", "SWE", "ENG"). Used as the primary identifier for the market.

**MarketName** \*

string

Display name of the market shown in the user interface.

IsDefaultMarket

bool

When true, this market is used as the default for new orders when no market is specified. Exactly one market must be marked as default.

IsActive

bool

When true, the market is active and available for use. Set to false to temporarily disable a market.

MarketType

string

Classification of the market (e.g., "B2C", "B2B"). Used to distinguish between consumer and business markets.

MarketGroupId

string

Reference to a market group. Can be used for grouping markets by region, brand, or business unit. Also used as CompanyId in Dynamics 365 integrations.

MarketGroupLabel

string

Display label for market groups in the UI.

WebsiteUrl

string

Website URL for the market. Used in customer communications such as email templates and order confirmations.

LogoUrl

string

URL to the market-specific logo. Used in generated documents such as PDFs, receipts, and invoices.

DocumentFooter

string

HTML content for document footers. Displayed at the bottom of generated PDFs, invoices, and receipts. Can include contact information, legal disclaimers, or branding elements.

Properties

List<PropertyItem>

Custom key-value properties for extending market configuration with tenant-specific data.

Exactly one market must have `IsDefaultMarket` set to true. Configuration validation will fail if zero or multiple markets are marked as default.

### [Localization properties](#localization-properties)

Property

Type

Description

Language

string

Market language name (e.g., "English", "Norwegian", "German"). Used for display purposes.

LanguageCode

string

Two-letter ISO 639-1 language code (e.g., "en", "no", "de").

IsoLanguageCode

string

Full ISO language/region code (e.g., "en-US", "nb-NO", "de-DE"). Used for date/time formatting, number formatting, and currency display.

CountryCode

string

Two-letter ISO 3166-1 alpha-2 country code (e.g., "NO", "SE", "GB", "US").

ProductContentLanguage

string

Language code for product content retrieval (e.g., "en", "no", "sv"). Determines which language version of product descriptions, names, and attributes are used for orders in this market.

PhoneNumberFormat

string

Regular expression pattern for validating phone numbers in this market.

PhoneFormatSettings

[PhoneFormatSettings](#phone-format-settings)

Detailed phone number formatting configuration including country code handling.

#### [Product content language fallback](#product-content-language-fallback)

When retrieving product content, the system follows this fallback order:

1.  Market's `ProductContentLanguage` if set
2.  Default market's `ProductContentLanguage` if available
3.  Tenant's `DefaultProductContentLanguageCode` from product settings
4.  English ("en") if available in tenant product settings
5.  First available language from tenant product settings

### [Tax configuration](#tax-configuration)

Property

Type

Description

IsTaxExcluded

bool

When true, tax is excluded from order calculations. Order line tax rates are set to 0, and prices use the ex-tax values. Typically used for B2B markets or tax-exempt scenarios.

ShowOrderLinesExTax

bool

When true, order line prices are displayed without tax in the UI and API responses. This is a display setting and does not affect calculations. Typically used for US markets where prices are shown excluding tax.

DefaultTaxRate

decimal?

Default tax rate percentage for the market (e.g., 25 for 25%). Applied when a product or price does not have a specific tax rate defined.

DefaultVatType

decimal?

Default VAT type code for accounting systems (e.g., 3, 52). Used when exporting orders to ERP systems.

**IsTaxExcluded vs ShowOrderLinesExTax**: These settings serve different purposes. `IsTaxExcluded` affects order calculations by excluding tax entirely. `ShowOrderLinesExTax` only affects how prices are displayed while calculations remain unchanged.

#### [Tax calculation behavior](#tax-calculation-behavior)

When `IsTaxExcluded` is set to true:

*   Order line tax rate is set to 0
*   `PlacedPrice` uses the ex-tax value (`PlacedPriceExclTax`)
*   No tax calculations are applied to the order
*   Discounts are also adjusted to use ex-tax values

### [Payment configuration](#payment-configuration)

Property

Type

Description

DefaultPaymentType

string

Default payment type for new carts/orders in this market. Automatically applied when creating a new cart.

* * *


## [Market groups](#market-groups)

Market groups allow you to organize multiple markets together for shared configuration and reporting. Groups can represent regions, brands, or business units.

### [Market group model](#market-group-model)

Property

Type

Description

**GroupId** \*

string

Unique identifier for the market group. Referenced by `Market.MarketGroupId`.

**GroupName** \*

string

Display name for the market group shown in the UI.

TemplateSettings

[TemplateSettings](#template-settings)

Template configuration that applies to all markets in this group.

EmailClientSettings

[EmailClientSettings](#email-client-settings)

Email configuration that applies to all markets in this group.

Markets

List<Market>

Collection of markets belonging to this group (populated at runtime).

### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "MarketGroups": [
        {
          "GroupId": "nordic",
          "GroupName": "Nordic Region",
          "TemplateSettings": {
            "DefaultEmailTemplate": "nordic-template"
          }
        },
        {
          "GroupId": "central-europe",
          "GroupName": "Central Europe"
        }
      ]
    }

### [Use cases](#use-cases)

*   **Regional grouping**: Group markets by geographic region (Nordic, Central Europe, North America)
*   **Brand separation**: Group markets by brand identity for multi-brand retailers
*   **ERP integration**: Use `MarketGroupId` as CompanyId for Dynamics 365 or other ERP systems
*   **Shared templates**: Apply email templates at the group level instead of per-market

* * *


## [Return charges](#return-charges)

Return charges define the default costs applied when processing returns. These settings can be configured per market and optionally overridden per shipment method.

### [Return charges model](#return-charges-model)

Property

Type

Default

Description

ReturnCost

decimal

0

Default amount to charge the customer for return shipments. Applied when creating a return order.

NotPickedUpCost

decimal

0

Default amount to charge when a customer does not pick up a shipment or return.

ReturnCostDefaultDisabled

bool

false

When true, return cost is NOT automatically applied to returns. Staff must manually enable the charge. When false, return cost is automatically applied.

### [Return cost behavior](#return-cost-behavior)

The return cost application follows this logic:

1.  Check `Market.ReturnCharges.ReturnCostDefaultDisabled`
2.  If false (enabled by default), the `ReturnCost` amount is automatically added to returns
3.  If true (disabled by default), returns are created without the charge
4.  Individual shipment methods can override this behavior via `ShipmentOption.ReturnCostDefaultEnabled`

Shipment-level settings override market-level settings. If `ShipmentOption.ReturnCostDefaultEnabled` is true for a specific shipping method, return costs will be applied even if the market has `ReturnCostDefaultDisabled` set to true.

### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ReturnCharges": {
        "ReturnCost": 49.00,
        "NotPickedUpCost": 99.00,
        "ReturnCostDefaultDisabled": false
      }
    }

* * *


## [Number options](#number-options)

Number options configure how sequential identifiers are generated for orders, carts, returns, customers, and other entities. Each market can have its own numbering sequences, or share sequences across markets.

### [Number options model](#number-options-model)

Property

Type

Description

**NumberType** \*

string

Type of number to generate. See [supported number types](#supported-number-types) below.

**Key** \*

string

Unique key for the counter. Used to track the current sequence value.

KeyPostfix

string

Optional postfix appended to the key for additional uniqueness.

Prefix

string

String prepended to generated numbers (e.g., "ORD-", "SE-").

Suffix

string

String appended to generated numbers (e.g., "-2024").

StartSequence

long

Starting value for the counter (e.g., 1000, 100000).

Service

string

Number generation service to use. See [service types](#number-service-types) below.

IsReadOnly

bool

When true, the generated number cannot be edited in the GUI.

IsAutoCreateDisabled

bool

When true, the number must be entered manually instead of auto-generated.

MarketGroupId

string

Optional reference to a market group for shared sequences across markets.

IncrementInterval

int?

Interval between increments. Default is 1. Use higher values to leave gaps for manual entries.

ValidationRegex

string

Optional regex pattern for validating manually entered numbers.

TranslateKey

string

Translation key for displaying the number type in the UI.

### [Number service types](#number-service-types)

Service

Description

SequentialNumberService

Generates globally sequential numbers across all markets. Ensures unique numbers tenant-wide.

SequentialMarketNumberService

Generates sequential numbers per market. Each market maintains its own counter.

GuidNumberService

Generates random GUID-based identifiers. Used when sequential numbers are not required.

### [Supported number types](#supported-number-types)

NumberType

Description

OrderNumberOptions

Customer order numbers

CartNumberOptions

Shopping cart identifiers

ReturnNumberOptions

Return order numbers

RmaNumberOptions

Return Merchandise Authorization numbers

CustomerNumberOptions

Customer identifiers

SupplierNumberOptions

Supplier identifiers

InvoiceNumberOptions

Invoice numbers

CreditInvoiceNumberOptions

Credit note numbers

SubscriptionNumberOptions

Subscription identifiers

ProductNumberOptions

Product/article numbers

OrderLineNumberOptions

Individual order line identifiers

### [Resolution order](#resolution-order)

When determining which number options to use, the system follows this priority:

1.  Market-specific `NumberOptions` for the requested `NumberType`
2.  Tenant `NumberOptions` with matching `MarketGroupId`
3.  Tenant `NumberOptions` without `MarketGroupId`
4.  Tenant `NumberOptions` with matching `NumberType`
5.  Default: `GuidNumberService` (for CustomerNumberOptions and others)

### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "NumberOptions": [
        {
          "NumberType": "OrderNumberOptions",
          "Key": "order-counter",
          "Prefix": "ORD-",
          "StartSequence": 10000,
          "Service": "SequentialMarketNumberService",
          "IsReadOnly": true
        },
        {
          "NumberType": "ReturnNumberOptions",
          "Key": "return-counter",
          "Prefix": "RET-",
          "StartSequence": 1000,
          "Service": "SequentialNumberService"
        },
        {
          "NumberType": "CustomerNumberOptions",
          "Service": "GuidNumberService"
        }
      ]
    }

This configuration produces:

*   Order numbers: ORD-10000, ORD-10001, ORD-10002 (per market)
*   Return numbers: RET-1000, RET-1001, RET-1002 (global)
*   Customer IDs: Random GUIDs

* * *


## [Shipment options](#shipment-options)

Shipment options define the available shipping methods for a market, including provider configuration, pricing, and delivery settings.

### [Core shipment properties](#core-shipment-properties)

Property

Type

Description

**ShippingMethodId** \*

string

Unique identifier for the shipping method.

**ShippingMethodName** \*

string

Technical name used to identify the product with the shipping provider.

Label

string

User-friendly display name shown in the UI and to customers.

Description

string

Detailed description of the shipping method.

ShipmentDeliveryType

string

Delivery type: "Delivery" for home delivery, "PickUp" for pickup points or in-store.

IsDefaultShipment

bool

When true, this is the fallback shipping method if no other options match.

DeliveryTime

string

Expected delivery time displayed to customers (e.g., "2-4 business days").

LogoUrl

string

URL to the shipping provider's logo for display in the UI.

CountryCode

string

Two-letter country code this shipping method is valid for.

### [Provider configuration](#provider-configuration)

Property

Type

Description

ShippingGateway

string

Shipping provider gateway. Options: "Bring", "PostNordV2", "Consignor", "Unifaun", "Logistra", "Gls", "Porterbuddy", "Ingrid", "Empty".

ShipmentProduct

string

Product code to book with the provider (e.g., "PICKUP\_PARCEL", "SERVICEPAKKE").

ShipmentProductName

string

Product name for providers that require it (e.g., Logistra).

ProviderServices

string

Provider-specific service codes. Used for additional services like signature, insurance, etc.

ShipmentReturnProduct

string

Product code for return labels. Leave empty if returns use the same product.

ShippingCompany

string

Override shipping company name if the pickup provider differs from the main provider.

### [Pricing configuration](#pricing-configuration)

Property

Type

Description

ShippingSubTotal

decimal

Shipping cost including tax (displayed to customer).

ShippingSubTotalExclTax

decimal

Shipping cost excluding tax.

TaxRate

decimal

Tax rate for shipping. If not specified, uses the market's `DefaultTaxRate`.

DiscountedPrice

decimal

Discounted shipping price including tax.

DiscountedPriceExclTax

decimal

Discounted shipping price excluding tax.

DiscountLabel

string

Label describing the discount (e.g., "Free shipping on orders over $50").

ShippingProfitPercent

decimal?

Profit margin percentage on shipping.

GetPriceFromProvider

bool

When true, fetch real-time shipping prices from the provider API instead of using fixed prices.

AddTaxOnProviderPrice

bool

When true, add tax to prices received from the provider.

AdditionalCustomerPricePercentage

decimal

Surcharge percentage added to shipping costs.

ReturnCostDefaultEnabled

bool

When true, return costs are applied by default for this shipping method, overriding market settings.

### [Service point configuration](#service-point-configuration)

Property

Type

Description

GetServicePoints

bool

When true, search for available pickup points/service points from the provider.

ServicePointRequired

bool

When true, customers must select a pickup/service point.

ServicePointProvider

string

Alternate provider for service point lookup if different from the shipping gateway.

PickUpPoints

List<PickUpPoint>

Pre-configured list of pickup points (alternative to dynamic lookup).

### [Visibility and behavior](#visibility-and-behavior)

Property

Type

Description

HideInOms

bool

When true, this shipping method is not visible in the Omnium backoffice UI.

HideFromApi

bool

When true, this shipping method is not exposed in public API responses.

VueTemplate

string

UI template for the checkout: "Standard", "PickUp point", "PickUp in store".

ProviderNotification

bool

When true, the shipping provider sends SMS/email notifications to customers.

ValidOnMarkets

List<string>

List of market IDs where this shipment option is valid. Empty means all markets.

IncludeGoodsDescription

bool

When true, include product descriptions on shipping labels.

### [Default package dimensions](#default-package-dimensions)

Property

Type

Description

DefaultPackage.WeightInKg

double

Default package weight in kilograms.

DefaultPackage.DefaultDimensions.LengthInCm

int

Default package length in centimeters.

DefaultPackage.DefaultDimensions.WidthInCm

int

Default package width in centimeters.

DefaultPackage.DefaultDimensions.HeightInCm

int

Default package height in centimeters.

DefaultPackage.GoodsDescription

string

Default goods description for customs/shipping.

### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ShipmentOptions": [
        {
          "ShippingMethodId": "bring-servicepakke",
          "ShippingMethodName": "SERVICEPAKKE",
          "Label": "Pickup at Post Office",
          "Description": "Delivered to your nearest post office within 2-4 days",
          "ShipmentDeliveryType": "PickUp",
          "ShippingGateway": "Bring",
          "ShipmentProduct": "SERVICEPAKKE",
          "ShippingSubTotal": 79.00,
          "ShippingSubTotalExclTax": 63.20,
          "TaxRate": 25,
          "GetServicePoints": true,
          "ServicePointRequired": true,
          "DeliveryTime": "2-4 business days",
          "IsDefaultShipment": false,
          "HideInOms": false,
          "HideFromApi": false,
          "DefaultPackage": {
            "WeightInKg": 1.0,
            "DefaultDimensions": {
              "LengthInCm": 30,
              "WidthInCm": 20,
              "HeightInCm": 15
            }
          }
        },
        {
          "ShippingMethodId": "home-delivery",
          "ShippingMethodName": "HOME_DELIVERY",
          "Label": "Home Delivery",
          "Description": "Delivered to your doorstep",
          "ShipmentDeliveryType": "Delivery",
          "ShippingGateway": "Bring",
          "ShipmentProduct": "PA_DANSEN",
          "ShippingSubTotal": 149.00,
          "TaxRate": 25,
          "DeliveryTime": "1-3 business days",
          "IsDefaultShipment": true,
          "ProviderNotification": true
        }
      ]
    }

* * *


## [Email client settings](#email-client-settings)

Email client settings configure how emails are sent for a market, including SMTP settings, sender addresses, and template references.

### [Email client settings model](#email-client-settings-model)

Property

Type

Description

Type

string

Email provider type (e.g., "SMTP", "SendGrid").

Host

string

Email server hostname or URL.

Port

int

Email server port number (e.g., 587 for TLS, 465 for SSL).

UserName

string

Authentication username for the email server.

Password

string

Authentication password for the email server.

KeyName

string

API key name for email services like SendGrid.

StandardEmailAddress

string

Default sender email address (e.g., "[orders@company.com](mailto:orders@company.com)").

InBoundEmailAddress

string

Email address for receiving inbound emails/replies.

InBoundEmailFromName

string

Display name for inbound email communications.

EmailTemplateContainer

string

Azure blob storage container name for email templates.

EmailTemplateContentFile

string

File path/name for email template content.

IsProductIdDisplayedInsteadOfSku

bool?

When true, display product ID instead of SKU in order confirmation emails.

LanguageCode

string

Language code for email content. Controls the language of standard text elements like "Please reply above this line".

### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "EmailClientSettings": {
        "Type": "SendGrid",
        "KeyName": "sendgrid-api-key",
        "StandardEmailAddress": "orders@mystore.com",
        "InBoundEmailAddress": "support@mystore.com",
        "InBoundEmailFromName": "My Store Support",
        "LanguageCode": "en"
      }
    }

* * *


## [Template settings](#template-settings)

Template settings configure which email and document templates are used for various entities like orders, carts, and projects.

### [Template settings model](#template-settings-model)

Property

Type

Description

DefaultEmailTemplate

string

Reference to the default email template.

CustomerNoteTemplate

string

Template for customer notes and messages.

CartTemplates

List<TemplateReferenceSettings>

Available templates for shopping carts.

OrderTemplates

List<TemplateReferenceSettings>

Available templates for orders.

PurchaseOrderTemplates

List<TemplateReferenceSettings>

Available templates for purchase orders.

ProjectTemplates

List<TemplateReferenceSettings>

Available templates for projects.

ProductTemplates

List<TemplateReferenceSettings>

Available templates for products.

ProjectTemplateReferences

ProjectTemplateReferences

Specific template references for project comments.

### [Template reference settings](#template-reference-settings)

Property

Type

Description

TemplateReference

string

Identifier/reference for the template.

DisplayName

string

User-friendly name shown in the UI.

TranslateKey

string

Translation key for localization.

### [Project template references](#project-template-references)

Property

Type

Description

CustomerCommentTemplate

string

Template for customer-facing comments on projects.

PartnerCommentTemplate

string

Template for partner/supplier comments on projects.

InternalCommentTemplate

string

Template for internal staff comments on projects.

### [Sample](#sample-5)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "TemplateSettings": {
        "DefaultEmailTemplate": "standard-order-confirmation",
        "OrderTemplates": [
          {
            "TemplateReference": "standard-order",
            "DisplayName": "Standard Order",
            "TranslateKey": "Template_StandardOrder"
          },
          {
            "TemplateReference": "gift-order",
            "DisplayName": "Gift Order",
            "TranslateKey": "Template_GiftOrder"
          }
        ],
        "ProjectTemplateReferences": {
          "CustomerCommentTemplate": "customer-project-comment",
          "InternalCommentTemplate": "internal-project-comment"
        }
      }
    }

* * *
