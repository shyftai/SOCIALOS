---
name: social:optimize
description: Content optimization suggestions based on performance data
argument-hint: "<workspace-name>"
---
<objective>
Analyze performance data and generate specific optimization recommendations. What to do more of, what to stop, when to post, how to improve engagement.

Workspace: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // OPTIMIZE >>`
2. Load workspace context -- LEARNINGS.md, CHANNELS.md, PILLARS.md, CALENDAR.md, AUDIENCE.md
3. Load analytics data from analytics/ folder
4. Load A/B test results from tests/AB-TESTS.md

## Data analysis
5. Analyze patterns across all available data:

**Content performance:**
- Which formats get the highest engagement?
- Which pillars resonate most?
- Which topics generate the most comments (not just likes)?
- What's the ideal content length per platform?
- Which hooks/openings perform best?
- Which CTAs drive the most action?

**Timing optimization:**
- Best days of the week per platform
- Best times of day per platform
- Optimal posting frequency (more is not always better)
- Engagement decay patterns (how long do posts get engagement?)

**Audience insights:**
- What content gets saved (high intent signal)?
- What content gets shared (amplification signal)?
- What generates conversations in comments?
- What attracts new followers vs. engages existing ones?

**Format insights:**
- Carousel vs. text vs. thread vs. reel performance
- Optimal carousel length (number of slides)
- Optimal thread length (number of tweets)
- Video length sweet spots

6. Display optimization dashboard:
```
+==============================================================+
|  OPTIMIZATION -- {Workspace}                                   |
+==============================================================+

  Do more of
    [+] {format} on {platform} -- {N}x better engagement
    [+] Posts about {topic/pillar} -- consistently outperform
    [+] {hook style} openings -- {N}% higher read-through
    [+] Posting at {time} on {day} -- peak engagement window

  Do less of
    [-] {format} on {platform} -- underperforming by {N}%
    [-] Posts about {topic} -- low engagement, audience fatigue
    [-] {posting pattern} -- diminishing returns detected

  Stop doing
    [x] {specific tactic} -- data shows negative impact
    [x] {specific pattern} -- consistently underperforms

  Try next
    [?] {experiment suggestion} -- based on {insight}
    [?] {experiment suggestion} -- competitors seeing success
    [?] {experiment suggestion} -- trending in your niche

  Timing recommendations
    LinkedIn:  Best: {day} {time}  |  Avoid: {day} {time}
    Twitter:   Best: {day} {time}  |  Avoid: {day} {time}
    Instagram: Best: {day} {time}  |  Avoid: {day} {time}

  Frequency recommendations
    LinkedIn:  {N}/week (currently {N}/week) -- {adjust}
    Twitter:   {N}/week (currently {N}/week) -- {adjust}
    Instagram: {N}/week (currently {N}/week) -- {adjust}

================================================================
```

## Action plan
7. Generate specific action items:
```
  Action plan (prioritized)

  1. [HIGH] {specific change} -- expected impact: {metric}
     How: {instructions}

  2. [HIGH] {specific change} -- expected impact: {metric}
     How: {instructions}

  3. [MEDIUM] {specific change} -- expected impact: {metric}
     How: {instructions}

  4. [LOW] {specific change} -- expected impact: {metric}
     How: {instructions}
```

8. Offer to apply changes:
   - Update CHANNELS.md with new posting times/frequencies
   - Update CALENDAR.md template with optimized schedule
   - Update LEARNINGS.md with new insights
   - Set up A/B tests for experiments

9. Save optimization report to analytics/optimize-{date}.md

10. Suggest next action:
```
================================================================

  >> Next: /social:calendar {ws} (apply optimized schedule)
     Also: /social:ab-test {ws} (test the "try next" suggestions)

================================================================
```
</process>
