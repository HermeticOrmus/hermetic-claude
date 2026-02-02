---
name: salva-contribution
description: Record a new contribution from Salvador and send confirmation via WhatsApp
version: 1.0.0
args: <amount>
---

# Record Salvador Contribution

**Purpose:** Record a new contribution received from Salvador, update his value, and send confirmation via WhatsApp.

**Usage:** `/salva-contribution <amount>`

---

## Procedure

### Step 1: Parse Amount

Extract contribution amount in USD from arguments.

### Step 2: Load Current Data

Read `~/.hermetic/trading/salvador/data.json`

Get current value:
- `old_value = account.current_value_usd`

### Step 3: Calculate New Value

```javascript
const new_value = old_value + contribution_amount;
```

### Step 4: Generate Confirmation Message

Format in Spanish:

```
Hola Salvador!

Confirmo que recibi tu aporte de $[AMOUNT] USD.

**Tu nuevo valor total:** $[NEW_VALUE] USD

Gracias por seguir invirtiendo! Te aviso cuando tenga el proximo update.
```

### Step 5: Preview and Confirm

**Show the user:**
- Generated message
- Recipient: Salvador Calomino (584141155920@c.us)
- Summary:
  - Previous value: $[OLD]
  - Contribution: +$[AMOUNT]
  - New value: $[NEW]
- Ask: "Send this confirmation?"

**DO NOT SEND without explicit confirmation.**

### Step 6: On Confirmation - Send Message

Use WhatsApp MCP:
```javascript
mcp__whatsapp__periskope_send_message({
  phone: "584141155920@c.us",
  message: formattedMessage
})
```

### Step 7: Update data.json

1. `account.current_value_usd` = new_value
2. `account.last_updated` = today
3. Add to `history`:
   ```json
   {"date": "YYYY-MM-DD", "value": null, "event": "contribution", "amount": [amount], "note": "Contribution received"}
   ```

### Step 8: Archive Confirmation

Save to `~/.hermetic/trading/salvador/history/YYYY-MM-DD-contribution.md`:

```markdown
# Contribution Confirmed: YYYY-MM-DD

**Amount:** +$[AMOUNT] USD
**New Total:** $[NEW_VALUE] USD

---

[Full message text]
```

---

## Example

```
/salva-contribution 100
```

Output:
```
Contribution Recorded

Previous value: $476.04 USD
Contribution:   +$100.00 USD
New value:      $576.04 USD

Message Preview:
---
Hola Salvador!

Confirmo que recibi tu aporte de $100.00 USD.

Tu nuevo valor total: $576.04 USD

Gracias por seguir invirtiendo! Te aviso cuando tenga el proximo update.
---

Send this confirmation? [y/n]
```

---

## Data Location

- **Source:** `~/.hermetic/trading/salvador/data.json`
- **Template:** `~/.hermetic/trading/salvador/templates/contribution-confirm.md`
- **Archive:** `~/.hermetic/trading/salvador/history/`
- **WhatsApp ID:** `584141155920@c.us`

---

## Important

- **ALWAYS preview before sending**
- This adds to current value (contribution model)
- For proportional ownership changes, manually adjust `ownership_pct`

---

**Last Updated:** 2026-01-24
