# Configuration & Settings — API Endpoints

See `schemas/common.md` for field definitions.

## Contents

### Assets | Files

- `POST /api/Files/{serviceType}/Download`

### Assets | Images

- `GET /api/ImagesDelivery/GetImageUrl`

### Comments

- `GET /api/Comments/{commentId}`
- `POST /api/Comments/Search`
- `PUT /api/Comments/Add`
- `PATCH /api/Comments/Update`
- `DELETE /api/Comments/{id}`

### Date Planners

- `GET /api/DatePlanners`
- `PUT /api/DatePlanners`
- `DELETE /api/DatePlanners`

### Event Log

- `POST /api/EventLog/Search`
- `POST /api/EventLog/SearchByPrevious/{eventLogModel}/{objectId}`

### Health

- `GET /api/Health`

### Invoices

- `GET /api/Invoices`
- `GET /api/Invoices/{invoiceId}`
- `DELETE /api/Invoices/{invoiceId}`
- `GET /api/Invoices/Customers/{customerId}`
- `GET /api/Invoices/GetAsPdf/{invoiceId}`
- `PUT /api/Invoices/UpdateInvoice`
- `POST /api/Invoices/Search`
- `POST /api/Invoices/AddInvoice`
- `POST /api/Invoices/{invoiceId}/AddFileToInvoice`
- `POST /api/Invoices/{invoiceId}/AddAsset`

### Ratings

- `PUT /api/Ratings`
- `DELETE /api/Ratings/{id}`
- `GET /api/Ratings/GetRatings`
- `POST /api/Ratings/Search`
- `POST /api/Ratings/ScrollSearch`
- `GET /api/Ratings/Scroll/{id}`
- `GET /api/Ratings/GetAverageRatings`

### SCIM Groups

- `GET /scim/v2/{tenantId}/{provider}/Groups/{id}`
- `PUT /scim/v2/{tenantId}/{provider}/Groups/{id}`
- `PATCH /scim/v2/{tenantId}/{provider}/Groups/{id}`
- `DELETE /scim/v2/{tenantId}/{provider}/Groups/{id}`
- `GET /scim/v2/{tenantId}/{provider}/Groups`
- `POST /scim/v2/{tenantId}/{provider}/Groups`

### SCIM Users

- `GET /scim/v2/{tenantId}/{provider}/Users/{id}`
- `PUT /scim/v2/{tenantId}/{provider}/Users/{id}`
- `PATCH /scim/v2/{tenantId}/{provider}/Users/{id}`
- `DELETE /scim/v2/{tenantId}/{provider}/Users/{id}`
- `GET /scim/v2/{tenantId}/{provider}/Users`
- `POST /scim/v2/{tenantId}/{provider}/Users`

### Settings

- `GET /api/Settings/OrderSettings`
- `GET /api/Settings/OrderTypes`
- `GET /api/Settings/CustomerSettings`

### Settings | Products

- `GET /api/settings/ProductSettings/ProductSettings`
- `PUT /api/settings/ProductSettings/ProductType`
- `DELETE /api/settings/ProductSettings/DeleteProductType/{name}`

### Triggers

- `POST /api/Trigger`

### Users

- `GET /api/Role/{roleId}`
- `DELETE /api/Role/{roleId}`
- `GET /api/Role/GetAll`
- `POST /api/Role/Add`
- `PUT /api/Role/Update`
- `POST /api/User/Add`
- `PUT /api/User`
- `GET /api/User/{id}`
- `PATCH /api/User/{id}`
- `DELETE /api/User/{id}`
- `GET /api/User/GetAll`

---

## Assets | Files

### `POST /api/Files/{serviceType}/Download`

**Download file/asset with a give path and serviceType. ServiceType is found on the asset**

Operation ID: `FilesDownload`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `serviceType` | path | string | Yes | The service type which should be specified on the asset |

**Request body:** `OmniumFileDownloadRequest`

**Response 200:** `string`

---

## Assets | Images

### `GET /api/ImagesDelivery/GetImageUrl`

**Based on a image url that exists in Omnium, generate a new size.If both width and height is specified, width is used**

Operation ID: `ImagesDeliveryGetImageUrl`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `url` | query | string | No | Complete url to the image |
| `maxHeight` | query | integer (int32) | No | Max height for the generated image |
| `maxWidth` | query | integer (int32) | No | Max width for the generated image |

---

## Comments

### `GET /api/Comments/{commentId}`

**Get comment.**

Operation ID: `CommentsGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `commentId` | path | string | Yes |  |

**Response 200:** `OmniumComment`

---

### `POST /api/Comments/Search`

**Search comments.**

Operation ID: `CommentsSearch`

**Request body:** `OmniumCommentSearchRequest`

**Response 200:** `List<OmniumComment>`

---

### `PUT /api/Comments/Add`

**Add/update comment. Can send out notification in the process.**

Operation ID: `CommentsAdd`

**Request body:** `OmniumComment`

**Response 200:** `OmniumComment`

---

### `PATCH /api/Comments/Update`

**Update selected fields in a comment - no support for sending notification in this endpoint.**

Operation ID: `CommentsUpdate`

**Request body:** `OmniumCommentPatch`

**Response 200:** `OmniumComment`

---

### `DELETE /api/Comments/{id}`

**Delete comment.**

Operation ID: `CommentsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

## Date Planners

### `GET /api/DatePlanners`

**Gets a single date planner**

Operation ID: `DatePlannersGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | query | string | No |  |

**Response 200:** `OmniumDatePlanner`

---

### `PUT /api/DatePlanners`

**Create or overwrite a date planner.**

Operation ID: `DatePlannersPut`

**Request body:** `OmniumDatePlanner`

**Response 200:** `OmniumDatePlanner`

---

### `DELETE /api/DatePlanners`

**Delete a date planner**

Operation ID: `DatePlannersDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | query | string | No |  |

**Response 200:** `OmniumDatePlanner`

---

## Event Log

### `POST /api/EventLog/Search`

**Search in the event log**

Operation ID: `EventLogSearch`

**Request body:** `OmniumEventLogSearchRequest`

**Response 200:** `OmniumEventLogItemOmniumResult`

---

### `POST /api/EventLog/SearchByPrevious/{eventLogModel}/{objectId}`

**Search for events based on previous event**

Operation ID: `EventLogSearchByPrevious`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `eventLogModel` | path | string | Yes | Type of the object the event occured for |
| `objectId` | path | string | Yes | Id of the object the event occured for |

**Request body:** `OmniumEventLogCompareRequest`

**Response 200:** `List<OmniumEventLogItem>`

---

## Health

### `GET /api/Health`

**Omnium health check**

Operation ID: `HealthHealth`

---

## Invoices

### `GET /api/Invoices`

**Get all invoices**

Operation ID: `InvoicesGetInvoices`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |
| `isPaid` | query | boolean | No | Filter on paid or unpaid invoices. Leave unassigned to get all. |

**Response 200:** `OmniumInvoiceOmniumSearchResult`

---

### `GET /api/Invoices/{invoiceId}`

**Returns a single invoice**

Operation ID: `InvoicesGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `invoiceId` | path | string | Yes | Invoice ID |

**Response 200:** `OmniumInvoice`

---

### `DELETE /api/Invoices/{invoiceId}`

**Delete invoice and related invoice file**

Operation ID: `InvoicesDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `invoiceId` | path | string | Yes |  |

---

### `GET /api/Invoices/Customers/{customerId}`

**Get all invoices associated with customer**

Operation ID: `InvoicesGetInvoicesByCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | path | string | Yes | Customer identification |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |
| `isPaid` | query | boolean | No | If the invoices are paid or not |

**Response 200:** `OmniumInvoiceOmniumSearchResult`

---

### `GET /api/Invoices/GetAsPdf/{invoiceId}`

**Get copy of invoice**

Operation ID: `InvoicesGetAsPdf`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `invoiceId` | path | string | Yes |  |

---

### `PUT /api/Invoices/UpdateInvoice`

**Add/Update invoice**

Operation ID: `InvoicesUpdateInvoice`

**Request body:** `OmniumInvoice`

**Response 200:** `OmniumInvoice`

---

### `POST /api/Invoices/Search`

**Search for invoices**

Operation ID: `InvoicesSearch`

**Request body:** `OmniumInvoiceSearchRequest`

**Response 200:** `OmniumInvoiceOmniumInvoiceTotalsOmniumSearchResultWithTotals`

---

### `POST /api/Invoices/AddInvoice`

**Upload invoice-file from stream - creates new invoice**

Operation ID: `InvoicesAddInvoice`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `fileName` | query | string | Yes | Name of uploaded invoice file |
| `projectId` | query | string | No | Project connected to the created invoice (Optional) |
| `orderId` | query | string | No | Order connected to the created invoice (Optional) |

**Response 200:** `OmniumInvoice`

---

### `POST /api/Invoices/{invoiceId}/AddFileToInvoice`

**Upload invoice-file from stream - attach to existing invoice**

Operation ID: `InvoicesAddFileToInvoice`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `invoiceId` | path | string | Yes | id of the invoice |
| `fileName` | query | string | No | name of file |

**Response 200:** `OmniumInvoice`

---

### `POST /api/Invoices/{invoiceId}/AddAsset`

**Add asset to invoice from stream.
If assetId is supplied and an asset already exists with the given ID, then asset will be patched with the supplied data.
If assetId is supplied and no asset with the given ID exists, then the created asset will be assigned the supplied assetId.
If assetId is empty, a new asset will be created and assigned a guid as ID.**

Operation ID: `InvoicesAddAsset`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `invoiceId` | path | string | Yes |  |
| `fileName` | query | string | Yes |  |
| `assetId` | query | string | No |  |

**Response 200:** `OmniumInvoice`

---

## Ratings

### `PUT /api/Ratings`

**Add or save a rating. If ID is null, it will be created.**

Operation ID: `RatingsPut`

**Request body:** `OmniumRating`

---

### `DELETE /api/Ratings/{id}`

**Deletes a single rating from the OMS**

Operation ID: `RatingsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

### `GET /api/Ratings/GetRatings`

**Get ratings for an Omnium object**

Operation ID: `RatingsGetRatings`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `type` | query | string | No | The object class to get ratings from (e.g. BusinessCustomer, Product, etc) |
| `objectId` | query | string | No | The object id to get ratings from (e.g. 12345) |
| `page` | query | integer (int32) | No | Page number |
| `take` | query | integer (int32) | No | Number of elements |
| `ignoreRequiresAttention` | query | boolean | No | Ignore ratings that needs attention by customer service (default: true) |
| `parentObjectId` | query | string | No | The parent object id to get ratings for. If both objectId and parentObjectd has  |
| `includeOnlyRatingsWithComments` | query | boolean | No | Return only ratings with comments |

**Request body:** `array`

**Response 200:** `OmniumRatingOmniumSearchResult`

---

### `POST /api/Ratings/Search`

**Search for ratings**

Operation ID: `RatingsSearchRatings`

**Request body:** `OmniumSearchRatingRequest`

**Response 200:** `OmniumRatingOmniumSearchResult`

---

### `POST /api/Ratings/ScrollSearch`

**Scroll large amounts of ratings**

Operation ID: `RatingsScrollSearchRatings`

**Request body:** `OmniumSearchRatingRequest`

**Response 200:** `OmniumRatingOmniumSearchResult`

---

### `GET /api/Ratings/Scroll/{id}`

**Scroll ratings is used to get a large amount of ratings.**

Operation ID: `RatingsScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumRatingOmniumResult`

---

### `GET /api/Ratings/GetAverageRatings`

**Get average rating for an Omnium object**

Operation ID: `RatingsGetAverageRatings`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `type` | query | string | No | The object class to get ratings from (e.g. BusinessCustomer, Product, etc) |
| `objectId` | query | string | No | The object id to get ratings from (e.g. 12345) |
| `ignoreRequiresAttention` | query | boolean | No | Ignore ratings that needs attention by customer service |
| `parentObjectId` | query | string | No | The parent object id to get ratings for. If both objectId and parentObjectd has  |

**Request body:** `array`

**Response 200:** `number`

---

## SCIM Groups

### `GET /scim/v2/{tenantId}/{provider}/Groups/{id}`

**Get a group by ID**

Operation ID: `ScimGroupsGetGroup`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Group ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Response 200:** `ScimGroup`

---

### `PUT /scim/v2/{tenantId}/{provider}/Groups/{id}`

**Update a group (full replacement)**

Operation ID: `ScimGroupsUpdateGroup`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Group ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Request body:** `ScimGroup`

**Response 200:** `ScimGroup`

---

### `PATCH /scim/v2/{tenantId}/{provider}/Groups/{id}`

**Patch a group (partial update)**

Operation ID: `ScimGroupsPatchGroup`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Group ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Request body:** `ScimPatchRequest`

**Response 200:** `ScimGroup`

---

### `DELETE /scim/v2/{tenantId}/{provider}/Groups/{id}`

**Delete a group**

Operation ID: `ScimGroupsDeleteGroup`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Group ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

---

### `GET /scim/v2/{tenantId}/{provider}/Groups`

**Get groups with optional filtering and pagination**

Operation ID: `ScimGroupsGetGroups`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `filter` | query | string | No | SCIM filter expression (e.g., displayName eq "Administrators") |
| `startIndex` | query | integer (int32) | No | 1-based index of the first result |
| `count` | query | integer (int32) | No | Number of resources to return |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Response 200:** `ScimGroupScimListResponse`

---

### `POST /scim/v2/{tenantId}/{provider}/Groups`

**Create a new group**

Operation ID: `ScimGroupsCreateGroup`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Request body:** `ScimGroup`

**Response 200:** `ScimGroup`

---

## SCIM Users

### `GET /scim/v2/{tenantId}/{provider}/Users/{id}`

**Get a user by ID**

Operation ID: `ScimUsersGetUser`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | User ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Response 200:** `ScimUser`

---

### `PUT /scim/v2/{tenantId}/{provider}/Users/{id}`

**Update a user (full replacement)**

Operation ID: `ScimUsersUpdateUser`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | User ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Request body:** `ScimUser`

**Response 200:** `ScimUser`

---

### `PATCH /scim/v2/{tenantId}/{provider}/Users/{id}`

**Patch a user (partial update)**

Operation ID: `ScimUsersPatchUser`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | User ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Request body:** `ScimPatchRequest`

**Response 200:** `ScimUser`

---

### `DELETE /scim/v2/{tenantId}/{provider}/Users/{id}`

**Delete a user**

Operation ID: `ScimUsersDeleteUser`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | User ID |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

---

### `GET /scim/v2/{tenantId}/{provider}/Users`

**Get users with optional filtering and pagination**

Operation ID: `ScimUsersGetUsers`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `filter` | query | string | No | SCIM filter expression (e.g., userName eq "user@example.com") |
| `startIndex` | query | integer (int32) | No | 1-based index of the first result |
| `count` | query | integer (int32) | No | Number of resources to return |
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Response 200:** `ScimUserScimListResponse`

---

### `POST /scim/v2/{tenantId}/{provider}/Users`

**Create a new user**

Operation ID: `ScimUsersCreateUser`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `tenantId` | path | string | Yes |  |
| `provider` | path | string | Yes |  |

**Request body:** `ScimUser`

**Response 200:** `ScimUser`

---

## Settings

### `GET /api/Settings/OrderSettings`

**Returns order settings**

Operation ID: `SettingsOrderSettings`

**Response 200:** `OmniumOrderSettings`

---

### `GET /api/Settings/OrderTypes`

**Returns order type settings**

Operation ID: `SettingsOrderTypes`

**Response 200:** `List<OmniumOrderType>`

---

### `GET /api/Settings/CustomerSettings`

**Returns customer settings**

Operation ID: `SettingsCustomerSettings`

**Response 200:** `OmniumCustomerSettings`

---

## Settings | Products

### `GET /api/settings/ProductSettings/ProductSettings`

**Returns all product settings.**

Operation ID: `ProductSettingsProductSettings`

**Response 200:** `OmniumProductSettings`

---

### `PUT /api/settings/ProductSettings/ProductType`

**Add a product type, or update if a product type with the same name already exists.**

Operation ID: `ProductSettingsProductType`

**Request body:** `OmniumProductTypeItem`

---

### `DELETE /api/settings/ProductSettings/DeleteProductType/{name}`

**Delete the product type with the given name.**

Operation ID: `ProductSettingsDeleteProductType`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `name` | path | string | Yes |  |

---

## Triggers

### `POST /api/Trigger`

**Trigger a preconfigured action**

Operation ID: `TriggersPost`

**Request body:** `OmniumTriggerRequest`

**Response 200:** `string`

---

## Users

### `GET /api/Role/{roleId}`

**Get role by ID**

Operation ID: `RoleGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `roleId` | path | string | Yes |  |

**Response 200:** `OmniumRole`

---

### `DELETE /api/Role/{roleId}`

**Delete a role**

Operation ID: `RoleDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `roleId` | path | string | Yes |  |

---

### `GET /api/Role/GetAll`

**Get all roles**

Operation ID: `RoleGetAll`

**Response 200:** `List<OmniumRole>`

---

### `POST /api/Role/Add`

**Add a new OmniumRole**

Operation ID: `RoleAdd`

**Request body:** `OmniumRole`

**Response 200:** `OmniumRole`

---

### `PUT /api/Role/Update`

**Update a role**

Operation ID: `RoleUpdate`

**Request body:** `OmniumRole`

**Response 200:** `OmniumRole`

---

### `POST /api/User/Add`

**Add a new omnium user. ID must be a valid email-address and not be in use by another user.**

Operation ID: `UserAdd`

**Request body:** `OmniumUserModel`

---

### `PUT /api/User`

**Add or save a user. ID must be a valid email-address.**

Operation ID: `UserPut`

**Request body:** `OmniumUserModel`

---

### `GET /api/User/{id}`

**Get an omnium user.**

Operation ID: `UserGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

**Response 200:** `OmniumUserModel`

---

### `PATCH /api/User/{id}`

**Patch user - update only values in request**

Operation ID: `UserPatchUser`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | User ID to patch |

**Request body:** `OmniumUserPatch`

---

### `DELETE /api/User/{id}`

**Deletes a single user from the OMS**

Operation ID: `UserDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

### `GET /api/User/GetAll`

**Get all users**

Operation ID: `UserGetAll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `sortOrder` | query | string | No | Sort order (optional) |

**Response 200:** `List<OmniumUserModel>`

---
