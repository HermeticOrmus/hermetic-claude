# 12-Factor Agents

> Production principles for LLM-powered software

**Source**: https://github.com/humanlayer/12-factor-agents
**Discovered**: 2024-12-29 via Manu (@cairo)

---

## Philosophy

Most production AI agents are "mostly just software" with strategic LLM steps. Success comes from controlling fundamentals - prompts, context, state - not framework features.

> "Fools ignore complexity. Pragmatists suffer it. Some can avoid it. Geniuses remove it."
> — Alan J. Perlis

---

## The 12 Factors

### 1. Natural Language to Tool Calls
Convert user intent into structured function calls. The LLM translates, your code executes.

### 2. Own Your Prompts
Maintain direct control over prompt engineering. Don't let frameworks abstract this away.

### 3. Own Your Context Window
Manage context deliberately. You decide what goes in, not the framework.

### 4. Tools as Structured Outputs
Treat tool calls as formatted outputs, not special constructs. JSON in, action out.

### 5. Unify Execution State
Align agent state with business logic state. One source of truth.

### 6. Launch/Pause/Resume APIs
Enable simple control of agent execution. Agents should be interruptible.

### 7. Contact Humans via Tools
Use tool calls to request human intervention. Escalation is a tool, not an exception.

### 8. Own Your Control Flow
Write explicit logic. Don't rely on framework routing magic.

### 9. Compact Errors
Fit error information into the context window efficiently. Errors are context.

### 10. Small, Focused Agents
Keep agents specialized with narrow responsibilities. Unix philosophy applies.

### 11. Trigger from Anywhere
Meet users on their preferred platforms. Agents should be platform-agnostic.

### 12. Stateless Reducer Pattern
Design agents as functional transformations of state. `(state, action) => newState`

---

## Application to Categorical Meta-Prompting

| Factor | CMP Mapping |
|--------|-------------|
| Own Your Prompts | Core principle - prompts are first-class |
| Own Your Context | Comonad W extracts relevant context |
| Structured Outputs | Functor F transforms to structured prompts |
| Stateless Reducer | Monad M chains transformations |
| Quality Control | [0,1]-enriched quality tracking |

---

## Anti-Patterns to Avoid

| Anti-Pattern | Why It Fails |
|--------------|--------------|
| Framework lock-in | Can't debug what you don't control |
| Implicit routing | Unpredictable behavior |
| Monolithic agents | Too many responsibilities |
| Hope-based prompting | No guarantees |
| Hidden state | Debugging nightmare |

---

## Key Insight

> "The best agents are the simplest ones that solve the problem."

Build incrementally. Start with explicit code. Add LLM steps where they add value. Don't start with a framework and work backward.

---

## Workshop Integration

| Pattern | Workshop Tool |
|---------|---------------|
| Test explicit control flow | `/experiment` |
| Document framework tradeoffs | `/tradeoff` |
| Capture working patterns | `/recipe` |
| Log framework limitations | `/boundary` |

---

## Visual Style Note

Manu noted this repo's **minimal, clean documentation style** as a reference for categorical-meta-prompting docs. Numbered principles, clear sections, no clutter.

---

*Added to Alchemist's Workshop: 2024-12-29*
