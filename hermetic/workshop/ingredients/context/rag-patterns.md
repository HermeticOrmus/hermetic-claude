# RAG Patterns (Retrieval-Augmented Generation)

> "Retrieval-Augmented Generation lets models draw on external,
> verifiable sources in an attempt to tame their tendency to hallucinate."
> — Vibe Coding CH_03

---

## What RAG Does

```
User Query
    │
    ▼
Convert to embedding (vector)
    │
    ▼
Search vector database for similar chunks
    │
    ▼
Retrieve top-K relevant chunks
    │
    ▼
Augment prompt with retrieved context
    │
    ▼
LLM generates grounded response
```

---

## When to Use RAG

| Scenario | Use RAG? | Why |
|----------|----------|-----|
| Large knowledge base | Yes | Can't fit in context window |
| Frequently updated content | Yes | Embeddings update independently |
| Need citations/sources | Yes | Can trace back to chunks |
| Simple Q&A | Maybe | Few-shot might suffice |
| Creative generation | No | External context constrains creativity |

---

## Core Components

### 1. Chunking Strategy

| Strategy | Chunk Size | Overlap | Use Case |
|----------|------------|---------|----------|
| Fixed size | 512 tokens | 50 tokens | General purpose |
| Semantic | Varies | By paragraph | Documentation |
| Code-aware | By function | Include signatures | Codebases |

**Key insight**: Chunk boundaries matter. Don't split mid-sentence or mid-function.

### 2. Embedding Models

| Model | Dimensions | Speed | Quality |
|-------|------------|-------|---------|
| text-embedding-3-small | 1536 | Fast | Good |
| text-embedding-3-large | 3072 | Medium | Better |
| voyage-code-2 | 1536 | Medium | Best for code |

### 3. Vector Databases

| Database | Type | Best For |
|----------|------|----------|
| Qdrant | Self-hosted/Cloud | Production, filtering |
| Pinecone | Cloud | Managed, simple |
| ChromaDB | Embedded | Prototyping, local |
| pgvector | PostgreSQL extension | Existing Postgres stack |

### 4. Retrieval Parameters

```python
results = vector_db.search(
    query_embedding=embed(query),
    top_k=5,              # Number of chunks
    score_threshold=0.7,  # Minimum similarity
    filter={"source": "docs"}  # Metadata filtering
)
```

---

## Augmentation Pattern

```python
def build_augmented_prompt(query: str, retrieved_chunks: list) -> str:
    context = "\n\n".join([
        f"[Source: {chunk.metadata['source']}]\n{chunk.text}"
        for chunk in retrieved_chunks
    ])

    return f"""Use the following context to answer the question.
If the context doesn't contain the answer, say so.

CONTEXT:
{context}

QUESTION: {query}

ANSWER:"""
```

---

## Common Pitfalls

| Pitfall | Symptom | Fix |
|---------|---------|-----|
| Chunks too small | Fragmented context | Increase chunk size |
| Chunks too large | Irrelevant content retrieved | Decrease chunk size |
| No overlap | Context lost at boundaries | Add 10-20% overlap |
| Wrong embedding model | Poor retrieval for code | Use code-specific embeddings |
| No reranking | Top-K not optimal | Add reranker (Cohere, cross-encoder) |

---

## Advanced Patterns

### Hybrid Search
Combine vector similarity + keyword (BM25):
```
final_score = α * vector_score + (1-α) * bm25_score
```

### Query Expansion
Rephrase query multiple ways, retrieve for each, deduplicate.

### Hierarchical RAG
1. First retrieve document summaries
2. Then retrieve specific chunks from top documents

### Self-RAG
Let the LLM decide when it needs retrieval vs. internal knowledge.

---

## Integration with MCP

```
MCP Server for RAG
    │
    ├── Tool: search_knowledge_base(query, top_k)
    ├── Tool: get_document(doc_id)
    └── Resource: knowledge_base://stats
```

See: `~/.mcp/` for MCP server configurations
