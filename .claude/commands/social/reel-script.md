---
name: social:reel-script
description: Write a reel or short video script with hook, body, and CTA
argument-hint: "<workspace-name> [topic]"
---
<objective>
Write a reel or short-form video script. Structured with a hook (first 3 seconds), body, CTA, caption, hashtags, and sound suggestion.

Workspace and topic: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // REEL SCRIPT >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, PILLARS.md, TOV.md, CHANNELS.md, LEARNINGS.md
3. Check content/briefs/ for an existing brief on this topic

## Setup
4. If no topic in $ARGUMENTS, ask: "What's the topic for this reel?"
5. Ask platform:
   - **Instagram Reels** -- up to 90 seconds, vertical, visual
   - **TikTok** -- up to 10 minutes (sweet spot 30-60s), trend-driven
   - **YouTube Shorts** -- up to 60 seconds, discoverability focus
   - **LinkedIn Video** -- up to 10 minutes (sweet spot 30-90s), professional

6. Ask video style:
   - **Talking head** -- speaking directly to camera
   - **Screen recording** -- showing a process or tool
   - **B-roll with voiceover** -- visual footage with narration
   - **Text overlay** -- text on screen with music/sound
   - **Skit / scenario** -- acting out a situation

7. Ask target duration:
   - **15 seconds** -- ultra-short, one idea
   - **30 seconds** -- quick tip or insight
   - **60 seconds** -- deeper explanation or story
   - **90+ seconds** -- full walkthrough or narrative

## Script generation
8. Generate the script:

**HOOK (0-3 seconds) -- most critical:**
- Must stop the scroll immediately
- Patterns: shocking statement, question, "Stop doing X", visual surprise, relatable pain point
- Text on screen in first frame
- No slow intros or greetings

**BODY (3s to CTA):**
- One core idea only -- don't try to cover everything
- Use pattern interrupts every 5-10 seconds to maintain retention
- Structured as: setup > tension/problem > resolution/insight
- Include B-roll or visual change suggestions at each beat
- Keep sentences short and punchy for spoken delivery

**CTA (last 3-5 seconds):**
- Specific action: follow, comment, save, share, link in bio
- Make it feel natural, not forced
- Can be verbal, text overlay, or both

9. Display the script:
```
+-- REEL SCRIPT: {topic} ---------------------------------+
|  Platform: {platform}  |  Duration: {seconds}s           |
|  Style: {style}        |  Pillar: {pillar}               |
|                                                          |
|  HOOK (0:00 - 0:03)                                     |
|  Visual: {what's on screen}                              |
|  Text:   {text overlay}                                  |
|  Audio:  "{spoken words}"                                |
|                                                          |
|  BODY (0:03 - 0:{N})                                    |
|  [0:03] Visual: {description}                            |
|         Audio: "{spoken words}"                          |
|  [0:08] Visual: {change / B-roll}                        |
|         Audio: "{spoken words}"                          |
|  [0:15] Visual: {description}                            |
|         Audio: "{spoken words}"                          |
|  ... (all beats)                                         |
|                                                          |
|  CTA (0:{N} - 0:{end})                                  |
|  Visual: {what's on screen}                              |
|  Text:   {text overlay}                                  |
|  Audio:  "{spoken words}"                                |
|                                                          |
|  ---                                                     |
|                                                          |
|  Caption:                                                |
|  {post caption}                                          |
|                                                          |
|  Hashtags: {hashtags}                                    |
|                                                          |
|  Sound suggestion: {trending sound or music style}       |
|                                                          |
|  Word count: {count}  |  Est. speaking time: {seconds}s  |
|                                                          |
+----------------------------------------------------------+
```

10. Validate:
    - Script fits target duration (approx 150 words per minute for spoken)
    - Voice matches TOV.md
    - Brand aligned
    - Hook is genuinely scroll-stopping
    - CTA is clear and specific

11. Check execution mode:
    - **Interactive:** Present for approval with options: approve, edit section, regenerate hook, cancel
    - **Auto:** Auto-approve and save

12. On approval, save to content/approved/{date}-reel-{slug}.md
13. Update CALENDAR.md

14. Suggest next action:
```
================================================================

  Reel script saved ({duration}s, {style})

  >> Next: /social:schedule {ws}
     Also: /social:repurpose {ws} (turn into carousel or text post)

================================================================
```
</process>
