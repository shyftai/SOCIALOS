---
name: social:clone
description: Clone a content strategy across workspaces
argument-hint: "<source-workspace> <target-workspace>"
---
<objective>
Clone a proven content strategy from one workspace to another. Copies strategy files while allowing customization for the target brand.

Source and target: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // CLONE >>`
2. Parse source workspace and target workspace from $ARGUMENTS
3. Validate both workspaces exist

## Clone selection
4. Ask what to clone:
   - **Full strategy** -- all strategy files (PILLARS, CHANNELS, ENGAGEMENT, CALENDAR template, HASHTAGS)
   - **Content pillars only** -- just the pillar framework
   - **Calendar template** -- posting schedule and frequency
   - **Engagement rules** -- engagement targets and community rules
   - **Hashtag strategy** -- hashtag sets and categories
   - **Pick and choose** -- select specific files

5. For each file being cloned, show what will be copied:
```
+-- CLONE PREVIEW -----------------------------------------+
|                                                           |
|  Source: {source workspace}                               |
|  Target: {target workspace}                               |
|                                                           |
|  Files to clone:                                          |
|    [x] PILLARS.md      -- content pillar framework        |
|    [x] CHANNELS.md     -- platform strategy and timing    |
|    [x] ENGAGEMENT.md   -- engagement rules and targets    |
|    [x] CALENDAR.md     -- posting schedule template       |
|    [x] HASHTAGS.md     -- hashtag strategy                |
|    [ ] BRAND.md        -- NOT cloned (unique per brand)   |
|    [ ] AUDIENCE.md     -- NOT cloned (unique per brand)   |
|    [ ] TOV.md          -- NOT cloned (unique per brand)   |
|                                                           |
|  Note: Brand, audience, and voice are never cloned --     |
|  these must be unique to each workspace.                  |
|                                                           |
+-----------------------------------------------------------+
```

6. Important: Never clone these files (they must be unique per workspace):
   - BRAND.md
   - AUDIENCE.md
   - TOV.md
   - workspace.config.md
   - COMPLIANCE.md

## Customization
7. For each cloned file, ask if the user wants to customize:
   - Show the source content
   - Ask: "Apply as-is or customize for {target}?"
   - If customize: walk through key fields for adjustment

8. Copy files to target workspace
9. Log the clone operation in both workspaces' logs/decisions.md

10. Display summary:
```
================================================================

  Cloned from {source} to {target}

  Copied:
    [x] PILLARS.md (customized)
    [x] CHANNELS.md (as-is)
    [x] ENGAGEMENT.md (customized)
    [x] CALENDAR.md (as-is)

  Still needs setup:
    [ ] BRAND.md -- /social:onboard {target}
    [ ] AUDIENCE.md -- /social:onboard {target}
    [ ] TOV.md -- /social:onboard {target}

  >> Next: /social:onboard {target} (complete unique setup)

================================================================
```
</process>
