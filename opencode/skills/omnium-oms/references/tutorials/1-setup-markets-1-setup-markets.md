# Tutorials — Step-by-Step Guides — [1\. Setup Markets](#1-setup-markets)

## [1\. Setup Markets](#1-setup-markets)

Markets define the geographical or business segments where you operate. They're essential for organizing your stores, pricing, and inventory.

### [Create a Market](#create-a-market)

Use the Omnium GUI or API to create your first market:

**Via API:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Markets/Update
     
    {
      "marketId": "nor",
      "marketName": "Norway",
      "description": "Norwegian market",
      "currency": "NOK",
      "languageCode": "no",
      "productContentLanguage": "no",
      "countryCode": "NO",
      "isActive": true,
      "isDefaultMarket": true
    }

**Via GUI:**

1.  Navigate to **Configuration > Markets**
2.  Click **"Add Market"**
3.  Fill in market details
4.  Save the market

* * *


## [2\. Add Stores](#2-add-stores)

Stores represent your sales channels within a market. Let's create a complete omnichannel setup using the AddMany endpoint for best practices.

This example creates three store types:

*   **Online Store** (`oslo-online`): Your e-commerce website/app where customers place online orders
*   **Physical Store** (`oslo-downtown`): Retail location that can also serve as local warehouse for Click & Collect
*   **Central Warehouse** (`oslo-warehouse`): Main distribution center

**Via API:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Stores/AddMany
     
    [
      {
        "id": "oslo-online",
        "name": "Oslo Clothes",
        "description": "Premium Norwegian fashion online store",
        "availableOnMarkets": ["nor"],
        "isActive": true,
        "availableWarehouses": [
          {
            "warehouseCode": "oslo-downtown",
            "priority": 1
          },
          {
            "warehouseCode": "oslo-warehouse",
            "priority": 2
          }
        ]
      },
      {
        "id": "oslo-downtown",
        "name": "Oslo Clothes Downtown",
        "description": "Flagship store in downtown Oslo",
        "availableOnMarkets": ["nor"],
        "isActive": true,
        "isWarehouse": true,
        "address": {
          "street": "Universitetsgate 22",
          "postalCode": "0162",
          "city": "Oslo",
          "country": "Norway"
        }
      },
      {
        "id": "oslo-warehouse",
        "name": "Oslo Clothes Central Warehouse",
        "description": "Main distribution center",
        "availableOnMarkets": ["nor"],
        "isActive": true,
        "isWarehouse": true,
        "isPrimaryWarehouse": true
      }
    ]

**Key Properties Explained:**

*   `isWarehouse: true` - Allows the store to hold and fulfill inventory
*   `isPrimaryWarehouse: true` - Designates this as the main fulfillment source for the market(s), typically for a central warehouse
*   `availableWarehouses` - References which warehouses can fulfill orders for this store

This setup gives you a simple omnichannel setup with online sales, physical retail presence, and centralized inventory management.

### [Search for Stores](#search-for-stores)

**(Super simple) Search for warehouses (store with isWarehouse=true) for market "nor":**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Stores/SearchStores
     
    {
      "marketIds": ["nor"],
      "isActive": true,
      "isWarehouse" : true
    }

**Response structure (OmniumResult):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "result": [
        {
          "id": "oslo-online",
          "name": "Oslo Clothes",
          "availableOnMarkets": ["nor"],
          "isActive": true
        }
      ],
      "totalHits": 1
    }

**Note**: Store search returns an `OmniumResult` wrapper containing:

*   `result`: Array of matching stores
*   `totalHits`: Total number of matches

* * *


## [3\. Add Products](#3-add-products)

Products are the core of your e-commerce store. First, let's create product categories, then add products with variants.

### [Create Product Categories](#create-product-categories)

Before adding products, set up your category structure using the AddMany endpoint:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/ProductCategories/AddMany
     
    [
      {
        "categoryId": "clothing",
        "name": "Clothing",
        "description": "Apparel and textiles",
        "language": "no",
        "id": "clothing_no",
        "isActive": true
      },
      {
        "categoryId": "mens-clothing",
        "name": "Men's Clothing",
        "description": "Clothing for dudes",
        "language": "no",
        "id": "mens-clothing_no",
        "parentId": "clothing",
        "isActive": true
      },
      {
        "categoryId": "tees",
        "name": "T-Shirts",
        "description": "T-shirts",
        "language": "no",
        "id": "tees_no",
        "parentId": "mens-clothing",
        "isActive": true
      }
    ]

### [Create a Product with Variants](#create-a-product-with-variants)

An example for a yellow t-shirt in multiple sizes:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products
     
    {
      "id": "yellow-tshirt_no",
      "productId": "yellow-tshirt",
      "marketId": "nor",
      "marketIds": ["nor"],
      "name": "Yellow T-Shirt",
      "description": "High-quality cotton t-shirt available in multiple sizes",
      "language": "no",
      "isActive": true,
      "color": "Yellow",
      "categories": [
        {
          "categoryId": "tees"
        }
      ],
      "prices": [
        {
          "marketId": "nor",
          "unitPrice": 299.00,
          "currency": "NOK"
        }
      ],
      "variants": [
        {
          "skuId": "yellow-tshirt-small",
          "name": "Yellow T-Shirt - Small",
          "size": "S"
        },
        {
          "skuId": "yellow-tshirt-medium",
          "name": "Yellow T-Shirt - Medium",
          "size": "M"
        },
        {
          "skuId": "yellow-tshirt-large",
          "name": "Yellow T-Shirt - Large",
          "size": "L"
        }
      ],
      "properties": [
        {
          "key": "material",
          "value": "100% Cotton"
        },
        {
          "key": "care",
          "value": "Machine washable"
        }
      ]
    }

**Note**:

*   When variants have the same price, set the price at product level (best practice)
*   Product language is set to "no" for Norwegian
*   Only product IDs and category IDs have language suffixes ("\_no"), not SKUs, productId or categoryId

### [Product Model](#product-model)

Important: To understand all available product fields and their properties, see our [Product Model documentation](/docs/Product). Familiarize yourself with the complete product structure to make the most of Omnium's product capabilities.

* * *


## [4\. Add Inventory](#4-add-inventory)

Omnium can act as the source of truth for inventory levels, or receive updates from external systems such as ERP or WMS. The recommended way to update inventory in Omnium is through the UpdateMany endpoint. Even when another system is the master for stock levels, Omnium typically manages reserved inventory as part of the order workflows.

### [Set Initial Stock Levels](#set-initial-stock-levels)

**Via API (UpdateMany endpoint - recommended):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Inventory/UpdateMany
     
    [
      {
        "sku": "yellow-tshirt-small",
        "warehouseCode": "oslo-warehouse",
        "inventory": 25
      },
      {
        "sku": "yellow-tshirt-medium",
        "warehouseCode": "oslo-warehouse",
        "inventory": 30
      },
      {
        "sku": "yellow-tshirt-large",
        "warehouseCode": "oslo-warehouse",
        "inventory": 40
      },
      {
        "sku": "yellow-tshirt-small",
        "warehouseCode": "oslo-downtown",
        "inventory": 10
      },
      {
        "sku": "yellow-tshirt-medium",
        "warehouseCode": "oslo-downtown",
        "inventory": 15
      },
      {
        "sku": "yellow-tshirt-large",
        "warehouseCode": "oslo-downtown",
        "inventory": 12
      }
    ]

This example shows inventory typically distributed across multiple locations:

*   **Central Warehouse** (`oslo-warehouse`): Higher quantities for main distribution
*   **Physical Store** (`oslo-downtown`): Smaller quantities for walk-in customers and Click & Collect

**Key Benefits of UpdateMany:**

*   Efficiently handles up to 1000 items per batch
*   Only updates items that have actual changes
*   Automatically inserts new inventory items or updates existing ones
*   **Enriches existing inventory items** - preserves `reservedInventory` and other existing data
*   Optimal performance for bulk inventory operations

* * *


## [5\. Query Products](#5-query-products)

Implement product search and retrieval for your e-commerce frontend.

### [Search Products](#search-products)

#### [Example 1: Free Text Search with Facets](#example-1-free-text-search-with-facets)

**General product search with facets for filtering:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products/SearchProducts
     
    {
      "query": "yellow t-shirt",
      "marketId": "nor",
      "take": 50,
      "includeFields": ["assets", "name", "prices", "color"]
    }

This example searches for products containing "yellow t-shirt" and returns facets that can be used for filtering (categories, brands, sizes, etc.).

#### [Example 2: Single Product Lookup](#example-2-single-product-lookup)

**Fetch specific product with contextual pricing:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/products/SearchProducts
     
    {
      "filters": {
        "productId": "yellow-tshirt"
      },
      "marketId": "nor",
      "isFacetsDisabled": true
    }

**Important**: SearchProducts automatically sets the correct pricing context based on your input parameters. When you specify `marketId`, you get market-specific pricing. If you also specify `customerId` or `customerGroup`, the API returns the correct price for that customer context (including any special pricing, discounts, or customer group rates).

**Key Search Parameters:**

*   **marketId**: Required for contextual pricing and market-specific results
*   **includeFields**: Specify exactly which fields to return for better performance. Can be left out if you want to get the entire model back
*   **isFacetsDisabled**: For best possible performance, always set to `true` unless you actually need to return facets to display to your end customers
*   **take**: Number of results to return (replaces limit/offset pattern)

### [SearchProducts Response Example](#searchproducts-response-example)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "result": [
        {
          "id": "yellow-tshirt_no",
          "name": "Yellow T-Shirt",
          "color": "Yellow",
          "assets": [
            {
              "url": "https://cdn.example.com/yellow-tshirt.jpg",
              "type": "image"
            }
          ],
          "prices": [
            {
              "marketId": "nor",
              "unitPrice": 299.00,
              "currency": "NOK"
            }
          ]
        }
      ],
      "facets": [
        {
          "name": "category",
          "values": [
            {
              "value": "Clothing",
              "count": 15
            },
            {
              "value": "Accessories",
              "count": 8
            }
          ]
        },
        {
          "name": "material",
          "values": [
            {
              "value": "Cotton",
              "count": 12
            },
            {
              "value": "Polyester",
              "count": 6
            }
          ]
        }
      ],
      "totalCount": 23
    }


## [6\. Update Products](#6-update-products)

Keep your product data up-to-date with pricing, descriptions, and availability changes.

**Using PatchMany endpoint (recommended for product updates):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PATCH /api/Products/PatchMany
     
    [
      {
        "id": "yellow-tshirt_no",
        "description": "Updated high-quality cotton t-shirt with improved fabric blend"
      }
    ]

**Key Benefits of PatchMany:**

*   Only updates fields that have actual changes
*   Handles up to 1000 products per batch
*   Optimal performance - skips unnecessary updates
*   Preserves existing product data


## [7\. Price Updates](#7-price-updates)

While prices can be updated via PatchMany, in many cases prices come from separate systems or different entities. For price management, we recommend using the dedicated pricing endpoint:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Prices/AddMany
     
    [
      {
        "productId": "yellow-tshirt",
        "prices": [
          {
            "marketId": "nor",
            "unitPrice": 349.00,
            "currencyCode": "NOK",
            "validFrom": "2024-01-01T00:00:00Z"
          }
        ]
      }
    ]

**Benefits of dedicated price updates:**

*   Automatically checks for actual price changes to avoid unnecessary updates
*   Optimized for high-frequency price updates from external systems

* * *


## [8\. Cart Operations (Checkout)](#8-cart-operations-checkout)

Implement a complete shopping cart and checkout experience using Omnium's cart API workflow.

### [Create a Cart by Adding First Item](#create-a-cart-by-adding-first-item)

**Create cart by adding an item (recommended approach):**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/AddItemToCart?skuId=yellow-tshirt-small&quantity=2&marketId=nor

This creates a new cart and adds the first item in one request. The response contains the new cart with a unique `cartId` for future operations.

### [Add More Items to Cart](#add-more-items-to-cart)

**Add additional items to existing cart:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/AddItemToCart?cartId=C12345&skuId=yellow-tshirt-medium&quantity=1&marketId=nor

### [Update Cart Items](#update-cart-items)

**Change item quantity by SKU:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/C12345/OrderLines/SetQuantity/Sku/yellow-tshirt-small/3

**Change quantity by OrderLine ID:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/C12345/OrderLines/SetQuantity/OrderLineId/line_123/2

### [Get Cart Details](#get-cart-details)

**Retrieve current cart:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Cart/C12345

### [Apply Gift Cards and Coupons](#apply-gift-cards-and-coupons)

**Add Gift Card:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C12345/AddGiftCard/ABC123

**Add Coupon Code:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C12345/AddCouponCode/SUMMER2024

### [Get Shipping and Payment Options](#get-shipping-and-payment-options)

**Get available shipping options:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Cart/C12345/GetShippingOptions?postalCode=10001

**Get available payment methods:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    GET /api/Cart/C12345/GetPaymentOptions

### [Add Shipment to Cart](#add-shipment-to-cart)

**Add shipping method:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C12345/AddShipments
     
    {
      "shipmentId": "1",
      "shippingMethodName": "Standard_Shipping",
      "warehouseCode": "oslo-warehouse"
    }

**Note**:

*   The `StoreId` on the order level identifies where the order is sold from, and `warehouseCode` on the shipment(s) identifies where the order will be sent from

### [Add Payment to Cart](#add-payment-to-cart)

**Add payment method:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C12345/AddPayments
     
    {
      "paymentId": "1",
      "paymentMethodName": "SomePaymentProvider",
      "amount": 598
    }

**Note**:

*   Omnium supports many integrated payment providers including Klarna, Dintero, Svea, Vipps, and many others

### [Add Customer Information](#add-customer-information)

**Add customer to cart:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C12345/AddCustomer/{customerId}?enrichCart=true

**Or add customer details directly:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C12345/AddCustomer
     
    {
      "email": "customer@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "phone": "004712345678"
    }

### [Cart Validation](#cart-validation)

**Validate cart before or during checkout to validate inventory, active products or other validators that has been configured:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/C12345/Validate

This ensures all cart data is valid before creating the order.

* * *

### [Create Order from Cart](#create-order-from-cart)

**Complete the checkout process:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/CreateOrderFromCart/C12345

This creates the final order and returns the order confirmation with order ID and details.


## [9\. Click and Collect Orders](#9-click-and-collect-orders)

Omnium supports all kinds of order flow (like BOPIS, ROPIS, Ship from store and BORIS (C&C)). This shows how you would implement C&C.

### [Setup Click and Collect Order Type](#setup-click-and-collect-order-type)

Before processing Click and Collect orders, you need to configure the order type in Omnium:

1.  **Via Omnium UI**: Navigate to **Configuration > Orders > Order Types**
2.  Create a new order type with type `ClickAndCollect`
3.  Configure pickup time limits, notifications, and store availability

### [Create Click and Collect Cart](#create-click-and-collect-cart)

**Create cart with ClickAndCollect order type and store set to the physical store:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/AddItemToCart?skuId=yellow-tshirt-small&quantity=2&marketId=nor&storeId=oslo-downtown

**Set order type to Click and Collect:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    PUT /api/Cart/{cartId}
     
    {
      "orderType": "ClickAndCollect"
    }

### [Add Customer (No Address Required)](#add-customer-no-address-required)

For Click and Collect orders, you don't set a shipping address since the customer will pick up at the store:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/{cartId}/AddCustomer
     
    {
      "email": "customer@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "phone": "004712345678"
    }

### [Process Click and Collect Checkout](#process-click-and-collect-checkout)

**Complete the Click and Collect order:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Cart/CreateOrderFromCart/{cartId}


## [10\. Customer Order History](#10-customer-order-history)

Enable customers to view their order history by implementing order search functionality for "My Account" pages.

### [Search Customer Orders](#search-customer-orders)

**Get all orders for a specific customer:**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    POST /api/Orders/Search
     
    {
      "customerId": "customer123",
      "take": 20,
      "page": 0,
      "sortOrder": "CreatedDescending"
    }

The response includes complete order details with items, pricing, shipping information, and current status - suitable for implementing customer order history pages.

* * *


## [Next Steps](#next-steps)

Sweet! You've successfully set up a basic e-commerce solution with Omnium. Your store now has:

✅ Markets and stores configured ✅ Products with inventory management ✅ Search and product retrieval ✅ Complete cart and checkout functionality ✅ Click and Collect order processing ✅ Customer order history functionality

[

Previous

Tutorials

](/docs/GettingStartedWithAPI/Tutorials)[

Next

ERP Integration

](/docs/GettingStartedWithAPI/Tutorials/erp-integration)