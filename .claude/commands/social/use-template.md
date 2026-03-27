---
name: social:use-template
description: Create new content from a saved template
argument-hint: "<workspace-name> [template-name]"
---
<objective>
Load a saved content template and generate new content from it. Fill placeholders with workspace-specific details, apply brand voice and platform specs, validate against brief, and present for approval.

Workspace and optional template: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/social-writing-skill.md
@./.claude/socialos/references/platform-specs.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // TEMPLATE USE >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, TOV.md, PILLARS.md, CHANNELS.md, LEARNINGS.md

## Template selection
3. If template name provided in $ARGUMENTS, load from global/templates/{template-name}.md
4. If no template specified, list available templates:

```
+==============================================================+
|  AVAILABLE TEMPLATES                                           |
+==============================================================+

  #   Name                Platform    Type        Eng Rate  Pillar
  1.  hook-question-list  LinkedIn    Text post   8.2%      Any
  2.  myth-buster         Twitter     Thread      5.1%      Education
  3.  behind-the-scenes   Instagram   Carousel    12.4%     Culture
  4.  weekly-roundup      Newsletter  Layout      42% open  Curation
  5.  framework-carousel  LinkedIn    Carousel    9.7%      Thought Leadership

  >> Select by number or name:

================================================================
```

5. User selects template
6. Load template file -- structure, placeholders, annotations, and metadata

## Context loading
7. Load all relevant workspace files for content generation:
   - BRAND.md -- messaging, positioning, value props
   - AUDIENCE.md -- who we're writing for, their pain points, language
   - TOV.md -- voice rules, platform-specific tone, banned words
   - PILLARS.md -- content pillars and themes
   - LEARNINGS.md -- what's working, what's not, anti-learnings
   - CHANNELS.md -- platform-specific strategy and posting norms

8. Display template structure with annotations:
```
+-- TEMPLATE: {template-name} -----------------------------------+
|                                                                  |
|  Platform:    {platform}                                         |
|  Type:        {content type}                                     |
|  Performance: {eng rate}% ({multiplier}x avg)                    |
|  Key insight: {why this works}                                   |
|                                                                  |
|  Structure:                                                      |
|    1. [HOOK] -- {hook type}                                      |
|    2. [BODY] -- {body structure}                                 |
|    3. [CTA]  -- {cta type}                                       |
|                                                                  |
|  Placeholders to fill: {n}                                       |
|                                                                  |
+------------------------------------------------------------------+
```

## Content input
9. Ask for the content inputs:
   - **Topic / angle:** What is this post about?
   - **Key message:** What's the one takeaway?
   - **Pillar:** Which content pillar? (suggest based on template)
   - **Proof points:** Any stats, stories, or examples to include?
   - **CTA goal:** What should the audience do? (engage, click, save, share, DM)
   - **Publish date:** When is this going out? (for calendar awareness)

## Content generation
10. Generate content by filling the template:
    - Replace all placeholders with workspace-specific content
    - Follow the template's structural pattern exactly (line breaks, rhythm, slide count)
    - Apply TOV.md voice rules -- adjust tone for platform
    - Use AUDIENCE.md language -- match their vocabulary and pain points
    - Pull from BRAND.md for positioning and proof points
    - Weave in LEARNINGS.md patterns that improve performance
    - Avoid all anti-learnings from LEARNINGS.md

11. Apply platform-specific rules:

**LinkedIn:**
- Hook in first 2 lines (before "see more" fold)
- Line breaks for readability
- 1300 character sweet spot (can go to 3000)
- No more than 5 hashtags at end
- End with engagement prompt or CTA

**Twitter / X:**
- 280 character limit per tweet
- Hook in first tweet
- If thread, number the tweets
- 1-2 hashtags maximum

**Instagram:**
- Caption up to 2200 characters
- Hook in first line
- 20-30 hashtags in first comment, not caption
- Include CTA

**Newsletter:**
- Subject line optimized for open rate
- Preview text supports subject line
- Scannable sections with clear headers
- Single primary CTA per section

## Validation
12. Validate generated content against:
    - **Template fidelity** -- does it follow the template structure?
    - **Brand alignment** -- BRAND.md messaging check
    - **Voice consistency** -- TOV.md rules, banned words
    - **Pillar mapping** -- maps to a defined content pillar
    - **Platform specs** -- character limits, hashtag rules, formatting
    - **No anti-learnings** -- doesn't repeat known failures
    - **Brief adherence** -- if a brief was loaded, content matches intent

13. Display the draft with validation:
```
+==============================================================+
|  CONTENT DRAFT -- from template: {template-name}               |
+==============================================================+

  Platform:    {platform}
  Format:      {content type}
  Pillar:      {pillar}
  Characters:  {count} / {limit}
  Template:    {template-name} ({eng rate}% historical)

  ---
  {generated content}
  ---

  Hashtags: {hashtags}
  CTA: {call to action}

  Validation:
    [x] Template structure followed
    [x] Brand aligned
    [x] Voice consistent
    [x] Pillar mapped
    [x] Platform specs met
    [x] No anti-learnings violated

================================================================
```

## Approval and save
14. Check execution mode from workspace.config.md:
    - **Interactive:** Present with approval gate. Options: approve, edit, regenerate, cancel
    - **Auto:** Auto-approve, save, show `Auto-approved: content saved`

15. On "edit" -- ask what to change, regenerate specific sections while keeping template structure
16. On "regenerate" -- create a fresh version from the same template with different angle

17. On approval:
    - Save to content/drafts/{date}-{platform}-{slug}.md or content/approved/{date}-{platform}-{slug}.md based on user choice
    - Add copy integrity marker:
    ```
    <!-- approved: {ISO datetime} | approver: {interactive/auto} | platform: {platform} | template: {template-name} | fingerprint: {first-16-chars-of-content-hash} -->
    ```

18. Update CALENDAR.md if a publish date was set
19. Update template usage log in global/templates/{template-name}.md:
    - Increment usage count
    - Add reference to generated content

20. Suggest next action:
```
================================================================

  Content saved to content/{drafts|approved}/{filename}
  Template: {template-name} (used {n} times)

  >> Next: /social:schedule {ws}
     Also: /social:cross-post {ws} (adapt for other platforms)
     Also: /social:ab-test {ws} (test a variation)

================================================================
```
</process>
