# Carts — API Endpoints

See `schemas/carts.md` for field definitions.

## Contents

### Carts | Add

- `PUT /api/Cart/OrderLines/CreateCart`
- `POST /api/Cart/AddProductOptionsItemToCart`
- `POST /api/Cart/AddItemToCart`
- `POST /api/Cart/AddItemsToCart`
- `POST /api/Cart/AddManyItemsToCart`
- `POST /api/Cart/AddPackageItemToCart`
- `POST /api/Cart/AddBundleToCart`
- `PUT /api/Cart/{cartId}/OrderLines`
- `POST /api/Cart/{cartId}/OrderLines/Add`
- `PUT /api/Cart/{cartId}/AddCustomer/{customerId}`

### Carts | Checkout

- `DELETE /api/Cart/{cartId}/DeleteShipments`
- `POST /api/Cart/{cartId}/Validate`
- `PUT /api/Cart/{cartId}/RecalculatePrices`
- `PUT /api/Cart/{cartId}/AddPayments`
- `PUT /api/Cart/{cartId}/RemovePayments`
- `PUT /api/Cart/{cartId}/AddShipments`
- `PUT /api/Cart/{cartId}/AddStore/{storeId}`
- `PUT /api/Cart/{cartId}/AddCouponCode/{couponCode}`
- `PUT /api/Cart/{cartId}/ApplyVoucher/{voucherId}`
- `POST /api/Cart/{cartId}/RemoveVoucherFromCart/{voucherId}`
- `PUT /api/Cart/{cartId}/AddPersonalDiscountCoupon/{couponId}`
- `DELETE /api/Cart/{cartId}/RemoveCouponCode/{couponCode}`
- `PUT /api/Cart/{cartId}/AddGiftCard/{giftCardCode}`
- `DELETE /api/Cart/{cartId}/RemoveGiftCard/{giftCardCode}`
- `POST /api/Cart/CreateOrderFromCart/{cartId}`
- `GET /api/Cart/{id}/GetShippingOptions`
- `GET /api/Cart/GetShippingOptionsByZipCode`
- `GET /api/Cart/{id}/GetPaymentOptions`
- `PUT /api/Cart/{cartId}/AddDiscount`
- `PUT /api/Cart/{cartId}/UpdateDiscounts`

### Carts | Get

- `GET /api/Cart/{cartId}`
- `GET /api/Cart/GetCartsByCustomer`
- `GET /api/Cart/GetCarts`

### Carts | Line Items

- `POST /api/Cart/{cartId}/OrderLines/SetQuantity/Sku/{skuId}/{quantity}`
- `POST /api/Cart/{cartId}/OrderLines/SetQuantity/OrderLineId/{orderLineId}/{quantity}`
- `POST /api/Cart/{cartId}/OrderLines/SetSelectedUnitQuantity/Sku/{skuId}/{selectedUnit}/{selectedUnitQuantity}`
- `POST /api/Cart/{cartId}/OrderLines/SetSelectedUnitQuantity/OrderLineId/{orderLineId}/{selectedUnit}/{selectedUnitQuantity}`
- `DELETE /api/Cart/{cartId}/OrderLines/{lineItemId}`

### Carts | Other

- `GET /api/Cart/GetAsPdf/{cartId}`
- `POST /api/Cart/{cartId}/PackageBreakdown`
- `POST /api/Cart/AddComment`

### Carts | Search

- `POST /api/Cart/Search`
- `POST /api/Cart/ScrollSearch`
- `GET /api/Cart/Scroll/{id}`

### Carts | Templates

- `GET /api/CartTemplate/{id}`
- `PUT /api/CartTemplate`
- `DELETE /api/CartTemplate`
- `POST /api/CartTemplate/Search`
- `POST /api/CartTemplate/CreateCartFromTemplate`

### Carts | Update

- `DELETE /api/Cart/{cartId}`
- `POST /api/Cart/CreateCart`
- `POST /api/Cart/{cartId}/UpdateComponentsInCart/orderLineId/{orderLineId}`
- `PUT /api/Cart`
- `PUT /api/Cart/{cartId}/RemoveCustomerFromCart`
- `PATCH /api/Cart/{cartId}/PatchCart`
- `POST /api/Cart/{cartId}/DeactivateCart`

---

## Carts | Add

### `PUT /api/Cart/OrderLines/CreateCart`

**Add item to new cart**

Operation ID: `CartCreateCartFromOrderLine`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | query | string | No | Market ID for new cart (using default if null) |

**Request body:** `OmniumOrderLine`

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/AddProductOptionsItemToCart`

**Add product options to cart with an existing order line.**

Operation ID: `CartAddProductOptionsItemToCart`

**Request body:** `OmniumAddProductOptionsRequest`

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/AddItemToCart`

**Add item to new or existing cart**

Operation ID: `CartAddItemToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | query | string | No | ID of existing cart. If null, new cart will be created |
| `skuId` | query | string | Yes | Product SKU id. (Required) |
| `quantity` | query | number (decimal) | No | Quantity to add. Defaults to 1 if not provided. If unitId is specified then this |
| `marketId` | query | string | No | Market ID for new cart - default market if null |
| `storeId` | query | string | No | Store ID for new cart - defaults to null |
| `customerId` | query | string | No | CustomerId for the new cart - defaults to null |
| `unitId` | query | string | No | EAN for product unit - If set then the quantity will refer to the unit's quantit |
| `forceNewOrderLine` | query | boolean | No | If set to true, a new order line will be created even if there is an existing or |
| `priceStoreId` | query | string | No | Only use when buying from a store with a higher unit price than the default pric |
| `allowNoPriceItems` | query | boolean | No | Allow adding items without a price (they will get price = 0) |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/AddItemsToCart`

**Add items to new or existing cart**

Operation ID: `CartAddItemsToCart`

**Request body:** `OmniumCartUpdateRequest`

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/AddManyItemsToCart`

**Add many items to new or existing cart**

Operation ID: `CartAddManyItemsToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | query | string | No | ID of existing cart. If null, new cart will be created |
| `marketId` | query | string | No | Market ID for new cart - default market if null |
| `storeId` | query | string | No | Store ID for new cart - defaults to null |
| `customerId` | query | string | No | CustomerId for the new cart - defaults to null |
| `forceNewOrderLine` | query | boolean | No | If set to true, a new order line will be created even if there is an existing or |

**Request body:** `List<OmniumLineItemRequestModel>`

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/AddPackageItemToCart`

**Add item to new or existing cart**

Operation ID: `CartAddPackageItemToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | query | string | No | ID of existing cart. If null, new cart will be created |
| `skuId` | query | string | Yes | Product SKU id. (Required) |
| `quantity` | query | number (decimal) | No | Quantity to add. Defaults to 1 if not provided. |
| `marketId` | query | string | No | Market ID for new cart - default market if null |
| `storeId` | query | string | No | Store ID for new cart - defaults to null |
| `customerId` | query | string | No | CustomerId for the new cart - defaults to null |
| `forceNewOrderLine` | query | boolean | No | If set to true, a new order line will be created even if there is an existing or |
| `priceStoreId` | query | string | No | Only use when buying from a store with a higher unit price than the default pric |

**Request body:** `List<OmniumProductComponent>`

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/AddBundleToCart`

**Add bundle to new or existing cart**

Operation ID: `CartAddBundleToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | query | string | No | ID of existing cart. If null, new cart will be created |
| `skuId` | query | string | Yes | Bundle skuId (Required) |
| `quantity` | query | number (decimal) | No | Quantity to add. Defaults to 1 if not provided. |
| `marketId` | query | string | No | Market ID for new cart - default market if null |
| `storeId` | query | string | No | Store ID for new cart - defaults to null |
| `customerId` | query | string | No | CustomerId for the new cart - defaults to null |
| `forceNewOrderLine` | query | boolean | No | If set to true, a new order line will be created even if there is an existing or |
| `priceStoreId` | query | string | No | Only use when buying from a store with a higher unit price than the default pric |

**Request body:** `List<OmniumProductComponent>`

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/OrderLines`

**Add order line to cart**

Operation ID: `CartAddOrderLineToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes |  |
| `forceNewOrderLine` | query | boolean | No |  |

**Request body:** `OmniumOrderLine`

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/{cartId}/OrderLines/Add`

**Add item to existing cart**

Operation ID: `CartAddItemToExistingCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. If null, new cart will be created |
| `skuId` | query | string | Yes | Product SKU id. (Required) |
| `quantity` | query | number (decimal) | No | Quantity to add. Defaults to 1 if not provided. |

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/AddCustomer/{customerId}`

**Add customer ID to existing cart**

Operation ID: `CartAddCustomerIdToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |
| `customerId` | path | string | Yes | Customer ID to add to cart. (Required) |
| `enrichCart` | query | boolean | No | If true, the customer name and contact info is added to cart |
| `isPriceRecalculated` | query | boolean | No | If true, prices will be recalculated based on customer ID. If false, prices will |
| `customerSpecificPrices` | query | boolean | No | If true, customer specific prices customer specific prices will replaces the cur |

**Response 200:** `OmniumCart`

---

## Carts | Checkout

### `DELETE /api/Cart/{cartId}/DeleteShipments`

**Delete shipments from cart**

Operation ID: `CartDeleteShipments`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID |

**Request body:** `array`

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/{cartId}/Validate`

**Validate cart**

Operation ID: `CartValidate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID for the cart to validate |

**Response 200:** `OmniumCartOmniumValidationResult`

---

### `PUT /api/Cart/{cartId}/RecalculatePrices`

**Recalculate prices**

Operation ID: `CartRecalculatePrices`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID |

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/AddPayments`

**Add payments to existing cart**

Operation ID: `CartAddPaymentToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |
| `overwriteExisting` | query | boolean | No | Indicates whether to overwrite existing payments. Defaults to true. If true, rep |

**Request body:** `List<OmniumPayment>`

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/RemovePayments`

**Remove payments from existing cart**

Operation ID: `CartRemovePaymentsFromCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |

**Request body:** `OmniumPaymentFilters`

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/AddShipments`

**Add shipments to existing cart**

Operation ID: `CartAddShipmentsToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |

**Request body:** `List<OmniumShipment>`

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/AddStore/{storeId}`

**Add store to cart**

Operation ID: `CartAddStoreToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `storeId` | path | string | Yes | Store selling the products |

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/AddCouponCode/{couponCode}`

**Adding coupon code to cart and recalculates discounts**

Operation ID: `CartAddCouponCodeToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `couponCode` | path | string | Yes | Coupon code to add |

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/ApplyVoucher/{voucherId}`

**Applying voucher to cart - A payment with the corresponding value will be added to the cart.**

Operation ID: `CartApplyVoucher`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `voucherId` | path | string | Yes | Id of voucher to apply |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/{cartId}/RemoveVoucherFromCart/{voucherId}`

**Removing a voucher from the cart making the voucher available for use again.**

Operation ID: `CartRemoveVoucherFromCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `voucherId` | path | string | Yes | Id of voucher to remove |

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/AddPersonalDiscountCoupon/{couponId}`

**Adding personal discount coupon to cart by unique coupon Id and recalculates discounts**

Operation ID: `CartAddPersonalDiscountCouponToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `couponId` | path | string | Yes | Coupon code to add |

**Response 200:** `OmniumCart`

---

### `DELETE /api/Cart/{cartId}/RemoveCouponCode/{couponCode}`

**Removes coupon code from cart and recalculates discounts**

Operation ID: `CartRemoveCouponCodeFromCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `couponCode` | path | string | Yes | Coupon code to remove |

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/AddGiftCard/{giftCardCode}`

**Add gift card payment to cart**

Operation ID: `CartAddGiftCardToCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `giftCardCode` | path | string | Yes | Gift card code to use for payment |
| `giftCardPin` | query | string | No | Gift card PIN, if required, along with the code provided by the gift card provid |

**Response 200:** `OmniumCart`

---

### `DELETE /api/Cart/{cartId}/RemoveGiftCard/{giftCardCode}`

**Remove gift card payment from cart**

Operation ID: `CartRemoveGiftCardFromCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID to update |
| `giftCardCode` | path | string | Yes | Gift card code to remove |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/CreateOrderFromCart/{cartId}`

**Create order from cart**

Operation ID: `CartCreateOrderFromCartId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes |  |
| `orderType` | query | string | No | Order type to create (Pos, Online, ClickAndCollect, etc) |

**Response 200:** `OmniumOrder`

---

### `GET /api/Cart/{id}/GetShippingOptions`

**Get valid shipping options for a cart.**

Operation ID: `CartGetShippingOptions`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Cart id |
| `postalCode` | query | string | No | Consignee/receivers postalCode |

**Response 200:** `List<OmniumShippingOption>`

---

### `GET /api/Cart/GetShippingOptionsByZipCode`

**Get valid shipping options for a zip/postal code.**

Operation ID: `CartGetShippingOptionsByZipCode`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | query | string | No | market id |
| `postalCode` | query | string | No | Consignee/receivers postalCode |

**Response 200:** `List<OmniumShippingOption>`

---

### `GET /api/Cart/{id}/GetPaymentOptions`

**Get valid payment options for a cart.**

Operation ID: `CartGetPaymentOptions`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Cart id |

**Response 200:** `List<OmniumPaymentOption>`

---

### `PUT /api/Cart/{cartId}/AddDiscount`

**Add discount to cart**

Operation ID: `CartAddDiscount`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID |

**Request body:** `OmniumDiscount`

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/UpdateDiscounts`

**Replacing discounts on cart**

Operation ID: `CartUpdateDiscounts`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart ID |

**Request body:** `List<OmniumDiscount>`

**Response 200:** `OmniumCart`

---

## Carts | Get

### `GET /api/Cart/{cartId}`

**Get cart by ID**

Operation ID: `CartGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes |  |

**Response 200:** `OmniumCart`

---

### `GET /api/Cart/GetCartsByCustomer`

**Get carts by customer ID**

Operation ID: `CartGetCartsByCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | Yes |  |

**Response 200:** `OmniumCartOmniumSearchResult`

---

### `GET /api/Cart/GetCarts`

**Returns a list of carts, support paging**

Operation ID: `CartGetCarts`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `storeIds` | query | array | No | List of store IDs |
| `changedSince` | query | string (date-time) | No | Filter on changed date(UTC) |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1.(default is 20) |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1(default is 1) |

**Response 200:** `OmniumCartOmniumSearchResult`

---

## Carts | Line Items

### `POST /api/Cart/{cartId}/OrderLines/SetQuantity/Sku/{skuId}/{quantity}`

**Update quantity on cart order line by skuId / code**

Operation ID: `CartUpdateCartQuantityBySku`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |
| `skuId` | path | string | Yes | Product SKU id. (Required) |
| `quantity` | path | number (decimal) | Yes | Quantity to set. Defaults to 0 if less than 0. (Required) |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/{cartId}/OrderLines/SetQuantity/OrderLineId/{orderLineId}/{quantity}`

**Update quantity on cart order line by order line ID**

Operation ID: `CartUpdateCartQuantityByOrderLineId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |
| `orderLineId` | path | string | Yes | Order line ID. (Required) |
| `quantity` | path | number (decimal) | Yes | Quantity to set. Defaults to 0 if less than 0. (Required) |
| `keepPrice` | query | boolean | No | If false, the price will be updated to the current product price. If true, the c |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/{cartId}/OrderLines/SetSelectedUnitQuantity/Sku/{skuId}/{selectedUnit}/{selectedUnitQuantity}`

**Update selected unit quantity on cart order line by skuId / code**

Operation ID: `CartUpdateCartSelectedUnitQuantityBySku`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |
| `skuId` | path | string | Yes | Product SKU id. (Required) |
| `selectedUnit` | path | string | Yes | Selected unit of measure (Required) |
| `selectedUnitQuantity` | path | number (decimal) | Yes | Quantity to set. Defaults to 0 if less than 0. (Required) |
| `selectedUnitConversionFactor` | query | number (decimal) | No | Conversion factor between selected unit of measure and default UOM (Default is 1 |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/{cartId}/OrderLines/SetSelectedUnitQuantity/OrderLineId/{orderLineId}/{selectedUnit}/{selectedUnitQuantity}`

**Update selected unit quantity on cart order line by order line ID**

Operation ID: `CartUpdateCartSelectedUnitQuantityByOrderLineId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |
| `orderLineId` | path | string | Yes | Order line ID. (Required) |
| `selectedUnit` | path | string | Yes | Selected unit of measure (Required) |
| `selectedUnitQuantity` | path | number (decimal) | Yes | Quantity to set. Defaults to 0 if less than 0. (Required) |
| `selectedUnitConversionFactor` | query | number (decimal) | No | Conversion factor between selected unit of measure and default UOM (Default is 1 |
| `keepPrice` | query | boolean | No | If false, the price will be updated to the current product price. If true, the c |

**Response 200:** `OmniumCart`

---

### `DELETE /api/Cart/{cartId}/OrderLines/{lineItemId}`

**Delete item from cart**

Operation ID: `CartDeleteLineItem`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `lineItemId` | path | string | Yes |  |
| `cartId` | path | string | Yes |  |
| `deleteComponents` | query | boolean | No | If the order line you're deleting is a package or bundle, set deleteComponents t |

**Response 200:** `OmniumCart`

---

## Carts | Other

### `GET /api/Cart/GetAsPdf/{cartId}`

**Get cart as PDF**

Operation ID: `CartGetAsPdf`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart (required) |
| `templateReference` | query | string | No | Template reference including full path and extension (ex "Folder/CustomOffer.jso |

**Response 200:** `string`

---

### `POST /api/Cart/{cartId}/PackageBreakdown`

**Break down packages or bundle in cart. All components will be added as separate order lines.**

Operation ID: `CartPackageBreakdown`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes |  |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/AddComment`

**Add a comment to a cart, with the option to send SMS, email or both**

Operation ID: `CartAddComment`

**Request body:** `OmniumCartCommentRequest`

---

## Carts | Search

### `POST /api/Cart/Search`

**Search carts**

Operation ID: `CartSearch`

**Request body:** `OmniumCartSearchRequest`

**Response 200:** `OmniumCartOmniumSearchResult`

---

### `POST /api/Cart/ScrollSearch`

**Scroll carts by search**

Operation ID: `CartScrollSearch`

**Request body:** `OmniumCartSearchRequest`

**Response 200:** `OmniumCartOmniumSearchResult`

---

### `GET /api/Cart/Scroll/{id}`

**Scroll carts is used to get a large amount of carts.**

Operation ID: `CartScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumCartOmniumResult`

---

## Carts | Templates

### `GET /api/CartTemplate/{id}`

**Get cart template**

Operation ID: `CartTemplateGetCartTemplate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

**Response 200:** `OmniumCartTemplate`

---

### `PUT /api/CartTemplate`

**Add or update cart template**

Operation ID: `CartTemplateUpdateCartTemplate`

**Request body:** `OmniumCartTemplate`

**Response 200:** `OmniumCartTemplate`

---

### `DELETE /api/CartTemplate`

**Delete cart template**

Operation ID: `CartTemplateDeleteCartTemplate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartTemplateId` | query | string | No | The ID of the cart template |

---

### `POST /api/CartTemplate/Search`

**Search cart template orders**

Operation ID: `CartTemplateSearch`

**Request body:** `OmniumCartTemplateSearchRequestModel`

**Response 200:** `OmniumCartTemplateOmniumSearchResult`

---

### `POST /api/CartTemplate/CreateCartFromTemplate`

**Create cart from template**

Operation ID: `CartTemplateCreateCartFromTemplate`

**Request body:** `OmniumCartTemplateCreateCartRequest`

**Response 200:** `OmniumCartTemplate`

---

## Carts | Update

### `DELETE /api/Cart/{cartId}`

**Delete cart**

Operation ID: `CartDeleteCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes |  |

---

### `POST /api/Cart/CreateCart`

**Create new empty cart**

Operation ID: `CartCreateCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | query | string | No |  |

**Response 200:** `OmniumCart`

---

### `POST /api/Cart/{cartId}/UpdateComponentsInCart/orderLineId/{orderLineId}`

**Update bundle components in cart**

Operation ID: `CartUpdateComponentsInCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | Cart to update |
| `orderLineId` | path | string | Yes | Bundle order line id |

**Request body:** `List<OmniumProductComponent>`

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart`

**Save cart to Omnium.**

Operation ID: `CartSaveCart`

**Request body:** `OmniumCart`

**Response 200:** `OmniumCart`

---

### `PUT /api/Cart/{cartId}/RemoveCustomerFromCart`

**Removes a customer from cart. This will remove all customer related info like id, phone, e-mail and address.
Prices will also be recalculated**

Operation ID: `CartRemoveCustomerFromCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart (Required) |

**Response 200:** `OmniumCart`

---

### `PATCH /api/Cart/{cartId}/PatchCart`

**Patch cart - update only values in request**

Operation ID: `CartPatchCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of existing cart. (Required) |

**Request body:** `OmniumOrderPatch`

---

### `POST /api/Cart/{cartId}/DeactivateCart`

**Deactivate cart**

Operation ID: `CartDeactivateCart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes |  |

**Response 200:** `OmniumCart`

---
