# Send WhatsApp Message

**Purpose**: Send WhatsApp messages via Periskope API
**Trigger**: "send to whatsapp", "whatsapp me", "message me"

---

## Channels

| Channel | JID | Use |
|---------|-----|-----|
| Ormus-Claude | `120363422067085557@g.us` | Claude Code notifications (default) |
| Ormus-Caduceus | `120363405416830074@g.us` | Digests, system status |
| Ormus-Voice | `120363403241573439@g.us` | Voice transcriptions |
| Ormus-Ideas | `120363423555346792@g.us` | Quick idea capture |

---

## How to Send (Periskope API)

```bash
curl -s -X POST "https://api.periskope.app/v1/messages/send" \
  -H "Authorization: Bearer $PERISKOPE_API_KEY" \
  -H "x-phone: 50769815142" \
  -H "Content-Type: application/json" \
  -d '{
    "chat_id": "120363422067085557@g.us",
    "message": "Your message here"
  }'
```

### API Key Location
```
~/.claude/mcp.json → mcpServers.periskope-whatsapp.env.PERISKOPE_API_KEY
```

### Required Headers
- `Authorization: Bearer <API_KEY>`
- `x-phone: 50769815142` (Ormus's phone)
- `Content-Type: application/json`

### Required Body
- `chat_id`: Group JID or phone@s.whatsapp.net
- `message`: Text content

---

## Quick Send Function

```bash
# Add to ~/.bashrc for easy access
send_whatsapp() {
  local chat_id="${1:-120363422067085557@g.us}"
  local message="$2"

  curl -s -X POST "https://api.periskope.app/v1/messages/send" \
    -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCIgOiAiNjNkMTlkZGQtZWQ2Mi00YzUxLTg4YWYtOTllODI0YTBhZjIwIiwgInJvbGUiIDogImFwaSIsICJ0eXBlIiA6ICJhcGkiLCAibmFtZSIgOiAiUE9QX09TIEFQSSBLRVkiLCAiZXhwIiA6IDIwODMzNTI1ODgsICJpYXQiIDogMTc2NzgxOTc4OCwgInN1YiIgOiAiY2I2MTNhYjYtNTQ2MS00YmNjLTkyZGUtYjJjZjcwNjg1YzA4IiwgImlzcyIgOiAicGVyaXNrb3BlLmFwcCIsICJtZXRhZGF0YSIgOiB7fX0.TOyL4EslQyqov0zC0GHBEngQTKPvygLzEJkwxoCyAv0" \
    -H "x-phone: 50769815142" \
    -H "Content-Type: application/json" \
    -d "{\"chat_id\": \"$chat_id\", \"message\": \"$message\"}"
}
```

---

## Response Format

Success:
```json
{
  "queue_id": "uuid",
  "queue_position": 0,
  "unique_id": "message_id",
  "hint": "Track via /queue/jobs?queue_id=..."
}
```

---

## Message Guidelines

- Max 4096 characters
- Sparingly use: ✅ 🔍 🚀 ⚠️ 📊 🎯
- Structure with bullets
- Include next steps
- Functional/direct tone

---

*Default: Ormus-Claude group*
