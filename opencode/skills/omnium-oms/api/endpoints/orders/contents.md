# Orders — API Endpoints — Contents

## Contents

### Orders | Batch Updates

- `POST /api/Orders/Update`
- `PUT /api/Orders/Update`
- `POST /api/Orders/UpdateMany`
- `POST /api/Orders/AddMany`
- `POST /api/Orders/ImportMany`

### Orders | Click and Collect

- `GET /api/ClickAndCollect/GetOrdersForCustomer`
- `GET /api/ClickAndCollect/GetOrderForCustomer`
- `POST /api/ClickAndCollect/ExtendCustomerPickupDeadline`

### Orders | Get

- `GET /api/Orders/{id}`
- `GET /api/Orders/{id}/{versionId}`
- `GET /api/Orders/GetOrders`
- `GET /api/Orders/GetOrders/ByOrderType`
- `GET /api/Orders/GetOrdersForPickUpPoint`
- `GET /api/Orders/GetOrdersForCustomer`
- `GET /api/Orders/Customers/{customerId}/Orders`
- `GET /api/Orders/GetOrderForCustomer`

### Orders | Gift Cards

- `POST /api/GiftCard/Search`
- `POST /api/GiftCard/Scroll`
- `GET /api/GiftCard/Scroll/{id}`
- `GET /api/GiftCard/{code}`

### Orders | Invoices

- `GET /api/Invoices/Orders/{orderId}`

### Orders | Order Lines

- `PATCH /api/Orders/{orderId}/PatchUpdateOrderLines`
- `POST /api/Orders/{orderId}/OrderLines/{lineItemId}/Cancel`
- `POST /api/Orders/OrderLines/Cancel`
- `POST /api/Orders/{orderId}/OrderLines`
- `POST /api/Orders/{orderId}/AddManyOrderLines`
- `PUT /api/Orders/{orderId}/AddOrderLineProperties`

### Orders | Others

- `PUT /api/Orders/PosOrders`
- `GET /api/Orders/carts/{cartId}`
- `GET /api/Orders/secret/{secretKey}`
- `GET /api/Orders/GetOrders/Count`
- `GET /api/Orders/GetAsPdf/{orderId}`
- `HEAD /api/Orders/{id}/Exists`
- `POST /api/Orders/ExistMany`
- `POST /api/Orders/AddComment`
- `POST /api/Orders/ExportOrders`
- `POST /api/Orders/PatchLineItemIds`
- `POST /api/ZReport/GetOmniumZReports`

### Orders | Payments

- `PUT /api/Orders/{orderId}/AddPayments` *(deprecated)*
- `POST /api/Orders/{orderId}/AddPayments`
- `PUT /api/Orders/{orderId}/PutPayments`
- `GET /api/Orders/{id}/GetPaymentOptions`
- `POST /api/PaymentReport`
- `POST /api/PaymentReport/SearchPaymentTransactionsByDateAndPaymentMethod`

### Orders | Pick Lists

- `POST /api/PickList/Search`
- `GET /api/PickList/Get`
- `PATCH /api/PickList/PatchPickList`

### Orders | Returns

- `GET /api/Returns/Claims/ClaimTypes`
- `POST /api/Returns/{orderId}/UpdateStatus`
- `POST /api/Returns/SearchReturnOrders`
- `POST /api/Returns/{orderId}/Return`
- `POST /api/Returns/CreateReplacementOrder`
- `PATCH /api/Returns/{orderId}/{returnId}`

### Orders | Search

- `POST /api/Orders/Search`
- `POST /api/Orders/Scroll`
- `GET /api/Orders/Scroll/{id}`
- `POST /api/Orders/SearchByCustomProperties`
- `POST /api/Orders/Customers/{customerId}/Orders/Search`

### Orders | Shipments

- `PUT /api/OrderShipments/{orderId}`
- `PATCH /api/OrderShipments/{orderId}`
- `DELETE /api/OrderShipments/{orderId}/DeleteShipments`
- `PUT /api/OrderShipments/{orderId}/AddOrderLinesToShipment`

### Orders | Subscriptions

- `PUT /api/Subscriptions`
- `POST /api/Subscriptions`
- `POST /api/Subscriptions/Update`
- `GET /api/Subscriptions/{id}`
- `DELETE /api/Subscriptions/{id}`
- `POST /api/Subscriptions/Search`
- `POST /api/Subscriptions/CreatePendingOrders/{numberOfPendingOrders}`
- `POST /api/Subscriptions/{id}/CancelSubscription`

### Orders | Update

- `POST /api/Orders`
- `PUT /api/Orders`
- `PATCH /api/Orders/{orderId}/PatchOrder`
- `GET /api/Orders/GetOrders/ByIds`
- `DELETE /api/Orders/{orderId}`

### Orders | Workflow

- `POST /api/Orders/{orderId}/UpdateStatus`
- `POST /api/Orders/{orderId}/OrderLinesUpdate`
- `POST /api/Orders/{cartId}/processCartWorkflowTest/{status}`

---


## Orders | Batch Updates

### `POST /api/Orders/Update`

**Update an order.**

Operation ID: `OrdersUpdate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `runWorkflow` | query | boolean | No | If true, the workflow will be processed. |

**Request body:** `OmniumOrder`

**Response 200:** `OmniumOrderWorkflowExecutionResult`

---

### `PUT /api/Orders/Update`

**Put an order. CAUTION: overwriting existing order.**

Operation ID: `OrdersOverwrite`

**Request body:** `OmniumOrder`

**Response 200:** `OmniumOrderWorkflowExecutionResult`

---

### `POST /api/Orders/UpdateMany`

**Update a range of orders. Adds order if order does not already exist.**

Operation ID: `OrdersUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `runWorkflow` | query | boolean | No | If true, workflow will run based on order status. False, will only save updated  |

**Request body:** `List<OmniumOrder>`

---

### `POST /api/Orders/AddMany`

**Adds a range of new orders to the OMS. Does not overwrite existing orders.**

Operation ID: `OrdersAddMany`

**Request body:** `List<OmniumOrder>`

---

### `POST /api/Orders/ImportMany`

**Adds a range of orders to the OMS, without running workflows.**

Operation ID: `OrdersImportMany`

**Request body:** `List<OmniumOrder>`

---


## Orders | Click and Collect

### `GET /api/ClickAndCollect/GetOrdersForCustomer`

**Get Click and Collect orders for customer. Support paging**

Operation ID: `ClickAndCollectGetOrdersForCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | No | Customer ID |
| `phone` | query | string | No | Phone number |
| `email` | query | string | No | E-mail address |
| `storeId` | query | array | No | Store ID |
| `page` | query | integer (int32) | No | Page number. Minimum 1. Defaults to 1 |
| `pageSize` | query | integer (int32) | No | Max 100. Defaults to 20 |

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `GET /api/ClickAndCollect/GetOrderForCustomer`

**Get a click and collect order for a single customers**

Operation ID: `ClickAndCollectGetOrderForCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | No | The id of the customer |
| `orderId` | query | string | No | The id of the order |

**Response 200:** `OmniumOrder`

---

### `POST /api/ClickAndCollect/ExtendCustomerPickupDeadline`

**Extend the customer pickup deadline for a click and collect order**

Operation ID: `ClickAndCollectExtendCustomerPickupDeadline`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | query | string | Yes | The id of the order |
| `extendedPickupTime` | query | string | Yes | TimeSpan for which the customerPickupDeadline will be extended |

---


## Orders | Get

### `GET /api/Orders/{id}`

**Returns a single order**

Operation ID: `OrdersGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the order to return |

**Response 200:** `OmniumOrder`

---

### `GET /api/Orders/{id}/{versionId}`

**Get specific order version**

Operation ID: `OrderGetVersion`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Order ID |
| `versionId` | path | string | Yes | Version ID to fetch |

**Response 200:** `OmniumOrderOmniumVersion`

---

### `GET /api/Orders/GetOrders`

**Returns a list of orders, support paging**

Operation ID: `OrdersGetOrders`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `storeId` | query | array | No | ID for a store |
| `status` | query | array | No | Filter on status: New, InTransit, InProgress, ReadyForPickup, Completed, OrderCa |
| `changedSince` | query | string (date-time) | No | Filter on changed date(UTC) |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1.(default is 20) |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1(default is 1) |

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `GET /api/Orders/GetOrders/ByOrderType`

**Returns a list of orders filtered by order type, with support for paging.**

Operation ID: `OrdersGetOrdersByOrderType`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `storeId` | query | array | No | ID for a store |
| `status` | query | array | No | Filter on order status. Possible values: New, InTransit, InProgress, ReadyForPic |
| `orderTypes` | query | array | No | Filter on order type. Possible values: Online, POS, etc. |
| `changedSince` | query | string (date-time) | No | Filter on changed date(UTC) |
| `pageSize` | query | integer (int32) | No | Maximum number of results per page. Minimum 1, maximum 100 (default is 20). |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1(default is 1) |

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `GET /api/Orders/GetOrdersForPickUpPoint`

**Returns a list of orders, filtered by shipment pick-up point**

Operation ID: `OrdersGetOrdersForPickUpPoint`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `storeId` | query | array | No | ID for a store |
| `status` | query | array | No | Filter on status: New, InTransit, InProgress, ReadyForPickup, Completed, OrderCa |
| `changedSince` | query | string (date-time) | No | Filter on changed date(UTC) |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1.(default is 20) |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1(default is 1) |

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `GET /api/Orders/GetOrdersForCustomer`

**Returns a list of orders for a given customer. Search by id, phone or e-mail. Supports paging.**

Operation ID: `OrdersGetOrdersForCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | No | ID of the customer |
| `phone` | query | string | No |  |
| `email` | query | string | No |  |
| `storeId` | query | array | No |  |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `GET /api/Orders/Customers/{customerId}/Orders`

**Returns a list of orders for a given customer. Supports paging.**

Operation ID: `OrdersGetOrdersByCustomerId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | path | string | Yes | ID of the customer |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `GET /api/Orders/GetOrderForCustomer`

**Get order for a single customer**

Operation ID: `OrdersGetOrderForCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | No | The id of the customer |
| `orderId` | query | string | No | The id of the order |

**Response 200:** `OmniumOrder`

---


## Orders | Gift Cards

### `POST /api/GiftCard/Search`

**Search gift cards**

Operation ID: `GiftCardSearch`

**Request body:** `OmniumGiftCardSearchRequest`

**Response 200:** `OmniumGiftCardOmniumSearchResult`

---

### `POST /api/GiftCard/Scroll`

**Scroll gift cards by search**

Operation ID: `GiftCardScrollSearch`

**Request body:** `OmniumGiftCardSearchRequest`

**Response 200:** `OmniumGiftCardOmniumSearchResult`

---

### `GET /api/GiftCard/Scroll/{id}`

**Scroll gift card is used to get a large number of gift cards.**

Operation ID: `GiftCardScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumGiftCardOmniumResult`

---

### `GET /api/GiftCard/{code}`

**Get gift card by gift card code**

Operation ID: `GiftCardGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `code` | path | string | Yes |  |
| `marketId` | query | string | No |  |
| `giftCardPin` | query | string | No | Gift card PIN, if required, along with the code provided by the gift card provid |

**Response 200:** `OmniumGiftCard`

---


## Orders | Invoices

### `GET /api/Invoices/Orders/{orderId}`

**Get all invoices associated with order**

Operation ID: `InvoicesGetInvoicesByOrder`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order identification |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |
| `isPaid` | query | boolean | No | If the invoices are paid or not |

**Response 200:** `OmniumInvoiceOmniumSearchResult`

---


## Orders | Order Lines

### `PATCH /api/Orders/{orderId}/PatchUpdateOrderLines`

**Patch OrderLines - update only values in request**

Operation ID: `OrdersPatchOrderLine`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | ID of existing order. (Required) |

**Request body:** `List<OmniumOrderLinePatch>`

**Response 200:** `OmniumOrderLineUpdateResult`

---

### `POST /api/Orders/{orderId}/OrderLines/{lineItemId}/Cancel`

**Cancel order line**

Operation ID: `OrdersCancelOrderLine`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order ID (Required) |
| `lineItemId` | path | string | Yes | Order line ID (Required) |
| `sendNotifications` | query | boolean | No | If true, notification about cancellation is sent to customer |

**Response 200:** `OmniumOrder`

---

### `POST /api/Orders/OrderLines/Cancel`

**Cancel order lines (100 orders limit)**

Operation ID: `OrdersCancelOrderLines`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `sendNotifications` | query | boolean | No | If true, notification about cancellation is sent to customer |

**Request body:** `List<OmniumOrderLineIdRequest>`

**Response 200:** `integer`

---

### `POST /api/Orders/{orderId}/OrderLines`

**Add order line**

Operation ID: `OrdersAddOrderLine`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order ID (Required) |
| `shipmentId` | query | string | No |  |

**Request body:** `OmniumOrderLine`

**Response 200:** `OmniumOrder`

---

### `POST /api/Orders/{orderId}/AddManyOrderLines`

**Add many order lines**

Operation ID: `OrdersAddManyOrderLines`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order ID (Required) |
| `shipmentId` | query | string | No |  |

**Request body:** `List<OmniumOrderLine>`

**Response 200:** `OmniumOrder`

---

### `PUT /api/Orders/{orderId}/AddOrderLineProperties`

**Add or update properties on order lines**

Operation ID: `OrdersAddOrderLineProperties`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | ID of existing order. (Required) |

**Request body:** `List<OmniumLineItemPropertiesPatch>`

**Response 200:** `OmniumOrder`

---


## Orders | Others

### `PUT /api/Orders/PosOrders`

**Create a new Pos order in OMS.**

Operation ID: `OrdersCreatePosOrder`

**Request body:** `OmniumOrder`

---

### `GET /api/Orders/carts/{cartId}`

**Returns a single order which has a matching cartId property.**

Operation ID: `OrdersGetByCartId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes | ID of the cart the order originated from |

**Response 200:** `OmniumOrder`

---

### `GET /api/Orders/secret/{secretKey}`

**Returns a single order which has a matching secretKey property.**

Operation ID: `OrdersGetBySecretKey`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `secretKey` | path | string | Yes | The secret key of the order |

**Response 200:** `OmniumOrder`

---

### `GET /api/Orders/GetOrders/Count`

**Returns the number of orders for a given status and given store.**

Operation ID: `OrdersGetOrderCount`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `storeId` | query | array | No | ID for a store |
| `status` | query | array | No | Filter on order status. Possible values: New, InTransit, InProgress, ReadyForPic |
| `changedSince` | query | string (date-time) | No | Filter on changed date(UTC) |
| `orderTypes` | query | array | No | Filter on order types: Online, Pos, ClickAndCollect etc. |
| `filterOnWarehouse` | query | boolean | No | Filter on shipment warehouse. If false, storefilter will be order.storeId |

**Response 200:** `integer`

---

### `GET /api/Orders/GetAsPdf/{orderId}`

**Get copy of receipt or template specific pdf**

Operation ID: `OrdersGetAsPdf`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes |  |
| `templateFile` | query | string | No | Used if you want template specific design. If template exist in subfolder, speci |
| `shipmentId` | query | string | No | Used only when templateFile is specified. If no shipmentId, all shipments will b |

**Response 200:** `string`

---

### `HEAD /api/Orders/{id}/Exists`

**Check if an order exists in Omnium**

Operation ID: `OrdersExists`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the order |

---

### `POST /api/Orders/ExistMany`

**Check if multiple orders exist in Omnium. Returns the IDs that were found.**

Operation ID: `OrdersExistMany`

**Request body:** `array`

**Response 200:** `array`

---

### `POST /api/Orders/AddComment`

**Add a comment to an order, with the option to send SMS, email or both**

Operation ID: `OrdersAddComment`

**Request body:** `OmniumOrderCommentRequest`

---

### `POST /api/Orders/ExportOrders`

**Export orders to a connector**

Operation ID: `OrdersExportOrders`

**Request body:** `OmniumOrderExportRequest`

**Response 200:** `List<OrderExportResult>`

---

### `POST /api/Orders/PatchLineItemIds`

**Patch line item IDs across order form, shipments, and return order forms**

Operation ID: `OrdersPatchLineItemIds`

**Request body:** `OmniumPatchLineItemIdsRequest`

**Response 200:** `OmniumPatchLineItemIdsResult`

---

### `POST /api/ZReport/GetOmniumZReports`

**Endpoint for fetching z reports from Pos connectors.**

Operation ID: `ZReportGetOmniumZReports`

**Request body:** `OmniumZReportFilter`

**Response 200:** `List<OmniumZReport>`

---


## Orders | Payments

### `PUT /api/Orders/{orderId}/AddPayments` ⚠️ DEPRECATED

**Add new payments to an existing order. Will overwrite payments with matching Id, and add payments where no exiting payment with matching Id exists. NB! Payments with Id null will always be appended to payment list.**

Operation ID: `OrdersAddPaymentToOrder`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | The ID of the existing order. (Required) |

**Request body:** `List<OmniumPayment>`

**Response 200:** `OmniumOrder`

---

### `POST /api/Orders/{orderId}/AddPayments`

**Add new payments to an existing order. Will overwrite payments with matching Id, and add payments where no exiting payment with matching Id exists. NB! Payments with Id null will always be appended to payment list.**

Operation ID: `OrdersAddPayments`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | The ID of the existing order. (Required) |

**Request body:** `List<OmniumPayment>`

**Response 200:** `OmniumOrder`

---

### `PUT /api/Orders/{orderId}/PutPayments`

**Set payments on an existing order. Will overwrite full list of payments**

Operation ID: `OrdersPutPaymentsOnOrder`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | The ID of the existing order. (Required) |

**Request body:** `List<OmniumPayment>`

**Response 200:** `OmniumOrder`

---

### `GET /api/Orders/{id}/GetPaymentOptions`

**Get valid payment options for a order.**

Operation ID: `OrdersGetPaymentOptions`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Order id |

**Response 200:** `List<OmniumPaymentOption>`

---

### `POST /api/PaymentReport`

**Get payment report with payment transactions**

Operation ID: `PaymentReportSearchPaymentTransactions`

**Request body:** `OmniumPaymentReportSearchRequest`

**Response 200:** `OmniumPaymentTransactionOmniumSearchResult`

---

### `POST /api/PaymentReport/SearchPaymentTransactionsByDateAndPaymentMethod`

**Get payment report aggregated by date, store and payment method**

Operation ID: `PaymentReportSearchPaymentTransactionsByDateAndPaymentMethod`

**Request body:** `OmniumPaymentReportSearchRequest`

**Response 200:** `OmniumPaymentSummaryOmniumSearchResult`

---


## Orders | Pick Lists

### `POST /api/PickList/Search`

**Search all PickLists.**

Operation ID: `PickListSearch`

**Request body:** `OmniumPickListSearchRequest`

**Response 200:** `OmniumPickListOmniumSearchResult`

---

### `GET /api/PickList/Get`

**Get PickList with id.**

Operation ID: `PickListGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | query | string | No |  |

**Response 200:** `OmniumPickList`

---

### `PATCH /api/PickList/PatchPickList`

**Patch PickList - update only values in request.**

Operation ID: `PickListPatchPickList`

**Request body:** `OmniumPickListPatch`

**Response 200:** `OmniumPickList`

---


## Orders | Returns

### `GET /api/Returns/Claims/ClaimTypes`

**Get all available claim project types**

Operation ID: `ReturnsGetClaimTypes`

**Response 200:** `List<OmniumProjectType>`

---

### `POST /api/Returns/{orderId}/UpdateStatus`

**Update status on a return**

Operation ID: `ReturnsUpdateStatus`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | The ID of the order |

**Request body:** `OmniumUpdateStatusPatch`

**Response 200:** `OmniumOrderWorkflowExecutionResult`

---

### `POST /api/Returns/SearchReturnOrders`

**Search returns**

Operation ID: `ReturnsSearchReturnOrders`

**Request body:** `OmniumReturnOrderSearchRequest`

**Response 200:** `OmniumReturnOrderViewModelOmniumSearchResult`

---

### `POST /api/Returns/{orderId}/Return`

**Create a return with all or some of the line items, with optional exchange order.**

Operation ID: `ReturnsReturn`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | The ID of the order |

**Request body:** `OmniumReturnRequestModel`

**Response 200:** `OmniumReturnOrderForm`

---

### `POST /api/Returns/CreateReplacementOrder`

**Create a replacement order with all or some of the line items.**

Operation ID: `ReturnsCreateReplacementOrder`

**Request body:** `OmniumReplacementRequestModel`

**Response 200:** `List<OmniumReturnOrderForm>`

---

### `PATCH /api/Returns/{orderId}/{returnId}`

**Patch Return - update only values in request**

Operation ID: `ReturnsPatchReturn`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | ID of existing order. (Required) |
| `returnId` | path | string | Yes | ID of return. (Required) |

**Request body:** `OmniumReturnOrderFormPatch`

**Response 200:** `OmniumOrderPatchUpdateResult`

---
