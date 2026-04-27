# Inventory — API Endpoints

See `schemas/inventory.md` for field definitions.

## Contents

### Products | Inventory

- `GET /api/Inventory/{id}`
- `DELETE /api/Inventory/{id}`
- `POST /api/Inventory`
- `DELETE /api/Inventory`
- `POST /api/Inventory/AddMany`
- `PUT /api/Inventory/Update`
- `PUT /api/Inventory/UpdateMany`
- `POST /api/Inventory/ProcessInventoryTransactions`
- `GET /api/Inventory/RecalculateReservedInventory`
- `GET /api/Inventory/Scroll/{id}`
- `POST /api/Inventory/Search`
- `GET /api/Inventory/ScrollTransactions/{id}`
- `POST /api/Inventory/SearchTransactions`

---

## Products | Inventory

### `GET /api/Inventory/{id}`

**Returns inventory items for a single sku**

Operation ID: `InventoryGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the sku to return |
| `warehouseIds` | query | array | No | Warehouse ids for inventory |

**Response 200:** `OmniumInventoryItemOmniumResult`

---

### `DELETE /api/Inventory/{id}`

**Deletes inventory for a single sku, for selected warehouses**

Operation ID: `InventoryDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the sku to delete |
| `warehouseIds` | query | array | Yes | Warehouse ids for inventory to delete |

---

### `POST /api/Inventory`

**Add a new inventory item to the OMS**

Operation ID: `InventoryPost`

**Request body:** `OmniumInventoryItem`

---

### `DELETE /api/Inventory`

**Deletes inventory for multiple skus, for selected warehouses**

Operation ID: `InventoryDeleteMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `warehouseIds` | query | array | Yes | Warehouse ids for inventory to delete |

**Request body:** `array`

---

### `POST /api/Inventory/AddMany`

**Add a range of inventory items to the OMS. This will override existing items even if the values are identical, and also create inventory transactions.
Please note: It is strongly recommended that you only use this endpoint for one-time imports.
For everything else (such as continuous updates, new import, nightly full imports, etc.), please use UpdateMany instead.**

Operation ID: `InventoryAddMany`

**Request body:** `List<OmniumInventoryItem>`

---

### `PUT /api/Inventory/Update`

**Update inventory**

Operation ID: `InventoryUpdate`

**Request body:** `OmniumInventoryItem`

---

### `PUT /api/Inventory/UpdateMany`

**Update a range of inventory items to the OMS.**

Operation ID: `InventoryUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `isReservedInventoryOverwritten` | query | boolean | No | Set to 'true' if reserved inventory should be overwritten with the values in the |

**Request body:** `List<OmniumInventoryItem>`

---

### `POST /api/Inventory/ProcessInventoryTransactions`

**Perform inventory updates by specifying delta instead of total. Supports multiple updates to the same inventory item in the same request.**

Operation ID: `InventoryProcessInventoryTransactions`

**Request body:** `List<OmniumInventoryUpdate>`

---

### `GET /api/Inventory/RecalculateReservedInventory`

**Recalculates all inventory items with reservations**

Operation ID: `InventoryRecalculateReservedInventory`

---

### `GET /api/Inventory/Scroll/{id}`

**Scroll inventory is used to get a large amount of inventory items.**

Operation ID: `InventoryScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumInventoryItemOmniumResult`

---

### `POST /api/Inventory/Search`

**Search inventory items using available parameters in OmniumInventorySearchRequest.**

Operation ID: `InventorySearch`

**Request body:** `OmniumInventorySearchRequest`

**Response 200:** `OmniumInventoryItemOmniumResult`

---

### `GET /api/Inventory/ScrollTransactions/{id}`

**Scroll inventory transactions is used to get a large amount of inventory transactions.**

Operation ID: `InventoryScrollTransactions`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumInventoryTransactionOmniumResult`

---

### `POST /api/Inventory/SearchTransactions`

**Search inventory transactions using available parameters in OmniumInventoryTransactionSearchRequest.**

Operation ID: `InventorySearchInventoryTransactions`

**Request body:** `OmniumInventoryTransactionSearchRequest`

**Response 200:** `OmniumInventoryTransactionOmniumResult`

---
