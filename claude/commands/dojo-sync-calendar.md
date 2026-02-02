---
description: Sync Google Calendar events to Hermetic Ormus Dojo dashboard
---

# Dojo Calendar Sync

Sync upcoming events from Google Calendar to the Dojo dashboard.

## Instructions

1. Fetch events from Google Calendar for the next 14 days using the Google Calendar MCP:
   - Use `mcp__google-calendar__list-events` with calendarId="primary"
   - Set timeMin to today, timeMax to 14 days from now
   - Use timeZone="America/Panama"

2. Transform the events to the Dojo format:
   ```json
   {
     "id": "google_event_id",
     "summary": "Event title",
     "description": "Event description",
     "start": "2025-01-01T10:00:00-05:00",
     "end": "2025-01-01T11:00:00-05:00",
     "isAllDay": false,
     "location": "optional location",
     "hangoutLink": "optional meet link"
   }
   ```

3. Report the synced events to the user with a summary

## Usage Examples

```
/dojo-sync-calendar
```

This will:
- Fetch your upcoming Google Calendar events
- Display a summary of what will be synced
- Events with "study", "leetcode", "exam", or "boot.dev" in the title get color-coded in the dashboard
