# Configuration & Operations — Configuration

## Configuration

# Configuration

Platform settings, scheduled tasks, GUI extensions, reports, and other configuration options in Omnium.

The Configuration section allows you to adjust Omnium to meet your business needs. From here, you can modify core settings, set up background jobs, extend the UI, and configure reporting.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fconfig-nav.c097e88a.png&w=3840&q=75)

* * *


## [In this section](#in-this-section)

[

GUI Extensions

Extend the Omnium UI with custom iframes, webhook actions, and panels



](/docs/configuration/gui-extensions)[

Scheduled Tasks

Background jobs for analytics, inventory, orders, notifications, and more



](/docs/configuration/scheduled-tasks)[

Custom Reports

Data export reports with flexible column mapping and role-based access



](/docs/configuration/custom-reports)[

Generic Concepts

External IDs, custom properties, and other cross-cutting concepts



](/docs/configuration/generic)[

Number Options

Auto-generated ID sequences for orders, carts, and other entities



](/docs/configuration/numberoptions)[

Rounding Settings

Price rounding policies with range-based rules and rounding methods



](/docs/configuration/rounding-settings)

[

Previous

Operations

](/docs/Environments/operations)[

Next

GUI Extensions

](/docs/configuration/gui-extensions)

---


## Security Overview

# Security Overview

How Omnium protects your data — authentication, authorization, tenant isolation, and security best practices.


## [Security Architecture](#security-architecture)

Omnium separates **authentication** (who you are) from **authorization** (what you can do). This separation keeps the security model flexible — you can change your identity provider without affecting your permission structure.

Layer

Responsibility

Where it happens

**Authentication**

Verifying identity

Identity provider (Azure AD B2C, Entra ID, Auth0) or API credentials

**Authorization**

Granting access to resources

Omnium's internal role engine

**Tenant isolation**

Separating customer data

Omnium infrastructure (separate data indices per tenant)

* * *


## [In this section](#in-this-section)

[

API Security Best Practices

Credential lifecycle, permission design, error handling, and go-live checklist



](/docs/Security/api-security)[

Authentication — UI

Set up SSO with Entra ID, Auth0, or Azure AD B2C for the Omnium backoffice



](/docs/Security/authentication-roles)[

SCIM 2.0 Provisioning

Automatic user and role synchronization from your identity provider



](/docs/Security/scim)

* * *


## [For API Developers](#for-api-developers)

If you are building an integration against the Omnium API, start here:

*   **[API Developer Guide](/docs/GettingStartedWithAPI/api-developer-guide)** — Authentication flow, token management, roles, and code examples
*   **[API Security Best Practices](/docs/Security/api-security)** — Credential lifecycle, permission design, error handling, and a go-live checklist
*   **[Rate Limits](/docs/Environments/rate-limits)** — Concurrency and token bucket limits

* * *


## [For Administrators](#for-administrators)

If you manage users, roles, and identity providers in the Omnium UI:

*   **[UI Authentication](/docs/Security/authentication-roles)** — Set up SSO with Entra ID, Auth0, or Azure AD B2C
*   **[SCIM 2.0 Provisioning](/docs/Security/scim)** — Automatic user and role synchronization from your identity provider
*   **[Access Rights and Invitations](/docs/access)** — Invite users and configure their access

* * *


## [How Roles Work](#how-roles-work)

Omnium uses **role-based access control (RBAC)** for both the API and the admin UI. Roles are assigned to users and determine which resources and actions they can access.

### [API Roles](#api-roles)

API users authenticate with a client ID and secret, and receive a JWT token containing their roles. There are three access levels, plus resource-specific roles:

Level

Purpose

**ApiOwner**

Full API access (equivalent to Admin)

**CommerceUser**

Headless commerce endpoints (carts, products, customers)

**ApiUser**

Base access level — required for authentication

Each resource domain (orders, products, customers, etc.) also has **Read** and **Admin** roles. See the [full role reference](/docs/GettingStartedWithAPI/api-developer-guide#resource-specific-roles) for details.

### [UI Roles](#ui-roles)

UI users are organized into **role groups** that combine functional permissions with store and market access. Roles can contain other roles, allowing you to build a hierarchy that reflects your organization.

Role properties:

*   **Functional permissions** — What the user can see and do (e.g., view orders, manage products)
*   **Store access** — Which stores the user can work with (`AllStores` or specific stores)
*   **Market access** — Which markets the user can work with (`AllMarkets` or specific markets)

For detailed role configuration, see [Roles, access rights, and users](https://help.omnium.no/hc/en-us/articles/22603831968017-Roles-access-rights-and-users).

* * *


## [Tenant Isolation](#tenant-isolation)

Omnium is a multi-tenant platform where each customer's data is completely separated at the infrastructure level:

*   **Data separation** — Each tenant's data is stored in its own search index. There is no shared data layer and no need for row-level tenant filtering.
*   **Token scoping** — Every JWT token contains a tenant claim. All API requests are automatically scoped to the tenant associated with the token.
*   **Cross-tenant protection** — An API user belonging to one tenant cannot access another tenant's data, even if they somehow obtain a valid token from another tenant. The system validates that the user's tenant matches the token's tenant on every request.
*   **Cache isolation** — Cached data is automatically keyed by tenant, so tenants never see each other's cached results.

* * *


## [Encryption and Data Protection](#encryption-and-data-protection)

What

How

**API credentials**

Client secrets are encrypted at rest using AES-256

**Data in transit**

All communication uses HTTPS/TLS

**SCIM tokens**

Stored as one-way SHA-512 hashes (plaintext is never stored)

**User passwords**

Managed by the identity provider (Azure AD B2C, Entra ID, or Auth0) — Omnium never stores passwords

* * *


## [Webhook Security](#webhook-security)

When Omnium sends data to your systems via webhooks, you can secure the connection using any of these methods:

Method

Description

**Bearer Token**

Include a static token in the `Authorization` header (recommended)

**Basic Authentication**

Send a username and password via HTTP Basic Auth

**Custom Headers**

Add arbitrary headers (e.g., an API key) to every webhook request

Webhook authentication is configured per connector in **Configuration > Connectors**. See the [Connectors guide](/docs/Integrations/connectors) for setup details.

Webhooks are **outbound only** — Omnium sends HTTP POST requests to your endpoint. Your endpoint should validate the authentication header before processing the payload.

* * *


## [Security Checklist](#security-checklist)

Use this checklist when preparing an integration or environment for production.

### [API Integrations](#api-integrations)

*    Each integration uses its own dedicated API user (never share credentials between systems)
*    Each API user has only the roles it needs (principle of least privilege)
*    API users are scoped to specific stores and markets where possible
*    Client secrets are stored in a secrets manager or vault — not in source code or config files
*    Your integration handles `401 Unauthorized` by requesting a new token (not by retrying with the expired one)
*    Your integration handles `429 Too Many Requests` with exponential backoff
*    Test and production environments use separate API users with separate credentials

### [User Management](#user-management)

*    SSO is configured with your identity provider (Entra ID, Auth0, or Azure AD B2C)
*    SCIM provisioning is enabled if you have more than a handful of users
*    Forced sign-in frequency is enabled for sensitive areas (e.g., authorization settings)
*    Departing employees are removed from the identity provider (SCIM handles the rest)
*    Role groups follow least privilege — users should only access the stores and markets they work with

### [Webhooks and Connectors](#webhooks-and-connectors)

*    All webhook endpoints use HTTPS
*    Webhook endpoints validate the authentication header before processing
*    Webhook endpoints are idempotent (safe to receive the same event more than once)
*    Connector credentials are reviewed periodically and rotated when team members change

[

Previous

Rounding Settings

](/docs/configuration/rounding-settings)[

Next

API Security Best Practices

](/docs/Security/api-security)

---


## Authentication - UI

[Security Overview](/docs/Security)

# Authentication - UI

Overview of authentication and authorization options in the Omnium UI and how roles are managed across identity providers.


## [Overview](#overview)

Omnium supports multiple authentication providers, allowing you to integrate with your preferred identity platform while maintaining consistent role-based access control.

Supported identity providers:

*   **Azure AD B2C** _(default)_
*   **Entra ID**
*   **Auth0**

In all setups, users and roles can also be managed directly via the Omnium API, giving you full control over your access model.

* * *


## [Azure AD B2C (Default)](#azure-ad-b2c-default)

Azure AD B2C is the default authentication provider and login for Omnium. It handles user authentication and password management. There are no custom role mappings or tenant-level configurations available for this option.

* * *


## [Entra ID](#entra-id)

Omnium supports **Single Sign-On (SSO)** with Entra ID through **OpenID Connect (OIDC)**.

### [Setup](#setup)

To set up SSO with Entra ID, the following information is required from your organization:

Parameter

Description

**TenantId**

Your Entra ID tenant ID

**ClientId**

The Application (client) ID of the app registration

**ClientSecret**

A client secret generated for the app registration

**Your organization is responsible for:**

*   Creating the App Registration in Entra ID
*   Generating the Client Secret
*   Configuring the Redirect URI in the App Registration
*   Providing the above values to Omnium

### [App Registration Configuration](#app-registration-configuration)

#### [Name](#name)

Use a descriptive name for the app registration, for example **Omnium** or **Omnium Production**. If you have separate environments (test and production), use distinct names such as **Omnium Test** and **Omnium Production**.

#### [Supported Account Types](#supported-account-types)

Select **"Accounts in this organizational directory only"** (Single tenant).

#### [Redirect URI](#redirect-uri)

When adding the Redirect URI, select **Web** as the platform and enter:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    https://your-brand-name.omnium.no/signin-oidc

Replace `your-brand-name` with your actual Omnium subdomain.

#### [Client Secret](#client-secret)

When generating the client secret, note that **secrets have an expiration date** (maximum 24 months in Entra ID). Make sure to track the expiration and renew the secret before it expires. When a secret expires, users will no longer be able to sign in until a new secret is generated and provided to Omnium.

#### [Branding & Properties (optional)](#branding--properties-optional)

In the App Registration under **Branding & properties**, you can configure:

Field

Value

**Logo**

Upload the Omnium logo (see below)

**Homepage URL**

`https://your-brand-name.omnium.no`

The logo and name are shown to users in the Entra ID MyApps portal and on consent screens.

**Logo requirements:** 215x215 pixels, PNG format, solid background, max 100 KB.

You can use one of the provided Omnium logos below. If you manage multiple environments, using different logos can help users visually distinguish between them.

Light background

Dark background

![Omnium logo (light)](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fentra_id_logo.57d10ad8.png&w=3840&q=75)

![Omnium logo (dark)](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fentra_id_logo2.bcadd7fb.png&w=3840&q=75)

Once configured, users from your organization can sign in using their existing Entra ID credentials.

### [User and Role Provisioning](#user-and-role-provisioning)

For automatic user and role synchronization with Entra ID, use **SCIM 2.0** provisioning.

See [Automatic User Management with SCIM 2.0](/docs/configuration/scim) for setup instructions.

* * *


## [Auth0](#auth0)

Omnium supports **Single Sign-On (SSO)** with Auth0 through **OpenID Connect (OIDC)**.

### [Setup](#setup-1)

To set up SSO with Auth0, the following information is required from your organization:

Parameter

Description

**Domain**

Your Auth0 domain (e.g., `your-tenant.eu.auth0.com`)

**ClientId**

The Application client ID

**ClientSecret**

The Application client secret

**Your organization is responsible for:**

*   Creating the Application in Auth0
*   Generating the Client Secret
*   Configuring the Callback URL in the Application settings
*   Providing the above values to Omnium

**Callback URL:** In your Auth0 Application settings, add the Callback URL pointing to your Omnium environment:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    https://your-brand-name.omnium.no/callback

Replace `your-brand-name` with your actual Omnium subdomain.

Once configured, users from your organization can sign in using their existing Auth0 credentials.

### [User and Role Provisioning](#user-and-role-provisioning-1)

For automatic user and role synchronization with Auth0, use **SCIM 2.0** provisioning.

See [Automatic User Management with SCIM 2.0](/docs/configuration/scim) for setup instructions.

* * *


## [User and Role Management via API](#user-and-role-management-via-api)

All users, roles, and permissions can also be managed via the Omnium API. This allows full programmatic control and can be used to integrate with external IAM or HR systems for automated user and role management.

**API documentation:** [https://apitest.omnium.no/documentation/index.html#/Users](https://apitest.omnium.no/documentation/index.html#/Users)

You can:

*   Create, update, or deactivate users
*   Assign or remove roles
*   Manage linked roles and permissions
*   Integrate with external IAM or HR systems for automated provisioning

**Tip:** On each user object, roles are represented as a flat list of strings under the `Roles` property. Market and store roles follow naming conventions:

*   **Market roles:** prefixed with `market-`
*   **Store roles:** prefixed with `store-`


## [Security Model](#security-model)

Authentication and authorization are handled separately in Omnium.

*   User authentication is performed by your identity provider (for example, Entra ID or Auth0) using OpenID Connect.
*   Omnium manages authorization internally and evaluates what each role can access.
*   Roles define access to specific functionality, stores, markets, and other entities in the Omnium domain model.
*   User and role provisioning can be automated using [SCIM 2.0](/docs/configuration/scim).
*   Without SCIM, users must be invited or created in Omnium before they can sign in. Role assignment is managed entirely inside Omnium.

For details about role configuration and granular access rights, see [Roles, access rights, and users](https://help.omnium.no/hc/en-us/articles/22603831968017-Roles-access-rights-and-users).

* * *


## [Forced Sign-In Frequency](#forced-sign-in-frequency)

Omnium supports forced sign-in frequency to control how often users must re-authenticate when accessing specific areas of the application. This feature enforces periodic credential verification, even when users have an active SSO session with their identity provider.

This feature works with all supported authentication providers (Azure AD B2C, Entra ID, and Auth0).

### [How It Works](#how-it-works)

*   Omnium tracks the time since each user's last authentication
*   When accessing areas configured with "Enforce sign-in frequency", users who exceed the configured timeout are required to sign in again
*   The identity provider is instructed to prompt for credentials, bypassing any existing SSO session
*   After successful authentication, the user is returned to their original location and the timeout resets

### [Configuration](#configuration)

Forced sign-in frequency is configured at two levels:

**1\. Global Settings**

Navigate to **Administration → Settings → Advanced Settings**:

Setting

Default

Description

Enable forced sign-in frequency

Off

Activates the feature

Timeout

30 minutes

Time since last authentication before re-authentication is required (1-120 minutes)

**2\. Per-Component Settings**

Once enabled globally, control which components require sign-in frequency. By default, no components require this:

*   Navigate to **Administration → Authorization**
*   Select a component
*   In the **Settings** tab, toggle **Enforce sign-in frequency**

### [What Happens During Re-Authentication](#what-happens-during-re-authentication)

*   Omnium requests a fresh login from the identity provider
*   Your organization's authentication policies (including MFA requirements) apply during re-authentication
*   This provides an additional layer of session control on top of any Conditional Access or session lifetime policies configured in your identity provider

* * *

**To set up SSO for your organization:** Contact [Omnium Support](mailto:support@omnium.no) with your identity provider details and we will configure the integration for your environment.

[

Previous

API Security Best Practices

](/docs/Security/api-security)[

Next

SCIM 2.0 (beta)

](/docs/Security/scim)

---


## SCIM 2.0 (beta)

[Security Overview](/docs/Security)

# SCIM 2.0 (beta)

Automatic User Management with SCIM 2.0 (beta). Automatically synchronize users and roles to Omnium from any identity provider.


## [Overview](#overview)

System for Cross-domain Identity Management (SCIM) is standard that can be used to automatically sync users from your company's central identity system (like Microsoft Entra ID, Okta, or OneLogin) into Omnium. Instead of manually creating and managing each user account, the system does it for you.

Once set up, user management becomes automatic:

*   New employees are automatically added to Omnium when created in your identity system
*   User information (name, email, phone) updates automatically when changed
*   Departing employees lose access immediately when removed from your system
*   Groups and permissions sync automatically, so access control stays centralized

This is especially useful when managing many users or if you want to avoid having to update users in many systems.

NOTE: The SCIM functionality has not been thoroughly tested yet and changes/fixes may come at a later time.


## [How It Works With Omnium](#how-it-works-with-omnium)

### [Groups/Roles](#groupsroles)

Groups in SCIM are synced to roles in Omnium (not to be confused with roles in SCIM). New groups in your identity system will be created in Omnium, unless we find a match by display name that can be linked.

**Group deletion:**

*   SCIM can only delete groups that it has provisioned (created or adopted)
*   Roles that SCIM has never interacted with cannot be deleted via SCIM
*   Once a role is adopted by SCIM (matched by display name), deleting the group in your identity provider will delete the role in Omnium

Current limitations:

*   We don't support changing the name of an existing group/role.
*   Only one layer of nested Omnium roles is supported.

### [Users](#users)

When SCIM tries to create users we first check if we can match on email or external id. If no user is found we create the user using the primary email address. If no email address is found we fall back to using the SCIM field userName.

**User deletion:**

*   SCIM can only delete users that it has provisioned (created or matched)
*   Users that SCIM has never interacted with cannot be deleted via SCIM
*   Once a user is matched by SCIM (by email or external id), deleting the user in your identity provider will delete the user in Omnium

Current limitations:

*   Users in Omnium cannot be deactivated since we as of now only support hard delete.


## [Setup](#setup)

### [1\. Generate Authentication Token](#1-generate-authentication-token)

Generate a secure bearer token for your identity provider:

\[data-radix-scroll-area-viewport\]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}\[data-radix-scroll-area-viewport\]::-webkit-scrollbar{display:none}

    # PowerShell - Generate random token
    $tokenLength = 32   # bytes of entropy; change as needed
    $token = [Convert]::ToBase64String([System.Security.Cryptography.RandomNumberGenerator]::GetBytes($tokenLength))
    Write-Host "Bearer Token: $token"
     
    # Hash with SHA-512 for Omnium
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($token)
    $sha512 = [System.Security.Cryptography.SHA512]::Create()
    $hashBytes = $sha512.ComputeHash($bytes)
    $hash = [System.BitConverter]::ToString($hashBytes).Replace("-", "")
    Write-Host "SHA-512 Hash: $hash"
    $sha512.Dispose()

Save both values:

*   **Bearer Token**: Configure in your identity provider
*   **SHA-512 Hash**: Configure in Omnium

### [2\. Configure Omnium](#2-configure-omnium)

Add the SHA-512 hash to your tenant settings:

*   Navigate to **Tenant Settings** → **Advanced**
*   Set `HashedScimProvisioningToken` to the SHA-512 hash from step 1

### [3\. Configure Your Identity Provider](#3-configure-your-identity-provider)

**SCIM Endpoint:** `https://app.omnium.no/scim/v2/{YourTenantId}/{Provider}`

Replace:

*   `{YourTenantId}` - Your tenant ID from Omnium settings
*   `{Provider}` - Your identity provider name (e.g., `EntraID`, `Okta`, `OneLogin`)

**Authentication:** Bearer Token (use the plaintext token from step 1)

**Note:** The provider name in the URL is used to track which identity provider provisioned each user. This allows you to switch providers in the future while preserving user data.

Configure standard SCIM 2.0 provisioning with the attribute mappings below.


## [Migrating to SCIM](#migrating-to-scim)

### [Key Considerations](#key-considerations)

Once SCIM is enabled, your identity provider becomes the master source for user and group management. Manual role assignments in Omnium will be replaced on next sync.

**Nested roles are preserved:** If an Omnium role contains other roles, those relationships remain. Users will see both direct (from IdP) and indirect (inherited) group memberships.

### [Pre-Migration Steps](#pre-migration-steps)

1.  **Backup existing users in Omnium** - Users can be exported in the top right corner in Omnium settings for users
2.  **Backup existing roles** - Either ask Omnium to do it or open developer tools, networking and open Roles in Omnium. The roles can be found in the GetGroupRoles request.
3.  **Audit existing users and roles** - Document current manual role assignments
4.  **Create groups in your identity provider** - Match Omnium role names where possible to enable automatic adoption
5.  **Assign users to groups** in your IdP before enabling provisioning
6.  **Test with pilot users** - Enable provisioning for a small group first

Note: SCIM can only delete users and roles that it has provisioned. Pre-existing users and roles that SCIM has never interacted with are protected from deletion.

### [Migration Process](#migration-process)

1.  Configure SCIM following the Setup section above
2.  Assign only pilot users (5-10) to the Omnium application in your IdP
3.  Verify pilot users sync correctly with expected group memberships
4.  Assign all users to the application and trigger full sync
5.  Validate all users retained necessary access

### [Common Scenarios](#common-scenarios)

**Existing user with manual roles:** User has roles `[RoleA, RoleB]` in Omnium. IdP provisions with groups `[GroupX]`. Result: User will have only `[GroupX]` after sync (except first sync when merged).

**Role name mismatch:** Omnium has "Store Managers", IdP sends "Store Manager". Result: New role created; existing role not adopted.

**Nested roles:** User assigned "Regional Manager" which contains \["Store Manager", "Sales Team"\]. Result: User gets direct membership to "Regional Manager" and indirect to the nested roles.

### [Rollback](#rollback)

If issues occur, pause provisioning in your IdP and unassign users from the Omnium application to stop further syncs. Contact Omnium for help.


## [Attribute Mappings](#attribute-mappings)

### [Users](#users-1)

Omnium Field

SCIM Attribute

Microsoft Entra ID (example)

Notes

User.Id

`emails[type eq "work"].value`

`mail`

**Primary identifier** (fallback to `userName` if missing)

User.Email

`emails[type eq "work"].value`

`mail`

Prioritize emails set to primary

User.ExternalIds

`userName`

`userPrincipalName`

Stored with the provider parameter from the scim url

User.FirstName

`name.givenName`

`givenName`

User.LastName

`name.familyName`

`surname`

User.Phone

`phoneNumbers[type eq "work"].value`

`mobilePhone`

User.B2CId

`externalId`

`objectId`

Azure AD ObjectId or equivalent

User.Roles

`groups`

### [Groups](#groups)

Omnium Field

SCIM Attribute

Microsoft Entra ID (example)

Notes

Role.Id

`id`

`displayName`

Normalized from DisplayName (lowercase, no spaces), returned as SCIM `id`

Role.DisplayName

`displayName`

`displayName`

Group name - **immutable after creation**

Role.ExternalIds

`externalId`

`objectId`

Azure group ObjectId stored with provider name

Role.RoleType

\-

\-

Constant value "Group"

Role.Roles

\-

\-

Empty array

**Group Matching (Migration Support):**

*   On first sync, Omnium checks for existing roles by `externalId` (Azure ObjectId), then by `displayName`
*   If a matching role exists, it's adopted and the `externalId` is stored
*   If no match, a new role is created with `Id` normalized from `displayName` (e.g., "Sales Team" → "salesteam")
*   This allows seamless migration from manually created roles to SCIM-managed roles

**Important Notes:**

*   **DisplayName is immutable**: Group names cannot be changed via SCIM after creation. If a group is renamed in Azure, it will be treated as a new group.
*   When users are added to a group, the normalized role ID is added to their User.Roles list, granting them the associated permissions.


## [Provider Examples](#provider-examples)

### [Microsoft Entra ID](#microsoft-entra-id)

1.  **Enterprise Applications** → **Provisioning** → **Automatic**
2.  **Tenant URL**: Production: `https://app.omnium.no/scim/v2/{YourTenantId}/EntraID`
3.  **Secret Token**: Your bearer token
4.  Map: `userPrincipalName` → `userName`, `mail` → `emails[type eq "work"].value`, etc.

### [Okta](#okta)

1.  **Applications** → **Provisioning** → **Configure API Integration**
2.  **SCIM Base URL**: Production: `https://app.omnium.no/scim/v2/{YourTenantId}/Okta`
3.  **Bearer Token**: Your bearer token
4.  Enable Create/Update/Deactivate operations

### [Other Providers](#other-providers)

Use standard SCIM 2.0 configuration with:

*   **Endpoint**: Production: `https://app.omnium.no/scim/v2/{YourTenantId}/{ProviderName}`
*   **Bearer Token**: Your plaintext token from step 1


## [Troubleshooting](#troubleshooting)

**Connection fails:**

*   Verify tenant ID in URL is correct
*   Ensure bearer token matches the SHA-512 hash configured in Omnium
*   Check SCIM provisioning is enabled for your tenant
*   Make sure you are using the url for the correct environment (apidev/apitest/app)

**Users not syncing:**

*   Verify email (`emails[type eq "work"].value`) is mapped - this is the primary identifier
*   Ensure `userName` is also mapped
*   Check users are assigned to the application in your IdP
*   Review provisioning logs in your identity provider

**Groups not working:**

*   Enable group provisioning in your IdP
*   Ensure `displayName` is mapped
*   Verify groups are assigned to the application


## [Support](#support)

Create a ticket at [https://help.omnium.no/hc/en-us/requests/new](https://help.omnium.no/hc/en-us/requests/new) with your tenant ID and provisioning logs if you need assistance.

[

Previous

Authentication - UI

](/docs/Security/authentication-roles)[

Next

Release notes

](/docs/Releasenotes)

---


## Custom Reports

[Configuration](/docs/configuration)

# Custom Reports

Configure custom data export reports with flexible column mapping, data types, and role-based access control.


## [Overview](#overview)

Custom Reports allow you to define tailored data export configurations for various entity types in Omnium. Each custom report specifies which data columns to include, how to format them, and where the report should be available. Reports can be exported in multiple formats including Excel, CSV, HTML, and PDF.

Custom Reports are configured in Tenant Settings under Report Settings and appear in context menus throughout the application wherever data export is available.

* * *
