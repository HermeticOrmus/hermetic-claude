# Contribution Confirmation Template

**Use:** Confirm receipt of new contribution
**Tone:** Professional, appreciative

---

## Template

```
Hola Salvador!

Confirmo que recibi tu aporte de ${CONTRIBUTION_AMOUNT} USD.

**Tu nuevo valor total:** ${NEW_VALUE} USD

Gracias por seguir invirtiendo! Te aviso cuando tenga el proximo update.
```

---

## Variables

| Variable | Source | Example |
|----------|--------|---------|
| `${CONTRIBUTION_AMOUNT}` | Amount received | 100 |
| `${NEW_VALUE}` | `account.current_value_usd` after adding contribution | 576.04 |

---

## Notes

- Add entry to `history` array with `event: contribution`
- Update `account.current_value_usd`
- Archive to `history/YYYY-MM-DD-contribution.md`
