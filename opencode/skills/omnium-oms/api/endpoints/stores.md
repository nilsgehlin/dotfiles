# Stores & Markets — API Endpoints

See `schemas/common.md` for field definitions.

## Contents

### Markets

- `GET /api/Markets`
- `GET /api/Markets/GetMarketGroups`
- `PUT /api/Markets/Update`
- `DELETE /api/Markets/{marketId}/Delete`
- `GET /api/ShipmentOptions/{marketId}/ShipmentOptions`
- `PATCH /api/ShipmentOptions/{marketId}/ShipmentOption`
- `DELETE /api/ShipmentOptions/{marketId}/ShipmentOption`

### Stores

- `GET /api/Stores/{storeId}`
- `GET /api/Stores/GetByExternalId`
- `POST /api/Stores`
- `PUT /api/Stores`
- `GET /api/Stores`
- `DELETE /api/Stores`
- `PATCH /api/Stores/PatchStore`
- `POST /api/Stores/Update`
- `POST /api/Stores/Enrich`
- `POST /api/Stores/AddMany`
- `POST /api/Stores/SearchStores`
- `DELETE /api/Stores/{id}`

---

## Markets

### `GET /api/Markets`

**Get all markets**

Operation ID: `MarketsGet`

**Response 200:** `List<OmniumMarket>`

---

### `GET /api/Markets/GetMarketGroups`

**Get all market groups**

Operation ID: `MarketsGetMarketGroups`

**Response 200:** `List<OmniumMarketGroup>`

---

### `PUT /api/Markets/Update`

**Update market**

Operation ID: `MarketsUpdate`

**Request body:** `OmniumMarket`

---

### `DELETE /api/Markets/{marketId}/Delete`

**Delete market - This operation does not clean up other resources or references in Omnium, it only removes the market from the settings.**

Operation ID: `MarketsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | path | string | Yes | Id of the market to be deleted in the OMS |

---

### `GET /api/ShipmentOptions/{marketId}/ShipmentOptions`

**Get shipment options for the market.**

Operation ID: `ShipmentOptionsGetShipmentOptions`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | path | string | Yes |  |

**Response 200:** `List<OmniumShipmentOption>`

---

### `PATCH /api/ShipmentOptions/{marketId}/ShipmentOption`

**Patch the list of shipment options. If the patch object has same ShippingMethodId or ShippingMethodName, it modifies the shipping option. If not, id adds a new one.**

Operation ID: `ShipmentOptionsPatchShipmentOption`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | path | string | Yes |  |

**Request body:** `OmniumShipmentOption`

**Response 200:** `List<OmniumShipmentOption>`

---

### `DELETE /api/ShipmentOptions/{marketId}/ShipmentOption`

**Patch the list of shipment options.**

Operation ID: `ShipmentOptionsDeleteShipmentOption`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | path | string | Yes |  |
| `shippingMethodId` | query | string | No |  |
| `shippingMethodName` | query | string | No |  |

**Response 200:** `List<OmniumShipmentOption>`

---

## Stores

### `GET /api/Stores/{storeId}`

**Returns a single store**

Operation ID: `StoresGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `storeId` | path | string | Yes | ID of the store to return |

**Response 200:** `OmniumStore`

---

### `GET /api/Stores/GetByExternalId`

**Returns a list of stores**

Operation ID: `StoresGetByExternalId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | query | string | No | External ID of the store to return |

**Response 200:** `OmniumStoreOmniumSearchResult`

---

### `POST /api/Stores`

**Add a store to the OMS**

Operation ID: `StoresPost`

**Request body:** `OmniumStore`

---

### `PUT /api/Stores`

**Create or update store in Omnium, overriding existing store**

Operation ID: `StoresPut`

**Request body:** `OmniumStore`

---

### `GET /api/Stores`

**Get all stores**

Operation ID: `GetAllStores`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `filterPublicVisible` | query | boolean | No |  |

**Response 200:** `OmniumStoreOmniumSearchResult`

---

### `DELETE /api/Stores`

**Deletes a single store from the OMS**

Operation ID: `DeleteStoreByObject`

**Request body:** `OmniumStore`

---

### `PATCH /api/Stores/PatchStore`

**Patch store - update only some values in request**

Operation ID: `StoresPatchStore`

**Request body:** `OmniumStorePatch`

**Response 200:** `OmniumStoreUpdateResult`

---

### `POST /api/Stores/Update`

**Update existing store, replacing all properties**

Operation ID: `StoresUpdate`

**Request body:** `OmniumStore`

**Response 200:** `OmniumStore`

---

### `POST /api/Stores/Enrich`

**Adding or enrich an existing store to the OMS**

Operation ID: `StoresEnrich`

**Request body:** `OmniumStore`

---

### `POST /api/Stores/AddMany`

**Adds a range of stores to the OMS.**

Operation ID: `StoresAddMany`

**Request body:** `List<OmniumStore>`

---

### `POST /api/Stores/SearchStores`

**Search stores and warehouses**

Operation ID: `StoresSearchStores`

**Request body:** `OmniumStoreSearchRequest`

**Response 200:** `OmniumStoreOmniumResult`

---

### `DELETE /api/Stores/{id}`

**Deletes a single store from the OMS**

Operation ID: `StoresDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---
