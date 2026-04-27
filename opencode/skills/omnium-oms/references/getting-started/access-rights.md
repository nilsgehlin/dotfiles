# Getting Started — API Fundamentals — Access Rights

## Access Rights

# Access Rights

Easily export and import data in JSON or Excel format for smooth integration with business systems and streamlined data management.


## [Invitations](#invitations)

To get access to Omnium, an invitation is required. Contact your systems administrator or the [Omnium team](mailto:support@omnium.no). The account invitation process involves creating an invitation through the admin UI with specified access rights to stores, markets, and roles.

### [Create Invitation](#create-invitation)

Access rights define what the invited user can do within Omnium. This includes permissions related to stores, markets, and roles. For stores, it could involve access to specific retail outlets, online stores, or warehouses. Markets may refer to geographical regions, and roles determine the user's responsibilities and capabilities in the UI.

Once the admin configures access rights, stores, markets, and roles, the system generates an invitation based on these parameters. The user can now create an account by navigating to the correct UI environment (test/prod) that the invited user will use to create their account.

#### [User Account Creation](#user-account-creation)

When the invited user signs in for the first time, the system validates the access rights configured by the admin, ensuring the user has the appropriate permissions.

### [Access Rights Maintenance](#access-rights-maintenance)

After account creation, the user is onboarded into Omnium with the specified access rights. The invitation is now gone, and the access rights are transferred from the invitation to the newly created user object. This is managed under Configuration > Authorization > Users.

---


## Environments

# Environments

Understand Omnium's three environments — Dev, Test, and Production — along with rate limits and concurrency controls.

Omnium provides three environments for development, testing, and production use. Dev and Test share the same underlying data (except settings), while Production is fully isolated. Each environment follows a structured release cadence — changes flow from Dev to Test to Production on a weekly schedule.

Understanding environment differences, shared data boundaries, and rate limits is essential for building reliable integrations.

* * *


## [In this section](#in-this-section)

[

Test & Dev Environments

Environment URLs, shared data, release cadence, and settings copy



](/docs/Environments/test-dev)[

Rate Limits

Concurrency limits, token bucket system, and handling 429 responses



](/docs/Environments/rate-limits)[

Operations

Monitoring, data maintenance, performance tuning, and operational checklists



](/docs/Environments/operations)

[

Previous

Goods Reception

](/docs/PurchaseOrders/Deliveries/goods-reception)[

Next

Test & Dev

](/docs/Environments/test-dev)

---


## Operations

[Environments](/docs/Environments)

# Operations

How to monitor, maintain, and optimize your Omnium instance — event logs, scheduled tasks, data maintenance, environment management, and performance best practices.


## [Monitoring Your Instance](#monitoring-your-instance)

Omnium provides several tools for understanding what's happening in your tenant at any given time.

### [Event log](#event-log)

The event log is your primary window into system activity. Almost every operation in Omnium — whether triggered via API, the UI, a scheduled task, or an integration — creates an event. Events capture what happened, when, who triggered it, and the result.

Access the event log in the UI under **Configuration > Advanced > Events**.

Events include:

*   **Operation ID** — numeric code identifying the type of operation (e.g., 10001 = Order Created)
*   **Status and previous status** — the state change that occurred
*   **Origin** — which API endpoint, scheduled task, or integration triggered the event
*   **Error flag** — whether the operation failed
*   **Attachments** — additional data such as workflow results

Use the event log to:

*   Track order state changes and identify where processing stalled
*   Debug failed integration syncs (ERP, POS, e-commerce)
*   Audit user actions in the backoffice
*   Monitor webhook delivery success/failure

For the complete event structure and operation ID reference, see [Events](/docs/Integrations/events).

### [Scheduled task status](#scheduled-task-status)

Scheduled tasks run background jobs on a cron schedule. You can monitor their status in the UI under **Configuration > Advanced > Connectors > Scheduled Task**, which shows:

*   **Last successful run** — when the task last completed successfully
*   **Next occurrence** — when the task will run next (based on cron schedule)
*   **Running state** — whether the task is currently executing

If a task hasn't run when expected, check:

1.  Is it disabled? (`IsDisabled: true`)
2.  Is the cron schedule correct?
3.  Is it already running? (long-running tasks won't start a new instance)
4.  Are there errors in the event log for the task?

You can also manually trigger any scheduled task from the UI for testing or to force an immediate run.

For task configuration details, see [Scheduled Tasks](/docs/configuration/scheduled-tasks).

### [Event subscriptions](#event-subscriptions)

For automated monitoring, subscribe to events via webhooks, Azure Service Bus, Azure Storage Queues, or Apache Kafka. This lets you build alerts for specific conditions — for example, notify a Slack channel when an order export fails.

Event subscriptions are configured under **Configuration > Event subscriptions**. You can filter by:

*   Entity type (orders, products, customers, etc.)
*   Order type or status
*   Store or market
*   Error events only

For setup details, see [Events](/docs/Integrations/events).

* * *


## [Data Maintenance](#data-maintenance)

### [Event log cleanup](#event-log-cleanup)

Event logs accumulate over time. Configure the `DeleteEventLogScheduledTask` to automatically remove old events:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ImplementationType": "DeleteEventLogScheduledTask",
      "Schedule": "0 3 * * 0",
      "Properties": [
        { "Key": "EventLogPreservationDays", "Value": "90" },
        { "Key": "EventLogOrderPreservationDays", "Value": "365" }
      ]
    }

Order events can be preserved longer than general events since they're often needed for auditing.

### [Expired price cleanup](#expired-price-cleanup)

Prices with past expiration dates should be cleaned up to keep product documents lean:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ImplementationType": "DeleteExpiredPricesScheduledTask",
      "Schedule": "0 4 * * *"
    }

### [Abandoned cart cleanup](#abandoned-cart-cleanup)

Carts that were never completed should be periodically removed:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ImplementationType": "DeleteAbandonedCartScheduledTask",
      "Schedule": "0 3 * * *"
    }

### [Historical opening hours](#historical-opening-hours)

Special opening hours (holidays, temporary changes) accumulate on store documents. Configure cleanup via `DeleteAdditionalOpeningHoursThreshold` in [Store configuration](/docs/Stores/store-config#historical-opening-hours-cleanup).

* * *


## [Environment Management](#environment-management)

Omnium provides three environments:

Environment

URL

Updated

Purpose

**Production**

omnium.no / api.omnium.no

Tuesdays

Live environment

**Test**

test.omnium.no / apitest.omnium.no

Tuesdays (after production)

Release validation

**Dev**

dev.omnium.no / apidev.omnium.no

Continuously

Early feature testing

Key operational notes:

*   **Dev and Test share data** (except settings) — only run scheduled tasks in one environment
*   **Settings can be copied** between environments, but scheduled tasks are automatically disabled in the target to prevent unintended execution
*   **Test mirrors the next release** — use it to validate upcoming changes before they go live
*   **Settings copy is only available in Dev and Test** — not production, for safety

For details, see [Test & Dev Environments](/docs/Environments/test-dev).

* * *


## [Performance Considerations](#performance-considerations)

### [API integration performance](#api-integration-performance)

*   **Use batch endpoints** where available (`AddMany`, `UpdateMany`) instead of individual calls
*   **Respect concurrency limits** — 20 concurrent requests per API user is the default
*   **Use delta queries** for synchronization instead of full data pulls. See [Data Out](/docs/Integrations/data-out)
*   **Implement exponential backoff** for 429 responses — don't retry immediately
*   **Batch operations are limited to 4 concurrent** — process them sequentially for best results

### [Product document size](#product-document-size)

Large product documents slow down search and indexing. Watch for:

*   **Too many prices** — if a product has 150+ prices, consider using separate price storage
*   **Too many store assignments** — with hundreds of stores, the `inStoreIds` array grows large
*   **Large custom properties** — avoid storing large text blobs in product properties
*   **Historical data** — clean up expired prices and old inventory snapshots

### [Scheduled task performance](#scheduled-task-performance)

*   **Stagger heavy tasks** — don't schedule multiple resource-intensive tasks at the same time
*   **Delta tasks** are preferred over full tasks for ongoing sync (much faster)
*   **Monitor duration trends** — if a task takes increasingly longer, it may indicate growing data that needs attention
*   **Off-peak scheduling** — run full tasks during off-peak hours (typically 2-5 AM)

* * *


## [Operational Checklist](#operational-checklist)

Use this checklist when setting up or reviewing an Omnium tenant:

### [Before go-live](#before-go-live)

*    API credentials created with appropriate roles and store/market access
*    Scheduled tasks configured and tested in the Test environment
*    Event subscriptions set up for critical integrations (ERP, WMS)
*    Rate limits reviewed — request custom limits if needed for high-volume scenarios
*    Cleanup tasks configured (event logs, expired prices, abandoned carts)
*    Integration connectors tested end-to-end (payment, shipping, ERP)
*    Webhook endpoints verified and monitoring alerts configured

### [Ongoing monitoring](#ongoing-monitoring)

*    Event log reviewed regularly for error events
*    Scheduled task execution status checked weekly
*    Integration sync health validated (orders, inventory, products)
*    Rate limit headroom confirmed for peak traffic periods

### [Periodic maintenance](#periodic-maintenance)

*    Event log retention configured appropriately
*    Expired price cleanup running
*    Abandoned cart cleanup running
*    Historical opening hours cleanup running (if applicable)
*    API credentials rotated per your security policy

* * *


## [Related Documentation](#related-documentation)

Topic

Link

Event structure and operation IDs

[Events](/docs/Integrations/events)

Scheduled task configuration

[Scheduled Tasks](/docs/configuration/scheduled-tasks)

Rate limits and throttling

[Rate Limits](/docs/Environments/rate-limits)

Dev and Test environments

[Test & Dev](/docs/Environments/test-dev)

Data synchronization patterns

[Data Out](/docs/Integrations/data-out)

Store data maintenance

[Store Configuration](/docs/Stores/store-config)

Troubleshooting common issues

[Troubleshooting](/docs/Integrations/troubleshooting)

[

Previous

Rate Limits

](/docs/Environments/rate-limits)[

Next

Configuration

](/docs/configuration)

---


## Rate Limits

[Environments](/docs/Environments)

# Rate Limits

Omnium uses concurrency limits and a token bucket system to keep the API stable and predictable for everyone. It’s for your own protection!


## [Default Rate Limits](#default-rate-limits)

Unless otherwise agreed, the following limits apply to most tenants:

Limit type

Default value

Concurrent requests (general)

20 concurrent requests

Token bucket

Capacity 12 000 tokens; refill 1 000 tokens every 10 seconds

Batch update operations (such as POST api/Orders/UpdateMany)

Max 4 concurrent operations (recommendation: process synchronously)

High traffic endpoints (product & inventory read operations)

Up to 150 concurrent requests

Rate limits are applied **per API user** (API key). In addition, there’s a **tenant-wide concurrency limit of 40** to protect shared resources.

⚠️ **Disclaimer:** These limits are current defaults and may change over time as we tune capacity and protect platform stability. Please also use good judgment - avoid spamming the API and help keep the platform healt️hy for everyone✌️

**💡 Concurrency vs. Requests per Second**

**Concurrency** = how many requests are being processed at the same time.  
Example: if each request takes 20–80 ms and you have a **20-concurrent limit**, you can usually process about **250–1000 requests per second** (because requests finish and free up slots quickly).


## [Endpoint Exceptions](#endpoint-exceptions)

High traffic endpoints read operations are explicitly excluded from the 20-concurrent limit and support a much higher concurrent requests limit. These endpoints are designed to be far more forgiving.


## [Dedicated vs. Multi-Tenant Environments](#dedicated-vs-multi-tenant-environments)

**Dedicated environments**  
Customers on a dedicated environment can have rate limits disabled or tailored to their needs.

**Multi-tenant environments**  
Default limits apply. In very rare cases, we may temporarily adjust rate limits for a specific tenant to protect overall multi-tenant platform stability.


## [Handling 429 Responses](#handling-429-responses)

If you receive HTTP 429 Too Many Requests:

*   Back off and retry with exponential backoff and jitter.
*   Consider lowering parallelism.


## [Customization](#customization)

Enterprise customers can request custom rate limit configurations. Contact us to discuss throughput, concurrency, or dedicated capacity.

[

Previous

Test & Dev

](/docs/Environments/test-dev)[

Next

Operations

](/docs/Environments/operations)

---


## Test & Dev

[Environments](/docs/Environments)

# Test & Dev

We provide separate environments for development and testing. These let you test new features early and validate upcoming releases before they go live in production.

**Heads up**: Our new Dev environment is fresh out of the oven 🍞  
It may still have a few quirks - let us know if you spot anything.

Below are frequently asked questions about our Dev and Test environments.


## [What is the purpose of the Dev and Test environments?](#what-is-the-purpose-of-the-dev-and-test-environments)

**Dev** (dev.omnium.no / apidev.omnium.no) is continuously updated with the latest changes from our developers.

**Test** (test.omnium.no / apitest.omnium.no) reflects the upcoming release to production and is therefore a stable environment for release validation.


## [Why do we provide both environments?](#why-do-we-provide-both-environments)

*   To let you test new functionality as soon as it is implemented.
*   To ensure that you have a stable environment that mirrors the next production release.


## [How often are they updated?](#how-often-are-they-updated)

*   **Dev** is updated continuously.
*   **Test** is updated each Tuesday, after the latest release has been deployed to production.


## [Where can I see what is currently in Test?](#where-can-i-see-what-is-currently-in-test)

The Test environment always contains the **Upcoming Release** documented in our [release notes](/docs/Releasenotes).

**Example:** If the release notes show Upcoming Release: 31, that is what runs in Test. When it goes live in production the following Tuesday, Release 32 will then be promoted to Test.


## [Do Dev and Test share the same data?](#do-dev-and-test-share-the-same-data)

Yes, for simplicity both environments share the same data (including API users), **except for settings**.


## [Tips for using Dev and Test environments](#tips-for-using-dev-and-test-environments)

*   Since Dev and Test share the same data, we recommend that scheduled tasks only run in one of the environments to avoid duplicate processing.
    
*   You may copy settings from one environment to another. This will override ALL settings (but scheduled tasks will be automatically set to disabled), so use with care. For safety reasons, this option is only available in dev and test - not in production.
    

![Copy tenant settings](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fcopy_tenant_settings.bf4afbbf.png&w=3840&q=75)

[

Previous

Environments

](/docs/Environments)[

Next

Rate Limits

](/docs/Environments/rate-limits)

---


## Getting Started

# Getting Started

Everything you need to start integrating with Omnium — access setup, authentication, API patterns, and hands-on tutorials.

Whether you're connecting an e-commerce frontend, syncing with an ERP, or building a custom integration, this section gets you from zero to your first successful API call — and beyond.

Start by requesting access, then learn the API fundamentals. When you're ready, pick a tutorial that matches your use case and follow along step by step.

* * *


## [In this section](#in-this-section)

[

Get Access

Request access, obtain API credentials, and set up your account



](/docs/GettingStartedWithAPI/introtoapi)[

API Developer Guide

Authentication, searching, updating, error handling, and best practices



](/docs/GettingStartedWithAPI/api-developer-guide)[

Quick Guides

Find the endpoints and documentation most relevant to your integration role



](/docs/GettingStartedWithAPI/user-guides)[

Tutorials

End-to-end walkthroughs for e-commerce setup, ERP integration, and more



](/docs/GettingStartedWithAPI/Tutorials)

[

Previous

Introduction

](/docs)[

Next

Get Access

](/docs/GettingStartedWithAPI/introtoapi)

---


## API Developer Guide

[Getting Started](/docs/GettingStartedWithAPI)

# API Developer Guide

Complete guide to integrating with the Omnium API — authentication, searching, updating, error handling, and best practices.


## [Overview](#overview)

The Omnium API is a RESTful JSON API that gives you full access to your order management system. This guide covers everything you need to build a robust integration: authentication, common patterns, error handling, and performance optimization.

**Base URLs:**

Environment

API Base URL

Swagger Documentation

**Test**

`https://apitest.omnium.no`

[https://apitest.omnium.no/documentation](https://apitest.omnium.no/documentation)

**Production**

`https://api.omnium.no`

[https://api.omnium.no/documentation](https://api.omnium.no/documentation)

The Swagger documentation is also available segmented by domain:

Segment

URL

Orders

`/documentation/orders`

Products

`/documentation/products`

Carts

`/documentation/carts`

Customers

`/documentation/customers`

Projects

`/documentation/projects`

* * *


## [Authentication](#authentication)

Omnium uses JWT Bearer tokens for authentication. You obtain a token by calling the token endpoint with your API credentials, then include it in the `Authorization` header of all subsequent requests.

### [Step 1: Create API Credentials](#step-1-create-api-credentials)

1.  Log in to the Omnium GUI
2.  Navigate to **Configuration > Authorization > API Users**
3.  Click the three-dot menu and select **"Create API user"**
4.  Give the user a descriptive name (e.g., `"ERP Sync"` or `"E-Commerce Frontend"`)
5.  Copy the generated `ClientId` and `ClientSecret`

The `ClientSecret` is only shown once when the API user is created. Store it securely — if lost, you'll need to create a new API user.

### [Step 2: Request a Token](#step-2-request-a-token)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/token?clientId=YOUR_CLIENT_ID&clientSecret=YOUR_CLIENT_SECRET

**Plain text response (default):** The response body contains the JWT token as a plain string.

**JSON response (recommended):** Add `returnAsJson=true` to get a structured response:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/token?clientId=YOUR_CLIENT_ID&clientSecret=YOUR_CLIENT_SECRET&returnAsJson=true

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "tokenType": "Bearer",
      "expiresIn": 864000
    }

Field

Description

`accessToken`

The JWT token to use in the `Authorization` header

`tokenType`

Always `"Bearer"`

`expiresIn`

Token lifetime in seconds (864000 = 10 days)

### [Step 3: Use the Token](#step-3-use-the-token)

Include the token in the `Authorization` header of every API request:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/orders/ORD-001
    Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
    Content-Type: application/json

### [Token Lifetime and Renewal](#token-lifetime-and-renewal)

Tokens are valid for **10 days**. You do not need to request a new token for every call — reuse the token until it expires.

To check when a token expires, decode the JWT and read the `exp` claim, or track the `expiresIn` value from the JSON response.

**C# example — token management:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    var client = _httpClientFactory.CreateClient();
    client.BaseAddress = new Uri("https://apitest.omnium.no");
     
    // Request token
    var response = await client.PostAsync(
        "/api/token?clientId=YOUR_CLIENT_ID&clientSecret=YOUR_CLIENT_SECRET&returnAsJson=true",
        null);
     
    if (!response.IsSuccessStatusCode)
        throw new Exception($"Authentication failed: {response.StatusCode}");
     
    var tokenResponse = await response.Content.ReadFromJsonAsync<TokenResponse>();
     
    // Add token to all subsequent requests
    client.DefaultRequestHeaders.Authorization =
        new AuthenticationHeaderValue("Bearer", tokenResponse.AccessToken);
     
    // Check expiry
    var handler = new JwtSecurityTokenHandler();
    var jwt = handler.ReadJwtToken(tokenResponse.AccessToken);
    DateTime expiresUtc = jwt.ValidTo;

**cURL example:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    # Get token
    TOKEN=$(curl -s -X POST \
      "https://apitest.omnium.no/api/token?clientId=YOUR_ID&clientSecret=YOUR_SECRET")
     
    # Use token
    curl -H "Authorization: Bearer $TOKEN" \
      https://apitest.omnium.no/api/orders/ORD-001

* * *


## [Roles and Permissions](#roles-and-permissions)

Each API user is assigned one or more roles that control which endpoints they can access. Roles follow a hierarchy — higher roles automatically include the permissions of lower roles.

### [Role Hierarchy](#role-hierarchy)

Role

Description

**ApiOwner**

Full access to all API endpoints. Equivalent to `Admin`.

**CommerceUser**

Access to headless commerce endpoints (carts, products, customers).

**ApiUser**

Base API access. Required for authentication but doesn't grant access to specific resource endpoints.

### [Resource-Specific Roles](#resource-specific-roles)

Each resource domain has a **Read** and **Admin** role. Read grants GET/Search access; Admin grants full CRUD:

Resource

Read Role

Admin Role

Orders

`OrderRead`

`OrderAdmin`

Products

`ProductRead`

`ProductAdmin`

Customers

`CustomerRead`

`CustomerAdmin`

Carts

`CartRead`

`CartAdmin`

Inventory

`InventoryRead`

`InventoryAdmin`

Promotions

`PromotionRead`

`PromotionAdmin`

Stores

`StoreRead`

`StoreAdmin`

Projects

`ProjectRead`

`ProjectAdmin`

Suppliers

`SupplierRead`

`SupplierAdmin`

Purchase Orders

`PurchaseOrderRead`

`PurchaseOrderAdmin`

Settings

`SettingsRead`

`SettingsAdmin`

Users

`UserRead`

`UserAdmin`

**Best practice:** Follow the principle of least privilege. An e-commerce frontend only needs `CartAdmin` + `ProductRead` + `CustomerAdmin`. An ERP sync might need `OrderRead` + `ProductAdmin` + `InventoryAdmin`.

### [Store and Market Scoping](#store-and-market-scoping)

API users can be scoped to specific stores or markets using the roles `AllStores` and `AllMarkets`, or by assigning store/market-specific roles (e.g., `store-oslo-downtown`, `market-nor`).

* * *


## [REST Patterns](#rest-patterns)

The API follows consistent REST conventions across all resources.

### [HTTP Methods](#http-methods)

Method

Usage

Example

`GET`

Retrieve a single resource

`GET /api/orders/{id}`

`POST`

Create a resource, or execute a search/action

`POST /api/orders`

`PUT`

Create with auto-generated ID, or bulk create

`PUT /api/orders`

`PATCH`

Partial update (only supplied fields are changed)

`PATCH /api/orders/{id}/PatchOrder`

`DELETE`

Remove a resource

`DELETE /api/orders/{id}`

### [Common Endpoint Patterns](#common-endpoint-patterns)

Every major resource (orders, products, customers, carts) follows this pattern:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET    /api/{resource}/{id}           → Get by ID
    POST   /api/{resource}                → Create (explicit ID required)
    PUT    /api/{resource}                → Create (auto-generated ID)
    POST   /api/{resource}/Search         → Search with filters
    POST   /api/{resource}/Scroll         → Cursor-based search for large datasets
    PATCH  /api/{resource}/{id}/Patch...  → Partial update
    DELETE /api/{resource}/{id}           → Delete
    POST   /api/{resource}/AddMany        → Bulk create
    PATCH  /api/{resource}/PatchMany      → Bulk partial update
    PUT    /api/{resource}/UpdateMany     → Bulk full update

### [Content Type](#content-type)

All request and response bodies use JSON:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Content-Type: application/json

* * *
