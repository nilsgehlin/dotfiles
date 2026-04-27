# Carts — Checkout, Offers & Validation — Carts

## Carts

# Carts

Carts and offers in Omnium — managing shopping carts, offers, and pre-order entities.


## [Introduction to carts](#introduction-to-carts)

In Omnium, carts and offers are the same concept. All non-confirmed orders in Omnium are stored as carts.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fcarts.565d97c3.png&w=3840&q=75)

Therefore, a cart in Omnium could be any one of the following entities:

*   Carts from the web
    *   Created by the customer
*   Offers to customers
    *   Created in OMS
    *   Created in ERP

* * *


## [In this section](#in-this-section)

[

API Reference

Create carts, manage line items, apply discounts, and complete checkout



](/docs/Carts/cart-api)[

Configuration

Cart settings, validators, numbering, and market handling



](/docs/Carts/cart-config)

[

Previous

FAQ

](/docs/Order/order-faq)[

Next

API Reference

](/docs/Carts/cart-api)

---


## API Reference

[Carts](/docs/Carts)

# API Reference

Complete guide to building shopping cart experiences with the Omnium Cart API. Learn how to create carts, manage line items, apply discounts, and complete checkout in headless e-commerce scenarios.

The Cart API enables you to build complete shopping cart experiences for headless e-commerce, point-of-sale systems, and custom checkout flows. This guide focuses on the most common workflows for integrating with Omnium.


## [Overview](#overview)

A cart in Omnium represents a shopping session that can be converted into an order. Carts support:

*   Line items with automatic price calculation and promotions
*   Multiple shipping methods and split shipments
*   Various payment methods including split payments
*   Customer association and customer-specific pricing
*   Validation before order creation
*   Gift cards and coupon codes

### [Architecture](#architecture)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌─────────────────┐         ┌─────────────────┐         ┌─────────────────┐
    │   Your App      │         │   Omnium API    │         │   Omnium OMS    │
    │   (Frontend)    │◄───────►│   /api/Cart     │◄───────►│   (Backend)     │
    └─────────────────┘  REST   └─────────────────┘         └─────────────────┘
            │                           │                           │
            │  1. AddItemToCart         │                           │
            │  2. GetShippingOptions    │  ┌─────────────────────┐  │
            │  3. AddShipments          │  │ Automatic:          │  │
            │  4. AddPayments           │  │ • Price calculation │  │
            │  5. CreateOrderFromCart   │  │ • Promotions        │  │
            │                           │  │ • Tax calculation   │  │
            └───────────────────────────┘  │ • Inventory check   │  │
                                           └─────────────────────┘  │

### [Base URL](#base-url)

All Cart API endpoints are available at:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    https://api.omnium.no/api/Cart

Full API reference: [Omnium Cart API Documentation](https://api.omnium.no/documentation/index.html#/Carts)

* * *


## [Cart model](#cart-model)

The cart object contains all information about a shopping session. It inherits from the Order model with additional cart-specific properties.

### [Cart properties](#cart-properties)

Property

Type

Description

Id

string

Unique cart identifier (e.g., "C12345")

Session

string

Session code for linking to a web session

ExpiredDate

DateTime?

When the cart expires and should no longer be shown to the customer

IsReadOnly

bool

If true, the cart cannot be modified

MarketId

string

Market identifier (affects pricing, currency, shipping options)

StoreId

string

Store identifier (affects inventory, pricing)

CustomerId

string

Associated customer ID

BillingCurrency

string

Currency code (e.g., "NOK", "SEK", "EUR")

OrderForm

OrderForm

Contains line items, shipments, payments, and totals

Status

string

Cart status (typically "Draft")

### [OrderForm structure](#orderform-structure)

Property

Type

Description

LineItems

List<OrderLine>

Products in the cart

Shipments

List<Shipment>

Shipping selections

Payments

List<Payment>

Payment transactions

Discounts

List<Discount>

Applied discounts

SubTotal

decimal

Sum of line items before discounts

ShippingTotal

decimal

Total shipping cost

TaxTotal

decimal

Total tax amount

Total

decimal

Final total including tax

DiscountTotal

decimal

Total discount amount

### [OrderLine structure](#orderline-structure)

Property

Type

Description

LineItemId

string

Unique line item identifier (GUID)

Code

string

Product SKU

DisplayName

string

Product name

Quantity

decimal

Quantity ordered

PlacedPrice

decimal

Unit price

ExtendedPrice

decimal

Total price (quantity × unit price)

LineItemDiscountAmount

decimal

Discount applied to this line

IsBundle

bool

True if this is a bundle product

Components

List<ProductComponent>

Bundle components (if applicable)

* * *


## [Checkout flow](#checkout-flow)

The typical headless e-commerce checkout follows this flow:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    ┌──────────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────────┐
    │  1. Create   │───►│  2. Build    │───►│  3. Checkout │───►│  4. Complete │
    │     Cart     │    │     Cart     │    │              │    │              │
    └──────────────┘    └──────────────┘    └──────────────┘    └──────────────┘
           │                   │                   │                   │
      AddItemToCart      AddItemToCart       AddShipments       CreateOrder
      (no cartId)        SetQuantity         AddPayments        FromCart
                         DeleteLineItem      AddCustomer
                         AddCouponCode       Validate

### [Step 1: Create a cart](#step-1-create-a-cart)

Create a new cart by adding the first item. When you call `AddItemToCart` without a `cartId`, a new cart is created automatically.

**Endpoint:** `POST /api/Cart/AddItemToCart`

**Parameters:**

Parameter

Type

Required

Description

skuId

string

Yes

Product SKU identifier

quantity

decimal

No

Quantity to add (default: 1)

marketId

string

No

Market ID for pricing/currency

storeId

string

No

Store ID for inventory

customerId

string

No

Customer ID for personalized pricing

**Example request:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/AddItemToCart?skuId=SHOE-BLACK-42&quantity=1&marketId=NOR

**Example response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "C123456",
      "marketId": "NOR",
      "billingCurrency": "NOK",
      "status": "Draft",
      "orderForm": {
        "lineItems": [
          {
            "lineItemId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
            "code": "SHOE-BLACK-42",
            "displayName": "Running Shoe - Black - Size 42",
            "quantity": 1,
            "placedPrice": 999.00,
            "extendedPrice": 999.00
          }
        ],
        "subTotal": 999.00,
        "shippingTotal": 0,
        "taxTotal": 199.80,
        "total": 999.00
      }
    }

Save the `id` from the response - you'll need it for all subsequent cart operations.

### [Step 2: Build the cart](#step-2-build-the-cart)

#### [Add more items](#add-more-items)

**Endpoint:** `POST /api/Cart/AddItemToCart`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/AddItemToCart?cartId=C123456&skuId=SOCK-WHITE-M&quantity=2

#### [Add multiple items at once](#add-multiple-items-at-once)

For better performance when adding multiple items, use `AddItemsToCart`:

**Endpoint:** `POST /api/Cart/AddItemsToCart`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "cartId": "C123456",
      "lineItemRequests": [
        { "skuId": "SHOE-BLACK-42", "quantity": 1 },
        { "skuId": "SOCK-WHITE-M", "quantity": 2 },
        { "skuId": "LACES-BLACK", "quantity": 1 }
      ]
    }

#### [Update quantity](#update-quantity)

Update the quantity of an existing line item by SKU or line item ID.

**By SKU:** `POST /api/Cart/{cartId}/OrderLines/SetQuantity/Sku/{skuId}/{quantity}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C123456/OrderLines/SetQuantity/Sku/SOCK-WHITE-M/3

**By LineItemId:** `POST /api/Cart/{cartId}/OrderLines/SetQuantity/OrderLineId/{orderLineId}/{quantity}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C123456/OrderLines/SetQuantity/OrderLineId/a1b2c3d4-e5f6-7890-abcd-ef1234567890/2

Setting quantity to 0 removes the item from the cart. For bundle products, the quantity of all component items is automatically recalculated.

#### [Remove item](#remove-item)

**Endpoint:** `DELETE /api/Cart/{cartId}/OrderLines/{lineItemId}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    DELETE /api/Cart/C123456/OrderLines/a1b2c3d4-e5f6-7890-abcd-ef1234567890

For bundle products, add `?deleteComponents=true` to remove all component line items as well.

#### [Apply coupon code](#apply-coupon-code)

**Endpoint:** `PUT /api/Cart/{cartId}/AddCouponCode/{couponCode}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/C123456/AddCouponCode/SUMMER20

The cart is automatically recalculated with the promotion applied. If the coupon is invalid or expired, a 400 Bad Request is returned.

#### [Apply gift card](#apply-gift-card)

**Endpoint:** `PUT /api/Cart/{cartId}/AddGiftCard/{giftCardCode}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/C123456/AddGiftCard/GC-ABC123

For gift cards with a PIN, add it as a query parameter:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/C123456/AddGiftCard/GC-ABC123?giftCardPin=1234

### [Step 3: Checkout](#step-3-checkout)

#### [Get shipping options](#get-shipping-options)

Fetch available shipping methods for the cart based on the delivery address.

**Endpoint:** `GET /api/Cart/{cartId}/GetShippingOptions`

Parameter

Type

Description

postalCode

string

Delivery postal code (for calculating shipping)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Cart/C123456/GetShippingOptions?postalCode=0275

**Example response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "shippingMethodName": "Bring_SERVICEPAKKE",
        "displayName": "Bring Servicepakke",
        "description": "Delivery to pickup point, 2-4 business days",
        "price": 79.00,
        "currency": "NOK"
      },
      {
        "shippingMethodName": "Bring_PAKKE_I_POSTKASSEN",
        "displayName": "Mailbox Parcel",
        "description": "Delivery to your mailbox, 2-3 business days",
        "price": 49.00,
        "currency": "NOK"
      },
      {
        "shippingMethodName": "ClickAndCollect",
        "displayName": "Click & Collect",
        "description": "Pick up in store - Free",
        "price": 0.00,
        "currency": "NOK"
      }
    ]

#### [Add shipment](#add-shipment)

Add the customer's selected shipping method to the cart.

**Endpoint:** `PUT /api/Cart/{cartId}/AddShipments`

**Standard home delivery:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "shipmentId": "1",
        "shippingMethodName": "Bring_SERVICEPAKKE",
        "warehouseCode": "WebShop"
      }
    ]

**Click and collect (pickup in store):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "shipmentId": "1",
        "shippingMethodName": "ClickAndCollect",
        "warehouseCode": "WebShop",
        "pickUpWarehouseCode": "STORE-OSLO-01"
      }
    ]

Property

Type

Required

Description

shipmentId

string

Yes

Unique ID for the shipment (can be "1" or a GUID)

shippingMethodName

string

Yes

Must match a configured shipping method

warehouseCode

string

Yes

Store ID that will fulfill the order

pickUpWarehouseCode

string

No

Store ID for pickup (click & collect only)

#### [Get payment options](#get-payment-options)

Fetch available payment methods for the cart.

**Endpoint:** `GET /api/Cart/{cartId}/GetPaymentOptions`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Cart/C123456/GetPaymentOptions

**Example response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "paymentMethodName": "Klarna",
        "displayName": "Klarna - Pay later",
        "description": "Pay within 14 days"
      },
      {
        "paymentMethodName": "Vipps",
        "displayName": "Vipps",
        "description": "Pay with Vipps"
      },
      {
        "paymentMethodName": "Card",
        "displayName": "Credit/Debit Card",
        "description": "Visa, Mastercard, American Express"
      }
    ]

#### [Add payment](#add-payment)

Register a payment transaction on the cart. This is typically done after the customer completes payment with your payment provider.

**Endpoint:** `PUT /api/Cart/{cartId}/AddPayments`

**E-commerce payment (authorization):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "amount": 1127.00,
        "paymentMethodName": "Klarna",
        "transactionId": "klarna-order-abc123",
        "transactionType": "Authorization",
        "status": "Processed"
      }
    ]

**POS payment (immediate capture):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "amount": 1127.00,
        "paymentMethodName": "Card",
        "transactionId": "terminal-tx-12345",
        "transactionType": "Sale",
        "status": "Processed"
      }
    ]

**Split payment (gift card + card):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "amount": 200.00,
        "paymentMethodName": "GiftCard",
        "transactionId": "GC-ABC123",
        "transactionType": "Authorization",
        "status": "Processed"
      },
      {
        "amount": 927.00,
        "paymentMethodName": "Vipps",
        "transactionId": "vipps-order-xyz",
        "transactionType": "Authorization",
        "status": "Processed"
      }
    ]

Property

Type

Required

Description

amount

decimal

Yes

Payment amount in the cart's currency

paymentMethodName

string

Yes

Must match a configured payment method

transactionId

string

Yes

Payment provider's transaction reference

transactionType

string

Yes

"Authorization" (e-commerce) or "Sale" (POS)

status

string

Yes

Typically "Processed"

For e-commerce, use `transactionType: "Authorization"`. Omnium workflows handle capture and credit automatically when the order is fulfilled or returned.

#### [Add customer](#add-customer)

Associate a customer with the cart. This enables customer-specific pricing and saves the order to the customer's order history.

**Endpoint:** `PUT /api/Cart/{cartId}/AddCustomer/{customerId}`

Parameter

Type

Description

enrichCart

bool

Copy customer name and contact info to cart

isPriceRecalculated

bool

Recalculate prices based on customer tier

customerSpecificPrices

bool

Apply customer-specific contract prices

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/C123456/AddCustomer/CUST-001?enrichCart=true&isPriceRecalculated=true

#### [Validate cart](#validate-cart)

Before creating an order, validate the cart to catch any issues.

**Endpoint:** `POST /api/Cart/{cartId}/Validate`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C123456/Validate

**Success response (200 OK):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "value": { /* cart object */ },
      "validationErrors": [],
      "validationWarnings": []
    }

**Validation issues (422 Unprocessable Entity):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "value": { /* cart object */ },
      "validationErrors": [
        {
          "message": "Product SHOE-BLACK-42 is out of stock",
          "errorCode": "INVENTORY_ERROR",
          "reference": "SHOE-BLACK-42"
        }
      ],
      "validationWarnings": [
        {
          "message": "Coupon SUMMER20 has expired",
          "errorCode": "COUPON_EXPIRED"
        }
      ]
    }

Built-in validators check inventory, active products, payment totals, and more. See [Cart Configuration](/docs/Carts/cart-config#cart-validators) for the full list.

### [Step 4: Create order](#step-4-create-order)

Convert the cart into an order to trigger fulfillment workflows.

**Endpoint:** `POST /api/Cart/CreateOrderFromCart/{cartId}`

Parameter

Type

Description

orderType

string

Order type (e.g., "Online", "ClickAndCollect")

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/CreateOrderFromCart/C123456?orderType=Online

**Example response:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "ORD-2024-123456",
      "orderNumber": "ORD-2024-123456",
      "status": "New",
      "orderType": "Online",
      "orderForm": {
        "lineItems": [ /* ... */ ],
        "shipments": [ /* ... */ ],
        "payments": [ /* ... */ ],
        "total": 1127.00
      },
      "created": "2024-01-15T14:30:00Z"
    }

The order is now created and workflow steps (notifications, ERP sync, etc.) will execute based on your order type configuration.

* * *


## [Additional endpoints](#additional-endpoints)

### [Get cart](#get-cart)

Retrieve an existing cart by ID.

**Endpoint:** `GET /api/Cart/{cartId}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Cart/C123456

### [Get carts by customer](#get-carts-by-customer)

Retrieve the latest carts for a customer (returns up to 50).

**Endpoint:** `GET /api/Cart/GetCartsByCustomer`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Cart/GetCartsByCustomer?customerId=CUST-001

### [Search carts](#search-carts)

Search for carts with filters.

**Endpoint:** `POST /api/Cart/Search`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "storeIds": ["WebShop"],
      "customerId": "CUST-001",
      "searchQuery": "black shoe",
      "take": 20,
      "page": 1
    }

### [Save complete cart](#save-complete-cart)

Create or update a cart with a complete cart object. Use this when your system already has prices and metadata.

**Endpoint:** `PUT /api/Cart`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "C123456",
      "marketId": "NOR",
      "orderForm": {
        "lineItems": [
          {
            "code": "SHOE-BLACK-42",
            "displayName": "Running Shoe",
            "quantity": 1,
            "placedPrice": 999.00
          }
        ]
      }
    }

### [Recalculate prices](#recalculate-prices)

Force recalculation of all prices on the cart (useful after price updates).

**Endpoint:** `PUT /api/Cart/{cartId}/RecalculatePrices`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/C123456/RecalculatePrices

### [Delete cart](#delete-cart)

Permanently delete a cart.

**Endpoint:** `DELETE /api/Cart/{cartId}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    DELETE /api/Cart/C123456

Deleted carts cannot be recovered. Use `DeactivateCart` if you want to hide the cart without permanent deletion.

* * *


## [Bundle and package products](#bundle-and-package-products)

Omnium supports bundle products (fixed product combinations) and package products (configurable components).

### [Add bundle to cart](#add-bundle-to-cart)

**Endpoint:** `POST /api/Cart/AddBundleToCart`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/AddBundleToCart?cartId=C123456&skuId=BUNDLE-STARTER-KIT&quantity=1

If the bundle contains products with variants, specify the selected variants in the request body:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "componentId": "821cdfd1-4bf1-48fe-8944-4cc51d62bc66",
        "productId": "tshirt-basic",
        "skuId": "tshirt-basic-M-BLUE",
        "quantity": 1
      }
    ]

### [Update bundle components](#update-bundle-components)

Update variant selections for a bundle already in the cart.

**Endpoint:** `POST /api/Cart/{cartId}/UpdateComponentsInCart/orderLineId/{orderLineId}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    [
      {
        "componentId": "821cdfd1-4bf1-48fe-8944-4cc51d62bc66",
        "skuId": "tshirt-basic-L-RED",
        "quantity": 1
      }
    ]

* * *


## [Product options and customizations](#product-options-and-customizations)

Add product options like engraving or gift wrapping to an existing line item.

**Endpoint:** `POST /api/Cart/AddProductOptionsItemToCart`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "cartId": "C123456",
      "parentLineItemId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
      "productOptions": [
        {
          "skuId": "ENGRAVING",
          "title": "Engraving",
          "value": "Happy Birthday!",
          "price": 99.00
        },
        {
          "skuId": "GIFT-WRAP",
          "title": "Gift Wrapping"
        }
      ]
    }

Product options are added as separate line items linked to the parent product.

* * *


## [Units of measure (B2B)](#units-of-measure-b2b)

For B2B scenarios where products can be sold in different units (each, box, pallet), use the unit-aware endpoints.

### [Add item with unit](#add-item-with-unit)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/AddItemToCart?cartId=C123456&skuId=BOLT-M8&quantity=5&unitId=BOX-12

### [Update unit quantity](#update-unit-quantity)

**Endpoint:** `POST /api/Cart/{cartId}/OrderLines/SetSelectedUnitQuantity/Sku/{skuId}/{selectedUnit}/{selectedUnitQuantity}`

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C123456/OrderLines/SetSelectedUnitQuantity/Sku/BOLT-M8/BOX-12/5

The actual quantity is calculated as: `selectedUnitQuantity × conversionFactor`

* * *


## [Error handling](#error-handling)

The Cart API uses standard HTTP status codes:

Status

Meaning

200

Success

201

Created (new cart)

400

Bad request (invalid parameters)

404

Cart or resource not found

422

Validation errors (cart returned with errors)

500

Server error

### [Error response format](#error-response-format)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "message": "Cart not found",
      "isSuccessful": false,
      "httpStatusCode": 404
    }

### [Validation error response](#validation-error-response)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "value": { /* cart object */ },
      "validationErrors": [
        {
          "message": "Insufficient inventory for SHOE-BLACK-42",
          "errorCode": "INVENTORY_ERROR",
          "reference": "SHOE-BLACK-42"
        }
      ],
      "validationWarnings": []
    }

* * *
