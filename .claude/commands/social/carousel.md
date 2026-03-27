---
name: social:carousel
description: Create carousel content for LinkedIn or Instagram
argument-hint: "<workspace-name> [topic]"
---
<objective>
Create structured carousel content with slide-by-slide layout. Optimized for LinkedIn and Instagram carousel formats.

Workspace and topic: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // CAROUSEL >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, PILLARS.md, TOV.md, CHANNELS.md, LEARNINGS.md
3. Check content/briefs/ for an existing brief on this topic

## Setup
4. If no topic in $ARGUMENTS, ask: "What's the topic for this carousel?"
5. Ask platform:
   - **LinkedIn** -- up to 20 slides, PDF format, professional tone
   - **Instagram** -- up to 10 slides, image format, visual-first

6. Ask carousel type:
   - **Educational** -- teach a concept step by step
   - **Listicle** -- numbered tips, tools, or examples
   - **Story** -- narrative arc with a lesson
   - **Framework** -- introduce a model or process
   - **Myth-busting** -- challenge assumptions
   - **Before/After** -- show transformation
   - **Case study** -- real example with results

## Slide structure
7. Generate slide-by-slide content:

**Slide 1 -- Hook (most important):**
- Bold, attention-grabbing headline
- Subtext that creates curiosity or promises value
- No logo dump -- earn the swipe
- Pattern: question, bold claim, surprising stat, or contrarian take

**Slides 2-N -- Value slides:**
- One idea per slide
- Headline + supporting text (keep under 50 words per slide)
- Use numbered lists for listicles
- Visual hierarchy: headline largest, supporting text smaller
- Each slide should make sense on its own (people screenshot individual slides)

**Penultimate slide -- Summary (optional):**
- Recap the key points
- Reinforce the main takeaway

**Final slide -- CTA:**
- Clear call to action (follow, comment, save, share, link in bio)
- Profile tag or handle
- Don't be generic -- make the CTA specific to the content

8. Display the carousel:
```
+-- CAROUSEL: {topic} ------------------------------------+
|  Platform: {platform}  |  Slides: {count}  |  Type: {type}
|                                                          |
|  SLIDE 1 (Hook)                                          |
|  +-------------------------------------------------+     |
|  | {headline}                                       |     |
|  |                                                  |     |
|  | {subtext}                                        |     |
|  +-------------------------------------------------+     |
|                                                          |
|  SLIDE 2                                                 |
|  +-------------------------------------------------+     |
|  | {headline}                                       |     |
|  |                                                  |     |
|  | {body text}                                      |     |
|  +-------------------------------------------------+     |
|                                                          |
|  ... (all slides)                                        |
|                                                          |
|  SLIDE {N} (CTA)                                         |
|  +-------------------------------------------------+     |
|  | {CTA headline}                                   |     |
|  |                                                  |     |
|  | {action + handle}                                |     |
|  +-------------------------------------------------+     |
|                                                          |
|  Caption:                                                |
|  {post caption to accompany the carousel}                |
|                                                          |
|  Hashtags: {hashtags}                                    |
+----------------------------------------------------------+
```

9. Validate against brand and voice guidelines
10. Cross-reference with LEARNINGS.md for carousel-specific insights

11. Check execution mode:
    - **Interactive:** Present for approval with options: approve, edit specific slide, regenerate, cancel
    - **Auto:** Auto-approve and save

12. On approval, save to content/approved/{date}-carousel-{slug}.md
13. Update CALENDAR.md

14. Suggest next action:
```
================================================================

  Carousel saved ({N} slides)

  >> Next: /social:schedule {ws}
     Also: /social:cross-post {ws} (adapt for {other platform})

================================================================
```
</process>
