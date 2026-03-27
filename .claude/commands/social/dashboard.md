---
name: social:dashboard
description: Smart dashboard -- shows what needs attention right now
argument-hint: "<workspace-name>"
---
<objective>
Analyze the full state of a workspace and surface what needs attention. Prioritize actions, flag issues, and recommend the next step.

Workspace: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // DASHBOARD >>`
2. Load full workspace context -- all files
3. Scan and assess each area:

## Workspace scan

**Sources of truth:**
- Check BRAND.md, AUDIENCE.md, PILLARS.md, TOV.md, CHANNELS.md -- are they populated or still templates?
- Flag any that are incomplete

**Active platforms:**
- List all platforms with current status
- For each platform: follower count, engagement rate (7-day avg), posts this week

**Content pipeline:**
- Drafts pending review (content/drafts/ folder)
- Scheduled posts (next 7 days from CALENDAR.md)
- Published this week with performance snapshot
- Calendar gaps (days with no content scheduled)

**Pending actions:**
Check for items that need human attention:
- Unresponded comments and DMs (engagement queue)
- Content waiting for approval (content/drafts/ has unapproved files)
- Calendar gaps in the next 7 days
- Engagement quota shortfall (daily/weekly targets from ENGAGEMENT.md)
- Newsletter due dates approaching
- A/B tests awaiting decision
- Trending topics aligned with pillars (time-sensitive)
- Negative mentions or comments needing response
- Pillar balance off target (one pillar dominating or absent)
- Competitor activity detected

4. Display the dashboard:
```
+==============================================================+
|  DASHBOARD -- {Workspace}                                      |
+==============================================================+

  Platforms
    LinkedIn     12.4K followers    Eng: 4.2%    3 posts/wk
    Twitter      8.1K followers     Eng: 1.8%    5 posts/wk
    Instagram    5.3K followers     Eng: 3.1%    2 posts/wk

  Content pipeline
    Drafts:     3 pending review
    Scheduled:  5 posts (next 7 days)
    Gaps:       Thursday, Saturday -- need content

  Pillar balance (this week)
    {pillar-1}   |||||||     3 posts
    {pillar-2}   ||||        2 posts
    {pillar-3}                0 posts  << gap

  Engagement queue
    !! 8 unresponded comments -- /social:replies {ws}
    !! 2 DMs waiting -- /social:replies {ws}
    >> Engagement quota: 12/20 this week

  Needs attention
    !! Negative comment on {post} -- respond now
    !! Calendar gap Thursday -- /social:brief {ws}
    >> Newsletter due in 3 days -- /social:newsletter {ws}

  Looking good
    [x] Brand guidelines loaded
    [x] All platforms connected
    [x] Posting frequency on target
    [x] No compliance issues

  Top performing content (last 7 days)
    1. "{post title}" -- {platform} -- {engagement rate}
    2. "{post title}" -- {platform} -- {engagement rate}

================================================================

  >> Recommended: /social:replies {ws}
     Also: /social:brief {ws} (fill Thursday gap)

================================================================
```

5. Prioritize the "Recommended" action by urgency:
   - Negative mentions > unresponded comments > calendar gaps > engagement quota > everything else
   - If nothing needs attention: "All clear. Next scheduled action: {what and when}"

6. If performance data has patterns worth surfacing, add a suggestion block:
```
  +-- SUGGESTION ----------------------------------------+
  | Based on 30 days of data:                             |
  | Carousel posts get 2.4x more engagement than text.    |
  | Consider adding 1 more carousel per week.             |
  |                                                       |
  | >> Apply this to calendar? (y/n)                     |
  +-------------------------------------------------------+
```
</process>
