# Promotions & Vouchers — API Endpoints

See `schemas/prices.md` for field definitions.

## Contents

### Promotions

- `POST /api/Products/GetActivePromotions`
- `GET /api/Promotions/{id}`
- `POST /api/Promotions/Search`
- `GET /api/Promotions/Scroll/{id}`
- `GET /api/Promotions/GenerateSingleUsagePromotionCoupons/{id}`
- `POST /api/Promotions`
- `PATCH /api/Promotions`
- `POST /api/Promotions/{id}/Convert`
- `DELETE /api/Promotions/{promotionId}`

### Vouchers

- `PUT /api/Vouchers`
- `DELETE /api/Vouchers/{id}`
- `POST /api/Vouchers/Search`
- `POST /api/Vouchers/ScrollSearch`
- `GET /api/Vouchers/Scroll/{id}`

---

## Promotions

### `POST /api/Products/GetActivePromotions`

**Search for active promotion IDs**

Operation ID: `ProductsGetActivePromotions`

**Request body:** `OmniumProductSearchRequest`

**Response 200:** `OmniumProductPromotionIdSearchResultOmniumSearchResult`

---

### `GET /api/Promotions/{id}`

**Returns a single promotion**

Operation ID: `PromotionsGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the promotion to return |

**Response 200:** `OmniumPromotion`

---

### `POST /api/Promotions/Search`

**Search for promotions**

Operation ID: `PromotionsSearch`

**Request body:** `OmniumPromotionSearchRequest`

**Response 200:** `OmniumPromotionOmniumSearchResult`

---

### `GET /api/Promotions/Scroll/{id}`

**Scroll promotions is used to get a large amount of promotions.**

Operation ID: `PromotionsScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request for the next batch of data from the origi |

**Response 200:** `OmniumPromotionOmniumResult`

---

### `GET /api/Promotions/GenerateSingleUsagePromotionCoupons/{id}`

**Generate n number for promotion coupon codes. The codes will be only for single usage**

Operation ID: `PromotionsGenerateSingleUsagePromotionCoupons`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Promotion id |
| `numberOfCouponsToGenerate` | query | integer (int32) | Yes | Number of coupon codes to generate. Max is 1000 |
| `couponCharLength` | query | integer (int32) | No | Optional: Length (number of characters)  of the generate coupon code. Default an |

**Response 200:** `array`

---

### `POST /api/Promotions`

**Add a new promotion**

Operation ID: `PromotionsAdd`

**Request body:** `OmniumPromotionRequest`

**Response 200:** `string`

---

### `PATCH /api/Promotions`

**Patch update a promotion**

Operation ID: `PromotionsPatch`

**Request body:** `OmniumPromotionPatch`

**Response 200:** `OmniumPromotionPatchUpdateResult`

---

### `POST /api/Promotions/{id}/Convert`

**Manually trigger conversion of a promotion's prices to regular prices with a configurable tag.
This creates a new regular price list from the promotion's price list, activates it, 
and deactivates the promotion. Used for immediate conversion without waiting for the scheduled task.**

Operation ID: `PromotionsConvert`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the promotion to convert |

---

### `DELETE /api/Promotions/{promotionId}`

**Delete a promotion**

Operation ID: `PromotionsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `promotionId` | path | string | Yes | ID of the promotion to delete |

---

## Vouchers

### `PUT /api/Vouchers`

**Add or save a voucher. If ID is null, it will be created.**

Operation ID: `VouchersPut`

**Request body:** `OmniumVoucher`

---

### `DELETE /api/Vouchers/{id}`

**Deletes a single voucher from the OMS**

Operation ID: `VouchersDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

### `POST /api/Vouchers/Search`

**Search for vouchers**

Operation ID: `VouchersSearchVouchers`

**Request body:** `OmniumVoucherSearchRequest`

**Response 200:** `OmniumVoucherOmniumSearchResult`

---

### `POST /api/Vouchers/ScrollSearch`

**Scroll large amounts of vouchers**

Operation ID: `VouchersScrollSearchVouchers`

**Request body:** `OmniumVoucherSearchRequest`

**Response 200:** `OmniumVoucherOmniumSearchResult`

---

### `GET /api/Vouchers/Scroll/{id}`

**Scroll vouchers is used to get a large amount of vouchers.**

Operation ID: `VouchersScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumVoucherOmniumResult`

---
