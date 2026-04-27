# Notifications — Email & SMS


---

## Link Mobility

[Connectors & Plugins](/docs/plugins)Other

# Link Mobility

Guide for setting up Link Mobility in Omnium.

## [Link Mobility plugin](#link-mobility-plugin)

### [Introduction to Link Mobility functionality](#introduction-to-link-mobility-functionality)

With the Link Mobility integration, you can configure SMS notifications in Omnium based on various events and order statuses. Follow this guide to set up and get started with SMS notifications in Omnium.

### [Getting Started with the Link Mobility Integration](#getting-started-with-the-link-mobility-integration)

To get started, you must first set up an agreement with Link Mobility.

1.  **Contact Link Mobility** to obtain a license and establish the agreement.
2.  Once the agreement is in place, **Link Mobility will reach out to Omnium** to configure the integration in your system.

### [Set up](#set-up)

The configuration for the SMS client is located under:

**Configuration → Advanced → Notifications → SMS Client**

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flink-mobility.0eca40f9.png&w=3840&q=75)

Once the integration is ready, you can proceed to configure your notifications.

[

Previous

Google Feeds Integration

](/docs/plugins/Other/GoogleFeeds)[

Next

PinMeTo

](/docs/plugins/Other/PinMeTo)

---

## Sendgrid

[Connectors & Plugins](/docs/plugins)Other

# Sendgrid

Guide for setting up the Omnium Sendgrid plugin.

## [SendGrid integration](#sendgrid-integration)

### [Settings in Omnium](#settings-in-omnium)

1.  Go to **Configuration -> Advanced -> Email Client**.
2.  Set **type** to **Sendgrid**.
3.  Add the **API key** to the **"Key Name"** field.

### [Inbound Parsing](#inbound-parsing)

To handle incoming e-mails for adding replies to carts, orders, projects, etc., follow SendGrid's documentation: [SendGrid Inbound Parse Documentation](https://sendgrid.com/docs/for-developers/parsing-email/setting-up-the-inbound-parse-webhook/)

### [Set up MX Records](#set-up-mx-records)

1.  Navigate to the MX Records page on your hosting provider’s website. If you're unsure who your hosting or DNS provider is, contact your website administrator.
2.  Create a new MX record for the subdomain (e.g., `parse.yourdomain.com`) you want to process incoming email. This hostname should be used exclusively for parsing incoming emails.
3.  Assign the MX record a priority of **10** and point it to **mx.sendgrid.net**.

### [Inbound Settings in SendGrid](#inbound-settings-in-sendgrid)

_**NB!** It is recommended to use the **POST the raw, full MIME message** option as this is more robust with respect to different email formats. See the section "Using Raw-format with SendGrid" for details. The below example relies on the automatic parsing done by sendgrid._

1.  Go to **Settings -> Inbound Parse**.
2.  Click **"Add host & URL"**.
3.  Add your subdomain (same as MX record, e.g., "incoming").
4.  Add your **Domain** (verified domain).
5.  Set the Destination URL based on your environment:

Environment

Destination URL in SendGrid

Test

[https://apitest.omnium.no/api/InboundParse](https://apitest.omnium.no/api/InboundParse)

Prod

[https://api.omnium.no/api/InboundParse](https://api.omnium.no/api/InboundParse)

6.  **Optional**: Check **"Check incoming emails for spam"**.
7.  Do not check "POST the raw, full MIME message".

### [Inbound Settings in Omnium](#inbound-settings-in-omnium)

1.  Go to **Configuration -> Advanced -> Email Client**.
2.  Add the new inbound e-mail address to **"Inbound E-mail Address"**.

### [Using Raw-format with SendGrid](#using-raw-format-with-sendgrid)

Due to varying formats across different email providers, formatting issues may sometimes occur when using the standard model received from SendGrid. A way to overcome this issue is leveraging the SendGrid option **"POST the raw, full MIME message"** when setting up the inbound parse hook. This better preserves the formatting information related to the email.

### [Steps to Use the Raw Option:](#steps-to-use-the-raw-option)

1.  Go to **Settings** -> **Inbound Parse**
2.  Click **"Add host & URL"**
3.  Add **subdomain** (same as MX record, e.g., "incoming")
4.  **Domain**: Add your verified domain
5.  **Destination URL**: `https://api.omnium.no/api/InboundParse/Raw`
6.  Optional: **Check incoming emails for spam**
7.  Check the option **"POST the raw, full MIME message"**

### [Inbound Settings in Omnium:](#inbound-settings-in-omnium-1)

1.  Go to **Configuration** -> **Advanced** -> **Email Client**
2.  Add the new inbound email address to **"Inbound email address"**

[

Previous

PinMeTo

](/docs/plugins/Other/PinMeTo)[

Next

Markets

](/docs/Markets)