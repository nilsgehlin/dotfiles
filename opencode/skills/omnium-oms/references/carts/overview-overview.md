# Carts — Checkout, Offers & Validation — [Overview](#overview)

## [Overview](#overview)

Omnium provides the following built-in cart validators. Each validator implements the `IValidator<IOrder>` interface and is registered as a connector. To enable a validator, add it to the **Connectors** section in tenant settings with the `IValidator` implementation.

Validator

Connector ID

Description

[Active Products](/docs/Carts/validation/cart-validators/active-products-validator)

`activeProductsValidator`

Ensures all products in the cart are active

[Credit Limit](/docs/Carts/validation/cart-validators/credit-limit-validator)

`creditLimitValidator`

Validates customer credit availability

[Discount](/docs/Carts/validation/cart-validators/discount-validator)

`discountValidator`

Validates discount configuration

[Inactive Customer](/docs/Carts/validation/cart-validators/inactive-customer-validator)

`inactiveCustomerValidator`

Blocks checkout for inactive customers

[Inventory](/docs/Carts/validation/cart-validators/inventory-validator)

`inventoryValidator`

Validates stock availability across warehouses

[Inventory ATP](/docs/Carts/validation/cart-validators/inventory-atp-validator)

`inventoryAtpValidator`

Validates availability using Available-to-Promise data

[Null Price](/docs/Carts/validation/cart-validators/null-price-validator)

`nullPriceValidator`

Ensures all line items have a non-zero price

[Payments](/docs/Carts/validation/cart-validators/payments-validator)

`paymentsValidator`

Validates that payment amounts match the order total

[Pricat ID](/docs/Carts/validation/cart-validators/pricat-id-validator)

`priCatIdValidator`

Validates Pricat IDs on pre-orders

[Promotion Coupon](/docs/Carts/validation/cart-validators/promotion-coupon-validator)

`promotionCouponValidator`

Validates and removes invalid coupon codes

[Recalculate Cart Prices](/docs/Carts/validation/cart-validators/recalculate-cart-prices-validator)

`recalculateCartPricesValidator`

Recalculates line item prices from current product data

[Required Fields](/docs/Carts/validation/cart-validators/required-fields-validator)

`RequiredFieldsValidator`

Ensures required order fields are populated

[Sales Limitation](/docs/Carts/validation/cart-validators/sales-limitation-validator)

`salesLimitationValidator`

Enforces product sales restrictions per customer and market

[Shipment](/docs/Carts/validation/cart-validators/shipment-validator)

`shipmentValidator`

Ensures at least one shipment is selected


## [Connector configuration](#connector-configuration)

To enable a built-in validator, add it to the `connectors` array in tenant settings:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "name": "inventoryValidator",
      "implementations": ["IValidator"],
      "disableStandardErrorPolicy": false
    }

Some validators accept additional configuration via the `properties` array. Refer to each validator's page for details.

[

Previous

Validation

](/docs/Carts/validation)[

Next

Active Products Validator

](/docs/Carts/validation/cart-validators/active-products-validator)