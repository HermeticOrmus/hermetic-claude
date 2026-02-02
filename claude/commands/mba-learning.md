---
description: Create learning materials from MBA module transcripts
---

# MBA Learning Materials Skill

Transform module video transcripts into structured learning materials with notes, flashcards, and quizzes.

## Instructions

### 1. Read All Transcripts
```bash
# List transcripts for module
ls ~/projects/01-ACTIVE/aden-mba/modules/XX-module-name/transcripts/

# Read each transcript
cat transcripts/*.txt
```

### 2. Extract Key Concepts
- Main theories and frameworks
- Formulas and calculations
- Real-world examples mentioned
- Key terminology

### 3. Create Learning Files

**File Structure:**
```
modules/XX-module/learning/
├── day1-topic.md      # First concept cluster
├── day2-topic.md      # Second concept cluster
└── day3-integracion.md # Integration + case study
```

**Each File Contains:**

```markdown
# Day X: Topic Name

## NOTAS
### Subtopic - "What question does this answer?"

**Concept Name**
- Formula: [if applicable]
- Significado: [plain language explanation]
- Ejemplo: [real-world application]

---

## FLASHCARDS

**Card 1**
Q: [Question]
A: [Concise answer]

**Card 2**
Q: [Formula or definition question]
A: [Answer with explanation]

[8-10 cards per day]

---

## QUIZ

1. [Question]
   a) Option
   b) Option
   c) Option
   d) Option

[5-8 questions per day]

---

## RESPUESTAS QUIZ

1. **b)** - [Explanation of why this is correct]
```

### 4. Integration Day (Final Day)
Include:
- Summary table of all concepts
- Connections between topics
- Real company case study (Microsoft, etc.)
- 10-question comprehensive quiz
- Practical application questions

### 5. Add to Glossary
Send key terms to Ormus-Teacher WhatsApp for spaced repetition:
```
TERM: [Spanish term]
EN: [English translation]
DEF: [Brief definition]
FORMULA: [If applicable]
EXAMPLE: [Real-world example]
```

## Quality Checklist
- [ ] All transcripts processed
- [ ] Key formulas captured
- [ ] Examples from videos included
- [ ] Quiz answers have explanations
- [ ] Integration connects all concepts
- [ ] Terms ready for glossary

## Example Usage
```
User: /mba-learning
Claude: I'll create learning materials for your MBA module. Which module should I process?

User: Module 5 - Formulacion y Evaluacion de Proyectos
Claude: Reading transcripts... [creates day1, day2, day3 files]
```
