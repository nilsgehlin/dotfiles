# Purchase Order & Supplier Schemas — Deliveryaddress to OmniumPurchaseOrderOmniumSearchResult

## Deliveryaddress

**Fields:**

- `city`: string, nullable
- `country`: string, nullable
- `countryCode`: string, nullable
- `postalCode`: string, nullable
- `streetName`: string, nullable
- `streetNumber`: string, nullable

---


## OmniumAnalyticsSupplier

**Fields:**

- `supplierId`: string, nullable
- `supplierName`: string, nullable

---


## OmniumDelivery

Delivery model for purchase orders

**Fields:**

- `created`: string (date-time), nullable — Date and time when the delivery was created.
- `deliveryNotes`: List<`OmniumComment`>, nullable — List of internal comments
- `deliveryProvider`: string, nullable — Provider of the delivery.
- `deliveryStatus`: string, nullable — Status of the delivery.
- `deliveryTrackingLink`: string, nullable — Tracking link associated with the delivery.
- `deliveryTrackingNumber`: string, nullable — Tracking number associated with the delivery.
- `estimatedTimeOfArrival`: string (date-time), nullable — Estimated time of arrival for the delivery.
- `estimatedTimeOfDeparture`: string (date-time), nullable — Estimated time of departure for the delivery.
- `id`: string, nullable — ID of the delivery.
- `invoiceDate`: string (date-time), nullable — Invoice date associated with the delivery.
- `invoiceNumber`: string, nullable — Invoice number associated with the delivery.
- `isAutoDeliveryStatusDisabled`: boolean — Disables automatic calculation of DeliveryStatus, allowing it to be set manually
- `isCounted`: boolean — Indicates whether the delivery quantity has been verified before goods reception.
- `modified`: string (date-time), nullable — Date and time when the delivery was last modified.
- `orderType`: string, nullable — Purchase order type (InternalTransfer or PurchaseOrder)
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties associated with the delivery.
- `publicDeliveryNotes`: List<`OmniumComment`>, nullable — List of public comments
- `supplierIds`: List<`string`>, nullable — List of supplier Ids
- `supplierWarehouseCode`: string, nullable — Code of the supplier warehouse associated with the delivery (Internal transfers).
- `suppliers`: List<`string`>, nullable — List of suppliers
- `tags`: List<`string`>, nullable — Delivery tags (Used for grouping / filtering deliveries)
- `warehouseCode`: string, nullable — Code of the receiving warehouse associated with the delivery.

---


## OmniumDeliveryGoodsReceptionLine

Representing a line item for goods reception of purchase order deliveries

**Fields:**

- `allocateBasedOnRules`: boolean, nullable — Only relevant when using VSL - If set then it overrides the same property on the purchase order line
- `costPrice`: number (decimal) — Cost price of delivery (optional)
- `deliveredQuantity`: number (decimal) — Quantity delivered
- `goodsReceptionId`: string, nullable — Optional. If specified, the value is stored on the InventoryTransaction. Before processing the goods
- `lineItemId`: string, nullable — Line item ID
- `receiveAsUnallocated`: boolean — Only relevant when using VSL - If true then the inventory is not distributed to the virtual stock lo
- `updateProductCostPrice`: boolean — If true, product will be updated with new cost price
- `warehouseCode`: string, nullable — Warehouse code of delivery (optional)

---


## OmniumDeliveryOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumDelivery`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumDeliveryPatch

**Fields:**

- `deliveryProvider`: string, nullable — Provider of the delivery.
- `deliveryTrackingLink`: string, nullable — Tracking link associated with the delivery.
- `deliveryTrackingNumber`: string, nullable — Tracking number associated with the delivery.
- `estimatedTimeOfArrival`: string (date-time), nullable — Estimated time of arrival for the delivery.
- `estimatedTimeOfDeparture`: string (date-time), nullable — Estimated time of departure for the delivery.
- `id`: string, nullable — ID of the delivery.
- `invoiceDate`: string (date-time), nullable — Invoice date associated with the delivery.
- `invoiceNumber`: string, nullable — Invoice number associated with the delivery.
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties associated with the delivery.

---


## OmniumDeliverySearchRequest

Search model for deliveries

**Fields:**

- `createdFrom`: string (date-time), nullable — Minimum creation date to filter the search results.
- `createdTo`: string (date-time), nullable — Maximum creation date to filter the search results.
- `customerName`: string, nullable — Customer name to search for.
- `email`: string, nullable — Email address to search for.
- `estimatedTimeOfArrivalFrom`: string (date-time), nullable — Minimum expected delivery date to filter the search results.
- `estimatedTimeOfArrivalTo`: string (date-time), nullable — Maximum expected delivery date to filter the search results.
- `excludedTags`: List<`string`>, nullable — Filter by excluding tags
- `orderType`: string, nullable — Purchase order type (InternalTransfer or PurchaseOrder)
- `page`: integer (int32) — Page number of the search results.
- `purchaseOrderNumber`: string, nullable — Purchase order number to search for.
- `searchText`: string, nullable — Text to search for.
- `selectedDeliveries`: List<`string`>, nullable — Selected delivery ID to filter the search results.
- `selectedStatuses`: List<`string`>, nullable — Selected statuses to filter the search results.
- `selectedStores`: List<`string`>, nullable — Selected store names to filter the search results.
- `sortOrder`: string, nullable — Sort order of the search results.
- `supplierIds`: List<`string`>, nullable — Filter by supplier IDs
- `tags`: List<`string`>, nullable — Filter by tags
- `take`: integer (int32) — Number of records to retrieve per page.

---


## OmniumDeliveryaddress

**Fields:**

- `city`: string, nullable
- `country`: string, nullable
- `countryCode`: string, nullable
- `postalCode`: string, nullable
- `streetName`: string, nullable
- `streetNumber`: string, nullable

---


## OmniumPurchaseOrder

Purchase orders from suppliers

**Fields:**

- `billingCurrency`: string, nullable — Billing currency for the purchase order
- `created`: string (date-time), nullable — Creation date and time of the purchase order
- `deliveryId`: string, nullable — If set, all the changes to the line items are reflected in this delivery
- `errors`: List<`OmniumEntityError`>, nullable — List of errors on the current purchase order.
- `externalIds`: List<`OmniumExternalId`>, nullable — List of external IDs. External IDs are visible in Omnium's UI and useful for display, searching and 
- `id`: string, nullable — ID of the purchase order
- `isDelivery`: boolean — If true, a delivery is created. All changes on the purchase order is reflected on the delivery.
- `marketId`: string, nullable — Market ID
- `modified`: string (date-time), nullable — Last modified date and time of the purchase order
- `name`: string, nullable — Purchase order name
- `origin`: string, nullable — Origin of the purchase order
- `properties`: List<`OmniumPropertyItem`>, nullable — List of properties associated with the purchase order
- `publicPurchaseOrderNotes`: List<`OmniumComment`>, nullable — List of public purchase order comments
- `purchaseOrderForm`: → `OmniumPurchaseOrderForm`
- `purchaseOrderNotes`: List<`OmniumComment`>, nullable — List of purchase order comments
- `purchaseOrderNumber`: string, nullable — Purchase order number
- `purchaserId`: string, nullable — ID of the purchaser
- `purchaserName`: string, nullable — Name of the purchaser
- `referenceNumber`: string, nullable — Reference number of the purchase order
- `requestedDeliveryDate`: string (date-time), nullable — Requested delivery date of the purchase order
- `status`: string, nullable — Status of the purchase order
- `storeId`: string, nullable — ID of the store
- `subTotal`: number (decimal) — Subtotal of the purchase order
- `subTotalExclTax`: number (decimal) — Subtotal excluding tax of the purchase order
- `supplierEmail`: string, nullable — Email address of the supplier
- `supplierId`: string, nullable — ID of the supplier
- `supplierName`: string, nullable — Name of the supplier
- `supplierPhone`: string, nullable — Phone number of the supplier
- `supplierWarehouseCode`: string, nullable — Warehouse code of the supplier. If set, this purchase order is regarded as an internal transfer, and
- `tags`: List<`string`>, nullable — Purchase order tags (Used by notification filters, and for grouping / filtering purchase orders)
- `taxTotal`: number (decimal) — Tax total of the purchase order
- `total`: number (decimal) — Total amount of the purchase order
- `totalExclTax`: number (decimal) — Total amount excluding tax of the purchase order
- `versionId`: string, nullable — Version ID of the purchase order

---


## OmniumPurchaseOrderActionExecutionResult

Result from single workflow action

**Fields:**

- `actionStatus`: string, nullable — "Success", "Warning or "Error".
- `actionType`: string, nullable — Order action type (e.g. "Notification", "CapturePayment", "ReduceInventory", etc)
- `cancelWorkflow`: boolean — Is this step cancelling further workflow execution
- `errorReason`: string, nullable — Error description
- `isInvisible`: boolean — True if workflow step and result should be hidden for end user
- `translateKey`: string, nullable — Translation key for result description

---


## OmniumPurchaseOrderExportModel

Used for webhooks and export

**Fields:**

- `purchaseOrder`: → `OmniumPurchaseOrder`

---


## OmniumPurchaseOrderExtendedModel

Extended purchase order model with store and supplier information

**Fields:**

- `purchaseOrder`: → `OmniumPurchaseOrder`
- `purchaseOrderLines`: List<`OmniumPurchaseOrderLineExtendedModel`>, nullable — Extended purchase order lines
- `store`: → `OmniumStore`
- `supplier`: → `OmniumSupplier`

---


## OmniumPurchaseOrderForm

Purchase order form

**Fields:**

- `lineItems`: List<`OmniumPurchaseOrderLine`>, nullable — Order lines
- `properties`: List<`OmniumPropertyItem`>, nullable — Custom properties
- `total`: number (decimal) — Order total
- `totalExclTax`: number (decimal) — Order total ex tax

---


## OmniumPurchaseOrderFormPatch

Purchase order form, containing line items for order

**Fields:**

- `lineItems`: List<`OmniumPurchaseOrderLinePatch`>, nullable — All order lines
- `total`: number (decimal), nullable — Order total
- `totalExclTax`: number (decimal), nullable — Order total ex tax

---


## OmniumPurchaseOrderLine

Purchase order line

**Fields:**

- `allocateBasedOnRules`: boolean — Only for Virtual Stock Locations - When true the line item inventory will be allocated to the virtua
- `allowSupplierPackageBreak`: boolean, nullable — Indicates if supplier packages can be split to order quantities smaller than the full package size.
- `alternativeProductName`: string, nullable — Alternative product name of the line item
- `brand`: string, nullable — Brand of the line item
- `canceledQuantity`: number (decimal) — Quantity of the line item that has been canceled
- `code`: string, nullable — Sku ID of the order line
- `color`: string, nullable — Color of the line item
- `comment`: string, nullable — Comment for the line item
- `components`: List<`OmniumProductComponent`>, nullable — Used for specification of package products
- `countedQuantity`: number (decimal) — Quantity of the line item that has been counted
- `currency`: string, nullable — Currency of the line item price
- `customsCode`: string, nullable — Customs code for the line item
- `deliveredQuantity`: number (decimal) — Quantity of the line item that has been delivered
- `deliveryId`: string, nullable — ID of the delivery associated with the line item
- `discountedPrice`: number (decimal) — Calculated - Total price of the line item with all entry level discounts applied on the line item. T
- `discountedPriceExclTax`: number (decimal) — Calculated - Total price of the line item, excluding tax, with all entry level discounts applied on 
- `displayName`: string, nullable — Display name of the line item
- `ean`: string, nullable — EAN (European Article Number) / GTIN (Global Trade Item Number) of the line item.
- `estimatedTimeOfArrival`: string (date-time), nullable — Estimated time of arrival for the line item
- `extendedPrice`: number (decimal) — Calculated - Total price of the line item, including all discounts applied on the line item (entry l
- `extendedPriceExclTax`: number (decimal) — Calculated - Total price of the line item, excluding tax, including all discounts applied on the lin
- `gtin`: string, nullable — GTIN (Global Trade Item Number) of the line item.
- `imageUrl`: string, nullable — URL of the image associated with the line item
- `isConfigurableProduct`: boolean — Indicates whether the order line represents a configurable product. This value is set when a configu
- `isDisabledForAllocation`: boolean — Specifies whether the line item is disabled for allocation
- `isPackage`: boolean — Specifies whether the line item is a package
- `lineItemDiscountAmount`: number (decimal) — Total discount amount applied to the line item
- `lineItemDiscountAmountExclTax`: number (decimal) — Total discount amount applied to the line item, excluding tax
- `lineItemId`: string, nullable — Unique order line ID. Should be unique across all purchase orders.
- `location`: string, nullable — Inventory location
- `packageLineItemId`: string, nullable — Line item ID of the package
- `packageName`: string, nullable — Name of the package
- `packageSkuId`: string, nullable — SKU ID of the package
- `placedPrice`: number (decimal) — Price for one item that this line item represents. This property does not take any discounts into co
- `placedPriceExclTax`: number (decimal) — Price for one item excluding tax. This property does not take any discounts into consideration.
- `properties`: List<`OmniumPropertyItem`>, nullable — List of custom properties associated with the line item
- `purchaseOrderId`: string, nullable — ID of the purchase order associated with the line item
- `quantity`: number (decimal) — Number of items
- `selectedUnit`: string, nullable — The selected unit of measurement on order line if product is sold in multiple units (Null if sold un
- `selectedUnitConversionFactor`: number (decimal), nullable — Conversion factor from default unit to selected unit
- `selectedUnitQuantity`: number (decimal), nullable — The quantity ordered in the selected unit of measurement.
- `size`: string, nullable — Size of the line item
- `supplierName`: string, nullable — Name of the supplier
- `supplierPackagingQuantity`: number (decimal), nullable — Supplier packaging quantity (D-Pack)
- `supplierSkuId`: string, nullable — ID of the supplier SKU
- `taxRate`: number (decimal) — Tax rate applied to the line item. For example, if the tax rate is 25%, the value here should be 25.
- `taxTotal`: number (decimal) — Calculated - Tax total for the line item, calculated from the tax group on the product
- `unit`: string, nullable — Unit of measurement for the line item
- `updateCostPrice`: boolean — Specifies whether to update the cost price on the product from this line item when goods reception i
- `updateStock`: boolean — Specifies whether to update the stock for the line item
- `virtualWarehouseAllocations`: List<`OmniumVirtualWarehouseAllocation`>, nullable — Only for Virtual Stock Locations - When purchase order is created for warehouse with VSLs then this 
- `volume`: number (double), nullable — Total volume per unit of the line item, in cubic decimeters (dm³).
- `warehouseCode`: string, nullable — Warehouse code for the line item

---


## OmniumPurchaseOrderLineExtendedModel

Extended purchase order line with end customer information

**Fields:**

- `customerOrderNumber`: string, nullable — Order number reference for end customer
- `purchaseOrderLine`: → `OmniumPurchaseOrderLine`

---


## OmniumPurchaseOrderLinePatch

Purchase order line

**Fields:**

- `allocateBasedOnRules`: boolean, nullable — Only for Virtual Stock Locations - When true the line item inventory will be allocated to the virtua
- `allowSupplierPackageBreak`: boolean, nullable — Indicates if supplier packages can be split to order quantities smaller than the full package size.
- `alternativeProductName`: string, nullable — Alternative product name of the line item
- `brand`: string, nullable — Brand of the line item
- `canceledQuantity`: number (decimal), nullable — Quantity of the line item that has been canceled
- `code`: string, nullable — Sku ID of the order line
- `color`: string, nullable — Color of the line item
- `comment`: string, nullable — Comment for the line item
- `components`: List<`OmniumProductComponent`>, nullable — Used for specification of package products
- `countedQuantity`: number (decimal), nullable — Quantity of the line item that has been counted
- `currency`: string, nullable — Currency of the line item price
- `customsCode`: string, nullable — Customs code for the line item
- `deliveredQuantity`: number (decimal), nullable — Quantity of the line item that has been delivered
- `deliveryId`: string, nullable — ID of the delivery associated with the line item
- `displayName`: string, nullable — Display name of the line item
- `ean`: string, nullable — EAN (European Article Number) / GTIN (Global Trade Item Number) of the line item.
- `estimatedTimeOfArrival`: string (date-time), nullable — Estimated time of arrival for the line item
- `gtin`: string, nullable — GTIN (Global Trade Item Number) of the line item.
- `gtins`: List<`string`>, nullable — GTINs (Global Trade Item Number) of the line item.
- `imageUrl`: string, nullable — URL of the image associated with the line item
- `isConfigurableProduct`: boolean — Indicates whether the order line represents a configurable product. This value is set when a configu
- `isDisabledForAllocation`: boolean, nullable — Specifies whether the line item is disabled for allocation
- `isPackage`: boolean, nullable — Specifies whether the line item is a package
- `lineItemDiscountAmount`: number (decimal), nullable — Total discount amount applied to the line item
- `lineItemDiscountAmountExclTax`: number (decimal), nullable — Total discount amount applied to the line item, excluding tax
- `lineItemId`: string, nullable — Unique order line ID
- `location`: string, nullable — Inventory location
- `packageLineItemId`: string, nullable — Line item ID of the package
- `packageName`: string, nullable — Name of the package
- `packageSkuId`: string, nullable — SKU ID of the package
- `placedPrice`: number (decimal), nullable — Price for one item that this line item represents. This property does not take any discounts into co
- `placedPriceExclTax`: number (decimal), nullable — Price for one item excluding tax. This property does not take any discounts into consideration.
- `properties`: List<`OmniumPropertyItem`>, nullable — List of custom properties associated with the line item
- `purchaseOrderId`: string, nullable — ID of the purchase order associated with the line item
- `quantity`: number (decimal), nullable — Number of items
- `selectedUnit`: string, nullable — The selected unit of measurement on order line if product is sold in multiple units (Null if sold un
- `selectedUnitConversionFactor`: number (decimal), nullable — Conversion factor from default unit to selected unit
- `selectedUnitQuantity`: number (decimal), nullable — The quantity ordered in the selected unit of measurement.
- `size`: string, nullable — Size of the line item
- `supplierName`: string, nullable — Name of the supplier
- `supplierPackagingQuantity`: number (decimal), nullable — Supplier packaging quantity (D-Pack)
- `supplierSkuId`: string, nullable — ID of the supplier SKU
- `taxRate`: number (decimal), nullable — Tax rate applied to the line item. For example, if the tax rate is 25%, the value here should be 25.
- `taxTotal`: number (decimal), nullable — Tax total for the line item, calculated from the tax group on the product
- `unit`: string, nullable — Unit of measurement for the line item
- `updateCostPrice`: boolean, nullable — Specifies whether to update the cost price on the product from this line item when goods reception i
- `updateStock`: boolean, nullable — Specifies whether to update the stock for the line item
- `virtualWarehouseAllocations`: List<`OmniumVirtualWarehouseAllocation`>, nullable — Only for Virtual Stock Locations - When purchase order is created for warehouse with VSLs then this 
- `volume`: number (double), nullable — Total volume per unit of the line item, in cubic decimeters (dm³).
- `warehouseCode`: string, nullable — Warehouse code for the line item

---


## OmniumPurchaseOrderLineReference

Representing a line item for creating new delivery from purchase orders

**Fields:**

- `code`: string, nullable — Quantity
- `lineItemId`: string, nullable — Line item ID
- `packageBarcode`: string, nullable — The Barcode of the kolli/package that contains this lineItem. Can be the same over multiple lineitem
- `quantity`: number (decimal) — Quantity

---


## OmniumPurchaseOrderOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPurchaseOrder`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---


## OmniumPurchaseOrderOmniumSearchResult

Generic class for receiving search results with facets

**Fields:**

- `facets`: List<`OmniumFacetViewModel`>, nullable — Search result facets
- `isValid`: boolean — Deprecated
- `result`: List<`OmniumPurchaseOrder`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---
