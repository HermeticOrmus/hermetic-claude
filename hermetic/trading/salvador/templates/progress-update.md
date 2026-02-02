# Progress Update Template

**Use:** Standard progress update message in Spanish
**Tone:** Friendly, educational, encouraging

---

## Template

```
Hola Salvador!

**Tu inversion actual:** ${CURRENT_VALUE} USD

**Cambio desde ultimo update:**
- Valor anterior: ${PREVIOUS_VALUE} USD
- Cambio: ${CHANGE_AMOUNT} USD (${CHANGE_PCT}%)

**Tip de inversion:**
${EDUCATION_TOPIC}: ${EDUCATION_URL}

Cualquier pregunta, me avisas!
```

---

## Variables

| Variable | Source | Example |
|----------|--------|---------|
| `${CURRENT_VALUE}` | `account.current_value_usd` | 476.04 |
| `${PREVIOUS_VALUE}` | Last `history` entry with `event: update` | 442.97 |
| `${CHANGE_AMOUNT}` | `current - previous` | +33.07 |
| `${CHANGE_PCT}` | `(change / previous) * 100` | +7.47% |
| `${EDUCATION_TOPIC}` | `education.topics[last_topic_index].topic` | ETFs |
| `${EDUCATION_URL}` | `education.topics[last_topic_index].url` | investopedia.com/... |

---

## Notes

- After sending, increment `education.last_topic_index` (wrap around if at end)
- Archive sent message to `history/YYYY-MM-DD-update.md`
- Update `account.last_updated`
- Add entry to `history` array
