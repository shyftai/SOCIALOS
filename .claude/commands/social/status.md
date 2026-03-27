---
name: social:status
description: Show workspace status and available commands
argument-hint: "[workspace-name]"
---
<objective>
Display the SOCIAL:OS banner, workspace status, and available commands.

Workspace: $ARGUMENTS (optional -- if omitted, list all workspaces)
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display the SOCIAL:OS startup banner

2. If no workspace specified:
   - List all workspaces in workspaces/ with name, status, and active platforms
   - Prompt: `>> Which workspace?`

3. If workspace specified:
   - Load workspace context
   - Display workspace header from ui-brand.md
   - Show loaded sources of truth: [x] for populated, [ ] for empty
   - Show active platforms with follower counts and recent engagement rates
   - Show execution mode: interactive or auto (with indicator)
   - Show tool connection status: [x] for key present, [ ] for missing
   - Show content pipeline: drafts pending, scheduled, published this week

4. Display available commands:

```
================================================================

  SOCIAL:OS Commands

  Setup
    /social:onboard       Onboard a new workspace (full / --quick)
    /social:status        Show this command list
    /social:dashboard     Smart dashboard -- what needs attention now
    /social:today         Daily action briefing

  Create
    /social:brief         Create a content brief
    /social:write         Write social content (any platform/format)
    /social:carousel      Create carousel content (LinkedIn / Instagram)
    /social:thread        Write a thread (Twitter / LinkedIn)
    /social:reel-script   Write a reel or short video script
    /social:newsletter    Create newsletter content

  Schedule & Publish
    /social:schedule      Schedule content for posting
    /social:calendar      View and manage content calendar
    /social:publish       Publish content now or push to queue
    /social:cross-post    Adapt and post across multiple platforms

  Engage
    /social:engage        Daily engagement routine
    /social:community     Community participation (Reddit, Discord, Slack)
    /social:replies       Handle comments and DMs

  Analyze
    /social:analytics     Platform analytics dashboard
    /social:report        Generate performance report
    /social:ab-test       Set up and track A/B tests

  Growth
    /social:trends        Scan trending topics and formats
    /social:competitor    Competitive analysis
    /social:hashtags      Hashtag research and strategy

  Repurpose
    /social:repurpose     Transform content across platforms and formats

  Optimization
    /social:optimize      Content optimization from performance data
    /social:debrief       Campaign or period debrief with forward-feed

  Operations
    /social:research      Research audience, competitors, and trends
    /social:review        Review content against brand and platform specs
    /social:compliance    Configure platform and privacy compliance
    /social:portfolio     Multi-workspace dashboard (agencies)
    /social:clone         Clone a content strategy across workspaces
    /social:feedback      Submit feedback, report bugs, request features
    /social:swarm         Run parallel agent operations

================================================================
```
</process>
