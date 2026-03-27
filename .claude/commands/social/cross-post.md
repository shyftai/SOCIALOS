---
name: social:cross-post
description: Adapt and post content across multiple platforms
argument-hint: "<workspace-name> [content-file]"
---
<objective>
Take existing content and adapt it for multiple platforms. Platform-native adaptation, not copy-paste. Each version is optimized for its target platform.

Workspace and content: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // CROSS-POST >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, TOV.md, CHANNELS.md, LEARNINGS.md
3. Load source content from content/approved/ or content/published/

## Content selection
4. If content file not specified:
   - List recent approved/published content
   - Ask which piece to cross-post

5. Identify source platform and format from the content file

6. Ask target platforms (multi-select):
   - LinkedIn
   - Twitter / X
   - Instagram
   - TikTok
   - Newsletter excerpt

## Platform adaptation
7. For each target platform, adapt the content natively:

**LinkedIn original to Twitter:**
- Extract core insight
- Condense to 280 characters or create a short thread
- Make tone more conversational
- Reduce hashtags to 1-2

**LinkedIn original to Instagram:**
- Extract into carousel slides or single visual caption
- Add visual direction notes
- Expand hashtags to 20-30 (first comment)
- Add "Link in bio" if referencing URL

**Thread to Carousel:**
- Map tweets to slides
- Add visual design notes per slide
- Create hook slide from first tweet
- Add CTA slide

**Long-form to Short-form:**
- Pull the single most compelling insight
- Create a hook around it
- Platform-appropriate length and tone

**Any to Newsletter excerpt:**
- Summarize as a section within a newsletter
- Add commentary and context
- Link back to original post

8. Display all adaptations side by side:
```
+-- CROSS-POST: {source title} ----------------------------+
|                                                           |
|  Source: {platform} ({format})                            |
|                                                           |
|  --- LinkedIn version ---                                 |
|  {adapted content}                                        |
|  Hashtags: {hashtags}                                     |
|  Characters: {count}/{limit}                              |
|                                                           |
|  --- Twitter version ---                                  |
|  {adapted content}                                        |
|  Characters: {count}/280                                  |
|                                                           |
|  --- Instagram version ---                                |
|  {adapted content}                                        |
|  Hashtags: {hashtags}                                     |
|                                                           |
+-----------------------------------------------------------+
```

9. Validate each adaptation:
   - Platform specs (character limits, hashtag counts)
   - Voice consistency across platforms (same brand, different tone per channel)
   - No direct copy-paste between platforms
   - Each version adds platform-native elements

10. Check execution mode:
    - **Interactive:** Present each adaptation for individual approval
    - **Auto:** Auto-approve all, save, show summary

11. On approval:
    - Save each adaptation to content/approved/{date}-{platform}-{slug}.md
    - Update CALENDAR.md for each platform

12. Suggest scheduling:
```
================================================================

  Cross-posted to {N} platforms

  >> Next: /social:schedule {ws} (schedule all adaptations)
     Tip: Stagger posts across days for maximum reach

================================================================
```
</process>
