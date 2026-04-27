# Integrations — Data Flow, Events & Connectors — Queues

## Queues

[Integrations](/docs/Integrations)

# Queues

Learn how to integrate and manage message queues with Omnium, including setup, error handling, and secure communication for efficient event processing.

### [Select a Messaging System](#select-a-messaging-system)

Choose a messaging system that suits your requirements. Omnium options include:

*   Apache Kafka
*   RabbitMQ
*   Azure Service Bus
*   Azure Storage Queues

### [Set Up a Queue](#set-up-a-queue)

1.  **Delta Query**: When making a request to the delta query endpoint, include a timestamp parameter indicating the point in time from which you want to retrieve changes. This could be the timestamp of the last successful synchronization.
    
2.  **Process the Response**: The response from Omnium will contain data that has changed since the specified timestamp. The response format will depend on the specific API and endpoint you are using.
    
3.  **Update Your System**: Extract relevant information from the response and update your system accordingly. This could involve adding new records, updating existing ones, or other actions required to reflect changes in Omnium.
    
4.  **Error Handling**: Implement robust error handling mechanisms to manage situations where requests fail or encounter issues. This may include retry mechanisms and logging to ensure that no changes are missed.
    
5.  **Scheduling**: Set up a schedule for executing delta queries based on your synchronization requirements. This could be a periodic task that runs at intervals suitable for your business needs.
    
6.  **Testing**: Thoroughly test your delta query implementation in the test environment before deploying it in a production setting. This helps identify and address any potential issues or gaps in functionality.
    

### [Create and Configure a Queue](#create-and-configure-a-queue)

1.  **Create a Queue**: Create a queue within your chosen messaging system. This is where Omnium will publish events or messages.
    
2.  **Configure Omnium**: Within Omnium, configure the integration to publish events or messages to the queue. This configuration typically involves specifying the endpoint or connection details of your messaging system.
    
3.  **Develop a Consumer**: Develop a message consumer in your system. This component is responsible for connecting to the queue, receiving messages as they arrive, and processing them accordingly.
    
4.  **Message Processing**: Implement the logic for processing each type of message received from the queue. This may involve updating records, triggering workflows, or performing other actions based on the message content.
    
5.  **Error Handling**: Implement robust error-handling mechanisms to manage situations where message processing fails. This could include retry mechanisms, logging, and handling exceptional scenarios.
    
6.  **Secure Communication**: Ensure secure communication between Omnium and your messaging system. This may involve using secure protocols (e.g., HTTPS) and proper authentication mechanisms.
    
7.  **Monitoring and Logging**: Implement monitoring and logging to track the status of message processing. This helps in identifying issues, tracking performance, and ensuring the overall health of the integration.
    
8.  **Testing**: Thoroughly test your message queuing integration in a controlled environment before deploying it in production. This includes testing different scenarios, error conditions, and scalability.
    

By setting up a queue-based integration, you can achieve asynchronous and decoupled communication between Omnium and your system, enabling efficient handling of events and messages in real time.

[

Previous

Scrolling

](/docs/Integrations/scrolling)[

Next

GUI Export and Import

](/docs/Integrations/gui-export-import)

---


## Scrolling

[Integrations](/docs/Integrations)

# Scrolling

Scrolling retrieves large datasets efficiently with a consistent order. Ideal for bulk processing and reporting, it requires proper scrollId management and completion.


## [Retrieving Large data sets efficiently](#retrieving-large-data-sets-efficiently)

**Scrolling** is a method designed for retrieving large sets of data from our APIs in a consistent and efficient manner. It is particularly useful when you need to process all items matching a search or filter request, and the result set is too large to be managed with standard pagination techniques.

Unlike traditional pagination, which returns results in discrete pages (using parameters like `page` and `take`), scrolling creates a snapshot of the current state of the data at the time of the request. This ensures that the order of the documents remains consistent throughout the scroll, regardless of any updates or changes made to the data during the process.

#### [Key Features of Scrolling:](#key-features-of-scrolling)

1.  **Consistency**: Scrolling operates by taking a snapshot of the documents that match your query at the time the scroll request is made. This means that once a scroll has started, any changes to the documents (such as updates, additions, or deletions) will not affect the documents being returned. This ensures that you receive all relevant documents in the same order throughout the scroll.
    
2.  **Scroll ID**: When performing a scroll search, the API returns a `scrollId` with the initial batch of documents. This `scrollId` must be used in subsequent requests to fetch the remaining documents. You can continue the scroll operation by passing the `scrollId` to the designated scroll endpoint. For example:  
    `/products/scroll/{id}`  
    where `{id}` is the `scrollId` provided in the previous response.
    
    The `scrollId` returned by the initial search may change with each subsequent request to the `/products/scroll/{id}` endpoint as you retrieve each batch. Each batch will return a new `scrollId`, which must be used for the next request. Always ensure that the latest `scrollId` is used to fetch the remaining documents, and continue this process until all results are retrieved and no further `scrollId` is returned.
    
    **Note:** The scrollId may or may not change with each request. In some cases, the same scrollId is reused across multiple calls, and this is expected behavior. It does not mean the same documents are returned.
    
3.  **Use Case**: Scrolling is best suited for scenarios where you need to retrieve and process the entire dataset in batches, such as data migration, bulk processing, or reporting. It is **not** intended for real-time or interactive requests, where users are browsing or navigating through data.
    
4.  **Rate Limits**: Rate limits are stricter on scroll endpoints compared to other API operations. It is crucial to manage scroll requests efficiently to avoid hitting rate limits, especially when working with large datasets. Avoid sending concurrent scroll requests to initial scroll searches to prevent rate limit violations. Rate limits on the endpoints that accepts a `scrollId` are less strict as they do not create a new scroll context.
    
5.  **Completion**: It is essential to **always finish a scroll**. Unfinished scroll operations will remain open and continue to consume resources on the server. This can negatively impact performance and resource allocation, particularly when handling multiple scroll requests. Ensure that each scroll is properly completed or terminated to free up resources.
    

#### [Example Workflow:](#example-workflow)

1.  **Initial Request**: Submit a search request that supports scrolling. This request will return a batch of results along with a `scrollId` to continue the scroll.
    
2.  **Subsequent Requests**: Use the `scrollId` to request the next batch of results by calling the scroll endpoint. Continue this process, ensuring that you always use the latest `scrollId` returned by each batch, until all data is retrieved.
    
3.  **Completion**: The scroll operation is complete when no additional results are returned by the scroll endpoint, at which point the `scrollId` becomes obsolete.
    

#### [Best Practices:](#best-practices)

*   Ensure that your system can handle large volumes of data returned by a scroll operation.
*   Use the scroll API in situations where you need to retrieve **all** documents for a specific query, rather than for paginated browsing.
*   Always finish a scroll to avoid leaving open operations that consume resources unnecessarily.
*   Be aware of the stricter rate limits on scroll endpoints and avoid concurrent scroll requests to stay within those limits.
*   Limit the duration of a scroll session, as `scrollId`s may expire after 5 minutes of inactivity.

[

Previous

Delta Queries

](/docs/Integrations/delta)[

Next

Queues

](/docs/Integrations/queues)

---


## Troubleshooting

[Integrations](/docs/Integrations)

# Troubleshooting

Common HTTP errors, integration issues, and step-by-step troubleshooting guides for Omnium.


## [Common HTTP Errors](#common-http-errors)

When integrating with the Omnium API, you may encounter these error responses:

### [400 Bad Request](#400-bad-request)

The request body is invalid or fails validation.

**Common causes:**

*   Missing required fields (e.g., `MarketId` on an order)
*   Invalid field values (e.g., negative prices, malformed dates)
*   Document too large (exceeds Elasticsearch document size limit)
*   Validation rule failure (e.g., duplicate order ID)

**What to do:** Check the response body for a validation message describing the specific error. Fix the request payload and retry.

### [401 Unauthorized](#401-unauthorized)

Authentication failed.

**Common causes:**

*   Missing or expired Bearer token
*   Invalid API credentials
*   Token generated for a different tenant

**What to do:** Generate a new token using your API credentials. Tokens are valid for 10 days. See the [API Developer Guide](/docs/GettingStartedWithAPI/api-developer-guide) for authentication details.

### [403 Forbidden](#403-forbidden)

Authentication succeeded, but the user doesn't have permission for this operation.

**Common causes:**

*   API user lacks the required role (e.g., trying an admin operation with an ApiUser role)
*   User doesn't have access to the requested store or market
*   Endpoint requires a higher privilege level

**What to do:** Check the user's roles and store/market access. See [Authentication & Roles](/docs/Security/authentication-roles) for the role hierarchy.

### [404 Not Found](#404-not-found)

The requested resource doesn't exist.

**Common causes:**

*   Incorrect entity ID
*   Entity was deleted
*   Wrong API endpoint path

**What to do:** Verify the ID and endpoint. Use search endpoints to confirm the entity exists.

### [409 Conflict](#409-conflict)

A concurrent modification conflict occurred.

**Common causes:**

*   Two processes tried to update the same entity simultaneously
*   Elasticsearch version conflict (optimistic concurrency)

**What to do:** Read the latest version of the entity, apply your changes, and retry. This is normal in high-concurrency scenarios.

### [429 Too Many Requests](#429-too-many-requests)

You've exceeded the rate limit.

**Common causes:**

*   Too many concurrent requests (default: 20 per API user, 40 per tenant)
*   Token bucket exhausted (12,000 capacity, refills 1,000 every 10 seconds)
*   Too many concurrent batch operations (limit: 4)

**What to do:** Implement exponential backoff with jitter. Reduce parallelism. For sustained high throughput, contact Omnium about custom rate limits. See [Rate Limits](/docs/Environments/rate-limits) for details.

### [500 Internal Server Error](#500-internal-server-error)

An unexpected error occurred on the server.

**What to do:** Note the timestamp and any request details, then check the event log for error entries around that time. If the issue persists, [contact support](/docs/support) with the details.

* * *


## [Troubleshooting Integration Issues](#troubleshooting-integration-issues)

### [Orders not syncing to ERP](#orders-not-syncing-to-erp)

1.  **Check the event log** for export errors — filter by className "Order" and look for error events
2.  **Verify connector credentials** — expired or rotated credentials are the most common cause
3.  **Check the scheduled task** — is the export task enabled and running on schedule?
4.  **Check the order status** — some export tasks only process orders in specific statuses
5.  **Check market/store filtering** — the connector may be restricted to specific markets via `EnabledForMarkets`

### [Products not appearing after import](#products-not-appearing-after-import)

1.  **Verify the API response** — did the create/update call return a success status?
2.  **Check product status** — is the product set to active?
3.  **Check market assignment** — does the product have the correct `marketIds`?
4.  **Check store assortment** — if using store-based assortments, is the product's category assigned to the store?
5.  **Wait for indexing** — Elasticsearch indexing has a short delay (typically under a second, but can be longer during bulk operations)

### [Inventory out of sync](#inventory-out-of-sync)

1.  **Check the inventory import task** — is it running and when did it last succeed?
2.  **Compare with source system** — use the inventory API to check the current values in Omnium
3.  **Check warehouse assignment** — is the inventory on the correct warehouse (store with `IsWarehouse: true`)?
4.  **Check for reservations** — active orders may have reserved stock, reducing available quantity
5.  **Virtual stock locations** — if using VSLs, check that allocation rules are distributing inventory correctly

### [Webhook deliveries failing](#webhook-deliveries-failing)

1.  **Check event log** — look for subscription result events showing delivery failures
2.  **Verify endpoint** — is your webhook URL accessible from the internet?
3.  **Check response** — webhooks expect a 2xx response within a reasonable timeout
4.  **Check authentication** — if your endpoint requires auth headers, verify they're configured in the subscription
5.  **Retry behavior** — failed webhooks are retried with increasing delays (1s, 5s, 15s)

### [Scheduled task not running](#scheduled-task-not-running)

1.  **Check if disabled** — `IsDisabled: true` prevents execution
2.  **Check cron schedule** — verify the schedule expression is correct
3.  **Check if already running** — tasks won't start a new execution if one is already in progress
4.  **Check the environment** — if Dev and Test share data, only run tasks in one environment to avoid duplicates
5.  **Manual trigger** — try running the task manually from the UI to see if it produces errors

* * *


## [Getting Help](#getting-help)

When you encounter an issue you can't resolve:

1.  **Check the event log** for errors around the time the issue occurred
2.  **Search this documentation** for the specific error or topic
3.  **Contact support** at [help.omnium.no](https://help.omnium.no/) with:
    *   Your tenant name and environment
    *   A detailed description of the issue
    *   Steps to reproduce
    *   Relevant IDs (order IDs, product IDs, etc.)
    *   Screenshots and API request/response details

For urgent matters, call [+47 22 12 01 01](tel:+4722120101).

See the [Support](/docs/support) page for guidelines on writing effective support requests.

* * *


## [Related Documentation](#related-documentation)

Topic

Link

API authentication

[API Developer Guide](/docs/GettingStartedWithAPI/api-developer-guide)

Roles and permissions

[Authentication & Roles](/docs/Security/authentication-roles)

API security best practices

[API Security](/docs/Security/api-security)

Rate limits and throttling

[Rate Limits](/docs/Environments/rate-limits)

Event structure and operation IDs

[Events](/docs/Integrations/events)

Monitoring and maintenance

[Operations](/docs/Environments/operations)

Support request guidelines

[Support](/docs/support)

[

Previous

GUI Export and Import

](/docs/Integrations/gui-export-import)[

Next

Connectors & Plugins

](/docs/plugins)