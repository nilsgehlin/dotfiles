# Customers — B2C, B2B, Loyalty & CRM — [Related Documentation](#related-documentation)

## [Related Documentation](#related-documentation)

Topic

Link

Full API model reference

[Swagger — Customers](https://api.omnium.no/documentation/customers)

Configuration settings

[Customer Configuration](/docs/Customer/customer-config)

Customer club / loyalty

[Customer Club](/docs/Customer/customer-club)

Product assortment for B2B

[Customer Categories](/docs/Product/product-assortment/customer-categories)

Searching and scrolling

[Scrolling Guide](/docs/Integrations/scrolling)

Delta / change tracking

[Delta Queries](/docs/Integrations/delta)

CRM integration (Voyado)

[Voyado Connector](/docs/plugins/CRM/voyado)

[

Previous

Configuration

](/docs/Customer/customer-config)[

Next

Customer Club

](/docs/Customer/customer-club)

---


## Newsletter

[Customer](/docs/Customer)

# Newsletter

Unsubscription process and setup for newsletters

### [Unsubscription Process](#unsubscription-process)

Omnium simplifies the unsubscription process for customers by offering a one-click solution that doesn't require them to log into their account. This solution is implemented by importing a JS and CSS file from Omnium into your website. When a customer requests to unsubscribe, an event listener will trigger the unsubscription module.

To customize the unsubscribe module, you can modify the default CSS file from Omnium. Simply replace the provided file with your own CSS file to match your website’s design. The default text in the unsubscription box is available in multiple languages, including English, Norwegian, Swedish, Danish, and German. You can further personalize this text via tenant settings in Omnium (see setup instructions below).

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FunsubscribeModule.ae4bbecc.png&w=3840&q=75)

Unsubscribing from the customer club will permanently delete the user's membership data, including all associated benefits, bonuses, and rewards.

* * *

### [Setup Instructions](#setup-instructions)

Follow these steps to enable and configure the unsubscription module on your website:

#### [1\. Configure webSiteUrls in Tenant Settings](#1-configure-websiteurls-in-tenant-settings)

To ensure the unsubscribe module works, you must configure one or more `webSiteUrls` in the tenant settings within Omnium. The steps are as follows:

*   When a customer clicks the unsubscribe link in the newsletter, they will be redirected to the website associated with their account.
*   A pop-up window will appear on that website, offering the option to unsubscribe from the customer club.
*   If no specific market is linked to the customer, or if the `webSiteUrl` is not configured for the customer's market, the system will fallback to the default market's `webSiteUrl` (configured with `isDefaultMarket=true`).

#### [2\. Add webSiteUrls to CORS Settings](#2-add-websiteurls-to-cors-settings)

After completing step 1, Omnium will need to add the configured `webSiteUrls` to the CORS settings. Once you've set up the URLs, please contact Omnium support to finalize this configuration.

#### [3\. Insert Required Code into Your Website](#3-insert-required-code-into-your-website)

Each of the websites specified in step 1 must include the following two lines of code in their HTML header:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    <link rel="stylesheet" href="https://cdnomnium.azureedge.net/customerClubUnsubscription/omniumUnsubscribeToCustomerClub.css" asp-append-version="true" />
    <script type="text/javascript" src="https://cdnomnium.azureedge.net/customerClubUnsubscription/omniumUnsubscribeToCustomerClub.js"></script>

This code will load the necessary JavaScript and CSS files from Omnium, enabling the unsubscription module.

#### [4\. Create a Newsletter with the Unsubscribe Link](#4-create-a-newsletter-with-the-unsubscribe-link)

In your newsletter, include the placeholder `{NEWSLETTER_UNSUBSCRIBE_URL}` for the unsubscribe link. This placeholder will be replaced dynamically with the appropriate unsubscribe URL when the newsletter is sent.

#### [5\. (Optional) Customize the Unsubscribe Message](#5-optional-customize-the-unsubscribe-message)

You can personalize the unsubscribe message and add additional languages by modifying the `unsubscribeMessage` property in the customer club settings. The `unsubscribeMessage` contains a list of key-value pairs, where each key represents a language code, and the value is the corresponding message.

##### [Example:](#example)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "customerClubSettings": {
            "unsubscribeMessage": [
                {
                    "key": "en",
                    "value": "Are you sure you want to unsubscribe? All your cash points will be lost!"
                },
                {
                    "key": "no",
                    "value": "Er du sikker? Alle dine cash points vil gå tapt!"
                }
            ]
        }
    }

[

Previous

Customer Club

](/docs/Customer/customer-club)[

Next

Cases

](/docs/Customer/Cases)

---


## Customers

# Customers

Manage private (B2C) and business (B2B) customers in Omnium — profiles, loyalty clubs, and communication.

Omnium manages two distinct customer types: **private customers** (B2C) for individual consumers and **business customers** (B2B) for companies and organizations. Both types share a common foundation — addresses, external IDs, consents, tags, and custom properties — but differ in the features built on top.

Customers are connected to orders, carts, and projects, and can be scoped to specific markets and stores for access control.

* * *


## [In this section](#in-this-section)

[

API Reference

Create, search, and manage private and business customers via the API



](/docs/Customer/customer-api)[

Configuration

Identification, creation controls, address handling, consent, and B2B settings



](/docs/Customer/customer-config)[

Customer Management

Data model, search, privacy, merging, and integration patterns



](/docs/Customer/customer-management)[

Customer Club

Loyalty memberships, points, tiers, and rewards



](/docs/Customer/customer-club)[

Newsletter

Unsubscription module setup and customization



](/docs/Customer/newsletter)[

Cases

CRM support case system — track inquiries, assign agents, and communicate with customers



](/docs/Customer/Cases)

[

Previous

Shipment Validator

](/docs/Carts/validation/cart-validators/shipment-validator)[

Next

API Reference

](/docs/Customer/customer-api)