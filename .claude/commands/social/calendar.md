---
name: social:calendar
description: View and manage the content calendar
argument-hint: "<workspace-name> [week|month]"
---
<objective>
View and manage the content calendar. Show weekly or monthly view, detect gaps, check pillar balance, and identify scheduling issues.

Workspace and view: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // CALENDAR >>`
2. Load workspace context -- CALENDAR.md, CHANNELS.md, PILLARS.md, LEARNINGS.md
3. Determine view: week (default) or month

## Weekly view
4. If weekly view:
```
+==============================================================+
|  CALENDAR -- {Workspace} -- Week of {date}                     |
+==============================================================+

  Monday {date}
    09:00  LinkedIn    "5 lessons from scaling..." [carousel] [growth]   SCHEDULED
    14:00  Twitter     "Hot take: most founders..." [text] [leadership]  DRAFT

  Tuesday {date}
    10:00  Instagram   Product walkthrough [reel] [product]              SCHEDULED
    --     LinkedIn    << GAP -- no post scheduled

  Wednesday {date}
    08:30  Twitter     "Thread: How we 10x'd..." [thread] [growth]      SCHEDULED
    12:00  Newsletter  Issue #14 [curated]                               READY

  Thursday {date}
    --     ALL         << GAP -- no content scheduled

  Friday {date}
    09:00  LinkedIn    "{topic}" [text] [authority]                      DRAFT
    15:00  Instagram   Behind the scenes [story] [culture]              IDEA

  Saturday {date}
    --     REST DAY (per posting schedule)

  Sunday {date}
    --     REST DAY (per posting schedule)

================================================================
```

## Monthly view
5. If monthly view, show condensed grid:
```
+-- {Month} {Year} ------------------------------------------+
|  Mon    Tue    Wed    Thu    Fri    Sat    Sun               |
|  LI,TW  IG     TW,NL  --     LI,IG  --     --              |
|  LI     TW,IG  LI     TW     IG     --     --              |
|  LI,TW  IG     TW,NL  --     LI,IG  --     --              |
|  LI     TW     LI     --     IG     --     --              |
|                                                              |
|  Total: {N} posts  |  Gaps: {N} days  |  Avg: {N}/day      |
+--------------------------------------------------------------+
```

## Analysis
6. Pillar balance check:
```
  Pillar balance (this {period})
    {pillar-1}   |||||||||||  6 posts  (target: 5-7)  ON TRACK
    {pillar-2}   |||||||      4 posts  (target: 4-6)  ON TRACK
    {pillar-3}   ||           1 post   (target: 3-5)  BELOW TARGET
    {pillar-4}   |||||        3 posts  (target: 2-4)  ON TRACK
```

7. Platform frequency check:
```
  Platform frequency (this {period})
    LinkedIn     5/wk  (target: 3-5/wk)   ON TRACK
    Twitter      8/wk  (target: 5-10/wk)  ON TRACK
    Instagram    2/wk  (target: 3-5/wk)   BELOW TARGET
```

8. Gap detection:
   - Flag days with no content on active platforms
   - Flag platforms below minimum posting frequency
   - Suggest briefs for gaps: `/social:brief {ws}` with suggested pillar and platform

9. Calendar management options:
```
  >> Options:
     1. Fill a gap -- create brief for an empty slot
     2. Move a post -- reschedule existing content
     3. Add content -- schedule approved content
     4. View next {period}
```

10. Suggest next action based on findings:
```
================================================================

  >> Recommended: Fill Thursday gap -- /social:brief {ws}
     Also: Instagram needs 1 more post this week

================================================================
```
</process>
