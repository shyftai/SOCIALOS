---
name: social:brief
description: Create a content brief for a specific piece of content
argument-hint: "<workspace-name> [topic]"
---
<objective>
Create a structured content brief that defines everything needed to produce a single piece of content. The brief becomes the contract between strategy and creation.

Workspace and topic: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // CONTENT BRIEF >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, PILLARS.md, TOV.md, CHANNELS.md, LEARNINGS.md
3. Display workspace header

## Context deepening
4. Load LEARNINGS.md explicitly -- before any brief decisions:
   - Review **past performance data** by platform and format to inform recommendations
   - Note top-performing content types, hooks, and formats for the target platform
   - Identify **anti-learnings** relevant to the proposed topic or format
   - Flag conflicts early: if the proposed format has anti-learnings, surface them:
     ```
     !! Anti-learning: long-form threads on Twitter drop engagement after tweet 6
        Consider: single tweet with image or short thread (3-4 tweets) instead
     ```

## Brief creation
5. If topic provided in $ARGUMENTS, use it. Otherwise ask: "What's the topic or idea for this piece?"

6. Ask platform (or detect from context):
   - LinkedIn
   - Twitter / X
   - Instagram
   - TikTok
   - Newsletter
   - Multiple (will generate platform-specific briefs)

7. Ask format:
   - **Text post** -- single post with optional image
   - **Carousel** -- multi-slide visual content
   - **Thread** -- multi-post connected narrative
   - **Reel / Short video** -- vertical video script
   - **Story** -- ephemeral content
   - **Newsletter** -- email content
   - **Long-form** -- LinkedIn article or blog post

8. Ask goal (select one):
   - Awareness -- reach new audience
   - Engagement -- drive comments and shares
   - Authority -- establish expertise
   - Lead generation -- drive signups or demos
   - Community -- spark conversation
   - Education -- teach something specific

9. Generate the brief (reference LEARNINGS.md performance data when suggesting format and structure):
```
+-- CONTENT BRIEF ----------------------------------------+
|                                                          |
|  Topic:       {topic}                                    |
|  Platform:    {platform}                                 |
|  Format:      {format}                                   |
|  Goal:        {goal}                                     |
|  Pillar:      {matched pillar from PILLARS.md}           |
|  Audience:    {target segment from AUDIENCE.md}          |
|                                                          |
|  Key message:                                            |
|  {One sentence -- the single takeaway}                   |
|                                                          |
|  Supporting points:                                      |
|  1. {point}                                              |
|  2. {point}                                              |
|  3. {point}                                              |
|                                                          |
|  CTA:         {what the reader should do}                |
|  Hashtags:    {3-5 relevant hashtags}                    |
|  References:  {links, data, quotes to include}           |
|                                                          |
|  Voice notes: {specific TOV guidance for this piece}     |
|  Anti-notes:  {what to avoid -- from LEARNINGS.md}       |
|                                                          |
|  Due date:    {from calendar or ask}                     |
|                                                          |
+----------------------------------------------------------+
```

10. Cross-reference with LEARNINGS.md:
   - If similar content was created before, surface what worked and what didn't
   - If the format has performance data, include benchmark expectations

11. Check CALENDAR.md for scheduling:
    - Suggest optimal posting time based on platform and audience
    - Flag if there's a conflict or gap this brief could fill

12. Check execution mode from workspace.config.md:
    - **Interactive:** Present brief for approval. On approval, save to content/briefs/
    - **Auto:** Auto-approve, save to content/briefs/, show `Auto-approved: brief saved`

13. Save brief to content/briefs/{date}-{topic-slug}.md
14. Update CALENDAR.md with the planned content

15. Suggest next action:
```
================================================================

  Brief saved to content/briefs/{filename}

  >> Next: /social:write {ws}
     Also: /social:carousel {ws} or /social:thread {ws}

================================================================
```
</process>
