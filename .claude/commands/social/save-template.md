---
name: social:save-template
description: Save a proven content format as a reusable template
argument-hint: "<workspace-name> [post-url|content-file]"
---
<objective>
Save a proven social content format as a reusable template. Strips the specific content, preserves the structure, hooks, CTA patterns, and formatting. Includes performance data so future content can replicate what works.

Workspace and source content: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/platform-specs.md
@./.claude/socialos/references/content-frameworks.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // TEMPLATE SAVE >>`
2. Load workspace context -- BRAND.md, PILLARS.md, TOV.md, CHANNELS.md, LEARNINGS.md
3. Load content-frameworks.md for structural references

## Source identification
4. Ask what to save (if not specified in $ARGUMENTS):
   - **Published post** -- a specific post that performed well
   - **Carousel structure** -- slide-by-slide layout pattern
   - **Thread format** -- tweet/post sequence with transition patterns
   - **Newsletter layout** -- section structure, header/body/CTA flow
   - **Engagement response** -- reply template, comment framework, DM sequence
   - **Content series** -- recurring format (e.g. "Monday Myth Busters", "Friday Frameworks")

5. Locate the source content:
   - Check content/approved/ and content/published/ for the file
   - If a URL is provided, load the post content and metrics
   - If the user pastes content directly, use that

6. Load performance data for the source content:
   - Impressions, reach, engagement rate
   - Saves, shares, comments (high-intent signals)
   - Follower growth attributed to this post
   - How it compares to workspace average

## Structure extraction
7. Extract the reusable structure from the content:

**For text posts:**
- Hook pattern (question, bold claim, story opener, statistic, contrarian take)
- Body structure (list, narrative, problem-solution, framework, before-after)
- Transition patterns between sections
- Line break and whitespace rhythm
- CTA type and placement
- Hashtag strategy

**For carousels:**
- Number of slides
- Cover slide pattern (hook type, visual style)
- Slide-by-slide structure (e.g. "Slide 1: hook question, Slide 2: context, Slides 3-7: points, Slide 8: summary, Slide 9: CTA")
- Text density per slide
- Visual element notes

**For threads:**
- Number of posts in thread
- First post hook pattern
- Transition between posts (numbering, connectors, cliffhangers)
- Thread arc (setup → build → payoff)
- Final post CTA pattern

**For newsletters:**
- Subject line pattern
- Preview text pattern
- Section structure (intro, body sections, CTA, sign-off)
- Tone shifts between sections
- Link placement strategy

**For engagement responses:**
- Trigger type (what kind of comment/DM this responds to)
- Response structure
- Tone calibration
- Escalation path (if applicable)

8. Generalize content into placeholders:
   - Specific claims → `[KEY CLAIM]`
   - Company references → `[BRAND/PRODUCT]`
   - Data points → `[STAT / PROOF POINT]`
   - Stories → `[PERSONAL STORY / ANECDOTE]`
   - Pain points → `[AUDIENCE PAIN POINT]`
   - Benefits → `[KEY BENEFIT]`
   - CTAs → `[CTA — type: {soft ask / direct / question}]`
   - Keep structural elements, line breaks, and formatting as-is
   - Add annotation comments explaining why each section works

## Template metadata
9. Attach template metadata:
```
## Template metadata
- **Name:** {template-name}
- **Platform:** {LinkedIn / Twitter / Instagram / TikTok / Newsletter / Multi}
- **Content type:** {text post / carousel / thread / reel script / newsletter / engagement response}
- **Pillar:** {content pillar this maps to, or "any"}
- **Structure:** {e.g. "hook-question → 5-point list → soft CTA"}
- **Source post:** {file path or URL}
- **Performance:**
  - Impressions: {n}
  - Engagement rate: {pct}% (workspace avg: {pct}%)
  - Saves/shares: {n}
  - Index vs. avg: {multiplier}x
- **Best for:** {topic types, audience segments, or goals}
- **Key insight:** {what made this format work}
- **Created:** {date}
```

## Preview and approval
10. Display template preview:
```
+==============================================================+
|  TEMPLATE SAVE -- {template-name}                              |
+==============================================================+

  Platform:     {platform}
  Type:         {content type}
  Pillar:       {pillar}
  Performance:  {eng rate}% engagement ({multiplier}x avg)

  Structure:
    [HOOK -- {hook type}: {pattern description}]

    {body structure with placeholders and annotations}

    [CTA -- {cta type}: {pattern description}]

  Annotations:  {n} comments explaining why each element works
  Placeholders: {n} fields to fill when using

  >> Save? (y/n)

================================================================
```

11. On approval:
    - Create global/templates/ directory if it doesn't exist
    - Save to global/templates/{template-name}.md
    - Log in LEARNINGS.md: "Template saved: {name} -- {eng rate}% engagement on {platform} ({content type})"

## Snippet extraction
12. Check if hooks or CTAs should be extracted to snippet-library.md:
    - If the hook pattern is reusable across topics → add to snippet-library.md under "Hooks"
    - If the CTA pattern is reusable → add to snippet-library.md under "CTAs"
    - If a transition phrase works well → add to snippet-library.md under "Transitions"
    - Tag each snippet with platform, performance, and source template

13. Display confirmation:
```
================================================================

  Template saved to: global/templates/{template-name}.md
  {n} snippets extracted to snippet-library.md

  >> Use it:  /social:use-template {ws} {template-name}
  >> Browse:  ls global/templates/
  >> Write:   /social:write {ws} (template available in format selection)

================================================================
```
</process>
