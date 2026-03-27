---
name: social:competitor
description: Competitive analysis -- compare metrics, strategy, and tactics
argument-hint: "<workspace-name> [competitor-name]"
---
<objective>
Run competitive analysis. Compare metrics, content strategy, engagement tactics, and posting patterns. Surface actionable insights.

Workspace and competitor: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // COMPETITOR INTEL >>`
2. Load workspace context -- COMPETITORS.md, CHANNELS.md, PILLARS.md, LEARNINGS.md
3. Load competitor profiles from COMPETITORS.md

## Competitor setup
4. If no competitors configured or new competitor specified:
   - Ask for competitor social handles (per platform)
   - Save to COMPETITORS.md

5. If specific competitor in $ARGUMENTS, focus on that one. Otherwise, compare all tracked competitors.

## Analysis
6. For each competitor, analyze:

**Profile analysis:**
- Follower count per platform and growth trend
- Bio and positioning
- Link strategy (link in bio, linktree, direct)
- Posting frequency per platform

**Content strategy:**
- Content pillars they focus on
- Format mix (text, carousel, video, thread)
- Posting frequency and timing patterns
- Content themes and recurring series
- Hashtag strategy

**Engagement analysis:**
- Average engagement rate per platform
- Comment-to-like ratio (indicates comment quality)
- Top performing content (what gets the most engagement)
- Worst performing content (what falls flat)
- Response time to comments
- Community building approach

**Growth tactics:**
- Collaboration patterns (who they partner with)
- Paid promotion signals
- Cross-platform strategy
- Newsletter/community integration

7. Display competitive analysis:
```
+==============================================================+
|  COMPETITOR ANALYSIS -- {Workspace}                            |
+==============================================================+

  Comparison table
  +----------------------------------------------------------+
  | Metric          | You      | {Comp 1}  | {Comp 2}        |
  |-----------------|----------|-----------|-----------------|
  | LI Followers    | {N}      | {N}       | {N}             |
  | LI Eng Rate     | {N}%     | {N}%      | {N}%            |
  | TW Followers    | {N}      | {N}       | {N}             |
  | TW Eng Rate     | {N}%     | {N}%      | {N}%            |
  | Posts/week       | {N}      | {N}       | {N}             |
  | Avg comments    | {N}      | {N}       | {N}             |
  +----------------------------------------------------------+

  What they do well
    >> {competitor}: {specific tactic and why it works}
    >> {competitor}: {specific tactic and why it works}

  What they miss
    >> {competitor}: {gap or weakness you can exploit}
    >> {competitor}: {gap or weakness you can exploit}

  Content gaps (topics they don't cover that you can own)
    >> {topic/angle} -- neither competitor covers this
    >> {topic/angle} -- weak coverage, opportunity to dominate

  Steal-worthy tactics (adapt, don't copy)
    >> {tactic} -- why it works: {explanation}
    >> {tactic} -- how to adapt: {suggestion}

================================================================
```

8. Generate strategic recommendations:
```
  Recommendations
    1. {actionable recommendation based on analysis}
    2. {actionable recommendation based on analysis}
    3. {actionable recommendation based on analysis}
```

9. Save analysis to analytics/competitor-{date}.md
10. Update COMPETITORS.md with latest data
11. Update LEARNINGS.md with competitive insights

12. Suggest next action:
```
================================================================

  >> Next: /social:brief {ws} (create content for identified gaps)
     Also: /social:trends {ws} (combine with trend data)

================================================================
```
</process>
