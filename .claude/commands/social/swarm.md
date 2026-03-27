---
name: social:swarm
description: Run a social operation with parallel agents for high-volume work
argument-hint: "<operation> <workspace-name>"
---
<objective>
Run a social media operation using parallel agent swarms. Orchestrator splits work into batches, spawns agents, collects results, presents unified output for approval.

Operation and workspace: $ARGUMENTS

Available operations:
- `batch-create` -- Create multiple content pieces in parallel (e.g., week of posts, carousel batch)
- `repurpose` -- Repurpose a single piece into multiple formats/platforms in parallel
- `engagement` -- Process engagement queue in parallel (comments, DMs, mentions across platforms)
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>

## Phase 1: Initialize

1. Display mode header: `<< SOCIAL:OS // SWARM >>`
2. Parse operation type from $ARGUMENTS
3. Load workspace context -- all source-of-truth files
4. Display workspace header

## Phase 2: Scope the work

Based on operation type, identify the full workload:

**batch-create:**
- Load CALENDAR.md for upcoming gaps and planned content
- Load content/briefs/ for pending briefs
- Count total pieces to create
- Display: "{N} content pieces to create across {batches} batches"

**repurpose:**
- Load source content from content/approved/ or content/published/
- Identify all target formats and platforms
- Count total transformations
- Display: "{N} transformations to create across {batches} batches"

**engagement:**
- Pull unprocessed comments, DMs, mentions from all platforms
- Count total items
- Display: "{N} engagement items to process across {batches} batches"

## Phase 3: Spawn agents

Split workload into batches (5-10 items per batch).

For each batch, spawn an agent with:
```
Agent(
  subagent_type="general-purpose",
  prompt="
    You are a SOCIAL:OS swarm agent. Your job is to {operation} for a batch of items.

    RULES:
    - Draft only -- never publish, post, or send anything
    - Validate every output against brand, voice, and platform specs
    - Return structured results -- one entry per item
    - Flag anything uncertain as [~] for manual review

    WORKSPACE CONTEXT -- read these files:
    - BRAND: {workspace}/BRAND.md
    - AUDIENCE: {workspace}/AUDIENCE.md
    - PILLARS: {workspace}/PILLARS.md
    - TOV: {workspace}/TOV.md
    - CHANNELS: {workspace}/CHANNELS.md
    {additional context files as needed}

    YOUR BATCH:
    {batch data -- briefs, source content, or engagement items}

    OUTPUT FORMAT:
    Return a markdown table or structured list with one entry per item.
    Include: item description, draft content, platform, validation result, flags.
  ",
  description="{operation} batch {N}"
)
```

Display spawning indicator:
```
  << SOCIAL:OS // SWARM >>

  Spawning {N} agents...
    [~] Agent 1: items 1-8
    [~] Agent 2: items 9-16
    [~] Agent 3: items 17-24
```

Run agents in parallel where independent. Wait for all to complete.

## Phase 4: Collect and merge results

As each agent completes, update display:
```
    [x] Agent 1: items 1-8     -- 8 drafts, 0 flags
    [x] Agent 2: items 9-16    -- 7 drafts, 1 flag
    [~] Agent 3: items 17-24
```

When all complete, merge results into a unified output.

Display swarm results summary:
```
  +-- SWARM RESULTS ----------------------------------------+
  |                                                          |
  |  Agents spawned:  {N}                                    |
  |  Items processed: {total}                                |
  |  Drafts ready:    {count}                                |
  |  Flagged:         {count} (need manual review)           |
  |  Errors:          {count}                                |
  |                                                          |
  +----------------------------------------------------------+
```

## Phase 5: Review and approve

1. Show flagged items first -- these need manual review
2. Then show 3 sample drafts from the clean batch for spot-checking
3. After user reviews samples:

```
  >> Options:
     1. Review all {N} drafts one by one
     2. Approve all clean drafts, review flagged only
     3. Export all drafts to content/drafts/ for offline review
```

Option 2 is only available after user has reviewed the 3 samples.

## Phase 6: Save and log

- Save all approved drafts to content/approved/
- Save flagged items to content/drafts/ for manual follow-up
- Log swarm run in logs/decisions.md:
  - Date, operation type, agent count, batch sizes
  - Approval method (individual / batch after sample review)
  - Any flags or issues

Display next action:
```
================================================================

  Swarm complete: {N} items processed, {N} approved

  >> Next: /social:schedule {ws} (schedule approved content)
     Also: /social:review {ws} (review flagged items)

================================================================
```

</process>
