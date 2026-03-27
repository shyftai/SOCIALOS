---
name: social:today
description: Daily action briefing -- what you need to do right now
argument-hint: "<workspace-name>"
---
<objective>
Morning briefing. Scan the workspace, surface what needs action today, and prioritize it. Built for social media managers and creators who want to know "what do I do right now?"

Workspace: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // TODAY >>`
2. Load full workspace context -- all files, all content pipelines
3. Check current date against posting calendar for holidays or blackout dates

## Scan everything
4. Scan and categorize actions by urgency:

**Urgent (do now):**
- Unresponded comments older than 4 hours -- engagement is dying
- Negative comments or mentions requiring immediate response
- Engagement rate drops (>30% decline from 7-day average)
- Scheduled posts that failed to publish
- Trending topics aligned with content pillars -- time-sensitive opportunity

**Today (do before end of day):**
- Content due for creation today (from CALENDAR.md)
- Engagement quota not yet met (daily target from ENGAGEMENT.md)
- Newsletter scheduled for today -- final review needed
- Calendar gaps in the next 48 hours -- need content
- Content waiting for approval (drafts/ folder)
- A/B tests reaching statistical significance -- pick winner
- Replies and DMs queue (unprocessed items)

**This week (plan for it):**
- Planned content for the week (from CALENDAR.md)
- Competitor moves detected -- new strategy, viral post, campaign launch
- Strategy review due (last review >14 days ago)
- Content pillar balance check -- any pillar underrepresented
- Hashtag performance review due
- Debrief due (campaign/period completed, not yet debriefed)

5. Display the daily briefing:
```
+==============================================================+
|  TODAY -- {Workspace} -- {date}                                |
+==============================================================+

  Do now
    !! 3 unresponded comments (oldest: 6h) -- /social:replies {ws}
    !! Engagement drop on LinkedIn (-38%) -- /social:analytics {ws}
    !! Trending: #{topic} aligns with {pillar} -- /social:trends {ws}

  Today
    >> Create carousel for {pillar} (due today) -- /social:carousel {ws}
    >> Engagement quota: 4/15 done -- /social:engage {ws}
    >> Newsletter send at 2pm -- final review -- /social:newsletter {ws}
    >> 2 drafts waiting for approval -- /social:review {ws}

  This week
    .. 3 posts planned, 1 gap on Thursday -- /social:calendar {ws}
    .. Competitor {name} launched new series -- /social:competitor {ws}
    .. Pillar balance: {pillar} has 0 posts this week

  Content pulse
    LinkedIn     3 posts/wk    Eng: 4.2%    [above avg]
    Twitter      5 posts/wk    Eng: 1.8%    [on track]
    Instagram    2 posts/wk    Eng: 3.1%    [below avg]

  All clear?
    {If nothing urgent: "Nothing urgent. Focus on content creation or plan ahead."}

================================================================
```

6. Recommend the single most important action:
```
  >> Start here: /social:replies {ws}
```

7. If role is set in workspace.config.md, adjust emphasis:
   - **Social Media Manager**: emphasize engagement queue, calendar gaps, analytics
   - **Content Creator**: emphasize content due today, creation pipeline, trends
   - **Community Manager**: emphasize replies, community engagement, negative mentions
   - **Founder**: keep it simple -- top 3 actions only
   - **Agency**: show cross-workspace summary if multiple workspaces exist
</process>
