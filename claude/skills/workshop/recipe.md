# /recipe - Save a Proven Recipe

## Invocation

```
/recipe [name]
```

## Philosophy

Only recipes that have been **tested and proven** belong here.
A recipe earns its place when:
- Tested in real conditions (not just theory)
- Produces consistent results
- Trade-offs are documented
- Failure modes are known

## Procedure

### 1. Generate Recipe ID
Format: `RCP-###` (sequential)

### 2. Gather Information

Ask the user (or infer from context):

**Related Experiment**: Link to EXP-### that proved this

**Purpose**: What transmutation does this recipe perform?

**Ingredients**:
- Model(s)
- Context strategy
- Prompting technique
- Tools/APIs

**Procedure**: Step-by-step instructions

**Expected Output**: What gold emerges

**Known Limitations**: When this recipe fails or underperforms

**Trade-Offs Accepted**: What costs come with this recipe

**Reliability**: High | Medium | Conditional

### 3. Create Recipe File

Create: `~/.hermetic/workshop/recipes/RCP-###-{slug}.md`

```markdown
# [RCP-###] {Recipe Name}

**Proven**: {today}
**Origin**: {EXP-###}
**Reliability**: {High | Medium | Conditional}

## Purpose
{what this recipe does}

## Ingredients
- Model: {model}
- Context: {context_strategy}
- Technique: {prompting_technique}
- Tools: {tools}

## Procedure

1. {step 1}
2. {step 2}
3. {step 3}
...

## Expected Output
{what gold emerges}

## Known Limitations
{when this fails or underperforms}

## Trade-Offs Accepted
{costs that come with this recipe}

## Usage Example
```
{example invocation or code}
```
```

### 4. Update Experiment (if linked)

If this came from an experiment, update that experiment's status:
- Mark as "Recipe Proven"
- Link to the recipe ID

### 5. Update Recipes README

Add entry to `~/.hermetic/workshop/recipes/README.md` in the table.

### 6. Confirm

Tell the user:
- Recipe ID and file created
- Location saved
- This pattern is now documented for future use
