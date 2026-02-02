# WhatsApp Direct API (Periskope) - Fallback Method

When the MCP `mcp__periskope-whatsapp__periskope_send_message` tool isn't exposed, use the Periskope REST API directly.

---

## Why This Exists

The WhatsApp MCP server may be configured but tools not exposed to Claude Code sessions. This direct API approach bypasses MCP.

---

## API Details

**Endpoint:** `https://api.periskope.app/v1/messages/send`
**Method:** POST

**Required Headers:**
```
Authorization: Bearer <PERISKOPE_API_KEY>
Content-Type: application/json; charset=utf-8
x-phone: <PERISKOPE_PHONE_ID>
```

**Body:**
```json
{
  "chat_id": "<recipient>@g.us or <recipient>@c.us",
  "message": "Your message here"
}
```

---

## Credentials Location

From `~/.config/claude/claude_desktop_config.json`:
- `PERISKOPE_API_KEY`: JWT token
- `PERISKOPE_PHONE_ID`: phone-xxxxxxxx

---

## Encoding Fix (Windows)

Windows curl corrupts UTF-8 inline. **Solution:** Use JSON file with Unicode escapes.

### Common Emoji Escapes
| Emoji | Unicode Escape |
|-------|----------------|
| ✨ | `\u2728` |
| 📅 | `\ud83d\udcc5` |
| 👤 | `\ud83d\udc64` |
| 🐛 | `\ud83d\udc1b` |
| 🎨 | `\ud83c\udfa8` |
| 🚀 | `\ud83d\ude80` |
| 💪 | `\ud83d\udcaa` |
| 🔍 | `\ud83d\udd0d` |
| 📝 | `\ud83d\udcdd` |
| ✅ | `\u2705` |
| ⚠️ | `\u26a0\ufe0f` |
| 📊 | `\ud83d\udcca` |
| 🎯 | `\ud83c\udfaf` |
| ¡ | `\u00a1` |

---

## Template: Client Update (Spanish)

```bash
cat > /tmp/wa_update.json << 'EOFMSG'
{
  "chat_id": "120363422067085557@g.us",
  "message": "\u2728 PROJECT NAME - Version \u2728\n\n\u00a1La app esta evolucionando!\n\n\ud83d\udcc5 FEATURE 1\nDescription for the team.\n\n\ud83d\udc64 FEATURE 2\nDescription for the team.\n\n\ud83d\udc1b BUGS CORREGIDOS\n- Bug fix 1\n- Bug fix 2\n\n\ud83c\udfa8 UI/UX\nDescription of visual improvements.\n\n\ud83d\ude80 PROXIMO:\n- Next feature 1\n- Next feature 2\n\n\u00a1Seguimos construyendo! \ud83d\udcaa"
}
EOFMSG

curl -s -X POST "https://api.periskope.app/v1/messages/send" \
  -H "Authorization: Bearer $PERISKOPE_API_KEY" \
  -H "Content-Type: application/json; charset=utf-8" \
  -H "x-phone: $PERISKOPE_PHONE_ID" \
  -d @/tmp/wa_update.json
```

---

## Channel IDs

| Channel | ID | Use |
|---------|-----|-----|
| Ormus-Claude | `120363422067085557@g.us` | Claude Code updates |
| Ormus-Caduceus | `120363405416830074@g.us` | Digests, system status |
| Ormus-Voice | `120363403241573439@g.us` | Voice transcriptions |
| Ormus-Ideas | `120363423555346792@g.us` | Quick idea capture |

---

## Message Style (Client Updates)

1. **Exciting opener** with emojis
2. **Section per feature** with relevant emoji
3. **Bug section** with 🐛
4. **UI/UX section** if visual changes
5. **PROXIMO** section for roadmap visibility
6. **Encouraging closer**

**Tone:** Inclusive (not doctor-specific), celebratory, forward-looking

---

## Response Format

Success:
```json
{
  "queue_id": "uuid",
  "queue_position": 0,
  "unique_id": "message-id",
  "hint": "track via /queue/jobs?queue_id=..."
}
```

---

*Last Updated: 2026-01-22*
