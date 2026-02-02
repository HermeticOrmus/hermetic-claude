---
description: Schedule WhatsApp messages for future delivery using Linux `at` command and Periskope API. Use when user wants to set reminders, schedule notifications, or send delayed messages.
user_invocable: true
---

# Schedule WhatsApp Message

Schedule WhatsApp messages to be sent at a future time.

## Usage

```
/schedule-whatsapp [time] [message]
```

**Examples:**
- `/schedule-whatsapp 7:30pm tomorrow "Reminder: Work on Chaos Wheel site"`
- `/schedule-whatsapp 9am monday "Weekly standup in 30 minutes"`
- `/schedule-whatsapp 2025-12-25 10:00 "Merry Christmas!"`

## How It Works

1. **Parse time** - Convert user's natural language time to `at` format
2. **Create job** - Schedule via Linux `at` command
3. **Execute** - At scheduled time, calls Periskope API directly
4. **Confirm** - Returns job ID for tracking

## Channels

| Channel | Chat ID | Purpose |
|---------|---------|---------|
| Ormus-Claude | `120363422067085557@g.us` | Default - session updates |
| Ormus-Caduceus | `120363405416830074@g.us` | Digests, system status |
| Ormus-Voice | `120363403241573439@g.us` | Voice transcriptions |
| Ormus-Ideas | `120363423555346792@g.us` | Quick idea capture |
| Ormus Direct | `50769815142@c.us` | Personal direct message |

## Implementation

### Schedule a message:
```bash
# Schedule for specific time
echo "~/.claude/skills/schedule-whatsapp/send-wa.sh 'CHAT_ID' 'MESSAGE'" | at TIME

# Examples:
echo "~/.claude/skills/schedule-whatsapp/send-wa.sh '50769815142@c.us' 'Reminder!'" | at 7:30pm tomorrow
echo "~/.claude/skills/schedule-whatsapp/send-wa.sh '120363422067085557@g.us' 'Check in'" | at 9:00 Dec 25
```

### Check scheduled jobs:
```bash
atq                    # List all scheduled jobs
at -c JOB_NUMBER       # View job details
atrm JOB_NUMBER        # Remove a scheduled job
```

### Time formats for `at`:
- `7:30pm` - Today at 7:30 PM
- `7:30pm tomorrow` - Tomorrow at 7:30 PM
- `9:00 Dec 25` - December 25th at 9:00 AM
- `now + 2 hours` - 2 hours from now
- `noon` - Today at 12:00 PM
- `midnight` - Tonight at 12:00 AM

## Direct API Call (for reference)

```bash
curl -X POST "https://api.periskope.app/message/send" \
    -H "authorization: $PERISKOPE_API_KEY" \
    -H "x-phone: $PERISKOPE_PHONE" \
    -H "Content-Type: application/json" \
    -d '{"chat_id": "CHAT_ID", "body": "Message"}'
```

## Requirements

- Linux `at` daemon running (`sudo systemctl enable --now atd`)
- Periskope API key (stored in send-wa.sh)
- Network access at scheduled time

---

*v1.0.0 | Created: 2025-12-20*
