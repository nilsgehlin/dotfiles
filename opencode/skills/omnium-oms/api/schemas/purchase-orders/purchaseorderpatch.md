# Purchase Order & Supplier Schemas — OmniumPurchaseOrderPatch to OmniumSupplierSearchRequest

## OmniumPurchaseOrderPatch

Omnium order patch object

**Fields:**

- `billingCurrency`: string, nullable — Billing currency for the purchase order
- `deliveryId`: string, nullable — If set, all the changes to the line items are reflected in this delivery
- `errors`: List<`OmniumEntityError`>, nullable — List of errors on the current purchase order
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external IDs. External IDs are visible in Omnium's UI and useful for display, searching and 
- `id`: string, nullable — ID of the purchase order
- `isDelivery`: boolean, nullable — If true, a delivery is created. All changes on the purchase order is reflected on the delivery.
- `keepExistingListItems`: boolean, nullable — Determines behaviour when updating list where items does not have unique id (Properties). If true, n
- `keepExistingOrderLines`: boolean, nullable — Determines behaviour when updating order lines. If true, new items will be added to the existing lis
- `marketId`: string, nullable — Market ID
- `name`: string, nullable — Purchase order name
- `origin`: string, nullable — Origin of the purchase order
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties associated with the purchase order
- `publicPurchaseOrderNotes`: List<`OmniumComment`>, nullable — List of public purchase order comments
- `purchaseOrderForm`: → `OmniumPurchaseOrderFormPatch`
- `purchaseOrderNotes`: List<`OmniumComment`>, nullable — List of purchase order comments
- `purchaseOrderNumber`: string, nullable — Purchase order number
- `purchaserId`: string, nullable — ID of the purchaser
- `purchaserName`: string, nullable — Name of the purchaser
- `referenceNumber`: string, nullable — Reference number of the purchase order
- `requestedDeliveryDate`: string (date-time), nullable — Requested delivery date of the purchase order
- `status`: string, nullable — Status of the purchase order
- `storeId`: string, nullable — ID of the store
- `supplierEmail`: string, nullable — Email address of the supplier
- `supplierId`: string, nullable — ID of the supplier
- `supplierName`: string, nullable — Name of the supplier
- `supplierPhone`: string, nullable — Phone number of the supplier
- `supplierWarehouseCode`: string, nullable — Warehouse code of the supplier. If set, this purchase order is regarded as an internal transfer, and
- `tags`: List<`string`>, nullable — Purchase order tags (Used by notification filters, and for grouping / filtering purchase orders)

---


## OmniumPurchaseOrderSearchRequest

Search model for purchase orders

**Fields:**

- `createdFrom`: string (date-time), nullable — Minimum creation date to filter the search results.
- `createdTo`: string (date-time), nullable — Maximum creation date to filter the search results.
- `email`: string, nullable — Email address to search for.
- `excludedTags`: List<`string`>, nullable — Filter by excluding tags
- `externalIds`: List<`string`>, nullable — Search purchase orders with external IDs
- `modifiedFrom`: string (date-time), nullable — Minimum modified date to filter the search results.
- `modifiedTo`: string (date-time), nullable — Maximum modified date to filter the search results.
- `orderNumber`: string, nullable — Order number to search for.
- `orderType`: string, nullable — Purchase order type (InternalTransfer or PurchaseOrder)
- `page`: integer (int32) — Page number of the search results.
- `phone`: string, nullable — Phone number to search for.
- `productNumbers`: List<`string`>, nullable — List of product numbers to filter the search results.
- `requestedDeliveryDateFrom`: string (date-time), nullable — Minimum requested delivery date to filter the search results.
- `requestedDeliveryDateTo`: string (date-time), nullable — Maximum requested delivery date to filter the search results.
- `searchText`: string, nullable — Text to search for.
- `selectedStatuses`: List<`string`>, nullable — Selected statuses to filter the search results.
- `selectedStores`: List<`string`>, nullable — Selected store names to filter the search results.
- `sortOrder`: string, nullable — Sort order of the search results.
- `supplierId`: string, nullable — Supplier ID to search for.
- `supplierName`: string, nullable — Supplier name to search for.
- `supplierWarehouseCode`: string, nullable — Supplier warehouse code (warehouse used for sending internal transfers)
- `tags`: List<`string`>, nullable — Filter by tags
- `take`: integer (int32) — Number of records to retrieve per page.
- `urgent`: boolean — Indicates whether the search should include urgent orders only.

---


## OmniumPurchaseOrderWorkflowExecutionResult

Purchase order workflow execution result

**Fields:**

- `isAborted`: boolean — True if workflow failed and is aborted
- `purchaseOrder`: → `OmniumPurchaseOrder`
- `purchaseOrderActionExecutionResults`: List<`OmniumPurchaseOrderActionExecutionResult`>, nullable — List of action results

---


## OmniumPurchaseOrderWorkflowRequest

Purchase order workflow execution request

**Fields:**

- `expectedDeliveryDate`: string (date-time), nullable
- `status`: string, nullable

---


## OmniumSplitPurchaseOrderLine

Request to split a purchase order line into two lines

**Fields:**

- `lineItemId`: string, nullable — The line item ID to split
- `newLineItemId`: string, nullable — Optional: Specify a custom line item ID for the new line. If not provided, a new ID will be generate
- `quantityToSplit`: number (decimal) — Quantity to move to the new line. The remaining quantity stays on the original line.
- `virtualWarehouseAllocationsToSplit`: List<`OmniumVirtualWarehouseAllocationToSplit`>, nullable — Virtual warehouse allocations to move/split. If not specified, allocations will be split proportiona

---


## OmniumSupplier

Company that delivers purchase orders

**Fields:**

- `address`: → `OmniumAddress`
- `addresses`: List<`OmniumAddress`>, nullable — Additional addresses associated with the supplier (e.g., billing, delivery).
- `contacts`: List<`OmniumContactPerson`>, nullable — Supplier contact persons
- `created`: string (date-time), nullable — Date created
- `defaultLeadTime`: integer (int32), nullable — Supplier default lead time
- `defaultLeadTimeSafetyMarginDays`: integer (int32), nullable — Safety margin added to the lead time to give an extra inventory buffer
- `defaultOrderIntervalDays`: integer (int32), nullable — Purchase interval in days (number of days to multiply by average daily sales)
- `email`: string, nullable — Supplier e-mail
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external supplier IDs
- `id`: string, nullable — Supplier ID
- `incoterms`: string, nullable — The Incoterms agreement that applies to purchases from this supplier (e.g., FOB, DDP).
- `maximumOrderAmount`: number (decimal), nullable — Maximum total order amount for purchase orders to this supplier.
- `minimumOrderAmount`: number (decimal), nullable — Minimum total order amount for purchase orders to this supplier.
- `modified`: string (date-time), nullable — Date modified
- `name`: string, nullable — Supplier company name
- `omniumStoreId`: string, nullable — Only use if the supplier is a store in Omnium
- `paymentTerms`: integer (int32), nullable — Standard payment terms agreed with the supplier, expressed as number of days.
- `phone`: string, nullable — Supplier phone number
- `preferredCurrency`: string, nullable — Supplier currency
- `preferredLanguage`: string, nullable — Supplier language
- `previousVersionId`: string, nullable — Previous Version ID
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer properties, (key values)
- `shipmentCost`: number (decimal) — Default shipment costs applied when ordering from this supplier.  Can represent either a fixed cost 
- `shippingProvider`: string, nullable — The supplier’s standard freight provider (e.g., PostNord, DHL, Loomis).
- `storeGroupIds`: List<`string`>, nullable — List of store group IDs linked to this supplier.
- `storeIds`: List<`string`>, nullable — Available store IDs
- `tags`: List<`string`>, nullable — Tags used for categorization or search purposes.
- `taxId`: string, nullable — Tax ID, or other governmental identification number
- `versionId`: string, nullable — Version ID

---


## OmniumSupplierOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumSupplier`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumSupplierSearchRequest

Supplier search request

**Fields:**

- `createdFrom`: string (date-time), nullable — Project created after date
- `createdTo`: string (date-time), nullable — Project created before date
- `externalIds`: List<`string`>, nullable — Search by external IDs
- `modifiedFrom`: string (date-time), nullable — Project modified after date
- `modifiedTo`: string (date-time), nullable — Project modified before date
- `page`: integer (int32) — Page (Fetches from [Page * Take] to [(Page + 1) * Take])
- `properties`: List<`OmniumPropertyItem`>, nullable — List with custom properties to search for
- `searchText`: string, nullable — Free text search
- `storeIds`: List<`string`>, nullable — Filter by store IDs
- `supplierId`: string, nullable — Supplier ID
- `take`: integer (int32) — Number of items to take

---
