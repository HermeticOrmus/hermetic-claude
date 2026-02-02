---
name: caduceus-auto-save
description: Automatically detect and save person-related information (names, roles, contact info, relationships, organizations) to Core Memory (Caduceus). Triggers when user mentions people with descriptive details like job titles, phone numbers, emails, responsibilities, or relationships to other people or organizations.
---

# Caduceus Auto-Save

Automatically detect when person-related information is mentioned and save it to Core Memory for future reference.

## When This Activates

This skill activates when you detect ANY of these patterns in user messages:

- A person's name with their role/title ("Sarah is the CEO", "my manager John")
- Contact information (email, phone, WhatsApp, LinkedIn)
- Organizational relationships ("works at", "in charge of", "leads the")
- Interpersonal relationships ("reports to", "works with", "is married to")
- Professional context ("specializes in", "expert in", "handles")

## Extraction Schema

When person information is detected, extract:

| Field | Description | Example |
|-------|-------------|---------|
| **name** | Full name | "Isa Derteano", "Dr. James Chen" |
| **role** | Job title/position | "Head of Marketing", "CTO" |
| **organization** | Company/team | "ALQVEMENTS", "Google Cloud Team" |
| **contact** | Email, phone, WhatsApp, social | "+34 722 108 179", "isa@company.com" |
| **relationships** | Connections to others | "reports to Ormus", "manages design team" |
| **responsibilities** | What they handle | "oversees all MANA marketing" |
| **expertise** | Skills/domains | "brand strategy", "Python", "UX design" |
| **notes** | Context, how you met | "Met at conference", "Friend of Diego" |

## How to Save

Use the Core Memory tools:

1. **Initialize session** (if not already done):
   ```
   mcp__core-memory__initialize_conversation_session
   ```

2. **Save the person info**:
   ```
   mcp__core-memory__memory_ingest
   ```

Format the memory entry as:

```
PERSON: [Full Name]
Role: [Title] at [Organization]
Contact: [email/phone/WhatsApp]
Relationships: [connections to other people]
Responsibilities: [what they handle]
Expertise: [skills/domains]
Notes: [context, how met, relevant background]
Source: [conversation where this was learned]
```

## Behavior Rules

1. **Always confirm** after saving: "Saved [Name] to Caduceus: [brief summary]"

2. **Update existing entries** - If person already exists, add new info rather than duplicate

3. **Bi-directional relationships** - If "A reports to B", also note that "B manages A"

4. **Preserve context** - Include when/how this information was learned

5. **Don't assume** - Only save explicitly stated information, don't infer

## Examples

### Example 1: Role Assignment

**User says**: "Isa Derteano is the person in charge of marketing for ALQVEMENTS"

**Extract & Save**:
```
PERSON: Isa Derteano (Isabel Derteano)
Role: Head of Marketing at ALQVEMENTS
Responsibilities: Oversees marketing for all ALQVEMENTS brands including MANA Supplements
Contact: WhatsApp +34 722 108 179
```

**Confirm**: "Saved Isa Derteano to Caduceus: Head of Marketing at ALQVEMENTS"

---

### Example 2: Contact Info

**User says**: "My accountant is Maria Lopez, her email is maria@accounting.com and she handles all ALQVEMENTS finances"

**Extract & Save**:
```
PERSON: Maria Lopez
Role: Accountant
Organization: External / ALQVEMENTS
Contact: maria@accounting.com
Responsibilities: Handles all ALQVEMENTS finances
Relationships: Works with Ormus on financial matters
```

---

### Example 3: Team Structure

**User says**: "Diego manages the dev team. His direct reports are Ana (frontend), Carlos (backend), and Lucia (design)"

**Extract & Save** (multiple entries):

Entry 1:
```
PERSON: Diego
Role: Dev Team Manager
Relationships: Manages Ana, Carlos, Lucia
```

Entry 2-4: Ana, Carlos, Lucia with "Reports to Diego" relationship

---

### Example 4: Professional Network

**User says**: "I met Alex at the conference, he's a VC at Sequoia focusing on wellness startups. Might be good for MANA funding."

**Extract & Save**:
```
PERSON: Alex
Role: Venture Capitalist at Sequoia
Expertise: Wellness startups, funding
Notes: Met at conference. Potential investor for MANA.
```

## What NOT to Save

- Casual mentions without descriptive info ("I talked to John today")
- Public figures unless personally connected
- Speculative relationships ("I think she might work at...")
- Sensitive personal info not voluntarily shared

## Output Format

After saving, always confirm:

> Saved to Caduceus: **[Name]** - [Role] at [Organization]
> [Brief summary of key info saved]
