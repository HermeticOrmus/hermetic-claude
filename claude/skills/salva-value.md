---
name: salva-value
description: Update Salvador's current investment value in data.json
version: 1.0.0
args: <amount> [portfolio_total]
---

# Update Salvador's Value

**Purpose:** Update the current value of Salvador's investment and optionally the total portfolio value.

**Usage:** `/salva-value <amount> [portfolio_total]`

---

## Procedure

### Step 1: Parse Arguments

- `amount` (required): New value for Salvador's investment in USD
- `portfolio_total` (optional): New total portfolio value in USD

### Step 2: Load Current Data

Read `~/.hermetic/trading/salvador/data.json`

Store old values:
- `old_value = account.current_value_usd`
- `old_portfolio = portfolio.total_usd` (if updating)

### Step 3: Calculate Diff

```javascript
const change_amount = new_value - old_value;
const change_pct = (change_amount / old_value) * 100;
```

### Step 4: Update data.json

Update fields:
- `account.current_value_usd` = new amount
- `account.last_updated` = today (YYYY-MM-DD)
- If portfolio_total provided:
  - `portfolio.total_usd` = new total
  - `portfolio.as_of` = today

Add to `history` array:
```json
{"date": "YYYY-MM-DD", "value": [new_value], "event": "update"}
```

### Step 5: Display Summary

Show the user:

```
Value Updated

Previous: $[OLD] USD
New:      $[NEW] USD
Change:   [+/-]$[DIFF] USD ([PCT]%)

Last updated: [DATE]
```

If portfolio updated:
```
Portfolio Total: $[OLD_TOTAL] → $[NEW_TOTAL] USD
```

---

## Examples

### Update value only
```
/salva-value 500.00
```

### Update value and portfolio
```
/salva-value 500.00 17000.00
```

---

## Data Location

- **Source:** `~/.hermetic/trading/salvador/data.json`

---

## Important

- This command does NOT send any message to Salvador
- Use `/salva-update` to notify Salvador of new value
- Recalculate ownership_pct if portfolio total changes significantly

---

**Last Updated:** 2026-01-24
