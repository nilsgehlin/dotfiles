# Purchase Orders & Suppliers — API Endpoints

See `schemas/purchase-orders.md` for field definitions.

## Contents

### Purchase Orders

- `GET /api/PurchaseOrders/{purchaseOrderId}`
- `PATCH /api/PurchaseOrders/{purchaseOrderId}`
- `POST /api/PurchaseOrders/Search`
- `POST /api/PurchaseOrders/Scroll`
- `GET /api/PurchaseOrders/Scroll/{id}`
- `POST /api/PurchaseOrders`
- `PUT /api/PurchaseOrders`
- `PUT /api/PurchaseOrders/UpdateMany`
- `DELETE /api/PurchaseOrders/{id}`
- `POST /api/PurchaseOrders/{id}`
- `POST /api/PurchaseOrders/{purchaseOrderId}/AddPublicPurchaseOrderComment`
- `POST /api/PurchaseOrders/{purchaseOrderId}/AddInternalPurchaseOrderComment`
- `GET /api/PurchaseOrders/Extended/{purchaseOrderId}`
- `POST /api/PurchaseOrders/{purchaseOrderId}/OrderLines/Split`
- `POST /api/PurchaseOrders/{purchaseOrderId}/OrderLines/{lineItemId}/Cancel`

### Purchase Orders | Deliveries

- `GET /api/Deliveries/{deliveryId}`
- `PATCH /api/Deliveries/{deliveryId}`
- `GET /api/Deliveries/{deliveryId}/PurchaseOrderLines`
- `POST /api/Deliveries/Search`
- `POST /api/Deliveries/CreateDelivery/{purchaseOrderId}`
- `PUT /api/Deliveries`
- `PUT /api/Deliveries/UpdateMany`
- `POST /api/Deliveries/{deliveryId}/AddPublicDeliveryComment`
- `POST /api/Deliveries/{deliveryId}/AddInternalDeliveryComment`
- `POST /api/Deliveries/ProcessGoodsReception`
- `POST /api/Deliveries/{deliveryId}/ProcessGoodsReception`
- `DELETE /api/Deliveries/{id}`

### Purchase Orders | Workflows

- `POST /api/PurchaseOrders/UpdateAndRunWorkflow`
- `POST /api/PurchaseOrders/{purchaseOrderId}/UpdateStatus`

### Suppliers

- `GET /api/Suppliers/{supplierId}`
- `GET /api/Suppliers/{supplierId}/{versionId}`
- `POST /api/Suppliers/Search`
- `PUT /api/Suppliers`
- `PUT /api/Suppliers/UpdateMany`
- `DELETE /api/Suppliers/{id}`

---

## Purchase Orders

### `GET /api/PurchaseOrders/{purchaseOrderId}`

**Get purchase order**

Operation ID: `PurchaseOrdersGetPurchaseOrder`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes |  |

**Response 200:** `OmniumPurchaseOrder`

---

### `PATCH /api/PurchaseOrders/{purchaseOrderId}`

**Patch purchase order**

Operation ID: `PurchaseOrdersPatch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes | Purchase order ID to patch |
| `updateAtpValues` | query | boolean | No | If true ATP providers will calculate new ATP values based on the purchase order |

**Request body:** `OmniumPurchaseOrderPatch`

**Response 200:** `OmniumPurchaseOrder`

---

### `POST /api/PurchaseOrders/Search`

**Search purchase orders**

Operation ID: `PurchaseOrdersSearch`

**Request body:** `OmniumPurchaseOrderSearchRequest`

**Response 200:** `OmniumPurchaseOrderOmniumSearchResult`

---

### `POST /api/PurchaseOrders/Scroll`

**Scroll purchaseOrders by search**

Operation ID: `PurchaseOrdersScrollSearch`

**Request body:** `OmniumPurchaseOrderSearchRequest`

**Response 200:** `OmniumPurchaseOrderOmniumResult`

---

### `GET /api/PurchaseOrders/Scroll/{id}`

**Scroll purchaseOrders is used to get a large amount of customers.**

Operation ID: `PurchaseOrdersScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumPurchaseOrderOmniumResult`

---

### `POST /api/PurchaseOrders`

**Add a purchase order**

Operation ID: `PurchaseOrdersPost`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `runWorkflow` | query | boolean | No |  |

**Request body:** `OmniumPurchaseOrder`

**Response 200:** `OmniumPurchaseOrder`

---

### `PUT /api/PurchaseOrders`

**Update purchase order**

Operation ID: `PurchaseOrdersUpdate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `updateAtpValues` | query | boolean | No | If true ATP providers will calculate new ATP values based on the purchase order |

**Request body:** `OmniumPurchaseOrder`

**Response 200:** `OmniumPurchaseOrder`

---

### `PUT /api/PurchaseOrders/UpdateMany`

**Update many purchase orders**

Operation ID: `PurchaseOrdersUpdateMany`

**Request body:** `List<OmniumPurchaseOrder>`

---

### `DELETE /api/PurchaseOrders/{id}`

**Delete purchase order**

Operation ID: `PurchaseOrdersDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

### `POST /api/PurchaseOrders/{id}`

**Update ATP values**

Operation ID: `PurchaseOrdersUpdateAtpValues`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Purchase order ID |

---

### `POST /api/PurchaseOrders/{purchaseOrderId}/AddPublicPurchaseOrderComment`

**Add public purchase order comment**

Operation ID: `PurchaseOrdersAddPublicPurchaseOrderComment`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes |  |

**Request body:** `OmniumComment`

**Response 200:** `List<OmniumComment>`

---

### `POST /api/PurchaseOrders/{purchaseOrderId}/AddInternalPurchaseOrderComment`

**Add internal purchase order comment**

Operation ID: `PurchaseOrdersAddInternalPurchaseOrderComment`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes |  |

**Request body:** `OmniumComment`

**Response 200:** `List<OmniumComment>`

---

### `GET /api/PurchaseOrders/Extended/{purchaseOrderId}`

**Get extended purchase order**

Operation ID: `PurchaseOrdersGetExtendedPurchaseOrder`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes |  |

**Response 200:** `OmniumPurchaseOrderExtendedModel`

---

### `POST /api/PurchaseOrders/{purchaseOrderId}/OrderLines/Split`

**Split one or more purchase order lines**

Operation ID: `PurchaseOrdersSplitOrderLines`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes | Purchase order ID (Required) |

**Request body:** `List<OmniumSplitPurchaseOrderLine>`

**Response 200:** `OmniumPurchaseOrder`

---

### `POST /api/PurchaseOrders/{purchaseOrderId}/OrderLines/{lineItemId}/Cancel`

**Cancel purchase order line**

Operation ID: `PurchaseOrdersCancelOrderLine`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes | Purchase order ID (Required) |
| `lineItemId` | path | string | Yes | Purchase order line ID (Required) |

**Response 200:** `OmniumPurchaseOrder`

---

## Purchase Orders | Deliveries

### `GET /api/Deliveries/{deliveryId}`

**Get delivery**

Operation ID: `DeliveriesGetDelivery`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `deliveryId` | path | string | Yes |  |

**Response 200:** `OmniumDelivery`

---

### `PATCH /api/Deliveries/{deliveryId}`

**Patch delivery**

Operation ID: `DeliveriesPatch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `deliveryId` | path | string | Yes | Delivery ID to patch |

**Request body:** `OmniumDeliveryPatch`

**Response 200:** `OmniumDeliveryPatch`

---

### `GET /api/Deliveries/{deliveryId}/PurchaseOrderLines`

**Get delivery purchase order lines**

Operation ID: `DeliveriesGetDeliveryPurchaseOrderLines`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `deliveryId` | path | string | Yes |  |

**Response 200:** `List<OmniumPurchaseOrderLine>`

---

### `POST /api/Deliveries/Search`

**Search deliveries**

Operation ID: `DeliveriesSearch`

**Request body:** `OmniumDeliverySearchRequest`

**Response 200:** `OmniumDeliveryOmniumSearchResult`

---

### `POST /api/Deliveries/CreateDelivery/{purchaseOrderId}`

**Create delivery with purchase order lines. Use either SKU or Code to identify line items. Package SKU ID can be set but is not required.**

Operation ID: `DeliveriesCreateDelivery`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes |  |
| `existingDeliveryId` | query | string | No | If set, the purchase order lines will be added to the existing delivery |
| `cancelRemainingLineItems` | query | boolean | No | If true, remaining line items on purchase order will be cancelled |
| `expectedDeliveryDate` | query | string (date-time) | No |  |
| `barcode` | query | string | No | Use this to add barcode to the shipment. Used for goodsreception |
| `newDeliveryId` | query | string | No | You can pick the Id of the new delivery. Do this at your own responsibility. |
| `preventDuplicateLineItems` | query | boolean | No | If true, the request will fail with BadRequest if duplicate line item IDs are fo |

**Request body:** `List<OmniumPurchaseOrderLineReference>`

**Response 200:** `OmniumDelivery`

---

### `PUT /api/Deliveries`

**Update delivery**

Operation ID: `DeliveriesUpdate`

**Request body:** `OmniumDelivery`

**Response 200:** `OmniumDelivery`

---

### `PUT /api/Deliveries/UpdateMany`

**Update many deliveries**

Operation ID: `DeliveriesUpdateMany`

**Request body:** `List<OmniumDelivery>`

**Response 200:** `OmniumDelivery`

---

### `POST /api/Deliveries/{deliveryId}/AddPublicDeliveryComment`

**Add public delivery comment**

Operation ID: `DeliveriesAddPublicDeliveryComment`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `deliveryId` | path | string | Yes |  |

**Request body:** `OmniumComment`

**Response 200:** `List<OmniumComment>`

---

### `POST /api/Deliveries/{deliveryId}/AddInternalDeliveryComment`

**Add internal delivery comment**

Operation ID: `DeliveriesAddInternalDeliveryComment`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `deliveryId` | path | string | Yes |  |

**Request body:** `OmniumComment`

**Response 200:** `List<OmniumComment>`

---

### `POST /api/Deliveries/ProcessGoodsReception`

**Process goods reception**

Operation ID: `DeliveriesProcessGoodsReception`

**Request body:** `List<OmniumDeliveryGoodsReceptionLine>`

---

### `POST /api/Deliveries/{deliveryId}/ProcessGoodsReception`

**Process goods reception**

Operation ID: `DeliveriesProcessGoodsReceptionForDelivery`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `deliveryId` | path | string | Yes | Id of delivery containing the line items |

**Request body:** `List<OmniumDeliveryGoodsReceptionLine>`

---

### `DELETE /api/Deliveries/{id}`

**Delete delivery**

Operation ID: `DeliveriesDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

## Purchase Orders | Workflows

### `POST /api/PurchaseOrders/UpdateAndRunWorkflow`

**Update purchase order and run workflow**

Operation ID: `PurchaseOrdersUpdateAndRunWorkflow`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `updateAtpValues` | query | boolean | No | If true ATP providers will calculate new ATP values based on the purchase order |

**Request body:** `OmniumPurchaseOrder`

**Response 200:** `OmniumPurchaseOrderWorkflowExecutionResult`

---

### `POST /api/PurchaseOrders/{purchaseOrderId}/UpdateStatus`

**Update status and run workflow for a purchase order**

Operation ID: `PurchaseOrdersRunWorkflow`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `purchaseOrderId` | path | string | Yes | The ID of the purchase order |

**Request body:** `OmniumPurchaseOrderWorkflowRequest`

**Response 200:** `OmniumPurchaseOrderWorkflowExecutionResult`

---

## Suppliers

### `GET /api/Suppliers/{supplierId}`

**Get supplier**

Operation ID: `SuppliersGetSupplier`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `supplierId` | path | string | Yes |  |

**Response 200:** `OmniumSupplier`

---

### `GET /api/Suppliers/{supplierId}/{versionId}`

**Get supplier version**

Operation ID: `SuppliersGetSupplierVersion`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `supplierId` | path | string | Yes |  |
| `versionId` | path | string | Yes |  |

**Response 200:** `OmniumSupplier`

---

### `POST /api/Suppliers/Search`

**Search suppliers**

Operation ID: `SuppliersSearch`

**Request body:** `OmniumSupplierSearchRequest`

**Response 200:** `OmniumSupplierOmniumSearchResult`

---

### `PUT /api/Suppliers`

**Update supplier**

Operation ID: `SuppliersUpdate`

**Request body:** `OmniumSupplier`

**Response 200:** `OmniumSupplier`

---

### `PUT /api/Suppliers/UpdateMany`

**Update many suppliers**

Operation ID: `SuppliersUpdateMany`

**Request body:** `List<OmniumSupplier>`

---

### `DELETE /api/Suppliers/{id}`

**Delete supplier**

Operation ID: `SuppliersDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---
