---
name: salva-update
description: Send progress update to Salvador via WhatsApp with current value, change, and educational content
version: 1.0.0
---

# Send Salvador Progress Update

**Purpose:** Generate and send a progress update to Salvador via WhatsApp with his current investment value, change since last update, and rotating educational content.

---

## Procedure

### Step 1: Load Data

Read `~/.hermetic/trading/salvador/data.json`

Extract:
- `account.current_value_usd` - Current value
- `account.last_updated` - Last update date
- `history` - Find previous update value
- `education.last_topic_index` - Current education topic index
- `education.topics` - Topic list

### Step 2: Calculate Change

Find previous value from `history` array (most recent entry with `event: "update"` before current).

Calculate:
- `change_amount = current_value - previous_value`
- `change_pct = (change_amount / previous_value) * 100`

### Step 3: Get Education Topic

```javascript
const topicIndex = data.education.last_topic_index;
const topic = data.education.topics[topicIndex];
```

### Step 4: Generate Message

Format in Spanish:

```
Hola Salvador!

**Tu inversion actual:** $[CURRENT] USD

**Cambio desde ultimo update:**
- Valor anterior: $[PREVIOUS] USD
- Cambio: [+/-]$[CHANGE] USD ([CHANGE_PCT]%)

**Tip de inversion:**
[TOPIC]: [URL]

Cualquier pregunta, me avisas!
```

### Step 5: Preview and Confirm

**Show the user:**
- Generated message
- Recipient: Salvador Calomino (584141155920@c.us)
- Ask: "Send this message?"

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

1. Increment `education.last_topic_index` (wrap to 0 if at end)
2. Update `account.last_updated` to today
3. Add entry to `history`:
   ```json
   {"date": "YYYY-MM-DD", "value": [current], "event": "update", "note": "Progress update sent"}
   ```

### Step 8: Archive Message

Save to `~/.hermetic/trading/salvador/history/YYYY-MM-DD-update.md`:

```markdown
# Update Sent: YYYY-MM-DD

**Value:** $[VALUE] USD
**Change:** [CHANGE_PCT]%

---

[Full message text]
```

---

## Data Location

- **Source:** `~/.hermetic/trading/salvador/data.json`
- **Template:** `~/.hermetic/trading/salvador/templates/progress-update.md`
- **Archive:** `~/.hermetic/trading/salvador/history/`
- **WhatsApp ID:** `584141155920@c.us`

---

## Important

- **ALWAYS preview before sending**
- Salvador only sees HIS value - never mention total portfolio
- Messages in Spanish
- Educational topic rotates each update

---

**Last Updated:** 2026-01-24
