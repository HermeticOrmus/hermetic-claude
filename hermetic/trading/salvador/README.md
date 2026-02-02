# Salvador Investment Tracker

Tracking system for Salvador Calomino's proportional investment.

## Quick Reference

| Field | Value |
|-------|-------|
| **Name** | Salvador Calomino |
| **WhatsApp** | +58 414-1155920 |
| **WhatsApp ID** | `584141155920@c.us` |
| **Current Value** | $476.04 USD |
| **Ownership** | 3.8% |
| **Model** | Proportional share of main portfolio |

---

## Commands

| Command | Description |
|---------|-------------|
| `/salva-update` | Send progress update via WhatsApp |
| `/salva-value <amount>` | Update current value |
| `/salva-contribution <amount>` | Record new contribution |
| `/salva-status` | View current state (no send) |

---

## File Structure

```
salvador/
├── data.json           # Single source of truth
├── templates/
│   ├── progress-update.md      # Standard update (Spanish)
│   ├── contribution-confirm.md # Contribution receipt
│   └── quick-status.md         # Brief status
├── history/
│   └── YYYY-MM-DD-type.md      # Archived sent messages
└── README.md           # This file
```

---

## data.json Schema

```json
{
  "investor": { "name", "whatsapp", "phone_display" },
  "account": { "current_value_usd", "ownership_pct", "last_updated" },
  "history": [ { "date", "value", "event", "amount?", "note?" } ],
  "portfolio": { "_comment", "total_usd", "as_of", "holdings" },
  "education": { "last_topic_index", "topics" }
}
```

**Important:** `portfolio` data is internal only - never shared with Salvador.

---

## Typical Workflows

### Send Progress Update
```
/salva-update
```
- Shows preview of message
- Asks for confirmation before sending
- Archives to history/
- Updates data.json

### Update Value
```
/salva-value 500.00
```
- Updates `current_value_usd`
- Shows diff (old vs new)
- Adds history entry

### Record Contribution
```
/salva-contribution 100
```
- Adds to `current_value_usd`
- Sends confirmation via WhatsApp
- Archives confirmation

### Check Status
```
/salva-status
```
- Displays current data
- No message sent

---

## Message Guidelines

Salvador only sees:
- **His** current value
- **His** change since last update
- Educational content (rotating topics)

Salvador does NOT see:
- Full portfolio total
- Individual holdings breakdown
- Internal notes

---

*Last updated: 2026-01-24*
