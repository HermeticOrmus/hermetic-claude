# FinOps for LLMs

> "No metrics, no mercy: log tokens, retries, and tier-switches
> or brace for surprise invoices. Model cost can stockpile."
> — Vibe Coding CH_08

---

## The Problem

LLM costs are invisible until the invoice arrives:
- Token usage varies wildly by prompt
- Retries multiply costs silently
- Model tier switches (GPT-4 → GPT-3.5) affect both cost AND quality
- No visibility = no control

---

## The Protocol

### 1. Track Everything

```python
# Minimum viable tracking
log_entry = {
    "timestamp": now(),
    "model": model_name,
    "input_tokens": usage.prompt_tokens,
    "output_tokens": usage.completion_tokens,
    "total_tokens": usage.total_tokens,
    "cost_usd": calculate_cost(model, usage),
    "latency_ms": elapsed,
    "retry_count": retries,
    "service": service_name,
    "user_id": user_id  # if applicable
}
```

### 2. Set Alerts

| Metric | Alert Threshold | Action |
|--------|-----------------|--------|
| Daily cost | > $X | Review usage patterns |
| Cost per request | > $Y | Check prompt efficiency |
| Retry rate | > 10% | Check rate limits, errors |
| Latency p99 | > Z ms | Consider model tier |

### 3. Cost Per Model (Reference)

| Model | Input (per 1M tokens) | Output (per 1M tokens) |
|-------|----------------------|------------------------|
| GPT-4 Turbo | $10.00 | $30.00 |
| GPT-4o | $2.50 | $10.00 |
| GPT-3.5 Turbo | $0.50 | $1.50 |
| Claude 3.5 Sonnet | $3.00 | $15.00 |
| Claude 3 Haiku | $0.25 | $1.25 |

*Prices change - verify current rates*

---

## Optimization Strategies

### Prompt Efficiency
- Shorter system prompts = fewer input tokens
- Structured output (JSON) often more token-efficient
- Few-shot examples: balance quality vs token cost

### Model Tiering
```
Simple tasks → Haiku/GPT-3.5 (cheap, fast)
Complex reasoning → Sonnet/GPT-4o (balanced)
Critical decisions → Opus/GPT-4 (expensive, thorough)
```

### Caching
- Cache common completions
- Cache embeddings (don't re-embed same content)
- Use prompt caching where available (Anthropic)

### Batching
- Batch similar requests
- Use async where possible
- Reduce round-trips

---

## Implementation Checklist

- [ ] Token counting on every request
- [ ] Cost calculation logged
- [ ] Daily/weekly cost reports
- [ ] Alerts configured
- [ ] Model tier strategy documented
- [ ] Caching implemented where applicable

---

## Tools

| Purpose | Tool |
|---------|------|
| Token counting | tiktoken (OpenAI), anthropic-tokenizer |
| Cost tracking | Custom logging, LangSmith, Helicone |
| Observability | OpenTelemetry, Datadog, custom dashboards |

---

## Trade-Off

| Choice | Pro | Con |
|--------|-----|-----|
| Always GPT-4 | Best quality | Highest cost |
| Always GPT-3.5 | Lowest cost | Quality gaps |
| Dynamic tiering | Optimized | Complexity |

**Recommended**: Start with dynamic tiering based on task complexity.
