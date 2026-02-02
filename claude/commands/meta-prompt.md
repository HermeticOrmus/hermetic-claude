---
description: Recursively improve LLM outputs through quality-driven iteration with automatic complexity routing
args:
  - name: task
    description: The task to execute with meta-prompting (required)
  - name: options
    description: Optional flags --iterations=N --threshold=0.X --skill=name --verbose
---

# /meta-prompt

Execute task with recursive meta-prompting: $ARGUMENTS

**Source**: `~/.local/meta-prompting-framework`

## What This Does

1. **Analyze** task complexity (routes to optimal strategy)
2. **Generate** initial solution with complexity-appropriate prompt
3. **Extract** context from output (patterns, constraints, successes)
4. **Assess** quality (0.0-1.0 score)
5. **Iterate** if quality < threshold (feeds context into next prompt)
6. **Return** best result with full metadata

## Your Task

### Step 1: Parse Arguments

Extract from $ARGUMENTS:
- **task**: The main task description (required)
- **--iterations=N**: Max improvement cycles (default: 3)
- **--threshold=0.X**: Stop when quality reaches this (default: 0.90)
- **--skill=name**: Role/persona (default: auto-detect)
- **--verbose**: Show iteration progress

### Step 2: Analyze Complexity

Determine task complexity score (0.0 - 1.0):

**SIMPLE (< 0.3)**:
- Single-step operations
- Clear input/output
- No ambiguity
- Examples: "check if prime", "reverse string"

**MEDIUM (0.3 - 0.7)**:
- Multi-step operations
- Some design decisions
- Multiple valid approaches
- Examples: "validate email", "priority queue"

**COMPLEX (> 0.7)**:
- Architectural decisions
- Multiple subsystems
- Trade-offs required
- Examples: "distributed rate limiter", "auth system"

### Step 3: Select Strategy

Based on complexity:

**Simple → direct_execution**:
```
You are {skill}.

Task: {task}

Execute with clear, step-by-step reasoning:
1. Understand the requirements
2. Implement the solution
3. Verify correctness

Provide complete, working code.
```

**Medium → multi_approach_synthesis**:
```
You are {skill} using meta-cognitive strategies.

Task: {task}

Approach:
1. Generate 2-3 different approaches
2. Evaluate strengths and weaknesses of each
3. Choose the optimal approach with justification
4. Implement the chosen solution
5. Include edge case handling and tests
```

**Complex → autonomous_evolution**:
```
You are {skill} performing autonomous problem evolution.

Task: {task}

Strategy:
1. Generate 3+ architectural hypotheses
2. For each hypothesis, identify:
   - Strengths and use cases
   - Weaknesses and failure modes
   - Key tradeoffs
3. Test hypotheses against constraints
4. Synthesize optimal solution from best elements
5. Document decision rationale
```

### Step 4: Execute Iteration Loop

For each iteration:

1. **Generate** solution using strategy prompt
2. **Extract Context**:
   - Patterns identified
   - Constraints discovered
   - What worked well
   - What needs improvement
3. **Assess Quality** (0.0 - 1.0):
   - Correctness
   - Completeness
   - Error handling
   - Documentation
   - Test coverage
4. **Decide**:
   - If quality >= threshold: STOP
   - If iterations >= max: STOP
   - Else: Continue with enhanced prompt

### Step 5: Report Results

Output format:
```
# Result: {task_summary}

## Metadata
<result>
<iterations>{N}</iterations>
<final_quality>{0.XX}</final_quality>
<improvement>+{delta} from iteration 1</improvement>
<complexity score="{0.XX}" level="{SIMPLE|MEDIUM|COMPLEX}"/>
<strategy>{strategy_name}</strategy>
<stopped_reason>{threshold_met|max_iterations}</stopped_reason>
</result>

## Solution

{final_code_or_output}

## Quality Assessment

<quality_assessment score="{0.XX}">
<strengths>
  - {strength_1}
  - {strength_2}
</strengths>
<improvements_made>
  - {improvement_1}
  - {improvement_2}
</improvements_made>
</quality_assessment>
```

## Examples

### Example 1: Simple Task
```bash
/meta-prompt "Write function to check if number is prime"
```
Output: 1 iteration, quality 0.88, direct_execution strategy

### Example 2: Medium Task with Options
```bash
/meta-prompt "Create email validator with domain verification" --threshold=0.95 --skill=python-programmer
```
Output: 2-3 iterations, multi_approach_synthesis

### Example 3: Complex Task
```bash
/meta-prompt "Design API rate limiter for 100k req/s with distributed consistency" --iterations=5
```
Output: 3-5 iterations, autonomous_evolution

## When to Use

**Use when:**
- Task requires multiple refinements
- Quality is critical (production code)
- Want systematic, measurable improvement
- First attempt was insufficient

**Don't use when:**
- Simple one-off tasks
- Exploratory brainstorming
- Time-critical (adds latency)
- Task is ambiguous (clarify first with /speckit.clarify)

## Integration

Chain with other commands:
```bash
# Clarify then iterate
/speckit.clarify "requirements" && /meta-prompt "task"

# Iterate then review
/meta-prompt "task" && /dev:review
```

---
**Source**: `~/.local/meta-prompting-framework`
**Version**: 1.0.0
