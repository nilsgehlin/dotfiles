# Orders — API Endpoints — Orders | Search

## Orders | Search

### `POST /api/Orders/Search`

**Search and filtering of orders.**

Operation ID: `OrdersSearchOrders`

**Request body:** `OmniumOrderSearchRequest`

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `POST /api/Orders/Scroll`

**Scroll orders by search**

Operation ID: `OrdersScrollSearch`

**Request body:** `OmniumOrderSearchRequest`

**Response 200:** `OmniumOrderOmniumResult`

---

### `GET /api/Orders/Scroll/{id}`

**Scroll orders is used to get a large amount of orders.**

Operation ID: `OrdersScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumOrderOmniumResult`

---

### `POST /api/Orders/SearchByCustomProperties`

**Search orders by custom properties.**

Operation ID: `OrdersGetOrdersByCustomProperties`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `key` | query | string | No |  |
| `value` | query | string | No |  |

**Response 200:** `OmniumOrderOmniumSearchResult`

---

### `POST /api/Orders/Customers/{customerId}/Orders/Search`

**Returns a list of orders for a given customer, matching search text. Supports paging.**

Operation ID: `OrdersSearchOrdersForCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | path | string | Yes | ID of the customer |

**Request body:** `OmniumSearchRequest`

**Response 200:** `OmniumOrderOmniumSearchResult`

---


## Orders | Shipments

### `PUT /api/OrderShipments/{orderId}`

**Put shipment on order**

Operation ID: `ShipmentsPut`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order ID |

**Request body:** `List<OmniumShipment>`

**Response 200:** `OmniumOrder`

---

### `PATCH /api/OrderShipments/{orderId}`

**Patch Shipment on order**

Operation ID: `ShipmentsPatch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order ID |

**Request body:** `List<OmniumShipmentPatch>`

**Response 200:** `OmniumOrder`

---

### `DELETE /api/OrderShipments/{orderId}/DeleteShipments`

**Delete shipment**

Operation ID: `ShipmentsDeleteShipments`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order ID |

**Request body:** `array`

**Response 200:** `string`

---

### `PUT /api/OrderShipments/{orderId}/AddOrderLinesToShipment`

**Add order lines to shipment**

Operation ID: `ShipmentsAddOrderLinesToShipment`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | Order ID |

**Request body:** `List<OmniumShipmentLineItemsUpdateModel>`

**Response 200:** `string`

---


## Orders | Subscriptions

### `PUT /api/Subscriptions`

**Add or update subscription**

Operation ID: `SubscriptionsPut`

**Request body:** `OmniumSubscription`

**Response 200:** `OmniumSubscription`

---

### `POST /api/Subscriptions`

**Create a new subscription, with an auto generated ID**

Operation ID: `SubscriptionsPost`

**Request body:** `OmniumSubscription`

**Response 200:** `OmniumSubscription`

---

### `POST /api/Subscriptions/Update`

**Update subscription**

Operation ID: `SubscriptionsUpdate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `runWorkflow` | query | boolean | No | If true, workflow will be processed |

**Request body:** `OmniumSubscription`

---

### `GET /api/Subscriptions/{id}`

**Returns a single subscription**

Operation ID: `SubscriptionsGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the subscription to return |

**Response 200:** `OmniumSubscription`

---

### `DELETE /api/Subscriptions/{id}`

**Deletes a subscription from the OMS**

Operation ID: `SubscriptionsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

**Response 200:** `string`

---

### `POST /api/Subscriptions/Search`

**Search and filtering of subscriptions.**

Operation ID: `SubscriptionsSearch`

**Request body:** `OmniumSubscriptionSearchRequest`

**Response 200:** `OmniumSubscriptionOmniumSearchResult`

---

### `POST /api/Subscriptions/CreatePendingOrders/{numberOfPendingOrders}`

**Create pending orders for subscription**

Operation ID: `SubscriptionsCreatePendingOrders`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `numberOfPendingOrders` | path | integer (int32) | Yes |  |

**Request body:** `OmniumSubscription`

**Response 200:** `string`

---

### `POST /api/Subscriptions/{id}/CancelSubscription`

**Cancel a subscription and all its pending orders**

Operation ID: `SubscriptionsCancelSubscription`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the subscription |

---


## Orders | Update

### `POST /api/Orders`

**Add a new order to the OMS.**

Operation ID: `OrdersPost`

**Request body:** `OmniumOrder`

---

### `PUT /api/Orders`

**Create a new order in the OMS, with an auto generated order number (orderNumber). 
If ID is not specified when creating the order, it will be set to the newly generated order number.**

Operation ID: `OrdersCreate`

**Request body:** `OmniumOrder`

**Response 200:** `OmniumOrder`

---

### `PATCH /api/Orders/{orderId}/PatchOrder`

**Patch Order - update only values in request**

Operation ID: `OrdersPatchOrder`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | ID of existing order. (Required) |

**Request body:** `OmniumOrderPatch`

**Response 200:** `OmniumOrderPatchUpdateResult`

---

### `GET /api/Orders/GetOrders/ByIds`

**Get multiple orders by IDs**

Operation ID: `OrdersGetOrdersByIds`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `ids` | query | array | No | List of orders IDs which will be used to fetch corresponding orders |

**Response 200:** `OmniumGetMultipleResponse`

---

### `DELETE /api/Orders/{orderId}`

**Deletes an order from the OMS. Soft delete is default (order status will be set to "deleted").**

Operation ID: `OrdersDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes |  |
| `deletePermanently` | query | boolean | No | If true, the order will be permanently deleted. No way back! |

---


## Orders | Workflow

### `POST /api/Orders/{orderId}/UpdateStatus`

**Update status and run workflow for an order or shipment**

Operation ID: `WorkflowUpdateStatus`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | The ID of the order |

**Request body:** `OmniumUpdateStatusPatch`

**Response 200:** `OmniumOrderWorkflowExecutionResult`

---

### `POST /api/Orders/{orderId}/OrderLinesUpdate`

**Create or update shipments and order lines,  and run workflow.**

Operation ID: `WorkflowPartialUpdate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `orderId` | path | string | Yes | The ID of the order |

**Request body:** `OmniumUpdateLineItemStatusPatch`

**Response 200:** `OmniumOrderWorkflowExecutionResult`

---

### `POST /api/Orders/{cartId}/processCartWorkflowTest/{status}`

**Process cart workflow test (Dry run of workflow, no changes to order or shipment will be made)**

Operation ID: `WorkflowProcessCartWorkflowTest`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `cartId` | path | string | Yes |  |
| `status` | path | string | Yes |  |

**Response 200:** `OmniumOrderWorkflowExecutionResult`

---
