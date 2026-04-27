# Carts — Checkout, Offers & Validation — [Complete checkout example](#complete-checkout-example)

## [Complete checkout example](#complete-checkout-example)

Here's a realistic example of a cart service that mirrors the customer journey. Each method represents a separate user action that happens at different times during the shopping session.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    public class OmniumCartService
    {
        private readonly HttpClient _httpClient;
        private const string BaseUrl = "https://api.omnium.no/api/Cart";
     
        public OmniumCartService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
     
        /// <summary>
        /// Called when customer adds an item to cart (e.g., clicks "Add to cart" button)
        /// </summary>
        public async Task<OmniumCart> AddItemToCartAsync(
            string? cartId, string skuId, decimal quantity, string marketId)
        {
            var url = string.IsNullOrEmpty(cartId)
                ? $"{BaseUrl}/AddItemToCart?skuId={skuId}&quantity={quantity}&marketId={marketId}"
                : $"{BaseUrl}/AddItemToCart?cartId={cartId}&skuId={skuId}&quantity={quantity}";
     
            var response = await _httpClient.PostAsync(url, null);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumCart>();
        }
     
        /// <summary>
        /// Called when customer changes quantity in cart
        /// </summary>
        public async Task<OmniumCart> UpdateQuantityAsync(
            string cartId, string skuId, decimal quantity)
        {
            var response = await _httpClient.PostAsync(
                $"{BaseUrl}/{cartId}/OrderLines/SetQuantity/Sku/{skuId}/{quantity}", null);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumCart>();
        }
     
        /// <summary>
        /// Called when customer removes item from cart
        /// </summary>
        public async Task<OmniumCart> RemoveItemAsync(string cartId, string lineItemId)
        {
            var response = await _httpClient.DeleteAsync(
                $"{BaseUrl}/{cartId}/OrderLines/{lineItemId}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumCart>();
        }
     
        /// <summary>
        /// Called when customer applies a coupon code
        /// </summary>
        public async Task<OmniumCart> ApplyCouponAsync(string cartId, string couponCode)
        {
            var response = await _httpClient.PutAsync(
                $"{BaseUrl}/{cartId}/AddCouponCode/{couponCode}", null);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumCart>();
        }
     
        /// <summary>
        /// Called when customer enters delivery address to show shipping options
        /// </summary>
        public async Task<List<OmniumShippingOption>> GetShippingOptionsAsync(
            string cartId, string postalCode)
        {
            var response = await _httpClient.GetAsync(
                $"{BaseUrl}/{cartId}/GetShippingOptions?postalCode={postalCode}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<List<OmniumShippingOption>>();
        }
     
        /// <summary>
        /// Called when customer selects a shipping method
        /// </summary>
        public async Task<OmniumCart> SelectShippingAsync(
            string cartId, string shippingMethodName, string warehouseCode)
        {
            var shipments = new[]
            {
                new { shipmentId = "1", shippingMethodName, warehouseCode }
            };
            var response = await _httpClient.PutAsJsonAsync(
                $"{BaseUrl}/{cartId}/AddShipments", shipments);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumCart>();
        }
     
        /// <summary>
        /// Called when customer logs in or identifies themselves
        /// </summary>
        public async Task<OmniumCart> SetCustomerAsync(
            string cartId, string customerId, bool applyCustomerPrices = true)
        {
            var response = await _httpClient.PutAsync(
                $"{BaseUrl}/{cartId}/AddCustomer/{customerId}?enrichCart=true&isPriceRecalculated={applyCustomerPrices}",
                null);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumCart>();
        }
     
        /// <summary>
        /// Called after customer completes payment with your payment provider
        /// </summary>
        public async Task<OmniumCart> RegisterPaymentAsync(
            string cartId, decimal amount, string paymentMethod, string transactionId)
        {
            var payments = new[]
            {
                new
                {
                    amount,
                    paymentMethodName = paymentMethod,
                    transactionId,
                    transactionType = "Authorization",
                    status = "Processed"
                }
            };
            var response = await _httpClient.PutAsJsonAsync(
                $"{BaseUrl}/{cartId}/AddPayments", payments);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumCart>();
        }
     
        /// <summary>
        /// Called before redirecting to payment to check for issues
        /// </summary>
        public async Task<OmniumValidationResult<OmniumCart>> ValidateCartAsync(string cartId)
        {
            var response = await _httpClient.PostAsync($"{BaseUrl}/{cartId}/Validate", null);
            return await response.Content.ReadFromJsonAsync<OmniumValidationResult<OmniumCart>>();
        }
     
        /// <summary>
        /// Called after successful payment to create the order
        /// </summary>
        public async Task<OmniumOrder> CreateOrderAsync(string cartId, string orderType = "Online")
        {
            var response = await _httpClient.PostAsync(
                $"{BaseUrl}/CreateOrderFromCart/{cartId}?orderType={orderType}", null);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<OmniumOrder>();
        }
    }

**Example: Customer journey through your e-commerce site**

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    var cartService = new OmniumCartService(httpClient);
     
    // Customer browsing products, clicks "Add to cart"
    var cart = await cartService.AddItemToCartAsync(
        cartId: null,  // First item creates a new cart
        skuId: "SHOE-BLACK-42",
        quantity: 1,
        marketId: "NOR");
     
    // Store cartId in session/cookie for subsequent requests
    var cartId = cart.Id;
     
    // Customer continues shopping, adds another item
    cart = await cartService.AddItemToCartAsync(cartId, "SOCK-WHITE-M", 2, "NOR");
     
    // Customer changes quantity
    cart = await cartService.UpdateQuantityAsync(cartId, "SOCK-WHITE-M", 3);
     
    // Customer applies coupon code
    cart = await cartService.ApplyCouponAsync(cartId, "WELCOME10");
     
    // Customer proceeds to checkout, enters postal code
    var shippingOptions = await cartService.GetShippingOptionsAsync(cartId, "0275");
     
    // Customer selects shipping method
    cart = await cartService.SelectShippingAsync(cartId, "Bring_SERVICEPAKKE", "WebShop");
     
    // Customer logs in (optional - can also be guest checkout)
    cart = await cartService.SetCustomerAsync(cartId, "CUST-001");
     
    // Validate before redirecting to payment provider
    var validation = await cartService.ValidateCartAsync(cartId);
    if (validation.ValidationErrors?.Any() == true)
    {
        // Show errors to customer (e.g., out of stock)
        return;
    }
     
    // ... Customer completes payment with Vipps/Klarna/Stripe ...
    // Payment provider calls your webhook with transaction details
     
    // Register the completed payment
    cart = await cartService.RegisterPaymentAsync(
        cartId,
        amount: cart.OrderForm.Total,
        paymentMethod: "Vipps",
        transactionId: "vipps-order-xyz");
     
    // Create the order - triggers fulfillment workflows
    var order = await cartService.CreateOrderAsync(cartId, "Online");
     
    // Redirect customer to order confirmation page

Remember to configure authentication headers on the HttpClient. See the [Authentication](/docs/api/authentication) documentation for details.

[

Previous

Carts

](/docs/Carts)[

Next

Configuration

](/docs/Carts/cart-config)

---


## Configuration

[Carts](/docs/Carts)

# Configuration

Learn how to configure cart settings and validators in Omnium.


## [Cart settings](#cart-settings)

Cart settings control the behavior of shopping carts in Omnium, including numbering, validation, market handling, and UI options.

### [General settings](#general-settings)

Property

Type

Default

Description

IsOrderNumbersUsedAsCartNumber

bool

false

When enabled, cart numbers use the order number sequence. Additionally, when a cart is converted to an order, the order number will be the same as the cart's number. This ensures a consistent numbering scheme across carts and orders.

IsCartVersionEnabled

bool

false

When enabled, each time a cart is saved, a version snapshot is stored in the version history. This allows you to track changes to the cart over time and review previous states.

IsMetaDataDeletedWhenCreatingCartFromOrder

bool

false

When enabled, custom properties (metadata) are not copied when creating a cart from an existing order. Use this when you want replacement or re-order carts to start fresh without inheriting the original order's properties.

MaximumNumberOfOrderLines

int

100

Maximum number of order lines allowed in a shopping cart. If set to 0, the default maximum of 100 is used. Carts exceeding this limit will receive an error when saved.

#### [Sample](#sample)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CartSettings": {
      "IsOrderNumbersUsedAsCartNumber": true,
      "IsCartVersionEnabled": true,
      "IsMetaDataDeletedWhenCreatingCartFromOrder": false,
      "MaximumNumberOfOrderLines": 150
    }

### [Market and customer settings](#market-and-customer-settings)

These settings control how market selection works in relation to customers.

Property

Type

Default

Description

IsCustomerMarketDefaultOnCart

bool

false

When enabled, selecting a customer in the shopping cart automatically sets the cart's market to match the customer's market. This ensures that the customer always sees prices and shipping options for their home market.

IsAskForMarketWhenMismatch

bool

false

When enabled (and IsCustomerMarketDefaultOnCart is also enabled), a confirmation dialog is shown when the selected market doesn't match the customer's market. This gives the user the choice to either update to the customer's market or keep the current selection. Only applies when IsCustomerMarketDefaultOnCart is enabled.

#### [Sample](#sample-1)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CartSettings": {
      "IsCustomerMarketDefaultOnCart": true,
      "IsAskForMarketWhenMismatch": true
    }

### [Validation settings](#validation-settings)

Property

Type

Default

Description

IsCartValidatedManually

bool

false

When enabled, cart validation is triggered only when the user clicks the validation button manually. When disabled (default), validation runs automatically when the cart is saved. Use manual validation for performance optimization on complex carts or when validation involves expensive external calls.

#### [Sample](#sample-2)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CartSettings": {
      "IsCartValidatedManually": true
    }

### [UI and display settings](#ui-and-display-settings)

These settings control how cart information is displayed in the Omnium user interface.

Property

Type

Default

Description

UseCartCreationModal

bool

false

When enabled, a modal dialog is shown when creating a new shopping cart, allowing the user to select market, store, and order type upfront. When disabled, carts are created with defaults and these values can be set afterward.

IsUseUnitsInCart

bool

false

When enabled and a product has multiple units of measure configured, users can select a different unit of measure in the cart. Useful for B2B scenarios where products may be sold in different package sizes (e.g., "each", "box of 12", "pallet").

IsWarehouseHiddenInShipmentSelector

bool

false

When enabled, the warehouse selection is hidden in the shipping selector. Use this when warehouse allocation is determined later in the order process (e.g., by an ERP system or warehouse management system), making the warehouse selection irrelevant at cart stage.

ShowRecalculatePricesOnStoreSelected

bool

false

When enabled, the user is prompted to confirm whether prices should be recalculated when the store is changed in the cart. This is useful when different stores may have different pricing, and you want to give users control over when prices are updated.

#### [Sample](#sample-3)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CartSettings": {
      "UseCartCreationModal": true,
      "IsUseUnitsInCart": true,
      "IsWarehouseHiddenInShipmentSelector": true,
      "ShowRecalculatePricesOnStoreSelected": true
    }

### [Comment templates](#comment-templates)

Cart comment templates allow you to define predefined comment texts that can be quickly selected when adding comments to carts.

Property

Type

Description

CommentTemplates

List<CommentTemplate>

List of predefined comment templates

Each comment template has the following structure:

Property

Type

Description

TemplateName

string

Display name for the template

Properties

List<PropertyItem>

Template content and configuration

#### [Sample](#sample-4)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    "CartSettings": {
      "CommentTemplates": [
        {
          "TemplateName": "PriceOverride",
          "Properties": [
            { "Name": "Subject", "Value": "Price adjustment" },
            { "Name": "Body", "Value": "Price has been adjusted per customer agreement." }
          ]
        },
        {
          "TemplateName": "SpecialHandling",
          "Properties": [
            { "Name": "Subject", "Value": "Special handling required" },
            { "Name": "Body", "Value": "This order requires special handling. Please see instructions." }
          ]
        }
      ]
    }

### [Complete cart settings example](#complete-cart-settings-example)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
      "CartSettings": {
        "IsOrderNumbersUsedAsCartNumber": true,
        "IsCartVersionEnabled": true,
        "IsMetaDataDeletedWhenCreatingCartFromOrder": false,
        "IsCustomerMarketDefaultOnCart": true,
        "IsAskForMarketWhenMismatch": true,
        "MaximumNumberOfOrderLines": 100,
        "IsCartValidatedManually": false,
        "IsUseUnitsInCart": false,
        "IsWarehouseHiddenInShipmentSelector": false,
        "ShowRecalculatePricesOnStoreSelected": true,
        "UseCartCreationModal": true,
        "CommentTemplates": [
          {
            "TemplateName": "PriceOverride",
            "Properties": [
              { "Name": "Subject", "Value": "Price adjustment" },
              { "Name": "Body", "Value": "Price has been adjusted per customer agreement." }
            ]
          }
        ]
      }
    }

* * *


## [Cart validators](#cart-validators)

The cart validator posts a cart to a provided endpoint and adds any validation errors to the GUI or API when the cart is validated. The validation process involves all configured `IValidator` instances and is executed before an order is created from a cart. The endpoint is used to show warnings or ensure the cart is valid before attempting to create an order.

Omnium provides built-in validators, and you can also implement custom validators using webhooks. These validators ensure carts are valid when orders are created from any sales channel (e.g., your website, Omnium UI, etc.).


## [Validator configuration](#validator-configuration)

### [Adding a validator](#adding-a-validator)

To add a new validator (either built-in or webhook), navigate to **Connections** in settings.

#### [Required properties](#required-properties)

Property

Sample Value

Description

Name

Webhook

Name of Omnium connector provider. For webhooks, this must be set to "Webhook".

Host

[https://acme.com](https://acme.com)

Endpoint host (URL is added to the workflow step).

Implementations

"IValidator"

Connector capabilities. For validators, this must include `IValidator`.

#### [Sample configuration](#sample-configuration)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "connectors": [
            {
                "name": "activeProductsValidator",
                "isAuthenticatedManually": false,
                "timeOut": "00:00:00",
                "implementations": [
                    "IValidator"
                ],
                "disableStandardErrorPolicy": false
            },
            {
                "name": "WebhookValidator",
                "host": "https://acme.com/api/ValidatorEndpoint",
                "isAuthenticatedManually": false,
                "timeOut": "00:00:00",
                "implementations": [
                    "IValidator"
                ],
                "disableStandardErrorPolicy": false
            }
        ]
    }


## [Validation service](#validation-service)

The validation service is triggered by the cart service in Omnium. It runs in the following scenarios:

*   When the cart is modified in the GUI.
*   When the user accesses the cart in the GUI.
*   When the cart is modified via the API.

Additionally, Omnium provides a `ValidateCart` endpoint that triggers the same validation logic:

### [Endpoint](#endpoint)

[Omnium Cart Validate Endpoint](https://api.omnium.no/documentation/index.html#/Carts/CartValidate)

### [Request](#request)

The request posts the entire cart object to the provided endpoint.

### [Expected response](#expected-response)

The expected return object is `OmniumCartOmniumValidationResult`.

### [Response handling](#response-handling)

*   If `OmniumCartOmniumValidationResult` is `null`, the cart will not be updated.
*   Items in `ValidationErrors` or `ValidationWarning` will be displayed in the GUI.

**Highlighted error messages** come from the `Message` property in `OmniumValidationError`.


## [Built-in validators](#built-in-validators)

### [Validator overview](#validator-overview)

**Name**

**Description**

**Use Case**

**InventoryValidator**

Validates that each item in the cart has sufficient stock across the relevant warehouses. It calculates availability per SKU based on actual inventory, reserved quantities, and calculated quantities. Inventory validation is skipped for virtual products (`IsVirtual = true`).

Prevents overselling by checking stock availability across relevant warehouses before order placement.

**ActiveProductsValidator**

Checks that all products in the cart are active (`IsActive = true`) before allowing the cart to proceed. If any products are inactive, the validator returns a list of validation errors—one for each inactive SKU. Each error includes a message and a reference to the specific product that caused the issue.

Ensures only active, purchasable products are included in orders.

**InactiveCustomerValidator**

Validates whether the associated customer is marked as inactive. If the customer has `IsInactive = true`, the cart is blocked from proceeding.

Prevents checkout for inactive customers to ensure only valid, active customers can place orders.

**DiscountValidator**

Ensures applied discounts are valid and can be applied to the cart.

Prevents invalid or expired discounts from being applied to orders.

**NullPriceValidator**

Checks if any items in the order have a price of zero.

Prevents submission of carts with products that are missing price information.

**PaymentsValidator**

Validates that the total amount paid matches the order total. Fails if there are no payments, or if the total paid is too low or too high.

Prevents submission of carts with missing, insufficient, or excessive payments.

**CreditLimitValidator**

Validates that the customer's credit is sufficient to cover the cart total for credit-based payments. Includes checks for credit denial, remaining credit, and credit limit.

Prevents orders from being placed if the customer lacks sufficient credit or is not allowed to purchase on credit.

**PromotionCouponValidator**

Validates that all promotion coupon codes in the cart are valid. Invalid codes are removed and trigger a validation error.

Prevents the use of expired or invalid coupon codes by validating them and removing any that fail.

**InventoryAtpValidator**

Ensures fulfillment based on current and future inventory levels using Available-to-Promise (ATP) calculations.

Validates orders against projected inventory availability for future delivery dates.

**RequiredFieldsValidator**

Validates that all required fields are present in the order. The fields to check are defined in tenant settings and optionally filtered by order type.

Prevents submission of incomplete carts by ensuring that configured fields are not empty or missing.

**SalesLimitationValidator**

Checks for sales limitations on specific products, such as maximum quantities per customer or restricted product categories.

Enforces sales policies and product purchase limits.

**ShipmentValidator**

Ensures that at least one shipment is selected in the cart before submission. It checks whether the cart's order form contains any shipments, and returns a validation error if none are found.

Prevents carts from being submitted without a selected delivery method by ensuring that a shipment is present.

**PriCatIdValidator**

Validates that the cart has a Pricat ID and that all products in the cart share consistent Pricat IDs. If the cart is a pre-order and missing a Pricat ID, it adds a blank value and returns a warning. It also checks if product Pricat IDs match the cart's, and fails if mismatched or inconsistent.

Ensures product catalog consistency for pre-order and wholesale scenarios.

Each validator provides tailored validation logic to meet specific business requirements. Custom validators can also be implemented for additional flexibility.

* * *


## [Validator setup examples](#validator-setup-examples)

### [RequiredFieldsValidator](#requiredfieldsvalidator)

The following provides an example of how to set up the `RequiredFieldsValidator`. This validator ensures that carts with `OrderType = Online` have the field `CustomerReference` set. The validator supports both built-in properties on the cart object and custom properties.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "name": "requiredFieldsValidator",
        "isAuthenticatedManually": false,
        "timeOut": "00:00:00",
        "implementations": [
            "IValidator"
        ],
        "properties": [
            {
                "key": "OrderType",
                "value": "Online"
            },
            {
                "key": "Field",
                "value": "CustomerReference"
            }
        ],
        "disableStandardErrorPolicy": false,
        "enabledForMarkets": [],
        "disabledForMarkets": []
    }

### [InventoryValidator](#inventoryvalidator)

The inventory validator checks stock availability across warehouses. No additional configuration properties are required beyond the standard connector setup.

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "name": "inventoryValidator",
        "isAuthenticatedManually": false,
        "timeOut": "00:00:00",
        "implementations": [
            "IValidator"
        ],
        "disableStandardErrorPolicy": false
    }

### [Custom webhook validator](#custom-webhook-validator)

For custom validation logic, configure a webhook validator that calls your external endpoint:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "name": "customBusinessRulesValidator",
        "host": "https://your-api.com/api/validate-cart",
        "isAuthenticatedManually": false,
        "timeOut": "00:00:30",
        "implementations": [
            "IValidator"
        ],
        "disableStandardErrorPolicy": false,
        "properties": [
            {
                "key": "ValidationLevel",
                "value": "Strict"
            }
        ]
    }

Your endpoint will receive the complete cart object and should return an `OmniumCartOmniumValidationResult` object with any errors or warnings.

[

Previous

API Reference

](/docs/Carts/cart-api)[

Next

Validation

](/docs/Carts/validation)

---


## Validation

[Carts](/docs/Carts)

# Validation

How cart validation works in Omnium — ensuring carts are valid before they become orders.


## [Introduction](#introduction)

Validation in Omnium ensures that a cart meets all business requirements before it can be converted into an order. When a cart is validated, Omnium runs all configured validators and collects any errors or warnings. If validation fails, the cart cannot proceed to order creation until the issues are resolved.

Validators are executed automatically when:

*   The cart is modified in the Omnium UI
*   The cart is opened in the Omnium UI
*   The cart is modified via the API

Validation can also be triggered manually via the [Cart Validate endpoint](https://api.omnium.no/documentation/index.html#/Carts/CartValidate), and can be configured to only run manually by enabling the `IsCartValidatedManually` setting in [Cart Configuration](/docs/Carts/cart-config).

Each validator returns a `ValidationResult` that can contain:

*   **Validation errors** — block the cart from becoming an order
*   **Validation warnings** — displayed to the user but do not block order creation

Omnium ships with a set of built-in validators covering common scenarios such as inventory checks, payment validation, and product availability. You can also implement custom validators using webhooks. See [Cart Configuration](/docs/Carts/cart-config) for details on how to add and configure validators.

[

Previous

Configuration

](/docs/Carts/cart-config)[

Next

Cart Validators

](/docs/Carts/validation/cart-validators)

---


## Cart Validators

[Carts](/docs/Carts)[Validation](/docs/Carts/validation)

# Cart Validators

Reference for all built-in cart validators in Omnium.
