# Getting Started — API Fundamentals — [Searching](#searching)

## [Searching](#searching)

Search is the primary way to query data. All search endpoints accept a `POST` request with a JSON body containing filter criteria.

### [Basic Search](#basic-search)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/orders/Search
     
    {
      "take": 20,
      "page": 0,
      "sortOrder": "CreatedDescending"
    }

### [Search Response Structure](#search-response-structure)

All search endpoints return the same wrapper:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "result": [ ... ],
      "totalHits": 1520,
      "facets": [ ... ],
      "scrollId": null
    }

Field

Description

`result`

Array of matching items

`totalHits`

Total number of matches (not just the current page)

`facets`

Aggregations for filtering UI (categories, brands, statuses, etc.)

`scrollId`

Used for cursor-based pagination with Scroll endpoints

### [Pagination](#pagination)

Parameter

Description

Limits

`take`

Number of items per page

Max **100**

`page`

Page number (0-based)

Max offset: `take * page` must not exceed **10,000**

**Example — page 3 with 25 items per page:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "take": 25,
      "page": 2,
      "sortOrder": "CreatedDescending"
    }

This returns items 50–74 (0-indexed page 2 × 25 items).

### [Scroll Search (Large Datasets)](#scroll-search-large-datasets)

For datasets larger than 10,000 items, use the Scroll endpoint instead of pagination:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/orders/Scroll
     
    {
      "take": 100,
      "sortOrder": "CreatedAscending"
    }

The response includes a `scrollId`. Use it to fetch subsequent batches:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/orders/Scroll/{scrollId}

Keep calling the scroll endpoint until `result` is empty. See [Scrolling](/docs/Integrations/scrolling) for more details.

### [Sort Orders](#sort-orders)

Available sort options vary by resource but commonly include:

Sort Order

Description

`CreatedAscending` / `CreatedDescending`

Sort by creation date

`ModifiedAscending` / `ModifiedDescending`

Sort by last modification

`DocumentId`

Sort by internal ID (fastest performance)

Product search supports multi-level sorting with `sortOrder`, `sortOrder2nd`, and `sortOrder3rd`.

### [Filtering Examples](#filtering-examples)

**Orders — filter by status and date range:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/orders/Search
     
    {
      "selectedStatuses": ["New", "InProgress"],
      "createdFrom": "2025-01-01T00:00:00Z",
      "createdTo": "2025-12-31T23:59:59Z",
      "take": 50,
      "page": 0,
      "sortOrder": "CreatedDescending"
    }

**Products — filter by market, stock, and category:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products/SearchProducts
     
    {
      "marketId": "nor",
      "productCategoryIds": ["tees"],
      "isInStock": true,
      "take": 50,
      "page": 0,
      "isFacetsDisabled": true
    }

**Customers — search by email:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/customers/Search
     
    {
      "email": "customer@example.com",
      "take": 10,
      "page": 0
    }

### [Disabling Facets](#disabling-facets)

Facets (aggregations) add overhead to search queries. If you don't need them, disable them for better performance:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "disableFacets": true
    }

For product search, the parameter is `isFacetsDisabled`:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "isFacetsDisabled": true
    }

Always disable facets for backend integrations (ERP sync, inventory updates, etc.). Only enable them when building customer-facing filter UIs.

* * *


## [Updating Resources (PATCH)](#updating-resources-patch)

PATCH endpoints let you update specific fields without sending the entire object. Only the fields you include in the request body are modified — everything else is left unchanged.

### [Basic Patch](#basic-patch)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/orders/{orderId}/PatchOrder
     
    {
      "status": "InProgress",
      "salesPersonId": "user@company.com"
    }

### [Patching Custom Properties](#patching-custom-properties)

Custom properties can be added, updated, or replaced:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/orders/{orderId}/PatchOrder
     
    {
      "properties": [
        { "key": "erpReference", "value": "ERP-12345" },
        { "key": "priority", "value": "high" }
      ],
      "keepExistingCustomProperties": true
    }

Parameter

Default

Description

`keepExistingCustomProperties`

`true`

`true`: merge with existing properties. `false`: replace all properties.

`keepExistingListItems`

`true`

`true`: merge list items (tags, external IDs). `false`: replace the list.

### [Removing Properties](#removing-properties)

Use `propertiesRemovalConditions` to remove specific properties before applying the patch:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/orders/{orderId}/PatchOrder
     
    {
      "propertiesRemovalConditions": [
        { "key": "obsoleteField" }
      ],
      "properties": [
        { "key": "newField", "value": "replacement" }
      ]
    }

### [Updating Order Lines](#updating-order-lines)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/orders/{orderId}/PatchUpdateOrderLines
     
    [
      {
        "lineItemId": "line_001",
        "quantity": 3,
        "properties": [
          { "key": "giftWrap", "value": "true" }
        ]
      }
    ]

### [Bulk Patching](#bulk-patching)

Update multiple resources in one request:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/products/PatchMany
     
    [
      { "id": "product-1_no", "description": "Updated description" },
      { "id": "product-2_no", "isActive": false }
    ]

Bulk endpoints handle up to **1000 items per request** and automatically skip items with no actual changes.

* * *


## [Error Handling](#error-handling)

### [HTTP Status Codes](#http-status-codes)

Code

Meaning

When It Happens

`200`

OK

Request succeeded

`201`

Created

Resource created successfully

`400`

Bad Request

Validation error, invalid parameters, or `take * page > 10000`

`401`

Unauthorized

Missing, expired, or invalid token

`404`

Not Found

Resource does not exist

`409`

Conflict

Resource already exists (e.g., creating an order with a duplicate ID)

`429`

Too Many Requests

Rate limit exceeded (see [Rate Limits](/docs/Environments/rate-limits))

`500`

Internal Server Error

Unexpected server error

### [Handling 401 Unauthorized](#handling-401-unauthorized)

If you receive a 401, your token has likely expired. Request a new token and retry:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    if (response.StatusCode == HttpStatusCode.Unauthorized)
    {
        await RefreshTokenAsync();
        response = await RetryRequestAsync(request);
    }

### [Handling 409 Conflict](#handling-409-conflict)

A 409 occurs when you try to create a resource with an ID that already exists. This commonly happens with `POST /api/orders` when the order ID is already taken. Use `PUT /api/orders` instead to let Omnium auto-generate the order number, or handle the conflict in your code.

### [Handling 429 Too Many Requests](#handling-429-too-many-requests)

When rate-limited, the response includes a `Retry-After` header indicating how many seconds to wait:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    HTTP/1.1 429 Too Many Requests
    Retry-After: 2

**Best practice:** Implement exponential backoff with jitter:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    if (response.StatusCode == (HttpStatusCode)429)
    {
        var retryAfter = response.Headers.RetryAfter?.Delta
            ?? TimeSpan.FromSeconds(2);
        await Task.Delay(retryAfter);
        // Retry the request
    }

* * *


## [Rate Limits](#rate-limits)

Rate limits protect the platform and ensure fair usage across tenants. See [Rate Limits](/docs/Environments/rate-limits) for the full policy details.

**Summary of default limits:**

Limit

Default

Concurrent requests per API user

20

Token bucket

12,000 tokens; refill 1,000 every 10 seconds

Tenant-wide concurrency

40 concurrent requests

Batch operations (`AddMany`, `UpdateMany`)

4 concurrent

High-traffic read endpoints (products, inventory)

150 concurrent

The token endpoint (`POST /api/token`) is excluded from all rate limits.

**Tips to stay within limits:**

*   Reuse your token (10-day validity) — don't request a new token per call
*   Use batch endpoints (`AddMany`, `PatchMany`, `UpdateMany`) instead of single-item calls
*   Use `disableFacets: true` on search calls you don't need facets for
*   Process batch operations sequentially rather than in parallel
*   For large data syncs, use Scroll endpoints with moderate `take` values

* * *


## [Bulk Operations](#bulk-operations)

For high-volume integrations, always prefer bulk endpoints over individual calls.

### [AddMany (Create)](#addmany-create)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products/AddMany
     
    [
      { "id": "prod-1_no", "productId": "prod-1", "name": "Product 1", ... },
      { "id": "prod-2_no", "productId": "prod-2", "name": "Product 2", ... }
    ]

### [UpdateMany (Full Replace)](#updatemany-full-replace)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/inventory/UpdateMany
     
    [
      { "sku": "SKU-001", "warehouseCode": "warehouse-1", "inventory": 50 },
      { "sku": "SKU-002", "warehouseCode": "warehouse-1", "inventory": 100 }
    ]

### [PatchMany (Partial Update)](#patchmany-partial-update)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/products/PatchMany
     
    [
      { "id": "prod-1_no", "isActive": false },
      { "id": "prod-2_no", "description": "New description" }
    ]

**Limits:**

*   Up to **1000 items** per batch request
*   Max **4 concurrent** batch operations (per API user)
*   Items with no actual changes are automatically skipped

* * *


## [Performance Best Practices](#performance-best-practices)

### [Search Optimization](#search-optimization)

1.  **Disable facets** when you don't need them — this is the single biggest performance improvement for search calls
2.  **Exclude unnecessary fields** on product search to reduce payload size:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "excludedFields": {
        "isVariantsExcluded": true,
        "isPropertiesExcluded": true,
        "isPricesExcluded": true
      }
    }

3.  **Use specific filters** rather than broad queries — filtered searches are faster than free-text search
4.  **Use Scroll** for datasets beyond 10,000 items instead of deep pagination

### [Integration Patterns](#integration-patterns)

1.  **Delta sync**: Use `modifiedFrom` / `modifiedTo` filters to only fetch changed records since your last sync. See [Delta Queries](/docs/Integrations/delta) for details.
2.  **Batch writes**: Always prefer `AddMany` / `PatchMany` / `UpdateMany` over single-item operations
3.  **Respect rate limits**: Process batch operations sequentially, not in parallel
4.  **Cache your token**: Reuse the JWT token for its full 10-day lifetime

### [Payload Size](#payload-size)

*   Keep bulk request payloads under 1000 items
*   For very large product catalogs, split into batches and process sequentially
*   Use PATCH instead of PUT when you only need to update a few fields

* * *


## [Webhooks](#webhooks)

Omnium can send HTTP notifications to your systems when events occur (e.g., order status changes, shipment updates). Webhooks are configured per tenant via the Omnium GUI.

### [Configuration](#configuration)

Webhooks are set up under **Configuration > Workflow Steps** in the Omnium GUI. Each workflow step can be configured to call an external URL when triggered.

### [Webhook Request Format](#webhook-request-format)

When a webhook fires, Omnium sends an HTTP request (POST or GET, as configured) to your endpoint with the relevant entity data in the request body.

**Your endpoint should:**

*   Return a `2xx` status code to acknowledge receipt
*   Respond within a reasonable timeout
*   Be idempotent (the same webhook may be delivered more than once)

See [Data Out](/docs/Integrations/data-out) and [Events](/docs/Integrations/events) for more on integration patterns.

* * *


## [Quick Reference](#quick-reference)

### [Your First API Call in 60 Seconds](#your-first-api-call-in-60-seconds)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    # 1. Get a token
    TOKEN=$(curl -s -X POST \
      "https://apitest.omnium.no/api/token?clientId=YOUR_ID&clientSecret=YOUR_SECRET")
     
    # 2. Search for orders
    curl -X POST \
      -H "Authorization: Bearer $TOKEN" \
      -H "Content-Type: application/json" \
      -d '{"take": 5, "page": 0, "sortOrder": "CreatedDescending"}' \
      https://apitest.omnium.no/api/orders/Search

### [Common Endpoints](#common-endpoints)

Action

Method

Endpoint

Get token

POST

`/api/token`

Search orders

POST

`/api/orders/Search`

Get order

GET

`/api/orders/{id}`

Create order

POST

`/api/orders`

Update order

PATCH

`/api/orders/{id}/PatchOrder`

Search products

POST

`/api/products/SearchProducts`

Get product

GET

`/api/products/{id}`

Update inventory

PUT

`/api/inventory/UpdateMany`

Search customers

POST

`/api/customers/Search`

Create cart

POST

`/api/Cart/AddItemToCart?skuId={sku}&quantity=1&marketId={market}`

Checkout

POST

`/api/Cart/CreateOrderFromCart/{cartId}`

* * *


## [Next Steps](#next-steps)

*   **[Omnichannel E-Commerce Tutorial](/docs/GettingStartedWithAPI/Tutorials/omnichannel-ecom)** — Build a complete checkout flow step by step
*   **[User Guides by Role](/docs/GettingStartedWithAPI/user-guides)** — Find the right endpoints for your integration type
*   **[Integration Patterns](/docs/Integrations/connectors)** — Learn about connectors, delta sync, scrolling, and event-driven architectures
*   **[Rate Limits](/docs/Environments/rate-limits)** — Detailed rate limiting policies
*   **[Swagger Documentation](https://api.omnium.no/documentation)** — Full interactive API reference

[

Previous

Get Access

](/docs/GettingStartedWithAPI/introtoapi)[

Next

Quick Guides

](/docs/GettingStartedWithAPI/user-guides)

---


## Get Access

[Getting Started](/docs/GettingStartedWithAPI)

# Get Access

Request access and set up your account for Omnium API integration.


## [Getting Started with Omnium API](#getting-started-with-omnium-api)

Welcome to the Omnium API! This guide will walk you through the steps to integrate Omnium into your system quickly and effectively.


## [Request access to Omnium](#request-access-to-omnium)

To begin using Omnium, follow these steps:

1.  **Request access**  
    If you're a developer and need access to the API, reach out to a colleague with admin rights to add you to the system. Alternatively, you can send an email to [info@omnium.no](mailto:info@omnium.no) requesting access.
    
2.  **Receive login details**  
    You will receive an email with login credentials for the Omnium GUI and relevant environments.
    

After logging in, you'll be able to generate API tokens for integration.


## [Omnium Environments](#omnium-environments)

Omnium offers different environments for testing, demo, and production use:

**Environment**

**URL**

**Purpose**

**Test**

[https://test.omnium.no](https://test.omnium.no)

Use this for testing configurations or new features.

**Demo**

[https://demo.omnium.no](https://demo.omnium.no)

Explore Omnium in a demo environment.

**Production**

[https://oms.omnium.no](https://oms.omnium.no)

The live system for real-world operations.

### [Swagger API Documentation](#swagger-api-documentation)

Access detailed API documentation for each environment:

**Environment**

**Swagger/API URL**

**Test**

[https://apitest.omnium.no](https://apitest.omnium.no)

**Production**

[https://api.omnium.no](https://api.omnium.no)


## [Setting Up API Integration](#setting-up-api-integration)

Integrating the Omnium API with your system is straightforward. Follow these steps:

### [API Overview](#api-overview)

You'll find all endpoints and models available in Omnium's Swagger documentation: [https://api.omnium.no](https://api.omnium.no)

### [Authentication](#authentication)

Authentication to Omnium's API is handled by JWTs (JSON Web Tokens) using the Bearer schema.

To create a token, use the token endpoint `POST /api/token`. The `ClientId` and `ClientSecret` can be obtained by creating an API user in the Omnium UI. The token is valid for 10 days, so there should be no need to frequently request new tokens.

Bearer authentication (also called token authentication) is an HTTP authentication scheme that involves security tokens called bearer tokens. The name “Bearer authentication” means “give access to the bearer of this token.” You must send this token in the `Authorization` header when making requests to Omnium's endpoints.

**Authorization header example:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Authorization: Bearer {token}

### [Generate API Credentials](#generate-api-credentials)

1.  **Log in to Omnium**: Navigate to `Configuration > Authorization > API Users` in the Omnium GUI.
2.  **Create an API user**: Select the three dots to the right and click "Create API user." Provide a user-friendly, descriptive name for your API user (e.g., `"Inventory Integration"`).
3.  **Save credentials**: Copy the generated `ClientId` and `ClientSecret`. These will only be shown once, so ensure you store them securely.

### [Example Code](#example-code)

Here’s an example of how to request a token and use it in your API calls:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    var client = new HttpClient { BaseAddress = new Uri("https://apitest.omnium.no") };
    var formContent = new FormUrlEncodedContent(new[]
    {
        new KeyValuePair<string, string>("grant_type", "client_credentials"),
        new KeyValuePair<string, string>("clientId", "YOUR_CLIENT_ID"),
        new KeyValuePair<string, string>("clientSecret", "YOUR_CLIENT_SECRET")
    });
    var response = await client.PostAsync("/api/token", formContent);
    var token = await response.Content.ReadAsStringAsync();
    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

### [Create a Client](#create-a-client)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    var client = _httpClientFactory.CreateClient();
    client.BaseAddress = new Uri("https://apitest.omnium.no");
    var formContent = new FormUrlEncodedContent(new[]
    {
        new KeyValuePair<string, string>("grant_type", "client_credentials"),
        new KeyValuePair<string, string>("clientId", "YOUR_CLIENT_ID"),
        new KeyValuePair<string, string>("clientSecret", "YOUR_CLIENT_SECRET")
    });
     
    // Get Token
    var response = await client.PostAsync("/api/Token", formContent);
    if (!response.IsSuccessStatusCode)
    {
        throw new Exception($"Get token failed! Status: {response.StatusCode}");
    }
    var token = await response.Content.ReadAsStringAsync();
     
    // How to check if token is valid
    var jwtHandler = new JwtSecurityTokenHandler();
    var jwtToken = jwtHandler.ReadJwtToken(token);
    DateTime validToUtc = jwtToken.ValidTo; // UTC date
     
    // Add token to authorization header
    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

* * *


## [Configuration](#configuration)

The configuration section in the UI serves as the command center for tailoring your platform to meet the unique needs of your business. Here, you have the power to configure essential elements such as languages, markets, orders, customers, and products. Beyond these foundational settings, delve into advanced features that empower you to fine-tune the platform to align seamlessly with your business requirements.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fconfig.192a42cc.png&w=3840&q=75)

* * *


## [Get a Demo Tenant](#get-a-demo-tenant)

If you'd like to integrate with Omnium and require a demo tenant, send an email to [info@omnium.no](mailto:info@omnium.no). Our team will create a demo tenant and invite you to get started.

[

Previous

Getting Started

](/docs/GettingStartedWithAPI)[

Next

API Developer Guide

](/docs/GettingStartedWithAPI/api-developer-guide)

---


## Preparing for integration

# Preparing for integration

Essential steps and considerations before integrating with the Omnium API.


## [Getting Started with Omnium API Integration](#getting-started-with-omnium-api-integration)

Before diving into integrating with the Omnium API, it’s essential to understand the various modules and factors that influence how the system operates for your business. This guide outlines key considerations and setup steps to help you achieve a successful integration.


## [Key Preparations for Your API Integration](#key-preparations-for-your-api-integration)

### [1\. Market and Stores](#1-market-and-stores)

**How many stores or sales locations do you have?**  
Understanding this helps you configure system access and correctly set up your stores.  
[Learn more about store setup](#).

### [2\. Access and User Permissions](#2-access-and-user-permissions)

**Who will have access to the system, and what permissions should they have?**  
Ensure employees have the appropriate permissions to manage access across different areas of the system.  
[Learn more about user permissions](#).

### [3\. Product and Package Setup](#3-product-and-package-setup)

**How should your products be structured in Omnium?**  
Will you use individual products or product bundles? Decide how to categorize your products and set up packages accordingly.  
[Learn more about product and package setup](#).

### [4\. Pricing Strategy](#4-pricing-strategy)

**How will pricing be structured?**  
Determine whether you’ll use fixed prices, discounts, or custom pricing for different customer segments.  
[Learn more about pricing structure](#).

### [5\. Inventory Management](#5-inventory-management)

**Do you need inventory management?**  
Decide whether Omnium’s inventory management system should be integrated to track stock and automate reordering processes.  
[Learn more about inventory management](#).

### [6\. Purchasing Workflow](#6-purchasing-workflow)

**What purchasing processes do you need?**  
Set up workflows to handle orders from suppliers and configure Omnium’s purchasing functionality to match your requirements.  
[Learn more about purchasing](#).

### [7\. Customer and Membership Programs](#7-customer-and-membership-programs)

**Will you use a customer club or membership system?**  
If so, decide on the benefits for your members and how Omnium will manage customer data.  
[Learn more about customer club and memberships](#).

### [8\. Project Management Setup](#8-project-management-setup)

**How will projects be managed within Omnium?**  
Define the structure and progress tracking for your projects in the system.  
[Learn more about project management](#).

### [9\. Order Workflow Configuration](#9-order-workflow-configuration)

**How should your order workflow be designed?**  
Omnium allows you to fully customize the order process. Be sure to define how your orders will flow.  
[See the detailed Order Workflow guide](#).

---


## Quick Guides

[Getting Started](/docs/GettingStartedWithAPI)

# Quick Guides

Find the documentation and API endpoints most relevant to your integration needs.


## [Welcome to Omnium](#welcome-to-omnium)

Different teams integrate with Omnium in different ways. Select your role below to find the most relevant documentation, key concepts, and API endpoints for your work.

[

E-commerce Frontend

Building webshops, mobile apps, or headless commerce



](#e-commerce-frontend-developers)[

PIM Integration

Syncing product data from PIM systems



](#pim-integrators)[

ERP Integration

Order sync, inventory, and financial systems



](#erp-integrators)[

WMS Integration

Warehouse management, fulfillment, and logistics



](#wms-integrators)[

Configuration & Admin

Tenants, users, markets, and system settings



](#configuration--admin)[

Payment Integration

Payment providers and checkout flows



](#payment-integrators)[

Shipping Integration

Shipping providers, delivery, and tracking



](#shipping-integrators)[

Business Analysts

Reporting, analytics, and data exports



](#business-analysts)

* * *


## [Common Resources](#common-resources)

Before diving into role-specific content, ensure you have:

*   **API Access**: [Get Access Guide](/docs/GettingStartedWithAPI/introtoapi) - Request credentials and understand authentication
*   **API Documentation**: [api.omnium.no](https://api.omnium.no) - Complete Swagger documentation
*   **Test Environment**: [apitest.omnium.no](https://apitest.omnium.no) - Sandbox for development

* * *
