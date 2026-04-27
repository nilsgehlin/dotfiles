# Getting Started — API Fundamentals — [E-commerce Frontend Developers](#e-commerce-frontend-developers)

## [E-commerce Frontend Developers](#e-commerce-frontend-developers)

Build webshops, mobile apps, or headless commerce solutions using Omnium's product catalog, cart, and checkout APIs.

### [What You'll Build](#what-youll-build)

*   Product listing and search pages
*   Shopping cart functionality
*   Checkout flows with payment and shipping
*   Customer account and order history
*   Inventory availability displays

### [Key Concepts](#key-concepts)

Concept

Description

**Products**

Searchable catalog with variants, pricing, and assets

**Cart**

Shopping session with items, discounts, shipping, and payment

**Orders**

Completed purchases with status tracking

**Markets**

Geographic/business segments with currency and language

### [Essential API Endpoints](#essential-api-endpoints)

Endpoint

Purpose

`POST /api/Products/SearchProducts`

Search and filter products with facets

`POST /api/Cart/AddItemToCart`

Create cart or add items

`GET /api/Cart/{cartId}`

Retrieve cart details

`POST /api/Cart/{cartId}/Validate`

Validate before checkout

`POST /api/Cart/CreateOrderFromCart/{cartId}`

Complete checkout

`POST /api/Orders/Search`

Customer order history

`GET /api/Inventory/Search`

Check stock availability

### [Documentation](#documentation)

*   [Omnichannel E-commerce Tutorial](/docs/GettingStartedWithAPI/Tutorials/omnichannel-ecom) - End-to-end tutorial
*   [Products](/docs/Product) - Product model and search
*   [Carts](/docs/Carts) - Cart operations and checkout
*   [Inventory](/docs/Inventory) - Stock management

* * *


## [PIM Integrators](#pim-integrators)

Sync product information from PIM systems (Akeneo, inRiver, Bluestone, etc.) into Omnium.

### [What You'll Build](#what-youll-build-1)

*   Product import pipelines
*   Category synchronization
*   Asset and image management
*   Multi-language product content
*   Price list updates

### [Key Concepts](#key-concepts-1)

Concept

Description

**Product**

Master product with variants (SKUs)

**Categories**

Hierarchical product classification

**Assets**

Images and media attached to products

**Prices**

Market-specific pricing with validity periods

### [Essential API Endpoints](#essential-api-endpoints-1)

Endpoint

Purpose

`POST /api/Products`

Create product with variants

`PATCH /api/Products/PatchMany`

Bulk update products (up to 1000)

`POST /api/ProductCategories/AddMany`

Create/update categories

`PUT /api/Prices/AddMany`

Bulk price updates

`POST /api/Products/SearchProducts`

Verify imported products

### [Best Practices](#best-practices)

*   Use `PatchMany` for updates - it only updates changed fields
*   Set prices at product level when variants share the same price
*   Use delta queries to sync only changed products

### [Documentation](#documentation-1)

*   [Product Model](/docs/Product) - Complete product structure
*   [Product Categories](/docs/Product/product-categories) - Category management
*   [Product Assets](/docs/Product/product-assets) - Image and media handling
*   [Prices](/docs/Prices) - Pricing strategies
*   [Data In: Best Practices](/docs/Integrations/data-in) - Bulk import patterns

* * *


## [ERP Integrators](#erp-integrators)

Integrate with ERP systems (Dynamics 365, SAP, Fortnox, etc.) for order sync, inventory, and financial data.

### [What You'll Build](#what-youll-build-2)

*   Order export to ERP
*   Order status synchronization
*   Inventory level updates
*   Return and refund processing
*   Purchase order management

### [Key Concepts](#key-concepts-2)

Concept

Description

**Order**

Customer purchase with workflow status

**Workflow**

Order processing steps (validation, payment, fulfillment)

**Returns**

Return requests and replacement orders

**Events**

Real-time notifications for order changes

### [Essential API Endpoints](#essential-api-endpoints-2)

Endpoint

Purpose

`POST /api/Orders/Search`

Query orders (use `modifiedSince` for delta)

`PUT /api/Orders/{orderId}/UpdateStatus`

Update order workflow status

`PUT /api/Inventory/UpdateMany`

Sync inventory levels

`POST /api/Returns`

Process returns

`POST /api/Orders`

Create orders from ERP

### [Integration Patterns](#integration-patterns)

*   **Polling**: Use `modifiedSince` parameter for delta queries
*   **Real-time**: Subscribe to events via webhooks or Azure queues
*   **Batch**: Use bulk endpoints for high-volume operations

### [Documentation](#documentation-2)

*   [Orders](/docs/Order) - Order model and operations
*   [Order Workflows](/docs/Order/Workflows) - Status management
*   [Events](/docs/Integrations/events) - Real-time subscriptions
*   [Delta Queries](/docs/Integrations/delta) - Efficient polling
*   [Data Out](/docs/Integrations/data-out) - Export patterns

### [Pre-built Connectors](#pre-built-connectors)

*   [Fortnox](/docs/plugins/ERP/Fortnox)
*   [PowerOffice](/docs/plugins/ERP/PowerOffice)
*   [TripleTex](/docs/plugins/ERP/TripleTex)

* * *


## [WMS Integrators](#wms-integrators)

Connect warehouse management systems for fulfillment, stock updates, and shipment tracking.

### [What You'll Build](#what-youll-build-3)

*   Real-time inventory synchronization
*   Order fulfillment feeds
*   Shipment creation and tracking
*   Pick/pack operations
*   Goods receiving

### [Key Concepts](#key-concepts-3)

Concept

Description

**Inventory**

Stock levels per SKU and warehouse

**Warehouse**

Fulfillment location (store with `isWarehouse: true`)

**Shipment**

Delivery tracking with carrier information

**Allocation**

Reserving inventory for orders

### [Essential API Endpoints](#essential-api-endpoints-3)

Endpoint

Purpose

`PUT /api/Inventory/UpdateMany`

Bulk inventory updates (recommended)

`POST /api/Inventory/Search`

Query current stock levels

`POST /api/Orders/Search`

Get orders for fulfillment

`POST /api/OrderShipments`

Create shipments with tracking

`GET /api/Stores/SearchStores`

Get warehouse configuration

### [Best Practices](#best-practices-1)

*   Use `UpdateMany` for inventory - it preserves reserved quantities
*   Subscribe to order events for real-time fulfillment triggers
*   Include tracking information when creating shipments

### [Documentation](#documentation-3)

*   [Inventory](/docs/Inventory) - Stock management
*   [Stores](/docs/Stores) - Warehouse configuration
*   [Order Shipments](/docs/Order/workflow-steps/shipments) - Shipment handling
*   [Events](/docs/Integrations/events) - Real-time order notifications

### [Pre-built Connectors](#pre-built-connectors-1)

*   [Ongoing WMS](/docs/plugins/WMS/Ongoing)

* * *


## [Configuration & Admin](#configuration--admin)

Set up and configure Omnium tenants, users, markets, and integrations.

### [What You'll Manage](#what-youll-manage)

*   Market and store structure
*   User accounts and permissions
*   API credentials
*   Integration connectors
*   System settings

### [Key Concepts](#key-concepts-4)

Concept

Description

**Market**

Geographic/business segment with currency and language

**Store**

Sales channel or warehouse location

**Roles**

Permission groups for users

**Triggers**

Event subscriptions and webhooks

### [Essential API Endpoints](#essential-api-endpoints-4)

Endpoint

Purpose

`PUT /api/Markets/Update`

Configure markets

`POST /api/Stores/AddMany`

Create stores/warehouses

`GET/POST /api/Users`

User management

`GET/POST /api/Role`

Role and permission management

`GET/POST /api/Trigger`

Event subscription setup

`GET/PUT /api/Settings`

System configuration

### [Getting Started](#getting-started)

1.  Set up markets for your geographic regions
2.  Create stores and designate warehouses
3.  Configure API users with appropriate permissions
4.  Set up event subscriptions for integrations

### [Documentation](#documentation-4)

*   [Markets](/docs/Markets) - Market configuration
*   [Stores](/docs/Stores) - Store and warehouse setup
*   [Security](/docs/Security) - Authentication and authorization
*   [Configuration](/docs/configuration) - System settings
*   [Events](/docs/Integrations/events) - Webhook setup

* * *


## [Payment Integrators](#payment-integrators)

Implement payment provider integrations for checkout and payment processing.

### [What You'll Build](#what-youll-build-4)

*   Payment method integration
*   Checkout session handling
*   Payment capture and refunds
*   Payment reconciliation

### [Key Concepts](#key-concepts-5)

Concept

Description

**Payment Method**

Configured payment provider (Klarna, Vipps, etc.)

**Payment Session**

Provider-specific checkout session

**Capture**

Finalizing payment after order fulfillment

**Refund**

Returning funds to customer

### [Essential API Endpoints](#essential-api-endpoints-5)

Endpoint

Purpose

`GET /api/Cart/{cartId}/GetPaymentOptions`

Available payment methods

`POST /api/Cart/{cartId}/AddPayments`

Add payment to cart

`POST /api/Cart/CreateOrderFromCart/{cartId}`

Complete checkout

### [Pre-built Payment Connectors](#pre-built-payment-connectors)

Omnium has ready-to-use integrations for major payment providers:

Provider

Documentation

Klarna

[Klarna V3](/docs/plugins/Payments/klarnav3)

Vipps

[Vipps](/docs/plugins/Payments/vipps)

Dintero

[Dintero](/docs/plugins/Payments/dintero)

Nets Easy

[Nets Easy](/docs/plugins/Payments/netsEasy)

Qliro

[Qliro](/docs/plugins/Payments/qliro)

Walley

[Walley](/docs/plugins/Payments/Walley)

Resurs Bank

[Resurs Bank](/docs/plugins/Payments/resursbank)

Zaver

[Zaver](/docs/plugins/Payments/zaver)

Aera

[Aera](/docs/plugins/Payments/aera)

### [Documentation](#documentation-5)

*   [Carts - Payment](/docs/Carts) - Cart payment operations
*   [Order Payment Steps](/docs/Order/workflow-steps/payment) - Payment workflow

* * *


## [Shipping Integrators](#shipping-integrators)

Connect shipping providers for delivery options, label generation, and tracking.

### [What You'll Build](#what-youll-build-5)

*   Shipping option retrieval
*   Rate calculation
*   Label generation
*   Tracking updates
*   Delivery notifications

### [Key Concepts](#key-concepts-6)

Concept

Description

**Shipping Method**

Configured delivery option

**Shipment**

Order delivery with tracking

**Carrier**

Shipping provider (PostNord, Bring, etc.)

### [Essential API Endpoints](#essential-api-endpoints-6)

Endpoint

Purpose

`GET /api/Cart/{cartId}/GetShippingOptions`

Available shipping methods

`POST /api/Cart/{cartId}/AddShipments`

Add shipping to cart

`POST /api/OrderShipments`

Create shipment with tracking

`GET /api/ShipmentOptions`

Query shipping configuration

### [Pre-built Shipping Connectors](#pre-built-shipping-connectors)

Omnium integrates with Nordic and international carriers:

Provider

Documentation

PostNord

[PostNord](/docs/plugins/Shipments/postnord)

nShift Delivery

[nShift Delivery](/docs/plugins/Shipments/nshiftDelivery)

nShift Ship

[nShift Ship](/docs/plugins/Shipments/nshiftShip)

Ingrid

[Ingrid](/docs/plugins/Shipments/ingrid-plugin)

Ongoing

[Ongoing](/docs/plugins/WMS/Ongoing)

### [Documentation](#documentation-6)

*   [Order Shipments](/docs/Order/workflow-steps/shipments) - Shipment handling
*   [Stores](/docs/Stores) - Warehouse configuration for fulfillment

* * *


## [Business Analysts](#business-analysts)

Access reporting, analytics, and data exports for business intelligence.

### [What You'll Access](#what-youll-access)

*   Order reports and analytics
*   Sales data exports
*   Inventory reports
*   Customer insights
*   Product performance data

### [Key Concepts](#key-concepts-7)

Concept

Description

**Delta Queries**

Fetch only changed records since last sync

**Scrolling**

Paginate through large datasets

**Events**

Subscribe to data changes

### [Essential API Endpoints](#essential-api-endpoints-7)

Endpoint

Purpose

`POST /api/Orders/Search`

Query orders with filters

`POST /api/Products/SearchProducts`

Product catalog data

`POST /api/Inventory/Search`

Stock level reports

`POST /api/Customers/Search`

Customer data (respect GDPR)

`GET /api/AnalyticsOrders`

Order analytics data

### [Data Export Patterns](#data-export-patterns)

*   Use `modifiedSince` for incremental exports
*   Use scrolling for large result sets
*   Subscribe to events for real-time data feeds

### [Documentation](#documentation-7)

*   [Data Out](/docs/Integrations/data-out) - Export patterns
*   [Delta Queries](/docs/Integrations/delta) - Incremental data fetching
*   [Scrolling](/docs/Integrations/scrolling) - Large dataset pagination
*   [Events](/docs/Integrations/events) - Real-time data subscriptions
*   [Customer](/docs/Customer) - Customer data management

* * *


## [Need Help?](#need-help)

*   **API Questions**: Explore [api.omnium.no](https://api.omnium.no) for complete endpoint documentation
*   **Integration Support**: Contact [info@omnium.no](mailto:info@omnium.no)
*   **Demo Environment**: Request a demo tenant to test your integration

[

Previous

API Developer Guide

](/docs/GettingStartedWithAPI/api-developer-guide)[

Next

Tutorials

](/docs/GettingStartedWithAPI/Tutorials)

---


## API Security Best Practices

[Security Overview](/docs/Security)

# API Security Best Practices

How to securely manage API credentials, design permissions, handle errors, and prepare for production.


## [Overview](#overview)

This guide covers the security side of building an API integration with Omnium. For the mechanics of authentication (token endpoints, code examples, request patterns), see the [API Developer Guide](/docs/GettingStartedWithAPI/api-developer-guide).

* * *


## [Credential Lifecycle](#credential-lifecycle)

### [Creating API Users](#creating-api-users)

API credentials are created in the Omnium UI under **Configuration > Authorization > API Users**. Each API user receives a `ClientId` and `ClientSecret` pair.

Key points:

*   The `ClientSecret` is shown **only once** at creation time. Omnium stores it encrypted — there is no way to retrieve it later.
*   If a secret is lost, create a new API user and deactivate the old one.
*   Give each API user a **descriptive name** that identifies the system or integration it belongs to (e.g., `"Shopify Sync"`, `"ERP Order Export"`, `"Mobile App"`).

### [One Integration, One API User](#one-integration-one-api-user)

Every integration should have its own dedicated API user. This provides:

*   **Auditability** — API calls can be traced to a specific system
*   **Granular control** — Each integration gets only the roles it needs
*   **Safe rotation** — Deactivating one user doesn't break other integrations
*   **Independent rate limits** — Each API user has its own rate limit budget

Never share credentials between integrations. If your ERP and e-commerce platform both use the same API user, deactivating it will break both systems simultaneously.

### [Storing Secrets](#storing-secrets)

Do

Don't

Store secrets in a vault or secrets manager (Azure Key Vault, AWS Secrets Manager, HashiCorp Vault)

Hard-code secrets in source code

Use environment variables or secure configuration for local development

Commit secrets to version control

Encrypt secrets at rest in your infrastructure

Store secrets in plain-text config files

Restrict access to secrets to the team members who need them

Share secrets via email or chat

### [Deactivating API Users](#deactivating-api-users)

When an integration is retired or compromised:

1.  Navigate to **Configuration > Authorization > API Users**
2.  Locate the API user and deactivate it

Deactivated users are rejected immediately — any token issued to that user will stop working on the next API call, even if the token has not yet expired.

* * *


## [Designing Permissions](#designing-permissions)

### [Principle of Least Privilege](#principle-of-least-privilege)

Assign only the roles each integration actually needs. Common patterns:

Integration type

Typical roles

E-commerce frontend (headless)

`CommerceUser` (includes cart, product, and customer access)

ERP order sync

`OrderRead` + `InventoryAdmin`

Product information management

`ProductAdmin`

Reporting / analytics

`OrderRead` + `ProductRead` + `CustomerRead`

Full administration

`ApiOwner` (use sparingly)

### [Store and Market Scoping](#store-and-market-scoping)

By default, an API user can see data across all stores and markets. To restrict access:

*   Assign the specific stores the user needs (e.g., `store-oslo-downtown`, `store-bergen-mall`)
*   Assign the specific markets (e.g., `market-nor`, `market-swe`)

If the user should access everything, assign `AllStores` and `AllMarkets`.

Store and market scoping is particularly useful for integrations that should only see data from specific locations — for example, a warehouse system that only needs orders destined for its warehouse.

### [Role Inheritance](#role-inheritance)

Roles follow a hierarchy. Higher-level roles automatically include the permissions of lower-level roles:

*   `ApiOwner` includes everything
*   `CommerceUser` includes `ApiUser`
*   Resource Admin roles (e.g., `OrderAdmin`) include the corresponding Read role (`OrderRead`)

You never need to assign both `OrderAdmin` and `OrderRead` to the same user — `OrderAdmin` already includes read access.

* * *


## [Token Management](#token-management)

### [Lifecycle](#lifecycle)

1.  Your integration calls `POST /api/token` with the client ID and secret
2.  Omnium returns a JWT valid for **10 days**
3.  Your integration includes the token in the `Authorization: Bearer {token}` header on every request
4.  When the token approaches expiry, request a new one

### [Best Practices](#best-practices)

**Cache and reuse tokens.** A token is valid for 10 days. Request a new one only when the current one is close to expiring or has been rejected with `401 Unauthorized`.

**Check expiry proactively.** Decode the JWT and read the `exp` claim to know when it expires, or track the `expiresIn` value from the token response. Request a new token before the old one expires to avoid service interruptions.

**Handle 401 gracefully.** If a request returns `401`, your token has expired or the API user has been deactivated. Request a new token and retry the original request once. If the second attempt also returns `401`, the credentials themselves may be invalid — log the error and alert your team instead of retrying in a loop.

**Never expose tokens.** Tokens carry the same access as the credentials that created them. Do not log full tokens, include them in URLs, or send them to client-side code.

* * *


## [Handling Security Errors](#handling-security-errors)

Status Code

Meaning

What to Do

`401 Unauthorized`

Token is missing, expired, or the API user is deactivated

Request a new token. If that also fails, check that the API user is still active.

`403 Forbidden`

The API user does not have the required role for this endpoint

Check which roles the endpoint requires (see Swagger documentation) and update the API user's roles.

`429 Too Many Requests`

Rate limit exceeded

Back off and retry with exponential backoff and jitter. Consider reducing parallelism. See [Rate Limits](/docs/Environments/rate-limits).

A `403` means the credentials are valid but the user lacks permission. This is a configuration issue, not a runtime error — fix it by adjusting the API user's roles, not by retrying.

* * *


## [Multi-Tenant Considerations](#multi-tenant-considerations)

If you manage integrations across multiple Omnium tenants (for example, you are an agency or system integrator working with several brands):

*   **Separate credentials per tenant.** Each tenant has its own API users. A token from one tenant cannot access another tenant's data.
*   **Separate token caching per tenant.** If your integration serves multiple tenants, make sure token storage is keyed by tenant to prevent accidentally using the wrong token.
*   **Environment awareness.** Test and production are separate environments with separate data. API users created in test do not exist in production and vice versa.

* * *


## [Securing Your Webhook Endpoints](#securing-your-webhook-endpoints)

When Omnium sends webhook requests to your systems, your endpoints are responsible for validating the incoming request.

### [Validate Authentication](#validate-authentication)

Configure a **Bearer token** or **API key header** on the connector in Omnium, then validate it on your end:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [HttpPost("omnium-webhook")]
    public IActionResult HandleWebhook([FromHeader(Name = "Authorization")] string auth)
    {
        if (auth != "Bearer YOUR_EXPECTED_TOKEN")
            return Unauthorized();
     
        // Process the webhook payload
        // ...
        return Ok();
    }

### [Design for Idempotency](#design-for-idempotency)

Omnium may retry webhook deliveries if your endpoint does not respond with a success status. Ensure your endpoint can safely receive the same event more than once without duplicating actions.

Common approaches:

*   Track processed event IDs and skip duplicates
*   Use the order ID and status as a natural deduplication key
*   Design operations to be naturally idempotent (e.g., "set status to X" rather than "increment counter")

### [Respond Quickly](#respond-quickly)

Webhook requests have a timeout. If your processing takes a long time, accept the request immediately (return `200 OK`) and process it asynchronously.

* * *


## [Go-Live Security Checklist](#go-live-security-checklist)

Before moving an integration to production, verify:

### [Credentials](#credentials)

*    Production API user created with a descriptive name
*    Client secret stored in a vault or secrets manager
*    Test credentials are **not** used in production
*    Only the required roles are assigned (no `ApiOwner` unless genuinely needed)
*    Store and market scoping is applied where appropriate

### [Token Handling](#token-handling)

*    Token is cached and reused (not requested on every API call)
*    Token expiry is tracked and renewal happens proactively
*    `401` responses trigger token renewal, not infinite retries
*    Tokens are not logged, exposed in URLs, or sent to browsers

### [Error Handling](#error-handling)

*    `429 Too Many Requests` is handled with exponential backoff
*    `403 Forbidden` is logged as a configuration issue and not retried
*    Network errors and timeouts are retried with reasonable limits

### [Webhooks (if applicable)](#webhooks-if-applicable)

*    Endpoint uses HTTPS
*    Endpoint validates the authentication header
*    Endpoint is idempotent
*    Endpoint responds within the configured timeout

[

Previous

Security Overview

](/docs/Security)[

Next

Authentication - UI

](/docs/Security/authentication-roles)