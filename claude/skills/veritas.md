# Veritas: Local News Verification System

> "Finding the heartfelt truth beyond potential malice and hidden agendas"

## Invocation

```
/veritas <topic or news story>
```

**Examples:**
- `/veritas Epstein files release`
- `/veritas Boeing whistleblower deaths`
- `/veritas Ukraine peace negotiations 2026`

---

## Purpose

Veritas analyzes news stories to separate fact from spin by:
1. Gathering sources across the political spectrum
2. Extracting and classifying discrete claims
3. Profiling sources and their biases
4. Mapping players and their interests
5. Identifying asymmetric treatment
6. Synthesizing the most probable truth

---

## Analysis Pipeline

When `/veritas <topic>` is invoked, execute these 8 stages:

### STAGE 1: Source Gathering

**Goal:** Collect diverse coverage of the topic.

1. **Generate search queries** to capture multiple angles:
   ```
   Base: "<topic> [current month year]"
   Left-leaning: site:cnn.com OR site:msnbc.com OR site:nytimes.com
   Right-leaning: site:foxnews.com OR site:dailywire.com OR site:nypost.com
   Center/wire: site:apnews.com OR site:reuters.com
   Alternative: site:theintercept.com OR site:reason.com
   ```

2. **Use WebSearch** to find recent articles from each category

3. **Use WebFetch** to retrieve full article content from top results

4. **Look for primary sources** (official documents, press releases, statements)

5. **Store gathered articles** for analysis:
   ```json
   {
     "url": "...",
     "title": "...",
     "source": "...",
     "date": "...",
     "content": "..."
   }
   ```

**Aim for:** 2-3 articles from each lean category (left/center/right)

---

### STAGE 2: Source Profiling

**Goal:** Understand each source's characteristics and tendencies.

1. **Check `~/.veritas/sources/`** for existing profiles

2. **For known sources**, load profile and note:
   - Political lean
   - Ownership
   - Historical accuracy
   - Known blind spots

3. **For unknown sources**, create provisional profile:
   ```json
   {
     "id": "source-name",
     "name": "Source Name",
     "url_pattern": "source\\.com",
     "lean": "unknown",
     "owner": "unknown",
     "accuracy_score": 0.5,
     "notes": "Provisional profile - needs enrichment"
   }
   ```

4. **Save new/updated profiles** to `~/.veritas/sources/`

---

### STAGE 3: Claim Extraction

**Goal:** Extract discrete, analyzable claims from each article.

For each article, identify:

1. **FACTS** - Verifiable statements
   - "Documents were released on [date]"
   - "[Person] served as [role] from [date] to [date]"

2. **ALLEGATIONS** - Accusations not yet proven
   - "[Person] allegedly [action]"
   - "Sources claim [statement]"

3. **INTERPRETATIONS** - Inferences from facts
   - "This suggests [conclusion]"
   - "Critics say this means [interpretation]"

4. **OPINIONS** - Editorial statements
   - "[Person] believes [statement]"
   - "It would be [judgment] if [condition]"

5. **PREDICTIONS** - Future-oriented claims
   - "This will likely lead to [outcome]"

For each claim, capture:
```json
{
  "text": "The claim itself",
  "type": "fact|allegation|interpretation|opinion|prediction",
  "source_id": "which source",
  "evidence_cited": "what evidence is referenced",
  "players_mentioned": ["player1", "player2"],
  "framing_tone": "neutral|favorable|unfavorable|sensational"
}
```

---

### STAGE 4: Player Mapping

**Goal:** Profile everyone involved and their interests.

1. **Identify all players** mentioned in claims

2. **Check `~/.veritas/players/`** for existing profiles

3. **For each player**, document:
   ```json
   {
     "id": "player-id",
     "name": "Full Name",
     "aliases": ["Other names"],
     "type": "individual|organization|government|media",
     "category": "Politician|CEO|Activist|etc.",
     "political_alignment": "Party/ideology",
     "known_affiliations": ["Organizations"],
     "power_domains": ["Where they have influence"],
     "historical_honesty": 0.0-1.0,
     "known_interests": ["What they gain/protect"],
     "known_vulnerabilities": ["What could harm them"],
     "allies": ["player-ids"],
     "adversaries": ["player-ids"]
   }
   ```

4. **Analyze interests relative to THIS story:**
   - What does each player gain if the story is believed?
   - What do they lose?
   - What narrative serves their interests?

5. **Save new/updated profiles** to `~/.veritas/players/`

---

### STAGE 5: Cross-Reference & Verification

**Goal:** Determine what's actually true.

1. **Cluster similar claims** across sources

2. **For each claim cluster**, determine:
   - How many sources make this claim?
   - Do any sources contradict it?
   - Is primary source available?
   - Is the evidence verifiable?

3. **Assign verification status:**

   | Status | Criteria |
   |--------|----------|
   | **VERIFIED** | Primary source confirms + multiple sources agree |
   | **LIKELY_TRUE** | Multiple independent sources, consistent, but no primary source |
   | **UNVERIFIED** | Single source, no corroboration, no contradicting evidence |
   | **DISPUTED** | Sources actively contradict each other |
   | **LIKELY_FALSE** | Contradicted by primary source or strong consensus |
   | **DEBUNKED** | Definitively disproven with evidence |

4. **Build claim matrix** showing verification across sources

---

### STAGE 6: Bias Analysis

**Goal:** Identify where spin distorts reality.

1. **For each player**, compare treatment across sources:
   - Which sources are favorable? Unfavorable?
   - Is the treatment proportional to evidence?
   - What language is used? (loaded words, softening, etc.)

2. **Identify asymmetries** - same evidence, different treatment:
   ```
   EXAMPLE:
   - Player A invokes Fifth Amendment → "exercises constitutional rights"
   - Player B invokes Fifth Amendment → "refuses to answer, raising questions"
   Same action, different framing = bias asymmetry
   ```

3. **Note emphasis patterns per source:**
   - What does each source lead with?
   - What's buried in paragraph 15?
   - What's completely omitted?
   - Headline vs. content discrepancies?

4. **Document bias asymmetries:**
   ```json
   {
     "description": "Brief description of the asymmetry",
     "player_a": "Who gets soft treatment",
     "player_b": "Who gets hard treatment",
     "evidence_a": "What player A did",
     "evidence_b": "What player B did",
     "treatment_a": "How sources frame A",
     "treatment_b": "How sources frame B",
     "sources_exhibiting": ["source1", "source2"]
   }
   ```

---

### STAGE 7: Truth Synthesis

**Goal:** Determine what a wise, unaligned observer would conclude.

1. **Weight claims by reliability:**
   - Verified claims: high weight
   - Corroborated claims: medium weight
   - Single-source allegations: low weight

2. **Identify consensus reality:**
   - What do ALL sources agree on?
   - These are likely true regardless of spin

3. **Generate "wise observer" perspective:**
   - Strip away partisan framing
   - Consider what ALL parties might be hiding
   - Note where evidence is strongest vs. weakest

4. **Generate watch list:**
   ```
   - [ ] Corrections expected (overreaching claims)
   - [ ] New info likely (story still developing)
   - [ ] Pattern emerging (connect to broader context)
   - [ ] Key dates (court dates, deadlines, events)
   - [ ] Player responses (who hasn't responded yet)
   ```

5. **Identify unanswered questions:**
   - What isn't being asked that should be?
   - What gaps exist in the coverage?
   - What would change the analysis if answered?

---

### STAGE 8: Report Generation

**Goal:** Produce actionable output.

1. **Calculate confidence score:**
   ```
   Source Diversity: Were multiple perspectives gathered?
   Claim Verification: How many claims are verifiable?
   Cross-Source Consistency: Do sources agree on basics?
   Primary Source Access: Can we see original documents?
   ```

2. **Generate report using template** at `~/.veritas/templates/report.md`

3. **Save analysis** to `~/.veritas/analyses/YYYY-MM-DD-topic-slug.json`

4. **Output report** to terminal

---

## Output Format

```
VERITAS REPORT: [Topic]
═══════════════════════════════════════════════════

EXECUTIVE SUMMARY
What actually happened, stripped of spin.

CONFIDENCE SCORE: [0-100] + breakdown
├── Source diversity: X/100
├── Claim verification: X/100
├── Consistency across sources: X/100
└── Primary source availability: X/100

CLAIM MATRIX
┌─────────────────────┬──────────┬─────────────┬────────────┐
│ Claim               │ Status   │ Sources     │ Evidence   │
├─────────────────────┼──────────┼─────────────┼────────────┤
│ [Claim text]        │ VERIFIED │ All         │ [Evidence] │
└─────────────────────┴──────────┴─────────────┴────────────┘

PLAYER MAP
[For each significant player]
┌─────────────────────────────────────────────────────────┐
│ PLAYER: [Name]                                          │
├─────────────────────────────────────────────────────────┤
│ Position:    What they officially claim                 │
│ Interest:    What they gain/lose from outcomes          │
│ Pattern:     Historical behavior in similar situations  │
│ Credibility: Track record (with examples)               │
│ Treatment:   How sources are framing them               │
└─────────────────────────────────────────────────────────┘

SOURCE ANALYSIS
[For each source]
┌─────────────────────────────────────────────────────────┐
│ SOURCE: [Name]                                          │
├─────────────────────────────────────────────────────────┤
│ Lean:        Left / Center / Right                      │
│ Emphasis:    What they highlighted                      │
│ Minimized:   What they downplayed                       │
│ Framing:     Tone toward various players                │
└─────────────────────────────────────────────────────────┘

BIAS ASYMMETRIES
Where equivalent evidence gets unequal treatment.

WATCH LIST
What to monitor as story develops.

TRUTH SYNTHESIS
Best current understanding with uncertainties noted.

UNANSWERED QUESTIONS
What isn't being asked that should be.
```

---

## Data Storage

### Directory Structure
```
~/.veritas/
├── config.json              # Settings
├── sources/
│   └── [source-id].json     # Source profiles
├── players/
│   └── [player-id].json     # Player profiles
├── analyses/
│   └── YYYY-MM-DD-slug.json # Past analyses
└── templates/
    └── report.md            # Report template
```

### Learning Over Time

Each analysis enriches the knowledge base:
- New sources get profiles created
- New players get profiles created
- Existing profiles get updated based on observed behavior
- Historical patterns inform future analysis

---

## Example Invocation

```
User: /veritas Epstein files release

Veritas:
1. Searches for coverage across political spectrum
2. Fetches articles from CNN, Fox, AP, etc.
3. Extracts claims about documents, players, allegations
4. Profiles Trump, Clinton, Musk, Lutnick, etc.
5. Cross-references claims across sources
6. Identifies asymmetric treatment
7. Synthesizes truth
8. Outputs report with confidence score
```

---

## Implementation Notes

### Tool Usage

- **WebSearch**: Multi-query to ensure source diversity
- **WebFetch**: Retrieve full article content
- **Read/Write**: Manage local knowledge base
- **Claude Analysis**: All extraction and synthesis

### Quality Considerations

- Always note the DOJ-type caveats (unverified tips, etc.)
- Distinguish between what documents CONTAIN vs. what's PROVEN
- Track which claims have primary source backing
- Flag when sources are citing each other vs. independent reporting

### Bias Awareness

- Left sources may soft-pedal Democratic figures
- Right sources may soft-pedal Republican figures
- Center sources may false-balance or minimize
- All sources may have ownership conflicts
- Anonymous sources require extra scrutiny

---

*Veritas v1.0 | "As above, so below. As the code, so the consciousness."*
