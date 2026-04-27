# Connectors & Plugins — Payments, Shipping, ERP, POS


---

## Connectors & Plugins

# Connectors & Plugins

Pre-built integrations maintained by the Omnium team — payment providers, shipping carriers, ERP systems, POS, CRM, and more.

Omnium ships with a library of **pre-built connectors** that integrate with popular third-party systems out of the box. These are developed and maintained by the Omnium team — you don't need to write code to use them. Just configure the connector with your provider credentials and connect it to your workflows.

**Connectors vs. custom integrations:** The plugins listed here are built into Omnium. If you need to build your own integration against the Omnium API (for example, syncing data with an in-house system), see the [Integrations](/docs/Integrations) section instead. For how the connector framework works and how to configure connectors, see the [Connectors guide](/docs/Integrations/connectors).

* * *

## [Plugin categories](#plugin-categories)

[

Payment Providers

Klarna, Stripe, Adyen, Vipps, PayPal, Dintero, Walley, and many more



](/docs/plugins/Payments)[

Shipping Carriers

Bring, PostNord, GLS, nShift, Ingrid, Porterbuddy, and more



](/docs/plugins/Shipments)[

ERP

Fortnox, PowerOffice, TripleTex



](/docs/plugins/ERP)[

POS

Sitoo, Flow, FrontSystems



](/docs/plugins/POS)[

E-Commerce

Shopify, Magento



](/docs/plugins/ECOM)[

CRM

Voyado, Voyado Elevate



](/docs/plugins/CRM)[

WMS

Ongoing Warehouse



](/docs/plugins/WMS)[

Gift Cards

AwardIt



](/docs/plugins/GiftCards)[

Other

SendGrid, Google Feeds, LinkMobility, PinMeTo



](/docs/plugins/Other)

[

Previous

Troubleshooting

](/docs/Integrations/troubleshooting)[

Next

Payments

](/docs/plugins/Payments)

---

## Payments

[Connectors & Plugins](/docs/plugins)

# Payments

Overview of how payments work in Omnium and the supported payment providers

## [Payments in Omnium](#payments-in-omnium)

Omnium integrates with a wide range of external payment providers to handle both online and in-store transactions.  
When a customer completes a purchase, the selected provider (e.g. Vipps, Klarna, Stripe) authorizes the payment.

Omnium then stores the payment details on the cart and, once the cart is placed, on the order.  
This allows Omnium to manage post-order operations such as **capture, refund, and cancellation** through the configured provider integration.

* * *

## [Supported Payment Providers](#supported-payment-providers)

Omnium currently supports the following providers:

*   Adyen
*   Aera
*   Aera Invoice
*   Authorize.Net
*   Avarda
*   AwardIt
*   Bonus Points
*   Dintero
*   Klarna
*   Klarna v3
*   N-Genius
*   Netaxept
*   Nets
*   NetsEasy
*   PayEx
*   PayPal
*   Qliro
*   ResursBank
*   Shopify
*   Stripe
*   Svea
*   Swish
*   Toss
*   Vipps
*   Vipps E-Payment
*   Walley
*   Webhook Payment
*   Zaver
*   Atome

* * *

## [Using the Payment API](#using-the-payment-api)

For detailed information on how to work with payments in the API, including:

*   Adding payments to carts and orders
*   Transaction types and payment lifecycle
*   Multiple payments and split payments
*   Payment API endpoints

See the [Payments section in the Order API documentation](/docs/Order/order-api#payments).

* * *

## [Configuration](#configuration)

Configure your payment providers in Omnium: _Configuration → Settings → Orders → Payment Providers_

Each provider requires specific credentials and settings. Refer to the provider's documentation for integration details.

[

Previous

Connectors & Plugins

](/docs/plugins)[

Next

Adyen

](/docs/plugins/Payments/adyen)

---

## Shipment

[Connectors & Plugins](/docs/plugins)

# Shipment

Learn all you need to know about configuring shipment providers in Omnium.

Omnium allows integration with multiple shipping providers, each configured with specific settings and shipment options.

## [Supported shipping providers](#supported-shipping-providers)

Provider

Gateway Key

Documentation

[Ingrid](/docs/plugins/Shipments/ingrid-plugin)

`Ingrid`

Checkout widget and booking

[PostNord](/docs/plugins/Shipments/postnord)

`PostNordV2` / `Postnord`

EDI-based booking (V2 recommended)

[Bring](/docs/plugins/Shipments/bring)

`Bring`

Nordic parcel services

[nShift Delivery](/docs/plugins/Shipments/nshiftDelivery)

`Unifaun`

Formerly Unifaun - delivery checkout

[nShift Ship](/docs/plugins/Shipments/nshiftShip)

`Consignor`

Formerly Consignor - shipment booking

[Logistra](/docs/plugins/Shipments/logistra)

`Logistra`

Cargonizer integration

[GLS](/docs/plugins/Shipments/gls)

`Gls`

Parcel services (Denmark focused)

[Porterbuddy](/docs/plugins/Shipments/porterbuddy)

`Porterbuddy`

Same-day delivery

## [Shipping Providers](#shipping-providers)

Each shipping provider (e.g., Bring, PostNord, GLS, Consignor, Logistra) requires a set of configurations to enable shipment booking and tracking.

### [Shipping Provider Settings Model](#shipping-provider-settings-model)

Property

Type

Description

**Name**

string

Name of the shipping provider.

**DisplayName**

string

User-friendly name displayed in Omnium.

**ShippingGateway**

string

Shipping gateway (e.g., Bring, Consignor, PostNord).

**MerchantId**

string

ID for authentication (if required by the provider).

**MerchantSecret**

string

Password for authentication (if required by the provider).

**ApiToken**

string

API token for authentication (if required by the provider).

**CustomerNumber**

string

Customer number required by some providers for shipment booking.

**CustomerReturnNumber**

string

Customer number for return booking requests (if applicable).

**CustomerName**

string

Account owner name.

**CustomerEmail**

string

Account owner email address.

**BaseUrl**

string

Provider API URL (test or production).

**TrackingUrl**

string

URL for tracking shipments.

**LogoUrl**

string

URL to the provider's logo.

**VueTemplate**

string

Internal Omnium template.

**DisplayInOms**

bool

Determines if the provider is visible in the Omnium interface.

**IsTest**

bool

Indicates if the provider is in test mode (used by Bring and PostNord).

**BookTransfer**

bool

Used by Logistra for transfer booking.

**ProviderSendReturnLabelOnEmail**

bool

Used by Logistra to send return labels via email instead of printing.

**ValidOnMarkets**

List

Specifies the markets where this provider is valid.

### [Example Configurations](#example-configurations)

#### [Logistra Shipping Provider](#logistra-shipping-provider)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "Name": "Logistra",
        "DisplayName": "Logistra",
        "ShippingGateway": "Logistra",
        "MerchantId": "xxxx",
        "MerchantSecret": "xxxxxxx",
        "BaseUrl": "http://cargonizer.no",
        "BookTransfer": true
    }

#### [Bring Shipping Provider](#bring-shipping-provider)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "Name": "Bring",
        "DisplayName": "Bring",
        "ShippingGateway": "Bring",
        "MerchantId": "Merchant Id",
        "ApiToken": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "CustomerNumber": "PARCELS_SWEDEN-xxxxx",
        "BaseUrl": "https://api.bring.com/",
        "IsTest": false
    }

#### [PostNord Shipping Provider](#postnord-shipping-provider)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "Name": "Postnord",
        "DisplayName": "Postnord",
        "ShippingGateway": "Postnord",
        "MerchantId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "ApiToken": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "BaseUrl": "https://api2.postnord.com/"
    }

## [Shipment Options](#shipment-options)

Each shipment option represents a specific shipping service provided by the carrier (e.g., home delivery, pickup point).

### [Shipment Option Model](#shipment-option-model)

Property

Type

Description

**ShippingMethodName**

string

Unique name identifying the shipping product, matching the e-commerce platform.

**ShippingMethodId**

string

Unique ID for this option (if necessary).

**ShippingGateway**

string

Provider gateway (e.g., Bring, PostNord).

**ShippingPriceGateway**

string

If prices should be calculated by the provider but booking should not be done, set this.

**CountryCode**

string

Two-letter country code used by providers for pickup point retrieval.

**ShipmentProduct**

string

Provider’s shipment product code (e.g., "PICKUP\_PARCEL", "mypack").

**ShipmentProductName**

string

Optional name for the shipment product.

**ProviderNotification**

bool

Whether the provider sends notifications (SMS/email).

**ShipmentReturnProduct**

string

Return shipment product code (if applicable).

**ShippingSubTotal**

decimal

Default shipping cost, if applicable.

**GetPriceFromProvider**

bool

If the provider should calculate shipping prices based on the order details.

**AddTaxOnProviderPrice**

bool

Whether tax should be added to the provider's shipping cost.

**AdditionalCustomerPricePercentage**

decimal

Extra surcharge percentage on provider cost.

**DiscountedPrice**

decimal

Discounted price for the shipment option.

**DiscountLabel**

string

Label for discount display.

**DeliveryTime**

string

Estimated delivery time.

**LogoUrl**

string

Provider logo URL.

**VueTemplate**

string

Internal Omnium template.

**DefaultPackage**

object

Default package dimensions for the provider.

**NumberOfCollisMandatory**

bool

Whether specifying the number of packages is required.

**ShipmentDeliveryType**

string

"Delivery" (to customer) or "PickUp" (customer collects the package).

**TranslateKey**

string

Internal identifier for the shipment type.

**Label**

string

User-friendly name for the shipment option.

**Description**

string

Description of the shipment option.

**IsDefaultShipment**

bool

Marks this as the default shipping method.

**ConsigneeType**

string

"CONSUMER" or "BUSINESS" (as required by providers).

**ConsignorType**

string

"CONSUMER" or "BUSINESS" (as required by providers).

**DefaultWarehouseCode**

string

Default warehouse for shipments (if applicable).

[

Previous

Zaver

](/docs/plugins/Payments/zaver)[

Next

Bring

](/docs/plugins/Shipments/bring)