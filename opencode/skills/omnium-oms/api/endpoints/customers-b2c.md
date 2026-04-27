# Customers — Private (B2C) — API Endpoints

See `schemas/customers.md` for field definitions.

## Contents

### Customers | B2C

- `POST /api/PrivateCustomers`
- `POST /api/PrivateCustomers/AddMany`
- `PUT /api/PrivateCustomers/AddOrUpdateMany`
- `POST /api/PrivateCustomers/Update`
- `PATCH /api/PrivateCustomers/PatchPrivateCustomer`
- `GET /api/PrivateCustomers/{customerId}`
- `GET /api/PrivateCustomers/GetCustomerByPhoneAndStore`
- `DELETE /api/PrivateCustomers/Anonymize`
- `DELETE /api/PrivateCustomers/{id}`
- `GET /api/PrivateCustomers/Information/{id}`
- `POST /api/PrivateCustomers/Consents`
- `GET /api/PrivateCustomers/Consents/{id}`
- `POST /api/PrivateCustomers/Search`
- `POST /api/PrivateCustomers/Scroll`
- `GET /api/PrivateCustomers/Scroll/{id}`
- `GET /api/PrivateCustomers/{id}/CustomerClubMember`
- `POST /api/PrivateCustomers/{id}/CustomerClubMember/Add`
- `POST /api/PrivateCustomers/{id}/CustomerClubMember/AddPending`
- `POST /api/PrivateCustomers/{id}/CustomerClubMember/AddWithConsentList`
- `POST /api/PrivateCustomers/{id}/CustomerClubMember/UpdateConsentList`
- `POST /api/PrivateCustomers/{id}/CustomerClubMember/AddWithPatchRequest`
- `POST /api/PrivateCustomers/{id}/CustomerClubMember/UpdatedWithPatchRequest`
- `POST /api/PrivateCustomers/{id}/CustomerClubMember/UpdateInterests`
- `DELETE /api/PrivateCustomers/{id}/CustomerClubMember/Remove`
- `PUT /api/PrivateCustomers/AddOrUpdateManyCustomerClubMembers`
- `GET /api/PrivateCustomers/GetAllCustomerClubMembers`
- `POST /api/PrivateCustomers/CustomerClubMembers/Search`
- `GET /api/PrivateCustomers/ScrollCustomerClubMembers/{id}`
- `GET /api/PrivateCustomers/GetCustomerClubInterests`
- `POST /api/PrivateCustomers/UpdateCustomerNumber`
- `GET /api/PrivateCustomers/GetNextCustomerNumber`
- `POST /api/PrivateCustomers/AddComment`

### Customers | B2C | Privacy

- `GET /api/CustomerPrivacy/ChangePrivateCustomerId`
- `POST /api/CustomerPrivacy/ChangePrivateCustomerIdBatch`
- `GET /api/CustomerPrivacy/ChangeBusinessCustomerId`

### Customers | Customer groups

- `GET /api/CustomerGroups/{customerGroupId}`
- `POST /api/CustomerGroups/CustomerGroups/Search`
- `PUT /api/CustomerGroups/CustomerGroups/Add`
- `DELETE /api/CustomerGroups/CustomerGroups/{id}`

---

## Customers | B2C

### `POST /api/PrivateCustomers`

**Add a private customer customer to database.**

Operation ID: `PrivateCustomersPost`

**Request body:** `OmniumPrivateCustomer`

---

### `POST /api/PrivateCustomers/AddMany`

**Adds a range of new customers to the OMS.
Only not existing customers will be added(based on customerId)
Max size in batch is 100**

Operation ID: `PrivateCustomersAddMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `exportCustomers` | query | boolean | No | If true - Omnium will trigger configured connectors to export updated customers |

**Request body:** `List<OmniumPrivateCustomer>`

**Response 200:** `string`

---

### `PUT /api/PrivateCustomers/AddOrUpdateMany`

**Add or update a range of customers to the OMS.
Max size in batch is 100**

Operation ID: `PrivateCustomersAddOrUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `exportCustomers` | query | boolean | No | If true - Omnium will trigger configured connectors to export updated customers |

**Request body:** `List<OmniumPrivateCustomer>`

---

### `POST /api/PrivateCustomers/Update`

**Update private customer**

Operation ID: `PrivateCustomersUpdate`

**Request body:** `OmniumPrivateCustomer`

**Response 200:** `OmniumPrivateCustomer`

---

### `PATCH /api/PrivateCustomers/PatchPrivateCustomer`

**Patch private customer - update only some values in request**

Operation ID: `PrivateCustomersPatchPrivateCustomer`

**Request body:** `OmniumPrivateCustomerPatch`

**Response 200:** `OmniumCustomerUpdateResult`

---

### `GET /api/PrivateCustomers/{customerId}`

**Gets the specified customer identifier.**

Operation ID: `PrivateCustomersGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | path | string | Yes | The customer identifier. |

**Response 200:** `OmniumPrivateCustomer`

---

### `GET /api/PrivateCustomers/GetCustomerByPhoneAndStore`

**Gets customer and related customer club membership info. Customer must have registered phone number and be connected to the specified store.**

Operation ID: `PrivateCustomersGetCustomerByPhoneAndStore`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `phoneNumber` | query | string | Yes | The customers phone number. |
| `storeId` | query | string | Yes | The store the customer is connected to. |

**Response 200:** `OmniumPrivateCustomerViewModel`

---

### `DELETE /api/PrivateCustomers/Anonymize`

**Delete the private customer and anonymize all related orders, projects and other data.**

Operation ID: `PrivateCustomersAnonymizeCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | query | string | Yes | ID of the customer to anonymize |

---

### `DELETE /api/PrivateCustomers/{id}`

**Delete the private customer.
If the customer is a contact person on any business customers, the relation will be deleted**

Operation ID: `PrivateCustomersDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer to delete |

---

### `GET /api/PrivateCustomers/Information/{id}`

**Get all customer personal data, orders and other data stored in the OMS.**

Operation ID: `PrivateCustomersGetPrivateCustomerInformation`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

**Response 200:** `OmniumPrivateCustomerInfo`

---

### `POST /api/PrivateCustomers/Consents`

**Add a new consent for the customer**

Operation ID: `PrivateCustomersAddConsent`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | Yes | ID of the customer |

**Request body:** `OmniumConsent`

---

### `GET /api/PrivateCustomers/Consents/{id}`

**Get all consents for the customer.**

Operation ID: `PrivateCustomersGetConsentsForCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

**Response 200:** `List<OmniumConsent>`

---

### `POST /api/PrivateCustomers/Search`

**Search private customers**

Operation ID: `PrivateCustomersSearch`

**Request body:** `OmniumCustomerSearchRequest`

**Response 200:** `OmniumPrivateCustomerOmniumSearchResult`

---

### `POST /api/PrivateCustomers/Scroll`

**Scroll privateCustomers by search**

Operation ID: `PrivateCustomersScrollSearch`

**Request body:** `OmniumCustomerSearchRequest`

**Response 200:** `OmniumPrivateCustomerOmniumSearchResult`

---

### `GET /api/PrivateCustomers/Scroll/{id}`

**Scroll privateCustomers is used to get a large amount of customers.**

Operation ID: `PrivateCustomersScroll`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumPrivateCustomerOmniumResult`

---

### `GET /api/PrivateCustomers/{id}/CustomerClubMember`

**Get a customer club member**

Operation ID: `PrivateCustomersGetCustomerClubMember`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

**Response 200:** `OmniumCustomerClubMember`

---

### `POST /api/PrivateCustomers/{id}/CustomerClubMember/Add`

**Add customer to customer club. Customer is created if not exist. This membership will be approved(consent by default)**

Operation ID: `PrivateCustomersAddNewCustomerClubMember`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

**Response 200:** `OmniumCustomerClubMember`

---

### `POST /api/PrivateCustomers/{id}/CustomerClubMember/AddPending`

**Add customer to customer club. Customer is created if not exist. Membership is not approved.
To be approved, update consents for this customer**

Operation ID: `PrivateCustomersAddNewPendingCustomerClubMember`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |
| `storeId` | query | string | Yes | ID of the store the customer is coming from |
| `phone` | query | string | No | Optional. If not set, id is used as phone |

**Response 200:** `OmniumCustomerClubMember`

---

### `POST /api/PrivateCustomers/{id}/CustomerClubMember/AddWithConsentList`

**Add customer to customer club member with consents. Customer is created if not exist.**

Operation ID: `PrivateCustomersAddNewCustomerClubMemberWithConsentList`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |
| `salesPersonId` | query | string | No | Id of the person who recruited the member |

**Request body:** `List<OmniumConsent>`

**Response 200:** `OmniumCustomerClubMember`

---

### `POST /api/PrivateCustomers/{id}/CustomerClubMember/UpdateConsentList`

**Update consent list for customer club member**

Operation ID: `PrivateCustomersUpdateCustomerClubMemberConsentList`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

**Request body:** `List<OmniumConsent>`

**Response 200:** `OmniumCustomerClubMember`

---

### `POST /api/PrivateCustomers/{id}/CustomerClubMember/AddWithPatchRequest`

**Add customer to customer club member with patch request, containing both consents, interests and signUp storeId. Customer is created if not exist.**

Operation ID: `PrivateCustomersAddNewCustomerClubMemberWithPatch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

**Request body:** `OmniumCustomerClubMemberPatchRequest`

**Response 200:** `OmniumCustomerClubMember`

---

### `POST /api/PrivateCustomers/{id}/CustomerClubMember/UpdatedWithPatchRequest`

**Update customer club member. Consents and interests will be updated/override with what you send in**

Operation ID: `PrivateCustomersUpdateCustomerClubMemberWithPatch`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

**Request body:** `OmniumCustomerClubMemberPatchRequest`

**Response 200:** `OmniumCustomerClubMember`

---

### `POST /api/PrivateCustomers/{id}/CustomerClubMember/UpdateInterests`

**Update list of interests for a customer club member. The list sent in, will replace existing(add or remove).
Send in empty list(not null) if all interests should be removed**

Operation ID: `PrivateCustomersUpdateCustomerClubMemberInterests`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | Member id |

**Request body:** `array`

**Response 200:** `OmniumCustomerClubMember`

---

### `DELETE /api/PrivateCustomers/{id}/CustomerClubMember/Remove`

**Remove a customer from customer club**

Operation ID: `PrivateCustomersRemoveCustomerClubMember`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | ID of the customer |

---

### `PUT /api/PrivateCustomers/AddOrUpdateManyCustomerClubMembers`

**Add or update a range of CustomerClub members to the OMS.
Max size in batch is 100
Use this endpoint only for import or clean up. All existing points etc will be overridden with the input data
Private customer objects will not be created. Use other endpoint for this**

Operation ID: `PrivateCustomersAddOrUpdateManyCustomerClubMembers`

**Request body:** `List<OmniumCustomerClubMember>`

---

### `GET /api/PrivateCustomers/GetAllCustomerClubMembers`

**Get all Customer club members**

Operation ID: `PrivateCustomersGetAllCustomerClubMembers`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 1000. Minimum 1. |
| `memberSince` | query | string (date-time) | No | Members since a given date and time |

**Response 200:** `OmniumCustomerClubMemberOmniumResult`

---

### `POST /api/PrivateCustomers/CustomerClubMembers/Search`

**Search for customerClubMembers.**

Operation ID: `CustomerClubMembersSearch`

**Request body:** `OmniumCustomerClubMemberSearchRequest`

**Response 200:** `OmniumCustomerClubMemberOmniumResult`

---

### `GET /api/PrivateCustomers/ScrollCustomerClubMembers/{id}`

**Scroll customerClubMembers is used to get a large amount of customerClubMember items.**

Operation ID: `PrivateCustomersScrollCustomerClubMembers`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes | The scroll id is passed on the request the next batch of data from the original  |

**Response 200:** `OmniumCustomerClubMemberOmniumResult`

---

### `GET /api/PrivateCustomers/GetCustomerClubInterests`

**Get available CustomerClub interests. Used to segment users and marketing**

Operation ID: `PrivateCustomersGetCustomerClubInterests`

**Response 200:** `List<OmniumCustomerClubInterests>`

---

### `POST /api/PrivateCustomers/UpdateCustomerNumber`

**Update customer number on customer and all orders**

Operation ID: `PrivateCustomersUpdateCustomerNumber`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | Yes | ID of the customer |
| `customerNumber` | query | string | Yes | The new customer number to be added |

---

### `GET /api/PrivateCustomers/GetNextCustomerNumber`

**Get next generated customer number.**

Operation ID: `PrivateCustomersGetNextCustomerNumber`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `marketId` | query | string | No | Optional: Provide if multiple CustomerNumberOptions configured |

---

### `POST /api/PrivateCustomers/AddComment`

**Add a comment to a customer**

Operation ID: `PrivateCustomersAddComment`

**Request body:** `OmniumCustomerCommentRequest`

---

## Customers | B2C | Privacy

### `GET /api/CustomerPrivacy/ChangePrivateCustomerId`

**Change private customer id, and all data assosiated with that id over to new customer object.**

Operation ID: `CustomerPrivacyChangePrivateCustomerId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `fromCustomerId` | query | string | Yes | Move data from this customer. Customer with this id will also be deleted! |
| `toCustomerId` | query | string | Yes | Move data to this customer. Created if not exist. |

**Response 200:** `OmniumPrivateCustomer`

---

### `POST /api/CustomerPrivacy/ChangePrivateCustomerIdBatch`

**Batch change private customer id, and all data assosiated with that id over to new customer object
Max size in batch is 50**

Operation ID: `CustomerPrivacyChangePrivateCustomerIdBatch`

**Request body:** `List<OmniumChangeCustomerId>`

---

### `GET /api/CustomerPrivacy/ChangeBusinessCustomerId`

**Change business customer id, and all data assosiated with that id over to new customer object.**

Operation ID: `CustomerPrivacyChangeBusinessCustomerId`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `fromCustomerId` | query | string | Yes | Move data from this customer. Customer with this id will also be deleted! |
| `toCustomerId` | query | string | Yes | Move data to this customer. Created if not exist. |

**Response 200:** `OmniumBusinessCustomer`

---

## Customers | Customer groups

### `GET /api/CustomerGroups/{customerGroupId}`

**Get a customer group**

Operation ID: `CustomerGroupsGetCustomerGroup`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerGroupId` | path | string | Yes |  |

**Response 200:** `OmniumCustomerGroup`

---

### `POST /api/CustomerGroups/CustomerGroups/Search`

**Search customer groups logs**

Operation ID: `CustomerGroupsSearch`

**Request body:** `OmniumCustomerGroupSearchRequest`

**Response 200:** `OmniumCustomerGroupOmniumSearchResult`

---

### `PUT /api/CustomerGroups/CustomerGroups/Add`

**Add/update customer group**

Operation ID: `CustomerGroupsAdd`

**Request body:** `OmniumCustomerGroup`

**Response 200:** `OmniumCustomerGroup`

---

### `DELETE /api/CustomerGroups/CustomerGroups/{id}`

**Delete customer group**

Operation ID: `CustomerGroupsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---
