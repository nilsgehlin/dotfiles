# Analytics — API Endpoints

See `schemas/orders.md` for field definitions.

## Contents

### Orders | Analytics

- `POST /api/AnalyticsOrders/Search`
- `POST /api/AnalyticsOrders/SearchGrouped`

---

## Orders | Analytics

### `POST /api/AnalyticsOrders/Search`

**Search and filtering of analytics order lines**

Operation ID: `AnalyticsOrdersSearchAnalyticsOrderLines`

**Request body:** `OmniumAnalyticsOrderLineSearchRequest`

**Response 200:** `OmniumAnalyticsOrderLineOmniumSearchResult`

---

### `POST /api/AnalyticsOrders/SearchGrouped`

**Search for grouped analytics order lines**

Operation ID: `AnalyticsOrdersSearchOrderLinesGrouped`

**Request body:** `OmniumAnalyticsOrderLineSearchRequest`

**Response 200:** `OmniumAnalyticsOrderLineGroupedSearchResponse`

---
