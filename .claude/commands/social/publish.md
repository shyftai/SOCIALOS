---
name: social:publish
description: Publish content now or push to publishing queue
argument-hint: "<workspace-name> [content-file]"
---
<objective>
Publish approved content immediately or push to the publishing queue. Run pre-publish checks before any content goes live.

Workspace and content: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // PUBLISH >>`
2. Load workspace context -- CHANNELS.md, TOOLS.md, BRAND.md, TOV.md
3. Load approved content from content/approved/

## Content selection
4. If content file specified, load it. Otherwise:
   - List approved content ready to publish
   - Ask which piece to publish

5. Verify approval marker exists on the content
   - If no approval marker: stop and redirect to `/social:review {ws}`
   - If content was modified after approval: warn and ask to re-approve

## Pre-publish checks
6. Run pre-publish validation:
```
+-- PRE-PUBLISH CHECK ------------------------------------+
|                                                          |
|  Content: {title}                                        |
|  Platform: {platform}                                    |
|                                                          |
|  [x] Approved (marker present, {date})                   |
|  [x] Brand check -- messaging aligned                    |
|  [x] Platform specs -- character count, format OK        |
|  [x] Links -- all links valid and trackable              |
|  [x] Hashtags -- count and relevance OK                  |
|  [x] Image/media -- dimensions correct for platform      |
|  [x] No banned words or phrases                          |
|  [x] CTA present                                         |
|  [ ] {any failures}                                      |
|                                                          |
+----------------------------------------------------------+
```

7. If any check fails:
   - Show what failed and why
   - Suggest fix
   - Do not proceed until all checks pass

## Publish
8. Ask: "Publish now or add to queue?"
   - **Now** -- publish immediately
   - **Queue** -- add to next available slot in publishing queue

9. If publishing now:
   - Push to connected tool (Buffer, Typefully, or native API)
   - If no tool connected, display the content formatted for manual copy-paste:
     ```
     Ready to post manually. Copy the content below:

     ---
     {formatted content for the platform}
     ---

     Hashtags (copy separately if needed):
     {hashtags}
     ```

10. After publishing:
    - Update CALENDAR.md status to "published"
    - Move content file to content/published/
    - Log publish event in logs/decisions.md

11. Display confirmation:
```
================================================================

  Published: "{title}" on {platform}
  Time: {timestamp}
  Status: LIVE

  >> Next: /social:engage {ws} (monitor early engagement)
     Also: /social:cross-post {ws} (adapt for other platforms)

================================================================
```
</process>
