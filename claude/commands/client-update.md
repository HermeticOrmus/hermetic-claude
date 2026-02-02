# /client-update

> Send professional team updates in Spanish via WhatsApp

---

## Usage

```
/client-update dev "completed sprint 12"
/client-update comercial "new feature ready for demo"
/client-update legal "privacy controls implemented"
```

---

## Teams

| Team | Audience | Focus |
|------|----------|-------|
| `dev` | Technical team | What was built, how it works |
| `comercial` | Sales team | What they can sell/demo |
| `legal` | Compliance | What protections exist |

---

## Structure

```
📋 *Actualización [Proyecto] - [Fecha]*

[Saludo]

*¿Qué se hizo?*
→ [Logro 1]
→ [Logro 2]

*¿Por qué importa?*
• [Beneficio 1]
• [Beneficio 2]

*Próximos pasos*
[Acción siguiente]

—
Diego
```

---

## Style Guide

See: `~/.hermetic/communication/team-updates-style-guide.md`

---

## Defaults

- **Language**: Spanish
- **Tone**: Professional but warm
- **Length**: Max ~200 words
- **Always include**: Date, what, why, next steps
