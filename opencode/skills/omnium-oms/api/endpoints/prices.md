# Prices & Price Lists — API Endpoints

See `schemas/prices.md` for field definitions.

## Contents

### Products | Price List Items

- `POST /api/PriceListItems/Search`
- `POST /api/PriceListItems/ScrollSearch`
- `GET /api/PriceListItems/Scroll/{id}`
- `POST /api/PriceLists/AddPriceListItems`
- `PATCH /api/PriceLists/PatchPriceListItems`
- `GET /api/PriceLists/{id}/priceListItems`
- `DELETE /api/PriceLists/DeletePriceListItems`

### Products | Price Lists

- `GET /api/PriceLists/{id}`
- `DELETE /api/PriceLists/{id}`
- `POST /api/PriceLists/SearchPriceLists`
- `POST /api/PriceLists/AddPriceList`
- `POST /api/PriceLists/ActivatePriceList/{priceListId}`
- `POST /api/PriceLists/DeactivatePriceList/{priceListId}`

### Products | Prices

- `GET /api/Prices/Scroll/{id}`
- `POST /api/Prices/Search`
- `PUT /api/Prices/AddMany`
- `DELETE /api/Prices`

---

## Products | Price List Items

### `POST /api/PriceListItems/Search`

**Search price list items**

Operation ID: `PriceListItemsSearch`

**Request body:** `OmniumPriceListItemSearchRequest`

**Response 200:** `OmniumPriceListItemOmniumResult`

---

### `POST /api/PriceListItems/ScrollSearch`

**Scroll price list items using available parameters in OmniumPriceListItemSearchRequest.**

Operation ID: `PriceListItemsScrollSearch`

**Request body:** `OmniumPriceListItemSearchRequest`

**Response 200:** `OmniumPriceListItemOmniumResult`

---

### `GET /api/PriceListItems/Scroll/{id}`

**Scroll price list items is used to get a large amount of prices.**

Operation ID: `PriceListItemsScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumPriceListItemOmniumResult`

---

### `POST /api/PriceLists/AddPriceListItems`

**Add or update priceListItems. PriceListId is required on the items. If the priceList does not exist, items will be ignored.**

Operation ID: `PriceListsAddPriceListItems`

**Request body:** `List<OmniumPriceListItem>`

---

### `PATCH /api/PriceLists/PatchPriceListItems`

**Partially update price list items. Only non-null fields will be updated. Derived fields (DiscountedPrice, Profit, etc.) are recalculated automatically.
Items that don't exist will be auto-created. The Id can be provided directly or derived from PriceListId + SkuId/ProductId.**

Operation ID: `PriceListsPatchPriceListItems`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `activatePriceLists` | query | boolean | No | When true, affected price lists will be activated after patching (pushes prices  |

**Request body:** `List<OmniumPriceListItemPatch>`

**Response 200:** `OmniumPriceListItemPatchUpdateResult`

---

### `GET /api/PriceLists/{id}/priceListItems`

**Get price list items for a price list**

Operation ID: `PriceListsGetPriceListItems`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The id of the price list |
| `page` | query | integer (int32) | No | Page number |
| `take` | query | integer (int32) | No | Number of elements |

**Response 200:** `List<OmniumPriceListItem>`

---

### `DELETE /api/PriceLists/DeletePriceListItems`

**Delete price list items**

Operation ID: `PriceListsDeletePriceListItems`

**Request body:** `array`

---

## Products | Price Lists

### `GET /api/PriceLists/{id}`

**Get price list**

Operation ID: `PriceListsGetPriceList`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The id of the price list |

**Response 200:** `OmniumPriceList`

---

### `DELETE /api/PriceLists/{id}`

**Delete a price list and the corresponding price list items**

Operation ID: `PriceListsDeletePriceList`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The id of the price list to delete |

---

### `POST /api/PriceLists/SearchPriceLists`

**Search price lists**

Operation ID: `PriceListsSearchPriceLists`

**Request body:** `OmniumPriceListSearchRequest`

**Response 200:** `OmniumPriceListOmniumSearchResult`

---

### `POST /api/PriceLists/AddPriceList`

**Add price list, if a priceList with the same ID already exists, it will be updated.**

Operation ID: `PriceListsAddPriceList`

**Request body:** `OmniumPriceList`

---

### `POST /api/PriceLists/ActivatePriceList/{priceListId}`

**Activate price list. Will create product prices for all items in the price list.**

Operation ID: `PriceListsActivatePriceList`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `priceListId` | path | string | Yes |  |

**Response 200:** `OmniumPriceList`

---

### `POST /api/PriceLists/DeactivatePriceList/{priceListId}`

**Deactivate price list. Will remove product prices for all items in the price list.**

Operation ID: `PriceListsDeactivatePriceList`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `priceListId` | path | string | Yes |  |

**Response 200:** `OmniumPriceList`

---

## Products | Prices

### `GET /api/Prices/Scroll/{id}`

**Scroll prices is used to get a large amount of prices.**

Operation ID: `PricesScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumPriceOmniumResult`

---

### `POST /api/Prices/Search`

**Search prices using available parameters in OmniumPriceSearchRequest.**

Operation ID: `PricesSearch`

**Request body:** `OmniumPriceSearchRequest`

**Response 200:** `OmniumPriceOmniumResult`

---

### `PUT /api/Prices/AddMany`

**Put one or more prices to a product in Omnium. Will overwrite existing price if found, or add a new price if no match is found.
The price is identified by checking CustomerId, CustomerGroup, VariantId, MarketId, MarketGroupId, CurrencyCode, SalesCode, PromotionId, StoreId, and PriceListId.
If IgnoreDates is false, dates are also considered when fetching existing prices.**

Operation ID: `PricesPutPrices`

**Request body:** `List<OmniumPriceUpdateRequest>`

---

### `DELETE /api/Prices`

**Delete one or more prices on a product in Omnium. Will delete existing price if found.**

Operation ID: `PricesDeletePrices`

**Request body:** `List<OmniumPriceDeleteRequest>`

---
