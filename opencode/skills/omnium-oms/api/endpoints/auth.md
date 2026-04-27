# Authentication — API Endpoints

## Contents

### Tokens

- `POST /api/Token`

---

## Tokens

### `POST /api/Token`

**Create a new token**

Operation ID: `TokenPost`

| Param | In | Type | Required | Description |
|-------|----|------|----------|-------------|
| `clientId` | query | string | No |  |
| `clientSecret` | query | string | No |  |
| `returnAsJson` | query | boolean | No |  |

**Response 200:** `OmniumTokenResponse`

---
