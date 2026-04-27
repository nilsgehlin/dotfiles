# Orders — Lifecycle, Workflows & Concepts — Click and Collect

## Click and Collect

[Order](/docs/Order)

# Click and Collect

Working with click and collect orders in Omnium.


## [Click and Collect Orders](#click-and-collect-orders)

Click and Collect orders typically refer to orders without upfront payment that are picked up in-store. In Omnium, these orders are generally treated as product reservations rather than completed sales.

There are two available views for managaging Click and Collect orders in Omnium:

1.  **Click and Collect Order List**
2.  **Click and Collect Order Line List**

The Click and Collect view is designed as a simple interface for viewing, picking, and canceling Click and Collect orders.

Contact Omnium Support for a assitance on setting the correct version.

* * *


## [Setting up Click And Collect](#setting-up-click-and-collect)

### [Deadlines](#deadlines)

In the Order-section of your tenant settings you will find the click and collect settings. Here you can configure different deadlines related to click and collect orders such as:

*   Picking deadline for store staff
*   Customer pickup deadline

It is possible to override these deadlines on store level by setting store specific deadlines in the **Edit Store** view in Omnium under **Opening Hours**.

> ⚠️ **Important:** It is important to set store opening hours in Omnium when using click and collect as this info is crucial for calculating the picking deadlines and allow them to account for store closing hours. Picking deadlines are only available within store opening hours, so if a store has no opening hours no picking deadline will be set on the order.

### [Automatic cancellations](#automatic-cancellations)

Omnium has a scheduled task named `CancelExpiredClickCollectScheduledTask`. This task will automatically cancel all click and collect orders where the deadline has passed.

It will cancel in an order in the following two scenarios:

*   Store pick deadline has expired
*   Customer pick up deadline has expired

In order to clear the store pick deadline when an order is picked, the click and collect order workflow should contain the workflow step `SetShipmentOrOrderReadyForPickup` on the status **Ready for pickup**. This way the scheduled task will not cancel the order once the store has set it to **Ready for pickup**.

The customer deadline is only relevant when the order has status **Ready for pickup**, so once the order is completed by the store staff the cancellation task will ignore them.

### [Notification templates](#notification-templates)

Omnium has click and collect specific notifications that can be triggered on click and collect specific events. Check out the available notification types under Configuration -> Notifications for more info.


## [Working with Click and Collect Orders in Omnium](#working-with-click-and-collect-orders-in-omnium)

### [Picking Orders](#picking-orders)

In a standard workflow, when a Click and Collect order is created in Omnium, inventory is reserved for the relevant items, and an order confirmation is sent to the customer indicating which products are reserved.

Once a Click and Collect order is registered in Omnium, it becomes visible in the **Click and Collect list**, typically accessible via the main menu on the left-hand side.

Store employees can **view**, **search**, and **filter** Click and Collect orders within this list. Usually, employees only have access to orders placed in their own store, and the list will reflect this based on who is logged in.

For example, if four new orders are received and only two items are available in stock, the employee can:

*   Select the order lines for items that are in stock.
*   Print a pick list, either collectively or as individual orders.
*   After picking, select the same order lines again and **update their status** to “Ready for Pickup”.

When the status is changed to _Ready for Pickup_, a notification is typically sent to the customer and the customer pick up deadline starts running.

* * *

### [Manual Cancellation](#manual-cancellation)

If a Click and Collect order is not picked up within the specified pickup deadline, it is flagged as **Urgent** in Omnium.

When urgent orders exist, an **orange button** will appear in the Click and Collect list. Clicking this button filters the list to show only the urgent orders.

To cancel order lines:

1.  Select the rows to be canceled.
2.  Click **Update Status**.
3.  Choose **Cancel Order Lines**.

As part of the cancellation workflow, it's important to:

*   **Release the reservation** or **increase the inventory**—depending on whether inventory was deducted at the time of picking.
*   **Notify the customer** that the order lines have been canceled.

[

Previous

Verbose Logging

](/docs/Order/order-logging/verbose-logging)[

Next

API Reference

](/docs/Order/Returns/return-api)

---


## FAQ

[Order](/docs/Order)

# FAQ

Common questions about the Order API.


## [Adding orders](#adding-orders)

### [Why is the order status set to "Queued" sometimes?](#why-is-the-order-status-set-to-queued-sometimes)

When a new order is processed for the first time, the order is enqueued in our internal queue system. The order status will then briefly be set to "Queued". In most cases, the order will only have this status for a second or two, depending on the complexity of your workflow. When an order is queued, you should _not_ try to update the order, but await until the order processing has completed.

* * *

### [Why are there order lines on both shipments and the order form?](#why-are-there-order-lines-on-both-shipments-and-the-order-form)

Usually, all order lines would have been added to shipments, but not always. There are a few edge cases, such as when order lines are reallocated or when a user is managing shipments on an order.

* * *

### [What about total amounts? And what's up with the "calculated" values I can see in the Swagger documentation?](#what-about-total-amounts-and-whats-up-with-the-calculated-values-i-can-see-in-the-swagger-documentation)

All totals (Total, NetTotal, SubTotal, TaxTotal, etc.) are calculated by Omnium, which is why you do not need to include them in the request to add an order. The same goes for the calculated order line amounts, such as ExtendedPrice. As you can see in the [basic example for creating an order](/docs/Order/order-api#example-creating-an-order), only the PlacedPrice is set, which is the price per unit without any discounts.

* * *

### [What is "code" on order lines?](#what-is-code-on-order-lines)

"Code" should reference a SKU. The following properties should all reference the same value:

*   Product/Variant → "Sku"
*   Order Line → "Code"
*   Inventory → "VariantCode"

* * *

### [Shipping, shipment - what is the difference?](#shipping-shipment---what-is-the-difference)

Shipping refers to the freight information, while the shipment refers to the delivery, which contains all order lines and shipping information.

* * *

### [What is the difference between a warehouse and a store?](#what-is-the-difference-between-a-warehouse-and-a-store)

A warehouse is, in fact, a store in Omnium. The difference is how it is referenced on the order. The store is the seller, and the warehouse is the sender, but they are the same type of entity.

* * *

### [Should I set the product name, cost, or other product-related data on the order line while adding the order?](#should-i-set-the-product-name-cost-or-other-product-related-data-on-the-order-line-while-adding-the-order)

You could set it, but if you have already imported your product catalog to Omnium, the order lines will automatically be enriched and populate properties related to the product. If you do set it, Omnium will not override it.

* * *


## [Updating orders](#updating-orders)

### [There seem to be a lot of endpoints that I could use to update an order. Why not just use "UpdateOrder" for everything?](#there-seem-to-be-a-lot-of-endpoints-that-i-could-use-to-update-an-order-why-not-just-use-updateorder-for-everything)

Using specialized endpoints is encouraged as there could be event subscribers for those specific operations. It will also provider a better overview of changes done to an order. Some endpoint will also simplify how you would add information, which should be descibed in the endpoint swagger documentation.

* * *


## [Configuration](#configuration)

### [Why are the Payment and Shipment tabs missing on the order details page?](#why-are-the-payment-and-shipment-tabs-missing-on-the-order-details-page)

This usually happens when the `enableEdit` setting is set to `false` for the order type.

**How to fix it:**

1.  Go to `Configuration → Order Types → [Your Order Type]`
2.  Set `enableEdit` to `true`
3.  Save and publish your changes

Once this setting is enabled, the **Payment** and **Shipment** tabs will be visible on the order details page.

* * *

[

Previous

Complete Shipment

](/docs/Order/Returns/return-workflow-steps/shipments/complete-shipment)[

Next

Carts

](/docs/Carts)

---


## Order Guide

[Order](/docs/Order)

# Order Guide

Conceptual guide to working with orders in Omnium. Covers the order model, payments, discounts, pricing, order types, and common integration patterns.


## [Introduction to Omnium Orders](#introduction-to-omnium-orders)

An order in Omnium could originate from any sales channel and operate and behave in different ways. For instance, it could be an order placed from a web shop, a sale from POS, or a click-and-collect reservation. As a modern order management system, Omnium accepts all types of orders, and offers customizable workflows for all kinds.

In this section you’ll (hopefully) learn everything you need to know to get started importing, managing and reading orders using Omnium’s API.

* * *


## [Order properties](#order-properties)

When working with the Order API, the same model is used for adding, updating and fetching orders.

### [Crucial properties](#crucial-properties)

**ID**  
The ID of the order must be unique. If you want Omnium to generate an order number, this is possible using the X API when adding orders. Customer ID: This is usually set to the customer’s phone number, email or ID from an external system. We accept everything, but try avoid 'special characters' such as '+' or '%'.

**MarketId**  
The order must have a market ID which corresponds to a market added to Omnium. A market would typically be “Epic Enterprise Norway”, which would contain stores such as “Epic Enterprise Webshop” and “Epic Enterprise Store New York”. Markets are not entities that are added to Omnium, but settings that are configured.  

**StoreId**  
The order must also have a “StoreId” set which corresponds to a store in Omnium. The StoreId should represent the selling store. Unlike markets, stores are entities that are created or imported to Omnium.  

**OrderType**  
The OrderType must be set to a corresponding OrderType defined in the Omnium configuration, which will ensure the correct workflow is executed when the order is processed.  

**Status**  
The order status defines the current state of the order and should also match a status defined for the current OrderType. Typically, this would be set to "New" for orders that has yet been processed (not yet shipped for instance, and/or payment has not been captured).  

**Complete model**

The full order model definition can be found in [swagger](https://api.omnium.no/documentation/index.html#/model-OmniumOrder).


## [OrderForm and LineItems(Order Lines)](#orderform-and-lineitemsorder-lines)

Each order contains an order form. The order form contains lists of order lines, payments and shipments. LineItems is a list of order lines, each order line contains price(s), quantity, product data and various meta data.

### [Shipments](#shipments)

The order form contains one or multiple shipments. A shipment contains shipping information and order lines. An order will usually only contain a single shipment, but for partial deliveries or multiple senders or recipients, there will be multiple shipments. A shipment contains one or multiple order lines, and an order line cannot be added to multiple shipments. A shipment must also contain a "warehouseCode". This should be set to the ID of a store in Omnium that is the shipment sender.

### [Payments](#payments)

For every order, there should be a payment corresponding to the total amount of the order. Most commonly, an order will be sent to Omnium after the order has been placed from an e-commerce site. That means that the payment should already be authenticated in the payment provider (such as Klarna, Paypal or Vipps). Omnium will then be able to void, capture or credit the payment later on in the order process.

For an overview of supported payment providers and integration setup, see [Payments](/docs/plugins/Payments).

#### [Key Concepts](#key-concepts)

*   **Omnium does not provide a checkout widget.** Your **frontend application** is responsible for integrating directly with the payment provider (using their SDK, redirect, or widget).
    
*   **Omnium stores and manages payment records.** Once the provider has authorized the transaction, you must attach the payment details to the cart in Omnium.
    
*   **Omnium executes post-order operations.** After the order is created, Omnium can capture, refund, or void the payment through the configured provider integration.
    

#### [Checkout Flow](#checkout-flow)

The checkout flow typically looks like this:

1.  **Customer completes checkout** in your storefront.
2.  **Frontend initiates payment** with the chosen provider.
3.  **Provider returns transaction details** such as transaction ID, amount, and status.
4.  **Frontend calls Omnium APIs** to build the cart:
    *   `AddPaymentToCart`
    *   `AddShipmentToCart`
    *   `AddCustomer`
    *   `AddStore`
5.  **Cart is placed as an order** in Omnium.
6.  **Omnium can later capture, refund, or void** the payment.

#### [Adding a Payment to a Cart](#adding-a-payment-to-a-cart)

Once the provider confirms the payment, you must register it in Omnium.

**Endpoint**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Carts/{cartId}/AddPayment

**Example payload**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "amount": 2070,
      "paymentMethodName": "Dintero",
      "paymentType": "Dintero",
      "status": "Processed",
      "transactionId": "T13456746.5zfEvTWmkBBjw6fTYSEE",
      "transactionType": "Authorization"
    }

#### [Payment Properties](#payment-properties)

Property

Type

Description

Information

PaymentMethodName

string

Value to identify correct payment provider ("Klarna" for instance)

Required

TransactionId

string

Unique id for this payment (from payment provider)

Required

TransactionType

string

"Authorization", "Captured", "Credit", "Invoiced", "ReleaseRemainingAuthorization" or "Invoiced"

Required

Status

string

"Processed" when successful, and "Failed" on unsuccessful

Required

Amount

decimal

The amount for this payment transaction

Required

#### [Multiple Payments](#multiple-payments)

An order can have multiple payment transactions. Common scenarios include:

*   **Gift card + credit card**: Customer pays partially with a gift card and the rest with a credit card
*   **Split payments**: Payment split across multiple methods (e.g., invoice + card)
*   **Bonus points + card**: Customer uses loyalty points for part of the purchase

When an order has multiple payments:

1.  Payments are stored in a list (`orderForm.payments`)
2.  During capture, Omnium processes payments **in the order they appear in the list**
3.  For refunds, Omnium typically credits back to the original payment methods

**Example: Gift Card + Klarna**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "orderForm": {
        "payments": [
          {
            "amount": 100,
            "paymentMethodName": "GiftCard",
            "transactionId": "GC-12345",
            "transactionType": "Authorization",
            "status": "Processed"
          },
          {
            "amount": 899,
            "paymentMethodName": "Klarna",
            "transactionId": "klarna-order-abc123",
            "transactionType": "Authorization",
            "status": "Processed"
          }
        ]
      }
    }

#### [Transaction Types](#transaction-types)

Understanding transaction types is essential for managing payments correctly.

**Common Transaction Types (for API consumers)**

Type

Description

When to use

`Authorization`

Payment is reserved but not yet charged

E-commerce checkout - initial payment

`Capture`

Payment has been charged from customer

When order is shipped/fulfilled

`Sale`

Immediate capture (no separate authorization)

**POS/in-store orders** where payment is taken immediately

`Credit`

Refund back to customer

Returns, cancellations, or partial refunds

`Invoiced`

Invoice-based payment

Klarna invoice, Walley invoice, etc.

`Void`

Authorization cancelled

When cancelling an order before capture

**Internal Transaction Types (set by Omnium)**

These are typically set by Omnium internally and not by API consumers:

Type

Description

`AwaitingAuthorization`

Used for paylinks and in-store payments waiting for customer to complete payment

`ReleaseRemainingAuthorization`

When releasing unused authorization after partial capture

`Settlement` / `SettlementFee` / `SettlementRefund`

Provider settlement and reconciliation transactions

`Bookkeeping` / `CreditBookkeeping`

Internal accounting transactions

**POS vs E-commerce**

**POS / In-store orders:**

*   Use `transactionType: "Sale"` - payment is captured immediately at point of sale
*   No separate authorization/capture flow needed

**E-commerce orders:**

*   Use `transactionType: "Authorization"` when registering the payment from checkout
*   Omnium workflows automatically handle `Capture`, `Credit`, and `Void` based on order status changes

**Payment Lifecycle**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    Customer pays → Authorization → Order shipped → Capture → (Optional) Refund/Credit

1.  **Authorization**: Payment provider reserves funds on customer's account
2.  **Capture**: When you ship the order, Omnium captures (charges) the payment
3.  **Credit**: If customer returns items, Omnium can issue a refund

**Important**: Authorizations expire! Most providers allow 7-30 days before the authorization expires. Check `authorizationExpires` field.

#### [Payment API Endpoints](#payment-api-endpoints)

**On Cart (before order is created)**

Endpoint

Method

Description

`/api/Carts/{id}/AddPayments`

PUT

Add or update payments on cart

`/api/Carts/{id}/RemovePayments`

PUT

Remove payments from cart

`/api/Carts/{id}/GetPaymentOptions`

GET

Get available payment methods for the cart's market

**On Order (after order is created)**

Endpoint

Method

Description

`/api/Orders/{id}/AddPayments`

POST

Add new payments to an existing order

`/api/Orders/{id}/PutPayments`

PUT

Replace all payments on an order

`/api/Orders/{id}/GetPaymentOptions`

GET

Get available payment methods

**Which Endpoint Should I Use?**

*   **Adding payment during checkout**: Use `PUT /api/Carts/{id}/AddPayments`
*   **Need to update payment after order is created**: Use `POST /api/Orders/{id}/AddPayments`
*   **Need to completely replace payment list**: Use `PUT /api/Orders/{id}/PutPayments`

#### [In-Store Payments and Paylinks](#in-store-payments-and-paylinks)

Many Omnium payment integrations also support **in-store payments**. This is typically done by generating a **paylink**, which is sent to the customer so they can complete the payment on their own device.

Paylinks are most commonly used for:

*   Payments over the phone
*   Offsite payments where the customer is not physically present

For **web checkouts**, the approach is different:

*   Your website must implement the full checkout flow with the provider.
*   You must also handle the provider's authorization callback before registering the payment in Omnium.


## [Discount](#discount)

Omnium supports a flexible discount system that allows you to apply discounts at different levels (order, line item, shipping) and in different ways (fixed amount, percentage, multi-buy offers, etc.).

### [Ways to Add Discounts](#ways-to-add-discounts)

There are three main approaches to adding discounts:

Approach

Where

Use case

**Simple**

`lineItem.discounted`

Quick, flat discount amount on a single order line

**Advanced**

`orderForm.discounts[]`

Order-level or line-item discounts with full control (%, fixed, multi-buy, etc.)

**Shipping**

`shipment.discounts[]`

Free shipping or reduced shipping cost

**Simple Discount:** Set the `discounted` property directly on an order line. This is the easiest way to apply a flat discount to a specific product. The `discounted` value is the total discount amount for that line item.

**Advanced Discount:** Add discount objects to the `orderForm.discounts` array. This gives you full control over:

*   Discount type (order-level vs. line-item)
*   Reward type (percentage, fixed amount, multi-buy, fixed price bundles)
*   Which SKUs the discount applies to
*   Priority and stacking rules

**Shipment-Specific Discount:** Add discount objects to `shipment.discounts`. Typically used for "free shipping" promotions.

### [Reward Types](#reward-types)

The reward type determines how `discountValue` is interpreted:

Value

Type

Description

Example

0

None

No reward

\-

1

Money

Fixed monetary discount

`discountValue: 50` = 50 NOK off

2

Percentage

Percentage off

`discountValue: 20` = 20% off

3

Free

Item is free (100% off)

Typically `discountValue: 100`

4

FixedPrice

Multiple items for a fixed total

"4 items for 99" - use `promotionFixedPriceReward`

5

Gift

Free gift included

\-

6

MultiBuys

Buy X get Y free/discounted

"3 for 2" - use `promotionMultiBuyReward`

7

Kit

Set discount

Buy one from each group A, B, C - get discount on the set

### [Discount Types](#discount-types)

The discount type determines what the discount applies to:

Value

Type

Description

0

None

No specific type

1

LineItem

Applies to specific order lines (use `skuIds` to specify which)

2

Order

Applies to the entire order total

3

Shipping

Applies to shipping cost (add to `shipment.discounts`)

4

Manual

Manually added discount (from UI)

5

BonusPoints

Paid with customer club bonus points

### [Priority and Combining Discounts](#priority-and-combining-discounts)

When multiple discounts exist, use the `priority` field to control the order of application:

*   Lower values are applied first (0 = highest priority, applied first)
*   This is important because earlier discounts affect the base for later percentage calculations

Use `canBeCombinedWithOtherPromotions` to control whether discounts can stack:

*   `true`: This discount can stack with other promotions
*   `false`: This discount may exclude other discounts (depending on configuration)

Use `alwaysApply: true` for discounts that should never be blocked by exclusivity rules.

* * *

### [Examples](#examples)

#### [Simple: Discounted Order Line](#simple-discounted-order-line)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "lineItems": [
      {
        "lineItemId": "1",
        "code": "0123ABC",
        "placedPrice": 200.0,
        "quantity": 1.0,
        "discounted": 20.0,
        "taxRate": 25
      }
    ]

#### [Advanced: 20% Order-Level Discount](#advanced-20-order-level-discount)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "orderForm": {
      "discounts": [
        {
          "discountType": "Order",
          "discountName": "Splendid discount! 60 percent discount!",
          "discountValue": 60,
          "rewardType": "Percentage"
        }
      ]
    }

#### [Advanced: $10 Order-Level Discount](#advanced-10-order-level-discount)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "orderForm": {
      "discounts": [
        {
          "discountType": "Order",
          "discountName": "Ten bucks off!",
          "discountValue": 10,
          "rewardType": "Money"
        }
      ]
    }

#### [Advanced: Fixed Price Order Line Discount](#advanced-fixed-price-order-line-discount)

All items involved in the fixed price promotion should be added to the list `skuIds`. The promotion calculator will prioritize items from highest to lowest price.

If the setting `SplitMultibuyPromotionOrderLines` is true, the order lines involved in the promotion will be split to have `quantity = 1` per order line.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "orderForm": {
      "discounts": [
        {
          "discountType": "LineItem",
          "discountName": "4 items for 99.90",
          "rewardType": "FixedPrice",
          "skuIds": ["sku-1", "sku-2"],
          "promotionFixedPriceReward": {
            "fixedPriceQuantity": 4,
            "fixedPricePrice": 99.90
          }
        }
      ]
    }

#### [Advanced: 3 for 2 Order Line Discount](#advanced-3-for-2-order-line-discount)

All items involved in the multi-buys promotion should be added to the list `skuIds`. By default, the promotion calculator will prioritize items from lowest to highest price. This can be changed with the setting `SortMultibuyItemsDescending`.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "orderForm": {
      "discounts": [
        {
          "discountType": "LineItem",
          "discountName": "3 for 2 bikes!",
          "rewardType": "MultiBuys",
          "skuIds": ["sku-1", "sku-2"],
          "promotionMultiBuyReward": {
            "requiredBuyAmount": 2,
            "numberOfDiscountedItems": 1,
            "percentage": 100
          }
        }
      ]
    }

#### [Advanced: Combination of Fixed Price and Percentage Order Line Discounts](#advanced-combination-of-fixed-price-and-percentage-order-line-discounts)

Order the discounts from highest priority.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "orderForm": {
      "discounts": [
        {
          "discountType": "LineItem",
          "discountName": "4 items for 99.90",
          "rewardType": "FixedPrice",
          "skuIds": ["sku-1", "sku-2"],
          "promotionFixedPriceReward": {
            "fixedPriceQuantity": 4,
            "fixedPricePrice": 99.90
          }
        },
        {
          "discountType": "LineItem",
          "discountName": "Fifty percent discount!",
          "discountValue": 50,
          "rewardType": "Percentage",
          "skuIds": ["sku-1"]
        }
      ]
    }

#### [Shipping Discount](#shipping-discount)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "orderForm": {
      "shipments": [
        {
          "discounts": [
            {
              "discountType": "Shipping",
              "discountName": "Free shipping 4 you!",
              "discountValue": 100,
              "rewardType": "Percentage"
            }
          ]
        }
      ]
    }
