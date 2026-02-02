#!/bin/bash
# Periskope WhatsApp Direct Send Script
# Usage: ./send-wa.sh "chat_id" "message"

PERISKOPE_API_KEY="${PERISKOPE_API_KEY:-eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCIgOiAiMTIyNTJkNTQtNGE4MC00NzJlLTk1NjYtNmZkN2RiNGY0N2IxIiwgInJvbGUiIDogImFwaSIsICJ0eXBlIiA6ICJhcGkiLCAibmFtZSIgOiAicG9wX29zLW1jcCIsICJleHAiIDogMjA3OTA2MjI2NCwgImlhdCIgOiAxNzYzNTI5NDY0LCAic3ViIiA6ICJjYjYxM2FiNi01NDYxLTRiY2MtOTJkZS1iMmNmNzA2ODVjMDgiLCAiaXNzIiA6ICJwZXJpc2tvcGUuYXBwIiwgIm1ldGFkYXRhIiA6IHt9fQ.OTnNNPe30dTfmqP-SefwH4wF0L0Q6zb7RlW73sREPGg}"
PERISKOPE_PHONE="${PERISKOPE_PHONE:-50769815142}"

CHAT_ID="$1"
MESSAGE="$2"

if [ -z "$CHAT_ID" ] || [ -z "$MESSAGE" ]; then
    echo "Usage: $0 <chat_id> <message>"
    echo "Example: $0 '120363422067085557@g.us' 'Hello from script'"
    exit 1
fi

curl -s -X POST "https://api.periskope.app/message/send" \
    -H "authorization: $PERISKOPE_API_KEY" \
    -H "x-phone: $PERISKOPE_PHONE" \
    -H "Content-Type: application/json" \
    -d "{\"chat_id\": \"$CHAT_ID\", \"body\": \"$MESSAGE\"}"

echo ""
