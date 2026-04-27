# Products — API Endpoints

See `schemas/products.md` for field definitions.

## Contents

### Products

- `POST /api/Products/Orders/ProductStatistics`
- `GET /api/Products/{productId}/Options`

### Products | Alerts

- `POST /api/ProductAlerts/Add`
- `DELETE /api/ProductAlerts/Deactivate`
- `GET /api/ProductAlerts/GetProductAlerts`
- `POST /api/ProductAlerts/SearchProductAlerts`

### Products | Assets

- `GET /api/Products/AddProductImage`
- `POST /api/Products/Assets/AddAsset/{productId}`
- `GET /api/Products/Assets/GetAssets`
- `POST /api/Products/Assets/AddAssets/{skuId}`
- `POST /api/Products/Assets/UpdateAssets`
- `DELETE /api/Products/Assets/DeleteAssets`

### Products | Batch Updates

- `PATCH /api/Products/PatchMany`
- `POST /api/Products/AddMany`
- `DELETE /api/Products/DeleteMany`
- `POST /api/Products/UpdateMany`

### Products | Categories

- `GET /api/ProductCategories/{categoryId}`
- `PATCH /api/ProductCategories/{categoryId}`
- `GET /api/ProductCategories`
- `POST /api/ProductCategories`
- `PUT /api/ProductCategories`
- `GET /api/ProductCategories/GetCategoryTree`
- `POST /api/ProductCategories/GetCategoryTreeBySearch`
- `GET /api/ProductCategories/{parentId}/SubCategories`
- `POST /api/ProductCategories/AddMany`
- `DELETE /api/ProductCategories/{productCategoryId}`
- `PATCH /api/ProductCategories/PatchMany`
- `POST /api/ProductCategories/ScrollSearch`
- `GET /api/ProductCategories/Scroll/{id}`
- `PUT /api/Products/ProductCategories`

### Products | Cost Prices

- `PUT /api/CostPrices/AddMany`
- `POST /api/CostPrices/Search`
- `DELETE /api/CostPrices`

### Products | Get

- `GET /api/Products/{productId}`
- `GET /api/Products/{id}/raw`
- `GET /api/Products/{productId}/ByMarket/{marketId}`
- `GET /api/Products/{productId}/ByStore/{storeId}`
- `GET /api/Products/{productId}/ByCustomer`
- `GET /api/Products/{productId}/Variants`
- `GET /api/Products/ProductCategories/{productCategoryId}`
- `GET /api/Products/ProductSearch/{productSearchId}`

### Products | Recommendations

- `POST /api/Recommendations/Search`
- `POST /api/Recommendations/GetTopSellers`

### Products | Search

- `POST /api/Products/SearchProducts`
- `GET /api/Products/Scroll/{id}`
- `POST /api/Products/Scroll`

### Products | Update

- `DELETE /api/Products/{productId}`
- `PATCH /api/Products/{productId}`
- `POST /api/Products`
- `PUT /api/Products`

### Products | Variants

- `PATCH /api/Products/{productId}/Variants`
- `POST /api/Products/{productId}/Variants`
- `PUT /api/Products/{productId}/Variants`
- `PATCH /api/Products/{productId}/Variants/{variantId}`
- `GET /api/Products/{productId}/Variants/{variantId}`
- `DELETE /api/Products/{productId}/Variants/{variantId}`
- `GET /api/Products/Variants/{variantId}`
- `POST /api/Products/{productId}/VariantList`

---

## Products

### `POST /api/Products/Orders/ProductStatistics`

**Create product statistics**

Operation ID: `ProductsCreateProductStatistics`

**Request body:** `OmniumProductStatisticsSearchRequest`

**Response 200:** `OmniumProductSales`

---

### `GET /api/Products/{productId}/Options`

**Get product options for product**

Operation ID: `ProductsGetProductOptions`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID for the product which has product options |

**Response 200:** `OmniumProductOptionsViewModel`

---

## Products | Alerts

### `POST /api/ProductAlerts/Add`

**Add or Update a productAlert. If ID is null, it will be created.**

Operation ID: `ProductAlertsAdd`

**Request body:** `OmniumProductAlertRequest`

---

### `DELETE /api/ProductAlerts/Deactivate`

**Deactivate productAlerts. Active flag will be set to false, and contact information will be removed.**

Operation ID: `ProductAlertsDeactivate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `omniumProductAlertIds` | query | array | Yes | Product alert Ids - The id of product alert objects to deactivate |

---

### `GET /api/ProductAlerts/GetProductAlerts`

**Get ProductAlerts.**

Operation ID: `ProductAlertsGetProductAlerts`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `page` | query | integer (int32) | No | Page number |
| `take` | query | integer (int32) | No | Number of elements |

---

### `POST /api/ProductAlerts/SearchProductAlerts`

**Search for product alerts.**

Operation ID: `ProductAlertsSearchProductAlerts`

**Request body:** `OmniumProductAlertSearchRequest`

---

## Products | Assets

### `GET /api/Products/AddProductImage`

**Add image to product**

Operation ID: `ProductsAddProductImage`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `url` | query | string | No |  |
| `productId` | query | string | No |  |

---

### `POST /api/Products/Assets/AddAsset/{productId}`

**Add asset to product from a binary stream. The request body should be the raw file content.**

Operation ID: `ProductsAddAsset`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID |
| `fileName` | query | string | No | File name including extension (e.g. "image.png") |

**Response 200:** `OmniumAsset`

---

### `GET /api/Products/Assets/GetAssets`

**Get product assets**

Operation ID: `ProductsGetAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `assetIds` | query | array | No |  |

**Response 200:** `List<OmniumAsset>`

---

### `POST /api/Products/Assets/AddAssets/{skuId}`

**Add assets to product. Will overwrite existing assets if there are assets added with the same asset ID on the product.**

Operation ID: `ProductsAddAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `skuId` | path | string | Yes | Product ID or SKU for the product, or a matching SKU for one on the product vari |
| `isAddedToVariant` | query | boolean | No | If set to true, the asset will be added to the variant with a matching |

**Request body:** `List<OmniumAsset>`

---

### `POST /api/Products/Assets/UpdateAssets`

**Update asset to product**

Operation ID: `ProductsUpdateAssets`

**Request body:** `List<OmniumAsset>`

---

### `DELETE /api/Products/Assets/DeleteAssets`

**Delete assets from products**

Operation ID: `ProductsDeleteAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `assetIds` | query | array | No |  |

---

## Products | Batch Updates

### `PATCH /api/Products/PatchMany`

**Patch product - update only values in request**

Operation ID: `ProductsPatchMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `excludeProductExport` | query | boolean | No | If this is set to true, Omnium will not export products to external systems |

**Request body:** `List<OmniumProductPatch>`

**Response 200:** `OmniumProductsAndVariantsUpdateResult`

---

### `POST /api/Products/AddMany`

**Add multiple products to Omnium**

Operation ID: `ProductsAddMany`

**Request body:** `List<OmniumProduct>`

---

### `DELETE /api/Products/DeleteMany`

**Delete multiple products from Omnium**

Operation ID: `ProductsDeleteMany`

**Request body:** `array`

---

### `POST /api/Products/UpdateMany`

**Update (add) many products, enriching existing products if they exist
ExternalIds will be added or updated.
PropertyItems will be overwritten.**

Operation ID: `ProductsUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `excludeProductExport` | query | boolean | No | True if products not should be exported to external systems (by integration, que |

**Request body:** `List<OmniumProduct>`

---

## Products | Categories

### `GET /api/ProductCategories/{categoryId}`

**Get product category. Language code has to be specified, either in the id or in the language parameter. If not default value will be used.**

Operation ID: `ProductCategoriesGetCategory`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `categoryId` | path | string | Yes | ID or categoryId, i.e. the id with or without language code ("123" or "123_no"). |
| `language` | query | string | No | Language code. If language code is not given in the id ("123"), then language co |

**Response 200:** `OmniumProductCategory`

---

### `PATCH /api/ProductCategories/{categoryId}`

**Patch a product category - update only values in request**

Operation ID: `ProductCategoriesPatchCategory`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `categoryId` | path | string | Yes | Category ID to patch (id including language, e.g. "123_no") |

**Request body:** `OmniumProductCategoryPatch`

**Response 200:** `OmniumProductCategoryUpdateResult`

---

### `GET /api/ProductCategories`

**Get product categories. Returns all categories in all languages.**

Operation ID: `ProductCategoriesGetCategories`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `pageSize` | query | integer (int32) | No | Number of items. Max page size is 1000 |
| `page` | query | integer (int32) | No | Page |

**Response 200:** `OmniumProductCategoryOmniumSearchResult`

---

### `POST /api/ProductCategories`

**Add a new product category to the OMS**

Operation ID: `ProductCategoriesPost`

**Request body:** `OmniumProductCategory`

---

### `PUT /api/ProductCategories`

**Put a product category to the OMS, CAUTION: overwriting existing product category**

Operation ID: `ProductCategoriesPut`

**Request body:** `OmniumProductCategory`

---

### `GET /api/ProductCategories/GetCategoryTree`

**Get product category tree**

Operation ID: `ProductCategoriesGetCategoryTree`

**Response 200:** `List<OmniumProductCategoryTreeViewModel>`

---

### `POST /api/ProductCategories/GetCategoryTreeBySearch`

**Get product category tree by product search**

Operation ID: `ProductCategoriesGetCategoryTreeBySearch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `rootCategoryId` | query | string | No |  |

**Request body:** `OmniumProductSearchRequest`

**Response 200:** `List<OmniumProductCategoryTreeViewModel>`

---

### `GET /api/ProductCategories/{parentId}/SubCategories`

**Retrieves all immediate subcategories for a given parent category from the category index.**

Operation ID: `ProductCategoriesGetSubCategories`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `parentId` | path | string | Yes | The ID of the parent category. For example, use the root category ID to fetch to |
| `language` | query | string | No | Language code, e.g. no, en |

**Response 200:** `List<OmniumProductCategory>`

---

### `POST /api/ProductCategories/AddMany`

**Add many product categories to the OMS**

Operation ID: `ProductCategoriesAddMany`

**Request body:** `List<OmniumProductCategory>`

---

### `DELETE /api/ProductCategories/{productCategoryId}`

**Deletes a product category from the OMS**

Operation ID: `ProductCategoriesDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productCategoryId` | path | string | Yes | ID of the category to delete (id including language) |

---

### `PATCH /api/ProductCategories/PatchMany`

**Patch many product categories - update only values in request**

Operation ID: `ProductCategoriesPatchMany`

**Request body:** `List<OmniumProductCategoryPatch>`

**Response 200:** `OmniumProductCategoryUpdateResult`

---

### `POST /api/ProductCategories/ScrollSearch`

**Scroll search categories. The response will contain a Scroll ID which can be used with the Scroll endpoint to fetch all remaining items.
We accept max take size 10 000. Fallback to 5000 if greater than max, or not set**

Operation ID: `ProductCategoriesScrollSearch`

**Request body:** `OmniumProductCategorySearchRequest`

**Response 200:** `OmniumProductCategoryOmniumSearchResult`

---

### `GET /api/ProductCategories/Scroll/{id}`

**Scroll product categories is used to get a large amount of categories.**

Operation ID: `ProductCategoriesScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumProductCategoryOmniumResult`

---

### `PUT /api/Products/ProductCategories`

**Add product categories to products by IDs**

Operation ID: `ProductsAddCategoriesToProducts`

**Request body:** `List<OmniumProductCategoryRelationsRequest>`

**Response 200:** `OmniumProductUpdateResult`

---

## Products | Cost Prices

### `PUT /api/CostPrices/AddMany`

Operation ID: `CostPricesPutCostPrices`

**Request body:** `List<OmniumCostPriceUpdateRequest>`

---

### `POST /api/CostPrices/Search`

Operation ID: `CostPricesSearch`

**Request body:** `OmniumCostPriceSearchRequest`

**Response 200:** `OmniumCostPriceOmniumResult`

---

### `DELETE /api/CostPrices`

**Delete one or more cost prices on a product in Omnium. Will delete existing cost price if found.**

Operation ID: `CostPricesDeleteCostPrices`

**Request body:** `List<OmniumCostPriceDeleteRequest>`

---

## Products | Get

### `GET /api/Products/{productId}`

**Get product by Product ID or SKU ID. Product will be returned with all valid prices(for all markets/stores) sorted by defaultMarket, excluding customer specific prices.
For the complete product, with all prices and no sorting, use GET "products/{id}/raw")**

Operation ID: `ProductsGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID or SKU ID |

**Response 200:** `OmniumProduct`

---

### `GET /api/Products/{id}/raw`

**Get product by product ID. Returned as is, with no exclusion or sorting of prices.**

Operation ID: `ProductsGetRawProduct`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Product document ID (including language post-fix when using product languages) |

**Response 200:** `OmniumProduct`

---

### `GET /api/Products/{productId}/ByMarket/{marketId}`

**Get product by Product ID or SKU ID. Product will be returned with prices ONLY for selected market. If you need the complete object, use get without market**

Operation ID: `ProductsGetProductByMarket`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID or SKU ID |
| `marketId` | path | string | Yes | Market ID for product and prices |

**Response 200:** `OmniumProduct`

---

### `GET /api/Products/{productId}/ByStore/{storeId}`

**Get product by Product ID or SKU ID. Product will be returned with prices ONLY for selected store, or valid market for store. If you need the complete object, use get without store or market**

Operation ID: `ProductsGetProductByStore`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID or SKU ID |
| `storeId` | path | string | Yes | Store ID for product and prices |
| `isAssortmentIgnored` | query | boolean | No | True if assortment should be ignored |

**Response 200:** `OmniumProduct`

---

### `GET /api/Products/{productId}/ByCustomer`

**Get product by Product ID or SKU ID. Product will be returned with relevant prices for the selected customer or customer group. If both the product and customer has assortment codes set, the product will not be returned if there is a mismatch and status 404 will be returned instead.**

Operation ID: `ProductsGetProductByCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID or SKU ID |
| `customerId` | query | string | No |  |
| `customerGroup` | query | string | No |  |

**Response 200:** `OmniumProduct`

---

### `GET /api/Products/{productId}/Variants`

**Get list of variants by product ID**

Operation ID: `ProductsGetVariants`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID or SKU id |

**Response 200:** `OmniumProductOmniumSearchResult`

---

### `GET /api/Products/ProductCategories/{productCategoryId}`

**Get list of products by product category id**

Operation ID: `ProductsGetByCategory`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productCategoryId` | path | string | Yes | Product Category ID |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1(default is 1) |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1.(default is 20) |

**Response 200:** `OmniumProductListItemViewModelOmniumSearchResult`

---

### `GET /api/Products/ProductSearch/{productSearchId}`

**Get list of products by product search id**

Operation ID: `ProductsGetByProductSearch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productSearchId` | path | string | Yes | Product Search ID |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1(default is 1) |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1.(default is 20) |

**Response 200:** `OmniumProductListItemViewModelOmniumSearchResult`

---

## Products | Recommendations

### `POST /api/Recommendations/Search`

**Get products recommendations based on products IDs, customer ID, boosted properties and/or included/excluded products properties.**

Operation ID: `RecommendationsSearchRecommendations`

**Request body:** `OmniumSearchRecommendationsRequest`

**Response 200:** `OmniumRecommendationsResult`

---

### `POST /api/Recommendations/GetTopSellers`

**Get top selling products recommendations**

Operation ID: `RecommendationsGetTopSellingProductsRecommendations`

**Request body:** `OmniumGetTopSellingProductsRecommendationsRequest`

**Response 200:** `OmniumRecommendationsResult`

---

## Products | Search

### `POST /api/Products/SearchProducts`

**Search for products, return product list items. Does not return entire product models.**

Operation ID: `ProductsSearchProducts`

**Request body:** `OmniumProductSearchRequest`

**Response 200:** `OmniumProductListItemViewModelOmniumSearchResult`

---

### `GET /api/Products/Scroll/{id}`

**Scroll products is used to get a large amount of products.**

Operation ID: `ProductsScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumProductOmniumResult`

---

### `POST /api/Products/Scroll`

**Scroll through products based on search criteria.**

Operation ID: `ProductsScrollSearch`

**Request body:** `OmniumProductSearchRequest`

**Response 200:** `OmniumProductOmniumResult`

---

## Products | Update

### `DELETE /api/Products/{productId}`

**Deletes a product from the OMS**

Operation ID: `ProductsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes |  |

---

### `PATCH /api/Products/{productId}`

**Patch product - update only values in request**

Operation ID: `ProductsPatchProduct`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID to patch |

**Request body:** `OmniumProductPatch`

**Response 200:** `OmniumProductUpdateResult`

---

### `POST /api/Products`

**Create new product, update if exists**

Operation ID: `ProductsPost`

**Request body:** `OmniumProduct`

---

### `PUT /api/Products`

**Put a product to Omnium, CAUTION: overwriting existing product**

Operation ID: `ProductsPutProduct`

**Request body:** `OmniumProduct`

---

## Products | Variants

### `PATCH /api/Products/{productId}/Variants`

**Patch many product variants - update only values in request**

Operation ID: `ProductsPatchManyVariants`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID to patch |

**Request body:** `List<OmniumProductPatch>`

**Response 200:** `OmniumProductUpdateResult`

---

### `POST /api/Products/{productId}/Variants`

**Add a new variant to Omnium**

Operation ID: `ProductsPostVariant`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID to add variant to |

**Request body:** `OmniumProductVariant`

---

### `PUT /api/Products/{productId}/Variants`

**Put a variant to Omnium, CAUTION: overwriting existing variant**

Operation ID: `ProductsPutVariant`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID to add variant to |

**Request body:** `OmniumProduct`

---

### `PATCH /api/Products/{productId}/Variants/{variantId}`

**Patch product - update only values in request**

Operation ID: `ProductsPatchVariant`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID to patch |
| `variantId` | path | string | Yes | Sku ID to patch |

**Request body:** `OmniumProductPatch`

**Response 200:** `OmniumProductUpdateResult`

---

### `GET /api/Products/{productId}/Variants/{variantId}`

**Get a variant by product and variant ID**

Operation ID: `ProductsGetVariant`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes |  |
| `variantId` | path | string | Yes |  |

**Response 200:** `OmniumProduct`

---

### `DELETE /api/Products/{productId}/Variants/{variantId}`

**Deletes a variant from a product**

Operation ID: `ProductsDeleteVariant`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID |
| `variantId` | path | string | Yes | Variant ID |

---

### `GET /api/Products/Variants/{variantId}`

**Get a variant by variant ID**

Operation ID: `ProductsGetVariantByVariantId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `variantId` | path | string | Yes |  |

**Response 200:** `OmniumProductVariantOmniumSearchResult`

---

### `POST /api/Products/{productId}/VariantList`

**Add new variants to Omnium**

Operation ID: `ProductsPostManyVariants`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `productId` | path | string | Yes | Product ID to add variant to |

**Request body:** `List<OmniumProductVariant>`

---
