---
name: social:debrief
description: Campaign or period debrief with forward-feed into strategy
argument-hint: "<workspace-name> [period|campaign-name]"
---
<objective>
Run a full performance debrief for a campaign or time period. Cross-reference metrics with content. Feed learnings forward into strategy, pillars, and voice.

Workspace and scope: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // DEBRIEF >>`
2. Load workspace context -- all files
3. Load analytics data for the specified period
4. Load A/B test results from tests/AB-TESTS.md

## Scope
4. Determine debrief scope:
   - **Weekly** -- last 7 days
   - **Monthly** -- last 30 days
   - **Quarterly** -- last 90 days
   - **Campaign** -- specific campaign or content series

## Analysis
5. Cross-reference all data:

**Content performance:**
- Total posts published vs. planned
- Engagement rate by format, pillar, platform
- Top 5 and bottom 5 performing posts
- What the top posts have in common
- What the bottom posts have in common

**Growth metrics:**
- Follower growth per platform
- Reach and impressions trends
- Profile visit and click trends
- New audience segments attracted

**Engagement quality:**
- Comment sentiment (positive/neutral/negative ratio)
- Conversation depth (replies to comments)
- Saves and shares (high-intent signals)
- DM volume and themes

**Strategy adherence:**
- Pillar balance vs. plan
- Posting frequency vs. targets
- Calendar adherence (posted on time vs. missed)
- Voice consistency

6. Display debrief:
```
+==============================================================+
|  DEBRIEF -- {Workspace} -- {period}                            |
+==============================================================+

  Summary
    Posts published: {N} (planned: {N})
    Avg engagement:  {rate}% (prev period: {rate}%)
    Follower growth: {+N} ({growth}%)
    Top format:      {format} ({avg eng}%)
    Top pillar:      {pillar} ({avg eng}%)

  What worked
    >> {insight 1} -- evidence: {data}
    >> {insight 2} -- evidence: {data}
    >> {insight 3} -- evidence: {data}

  What didn't work
    >> {insight 1} -- evidence: {data}
    >> {insight 2} -- evidence: {data}

  Surprises
    >> {unexpected finding} -- investigate further

  Carry-forwards (apply to next period)
    1. {specific action} -- source: {what worked}
    2. {specific action} -- source: {what worked}
    3. {stop doing this} -- source: {what didn't work}

================================================================
```

## Forward-feed
7. Propose updates to strategy files:

**LEARNINGS.md:**
- Append new insights to relevant sections
- Tag each with source, confidence, and date
- Don't duplicate existing learnings -- update confidence if confirmed again

**PILLARS.md:**
- Adjust pillar emphasis based on performance
- Suggest new pillars if a topic is organically emerging
- Suggest retiring underperforming pillars

**TOV.md:**
- Update voice notes based on what resonated
- Add new "do" and "don't" entries

**CHANNELS.md:**
- Update posting frequency targets
- Adjust optimal posting times
- Revise platform strategy

**ROADMAP.md:**
- Add new content ideas from insights
- Generate to-dos from learnings
- Update goals based on trajectory

8. Display each proposed change as a suggestion block:
```
  +-- SUGGESTED UPDATE: LEARNINGS.md ----------------------+
  | Add: "Carousel hooks with questions get 2.1x more      |
  | engagement than statement hooks (confirmed, high        |
  | confidence, Q1 2026 debrief)"                           |
  |                                                         |
  | >> Apply? (y/n)                                        |
  +---------------------------------------------------------+
```

9. Wait for approval on each proposed change

10. Save debrief to reports/debrief-{date}.md
11. Log in logs/decisions.md

12. Suggest next action:
```
================================================================

  Debrief complete. {N} learnings captured, {N} updates applied.

  >> Next: /social:calendar {ws} (plan next period with new insights)
     Also: /social:optimize {ws} (detailed optimization plan)

================================================================
```
</process>
