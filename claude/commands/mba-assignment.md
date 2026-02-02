---
description: Create and submit ADEN MBA assignment with Ormus branding
---

# MBA Assignment Skill

Create a branded Word document for ADEN MBA assignments and upload to the platform.

## Instructions

### 1. Understand Requirements
- Navigate to ADEN platform activity page
- Download activity instructions
- Identify deliverables and reflection questions

### 2. Gather Content
- Read relevant module transcripts
- Extract key concepts applied
- Collect project/case data

### 3. Create Branded Document

**Branding Elements:**
- Logo: `~/Downloads/Ormus_The_Messenger_Of_The_Fire_Of_The_Heart.png`
- Font: Garamond
- Gold: #B88F4E (headers, accents)
- Navy: #1a1a2e (titles)

**Document Structure:**
```python
from docx import Document
from docx.shared import Pt, Inches, RGBColor

LOGO_GOLD = RGBColor(0xB8, 0x8F, 0x4E)
NAVY = RGBColor(0x1a, 0x1a, 0x2e)

# 1. Ormus logo header (centered, 1.2 inches)
# 2. Title in Navy, 18pt bold
# 3. Subtitle in Gold, 14pt
# 4. Content sections with Gold H2 headers
# 5. Footer with "Diego Bodart | MBA ADEN | [Date]"
```

### 4. Diego's Voice (~10% human mistakes)
- Missing tildes: alla, fisico, proximos
- Informal phrasing: "casi 60" instead of "59.48"
- First person: "me dice", "invertiria"
- Direct questions, punchy sentences
- First principles explanations

### 5. Save and Upload
```bash
# Save to assignments folder
~/projects/01-ACTIVE/aden-mba/assignments/Actividad-[MODULE]-DIEGO.docx

# Upload via Playwright
1. Navigate to activity page
2. Click "Selecciona un archivo"
3. browser_file_upload with document path
4. Click "Enviar actividad"
```

### 6. Track Progress
Update `PROGRESS.md` with:
- Assignment submitted date
- Key insights from the work
- Any questions for follow-up

## Files Reference
- Session notes: `~/projects/01-ACTIVE/aden-mba/sessions/`
- Workflows: `~/projects/01-ACTIVE/aden-mba/workflows/`
- Assignments: `~/projects/01-ACTIVE/aden-mba/assignments/`

## Example Usage
```
User: /mba-assignment
Claude: I'll help create your MBA assignment. What module is this for? Let me check the activity requirements on ADEN...
```
