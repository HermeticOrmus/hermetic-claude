---
name: docti-migrate
description: Migrate features between Docti Pro client implementations
version: 1.0.0
invocation: /docti-migrate
---

# /docti-migrate - Migrate Features Between Clients

Move or copy features from one client implementation to another, or from a client to the shared packages.

## When to Use
- Extract reusable component to `shared/`
- Copy feature from biogenesis to brandless template
- Sync updates across client implementations

## Migration Types

### 1. Client to Shared
Extract reusable code from a client to shared packages:
```
/docti-migrate client-to-shared <client> <component-path>
```

Example:
```
/docti-migrate client-to-shared biogenesis app/components/app/AppVoiceInput.vue
```

### 2. Client to Client
Copy feature from one client to another:
```
/docti-migrate client-to-client <source> <target> <feature-path>
```

Example:
```
/docti-migrate client-to-client biogenesis brandless app/pages/quotes/
```

### 3. Shared to Client
Install shared package in client:
```
/docti-migrate shared-to-client <package> <client>
```

Example:
```
/docti-migrate shared-to-client ui biogenesis
```

## Process: Client to Shared

### Step 1: Identify Dependencies
```bash
# Check imports in the component
grep -r "import" <component-path>
```

### Step 2: Create Shared Package Structure
```
shared/<package>/
├── package.json
├── index.ts
└── components/
    └── <component>.vue
```

### Step 3: Extract Component
1. Copy component to shared package
2. Update imports to use relative paths
3. Export from index.ts
4. Add types to shared/types if needed

### Step 4: Update Original Client
1. Remove original component
2. Import from shared package
3. Update any local imports

### Step 5: Test
```bash
cd clients/<client>
npm run typecheck
npm run dev
```

## Process: Client to Client

### Step 1: Copy Files
```bash
cp -r clients/<source>/<path> clients/<target>/<path>
```

### Step 2: Update Imports
- Adjust relative paths
- Update any client-specific references

### Step 3: Update Types
- Ensure types are compatible
- Copy any missing type definitions

### Step 4: Test Both Clients
```bash
cd clients/<source> && npm run typecheck
cd clients/<target> && npm run typecheck
```

## Shared Package Structure

```
shared/
├── ui/                 # Reusable Vue components
│   ├── package.json
│   ├── index.ts
│   └── components/
│       ├── AppInput.vue
│       ├── AppButton.vue
│       └── AppVoiceInput.vue
├── types/              # Shared TypeScript types
│   ├── package.json
│   ├── index.ts
│   └── database.ts
└── utils/              # Shared utilities
    ├── package.json
    ├── index.ts
    └── formatters.ts
```

## Migration Checklist

Before migration:
- [ ] Identify all dependencies
- [ ] Check for client-specific code
- [ ] Plan import path changes

After migration:
- [ ] All imports resolve
- [ ] Types compile
- [ ] Components render correctly
- [ ] No duplicate code remains

## Common Issues

**Circular dependencies:**
- Extract shared types first
- Use interfaces instead of classes

**Client-specific code:**
- Use props/slots for customization
- Extract configuration to env/config

**Missing types:**
- Copy types to shared/types
- Use declaration merging if needed
