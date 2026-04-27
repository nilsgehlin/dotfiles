# Orders — Lifecycle, Workflows & Concepts — [Price properties](#price-properties)

## [Price properties](#price-properties)

The order line consists of multiple price properties. Generally, only the PlacedPrice and TaxRate should be set, in order for the other price properties to be calculated correctly.

**PlacedPrice** The full price per item, without any discounts added. The PlacedPrice should not be multiplied by quantity.

**DiscountedPrice**

_This price is calculated by the order calculator and should not be set manually._

The discounted price is the total price of the order line reduced by the **order line level** discounts applied. Any **order** level discounts are not applied to the discounted price.

The discounted price is calculated with the following formula:

> DiscountedPrice = ( ( Quantity - CanceledQuantity ) \* PlacedPrice ) - ( ( Discounted / Quantity ) \* ( Quantity - CanceledQuantity ) )

**ExtendedPrice**

_This price is calculated by the order calculator and should not be set manually._

The extended price is the total line item price with all discounts applied, **including** both order line level and order level discounts.

The extended price is calculated with the following formula:

> ExtendedPrice = DiscountedPrice - ( ( DiscountedPrice / ( \[ Sum of DiscountedPrice for all order lines \] ) \* DiscountAmount )

**SuggestedRetailPrice**

_This price is **not** used in any calculations, and will not be changed by Omnium._

The placed price could be a customer-specific price based on price agreements (e.g., 10% off suggested retail price). In these scenarios, the placed price would already contain a discount, and the suggested retail price could be used to indicate savings for the end customer by comparing suggested retail price to the discounted price.

The price could also be used for reports or statistics by third-party applications.

**Price Example** This is an example of how the prices would look after calculation when a 10% order discount is added to the order. The case is that the customer bought two products with an original price of $500, but with a 10% discount. So, the customer paid 2 x (500 - 10%) = 900.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "lineItemId": "1",
        "quantity": 2,
        "placedPrice": 500,
        "placedPriceExclTax": 400,     // Calculated
        "discountedPrice": 1000,       // Calculated
        "discountedPriceExclTax": 800, // Calculated
        "discounted": 0,               // Discount was added as an order discount, not as a "basic" order line discount.
        "discountedExclTax": 0,
        "orderDiscountAmount": 100,    // Calculated
        "extendedPrice": 900,          // Calculated
        "extendedPriceExclTax": 720,   // Calculated
        "taxTotal": 180,               // Calculated
        "taxRate": 25,                 // Calculated
        ...
    }


## [Order types](#order-types)

The order type is used for triggering different workflows. A point of sale order can have a different process than an online order.

The order type string is a free text string, but orders in Omnium should have a [corresponding order type in the settings](/configuration?id=order-types) in order for workflows to run correctly.

Omnium has five predefined order types, commonly used:

Order type

Description

Pos

Order from Point of Sale system

Online

Order from B2B / B2C web portals

ClickAndCollect

Click and collect orders (Not paid)

Bopis

Buy online, pick up in store (Paid)

PreOrder

Orders placed for products that are not yet released


## [Adding orders](#adding-orders)

An order can be added to Omnium in numerous ways. It can be:

*   Imported via API
*   Created from a cart via API
*   Created from a cart via Omnium's UI
*   Created from Omnium's UI
*   Imported from Excel via Omnium's UI

### [Example: Creating an order](#example-creating-an-order)

In order to meet multiple demands and be as flexible as Omnium is, Omnium’s order model is rather large and contains many fields. Most likely, you’ll not be in need of all of them. Below is a basic example of how to add an order, using the [POST ​/api​/Orders](https://api.omnium.no/documentation/index.html#/Orders/post_api_Order) API.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
    	"id": "EPIC000001",
    	"customerId": "4793246662",
    	"billingCurrency": "NOK",
    	"customerName": "Ola Nordmann",
    	"marketId": "epic_market_no",
    	"storeId": "epic_webshop_no",
    	"customerPhone": "4793246662",
    	"customerEmail": "ola.nordmann@example.com",
    	"status": "New",
    	"billingAddress": {
    		"daytimePhoneNumber": "4793246662",
    		"name": "Ola Nordmann",
    		"line1": "Lille Grensen 3",
    		"city": "Oslo",
    		"countryCode": "NO",
    		"countryName": "Norge",
    		"postalCode": "1415",
    		"email": "ola.nordmann@example.com"
    	},
    	"orderForm": {
    		"payments": [
    			{
    				"amount": 49.5,
    				"paymentMethodName": "Klarna",
    				"status": "Processed",
    				"transactionId": "123456789",
    				"transactionType": "Authorization"
    			}
    		],
    		"shipments": [
    			{
    				"shipmentId": "1",
    				"shippingMethodName": "PostNord",
    				"warehouseCode": "epic_company_main_warehouse",
    				"lineItems": [
    					{
    						"lineItemId": "1",
    						"code": "0123ABC",
    						"placedPrice": 99.0,
    						"quantity": 1.0,
    						"taxRate": 25
    					}
    				],
    				"address": {
    					"name": "Ola Nordmann",
    					"line1": "Lille Grensen 3",
    					"city": "Oslo",
    					"countryName": "Norge",
    					"countryCode": "NO",
    					"postalCode": "0159",
    					"email": "ola.nordmann@example.com"
    				}
    			}
    		],
    		"lineItems": [
    			{
    				"lineItemId": "1",
    				"code": "0123ABC",
    				"placedPrice": 99.0,
    				"quantity": 1.0,
    				"taxRate": 25
    			}
    		],
    		"discounts": [
    			{
    				"discountType": "Order",
    				"discountName": "Fifty percent discount!",
    				"discountValue": 50,
    				"rewardType": "Percentage"
    			}
    		]
    	},
    	"orderType": "Online"
    }

[Relevant swagger documentation](https://api.omnium.no/documentation/index.html#/Orders/post_api_Orders)


## [Fetching orders](#fetching-orders)

There are multiple endpoints that could be used to retrieve an order, as there are various ways of searching for an order. This could be faceted free-text searching, filtered search by customer metadata or product data, or simply fetching a single order using the order ID.

### [Get a single order](#get-a-single-order)

### [Standard Online order](#standard-online-order)

This is the data from the order created in the order creation example.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
    	"id": "ORDR000001",
    	"orderNumber": "ORDR000001", // Enriched from ID
    	"customerId": "4793246662",
    	"customerNumber": "4793246662", // Enriched from customerId
    	"billingCurrency": "NOK",
    	"customerName": "Ola Nordmann",
    	"customerPhone": "4793246662",
    	"customerEmail": "ola.nordmann@example.com",
    	"customerType": "B2C", // Enriched from market configuration
    	"marketId": "NOR",
    	"billingAddress": {
    		"name": "Ola Nordmann",
    		"line1": "Lille Grensen 3",
    		"city": "Oslo",
    		"countryCode": "NO",
    		"countryName": "Norge",
    		"postalCode": "1415",
    		"daytimePhoneNumber": "4793246662",
    		"eveningPhoneNumber": "",
    		"email": "ola.nordmann@example.com"
    	},
    	"orderForm": {
    		"shipments": [
    			{
    				"shipmentId": "1",
    				"shippingMethodName": "PostNord",
    				"shippingLabel": "PostNord", // Enriched from shipping provider
    				"shippingTax": 0,
    				"shippingDiscountAmount": 0,
    				"shippingSubTotal": 0,
    				"shippingTotal": 0,
    				"shippingSubTotalExclTax": 0,
    				"status": "AwaitingInventory", // Default status
    				"orderStatus": "New", // Default status
    				"subTotal": 49.5,
    				"total": 49.5,
    				"taxTotal": 9.9,
    				"warehouseCode": "epic_company_main_warehouse",
    				"lineItems": [
    					{
    						"lineItemId": "1",
    						"code": "0123ABC",
    						"displayName": "Omnium Super Stylish sweater /w logo", // Enriched from product
    						"alternativeProductName": "Logo sweater", // Enriched from product
    						"placedPrice": 99,
    						"placedPriceExclTax": 79.2,
    						"extendedPrice": 49.5, // Calculated total line amount
    						"extendedPriceExclTax": 39.6,
    						"discountedPrice": 99, // Calculated discounted amount, excluding order level discount
    						"discountedPriceExclTax": 79.2,
    						"suggestedRetailPrice": 0, // Optional values, used by 3rd party systems and reporting
    						"suggestedRetailPriceExclTax": 0,
    						"orderDiscountAmount": 49.5, // The order level discount amount
    						"quantity": 1,
    						"unit": "pcs", // Enriched from product
    						"returnQuantity": 0,
    						"canceledQuantity": 0,
    						"deliveredQuantity": 0,
    						"isGift": false,
    						"isReadOnly": false, // Read only is only used in the Omnium UI
    						"cost": 19, // the product/provide cost of the order line, per unit. Enriched from product
    						"costTotal": 19,
    						"discounted": 0, // The order line level discount
    						"discountedExclTax": 0,
    						"taxTotal": 9.9, // Calculated tax rate
    						"taxRate": 25,
    						"size": "M", // Enriched from product
    						"color": "Black", // Enriched from product
    						"brand": "Omnium Sweaters 'n Jeans", // Enriched from product
    						"productId": "ABC-123_no", // Enriched from product
    						"webSiteProductUrl": "https://www.yourshop.com/product/0123abc", // Enriched from product
    						"updateStock": false,
    						"isPackage": false
    					}
    				],
    				"address": {
    					"name": "Ola Nordmann",
    					"line1": "Lille Grensen 3",
    					"city": "Oslo",
    					"countryCode": "NO",
    					"countryName": "Norge",
    					"postalCode": "0159",
    					"daytimePhoneNumber": "",
    					"eveningPhoneNumber": "",
    					"email": "ola.nordmann@example.com"
    				},
    				"transit": false,
    				"expectedDeliveryDate": "0001-01-01T00:00:00"
    			}
    		],
    		"lineItems": [
    			{
    				"lineItemId": "1",
    				"code": "0123ABC",
    				"displayName": "Omnium Super Stylish sweater /w logo", // Enriched from product
    				"alternativeProductName": "Logo sweater", // Enriched from product
    				"placedPrice": 99,
    				"placedPriceExclTax": 79.2,
    				"extendedPrice": 49.5, // Calculated total line amount
    				"extendedPriceExclTax": 39.6,
    				"discountedPrice": 99, // Calculated discounted amount, excluding order level discount
    				"discountedPriceExclTax": 79.2,
    				"suggestedRetailPrice": 0, // Optional values, used by 3rd party systems and reporting
    				"suggestedRetailPriceExclTax": 0,
    				"orderDiscountAmount": 49.5, // The order level discount amount
    				"quantity": 1,
    				"unit": "pcs", // Enriched from product
    				"returnQuantity": 0,
    				"canceledQuantity": 0,
    				"deliveredQuantity": 0,
    				"isGift": false,
    				"isReadOnly": false, // Read only is only used in the Omnium UI
    				"cost": 19, // the product/provide cost of the order line, per unit. Enriched from product
    				"costTotal": 19,
    				"discounted": 0, // The order line level discount
    				"discountedExclTax": 0,
    				"taxTotal": 9.9, // Calculated tax rate
    				"taxRate": 25,
    				"size": "M", // Enriched from product
    				"color": "Black", // Enriched from product
    				"brand": "Omnium Sweaters 'n Jeans", // Enriched from product
    				"productId": "ABC-123_no", // Enriched from product
    				"webSiteProductUrl": "https://www.yourshop.com/product/0123abc", // Enriched from product
    				"updateStock": false,
    				"isPackage": false
    			}
    		],
    		"discounts": [
    			{
    				"discountType": "Order",
    				"discountAmount": 49.5,
    				"discountName": "Fifty percent discount!",
    				"discountValue": 50,
    				"discountSource": "Manual", // Manual or Campaign
    				"rewardType": "Percentage"
    			}
    		],
    		"payments": [
    			{
    				"amount": 49.5,
    				"paymentId": 0,
    				"paymentMethodId": "00000000-0000-0000-0000-000000000000",
    				"paymentMethodName": "Klarna",
    				"status": "Processed",
    				"transactionId": "123456789",
    				"transactionType": "Authorization",
    				"created": "2022-12-04T07:28:50.1521376Z",
    				"isManuallyAdded": false
    			}
    		],
    		"shippingDiscountTotal": 0,
    		"shippingSubTotal": 0,
    		"shippingSubTotalExclTax": 0,
    		"shippingTotal": 0,
    		"handlingTotal": 0,
    		"orderLevelTax": 0,
    		"taxTotal": 9.9,
    		"discountAmount": 49.5,
    		"subTotal": 49.5,
    		"subTotalExclTax": 39.6,
    		"total": 49.5,
    		"totalExclTax": 39.6,
    		"authorizedPaymentTotal": 0,
    		"capturedPaymentTotal": 0,
    		"fullRefund": false
    	},
    	"shippingDiscountTotal": 0,
    	"shippingSubTotal": 0,
    	"status": "New",
    	"remainingPayment": 0,
    	"modified": "2022-12-04T07:28:50.152347Z",
    	"created": "2022-12-04T07:28:50.1523193Z",
    	"orderType": "Online",
    	"storeId": "epic_webshop_no",
    	"lineItemsCost": 0,
    	"netTotal": 49.5, // Calculated order form total minus return order form totals
    	"netTotalExclTax": 39.6,
    	"isReadOnly": false,
    	"isNotificationsDisabled": false
    }

### [Updating orders](#updating-orders)

There are multiple ways an order could be update, and multipe reasons to update an order. Sometimes, you would only like to update data on an order, without triggering any other logic. For this, the patch endpoint would typically be a good fit.

### [Triggering workflows](#triggering-workflows)

An order update often involves a status update which should trigger a workflow in Omnium. A workflow contains workflow steps which triggeres actions configured for the current status. Examples of this could be to capture payment, send email/sms, book shipping, or reduce inventory. Workflows are an essencial part of how Omnium works. [More information](/docs/Order/order-config#order-statuses)

There are endpoints specifically created for the purpose of updating order status and the workflow connected to the status: [More information](https://api.omnium.no/documentation/index.html#/Orders%20%7C%20Workflow)

Order/order-config#workflow-steps

### [Get Order by Secret Key](#get-order-by-secret-key)

The secret key endpoint allows you to retrieve orders using a secure, randomly generated key without requiring authentication. This is useful for guest order tracking, customer support links, and email notifications.

**Endpoint**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/orders/secret/{secretKey}

**Parameters**

Parameter

Type

Location

Required

Description

`secretKey`

string

path

Yes

The secret key associated with the order

**Response**

Returns a complete `OmniumOrder` object if a matching order is found, or `404 Not Found` if no order matches the secret key or the caller doesn't have access.

**Example Request**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/orders/secret/aB3xR9mK2pQw7Vn5

**Example Response**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "ORDR000123",
      "orderNumber": "ORDR000123",
      "secretKey": "aB3xR9mK2pQw7Vn5",
      "customerId": "customer@example.com",
      "customerName": "John Doe",
      "status": "Processing",
      "total": 299.99,
      "orderForm": {
        // ... full order details
      }
    }

**Security Considerations**

*   **No authentication required**: The secret key itself acts as the authorization mechanism
*   **Cryptographically secure**: Keys are generated using .NET's `RandomNumberGenerator` for unpredictability
*   **URL safety**: Default character set uses only alphanumeric characters (A-Z, a-z, 0-9)
*   **Key length**: Default 16 characters provides adequate security for most use cases
*   **Access control**: Standard tenant isolation and access rules still apply

**Use Cases**

1.  **Order tracking emails**
    
    \[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}
    
        Track your order: https://yoursite.com/track?key={ORDER_SECRET_KEY}
    
2.  **Guest checkout** Allow customers to view their order without creating an account
    
3.  **Customer service** Provide support agents with secure links to specific orders
    
4.  **SMS notifications** Send short tracking links via text message
    

**Generating Secret Keys**

Secret keys are typically generated automatically using the [Generate Secret Key](/docs/Order/workflow-steps/enrichment/generate-secret-key) workflow step. You can configure:

*   **Key length** (default: 16, max: 64 characters)
*   **Character set** (default: alphanumeric)
*   **Overwrite behavior** (whether to regenerate existing keys)

Add the workflow step to your order creation process:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "ActionType": "GenerateSecretKey",
      "Properties": [
        { "Key": "KeyLength", "Value": "24" },
        { "Key": "OverwriteExisting", "Value": "false" }
      ]
    }

**Using in Notifications**

Reference the secret key in email templates using the replacement token:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {ORDER_SECRET_KEY}

This will be replaced with the actual secret key when the notification is sent.

**Related Documentation**

*   [Generate Secret Key Workflow Step](/docs/Order/workflow-steps/enrichment/generate-secret-key) - Detailed configuration
*   [Notification Templates](/docs/OtherFeatures/notifications) - Using replacement tokens

### [Errors](#errors)

The orders contain a list of errors in the property _Errors_. This is a list of OmniumEntityError, a class designed to capture detailed information about errors related to order processing. To add error messages to an order, simply add new items to this list.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
    	"id": "123",
    	"orderNumber": "123",
    	"errors": [
    		{
    			"Key": "Provider1Key",
    			"Message": "This is a critical error.",
    			"Details": "Detailed information about the error.",
    			"Severity": "Error",
    			"Occurred": "2022-10-16T12:34:56.789Z"
    		},
    		{
    			"Key": "Provider2Key",
    			"Message": "This is a warning.",
    			"Details": "Additional details for the warning.",
    			"Severity": "Warning",
    			"Occurred": "2022-10-16T12:34:56.789Z"
    		}
    	]
    }


## [Validate Order](#validate-order)

Webhook validation for orders can be enabled from order settings in configuration. The validator will be run on all updates to the order from the UI. It’s possible to add custom validation using the webhook validator. The webhook validator will post the [order](https://api.omnium.no/documentation/index.html#/model-OmniumOrder) to a provided endpoint, and accept the validated order as response.

Add the webhook validator to Connectors in settings:

Required properties

Property

Sample value

Description

Name

webhookOrderValidator

Name of Omnium connector provider. In this case it must be "webhookOrderValidator"

Host

[https://acme.com](https://acme.com)

Endpoint host

Implementations

"IWebhookOrderValidator"

Connector capabilities. Must include IWebhookOrderValidator.

#### [Sample configuration](#sample-configuration)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
    	"connectors": [
    		{
    			"name": "webhookOrderValidator",
    			"host": "https://acme.com/api/ValidatorEndpoint",
    			"isAuthenticatedManually": false,
    			"timeOut": "00:00:00",
    			"implementations": ["IWebhookOrderValidator"],
    			"disableStandardErrorPolicy": false
    		}
    	]
    }

[

Previous

Orders

](/docs/Order)[

Next

Order API Reference

](/docs/Order/api-reference)

---


## Order Lifecycle

[Order](/docs/Order)

# Order Lifecycle

How orders flow through Omnium — from creation to completion, with returns, cancellations, and everything in between.


## [The Big Picture](#the-big-picture)

Every order in Omnium follows a lifecycle: it is created, processed through a series of statuses, and eventually completed, canceled, or returned. At each status transition, **workflow steps** execute automatically — reserving inventory, capturing payment, sending notifications, exporting to ERP, and more.

This page gives you the full picture of how orders move through the system. For API reference, see [Order API](/docs/Order/order-api). For configuration details, see [Order Configuration](/docs/Order/order-config).

### [Key Concepts](#key-concepts)

Concept

What It Means

**Order Type**

The kind of order (Online, ClickAndCollect, POS, etc.). Each type has its own set of statuses and workflows.

**Order Status**

Where the order is in its lifecycle (New, InProgress, Ship, Completed, etc.).

**Workflow Steps**

Automated actions that run when an order enters a status (e.g., reserve inventory, capture payment).

**Shipment**

A fulfillment unit within an order. One order can have multiple shipments going to different addresses or from different warehouses.

**Order Form**

The container within an order that holds line items, shipments, payments, and discounts. Visible as `orderForm` in the API response.

* * *


## [Order Types](#order-types)

Order types define the kind of transaction. Each type has its own status flow and workflow configuration.

Order Type

Description

Typical Use

**Online**

Standard e-commerce order

B2C/B2B web shop

**ClickAndCollect**

Reserved online, picked up in store (not prepaid)

ROPIS flow

**Bopis**

Buy online, pick up in store (prepaid)

BOPIS flow

**ShipFromStore**

Fulfilled from a physical store instead of a warehouse

Distributed fulfillment

**Pos**

Point-of-sale transaction

In-store purchases

**PreOrder**

Order for products not yet available

Pre-release, backorder

**Replacement**

Replacement order created from a return

Exchanges

**ReturnOrder**

Return of goods

Returns processing

**Subscription**

Recurring order

Subscription commerce

Each order type is configured independently in **Configuration > Order Types** in the Omnium GUI. You can create custom order types, copy existing ones as templates, and configure completely different workflows for each.

* * *


## [Lifecycle Stages](#lifecycle-stages)

An order moves through these stages, regardless of order type. Not every order passes through every stage — a POS order may skip allocation entirely, while an online order goes through the full flow.

### [Stage 1: Creation](#stage-1-creation)

An order is created either from a **cart** (checkout flow) or directly via the API.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Cart → CreateOrderFromCart → Order (Status: New)

Or directly:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/orders → Order (Status: New)

When an order is created, the system:

*   Assigns an order number (auto-generated or explicit)
*   Sets the initial status to **New** (or the first status in the order type)
*   Triggers all workflow steps configured for that status

### [Stage 2: Validation and Enrichment](#stage-2-validation-and-enrichment)

Workflow steps at the **New** status typically handle:

*   **Enrichment** — Populating order data from product catalog (prices, names, images, tax rates)
*   **Validation** — Checking for fraud, verifying inventory, validating serial numbers
*   **Customer** — Creating or linking the customer record
*   **Tagging** — Adding tags based on order properties (payment type, category, etc.)
*   **External IDs** — Generating or setting external reference numbers

### [Stage 3: Allocation](#stage-3-allocation)

The system decides **which warehouse** fulfills each item:

*   **AllocateToWarehouse** — Assigns items to a specific warehouse
*   **SetWarehouseBasedOnZip** — Picks the closest warehouse by postal code
*   **TryReallocateEntireOrder** — Moves items if the assigned warehouse is out of stock
*   **SplitAllLineItems** — Splits the order into multiple shipments when items come from different warehouses

After allocation, inventory is typically reserved:

*   **IncreaseReservedInventory** — Marks stock as reserved so it's not oversold

### [Stage 4: Payment](#stage-4-payment)

Payment handling depends on the payment provider and business rules:

*   **AuthorizePayment** — Authorizes the payment (holds funds)
*   **VerifyOrderPaymentMethod** — Confirms the payment method is valid
*   **SetAuthorizationExpires** — Sets a deadline for payment capture
*   **CheckAndUpdateCouponUsage** — Tracks coupon/voucher usage

Payment **authorization** happens early in the flow (to hold funds), but **capture** typically happens later — at shipment or delivery. This is configured per status via workflow steps.

### [Stage 5: Fulfillment](#stage-5-fulfillment)

The order moves through packing and preparation:

Status

What Happens

**InProgress**

Order is being processed by warehouse staff

**PackingInProcess**

Items are being picked and packed

**PackedAndReady**

All items packed, ready for carrier pickup

**ReadyForShipment**

Shipping label printed, awaiting dispatch

Workflow steps at these stages typically:

*   Print shipping labels (**PrintShippingLabel**)
*   Create shipment bookings with carriers (**CompleteShipment**)
*   Validate tracking numbers (**ValidateTrackingNumber**)
*   Export to ERP (**ExportOrder**)

### [Stage 6: Shipment and Payment Capture](#stage-6-shipment-and-payment-capture)

When the order ships:

Status

What Happens

**Ship**

Order has been shipped

**InTransit**

Carrier has the package

**PartiallyShipped**

Some shipments sent, others pending

Workflow steps at shipment typically:

*   **CapturePayments** — Captures the authorized payment (charges the customer)
*   **ReduceInventory** — Decrements physical stock levels
*   **UpdateShipmentStatus** — Syncs shipment status with carrier
*   **Notification** — Sends shipping confirmation to customer
*   **ExportOrder** — Sends shipment data to ERP

### [Stage 7: Completion](#stage-7-completion)

Status

What Happens

**Completed**

Order delivered to customer

**PickedUp**

Customer picked up the order (Click and Collect)

Workflow steps:

*   **SetCompletedDate** — Records the completion timestamp
*   **AnalyticsIndexing** — Updates analytics data
*   **Customer Club Points** — Awards loyalty points (if customer club is configured)

### [Stage 8: Returns (Optional)](#stage-8-returns-optional)

If the customer returns items, a return order is created:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Order (Completed) → Create Return → Return Order (with return workflow)

Return workflows handle:

*   **EnsureRma** — Generates a return merchandise authorization number
*   **CreditReturn** — Processes the refund
*   **UpdateInventory** — Returns items to stock
*   **CreateCreditNote** — Generates a credit note
*   **Notification** — Sends return confirmation

See [Returns](/docs/Order/Returns/return-api) for the complete returns documentation.

* * *
