# Parlant

> Behavioral control for LLM agents - beyond hope-based prompting

**Source**: https://github.com/emcie-co/parlant
**Language**: Python
**Discovered**: 2024-12-29 via Manu (@cairo)

---

## Philosophy

> "Instead of hoping your LLM will follow instructions, Parlant ensures it."

Traditional approach: Write system prompt, hope LLM complies.
Parlant approach: Define behavioral rules, engine enforces them.

---

## Core Concept: Guideline Matching Engine

Rather than embedding all instructions in prompts, Parlant:

1. Stores behavioral guidelines separately
2. Matches relevant guidelines to conversation context
3. Injects only applicable rules dynamically
4. Verifies compliance before responding

```
Conversation → Context Analysis → Guideline Match → Prompt Assembly → LLM → Verification → Response
                                       ↓
                               Behavioral Rules DB
```

---

## Key Features

### Behavioral Control

| Feature | Description |
|---------|-------------|
| Dynamic Guidelines | Rules applied based on context |
| Conversational Journeys | Step-by-step user flows |
| Built-in Guardrails | Hallucination prevention |

### Integration

| Feature | Description |
|---------|-------------|
| Tool Integration | APIs, databases, services |
| Domain Terminology | Custom vocabulary |
| Canned Responses | Consistent templates |

### Transparency

| Feature | Description |
|---------|-------------|
| Decision Explainability | Why agent chose X |
| Conversation Analytics | Pattern monitoring |
| Guideline Visibility | Which rules matched |

---

## Use Cases

### Regulated Industries
- **Finance**: Compliance-checked responses
- **Healthcare**: HIPAA-aware interactions
- **Legal**: Liability-conscious agents

### Enterprise
- **Customer Service**: Consistent brand voice
- **Sales**: Qualification workflows
- **Support**: Escalation protocols

---

## Comparison with Hope-Based Prompting

| Aspect | System Prompt | Parlant |
|--------|---------------|---------|
| Rule Location | Embedded in prompt | External database |
| Context Awareness | Static | Dynamic matching |
| Compliance | Hope | Verification |
| Debugging | Prompt archaeology | Clear rule traces |
| Scalability | Prompt bloat | Modular rules |

---

## Integration with Categorical Meta-Prompting

| CMP Component | Parlant Mapping |
|---------------|-----------------|
| Functor F | Guideline matching as transformation |
| Monad M | Iterative rule refinement |
| Comonad W | Context extraction for matching |
| Quality [0,1] | Compliance scoring |

### Potential Synthesis

```
Task → [F: Route] → [Parlant: Enforce] → [M: Refine] → Output
                          ↓
                   Behavioral Rules
```

---

## Key Patterns

### Guideline Definition
```python
# Natural language behavioral rules
guidelines = [
    "When user asks about pricing, always mention the free tier first",
    "Never make claims about features not in the current release",
    "If unsure about technical details, offer to connect with engineering",
]
```

### Journey Definition
```python
# Step-by-step flows
onboarding_journey = Journey(
    steps=[
        "Greet and ask about use case",
        "Recommend appropriate tier",
        "Offer demo scheduling",
        "Provide documentation links",
    ]
)
```

---

## Workshop Integration

| Need | Parlant Solution |
|------|------------------|
| Consistent agent behavior | Guideline matching |
| Compliance requirements | Verifiable rules |
| Debug agent decisions | Explainability layer |
| Scale behavioral rules | External rule store |

---

## Trade-offs

| Benefit | Cost |
|---------|------|
| Deterministic behavior | Additional infrastructure |
| Clear debugging | Learning curve |
| Compliance-ready | Rule maintenance |
| Modular rules | Matching latency |

---

*Added to Alchemist's Workshop: 2024-12-29*
