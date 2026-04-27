# Notifications — API Endpoints

See `schemas/common.md` for field definitions.

## Contents

### Notifications

- `POST /api/Notifications/SendEmail`
- `POST /api/Notifications/SendSms`

---

## Notifications

### `POST /api/Notifications/SendEmail`

**Send E-mail**

Operation ID: `NotificationsSendEmail`

**Request body:** `OmniumEmailMessage`

---

### `POST /api/Notifications/SendSms`

**Send SMS**

Operation ID: `NotificationsSendSms`

**Request body:** `OmniumSmsMessage`

---
