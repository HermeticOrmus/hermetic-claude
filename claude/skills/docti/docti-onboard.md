---
name: docti-onboard
description: Create new clinic tenant in Docti Pro multi-tenant system
version: 1.0.0
invocation: /docti-onboard
---

# /docti-onboard - Create New Clinic Tenant

Create a new clinic organization in the Docti Pro multi-tenant system.

## When to Use
- New clinic signs up for Docti Pro
- Need to provision tenant in database
- Set up clinic branding and notification configuration

## Required Information

Ask the user for:

1. **Clinic name** (required)
2. **Primary contact email** (required)
3. **Phone number** (optional)
4. **Address** (optional)
5. **Timezone** (default: America/Panama)
6. **Primary color** (default: #77B1CC - Docti blue)
7. **Secondary color** (default: #F2B371 - Docti orange)
8. **Admin user email** (required - first admin for the clinic)

## Process

### Step 1: Generate Organization Slug
```javascript
const slug = clinicName
  .toLowerCase()
  .replace(/[^a-z0-9]+/g, '-')
  .replace(/^-|-$/g, '')
```

### Step 2: Create Organization Record
```sql
INSERT INTO organizations (
  name, slug, email, phone, address,
  primary_color, secondary_color,
  timezone, default_language, is_active
) VALUES (
  '{clinic_name}', '{slug}', '{email}', '{phone}', '{address}',
  '{primary_color}', '{secondary_color}',
  '{timezone}', 'es', TRUE
) RETURNING id;
```

### Step 3: Create Notification Config
```sql
INSERT INTO organization_notification_config (
  organization_id,
  whatsapp_enabled, whatsapp_sender_name,
  email_enabled, email_from_name, email_reply_to
) VALUES (
  '{org_id}',
  TRUE, '{clinic_name}',
  TRUE, '{clinic_name} Citas', '{email}'
);
```

### Step 4: Update Admin User Profile
```sql
UPDATE profiles
SET organization_id = '{org_id}', role = 'admin'
WHERE email = '{admin_email}';
```

### Step 5: Send Welcome Email (via Resend)
Subject: "Bienvenido a Docti Pro - {clinic_name}"

### Step 6: Log Onboarding
```sql
INSERT INTO activity_log (
  action, entity_type, entity_id, details
) VALUES (
  'created', 'organization', '{org_id}',
  '{"clinic_name": "{clinic_name}", "admin_email": "{admin_email}"}'::jsonb
);
```

## Verification Checklist

After onboarding, verify:
- [ ] Organization appears in `organizations` table
- [ ] Notification config created
- [ ] Admin user has correct `organization_id`
- [ ] Welcome email sent

## Example Output

```
Clinic onboarded successfully!

Organization: BioGenesis Regenerative Center
Slug: biogenesis-regenerative-center
ID: 123e4567-e89b-12d3-a456-426614174000
Admin: admin@biogenesis.com

Next steps:
1. Admin can now log in at docti.io
2. Configure services and appointment types
3. Import existing patients (if any)
4. Set up Google Calendar integration
```

## Rollback

If onboarding fails:
```sql
DELETE FROM organization_notification_config WHERE organization_id = '{org_id}';
DELETE FROM organizations WHERE id = '{org_id}';
UPDATE profiles SET organization_id = NULL WHERE email = '{admin_email}';
```
