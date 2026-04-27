# Customers — Business (B2B) — API Endpoints

See `schemas/customers.md` for field definitions.

## Contents

### Customers | B2B

- `POST /api/BusinessCustomers`
- `POST /api/BusinessCustomers/Update`
- `PATCH /api/BusinessCustomers/PatchBusinessCustomer`
- `PUT /api/BusinessCustomers/AddOrUpdateMany`
- `GET /api/BusinessCustomers/GetBusinessCustomerByContactPhone`
- `GET /api/BusinessCustomers/GetBusinessCustomerByContactPrivateCustomerId`
- `GET /api/BusinessCustomers/GetBusinessCustomerByContactEmail`
- `GET /api/BusinessCustomers/{id}`
- `DELETE /api/BusinessCustomers/{id}`
- `GET /api/BusinessCustomers/Search` *(deprecated)*
- `POST /api/BusinessCustomers/Search`
- `GET /api/BusinessCustomers/GetAll`
- `GET /api/BusinessCustomers/{id}/SalesLimitations`
- `GET /api/BusinessCustomers/SalesLimitations`
- `POST /api/BusinessCustomers/Scroll`
- `GET /api/BusinessCustomers/Scroll/{id}`
- `POST /api/BusinessCustomers/SendEmailToCustomer/{businessCustomerId}`
- `DELETE /api/BusinessCustomers/DeleteAll`
- `POST /api/BusinessCustomers/UpdateCustomerNumber`
- `GET /api/BusinessCustomers/GetNextCustomerNumber`

### Customers | B2B | Assets

- `GET /api/BusinessCustomer/{businessCustomerId}/Assets/GetAssets`
- `POST /api/BusinessCustomer/{businessCustomerId}/Assets/AddAsset`
- `POST /api/BusinessCustomer/{businessCustomerId}/Assets/AddAssets`
- `POST /api/BusinessCustomer/{businessCustomerId}/Assets/UpdateAssets`
- `DELETE /api/BusinessCustomer/{businessCustomerId}/Assets/DeleteAssets`

### Customers | B2B | Contact persons

- `GET /api/BusinessCustomer/{businessCustomerId}/ContactPerson/GetContactPersons`
- `PUT /api/BusinessCustomer/{businessCustomerId}/ContactPerson/AddContactPerson`
- `DELETE /api/BusinessCustomer/{businessCustomerId}/ContactPerson/DeleteContactPerson`

---

## Customers | B2B

### `POST /api/BusinessCustomers`

**Add business customer to database**

Operation ID: `BusinessCustomersPost`

**Request body:** `OmniumBusinessCustomer`

---

### `POST /api/BusinessCustomers/Update`

**Update business customer**

Operation ID: `BusinessCustomersUpdate`

**Request body:** `OmniumBusinessCustomer`

**Response 200:** `OmniumBusinessCustomer`

---

### `PATCH /api/BusinessCustomers/PatchBusinessCustomer`

**Patch business customer - update only some values in request**

Operation ID: `BusinessCustomersPatchBusinessCustomer`

**Request body:** `OmniumBusinessCustomerPatch`

**Response 200:** `OmniumCustomerUpdateResult`

---

### `PUT /api/BusinessCustomers/AddOrUpdateMany`

**Add or update a range of customers to the OMS.
Max size in batch is 100**

Operation ID: `BusinessCustomersAddOrUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `enrichContactsFromPrivateCustomers` | query | boolean | No | If true then Omnium will attempt to enrich the contacts with info from existing  |

**Request body:** `List<OmniumBusinessCustomer>`

---

### `GET /api/BusinessCustomers/GetBusinessCustomerByContactPhone`

**Get business customers by searching for phone number of contact person**

Operation ID: `BusinessCustomersGetBusinessCustomerByContactPhone`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `phoneNumber` | query | string | Yes | Phone number of contact person |

**Response 200:** `List<OmniumBusinessCustomer>`

---

### `GET /api/BusinessCustomers/GetBusinessCustomerByContactPrivateCustomerId`

**Get business customers by searching for contact person private customer ID**

Operation ID: `BusinessCustomersGetBusinessCustomerByContactPrivateCustomerId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `privateCustomerId` | query | string | Yes |  |

**Response 200:** `List<OmniumBusinessCustomer>`

---

### `GET /api/BusinessCustomers/GetBusinessCustomerByContactEmail`

**Get business customers by searching for e-mail of contact person**

Operation ID: `BusinessCustomersGetBusinessCustomerByContactEmail`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `email` | query | string | Yes | Email of contact person |

**Response 200:** `List<OmniumBusinessCustomer>`

---

### `GET /api/BusinessCustomers/{id}`

**Get business customer by ID**

Operation ID: `BusinessCustomersGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Customer ID |

**Response 200:** `OmniumBusinessCustomer`

---

### `DELETE /api/BusinessCustomers/{id}`

**Delete business customer**

Operation ID: `BusinessCustomersDeleteBusinessCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Business customer ID |

---

### `GET /api/BusinessCustomers/Search` ⚠️ DEPRECATED

**Free text search for business customers**

Operation ID: `BusinessCustomerFreeTextSearch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `query` | query | string | No | Search query |

**Response 200:** `OmniumBusinessCustomerOmniumSearchResult`

---

### `POST /api/BusinessCustomers/Search`

**Search business customers**

Operation ID: `BusinessCustomersSearch`

**Request body:** `OmniumCustomerSearchRequest`

**Response 200:** `OmniumBusinessCustomerOmniumSearchResult`

---

### `GET /api/BusinessCustomers/GetAll`

**Get all business customers, or get all business customers that has been changed since a given date and time.**

Operation ID: `BusinessCustomersGetAll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |
| `sortOrder` | query | string | No | Sort order. E.g. ModifiedAscending, ModifiedDescending, CreatedAscending, Create |
| `changedSince` | query | string (date-time) | No | Customers added or modified since a given date and time |

**Response 200:** `OmniumBusinessCustomerOmniumSearchResult`

---

### `GET /api/BusinessCustomers/{id}/SalesLimitations`

**Get all sales limitations for the customer.**

Operation ID: `BusinessCustomersGetSalesLimitationsForCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |
| `marketId` | query | string | No | Market ID for the the customer |

**Response 200:** `List<OmniumSalesLimitation>`

---

### `GET /api/BusinessCustomers/SalesLimitations`

**Get all sales limitations all customers.**

Operation ID: `BusinessCustomersGetSalesLimitations`

**Response 200:** `List<OmniumSalesLimitation>`

---

### `POST /api/BusinessCustomers/Scroll`

**Scroll business Customer by search**

Operation ID: `BusinessCustomersScrollSearch`

**Request body:** `OmniumCustomerSearchRequest`

**Response 200:** `OmniumBusinessCustomerOmniumSearchResult`

---

### `GET /api/BusinessCustomers/Scroll/{id}`

**Scroll is used to get a large amount of business customers.**

Operation ID: `BusinessCustomersScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumBusinessCustomerOmniumSearchResult`

---

### `POST /api/BusinessCustomers/SendEmailToCustomer/{businessCustomerId}`

**Send email to business customer. Gets logged as note to customer. Consider using Notifications/SendEmail for more general purposes.**

Operation ID: `BusinessCustomersSendEmailToCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerId` | path | string | Yes | Customer |

**Request body:** `OmniumEmailMessage`

---

### `DELETE /api/BusinessCustomers/DeleteAll`

**Deleting ALL items! For development environments ONLY**

Operation ID: `BusinessCustomersDeleteAll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `safeword` | query | string | No |  |
| `tenantId` | query | string | No |  |

---

### `POST /api/BusinessCustomers/UpdateCustomerNumber`

**Update customer number on customer and all orders**

Operation ID: `BusinessCustomersUpdateCustomerNumber`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | Yes | ID of the customer |
| `customerNumber` | query | string | Yes | The new customer number to be added |

---

### `GET /api/BusinessCustomers/GetNextCustomerNumber`

**Get next generated customer number.**

Operation ID: `BusinessCustomersGetNextCustomerNumber`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | query | string | No | Optional: Provide if multiple CustomerNumberOptions configured |

**Response 200:** `string`

---

## Customers | B2B | Assets

### `GET /api/BusinessCustomer/{businessCustomerId}/Assets/GetAssets`

**Get customer assets**

Operation ID: `BusinessCustomerAssetsGetAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `assetIds` | query | array | No |  |
| `businessCustomerId` | path | string | Yes |  |

**Response 200:** `List<OmniumAsset>`

---

### `POST /api/BusinessCustomer/{businessCustomerId}/Assets/AddAsset`

**Add asset to customer from stream**

Operation ID: `BusinessCustomerAssetsAddAsset`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerId` | path | string | Yes |  |
| `fileName` | query | string | No |  |

**Response 200:** `OmniumBusinessCustomer`

---

### `POST /api/BusinessCustomer/{businessCustomerId}/Assets/AddAssets`

**Add assets to customer**

Operation ID: `BusinessCustomerAssetsAddAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerId` | path | string | Yes |  |

**Request body:** `List<OmniumAsset>`

**Response 200:** `OmniumBusinessCustomer`

---

### `POST /api/BusinessCustomer/{businessCustomerId}/Assets/UpdateAssets`

**Update asset to customer**

Operation ID: `BusinessCustomerAssetsUpdateAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerId` | path | string | Yes |  |

**Request body:** `List<OmniumAsset>`

**Response 200:** `OmniumBusinessCustomer`

---

### `DELETE /api/BusinessCustomer/{businessCustomerId}/Assets/DeleteAssets`

**Delete assets from customers**

Operation ID: `BusinessCustomerAssetsDeleteAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `assetIds` | query | array | No |  |
| `businessCustomerId` | path | string | Yes |  |

---

## Customers | B2B | Contact persons

### `GET /api/BusinessCustomer/{businessCustomerId}/ContactPerson/GetContactPersons`

**Get contact persons on business customer**

Operation ID: `BusinessCustomerContactPersonGetContactPersons`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerId` | path | string | Yes |  |

**Response 200:** `List<OmniumContactPerson>`

---

### `PUT /api/BusinessCustomer/{businessCustomerId}/ContactPerson/AddContactPerson`

**Add contact person to business customer. Replace if contact person with the same id, email or phone already exists.**

Operation ID: `BusinessCustomerContactPersonAddContactPerson`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerId` | path | string | Yes |  |

**Request body:** `OmniumContactPerson`

**Response 200:** `List<OmniumContactPerson>`

---

### `DELETE /api/BusinessCustomer/{businessCustomerId}/ContactPerson/DeleteContactPerson`

**Deletes the contact person with matching id, email or phone.**

Operation ID: `BusinessCustomerContactPersonDeleteContactPerson`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerId` | path | string | Yes |  |
| `contactPersonId` | query | string | No |  |
| `contactPersonEmail` | query | string | No |  |
| `contactPersonPhone` | query | string | No |  |

---
