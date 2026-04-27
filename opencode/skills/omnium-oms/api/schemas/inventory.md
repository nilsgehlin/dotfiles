# Inventory Schemas

## Schemas in this file

- [OmniumInventoryAtp](#omniuminventoryatp)
- [OmniumInventoryBatch](#omniuminventorybatch)
- [OmniumInventoryItem](#omniuminventoryitem)
- [OmniumInventoryItemOmniumResult](#omniuminventoryitemomniumresult)
- [OmniumInventorySearchRequest](#omniuminventorysearchrequest)
- [OmniumInventoryTransaction](#omniuminventorytransaction)
- [OmniumInventoryTransactionOmniumResult](#omniuminventorytransactionomniumresult)
- [OmniumInventoryTransactionSearchRequest](#omniuminventorytransactionsearchrequest)
- [OmniumInventoryUpdate](#omniuminventoryupdate)
- [OmniumProductInventory](#omniumproductinventory)
- [OmniumWarehouseInventory](#omniumwarehouseinventory)

---

## OmniumInventoryAtp

Available to promise - Available quantities of the requested product, and delivery due dates.

**Fields:**

- `availableQuantity`: number (decimal) — Quantity Available for sale
- `date`: string (date-time) — Expected delivery date
- `deliveryId`: string, nullable — Delivery ID origin of ATP value
- `purchaseOrderId`: string, nullable — Purchase order ID origin of ATP value
- `purchaseOrderLineId`: string, nullable — Purchase order line ID origin of ATP value
- `quantity`: number (decimal) — Quantity delivered
- `reservedQuantity`: number (decimal) — Reserved inventory on delivery

---

## OmniumInventoryBatch

Represents a batch of inventory in the context of the FIFO principle, 
containing specific costs and currency details that were valid at the time of purchase.

**Fields:**

- `billingCost`: number (decimal) — The cost in the billing currency for this batch at the time of purchase.
- `billingCostExchangeRate`: number (decimal) — The exchange rate applied to the billing costs, representing the rate between the billing currency  
- `billingCurrency`: string, nullable — The currency used for billing when this batch was purchased.
- `costPrice`: number (decimal) — The cost price per unit converted to default currency for items in this batch at the time of purchas
- `costValue`: number (decimal) — The current total cost value of the batch, calculated as Quantity * CostPrice.
- `currencyDate`: string (date-time), nullable — The date associated with the currency rate used for billing calculations.S
- `id`: string, nullable — The unique identifier for the inventory batch.
- `modified`: string (date-time) — The date when this batch was last modified.
- `quantity`: number (decimal) — The available quantity of items in the batch.
- `transactionDate`: string (date-time) — The date of the transaction when this batch of inventory was purchased.

---

## OmniumInventoryItem

Inventory item for a specific SKU

**Fields:**

- `atp`: List<`OmniumInventoryAtp`>, nullable — List of ATP values (future deliveries)
- `batches`: List<`OmniumInventoryBatch`>, nullable — Represents a collection of inventory batches associated with the item,  ordered based on the First-I
- `calculatedInventory`: number (decimal) — Calculated inventory (used for packages where available inventory is calculated from components)
- `cost`: number (decimal) — The cost price per unit for this inventory item
- `costCurrency`: string, nullable — The currency of the cost price
- `costTotal`: number (decimal) — The current total cost value, calculated as Quantity * Cost.
- `created`: string (date-time) — Created date
- `inventory`: number (decimal) — Number of items in stock
- `isVirtual`: boolean, nullable — Only in use with virtual stock locations in Omnium. Indicates that this is a virtual inventory item 
- `location`: string, nullable — Item (warehouse) location
- `maxQuantity`: number (decimal) — Max inventory quantity
- `minQuantity`: number (decimal) — Minimum inventory quantity
- `modified`: string (date-time) — Modified date
- `physicalWarehouseCode`: string, nullable — Only in use with virtual stock locations in Omnium. Specifies the physical warehouse location of a v
- `properties`: List<`OmniumPropertyItem`>, nullable — Customer properties, (key values)
- `reorderMinQuantity`: number (decimal) — Minimum number of items to order
- `reservedInventory`: number (decimal) — Number of reserved items
- `sku`: string, nullable — Primary identifier for the inventory item, should represent the product SKU / Code / Variant / ID
- `warehouseCode`: string, nullable — Warehouse Code / ID

---

## OmniumInventoryItemOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumInventoryItem`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---

## OmniumInventorySearchRequest

Contains all parameters for doing an inventory search. At least one parameter must be set

**Fields:**

- `isBatchesExcluded`: boolean, nullable — Indicates whether inventory batches should be excluded in the response.  This is applicable only if 
- `isInStock`: boolean, nullable — If true, only inventory items with positive values are returned
- `isWebWarehouse`: boolean — If true, search will return inventory for all warehouses with IsWebWarehouse set to true. WarehouseC
- `lastModified`: string (date-time), nullable — Set LastModified to a specific DateTime to get items only modified after that time
- `marketGroupId`: string, nullable — Filter inventory on market group ID
- `marketId`: string, nullable — Filter inventory on market ID
- `productCodes`: List<`string`>, nullable — Filter inventory on product codes (SKU / Product ID)
- `warehouseCodes`: List<`string`>, nullable — Filter inventory on warehouse codes. Will be ignored if IsWebWarehouse is true

---

## OmniumInventoryTransaction

Represents an inventory transaction in the public API

**Fields:**

- `batchIndex`: string, nullable — Batch index
- `goodsReceptionId`: string, nullable — Goods reception ID
- `id`: string, nullable — Unique identifier for the transaction
- `internalReference`: string, nullable — Internal reference
- `inventoryChange`: number (decimal) — Change in inventory quantity
- `inventoryChangeValue`: number (decimal) — Value of the inventory change
- `inventoryCountItem`: string, nullable — Inventory count item identifier
- `isVirtual`: boolean, nullable — Indicates if this is a virtual warehouse transaction
- `location`: string, nullable — Storage location
- `newInventory`: number (decimal) — New inventory quantity after transaction
- `newReservedInventory`: number (decimal) — New reserved inventory quantity after transaction
- `orderId`: string, nullable — Associated order ID
- `physicalWarehouseCode`: string, nullable — Physical warehouse code (for virtual warehouses)
- `purchaseOrderId`: string, nullable — Associated purchase order ID
- `reason`: string, nullable — Reason for the transaction
- `relatedTransactionId`: string, nullable — Related transaction ID
- `reservedInventoryChange`: number (decimal) — Change in reserved inventory quantity
- `returnOrderId`: string, nullable — Associated return order ID
- `totalInventoryValue`: number (decimal) — Total inventory value after transaction
- `transactionDate`: string (date-time) — Date and time of the transaction
- `transactionType`: string, nullable — Type of transaction
- `userId`: string, nullable — User ID who performed the transaction
- `userName`: string, nullable — User name who performed the transaction
- `variant`: string, nullable — SKU/Variant identifier
- `warehouseCode`: string, nullable — Warehouse code where the transaction occurred
- `warehouseName`: string, nullable — Name of the warehouse

---

## OmniumInventoryTransactionOmniumResult

Generic query result

**Fields:**

- `isValid`: boolean — Deprecated
- `result`: List<`OmniumInventoryTransaction`>, nullable — Search results
- `scrollId`: string, nullable — The Scroll ID is used when fetching large amounts of data. Whenever the search results yields a Cont
- `totalHits`: integer (int64) — Total number of hits

---

## OmniumInventoryTransactionSearchRequest

Contains all parameters for doing an inventory transaction search

**Fields:**

- `from`: string (date-time), nullable — Start date for transaction date range
- `orderId`: string, nullable — Filter by order ID
- `page`: integer (int32) — Page number (starts from 1)
- `productId`: string, nullable — Filter by product ID
- `purchaseOrderId`: string, nullable — Filter by purchase order ID
- `searchText`: string, nullable — Search text for general search
- `skuId`: string, nullable — Filter by SKU ID
- `take`: integer (int32) — Number of items to take (page size)
- `to`: string (date-time), nullable — End date for transaction date range
- `userId`: string, nullable — Filter by user ID
- `warehouseCodes`: List<`string`>, nullable — Filter by warehouse codes

---

## OmniumInventoryUpdate

Model for modifying an inventory item in Omnium

**Fields:**

- `adjustReservedInventory`: boolean — If true both the inventory and reserved inventory level will be updated with the specified change.
- `inventoryChange`: number (decimal) — The change in inventory level
- `orderId`: string, nullable — The order Id of the order related with the change.
- `reason`: string, nullable — [Optional] Reason for inventory change
- `skuId`: string, nullable — Primary identifier for the inventory item, should represent the product SKU / Code / Variant / ID
- `virtualWarehouseCode`: string, nullable — Only in use with virtual stock locations in Omnium. Specifies the virtual warehouse location of a vi
- `warehouseCode`: string, nullable — Warehouse Code / ID

---

## OmniumProductInventory

**Fields:**

- `quantity`: number (decimal), nullable — Available quantity
- `warehouseCode`: string, nullable — Warehode code

---

## OmniumWarehouseInventory

**Fields:**

- `allowBackorder`: boolean — True if backorder is allowed
- `allowPreorder`: boolean — True of preorder is allowed
- `backorderAvailabilityDate`: string (date-time), nullable — Date backorder is available
- `backorderQuantity`: number (decimal) — Backorder quantity
- `entryId`: string, nullable — Unique identificaton
- `inStockQuantity`: number (decimal) — Number of items in stock
- `inventoryStatus`: string, nullable — Inventory status
- `preorderAvailabilityDate`: string (date-time), nullable — Date preorder is available
- `preorderQuantity`: number (decimal) — Preorder quantity
- `reorderMinQuantity`: number (decimal) — Minimum number of items to order
- `reservedQuantity`: number (decimal) — Number of items reserved
- `warehouseCode`: string, nullable — Warehouse code

---
