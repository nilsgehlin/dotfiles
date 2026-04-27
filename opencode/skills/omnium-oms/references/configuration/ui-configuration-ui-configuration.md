# Configuration & Operations — [UI Configuration](#ui-configuration)

## [UI Configuration](#ui-configuration)

Rounding Settings are configured in the Omnium UI under **Administration > Tenant Settings > Rounding**.

### [Creating a Rounding Policy](#creating-a-rounding-policy)

1.  Navigate to **Administration > Tenant Settings > Rounding**
2.  Click **Add** to create a new rounding policy
3.  Fill in the policy details:
    *   **Name**: A unique key used to reference the policy (e.g., `NicePrice95`)
    *   **Display Name**: A human-readable label shown in the UI (e.g., "Round to .95")

### [Adding Rules to a Policy](#adding-rules-to-a-policy)

Each policy needs at least one rule. Rules define the rounding behavior for specific price ranges.

1.  Expand the policy panel
2.  Click **Add** to create a new rule
3.  Configure the rule:
    *   **Min Price**: The minimum price this rule applies to (leave empty for no lower bound)
    *   **Max Price**: The maximum price this rule applies to (leave empty for no upper bound)
    *   **Rounding Method**: Select either `RoundToNicePrice` or `RoundToNearest`
    *   **Round To**: (RoundToNearest only) The value to round to
    *   **Step**: (RoundToNicePrice only) The rounding step increment
    *   **Offset**: (RoundToNicePrice only) The value to subtract after rounding up

### [Using a Rounding Policy](#using-a-rounding-policy)

Once configured, rounding policies appear as selectable options in areas that support price rounding (e.g., price list bulk editing). The policy selector shows all defined policies by their key/label.

* * *


## [Example Configurations](#example-configurations)

### ["Nearest .95" Rounding Policy](#nearest-95-rounding-policy)

A common retail strategy where prices end in .95 at different scales depending on the price range:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "RoundingSettings": {
            "RoundingPolicies": [
                {
                    "Key": "NearestNinetyFive",
                    "Label": "Round to .95 ending",
                    "Rules": [
                        {
                            "MinPrice": 50,
                            "MaxPrice": 1000,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 100,
                            "Offset": 5
                        },
                        {
                            "MinPrice": 1000,
                            "MaxPrice": 5000,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 500,
                            "Offset": 50
                        },
                        {
                            "MinPrice": 5000,
                            "MaxPrice": 10000,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 1000,
                            "Offset": 50
                        }
                    ]
                }
            ]
        }
    }

**Result examples**:

Input

Range

Result

Explanation

40

Below 50 (no rule)

40

No matching rule, price unchanged

51

50-1000

95

Step 100, Offset 5

99

50-1000

95

Step 100, Offset 5

1000

50-1000

995

Step 100, Offset 5 (MaxPrice is inclusive, so 1000 matches the first rule)

3200

1000-5000

3450

Step 500, Offset 50

6200

5000-10000

6950

Step 1000, Offset 50

### ["Nearest .99" Rounding Policy](#nearest-99-rounding-policy)

A strategy with finer-grained ranges for .99/.90-style endings:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "RoundingSettings": {
            "RoundingPolicies": [
                {
                    "Key": "NearestNinetyNine",
                    "Label": "Round to .99 ending",
                    "Rules": [
                        {
                            "MinPrice": 0,
                            "MaxPrice": 50,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 10,
                            "Offset": 1
                        },
                        {
                            "MinPrice": 50,
                            "MaxPrice": 1000,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 100,
                            "Offset": 1
                        },
                        {
                            "MinPrice": 1000,
                            "MaxPrice": 5000,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 500,
                            "Offset": 10
                        },
                        {
                            "MinPrice": 5000,
                            "MaxPrice": 10000,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 1000,
                            "Offset": 100
                        }
                    ]
                }
            ]
        }
    }

**Result examples**:

Input

Range

Result

5

0-50

9

39

0-50

39

51

50-1000

99

1000

50-1000

999 (MaxPrice is inclusive, so 1000 matches this rule before the 1000-5000 rule)

3200

1000-5000

3490

6200

5000-10000

6900

### [Round to Nearest Whole Number](#round-to-nearest-whole-number)

A simple policy that rounds all prices to the nearest whole number:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "RoundingSettings": {
            "RoundingPolicies": [
                {
                    "Key": "NearestWholeNumber",
                    "Label": "Round to nearest whole number",
                    "Rules": [
                        {
                            "MinPrice": 0,
                            "MethodKey": "RoundToNearest",
                            "RoundTo": 1
                        }
                    ]
                }
            ]
        }
    }

**Result examples**:

Input

Result

40.4

40

40.5

41

39.9

40

### [Multiple Policies](#multiple-policies)

You can define multiple policies for different use cases:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "RoundingSettings": {
            "RoundingPolicies": [
                {
                    "Key": "NicePrice",
                    "Label": "Nice price (.95 ending)",
                    "Rules": [
                        {
                            "MinPrice": 0,
                            "MethodKey": "RoundToNicePrice",
                            "Step": 100,
                            "Offset": 5
                        }
                    ]
                },
                {
                    "Key": "WholeNumber",
                    "Label": "Round to nearest 10",
                    "Rules": [
                        {
                            "MinPrice": 0,
                            "MethodKey": "RoundToNearest",
                            "RoundTo": 10
                        }
                    ]
                }
            ]
        }
    }

* * *


## [Best Practices](#best-practices)

### [Rule Design](#rule-design)

*   **Cover all price ranges**: Ensure your rules cover the full expected price range. Prices outside all defined ranges will not be rounded.
*   **Order rules carefully**: The first matching rule is used. Place more specific (narrower range) rules before broader ones if ranges could overlap.
*   **Avoid overlapping ranges**: While the system handles overlaps by using the first match, non-overlapping ranges are easier to reason about.
*   **Set a minimum threshold**: Consider skipping rounding for very low prices by starting your first rule's `MinPrice` above zero.

### [Policy Naming](#policy-naming)

*   **Use descriptive keys**: Choose keys that describe the rounding behavior (e.g., `NicePrice95`, `RoundToNearest10`)
*   **Add labels**: Provide clear labels so users can easily select the right policy in the UI

* * *


## [Related Documentation](#related-documentation)

*   [Generic Concepts](/docs/configuration/generic) - External IDs and Properties used in Omnium

[

Previous

Number Options

](/docs/configuration/numberoptions)[

Next

Security Overview

](/docs/Security)

---


## Scheduled Tasks

[Configuration](/docs/configuration)

# Scheduled Tasks

Configure and manage background jobs in Omnium

Scheduled tasks are background jobs that run automatically at specified intervals to maintain data consistency, synchronize with external systems, send notifications, and perform various housekeeping operations in Omnium.


## [Cron Schedule Format](#cron-schedule-format)

Scheduling is controlled by a [cron schedule](https://en.wikipedia.org/wiki/Cron):

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

     ┌───────────── minute (0 - 59)
     │ ┌───────────── hour (0 - 23)
     │ │ ┌───────────── day of the month (1 - 31)
     │ │ │ ┌───────────── month (1 - 12)
     │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday)
     │ │ │ │ │
     │ │ │ │ │
     │ │ │ │ │
     * * * * *

### [Common Schedule Examples](#common-schedule-examples)

Schedule

Description

`*/5 * * * *`

Every 5 minutes

`0 * * * *`

Every hour (at minute 0)

`0 */6 * * *`

Every 6 hours

`0 0 * * *`

Daily at midnight

`0 3 * * *`

Daily at 3:00 AM

`0 0 * * 0`

Weekly on Sunday at midnight

`0 0 1 * *`

Monthly on the 1st at midnight

* * *


## [Task Groups](#task-groups)

Omnium scheduled tasks are organized into functional groups:

Group

Description

Tasks

[Analytics](/docs/configuration/scheduled-tasks/analytics)

Statistics generation, data aggregation, and reporting

8

[Customer Club](/docs/configuration/scheduled-tasks/customer-club)

Loyalty program management, points, birthdays, and member notifications

9

[Orders](/docs/configuration/scheduled-tasks/orders)

Order lifecycle management, allocation, automation, and cleanup

11

[Products](/docs/configuration/scheduled-tasks/products)

Product data maintenance, pricing, assortment, and inventory status

11

[Inventory](/docs/configuration/scheduled-tasks/inventory)

Stock levels, allocation tracking, valuation, and reorder suggestions

7

[Carts](/docs/configuration/scheduled-tasks/carts)

Shopping cart maintenance and conversion

2

[Vouchers](/docs/configuration/scheduled-tasks/vouchers)

Voucher lifecycle and reactivation

2

[Prices](/docs/configuration/scheduled-tasks/prices)

Price data cleanup and maintenance

2

[Projects](/docs/configuration/scheduled-tasks/projects)

Project lifecycle and anonymization

2

[Ratings](/docs/configuration/scheduled-tasks/ratings)

Product rating verification

1

[Stores](/docs/configuration/scheduled-tasks/stores)

Store data maintenance

1

[Subscriptions](/docs/configuration/scheduled-tasks/subscriptions)

Subscription order generation

1

[Notifications](/docs/configuration/scheduled-tasks/notifications)

Notification processing and delivery

1

[Events](/docs/configuration/scheduled-tasks/events)

Event log maintenance

1

* * *


## [Task Types](#task-types)

### [Delta Tasks](#delta-tasks)

Delta tasks process only data that has changed since the last run. They are efficient and can run frequently (every few minutes). Examples include order import tasks and inventory sync tasks.

### [Full Tasks](#full-tasks)

Full tasks process all relevant data regardless of changes. They are typically scheduled less frequently (daily or weekly) and are used for data consistency checks, cleanup operations, or complete recalculations.

* * *


## [Configuration](#configuration)

Scheduled tasks are configured by adding entries to `ScheduledTaskSettings`. Navigate to **Configuration > Advanced > Connectors > Scheduled Task** in the Omnium UI.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Faddscheduletask.215f5af3.png&w=3840&q=75)

### [Configuration Properties](#configuration-properties)

Property

Type

Description

`Schedule`

string

Cron expression defining when the task runs

`ImplementationType`

string

The scheduled task class name

`IsDisabled`

bool

Set to `true` to temporarily disable the task

`Properties`

array

Task-specific configuration properties

### [Example Configuration](#example-configuration)

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "ImplementationType": "DeleteAbandonedCartScheduledTask",
        "Schedule": "0 3 * * *",
        "IsDisabled": false
    }

### [Configuration with Properties](#configuration-with-properties)

Some tasks accept additional configuration properties:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    {
        "ImplementationType": "DeleteOldOrdersScheduledTask",
        "Schedule": "0 2 * * 0",
        "Properties": [
            {
                "Key": "DeleteOrdersThreshold",
                "Value": "3"
            }
        ]
    }

* * *


## [Plugin Scheduled Tasks](#plugin-scheduled-tasks)

Scheduled tasks for external integrations (ERP, POS, E-commerce, WMS, etc.) are documented within each plugin's documentation:

### [Point of Sale (POS)](#point-of-sale-pos)

*   [Sitoo](/docs/plugins/POS/Sitoo) - Order import, product/inventory export
*   [FrontSystems](/docs/plugins/POS) - Product import, inventory sync
*   [Flow](/docs/plugins/POS) - Product, price, and inventory export
*   [VisionPOS](/docs/plugins/POS) - Product and inventory import

### [ERP Systems](#erp-systems)

*   [Dynamics 365](/docs/plugins/ERP) - Orders, inventory, prices, customers
*   [Vitari Connect](/docs/plugins/ERP) - Orders, inventory, invoices
*   [TripleTex](/docs/plugins/ERP) - Invoice synchronization
*   [PowerOffice Go](/docs/plugins/ERP) - Cash sale export, bank vouchers

### [E-commerce Platforms](#e-commerce-platforms)

*   [Shopify](/docs/plugins/ECOM/Shopify) - Products, orders, inventory
*   [Magento](/docs/plugins/ECOM/Magento) - Products, orders, customers, inventory
*   [Jetshop](/docs/plugins/ECOM) - Products, orders, inventory

### [Warehouse Management](#warehouse-management)

*   [Ongoing WMS](/docs/plugins/WMS) - Order and inventory synchronization

### [Product Feeds](#product-feeds)

*   [Google Shopping](/docs/plugins/Other) - Product feed export
*   [Nosto](/docs/plugins/Other) - Product recommendations export

* * *


## [Best Practices](#best-practices)

### [Scheduling Guidelines](#scheduling-guidelines)

1.  **Delta tasks**: Schedule frequently (every 1-15 minutes) for near real-time sync
2.  **Full tasks**: Schedule during off-peak hours (typically 2-5 AM)
3.  **Heavy tasks**: Avoid running multiple resource-intensive tasks simultaneously
4.  **Cleanup tasks**: Run weekly or monthly depending on data volume

### [Monitoring](#monitoring)

*   Check the scheduled task execution logs regularly
*   Set up alerts for failed task executions
*   Monitor task duration trends for performance issues

### [Troubleshooting](#troubleshooting)

*   If a task fails, check the event log for detailed error messages
*   Verify that required settings and configurations are in place
*   For integration tasks, ensure external system credentials are valid

[

Previous

GUI Extensions

](/docs/configuration/gui-extensions)[

Next

Analytics Scheduled Tasks

](/docs/configuration/scheduled-tasks/analytics)