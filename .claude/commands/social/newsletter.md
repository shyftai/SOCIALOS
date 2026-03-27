---
name: social:newsletter
description: Create newsletter content with subject line, body, and CTA
argument-hint: "<workspace-name> [type]"
---
<objective>
Create newsletter content. Select type (curated, original, or update), generate subject line options, preview text, body, and CTA.

Workspace and type: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // NEWSLETTER >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, TOV.md, NEWSLETTER.md, LEARNINGS.md
3. Load NEWSLETTER.md for format, frequency, sections, and audience preferences

## Setup
4. If type not specified, ask:
   - **Curated** -- collected links, resources, and commentary
   - **Original** -- essay, guide, or deep-dive on a topic
   - **Update** -- company news, product updates, behind-the-scenes
   - **Hybrid** -- mix of original content and curated links

5. Ask topic or theme for this issue

6. Load previous newsletters from content/newsletters/ for:
   - Consistent formatting
   - Topics already covered (avoid repetition)
   - Subject line patterns that performed well

## Content generation
7. Generate subject line options (3-5):
   - Each under 50 characters
   - Variety: curiosity gap, benefit-driven, question, number, personal
   - Highlight recommended option based on LEARNINGS.md patterns
   - Mark the recommended one with [recommended]

8. Generate preview text (2-3 options):
   - Complements the subject line (doesn't repeat it)
   - Under 100 characters
   - Creates additional reason to open

9. Generate newsletter body following the structure from NEWSLETTER.md:

**Curated format:**
- Introduction (2-3 sentences setting the theme)
- 5-7 curated items, each with:
  - Source and link
  - Summary (2-3 sentences)
  - Your take / why it matters (1-2 sentences)
- Closing thought
- CTA

**Original format:**
- Hook opening (first paragraph must earn the read)
- Body with clear sections/headers
- Key takeaways or action items
- CTA

**Update format:**
- Quick intro
- News items (most important first)
- What's coming next
- CTA

10. Generate CTA:
    - Aligned with newsletter goal (grow list, drive engagement, sell, educate)
    - Specific action (reply, share, visit, try)
    - Not generic -- tied to the content

11. Display the newsletter:
```
+-- NEWSLETTER: Issue #{N} --------------------------------+
|  Type: {type}  |  Est. read time: {minutes} min          |
|                                                          |
|  Subject lines:                                          |
|    1. {option} [recommended]                             |
|    2. {option}                                           |
|    3. {option}                                           |
|                                                          |
|  Preview text: {selected preview}                        |
|                                                          |
|  ---                                                     |
|                                                          |
|  {full newsletter body}                                  |
|                                                          |
|  ---                                                     |
|                                                          |
|  CTA: {call to action}                                   |
|                                                          |
|  Validation:                                             |
|    [x] Voice consistent                                  |
|    [x] Brand aligned                                     |
|    [x] No topic repetition with recent issues            |
|    [x] Read time within target                           |
|    [x] Links verified                                    |
|                                                          |
+----------------------------------------------------------+
```

12. Check execution mode:
    - **Interactive:** Present for approval. Options: approve, edit, change subject line, regenerate, cancel
    - **Auto:** Auto-approve and save

13. On approval:
    - Save to content/newsletters/{date}-issue-{N}.md
    - Update CALENDAR.md
    - If newsletter tool connected (Beehiiv, ConvertKit, Substack), offer to push draft

14. Suggest next action:
```
================================================================

  Newsletter saved (Issue #{N}, {type})

  >> Next: /social:schedule {ws} (set send time)
     Also: /social:repurpose {ws} (extract social posts from newsletter)

================================================================
```
</process>
