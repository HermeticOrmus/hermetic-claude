# Midjourney Automation Setup Guide

## Overview
This automation allows you to send Midjourney prompts from Telegram and receive generated images automatically.

## Architecture
```
Telegram → n8n Cloud → Discord (Midjourney) → Monitor → Download → Store → Send Back
```

## Prerequisites

### 1. Midjourney Discord Setup
You need access to a Discord server with Midjourney bot. If you don't have one:
- Subscribe to Midjourney: https://midjourney.com/account
- Join their Discord or add bot to your server
- Get the channel ID where Midjourney bot responds

### 2. Get Midjourney Channel ID
1. In Discord, enable Developer Mode:
   - User Settings → Advanced → Developer Mode (toggle ON)
2. Right-click on the channel where you use Midjourney
3. Click "Copy Channel ID"
4. Save this ID - you'll need it for the workflow

### 3. Discord Bot Permissions
Your Discord bot (token: `MTQzMDIyMjQyNzQ3NTkzOTQ5NA...`) needs:
- Read Messages
- Send Messages
- Attach Files
- Read Message History

In the Midjourney channel specifically.

## Workflow Components

### Node 1: Telegram Trigger
- Listens for messages to your bot
- Filters for `/mj` command

### Node 2: Filter /mj Commands
- Only processes messages starting with `/mj `
- Example: `/mj a futuristic cityscape at sunset`

### Node 3: Parse Midjourney Prompt
- Extracts the prompt text
- Creates unique job ID
- Tracks metadata

### Node 4: Send to Midjourney Bot
- Sends `/imagine prompt: <your prompt>` to Discord
- Uses Discord API
- Posts in your Midjourney channel

### Node 5: Send Confirmation
- Notifies you on Telegram: "🎨 Generating..."
- Sets expectations (30-60 seconds)

### Node 6: Wait for Midjourney
- Waits 60 seconds for generation
- Midjourney typically takes 30-60 seconds

### Node 7: Check Discord for Image
- Polls Discord channel for recent messages
- Looks for Midjourney bot's response

### Node 8: Extract Image URL
- Finds the generated image attachment
- Extracts CDN URL

### Node 9: Download Image
- Downloads image from Discord CDN
- Prepares for storage

### Node 10: Save to Hermetic Folder
- Stores in: `C:\Users\ormus\.hermetic\midjourney-images\`
- Filename: `mj_{timestamp}_{userId}.png`

### Node 11: Send Image to Telegram
- Sends image back to you
- Includes original prompt
- Shows save location

## Installation Steps

### Step 1: Import Workflow to n8n
```bash
# Upload midjourney-workflow.json to n8n cloud
# Navigate to: https://ormus.app.n8n.cloud
# Click "Import from File"
# Select: C:\Users\ormus\.hermetic\tools\midjourney-workflow.json
```

### Step 2: Configure Environment Variables
In n8n workflow settings, add:
- `MIDJOURNEY_CHANNEL_ID`: Your Discord channel ID
- `DISCORD_BOT_TOKEN`: Set in environment variables (never commit tokens to git)

### Step 3: Activate Workflow
- In n8n, toggle workflow to "Active"
- Test by sending: `/mj test image of a sunset`

## Usage

### Basic Usage
```
/mj <your prompt here>
```

### Examples
```
/mj a mystical forest with glowing mushrooms, fantasy art style
/mj minimalist logo design for a tech startup, vector art
/mj photorealistic portrait of a wise wizard, 8k, detailed
/mj cyberpunk street scene at night, neon lights, rain
```

### Advanced Prompts
```
/mj a serene lake at dawn --ar 16:9 --v 6
/mj abstract geometric pattern --tile --chaos 50
/mj steampunk airship --stylize 750 --quality 2
```

## Workflow Flow

1. **You**: Send `/mj <prompt>` in Telegram
2. **n8n**: Receives message, parses prompt
3. **Discord**: Sends `/imagine` to Midjourney bot
4. **Telegram**: You get "🎨 Generating..." confirmation
5. **Wait**: 60 seconds
6. **Discord**: Checks for Midjourney's response
7. **Download**: Gets image from Discord CDN
8. **Store**: Saves to `.hermetic/midjourney-images/`
9. **Telegram**: You receive the image!

## Troubleshooting

### "Image not found yet"
- Midjourney may take longer than 60 seconds
- Complex prompts take more time
- Check Discord channel manually

### "Permission denied"
- Ensure bot has access to Midjourney channel
- Check bot permissions in Discord server

### "Invalid prompt"
- Midjourney has content policy
- Avoid banned words
- Keep prompts appropriate

## Storage

All generated images are stored in:
```
C:\Users\ormus\.hermetic\midjourney-images\
```

Organized by:
- Job ID (timestamp + user ID)
- Original prompt saved in metadata

## Future Enhancements

1. **Retry Logic**: Auto-retry if image not ready
2. **Quality Variations**: U1, U2, U3, U4 upscales
3. **Style Variations**: V1, V2, V3, V4 variants
4. **Batch Generation**: Multiple prompts at once
5. **Gallery Management**: Browse past generations
6. **Prompt Templates**: Pre-made style templates
7. **Auto-posting**: Direct to Instagram/TikTok

## Cost Tracking

Midjourney charges by generation:
- Basic: ~$10/month (200 images)
- Standard: ~$30/month (unlimited relaxed)
- Pro: ~$60/month (unlimited fast)

Track your usage in Midjourney account.

## Security Notes

- Discord bot token is sensitive - keep private
- Channel ID is not sensitive
- Images stored locally (not cloud)
- Telegram messages are ephemeral

## Hermetic Alignment

This automation follows Gold Hat principles:
✅ **Empowerment**: Direct control over AI image generation
✅ **Transparency**: Clear workflow, visible process
✅ **Autonomy**: Your data, your images, your storage
✅ **Privacy**: Local storage, no third-party analytics
✅ **Efficiency**: Eliminate manual Discord switching

---

**Sacred Technology at Work** 🔱

*As above (your vision), so below (the generated image)*
