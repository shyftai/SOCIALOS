---
name: social:write
description: Write social content for any platform and format
argument-hint: "<workspace-name> [platform] [format]"
---
<objective>
Write social content. Load all context, ask platform and format, generate content with platform-specific optimization, validate against brand, present for approval.

Workspace and options: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // WRITE >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, PILLARS.md, TOV.md, CHANNELS.md, LEARNINGS.md
3. Load any pending brief from content/briefs/ -- if a brief exists, use it as the foundation
4. If no brief exists, ask for topic and create an inline brief

## Context loading
5. Load LEARNINGS.md -- check content learnings, format performance, anti-learnings
   - Check **content learnings** for what works on the target platform (hooks, formats, lengths, CTAs)
   - Check **anti-learnings** to avoid known failures (e.g. formats that underperform, tones that fall flat)
   - Surface relevant learnings before drafting:
     ```
     Applying learnings:
       [+] question hooks +40% engagement on LinkedIn
       [+] carousel posts outperform text 2:1 on this topic
       [-] threads >8 tweets drop off on Twitter — keeping to 5
       [-] promotional CTAs underperform soft asks by 3x
     ```
6. Load AUDIENCE.md -- understand who we're writing for
7. Load TOV.md -- apply voice rules, channel-specific guidelines, banned words
8. Load PILLARS.md -- ensure content aligns with a defined pillar

## Platform selection
9. If platform not specified in $ARGUMENTS, ask:
   - LinkedIn
   - Twitter / X
   - Instagram
   - TikTok
   - Newsletter
   - Multiple (will adapt for each)

## Format selection
10. If format not specified, suggest based on platform and topic:
    - Text post, Carousel, Thread, Reel script, Story, Newsletter, Long-form article

## Content generation
11. Draft content following platform-specific rules:

**LinkedIn:**
- Hook in first 2 lines (before "see more" fold)
- Line breaks for readability
- 1300 character sweet spot (can go to 3000)
- No more than 5 hashtags, placed at end
- Personal angle preferred over corporate
- End with engagement prompt or CTA

**Twitter / X:**
- 280 character limit per tweet
- Hook in first tweet -- stop the scroll
- If thread, number the tweets
- 1-2 hashtags maximum
- Conversational tone

**Instagram:**
- Caption up to 2200 characters
- Hook in first line (before "more" fold)
- Break into paragraphs with line breaks
- 20-30 hashtags (mix of sizes) in first comment, not caption
- Include CTA

**TikTok:**
- Script format: hook (0-3s), body, CTA
- Caption under 150 characters
- 3-5 hashtags
- Trending sound suggestion if applicable

12. Validate all content against:
    - BRAND.md -- messaging alignment, no off-brand language
    - TOV.md -- voice consistency, banned words check
    - PILLARS.md -- content maps to a defined pillar
    - Platform specs -- character limits, hashtag rules, link handling
    - LEARNINGS.md -- not repeating known failures

13. Display the draft with validation results:
```
+-- CONTENT DRAFT ----------------------------------------+
|                                                          |
|  Platform:  {platform}                                   |
|  Format:    {format}                                     |
|  Pillar:    {pillar}                                     |
|  Characters: {count} / {limit}                           |
|                                                          |
|  ---                                                     |
|  {content}                                               |
|  ---                                                     |
|                                                          |
|  Hashtags: {hashtags}                                    |
|  CTA: {call to action}                                   |
|                                                          |
|  Validation:                                             |
|    [x] Brand aligned                                     |
|    [x] Voice consistent                                  |
|    [x] Pillar mapped                                     |
|    [x] Platform specs met                                |
|    [x] No anti-learnings violated                        |
|                                                          |
+----------------------------------------------------------+
```

14. Check execution mode from workspace.config.md:
    - **Interactive:** Present with approval gate. Options: approve, edit, regenerate, cancel
    - **Auto:** Auto-approve, save, show `Auto-approved: content saved`

15. On approval, save to content/approved/{date}-{platform}-{slug}.md
16. Add copy integrity marker:
    ```
    <!-- approved: {ISO datetime} | approver: {interactive/auto} | platform: {platform} | fingerprint: {first-16-chars-of-content-hash} -->
    ```

17. Update CALENDAR.md if a date was set

18. Prompt for learning capture:
    ```
    Did this piece use a new technique worth logging? (yes/no)
    ```
    - If yes, ask what worked (or what was tried new) and append to LEARNINGS.md under the appropriate section
    - If no, continue to next action

19. Suggest next action:
```
================================================================

  Content saved to content/approved/{filename}

  >> Next: /social:schedule {ws}
     Also: /social:cross-post {ws} (adapt for other platforms)

================================================================
```
</process>
