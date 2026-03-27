---
name: social:schedule
description: Schedule content for posting at optimal times
argument-hint: "<workspace-name> [content-file]"
---
<objective>
Schedule approved content for posting. Check calendar for conflicts, suggest optimal times, push to scheduling tool, and update CALENDAR.md.

Workspace and content: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // SCHEDULE >>`
2. Load workspace context -- CHANNELS.md, CALENDAR.md, TOOLS.md, LEARNINGS.md
3. Load approved content from content/approved/

## Content selection
4. If content file specified in $ARGUMENTS, load it. Otherwise:
   - List all unscheduled approved content
   - Ask which piece to schedule

5. Verify content has been approved (check for approval marker)
   - If not approved, redirect to `/social:review {ws}` first

## Scheduling
6. Check CALENDAR.md for existing scheduled posts:
   - Flag conflicts (same platform, same time slot)
   - Flag clustering (too many posts in one day)
   - Flag gaps (opportunity to fill empty slots)

7. Suggest optimal posting times based on:
   - Platform best practices (from CHANNELS.md)
   - Historical performance data (from LEARNINGS.md)
   - Audience timezone (from AUDIENCE.md)
   - Calendar availability

```
+-- SCHEDULING OPTIONS -----------------------------------+
|                                                          |
|  Content: {title/slug}                                   |
|  Platform: {platform}                                    |
|                                                          |
|  Suggested times:                                        |
|    1. {day} {time} {timezone} -- best for engagement     |
|    2. {day} {time} {timezone} -- fills calendar gap      |
|    3. {day} {time} {timezone} -- matches audience peak   |
|    4. Custom -- pick your own time                       |
|                                                          |
|  Calendar context:                                       |
|    {day before}: {scheduled post or empty}               |
|    {target day}: << this slot                            |
|    {day after}: {scheduled post or empty}                |
|                                                          |
+----------------------------------------------------------+
```

8. After time selection, confirm:
```
  Schedule "{title}" on {platform}
  Date: {date}
  Time: {time} {timezone}

  >> Confirm? (y/n)
```

9. Push to scheduling tool if connected:
   - **Buffer** -- create scheduled post via API
   - **Typefully** -- create draft with scheduled time
   - **Later** -- push to queue
   - **Native scheduling** -- provide instructions for manual scheduling
   - If no tool connected: save schedule to CALENDAR.md only

10. Update CALENDAR.md with the scheduled post:
    ```
    | {date} | {time} | {platform} | {title} | {pillar} | scheduled | {tool} |
    ```

11. Display confirmation:
```
================================================================

  Scheduled: "{title}"
  Platform: {platform}
  Date: {date} at {time} {timezone}
  Tool: {scheduling tool or "manual"}

  >> Next: /social:calendar {ws} (view full calendar)
     Also: /social:cross-post {ws} (adapt for other platforms)

================================================================
```
</process>
