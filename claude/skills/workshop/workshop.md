# /workshop - Show Workshop Status

## Invocation

```
/workshop
```

## Procedure

### 1. Read Current State

Read and summarize:
- `~/.hermetic/workshop/experiments/EXPERIMENT_LOG.md` - Active experiments
- `~/.hermetic/workshop/observations/BOUNDARIES.md` - Recent boundaries
- `~/.hermetic/workshop/observations/TRADE_OFFS.md` - Recent trade-offs
- `~/.hermetic/workshop/recipes/` - Count of proven recipes

### 2. Display Status

```
╔═══════════════════════════════════════════════════════════════╗
║                   ALCHEMIST'S WORKSHOP                        ║
╠═══════════════════════════════════════════════════════════════╣
║  ACTIVE EXPERIMENTS                                           ║
║  ─────────────────                                            ║
║  {list active experiments or "None active"}                   ║
║                                                               ║
║  RECENT BOUNDARIES                                            ║
║  ─────────────────                                            ║
║  {last 3 boundaries discovered}                               ║
║                                                               ║
║  PROVEN RECIPES                                               ║
║  ──────────────                                               ║
║  {count} recipes in library                                   ║
║                                                               ║
║  QUICK ACTIONS                                                ║
║  ─────────────                                                ║
║  /experiment [name]  - Start new experiment                   ║
║  /boundary [name]    - Log discovered boundary                ║
║  /recipe [name]      - Save proven recipe                     ║
║  /tradeoff [name]    - Log trade-off decision                 ║
╚═══════════════════════════════════════════════════════════════╝
```

### 3. Show Protocol Reminder

```
THE PROTOCOL (before AI-assisted work):
1. Intention   → What am I transmuting?
2. Constraints → Data? Traffic? Memory? Latency?
3. Hypothesis  → What do I expect?
4. Risks       → What trade-offs am I accepting?
```

### 4. Show Golden Rules

```
GOLDEN RULES:
• Specify constraints     → prevents 10x over-engineering
• Measure before optimize → prevents wasted complexity
• Use proven libraries    → prevents 10x maintenance cost
• Document trade-offs     → prevents decision amnesia
• Record failures         → prevents repeated mistakes
```

## Integration with Other Tools

The workshop integrates with:
- Meta-Prompts: `~/.hermetic/prompts/META_PROMPTS.md`
- Categorical Meta-Prompting: `~/.claude/skills/categorical-meta-prompting/`
- MCP Servers: `~/.mcp/`
- Agents: `~/.claude/agents/`

## File Locations

| Purpose | Location |
|---------|----------|
| Start experiment | `experiments/EXPERIMENT_LOG.md` |
| Log boundary | `observations/BOUNDARIES.md` |
| Log trade-off | `observations/TRADE_OFFS.md` |
| Save recipe | `recipes/` |
| Ingredients | `ingredients/` |
| Quick reference | `QUICK_REFERENCE.md` |
