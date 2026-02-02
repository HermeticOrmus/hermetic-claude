---
name: salva-status
description: View Salvador's current investment status (no message sent)
version: 1.0.0
---

# Salvador Status

**Purpose:** Display current state of Salvador's investment without sending any messages.

**Usage:** `/salva-status`

---

## Procedure

### Step 1: Load Data

Read `~/.hermetic/trading/salvador/data.json`

### Step 2: Calculate Metrics

From history, find most recent previous update to calculate change.

```javascript
const previous = history.filter(h => h.event === "update" && h.date !== account.last_updated)[0];
const change = current_value - previous.value;
const change_pct = (change / previous.value) * 100;
```

### Step 3: Display Status

```
Salvador Calomino Investment Status
====================================

Current Value:  $[VALUE] USD
Ownership:      [PCT]%
Last Updated:   [DATE]

Change since last update:
  Previous:     $[PREV] USD ([PREV_DATE])
  Change:       [+/-]$[DIFF] USD ([PCT]%)

Recent History:
  [DATE] - [EVENT]: [DETAILS]
  [DATE] - [EVENT]: [DETAILS]
  [DATE] - [EVENT]: [DETAILS]

Education Progress:
  Last topic:   [TOPIC] ([INDEX]/[TOTAL])
  Next topic:   [NEXT_TOPIC]

WhatsApp: +58 414-1155920
====================================

Commands:
  /salva-update        Send progress update
  /salva-value <amt>   Update value
  /salva-contribution <amt>  Record contribution
```

---

## Example Output

```
Salvador Calomino Investment Status
====================================

Current Value:  $476.04 USD
Ownership:      3.8%
Last Updated:   2026-01-24

Change since last update:
  Previous:     $442.97 USD (2025-11-08)
  Change:       +$33.07 USD (+7.47%)

Recent History:
  2026-01-24 - update: Value updated
  2025-11-08 - update: Sent progress update via WhatsApp
  2025-10-21 - contribution: +$100 (Aporte adicional)

Education Progress:
  Last topic:   ETFs (1/6)
  Next topic:   Diversificacion

WhatsApp: +58 414-1155920
====================================

Commands:
  /salva-update        Send progress update
  /salva-value <amt>   Update value
  /salva-contribution <amt>  Record contribution
```

---

## Data Location

- **Source:** `~/.hermetic/trading/salvador/data.json`

---

## Important

- This command does NOT send any message
- Read-only operation
- Use to verify data before sending updates

---

**Last Updated:** 2026-01-24
