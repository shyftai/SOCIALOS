---
name: social:analytics
description: Platform analytics dashboard with metrics, trends, and insights
argument-hint: "<workspace-name> [platform] [period]"
---
<objective>
Pull platform analytics, compare to benchmarks, identify trends, and surface actionable insights. Per-platform and cross-platform views.

Workspace, platform, and period: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // ANALYTICS >>`
2. Load workspace context -- CHANNELS.md, LEARNINGS.md, CALENDAR.md
3. Determine scope:
   - Platform: all (default) or specific platform from $ARGUMENTS
   - Period: 7 days (default), 30 days, 90 days, or custom

## Data collection
4. Pull metrics from connected tools and analytics files:

**Per platform:**
- Followers: current count, net change, growth rate
- Impressions: total, per post average
- Engagement rate: likes + comments + shares / impressions
- Reach: unique accounts reached
- Profile visits / link clicks
- Top performing content (by engagement rate)
- Worst performing content (by engagement rate)
- Best posting times (by engagement)
- Audience demographics shifts

5. Display analytics dashboard:
```
+==============================================================+
|  ANALYTICS -- {Workspace} -- {period}                          |
+==============================================================+

  Overview
    Total followers:   {N} ({+/-change} | {growth%})
    Total impressions: {N} ({+/-change} | {growth%})
    Avg engagement:    {rate}% ({+/-change} | benchmark: {N}%)
    Posts published:   {N}

  Per platform
  +----------------------------------------------------------+
  | Platform  | Followers | Eng Rate | Impressions | Growth   |
  |-----------|-----------|----------|-------------|----------|
  | LinkedIn  | {N}       | {N}%     | {N}         | {+/-}%  |
  | Twitter   | {N}       | {N}%     | {N}         | {+/-}%  |
  | Instagram | {N}       | {N}%     | {N}         | {+/-}%  |
  +----------------------------------------------------------+

  Top content (by engagement)
    1. "{title}" -- {platform} -- {eng rate}% -- {format}
    2. "{title}" -- {platform} -- {eng rate}% -- {format}
    3. "{title}" -- {platform} -- {eng rate}% -- {format}

  Bottom content (by engagement)
    1. "{title}" -- {platform} -- {eng rate}% -- {format}
    2. "{title}" -- {platform} -- {eng rate}% -- {format}

  Format performance
    Carousel:    {avg eng rate}%  ||||||||||||
    Thread:      {avg eng rate}%  ||||||||||
    Text post:   {avg eng rate}%  ||||||||
    Reel:        {avg eng rate}%  ||||||||||||||
    Newsletter:  {open rate}% open, {click rate}% click

  Posting time analysis
    Best:  {day} {time} -- avg {eng rate}% engagement
    Worst: {day} {time} -- avg {eng rate}% engagement

  Pillar performance
    {pillar-1}:  {avg eng rate}%  {N} posts
    {pillar-2}:  {avg eng rate}%  {N} posts
    {pillar-3}:  {avg eng rate}%  {N} posts

================================================================
```

## Insights
6. Generate actionable insights:
```
  Insights
    [+] Carousels outperform text posts by {N}x -- create more
    [+] {pillar} content gets highest engagement -- double down
    [-] {day} posts underperform -- consider moving to {better day}
    [-] Instagram engagement declining -- review content strategy
    [=] Follower growth steady at {N}%/week -- on track
```

7. Trend detection:
   - Compare current period to previous period
   - Flag significant changes (>20% up or down)
   - Identify emerging patterns (new content types, audience shifts)

8. Save analytics snapshot to analytics/{date}-snapshot.md
9. Update LEARNINGS.md with new performance insights

10. Suggest next action:
```
================================================================

  Analytics saved to analytics/{date}-snapshot.md

  >> Recommended: /social:optimize {ws} (act on these insights)
     Also: /social:report {ws} (generate shareable report)

================================================================
```
</process>
