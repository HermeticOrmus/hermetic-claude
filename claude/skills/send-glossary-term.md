---
name: send-glossary-term
description: Send a cybersecurity/tech glossary term to Ormus via WhatsApp in the standardized learning format
author: Hermetic System
version: 1.0.0
---

# Send Glossary Term Skill

Send learning terms via WhatsApp in Ormus's preferred format for retention and project association.

## Format Structure

Each glossary term MUST follow this exact structure:

```
📖 TERM: [Term Name]

💡 ELI5:
[Simple analogy explanation - relate to everyday concepts, anime, gaming, or 90s pop culture when possible]

🔗 PROJECT USES:
• Hermetic Academy: [How this applies]
• n8n Automation: [How this applies]
• Pentest Clinic: [How this applies]
• Tesla SWE Prep: [How this applies]
• TryHackMe Path: [Current context]

⌨️ COMMANDS/TOOLS:
```
[code block with practical commands]
```
```

## Rules

1. **Term**: Clear, concise name
2. **ELI5**: Use analogies from:
   - Anime (DBZ, Naruto, Digimon)
   - Gaming (Kingdom Hearts, Hades, roguelikes)
   - 90s culture (Matrix, PlayStation)
   - Everyday life scenarios
3. **Project Uses**: Connect to at least 3 of Ormus's active projects
4. **Commands**: Real, copy-paste ready commands

## Example Message

```
📖 TERM: ARP Poisoning

💡 ELI5:
Imagine you're at a party and someone keeps telling everyone "Hey, I'm actually the host - give all messages for him to me instead." That's ARP poisoning - convincing the network you're someone else to intercept their traffic. Like Naruto's Transformation Jutsu, but for network cards.

🔗 PROJECT USES:
• Hermetic Academy: Teach MITM concepts in network security module
• n8n Automation: Alert workflow when ARP anomalies detected
• Pentest Clinic: Core technique for credential harvesting assessments
• Tesla SWE Prep: Understand vehicle network security (CAN bus parallels)
• TryHackMe Path: Wireshark Traffic Analysis Task 3

⌨️ COMMANDS/TOOLS:
```bash
# Detect ARP poisoning in Wireshark
arp.duplicate-address-detected

# Perform ARP spoof (authorized testing only)
sudo arpspoof -i eth0 -t victim_ip gateway_ip

# Check ARP table for anomalies
arp -a | grep -i "duplicate"
```
```

## Batch Sending

When sending multiple terms from a room/module:

1. Send terms one at a time (avoid wall of text)
2. Wait 2-3 seconds between messages
3. Group related terms together
4. End with a summary count: "📚 X/Y terms sent from [Room Name]"

## Integration

Use with WhatsApp MCP:
```
mcp__whatsapp__periskope_send_message
phone: 50769815142@c.us
message: [formatted glossary term]
```

## Tags for Organization

Include relevant tags at end of each term:
```
🏷️ Tags: #wireshark #mitm #layer2 #credentials
```
