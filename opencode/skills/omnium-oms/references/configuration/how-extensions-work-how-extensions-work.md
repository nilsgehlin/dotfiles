# Configuration & Operations — [How Extensions Work](#how-extensions-work)

## [How Extensions Work](#how-extensions-work)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

      CONFIGURATION                    RUNTIME
    
      Admin configures                 Omnium UI renders
      extension in       ──────────▶   extension in the
      Tenant Settings                  assigned area
                                           │
                                  ┌────────┴────────┐
                                  ▼                 ▼
                            Iframe loads      Button click
                            with context      sends webhook
                            data (URL         with event
                            templates)        data

1.  An admin creates an extension in **Tenant Settings > GUI Settings**
2.  The extension is assigned to an **extension area** (e.g., the order sidebar, product edit page, or a context menu)
3.  At runtime, Omnium renders the extension in that area and passes **context data** (the current order, product, customer, etc.)
4.  If the extension has an **iframe URL**, it loads the external page with context values injected into the URL
5.  If the extension has a **webhook URL**, clicking the button sends the context data to the external endpoint

* * *


## [Extension Areas](#extension-areas)

Each extension is assigned to an area that determines where it appears in the UI and how it's displayed. Areas are grouped by the page or feature they belong to.

### [Orders](#orders)

Area

Display type

Description

`orders`

Inline

Order list page

`orderInfo`

Inline

Order detail — info section

`EditOrderInline`

Inline

Order edit — inline panels

`editorderSidebarLeft`

Sidebar

Order edit — left sidebar

`orderEditManage`

Context menu

Order edit — manage/action menu

`orderEditCustomer`

Inline

Order edit — customer section

`orderEditExport`

Inline

Order edit — export section

`orderLine`

Context menu

Order line — right-click actions

`orderContextMenu`

Context menu

Order list — right-click actions

`ordersEditPickList`

Inline

Pick list edit page

`pickListContextMenu`

Context menu

Pick list — right-click actions

`ordersPromotionInline`

Inline

Order promotion section

### [Carts](#carts)

Area

Display type

Description

`carts`

Inline

Cart list page

`cart`

Inline

Cart detail page

`cartInline`

Inline

Cart edit — inline panels

`cartManage`

Context menu

Cart — manage/action menu

`cartSidebar`

Sidebar

Cart — sidebar

### [Products](#products)

Area

Display type

Description

`products`

Inline

Product list page

`productEdit`

Inline

Product edit page

`productInline`

Inline

Product edit — inline panels

`editProductSidebar`

Sidebar

Product edit — sidebar

### [Customers](#customers)

Area

Display type

Description

`privateCustomers`

Inline

Private customer list

`privateCustomerEdit`

Inline

Private customer edit page

`privateCustomerContact`

Inline

Private customer — contact section

`viewPrivateCustomerSidebarLeft`

Sidebar

Private customer — left sidebar

`businessCustomers`

Inline

Business customer list

`businessCustomerEdit`

Inline

Business customer edit page

`businessCustomerContact`

Inline

Business customer — contact section

`businessCustomersButtonRow`

Button row

Business customer list — action buttons

### [Stores](#stores)

Area

Display type

Description

`stores`

Inline

Store list page

`storeEdit`

Inline

Store edit page

`storeInformationInline`

Inline

Store edit — info section

`storeTab`

Tab

Store edit — additional tab

### [Purchase Orders](#purchase-orders)

Area

Display type

Description

`editPurchaseOrderDetailsInline`

Inline

Purchase order detail — inline

`PurchaseOrderManage`

Context menu

Purchase order — manage menu

`editPurchaseOrderSidebarLeft`

Sidebar

Purchase order — left sidebar

`PurchaseOrderContextMenu`

Context menu

Purchase order list — right-click

`ProcessGoodsModal`

Inside modal

Goods reception modal

`AfterProcessGoodsModal`

Inside modal

After goods reception

### [Deliveries](#deliveries)

Area

Display type

Description

`DeliveriesInline`

Inline

Delivery view — inline panels

`DeliveriesManageContextMenu`

Context menu

Delivery — manage menu

### [Other](#other)

Area

Display type

Description

`settings`

Inline

Settings page

* * *


## [Extension Model](#extension-model)

Each extension is a JSON object in `TenantSettings.GuiSettings.GuiExtensions`:

Property

Type

Description

**Name**

string

Internal name (or translation key via `NameTranslateKey`)

**GuiExtensionArea**

string

Which area to display in (see [Extension Areas](#extension-areas))

Header

string

Title shown above the extension (or `HeaderTranslateKey`)

Description

string

Text displayed in the extension panel (or `DescriptionTranslateKey`)

ButtonText

string

Label for the action button (or `ButtonTextTranslateKey`)

IconCssClass

string

CSS class for the extension icon

IframeUrl

string

URL to load in an iframe (supports [URL templates](#url-templates))

WebhookUrl

string

URL to call when the button is clicked

WebhookHttpVerb

string

HTTP method for webhook (`POST` or `GET`)

WebhookRequestHeaders

List

Custom headers sent with webhook requests

Properties

List

Custom key-value properties displayed in the panel

Tags

List

Tags for [conditional display](#tag-based-filtering)

### [Minimal example](#minimal-example)

An extension that embeds an external dashboard on the order edit page:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Order Dashboard",
      "GuiExtensionArea": "EditOrderInline",
      "Header": "External Dashboard",
      "IframeUrl": "https://dashboard.example.com/order?id={{dataObject.orderId}}"
    }

### [Full example](#full-example)

An extension with both an iframe and a webhook action:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Fraud Check",
      "GuiExtensionArea": "editorderSidebarLeft",
      "Header": "Fraud Analysis",
      "Description": "Review fraud risk score for this order",
      "ButtonText": "Run Fraud Check",
      "IconCssClass": "fa fa-shield",
      "IframeUrl": "https://fraud.example.com/check?order={{dataObject.orderId}}&market={{dataObject.marketId}}",
      "WebhookUrl": "https://api.example.com/webhooks/fraud-check",
      "WebhookHttpVerb": "POST",
      "WebhookRequestHeaders": [
        { "Key": "Authorization", "Value": "Bearer your-api-key" },
        { "Key": "X-Source", "Value": "omnium" }
      ],
      "Tags": ["requires-review"]
    }

* * *


## [Iframe Extensions](#iframe-extensions)

When an extension has an `IframeUrl`, Omnium renders an iframe in the designated area. The iframe receives context data in two ways:

### [URL templates](#url-templates)

The `IframeUrl` supports dynamic placeholders that are replaced with actual values at render time. Placeholders use double curly braces:

Placeholder

Resolves to

`{{dataObject.*}}`

Any property on the current object (order, product, customer, etc.)

`{{user.email}}`

Current logged-in user's email

`{{user.firstName}}`

Current user's first name

`{{user.lastName}}`

Current user's last name

`{{language}}`

Current UI language code

`{{selectedStoreIds}}`

Comma-separated list of currently selected store IDs

**Example URLs:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    https://app.example.com/order/{{dataObject.orderId}}
    https://erp.example.com/customer?id={{dataObject.customerId}}&lang={{language}}
    https://dashboard.example.com/?stores={{selectedStoreIds}}&user={{user.email}}

### [postMessage API](#postmessage-api)

After the iframe loads, Omnium also sends the full context data to the iframe via the browser's `postMessage` API. Your iframe application can listen for this message to receive the complete object data:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    window.addEventListener('message', function(event) {
      // Verify origin for security
      if (event.origin !== 'https://your-omnium-instance.omnium.no') return;
     
      const data = event.data;
      // data contains the full context object (order, product, etc.)
      console.log('Received from Omnium:', data);
    });

Omnium sends the postMessage twice — once immediately when the iframe loads, and again after a short delay. This ensures your application receives the data even if it initializes slowly.

* * *


## [Webhook Extensions](#webhook-extensions)

When an extension has a `WebhookUrl` and `ButtonText`, Omnium displays an action button. Clicking the button sends the current context data to the webhook URL.

### [Request format](#request-format)

The webhook receives a JSON payload containing the extension configuration and the event data:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "guiExtension": {
        "name": "Fraud Check",
        "guiExtensionArea": "editorderSidebarLeft",
        "webhookUrl": "https://api.example.com/webhooks/fraud-check"
      },
      "eventData": {
        "objectId": "ORD-12345",
        "className": "Order",
        "dataObject": { /* full order object */ }
      }
    }

Custom headers configured in `WebhookRequestHeaders` are included in the request, allowing you to pass API keys or other authentication tokens.

### [Response format](#response-format)

Your webhook endpoint can return a validation result that Omnium displays to the user:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "isValid": true,
      "validationMessages": ["Fraud check passed — low risk score"],
      "validationWarnings": ["Customer is from a new region"]
    }

Field

Type

Effect

`isValid`

bool

Whether the operation succeeded

`validationMessages`

string\[\]

Informational messages shown to the user

`validationWarnings`

string\[\]

Warning messages shown to the user

### [Retry policy](#retry-policy)

Webhook requests are retried automatically on failure, with increasing delays between attempts (1, 5, and 15 seconds).

### [Event logging](#event-logging)

Every webhook trigger is logged in the Omnium event system with operation ID `200001` (GuiExtensionTriggered). You can subscribe to this event via the standard [Events system](/docs/Integrations/events) for monitoring or auditing.

* * *


## [Tag-Based Filtering](#tag-based-filtering)

Extensions can be conditionally displayed based on tags. When an extension has `Tags` configured, it only appears if the current context object's tags include **all** of the extension's tags.

This lets you show different extensions for different types of objects. For example:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "Name": "B2B Credit Check",
        "GuiExtensionArea": "orderInfo",
        "Tags": ["B2B"],
        "IframeUrl": "https://credit.example.com/check?order={{dataObject.orderId}}"
      },
      {
        "Name": "Gift Wrapping Options",
        "GuiExtensionArea": "orderInfo",
        "Tags": ["gift-order"],
        "IframeUrl": "https://gifts.example.com/wrap?order={{dataObject.orderId}}"
      }
    ]

The "B2B Credit Check" extension only appears on orders tagged with "B2B". The "Gift Wrapping Options" extension only appears on orders tagged with "gift-order".

* * *


## [Custom Properties](#custom-properties)

Extensions can include custom key-value properties that are displayed in the extension panel. These are useful for showing static configuration or reference information:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Support Info",
      "GuiExtensionArea": "orderInfo",
      "Header": "Support Details",
      "Properties": [
        { "Key": "SLA", "Value": "24 hours" },
        { "Key": "Escalation Email", "Value": "escalation@company.com" },
        { "Key": "Documentation", "Value": "https://wiki.company.com/support" }
      ]
    }

* * *


## [Help Menu Items](#help-menu-items)

In addition to page-level extensions, you can add custom items to the help menu in the Omnium UI. Help menu items are configured in `TenantSettings.GuiSettings.GuiHelpMenuItems`:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "GuiHelpMenuItems": [
        {
          "Name": "Company Wiki",
          "Url": "https://wiki.company.com/omnium",
          "Routes": ["orders", "products"]
        },
        {
          "Name": "Training Videos",
          "Url": "https://training.company.com",
          "Routes": []
        }
      ]
    }

When `Routes` is empty, the help item appears on all pages. When specific routes are listed, it only appears on matching pages.

* * *


## [Common Patterns](#common-patterns)

### [External dashboard on order page](#external-dashboard-on-order-page)

Embed an analytics dashboard that shows order-specific insights:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Order Analytics",
      "GuiExtensionArea": "editorderSidebarLeft",
      "Header": "Analytics",
      "IframeUrl": "https://analytics.example.com/order/{{dataObject.orderId}}?lang={{language}}"
    }

### [ERP sync button](#erp-sync-button)

Add a button that triggers an order sync to your ERP system:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Sync to ERP",
      "GuiExtensionArea": "orderEditManage",
      "ButtonText": "Send to ERP",
      "IconCssClass": "fa fa-sync",
      "WebhookUrl": "https://erp-integration.example.com/sync",
      "WebhookHttpVerb": "POST",
      "WebhookRequestHeaders": [
        { "Key": "Authorization", "Value": "Bearer erp-api-key" }
      ]
    }

### [Store-specific information panel](#store-specific-information-panel)

Show store-specific tools on the store edit page:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "Store Performance",
      "GuiExtensionArea": "storeTab",
      "Header": "Performance Dashboard",
      "IframeUrl": "https://dashboard.example.com/store/{{dataObject.id}}?stores={{selectedStoreIds}}"
    }

### [Customer lookup in external CRM](#customer-lookup-in-external-crm)

Embed a CRM view on the customer page:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Name": "CRM Profile",
      "GuiExtensionArea": "privateCustomerEdit",
      "Header": "CRM",
      "IframeUrl": "https://crm.example.com/customer?email={{dataObject.email}}"
    }

* * *


## [Configuring in the UI](#configuring-in-the-ui)

Extensions are managed in the Omnium backoffice under **Administration > Tenant Settings > GUI Settings**.

The admin panel provides:

1.  **Extensions tab** — add, edit, reorder, and remove extensions
    *   **Settings**: name, header, description, button text, area assignment, tags, icon
    *   **Properties**: custom key-value pairs
    *   **IFrame**: iframe URL configuration
    *   **Webhook**: webhook URL, HTTP method, custom request headers
2.  **Help menu tab** — configure custom help menu items

Extensions can be reordered by dragging them in the list. The order determines the display order within each extension area.

* * *


## [Related Documentation](#related-documentation)

Topic

Link

Events and webhooks

[Events](/docs/Integrations/events)

Custom reports

[Custom Reports](/docs/configuration/custom-reports)

Configuration overview

[Configuration](/docs/configuration)

[

Previous

Configuration

](/docs/configuration)[

Next

Scheduled Tasks

](/docs/configuration/scheduled-tasks)

---


## Generic Concepts

[Configuration](/docs/configuration)

# Generic Concepts

This page provides an overview of generic concepts in Omnium, such as External IDs,properties and more.


## [External IDs](#external-ids)

External IDs are added to most Omnium models, making it possible to identify the entity across multiple systems. An order could get an ID from the commerce platform, another ID when created in the ERP system, and another from the accounting system. The ID given by any front-end or back-end system should be added to the key-value list of external IDs.

An external ID is searchable in Omnium, making it easy for customer service to find orders no matter what ID they are provided with.

Key benefits of adding external IDs to the ExternalIds-property:

*   External IDs as a common property on orders, customers, etc.
*   Key-value list separates IDs from multiple systems
*   Searchable in Omnium


## [Properties](#properties)

Most models in Omnium contain a property with a list of property items:

*   Orders
*   Order lines
*   Customers
*   Stores

The property list is a key-value collection for storing custom properties. There are no type requirements, so any value can be stored in custom properties.

The list is available to modify through the API or in the user interface.


## [Date Time Formats](#date-time-formats)

Dates in Omnium are always in UTC format in ISO-8601 format. UTC, or Universal Time Coordinated, is the most commonly referred to time standard.

Date and time example:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    2020-01-24T09:25:29Z


## [Comments](#comments)

Many models in Omnium have a collection of OmniumComment. They are used for storing either public or internal comments on the object.

Property

Type

Description

Information

Id

string

Comment ID

Created

[DateTime](api/generic?id=date-time-formats)

Comment created date

CustomerId

string

Comment customer ID

Detail

string

Comment main content

Title

string

Comment header

Type

string

Comment type

LineItemId

string

Optional line item reference

Creator

string

Name of comment creator

Attachments

[List<OmniumFileInfo>](api/generic?id=file-info)

List of attachments


## [File info](#file-info)

Property

Type

Description

Name

string

File name

Url

string

File url

Created

[DateTime](api/generic?id=date-time-formats)

Date created

Modified

[DateTime](api/generic?id=date-time-formats)

Date modified

ContentType

string

File type, e.g. image/jpg

Length

long

File size in bytes

[

Previous

Custom Reports

](/docs/configuration/custom-reports)[

Next

Number Options

](/docs/configuration/numberoptions)

---


## Number Options

[Configuration](/docs/configuration)

# Number Options

Configuration of number options for assigning IDs to entities.

### [Overview](#overview)

Number option settings determine how new IDs are assigned to entities such as customers, orders, carts, etc. Each number option is associated with a specific number type. The first defined configuration for a number type will be used when creating new IDs.

For example, when a new customer is created, Omnium will search for the first available "CustomerNumberOptions" on the selected market. If none are found, it will fall back to the first "CustomerNumberOptions" defined in the generic number options section of the configuration file. If no option is defined there, the system defaults to "GuidNumberService."

* * *

### [Number Option Model](#number-option-model)

The table below outlines the properties of a number option:

Property

Type

Description

Notes

**NumberType**

string

Specifies the number type (e.g., SupplierNumberOptions, CustomerNumberOptions).

Required

**Key**

string

Unique key for the incrementing value (e.g., OrderNumber, CustomerNumber).

Required

**StartSequence**

int

The starting point for the new number series.

Optional

**Prefix**

string

A prefix to be added to the number (e.g., "C-" for "C-1", "C-2").

Optional

**Service**

string

The number service used (e.g., "SequentialNumberService", "GuidNumberService").

Required

**TranslateKey**

string

Key for translating the number option name.

Optional

**ValidationRegex**

string

Regex pattern for validating the ID.

Optional

**IsReadOnly**

bool

If true, the number is non-editable in the GUI.

Optional

**IsAutoCreateDisabled**

bool

If true, automatic number assignment is disabled in the GUI (allowing manual entry).

Optional

* * *

### [Number Types](#number-types)

Number types are used to distinguish between different entity types. Below are the most common number types:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    public const string SupplierNumberOptions = "SupplierNumberOptions";
    public const string DeliveryNumberOptions = "DeliveryNumberOptions";
    public const string PurchaseOrderNumberOptions = "PurchaseOrderNumberOptions";
    public const string OrderNumberOptions = "OrderNumberOptions";
    public const string CustomerNumberOptions = "CustomerNumberOptions";
    public const string CartNumberOptions = "CartNumberOptions";
    public const string ReturnNumberOptions = "ReturnNumberOptions";
    public const string RmaNumberOptions = "RmaNumberOptions";
    public const string ProjectNumberOptions = "ProjectNumberOptions";
    public const string PickListNumberOptions = "PickListNumberOptions";

[

Previous

Generic Concepts

](/docs/configuration/generic)[

Next

Rounding Settings

](/docs/configuration/rounding-settings)

---


## Rounding Settings

[Configuration](/docs/configuration)

# Rounding Settings

Configure price rounding policies with range-based rules and multiple rounding methods.


## [Overview](#overview)

Rounding Settings allow you to define price rounding policies that automatically adjust prices to predefined values. This is commonly used in retail to create "nice" price endings (e.g., 99, 95, 90) or to round prices to the nearest whole number or increment.

Each rounding policy contains a set of range-based rules. When a price is rounded, the system finds the rule whose price range matches the input price and applies the configured rounding method. Multiple policies can be defined to support different rounding strategies for different contexts (e.g., discount rounding vs. price list rounding).

Rounding Settings are configured in Tenant Settings under **Administration > Tenant Settings > Rounding**.

* * *


## [Configuration Model](#configuration-model)

Rounding Settings are stored in the `RoundingSettings` section of Tenant Settings. The configuration is hierarchical: settings contain policies, and policies contain rules.

### [RoundingSettings](#roundingsettings)

Property

Type

Description

`RoundingPolicies`

List<RoundingPolicy>

List of rounding policies available to the tenant

### [RoundingPolicy](#roundingpolicy)

Each policy defines a named rounding strategy with one or more price range rules.

Property

Type

Required

Description

`Key`

string

Yes

Unique identifier used to reference this policy in code and other configuration

`Label`

string

No

Human-readable display name for the policy

`Rules`

List<RoundingRangeRule>

Yes

Ordered list of range-based rounding rules

### [RoundingRangeRule](#roundingrangerule)

Each rule defines how prices within a specific range should be rounded. When a price is evaluated, the first rule whose `MinPrice`/`MaxPrice` range contains the price is applied.

Property

Type

Required

Description

`MinPrice`

decimal?

No

Lower bound of the price range (inclusive). If null, no minimum limit.

`MaxPrice`

decimal?

No

Upper bound of the price range (inclusive). If null or 0, no maximum limit.

`MethodKey`

string

Yes

The rounding method to use: `RoundToNicePrice` or `RoundToNearest`

`Step`

int?

No

Rounding step increment. Used by `RoundToNicePrice`.

`Offset`

int?

No

Amount to subtract after rounding up. Used by `RoundToNicePrice`.

`RoundTo`

int?

No

Round to the nearest multiple of this value. Used by `RoundToNearest`.

`Mode`

string?

No

Rounding direction for `RoundToNicePrice`: `"up"`, `"down"`, or `"niceup"` (default). Only configurable via JSON/API, not exposed in the admin UI.

* * *


## [Rounding Methods](#rounding-methods)

Two rounding methods are available out of the box. The method is selected per rule via the `MethodKey` property.

### [RoundToNicePrice](#roundtoniceprice)

Creates "nice" price endings by rounding to a step and optionally subtracting an offset. This is the most common method for retail price rounding.

**Parameters used**: `Step`, `Offset`, `Mode`

**Modes**:

Mode

Formula

Description

`niceup` (default)

`ceil(price / step) * step - offset`

Round up to the nearest step, then subtract the offset to create a "nice" price

`up`

`ceil(price / step) * step`

Round up to the nearest step

`down`

`floor(price / step) * step`

Round down to the nearest step

**Examples** with Step = 100, Offset = 5, Mode = "niceup":

Input Price

Result

Explanation

51

95

ceil(51/100) \* 100 - 5 = 100 - 5 = 95

99

95

ceil(99/100) \* 100 - 5 = 100 - 5 = 95

101

195

ceil(101/100) \* 100 - 5 = 200 - 5 = 195

### [RoundToNearest](#roundtonearest)

Standard mathematical rounding to the nearest multiple of a specified value. Uses midpoint rounding away from zero (0.5 rounds up).

**Parameters used**: `RoundTo`

**Formula**: `Math.Round(price / roundTo, MidpointRounding.AwayFromZero) * roundTo`

**Examples** with RoundTo = 1 (round to nearest whole number):

Input Price

Result

Explanation

40.4

40

Rounds down (below midpoint)

40.5

41

Rounds up (at midpoint)

39.9

40

Rounds up (above midpoint)

* * *


## [How Rounding Works](#how-rounding-works)

When a price is rounded using a policy, the following process occurs:

1.  **Policy Lookup**: The system finds the `RoundingPolicy` matching the provided policy key
2.  **Rule Matching**: The first `RoundingRangeRule` whose price range contains the input price is selected
3.  **Method Execution**: The rounding method specified by `MethodKey` is applied with the rule's parameters
4.  **Fallback**: If no matching policy, rule, or method is found, the original price is returned unchanged

Prices that fall outside all defined ranges are not rounded. This allows you to skip rounding for very low-value items by starting your first rule at a minimum threshold.

### [Where Rounding Is Applied](#where-rounding-is-applied)

Rounding policies can be applied in the following contexts:

*   **Discount Calculation**: When discounts produce non-round prices, a rounding policy can be applied to adjust the final discounted price
*   **Price List Editing**: When bulk-editing price lists, a rounding policy can be selected to round all adjusted prices

In both cases, the rounding policy is selected by its `Key` value.

* * *
