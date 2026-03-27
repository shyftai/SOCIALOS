---
name: social:forecast
description: Growth and performance forecasting for social channels
argument-hint: "<workspace-name> [--30d | --60d | --90d | --all]"
---
<objective>
Forecast social media growth and performance across all active channels. Calculate trajectory from historical data, project 30/60/90 day scenarios, compare against benchmarks, and recommend growth levers.

Workspace and forecast period: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/BENCHMARKS.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // FORECAST >>`
2. Load workspace context:
   - PERFORMANCE.md -- historical metrics, follower counts, engagement data
   - CHANNELS.md -- active platforms, posting frequency, strategy
   - LEARNINGS.md -- what's working, growth patterns, anti-learnings
   - CALENDAR.md -- planned content and campaigns
   - COSTS.md -- ad spend, tool costs, content production costs
   - ROADMAP.md -- strategic initiatives and planned experiments
3. Load BENCHMARKS.md for industry comparison baselines

## Data collection
4. Gather historical metrics per platform (minimum 4 weeks, prefer 12+ weeks):

**Per platform (LinkedIn, Twitter/X, Instagram, TikTok, Newsletter, etc.):**
- Follower / subscriber count -- weekly snapshots
- Follower growth rate -- week-over-week and month-over-month
- Engagement rate -- weekly average
- Impressions / reach -- weekly totals
- Profile visits / link clicks -- weekly totals
- Content volume -- posts per week
- Best performing format and pillar

**Cross-platform:**
- Total audience size
- Total engagement volume
- Cross-platform referral patterns
- Newsletter conversion from social

5. If insufficient data, flag gaps:
```
  !! Insufficient data for accurate forecast
     LinkedIn: 8 weeks of data (good)
     Twitter: 3 weeks of data (minimum -- low confidence)
     Newsletter: 12 weeks of data (strong)

  >> Proceeding with available data. Low-data platforms flagged.
```

## Trajectory calculation
6. Calculate current trajectory per platform:

**Follower / subscriber growth:**
```
For each platform:
  Weekly growth rate = Avg(weekly new followers) / Total followers
  Monthly growth rate = (Current month followers - Last month followers) / Last month followers
  Growth acceleration = This month's rate vs. last month's rate
  Organic vs. paid split (if data available)
```

**Engagement rate trend:**
```
For each platform:
  Current engagement rate = Avg last 4 weeks
  Trend direction = Compare 4-week blocks (improving / stable / declining)
  Engagement per format = Breakdown by content type
  Engagement per pillar = Breakdown by content pillar
```

**Reach / impression trend:**
```
For each platform:
  Avg weekly impressions = Last 4 weeks
  Impression trend = Week-over-week change
  Reach-to-follower ratio = Impressions / Followers (viral coefficient)
  Algorithmic boost indicator = Spikes above 2x average
```

**Newsletter metrics (if applicable):**
```
  Subscriber growth rate
  Open rate trend
  Click rate trend
  Unsubscribe rate
  List health = Growth rate - Unsubscribe rate
```

## Forecast projection
7. Project 30/60/90 day forecasts with three scenarios:

**Best case** -- assumes:
- Growth rate accelerates by 20% (based on planned campaigns, content experiments)
- Top-performing formats and pillars get increased allocation
- Engagement rate improves to best 4-week average seen
- Calendar has no gaps, all planned content ships

**Expected case** -- assumes:
- Current growth rate continues unchanged
- Current engagement rate holds steady
- Planned content ships at 80% adherence
- No significant algorithm changes

**Worst case** -- assumes:
- Growth rate declines by 20%
- Engagement rate drops to lowest 4-week average seen
- Content cadence drops by 25% (capacity issues, holidays)
- Platform algorithm shifts reduce organic reach

```
For each platform, each scenario:
  30d followers = Current + (Daily growth rate × 30 × scenario modifier)
  60d followers = 30d + (Daily growth rate × 30 × scenario modifier × momentum factor)
  90d followers = 60d + (Daily growth rate × 30 × scenario modifier × momentum factor)

  Momentum factor:
    Best: 1.1 (compounding -- more followers → more reach → more growth)
    Expected: 1.0 (linear)
    Worst: 0.9 (deceleration)
```

## Forecast display
8. Display the forecast dashboard:
```
+==============================================================+
|  FORECAST -- {Workspace} -- {date}                              |
+==============================================================+

  FOLLOWER / SUBSCRIBER GROWTH (Expected scenario)

  Platform      Current    30d          60d          90d
  ─────────────────────────────────────────────────────────────
  LinkedIn      {n}        {n} (+{n}%)  {n} (+{n}%)  {n} (+{n}%)
  Twitter       {n}        {n} (+{n}%)  {n} (+{n}%)  {n} (+{n}%)
  Instagram     {n}        {n} (+{n}%)  {n} (+{n}%)  {n} (+{n}%)
  Newsletter    {n}        {n} (+{n}%)  {n} (+{n}%)  {n} (+{n}%)
  ─────────────────────────────────────────────────────────────
  Total         {n}        {n} (+{n}%)  {n} (+{n}%)  {n} (+{n}%)


  ENGAGEMENT RATE FORECAST

  Platform      Current    30d         60d         90d        Benchmark
  ─────────────────────────────────────────────────────────────────────
  LinkedIn      {pct}%     {pct}%      {pct}%      {pct}%     {pct}%
  Twitter       {pct}%     {pct}%      {pct}%      {pct}%     {pct}%
  Instagram     {pct}%     {pct}%      {pct}%      {pct}%     {pct}%
  Newsletter    {pct}%     {pct}%      {pct}%      {pct}%     {pct}%


  SCENARIO RANGES (90-day follower totals)

  Platform      Worst        Expected     Best
  ─────────────────────────────────────────────────────────────
  LinkedIn      {n}          {n}          {n}
  Twitter       {n}          {n}          {n}
  Instagram     {n}          {n}          {n}
  Newsletter    {n}          {n}          {n}

================================================================
```

## Benchmark comparison
9. Compare current metrics and projections against BENCHMARKS.md:
```
  BENCHMARK CHECK

  Platform      Metric            Yours      Benchmark    Status
  ─────────────────────────────────────────────────────────────────
  LinkedIn      Engagement rate   {pct}%     {pct}%       {above/below}
  LinkedIn      Growth rate       {pct}%     {pct}%       {above/below}
  Twitter       Engagement rate   {pct}%     {pct}%       {above/below}
  Twitter       Growth rate       {pct}%     {pct}%       {above/below}
  Newsletter    Open rate         {pct}%     {pct}%       {above/below}
  Newsletter    Click rate        {pct}%     {pct}%       {above/below}
```

10. Flag platforms below benchmark growth:
```
  !! Below benchmark:
     Twitter engagement rate ({pct}%) is {n}% below industry avg ({pct}%)
     Instagram growth rate ({pct}%) is below benchmark ({pct}%)

  >> Above benchmark:
     LinkedIn engagement ({pct}%) is {multiplier}x industry avg
     Newsletter open rate ({pct}%) exceeds benchmark by {n}%
```

## Growth levers
11. Suggest growth levers based on LEARNINGS.md and forecast gaps:

```
  GROWTH LEVERS -- ranked by expected impact

  1. {lever} -- Impact: +{n} followers / +{pct}% engagement
     Source: LEARNINGS.md -- "{relevant learning}"
     Action: {specific next step}

  2. {lever} -- Impact: +{n} followers / +{pct}% engagement
     Source: Benchmark gap -- {platform} is {n}% below avg
     Action: {specific next step}

  3. {lever} -- Impact: +{n} followers / +{pct}% engagement
     Source: CALENDAR.md -- {planned initiative}
     Action: {specific next step}

  4. {lever} -- Impact: +{n} subscribers
     Source: Cross-platform -- {conversion opportunity}
     Action: {specific next step}
```

## Forecast comparison
12. If previous forecasts exist in PERFORMANCE.md, compare actual vs. predicted:
```
  FORECAST ACCURACY -- vs. previous forecast

  Platform      Predicted    Actual     Variance     Accuracy
  ─────────────────────────────────────────────────────────────
  LinkedIn      {n}          {n}        {+/- n}      {pct}%
  Twitter       {n}          {n}        {+/- n}      {pct}%
  Newsletter    {n}          {n}        {+/- n}      {pct}%

  Forecast trend:
    {date}: {total audience} -- {scenario hit}
    {date}: {total audience} -- {scenario hit}
    {date}: {total audience} -- {scenario hit}
    Trajectory: {growing / stable / declining}
```

13. If forecasts have consistently over- or under-predicted, adjust model:
    - If actual > best case 2x in a row → raise baseline assumptions
    - If actual < worst case 2x in a row → lower baseline assumptions
    - Note calibration adjustment in forecast metadata

## Save and next steps
14. Save forecast snapshot to PERFORMANCE.md:
    - Append forecast section with date, projections, and assumptions
    - Preserve previous forecasts for trend tracking

15. Save full forecast to reports/forecast-{date}.md

16. Suggest next actions:
```
================================================================

  Forecast saved to reports/forecast-{date}.md
  Snapshot added to PERFORMANCE.md

  >> Next: /social:calendar {ws} (plan content to hit forecast)
     Also: /social:optimize {ws} (fix below-benchmark platforms)
     Also: /social:debrief {ws} (analyze what's driving the trend)
     Also: /social:ab-test {ws} (test growth lever hypotheses)

================================================================
```
</process>
