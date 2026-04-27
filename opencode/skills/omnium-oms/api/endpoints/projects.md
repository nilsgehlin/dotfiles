# Projects — API Endpoints

See `schemas/common.md` for field definitions.

## Contents

### Projects

- `GET /api/Projects/{projectId}`
- `GET /api/Projects/GetProjectsByPartner`
- `GET /api/Projects/GetProjectsByCustomer`
- `POST /api/Projects/Search`
- `GET /api/Projects/Create`
- `POST /api/Projects/AddLogItem`
- `POST /api/Projects/Activate`
- `POST /api/Projects/UpdateProjectStatus`
- `PUT /api/Projects`
- `PATCH /api/Projects`
- `PUT /api/Projects/{projectId}/partner/{businessCustomerId}`
- `DELETE /api/Projects/{projectId}/partner`
- `GET /api/Projects/GetProjectTypes`
- `POST /api/Projects/AddCustomerToProject`
- `POST /api/Projects/AddBusinessCustomerToProject`
- `POST /api/Projects/AddStoreToProject`
- `POST /api/Projects/AddFormElementsToProject`
- `GET /api/Projects/{projectId}/Invoices`
- `POST /api/Projects/Cancel`
- `POST /api/Projects/Decline`
- `POST /api/Projects/Accept`
- `POST /api/Projects/AcceptPartnerRequest`
- `POST /api/Projects/{projectId}/Partners`
- `DELETE /api/Projects/{projectId}/Partners`
- `POST /api/Projects/DeclinePartnerRequest`
- `POST /api/Projects/GoToWorkflowStep`
- `POST /api/Projects/{projectId}/AddRejectingPartner`
- `DELETE /api/Projects/{projectId}/RemoveRejectingPartner`
- `POST /api/Projects/Project/{projectId}/SendEmail`
- `POST /api/Projects/Project/{projectId}/SendSms`

### Projects | Assets

- `GET /api/Projects/Assets/GetAssets`
- `POST /api/Projects/Assets/AddAsset/{projectId}`
- `POST /api/Projects/Assets/AddAssets/{projectId}`
- `POST /api/Projects/Assets/UpdateAssets`
- `DELETE /api/Projects/Assets/DeleteAssets`
- `DELETE /api/Projects/Assets/DeleteAssetsFromProject`

### Projects | Change orders

- `GET /api/Projects/{projectId}/ChangeOrders/{projectChangeOrderId}`
- `DELETE /api/Projects/{projectId}/ChangeOrders/{projectChangeOrderId}`
- `POST /api/Projects/{projectId}/ChangeOrders`
- `PUT /api/Projects/{projectId}/ChangeOrders`
- `POST /api/Projects/{projectId}/ChangeOrders/AddMany`
- `PUT /api/Projects/{projectId}/ChangeOrders/UpdateMany`

### Projects | Logs

- `GET /api/Projects/{projectId}/Log`
- `POST /api/Projects/ProjectLogs/Search`
- `PUT /api/Projects/ProjectLogs/Add`
- `DELETE /api/Projects/ProjectLogs/{id}`

### Projects | Parts

- `GET /api/Projects/{projectId}/ProjectParts/{projectPartId}`
- `DELETE /api/Projects/{projectId}/ProjectParts/{projectPartId}`
- `POST /api/Projects/{projectId}/ProjectParts`
- `PUT /api/Projects/{projectId}/ProjectParts`
- `POST /api/Projects/{projectId}/ProjectParts/AddMany`
- `PUT /api/Projects/{projectId}/ProjectParts/{projectPartId}/UpdateProjectTask`
- `PUT /api/Projects/{projectId}/ProjectParts/UpdateMany`

### Projects | Project types

- `GET /api/ProjectTypes/GetAll`
- `PATCH /api/ProjectTypes`

### Projects | Reports

- `POST /api/ProjectReports/GetProjectDailyReports`
- `POST /api/ProjectReports/GetProjectTypeReports`

### Projects | Time entries

- `GET /api/Projects/{projectId}/TimeEntries`
- `POST /api/Projects/TimeEntries/Search`
- `PUT /api/Projects/TimeEntries/Add`
- `DELETE /api/Projects/TimeEntries/{id}`
- `POST /api/Projects/TimeEntries/DeleteMany`

### Projects | Transactions

- `GET /api/Projects/{projectId}/Transactions/{projectTransactionId}`
- `DELETE /api/Projects/{projectId}/Transactions/{projectTransactionId}`
- `POST /api/Projects/{projectId}/Transactions`
- `PUT /api/Projects/{projectId}/Transactions`
- `POST /api/Projects/Transactions/Sum`
- `POST /api/Projects/{projectId}/Transactions/AddMany`
- `PUT /api/Projects/{projectId}/Transactions/UpdateMany`

### Projects | Versions

- `GET /api/Projects/Versions/{projectId}`
- `GET /api/Projects/Versions/{projectId}/{versionId}`

---

## Projects

### `GET /api/Projects/{projectId}`

**Get single project**

Operation ID: `ProjectsGet`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |

**Response 200:** `OmniumProject`

---

### `GET /api/Projects/GetProjectsByPartner`

**Get all projects associated with supplier**

Operation ID: `ProjectsGetProjectsByPartner`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `partnerId` | query | string | No | Partner identification |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |
| `sortOrder` | query | string | No | Property to sort by |

**Response 200:** `OmniumProjectOmniumSearchResult`

---

### `GET /api/Projects/GetProjectsByCustomer`

**Get all projects associated with customer**

Operation ID: `ProjectsGetProjectsByCustomer`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `customerId` | query | string | No | Customer identification |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |
| `sortOrder` | query | string | No | Property to sort by |

**Response 200:** `OmniumProjectOmniumSearchResult`

---

### `POST /api/Projects/Search`

**Search for projects**

Operation ID: `ProjectsSearch`

**Request body:** `OmniumProjectSearchRequest`

**Response 200:** `OmniumProjectOmniumSearchResult`

---

### `GET /api/Projects/Create`

**Add project to OMS.**

Operation ID: `ProjectsCreate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectTypeId` | query | string | No | ID of the project type to create |

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/AddLogItem`

**Add log item to project**

Operation ID: `ProjectsAddLogItem`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | query | string | No |  |

**Request body:** `OmniumProjectLog`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/Activate`

**Activate project - Used to reactivate cancelled projects or projects on hold. Will trigger reactivation notification if configured on the project type.**

Operation ID: `ProjectsActivate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `comment` | query | string | No |  |

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/UpdateProjectStatus`

Operation ID: `ProjectsUpdateProjectStatus`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | query | string | No |  |
| `status` | query | string | No |  |
| `comment` | query | string | No |  |

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects`

**Update project**

Operation ID: `ProjectsUpdateProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `runWorkflow` | query | boolean | No | If true, workflow will be processed |

**Request body:** `OmniumProjectUpdateRequest`

**Response 200:** `OmniumProject`

---

### `PATCH /api/Projects`

**Patch Project - update only values in request**

Operation ID: `ProjectsPatchProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `runWorkflow` | query | boolean | No | If true, workflow will be processed |

**Request body:** `OmniumProjectPatch`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/partner/{businessCustomerId}`

**Add partner to project**

Operation ID: `ProjectsAddPartnerToProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `businessCustomerId` | path | string | Yes |  |

**Response 200:** `OmniumProject`

---

### `DELETE /api/Projects/{projectId}/partner`

**Delete partner from project**

Operation ID: `ProjectsDeletePartnerFromProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |

**Response 200:** `OmniumProject`

---

### `GET /api/Projects/GetProjectTypes`

**Get all project types**

Operation ID: `ProjectsGetProjectTypes`

**Response 200:** `List<OmniumProjectType>`

---

### `POST /api/Projects/AddCustomerToProject`

**Add customer info to a project**

Operation ID: `ProjectsAddCustomerToProject`

**Request body:** `OmniumProject`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/AddBusinessCustomerToProject`

**Add existing business customer info to a project**

Operation ID: `ProjectsAddBusinessCustomerToProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | query | string | Yes | ID of project |
| `businessCustomerId` | query | string | Yes | ID of business customer |

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/AddStoreToProject`

**Add store id to a project**

Operation ID: `ProjectsAddStoreToProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `runWorkflow` | query | boolean | No | If true, workflow will be processed |

**Request body:** `OmniumProject`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/AddFormElementsToProject`

**Add information (key, value) to a project**

Operation ID: `ProjectsAddFormElementsToProject`

**Request body:** `OmniumProject`

**Response 200:** `OmniumProject`

---

### `GET /api/Projects/{projectId}/Invoices`

**Get all invoices associated with project**

Operation ID: `ProjectsGetInvoicesForProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project identification |
| `page` | query | integer (int32) | No | Current page of the search request. Minimum 1. |
| `pageSize` | query | integer (int32) | No | Max 100. Minimum 1. |
| `isPaid` | query | boolean | No | Add filter on payment-status |

**Response 200:** `OmniumInvoiceOmniumSearchResult`

---

### `POST /api/Projects/Cancel`

**Cancel project**

Operation ID: `ProjectsCancel`

**Request body:** `OmniumProjectCancelRequest`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/Decline`

**Decline workflow step (go to previous step)**

Operation ID: `ProjectsDecline`

**Request body:** `OmniumWorkflowStepRequest`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/Accept`

**Accept workflow step (go to next step)**

Operation ID: `ProjectsAccept`

**Request body:** `OmniumWorkflowStepRequest`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/AcceptPartnerRequest`

**Accept workflow step (go to next step)**

Operation ID: `ProjectsAcceptPartnerRequest`

**Request body:** `OmniumWorkflowStepRequest`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/{projectId}/Partners`

**Add partners to project**

Operation ID: `ProjectsAddPartners`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerIds` | query | array | No |  |
| `projectId` | path | string | Yes |  |

**Response 200:** `OmniumProject`

---

### `DELETE /api/Projects/{projectId}/Partners`

**Delete partners from project**

Operation ID: `ProjectsDeletePartners`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `businessCustomerIds` | query | array | No |  |
| `projectId` | path | string | Yes |  |

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/DeclinePartnerRequest`

**Decline workflow step (go to previous step)**

Operation ID: `ProjectsDeclinePartnerRequest`

**Request body:** `OmniumWorkflowStepRequest`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/GoToWorkflowStep`

**Go to specific workflow step**

Operation ID: `ProjectsGoToWorkflowStep`

**Request body:** `OmniumWorkflowStepRequest`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/{projectId}/AddRejectingPartner`

**Add partner to list of partners rejecting project**

Operation ID: `ProjectsAddRejectingPartner`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `rejectingPartnerId` | query | string | No | PartnerId |

---

### `DELETE /api/Projects/{projectId}/RemoveRejectingPartner`

**Remove partner from list of partners rejecting project**

Operation ID: `ProjectsRemoveRejectingPartner`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `rejectingPartnerId` | query | string | No | PartnerId |

---

### `POST /api/Projects/Project/{projectId}/SendEmail`

**Send E-mail**

Operation ID: `ProjectsSendEmail`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |

**Request body:** `OmniumEmailMessage`

---

### `POST /api/Projects/Project/{projectId}/SendSms`

**Send SMS**

Operation ID: `ProjectsSendSms`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |

**Request body:** `OmniumSmsMessage`

---

## Projects | Assets

### `GET /api/Projects/Assets/GetAssets`

**Get project assets**

Operation ID: `ProjectsGetAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `assetIds` | query | array | No |  |

**Response 200:** `List<OmniumAsset>`

---

### `POST /api/Projects/Assets/AddAsset/{projectId}`

**Add asset to project from stream**

Operation ID: `ProjectsAddAsset`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `fileName` | query | string | No |  |

**Response 200:** `OmniumAsset`

---

### `POST /api/Projects/Assets/AddAssets/{projectId}`

**Add assets to project**

Operation ID: `ProjectsAddAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |

**Request body:** `List<OmniumAsset>`

---

### `POST /api/Projects/Assets/UpdateAssets`

**Update asset to project**

Operation ID: `ProjectsUpdateAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | query | string | No |  |

**Request body:** `List<OmniumAsset>`

**Response 200:** `List<OmniumAsset>`

---

### `DELETE /api/Projects/Assets/DeleteAssets`

**Delete assets from projects**

Operation ID: `ProjectsDeleteAssets`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `assetIds` | query | array | No |  |

---

### `DELETE /api/Projects/Assets/DeleteAssetsFromProject`

**Delete all assets from project**

Operation ID: `ProjectsDeleteAssetsFromProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | query | string | No |  |

---

## Projects | Change orders

### `GET /api/Projects/{projectId}/ChangeOrders/{projectChangeOrderId}`

**Get project change order**

Operation ID: `ProjectsChangeOrdersGetProjectChangeOrder`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `changeOrderId` | query | string | No | Project change order ID to get |
| `projectChangeOrderId` | path | string | Yes |  |

**Response 200:** `OmniumProjectChangeOrder`

---

### `DELETE /api/Projects/{projectId}/ChangeOrders/{projectChangeOrderId}`

**Update project change order**

Operation ID: `ProjectsChangeOrdersProjectChangeOrderDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `projectChangeOrderId` | path | string | Yes | Project change order ID to delete |

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/{projectId}/ChangeOrders`

**Add project change order**

Operation ID: `ProjectsChangeOrdersProjectChangeOrderAdd`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `OmniumProjectChangeOrder`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/ChangeOrders`

**Update project change orders**

Operation ID: `ProjectsChangeOrdersProjectChangeOrdersUpdate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `OmniumProjectChangeOrder`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/{projectId}/ChangeOrders/AddMany`

**Update many project change orders**

Operation ID: `ProjectsChangeOrdersProjectChangeOrdersAddMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `List<OmniumProjectChangeOrder>`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/ChangeOrders/UpdateMany`

**Update many project change orders**

Operation ID: `ProjectsChangeOrdersProjectChangeOrderUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `List<OmniumProjectChangeOrder>`

**Response 200:** `OmniumProject`

---

## Projects | Logs

### `GET /api/Projects/{projectId}/Log`

**Get log items for a project (sorted by date descending)**

Operation ID: `ProjectLogsGetProjectLog`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `page` | query | integer (int32) | No |  |
| `take` | query | integer (int32) | No |  |

**Response 200:** `OmniumProjectLogOmniumSearchResult`

---

### `POST /api/Projects/ProjectLogs/Search`

**Search project logs**

Operation ID: `ProjectLogsSearch`

**Request body:** `OmniumProjectLogSearchRequest`

**Response 200:** `List<OmniumProjectLog>`

---

### `PUT /api/Projects/ProjectLogs/Add`

**Add/update project log item**

Operation ID: `ProjectLogsAdd`

**Request body:** `OmniumProjectLog`

**Response 200:** `OmniumProjectLog`

---

### `DELETE /api/Projects/ProjectLogs/{id}`

**Delete project log item**

Operation ID: `ProjectLogsDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

## Projects | Parts

### `GET /api/Projects/{projectId}/ProjectParts/{projectPartId}`

**Get project part**

Operation ID: `ProjectsPartsGetProjectPart`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `projectPartId` | path | string | Yes | Project part ID to get |

**Response 200:** `OmniumProjectPart`

---

### `DELETE /api/Projects/{projectId}/ProjectParts/{projectPartId}`

**Update project part**

Operation ID: `ProjectsPartsProjectPartDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `projectPartId` | path | string | Yes | Project part ID to delete |

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/{projectId}/ProjectParts`

**Add project part**

Operation ID: `ProjectsPartsProjectPartAdd`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `OmniumProjectPart`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/ProjectParts`

**Update project part**

Operation ID: `ProjectsPartsProjectPartUpdate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `OmniumProjectPart`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/{projectId}/ProjectParts/AddMany`

**Update many project parts**

Operation ID: `ProjectsPartsProjectPartAddMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `List<OmniumProjectPart>`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/ProjectParts/{projectPartId}/UpdateProjectTask`

**Update task on project part**

Operation ID: `ProjectsPartsUpdateProjectTask`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `projectPartId` | path | string | Yes | Project part ID |

**Request body:** `OmniumProjectTask`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/ProjectParts/UpdateMany`

**Update many project parts**

Operation ID: `ProjectsPartsProjectPartUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `List<OmniumProjectPart>`

**Response 200:** `OmniumProject`

---

## Projects | Project types

### `GET /api/ProjectTypes/GetAll`

**Get all project types**

Operation ID: `ProjectTypesGetAll`

**Response 200:** `List<OmniumProjectType>`

---

### `PATCH /api/ProjectTypes`

**Patch Project Type - update only values in request**

Operation ID: `ProjectTypesPatchProject`

**Request body:** `OmniumProjectTypePatch`

**Response 200:** `OmniumProjectType`

---

## Projects | Reports

### `POST /api/ProjectReports/GetProjectDailyReports`

**Search, filter and generate project daily stats**

Operation ID: `ProjectReportsGetProjectDailyReports`

**Request body:** `OmniumProjectSearchRequest`

**Response 200:** `List<OmniumProjectDailyReport>`

---

### `POST /api/ProjectReports/GetProjectTypeReports`

**Get project type stats for a given time-span.
Stats exclude deleted projects and projects without ProjectTypeName.  
Stats only return stats on stores to which the user has access.
Stats include all project created before toDate that are still ongoing or was cancelled or finished within the time-span.**

Operation ID: `ProjectReportsGetProjectTypeReports`

**Request body:** `OmniumProjectTypeReportRequest`

**Response 200:** `List<OmniumProjectTypeReport>`

---

## Projects | Time entries

### `GET /api/Projects/{projectId}/TimeEntries`

**Get all project types**

Operation ID: `TimeEntriesGetTimeEntriesForProject`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes |  |
| `page` | query | integer (int32) | No |  |
| `pageSize` | query | integer (int32) | No |  |

**Response 200:** `List<OmniumTimeEntry>`

---

### `POST /api/Projects/TimeEntries/Search`

**Find time entries**

Operation ID: `TimeEntriesSearch`

**Request body:** `OmniumTimeEntrySearchRequest`

**Response 200:** `List<OmniumTimeEntry>`

---

### `PUT /api/Projects/TimeEntries/Add`

**Create time entry**

Operation ID: `TimeEntriesAdd`

**Request body:** `OmniumTimeEntry`

**Response 200:** `OmniumTimeEntry`

---

### `DELETE /api/Projects/TimeEntries/{id}`

**Delete time entries**

Operation ID: `TimeEntriesDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `id` | path | string | Yes |  |

---

### `POST /api/Projects/TimeEntries/DeleteMany`

**Delete time entries**

Operation ID: `TimeEntriesDeleteMany`

**Request body:** `array`

---

## Projects | Transactions

### `GET /api/Projects/{projectId}/Transactions/{projectTransactionId}`

**Get project transaction**

Operation ID: `ProjectsTransactionsGetProjectTransaction`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `transactionId` | query | string | No | Project transaction ID to get |
| `projectTransactionId` | path | string | Yes |  |

**Response 200:** `OmniumProjectTransaction`

---

### `DELETE /api/Projects/{projectId}/Transactions/{projectTransactionId}`

**Update project transaction**

Operation ID: `ProjectsTransactionsProjectTransactionDelete`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `projectTransactionId` | path | string | Yes | Project transaction ID to delete |

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/{projectId}/Transactions`

**Add project transaction**

Operation ID: `ProjectsTransactionsProjectTransactionAdd`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `OmniumProjectTransaction`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/Transactions`

**Update project transactions**

Operation ID: `ProjectsTransactionsProjectTransactionsUpdate`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `OmniumProjectTransaction`

**Response 200:** `OmniumProject`

---

### `POST /api/Projects/Transactions/Sum`

**Search for projects and return a sum over all transactions**

Operation ID: `ProjectsTransactionsGetTransactionSummary`

**Request body:** `OmniumProjectSearchRequest`

**Response 200:** `List<OmniumProjectTransactionSummary>`

---

### `POST /api/Projects/{projectId}/Transactions/AddMany`

**Update many project transactions**

Operation ID: `ProjectsTransactionsProjectTransactionsAddMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `List<OmniumProjectTransaction>`

**Response 200:** `OmniumProject`

---

### `PUT /api/Projects/{projectId}/Transactions/UpdateMany`

**Update many project transactions**

Operation ID: `ProjectsTransactionsProjectTransactionUpdateMany`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |

**Request body:** `List<OmniumProjectTransaction>`

**Response 200:** `OmniumProject`

---

## Projects | Versions

### `GET /api/Projects/Versions/{projectId}`

**Get list of all version items.**

Operation ID: `ProjectsVersionsVersionList`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID to fetch version list for |

**Response 200:** `List<OmniumVersionListItem>`

---

### `GET /api/Projects/Versions/{projectId}/{versionId}`

**Get specific project version**

Operation ID: `ProjectGetVersion`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `projectId` | path | string | Yes | Project ID |
| `versionId` | path | string | Yes | Version ID to fetch |

**Response 200:** `OmniumProjectOmniumVersion`

---
