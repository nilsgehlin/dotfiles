# Stores & Markets — Locations, Warehouses & Regions — [Phone format settings](#phone-format-settings)

## [Phone format settings](#phone-format-settings)

Phone format settings control how phone numbers are validated and formatted for a market.

### [Phone format settings model](#phone-format-settings-model)

Property

Type

Description

RequireCountryCode

bool?

When true, phone numbers must include a country code.

RemoveCountryCode

bool?

When true, remove the country code from stored phone numbers.

UsePlusInCountryCode

bool?

When true, format country code with + prefix (e.g., +47).

UseZeroZeroInCountryCode

bool?

When true, format country code with 00 prefix (e.g., 0047).

DefaultCountryCode

string

Default country code to apply (e.g., "47" for Norway, "46" for Sweden).

ExpectedPhoneNumberFormats

List<PhoneFormat>

List of allowed phone number formats by country.

### [Phone format](#phone-format)

Property

Type

Description

CountryCode

string

Country code (e.g., "47", "46").

MinExpectedNumberLength

int?

Minimum number of digits excluding country code.

MaxExpectedNumberLength

int?

Maximum number of digits excluding country code.

### [Sample](#sample-6)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "PhoneFormatSettings": {
        "RequireCountryCode": true,
        "UsePlusInCountryCode": true,
        "DefaultCountryCode": "47",
        "ExpectedPhoneNumberFormats": [
          {
            "CountryCode": "47",
            "MinExpectedNumberLength": 8,
            "MaxExpectedNumberLength": 8
          },
          {
            "CountryCode": "46",
            "MinExpectedNumberLength": 9,
            "MaxExpectedNumberLength": 10
          }
        ]
      }
    }

* * *


## [Connectors](#connectors)

Markets can have market-specific connector configurations for integrating with external systems. Connectors can be restricted to specific markets or market groups.

For full connector configuration details, see the [Integrations documentation](/docs/Integrations).

### [Market restriction properties](#market-restriction-properties)

Property

Type

Description

EnabledForMarkets

List<string>

Markets where the connector is available. Empty/null means all markets.

DisabledForMarkets

List<string>

Markets where the connector is explicitly disabled. Overrides EnabledForMarkets.

EnabledForMarketGroups

List<string>

Market groups where the connector is available.

DisabledForMarketGroups

List<string>

Market groups where the connector is disabled.

* * *


## [Complete market configuration example](#complete-market-configuration-example)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "Markets": [
        {
          "MarketId": "NOR",
          "MarketName": "Norway",
          "IsDefaultMarket": true,
          "IsActive": true,
          "MarketType": "B2C",
          "MarketGroupId": "nordic",
     
          "Language": "Norwegian",
          "LanguageCode": "no",
          "IsoLanguageCode": "nb-NO",
          "CountryCode": "NO",
          "Currency": "NOK",
          "ProductContentLanguage": "no",
     
          "IsTaxExcluded": false,
          "ShowOrderLinesExTax": false,
          "DefaultTaxRate": 25,
          "DefaultVatType": 3,
          "DefaultPaymentType": "Card",
     
          "WebsiteUrl": "https://www.mystore.no",
          "LogoUrl": "https://cdn.mystore.com/logos/norway.png",
          "DocumentFooter": "<p>My Store AS | Org.nr: 123456789 | support@mystore.no</p>",
     
          "ReturnCharges": {
            "ReturnCost": 49.00,
            "NotPickedUpCost": 99.00,
            "ReturnCostDefaultDisabled": false
          },
     
          "NumberOptions": [
            {
              "NumberType": "OrderNumberOptions",
              "Key": "nor-orders",
              "Prefix": "NO-",
              "StartSequence": 10000,
              "Service": "SequentialMarketNumberService"
            }
          ],
     
          "ShipmentOptions": [
            {
              "ShippingMethodId": "bring-servicepakke",
              "ShippingMethodName": "SERVICEPAKKE",
              "Label": "Hent i Posten",
              "ShipmentDeliveryType": "PickUp",
              "ShippingGateway": "Bring",
              "ShipmentProduct": "SERVICEPAKKE",
              "ShippingSubTotal": 79.00,
              "TaxRate": 25,
              "GetServicePoints": true,
              "IsDefaultShipment": true
            }
          ],
     
          "EmailClientSettings": {
            "StandardEmailAddress": "ordre@mystore.no",
            "LanguageCode": "no"
          },
     
          "PhoneFormatSettings": {
            "RequireCountryCode": true,
            "UsePlusInCountryCode": true,
            "DefaultCountryCode": "47",
            "ExpectedPhoneNumberFormats": [
              {
                "CountryCode": "47",
                "MinExpectedNumberLength": 8,
                "MaxExpectedNumberLength": 8
              }
            ]
          }
        },
        {
          "MarketId": "SWE",
          "MarketName": "Sweden",
          "IsDefaultMarket": false,
          "IsActive": true,
          "MarketType": "B2C",
          "MarketGroupId": "nordic",
     
          "Language": "Swedish",
          "LanguageCode": "sv",
          "IsoLanguageCode": "sv-SE",
          "CountryCode": "SE",
          "Currency": "SEK",
          "ProductContentLanguage": "sv",
     
          "IsTaxExcluded": false,
          "DefaultTaxRate": 25,
     
          "WebsiteUrl": "https://www.mystore.se",
     
          "ReturnCharges": {
            "ReturnCost": 49.00,
            "ReturnCostDefaultDisabled": false
          },
     
          "NumberOptions": [
            {
              "NumberType": "OrderNumberOptions",
              "Key": "swe-orders",
              "Prefix": "SE-",
              "StartSequence": 10000,
              "Service": "SequentialMarketNumberService"
            }
          ]
        },
        {
          "MarketId": "B2B-NOR",
          "MarketName": "Norway B2B",
          "IsDefaultMarket": false,
          "IsActive": true,
          "MarketType": "B2B",
     
          "Language": "Norwegian",
          "LanguageCode": "no",
          "IsoLanguageCode": "nb-NO",
          "CountryCode": "NO",
          "Currency": "NOK",
     
          "IsTaxExcluded": true,
          "ShowOrderLinesExTax": true,
          "DefaultTaxRate": 25
        }
      ],
     
      "MarketGroups": [
        {
          "GroupId": "nordic",
          "GroupName": "Nordic Region"
        }
      ]
    }

[

Previous

Markets

](/docs/Markets)[

Next

Stores

](/docs/Stores)

---


## Stores

# Stores

Introduction to stores in Omnium


## [Stores in Omnium](#stores-in-omnium)

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fstores.c57568a2.png&w=3840&q=75)

In Omnium, a **Store** represents any physical or virtual location associated with your business, such as:

*   Physical stores
*   Web shops
*   Warehouses
*   Other departments

Stores are used to:

1.  **Restrict Access**: Control access to orders, carts, customers and other entites in Omnium.
2.  **Track sales**: Orders are always connected to a store in Omnium, which represents the sales channel where the order originated.
3.  **Manage Inventory**: Represent locations that can hold inventory. An order will reduce the inventory of the warehouse that ships/delivers an item.
4.  **Control product assorment**: Products in Omnium can contain a list of stores where the products are available. Assortments can be managed at store level in the Omnium UI.

* * *


## [In this section](#in-this-section)

[

API Reference

Create, update, and search stores via the API



](/docs/Stores/store-api)[

Configuration

Store settings, store groups, roles, and default properties



](/docs/Stores/store-config)[

Stores, Markets & Warehouses

How the unified store entity, markets, and warehouses connect



](/docs/Stores/stores-markets-warehouses)

* * *


## [Creating Stores](#creating-stores)

There are multiple ways to create a store in Omnium:

1.  **Create in GUI**: Use the graphical interface to manually add a store.
2.  **Import/Export in GUI**: Import or export store data directly via the GUI.
3.  **Import through API**: Programmatically create stores using Omnium's API.

* * *


## [The Store Model](#the-store-model)

For more details on store properties and the model see the [Store model documentation](https://api.omnium.no/documentation/index.html#/model-OmniumStore).

### [Warehouses (stock locations)](#warehouses-stock-locations)

An important property on the store object is **IsWarehouse**. This flag is used to indicate whether a store is also a stock location and can hold inventory. Below are some common use cases for stores and how this flag is combined with it:

Use case

IsWarehouse

Description

ECOM site

false

A pure digital sales channel that does not have its own stock but has available warehouses that it can ship from.

Physical store

true

A physical store is both a sales channel and have its own inventory.

Central warehouse

true

A pure warehouse that is not a sales channel, but service i.e. ECOM-orders og Pick-up-in-store.

### [Store Availability](#store-availability)

There are several availability options on stores used:

1.  **Markets**: Used to control which markets a store is available in. A store may be available in multiple markets.
2.  **Available warehouses**: Specifies which warehouses (stock locations) is available for a given store. Is used to control which warehouses an order can be reallocated to. Used for instance with ECOM and Ship-From-Store orders where Omnium handles allocation of orders to a warehouse that can service the order.
3.  **Zip ranges**: Used to specify which zip-codes a store can service. Is used with reallocation workflows to restrict which warehouses ship to which locations.

### [Metadata](#metadata)

The Store model in Omnium has support for storing a variety of metadata about a store:

*   Opening hours
*   Employees
*   Payment info

* * *


## [Assortments](#assortments)

Omnium provides multiple ways to manage product assortments. One method is to use **product categories** in combination with **stores**.

### [Controlling Assortments via the Edit Store UI](#controlling-assortments-via-the-edit-store-ui)

In the **Omnium Edit Store** interface, you can define the assortment for a store by selecting which **product categories** to include or exclude. When a category is assigned to a store:

*   The store's ID is added to the **store list** of each product within that category.
*   This information can then be used by the **frontend** to determine whether a product should be available in a specific store.

### [Performance Consideration](#performance-consideration)

Be aware: In setups with a **large number of stores**, this method may increase the size of individual **product documents**, which can negatively impact performance.

* * *


## [Access control](#access-control)

When managing users in Omnium, you can specify which stores each user should have access to. A user will not be able to access data associated to stores outside of the user's permissions.

[

Previous

Configuration

](/docs/Markets/markets-config)[

Next

API Reference

](/docs/Stores/store-api)

---


## API Reference

[Stores](/docs/Stores)

# API Reference

Learn all you need to know about the store API


## [Omnium Store API](#omnium-store-api)

The **Omnium Store API** allows you to manage and retrieve store-related data, including store details, opening hours, and more. It provides several operations to create, retrieve, update, and delete store records, making it easy to integrate with external systems. The API enables seamless management of store locations and configurations, as well as the ability to manage special opening hours for holidays and other exceptions.

Each store contains essential details such as location, contact information, operating hours, and more. With this API, you can efficiently manage and customize store data for smooth operations across your system.

* * *


## [Store Model](#store-model)

A store in Omnium is represented by a JSON object with the following structure:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "Acme",
      "name": "acme.com",
      "address": {
        "streetName": "Street name",
        "streetNumber": "1",
        "city": "New York",
        "zipcode": "10001",
        "region": "NY",
        "regionCode": "",
        "country": "USA",
        "countryCode": "US"
      },
      "availableOnMarkets": ["USA"],
      "phoneNumber": "212-111-111-1111",
      "email": "acme@omnium.com",
      "comment": null,
      "url": "",
      "latitude": "40.7237",
      "longitude": "-73.9898",
      "googlePlaceId": "",
      "mondayOpeningHours": {
        "isOpen": true,
        "openFrom": "08:00:00",
        "openTo": "16:00:00"
      },
      "additionalOpeningHours": [
        {
          "date": "2019-04-19T00:00:00",
          "openingHours": {
            "isOpen": false,
            "openFrom": "00:00:00",
            "openTo": "00:00:00"
          },
          "closed": true
        }
      ],
      "externalIds": null,
      "isWarehouse": true,
      "isPrimaryWarehouse": true,
      "isPublicVisible": false,
      "properties": null
    }

This structure includes the following fields:

*   **id**: Unique store identifier.
*   **name**: Store name or domain name.
*   **address**: The store’s physical address.
*   **availableOnMarkets**: Markets where the store is available.
*   **contact information**: Phone number and email.
*   **opening hours**: Regular and special hours for each day of the week.

You can find more details in the [Store model documentation](https://api.omnium.no/documentation/index.html#/model-OmniumStore).

* * *


## [Store Example](#store-example)

A webshop located at Manhattan, New York City, New York, US could look like this:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "id": "Acme",
      "name": "acme.com",
      "address": {
        "streetName": "Street name",
        "streetNumber": "1",
        "city": "New York",
        "zipcode": "10001",
        "region": "NY",
        "regionCode": "",
        "country": "USA",
        "countryCode": "US"
      },
      "availableOnMarkets": ["USA"],
      "phoneNumber": "212-111-111-1111",
      "email": "acme@omnium.com",
      "comment": null,
      "url": "",
      "latitude": "40.7237",
      "longitude": "-73.9898",
      "googlePlaceId": "",
      "mondayOpeningHours": {
        "isOpen": true,
        "openFrom": "08:00:00",
        "openTo": "16:00:00"
      },
      "additionalOpeningHours": [
        {
          "date": "2019-04-19T00:00:00",
          "openingHours": {
            "isOpen": false,
            "openFrom": "00:00:00",
            "openTo": "00:00:00"
          },
          "closed": true
        }
      ],
      "externalIds": null,
      "isWarehouse": true,
      "isPrimaryWarehouse": true,
      "isPublicVisible": false,
      "properties": null
    }

In the Omnium GUI, the store would appear with a map location of any given coordinates.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fstores_sample.97494563.jpg&w=3840&q=75)

You can also edit store information in the GUI.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fstore_edit.fa936956.jpg&w=3840&q=75)

* * *


## [Store Operations](#store-operations)

### [Create Store](#create-store)

Add a new store to Omnium by submitting a store object to the stores endpoint. If the store exists, it will be overridden by the object.

[Create store documentation](https://api.omnium.no/documentation/index.html#/Stores/put_api_Stores).

### [Get Store](#get-store)

*   **Get all stores**: Retrieve a list of all stores, warehouses, and pickup points.
    
    *   [Get all stores documentation](https://api.omnium.no/documentation/index.html#/Stores/StoresGet)
*   **Get single store**: Retrieve information about a single store using its ID.
    
    *   [Get single store documentation](https://api.omnium.no/documentation/index.html#/Stores/StoresGet)

### [Update Store](#update-store)

Update a store by submitting a store object.

[Update store documentation](https://api.omnium.no/documentation/index.html#/Stores/StoresPut).

### [Delete Store](#delete-store)

To delete a store, send a delete request to the stores endpoint.

Important

The store will be permanently deleted and cannot be recovered.

[Delete store documentation](https://api.omnium.no/documentation/index.html#/Stores/StoresDelete).

* * *


## [More Store Information](#more-store-information)

### [Store Opening Hours](#store-opening-hours)

A store has opening hours for every day of the week as separate properties (e.g., `mondayOpeningHours`, `tuesdayOpeningHours`, etc.). You can also create special opening hours for public holidays or other exceptions.

For more details, refer to the [Opening Hours Model documentation](https://api.omnium.no/documentation/index.html#/model-OmniumOpeningHours).

### [Special Opening Hours Model](#special-opening-hours-model)

For special opening hours, refer to the [Special Opening Hours Model documentation](https://api.omnium.no/documentation/index.html#/model-OmniumSpecialOpeningHours).

* * *


## [Store FAQ](#store-faq)

### [Creating a Store: What is a Store ID?](#creating-a-store-what-is-a-store-id)

A store ID must be unique across all markets. Any duplicate IDs will overwrite existing stores. We recommend using URL-friendly IDs.

[

Previous

Stores

](/docs/Stores)[

Next

Configuration

](/docs/Stores/store-config)

---


## Configuration

[Stores](/docs/Stores)

# Configuration

Learn how to configure store settings, store groups, store roles, and default properties in Omnium. This guide covers all store-related configuration options for administrators and developers.


## [Store settings](#store-settings)

Store settings control the general behavior of store search, map display, and data maintenance across your tenant.

### [Search and display](#search-and-display)

These settings control how stores are searched and displayed in the store locator and other interfaces.

Property

Type

Default

Description

IsStoreSearchByZipDefault

bool

false

When enabled, the store locator defaults to ZIP code-based search instead of location-based search. Users can still switch between search modes, but ZIP code search will be the initial option.

RenderStoreMapWithStandardStyle

bool

false

Controls the visual styling of the store locator map. When enabled, uses standard map styling. When disabled, custom map styling can be applied to match your brand.

#### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "StoreSettings": {
      "IsStoreSearchByZipDefault": true,
      "RenderStoreMapWithStandardStyle": true
    }

### [Data maintenance](#data-maintenance)

These settings control automatic cleanup and maintenance of store data.

Property

Type

Default

Description

DeleteAdditionalOpeningHoursThreshold

int

null

Number of days after which historical special opening hours are automatically deleted. When configured with the cleanup scheduled task, opening hours entries (such as holiday hours or temporary schedule changes) older than this threshold are removed to prevent data bloat.

The `DeleteAdditionalOpeningHoursThreshold` setting requires the `DeleteHistoricalAdditionalOpeningHoursScheduledTask` scheduled task to be configured and running. See [Historical opening hours cleanup](#historical-opening-hours-cleanup) for configuration details.

#### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "StoreSettings": {
      "DeleteAdditionalOpeningHoursThreshold": 90
    }

* * *


## [Store groups](#store-groups)

Store groups allow you to organize stores into logical groupings such as regions, brands, franchise networks, or business units. Groups are defined at the tenant level and individual stores reference them via the `StoreGroupId` property.

### [Use cases](#use-cases)

*   **Regional organization**: Group stores by geographic region (e.g., "Northern Region", "Southern Region", "Western Region")
*   **Brand divisions**: Separate stores by brand identity (e.g., "Premium Stores", "Outlet Stores", "Express Locations")
*   **Franchise networks**: Organize stores by franchise owner or operator
*   **Business units**: Group by internal business divisions or cost centers

### [Store group model](#store-group-model)

Property

Type

Description

**StoreGroupId** \*

string

Unique identifier for the store group. This value is referenced by `Store.StoreGroupId` to assign stores to groups. Use consistent naming conventions (e.g., lowercase with hyphens).

**StoreGroupName** \*

string

Display name for the store group shown in the user interface. Use clear, descriptive names that users will recognize.

### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "StoreSettings": {
      "StoreGroups": [
        {
          "StoreGroupId": "region-north",
          "StoreGroupName": "Northern Region"
        },
        {
          "StoreGroupId": "region-south",
          "StoreGroupName": "Southern Region"
        },
        {
          "StoreGroupId": "region-east",
          "StoreGroupName": "Eastern Region"
        },
        {
          "StoreGroupId": "outlet",
          "StoreGroupName": "Outlet Stores"
        }
      ]
    }

### [Assigning stores to groups](#assigning-stores-to-groups)

After defining store groups in tenant settings, assign individual stores to groups by setting the `StoreGroupId` property on each store. A store can belong to one group at a time.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "StoreId": "store-001",
      "Name": "Oslo City Center",
      "StoreGroupId": "region-north"
    }

* * *


## [Store roles](#store-roles)

Store roles classify stores and warehouses for fulfillment and operational purposes. Unlike store groups (which organize stores), roles define what a store can do. A store can have multiple roles, allowing flexible fulfillment configurations.

### [Use cases](#use-cases-1)

*   **Fulfillment capabilities**: Define which stores can handle specific order types (e.g., "Ship From Store", "Click and Collect", "Returns Processing")
*   **Warehouse classification**: Distinguish between regional hubs, distribution centers, and local pickup points
*   **Special handling**: Mark stores certified for specific operations (e.g., "Hazmat Certified", "Cold Chain", "Oversized Items")
*   **Order routing**: Control which warehouses are eligible for specific order allocations

### [Store role model](#store-role-model)

Property

Type

Description

**StoreRoleId** \*

string

Unique identifier for the store role. This value is referenced by `Store.StoreRoleIds` to assign roles to stores.

**StoreRoleName** \*

string

Display name for the store role shown in the user interface.

### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "StoreSettings": {
      "StoreRoles": [
        {
          "StoreRoleId": "ship-from-store",
          "StoreRoleName": "Ship From Store"
        },
        {
          "StoreRoleId": "click-and-collect",
          "StoreRoleName": "Click and Collect"
        },
        {
          "StoreRoleId": "web-warehouse",
          "StoreRoleName": "Web Warehouse"
        },
        {
          "StoreRoleId": "returns-center",
          "StoreRoleName": "Returns Processing Center"
        }
      ]
    }

### [Assigning roles to stores](#assigning-roles-to-stores)

After defining store roles in tenant settings, assign roles to individual stores by setting the `StoreRoleIds` array on each store. A store can have multiple roles.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "StoreId": "warehouse-central",
      "Name": "Central Distribution Center",
      "StoreRoleIds": ["web-warehouse", "returns-center"]
    }

### [Role-based warehouse allocation](#role-based-warehouse-allocation)

Store roles integrate with inventory management settings to control which warehouses can fulfill specific orders. Configure `WarehouseAllocationAvailableForStoreRoles` in your inventory settings to restrict order allocation to warehouses with specific roles.

See the [Inventory Management documentation](/docs/Inventory/inventory-config) for details on configuring warehouse allocation rules based on store roles.

* * *


## [Default properties](#default-properties)

Default properties define a template of custom attributes that can be set on stores. This provides a standardized way to extend store data with tenant-specific information without modifying the core data model. Properties defined here appear in the store editor and can be used for filtering and reporting.

### [Use cases](#use-cases-2)

*   **Store classification**: Define store types (e.g., "Flagship", "Standard", "Express", "Outlet")
*   **Operational metadata**: Track operational details (e.g., square footage, parking capacity, fitting rooms count)
*   **Contact information**: Store additional contacts (e.g., regional manager email, maintenance contact)
*   **Business attributes**: Track business-specific data (e.g., franchise code, cost center, opening year)

### [Default property model](#default-property-model)

Property

Type

Default

Description

**Key** \*

string

\-

Property identifier used as the key when storing and retrieving the value. Use consistent naming conventions (e.g., PascalCase or camelCase).

Value

string

null

Default value for the property. Pre-populates the field when creating new stores.

ValueType

string

null

Data type hint for the property (e.g., "String", "Number", "Boolean"). Used for UI rendering and validation.

KeyGroup

string

null

Optional grouping key to organize related properties together in the UI.

ValueOptions

List<string>

null

Predefined list of selectable values. When set, the property appears as a dropdown in the UI instead of a free-text field.

IsCustomValueOptionAllowed

bool

false

When enabled with `ValueOptions`, allows users to enter custom values in addition to selecting from the predefined list.

IsMultiSelectEnabled

bool

false

When enabled with `ValueOptions`, allows selecting multiple values from the list. Values are stored as a comma-separated string.

ReadOnly

bool

false

When enabled, the property value cannot be modified in the UI after initial creation. Useful for system-assigned or imported values.

### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "StoreSettings": {
      "DefaultProperties": [
        {
          "Key": "StoreType",
          "Value": "Standard",
          "ValueOptions": ["Flagship", "Standard", "Express", "Outlet"],
          "IsCustomValueOptionAllowed": false,
          "IsMultiSelectEnabled": false,
          "ReadOnly": false
        },
        {
          "Key": "StoreFormat",
          "ValueOptions": ["Full Service", "Self Service", "Hybrid"],
          "IsMultiSelectEnabled": true
        },
        {
          "Key": "SquareMeters",
          "ValueType": "Number"
        },
        {
          "Key": "RegionalManager",
          "KeyGroup": "Contacts"
        },
        {
          "Key": "LegacyStoreCode",
          "ReadOnly": true
        }
      ]
    }

### [Properties on stores](#properties-on-stores)

When a store is created or edited, the default properties appear in the store editor. The values are stored in the `Properties` array on the store object.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "StoreId": "store-001",
      "Name": "Oslo Flagship Store",
      "Properties": [
        { "Key": "StoreType", "Value": "Flagship" },
        { "Key": "StoreFormat", "Value": "Full Service,Self Service" },
        { "Key": "SquareMeters", "Value": "2500" },
        { "Key": "RegionalManager", "Value": "manager@company.com" },
        { "Key": "LegacyStoreCode", "Value": "OSL-001" }
      ]
    }

### [Filtering stores by properties](#filtering-stores-by-properties)

Store properties are indexed and can be used to filter stores via the API. This enables building custom reports or searches based on your tenant-specific attributes.

* * *
