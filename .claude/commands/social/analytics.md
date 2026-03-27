---
name: social:analytics
description: Cross-platform analytics with pattern detection and actionable insights
argument-hint: "<workspace-name> [--platform linkedin|twitter|instagram|...] [--period 7d|30d|90d]"
---
<objective>
Unified analytics across all social platforms. Default view is cross-platform (the real value). Use --platform for single-platform deep dive.

Workspace and options: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/api-reference.md
@./.claude/socialos/references/BENCHMARKS.md
@./.claude/socialos/references/report-template.md
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/content-scoring.md
@./.claude/socialos/references/audience-scoring.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // ANALYTICS >>`
2. Load workspace context -- CHANNELS.md, PILLARS.md, LEARNINGS.md, CALENDAR.md, PERFORMANCE.md, COMPETITORS.md
3. Determine scope:
   - Platform: all (default) or specific from --platform flag
   - Period: 7d (default), 30d, 90d, or custom range

## Data collection
4. Pull metrics from connected tools, API endpoints, and analytics files for ALL active platforms.

**Per platform, collect:**
- Followers: current, net change, growth rate
- Impressions: total, per-post average
- Engagement rate: (likes + comments + shares + saves) / impressions
- Reach: unique accounts reached
- Profile visits / link clicks / website referrals
- Top 5 performing content (by engagement rate)
- Bottom 3 performing content (by engagement rate)
- Best posting times (by engagement)
- Audience growth source (organic, viral, paid)
- Saves/bookmarks (high-signal engagement)

---

## Cross-platform view (default -- no --platform flag)

5. Display unified dashboard:
```
+==============================================================+
|  ANALYTICS -- {Workspace} -- {period}                          |
+==============================================================+

  TOTALS
    Followers:    {N} across {n} platforms ({+/-change} | {growth%})
    Impressions:  {N} ({+/-change})
    Engagement:   {N} total interactions ({weighted avg rate}%)
    Published:    {N} pieces across {n} platforms
    Newsletter:   {N} subscribers ({+/-change})

  PLATFORM COMPARISON
  +---------------------------------------------------------------+
  | Platform   | Followers | Eng Rate | Reach    | Growth | Trend |
  |------------|-----------|----------|----------|--------|-------|
  | LinkedIn   | {N}       | {N}%     | {N}      | {+/-}% | {arrow} |
  | Twitter    | {N}       | {N}%     | {N}      | {+/-}% | {arrow} |
  | Instagram  | {N}       | {N}%     | {N}      | {+/-}% | {arrow} |
  | TikTok     | {N}       | {N}%     | {N}      | {+/-}% | {arrow} |
  | YouTube    | {N}       | {N}%     | {N}      | {+/-}% | {arrow} |
  | Newsletter | {N} subs  | {open}%  | {click}% | {+/-}% | {arrow} |
  +---------------------------------------------------------------+
  Trend: ^ improving, v declining, = steady (vs previous period)
```

## Cross-platform pattern detection
6. This is where the real value is. Analyze patterns ACROSS platforms:

```
  CROSS-PLATFORM PATTERNS

  Content that works everywhere
    "{topic/format}" -- {eng%} LI, {eng%} TW, {eng%} IG
    "{topic/format}" -- {eng%} LI, {eng%} TW, {eng%} IG
    >> These are your universal winners. Scale production.

  Content that only works on one platform
    "{topic/format}" -- {eng%} on {platform}, below avg elsewhere
    >> Platform-specific. Don't cross-post these, create native.

  Platform cannibalization
    {platform-A} and {platform-B} share {N}% audience overlap
    >> Posting same content to both dilutes reach. Stagger by {N} days.

  Pillar performance by platform
  +-------------------------------------------------------+
  | Pillar        | Best platform | Worst platform | Gap   |
  |---------------|---------------|----------------|-------|
  | {pillar-1}    | {platform}    | {platform}     | {N}x  |
  | {pillar-2}    | {platform}    | {platform}     | {N}x  |
  | {pillar-3}    | {platform}    | {platform}     | {N}x  |
  +-------------------------------------------------------+
  >> Route each pillar to its strongest platform.

  Format performance (cross-platform)
  +-------------------------------------------------------+
  | Format     | Avg Eng | Best Platform | Volume | Trend |
  |------------|---------|---------------|--------|-------|
  | Carousel   | {N}%    | {platform}    | {N}    | {arrow} |
  | Thread     | {N}%    | {platform}    | {N}    | {arrow} |
  | Text post  | {N}%    | {platform}    | {N}    | {arrow} |
  | Reel/Short | {N}%    | {platform}    | {N}    | {arrow} |
  | Newsletter | {N}%    | --            | {N}    | {arrow} |
  +-------------------------------------------------------+

  Timing patterns
    Best day across all:  {day} (avg {eng%}%)
    Worst day across all: {day} (avg {eng%}%)
    Optimal posting windows:
      LinkedIn:   {day} {time}
      Twitter:    {day} {time}
      Instagram:  {day} {time}
```

## Audience flow analysis
7. Track how audiences move between platforms:
```
  AUDIENCE FLOW
    Newsletter signups from social: {N} this period
      LinkedIn: {N} ({%})
      Twitter:  {N} ({%})
      Instagram:{N} ({%})
    >> {platform} is your best newsletter feeder. Feature signup CTA more.

    Website clicks from social: {N} this period
      {ranked by platform}
    >> {platform} drives the most qualified traffic.
```

## Engagement quality analysis
8. Not all engagement is equal. Break it down:
```
  ENGAGEMENT QUALITY
  +-------------------------------------------------------+
  | Platform   | Likes | Comments | Shares | Saves | DMs  |
  |------------|-------|----------|--------|-------|------|
  | LinkedIn   | {N}   | {N}      | {N}    | {N}   | {N}  |
  | Twitter    | {N}   | {N}      | {N}    | {N}   | {N}  |
  | Instagram  | {N}   | {N}      | {N}    | {N}   | {N}  |
  +-------------------------------------------------------+

  High-signal engagement (comments + shares + saves + DMs):
    {platform}: {N} ({%} of total engagement)
    >> {platform} has deepest engagement. Prioritize for conversions.

  Low-signal engagement (likes only):
    {platform}: {N}% of engagement is likes-only
    >> Shallow engagement. Test more conversation-starting hooks.
```

## Insights and recommendations
9. Generate prioritized, actionable insights:
```
  INSIGHTS (ranked by impact)

  Do more:
    [+] {specific finding with data}
    [+] {specific finding with data}

  Do less:
    [-] {specific finding with data}
    [-] {specific finding with data}

  Investigate:
    [?] {anomaly or pattern that needs more data}

  Rebalance:
    [~] {platform/pillar/format allocation suggestion}
```

## Trend detection
10. Compare current period to previous period for ALL platforms:
    - Flag any metric change >20% (up or down)
    - Detect emerging patterns: new hashtags gaining traction, audience demographic shifts, engagement type shifts
    - Compare against BENCHMARKS.md -- flag platforms below industry average
    - Surface COMPETITORS.md comparison if competitor data exists

## Save and learn
11. Save analytics snapshot to analytics/{date}-snapshot.md
12. Update PERFORMANCE.md with latest metrics
13. Auto-update LEARNINGS.md with new insights:
    - Content learnings from top/bottom performers
    - Timing learnings from posting analysis
    - Platform learnings from cross-platform patterns
    - Flag any anti-learnings (things that stopped working)

---

## Single-platform deep dive (with --platform flag)

14. If --platform is specified, show everything above but for ONE platform only, plus:
    - Detailed content breakdown (every post in period with metrics)
    - Follower demographics and growth sources
    - Hashtag performance for that platform
    - Hour-by-hour engagement heatmap
    - Competitor comparison on that platform (from COMPETITORS.md)
    - Algorithm-specific tips based on current performance

---

## Next up
15. Suggest next action:
```
================================================================

  Analytics saved to analytics/{date}-snapshot.md
  PERFORMANCE.md updated | LEARNINGS.md updated

  >> Recommended: /social:optimize {ws} (act on these insights)
     Also: /social:report {ws} --period {period} (shareable report)
     Also: /social:forecast {ws} (project growth from this data)

================================================================
```
</process>
