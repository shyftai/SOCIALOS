---
name: social:portfolio
description: Multi-workspace dashboard for agencies managing multiple clients
argument-hint: ""
---
<objective>
Display a portfolio-level dashboard across all workspaces. Built for agencies and teams managing multiple clients or brands.
</objective>

<execution_context>
@./.claude/socialos/references/report-template.md
@./.claude/socialos/references/BENCHMARKS.md
@./.claude/socialos/references/ui-brand.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // PORTFOLIO >>`
2. Scan workspaces/ folder for all active workspaces
3. For each workspace, load summary data

## Portfolio dashboard
4. Display cross-workspace overview:
```
+==============================================================+
|  PORTFOLIO -- All Workspaces                                   |
+==============================================================+

  Workspaces ({N} active)
  +----------------------------------------------------------+
  | Workspace     | Platforms | Posts/wk | Eng Rate | Status  |
  |---------------|-----------|----------|----------|---------|
  | {client-1}    | LI,TW,IG | 10       | 3.8%     | Active  |
  | {client-2}    | LI,TW    | 7        | 4.2%     | Active  |
  | {client-3}    | IG,TK    | 12       | 5.1%     | Active  |
  | {client-4}    | LI       | 3        | 2.9%     | Paused  |
  +----------------------------------------------------------+

  Needs attention
    !! {client-1}: 8 unresponded comments (oldest: 12h)
    !! {client-3}: Calendar gap tomorrow -- no content scheduled
    >> {client-2}: Engagement dropping on LinkedIn (-22% WoW)
    >> {client-4}: Paused -- resume or archive?

  Weekly summary
    Total posts published: {N}
    Total engagement:      {N} interactions
    Best performer:        {workspace} ({eng rate}%)
    Needs help:            {workspace} ({eng rate}%)

  Upcoming deadlines
    {date}: {client} -- newsletter due
    {date}: {client} -- monthly report
    {date}: {client} -- strategy review

================================================================

  >> Quick actions:
     /social:today {workspace}      -- daily briefing for a client
     /social:report {workspace}     -- generate client report
     /social:clone {workspace}      -- clone strategy to new client
     /social:onboard {new-client}   -- onboard a new client

================================================================
```

5. Options:
```
  >> Select a workspace for details, or:
     1. View all workspaces needing attention
     2. Generate reports for all clients
     3. Onboard a new client
```

6. If "reports for all" selected:
   - Generate summary reports for each workspace
   - Save to each workspace's reports/ folder
   - Display completion summary
</process>
