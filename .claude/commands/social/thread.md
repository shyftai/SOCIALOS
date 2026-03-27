---
name: social:thread
description: Write a thread for Twitter or LinkedIn
argument-hint: "<workspace-name> [topic]"
---
<objective>
Write a multi-post thread optimized for Twitter or LinkedIn. Hook tweet, numbered value points, summary tweet with CTA.

Workspace and topic: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // THREAD >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, PILLARS.md, TOV.md, CHANNELS.md, LEARNINGS.md
3. Check content/briefs/ for an existing brief on this topic

## Setup
4. If no topic in $ARGUMENTS, ask: "What's the topic for this thread?"
5. Ask platform:
   - **Twitter / X** -- 280 chars per tweet, conversational, fast-paced
   - **LinkedIn** -- longer posts per entry, professional, can include links

6. Ask thread length:
   - **Short** (5-7 tweets) -- quick insight or tip list
   - **Medium** (8-12 tweets) -- deeper exploration
   - **Long** (13-20 tweets) -- comprehensive guide or story

## Thread structure
7. Generate the thread:

**Tweet 1 -- Hook (critical):**
- This decides if anyone reads the rest
- Patterns that work: bold claim, surprising stat, personal story opener, "Here's what I learned", list promise ("7 things I wish I knew about X")
- Must stand alone as a great tweet even without the thread
- End with a thread indicator or implicit promise of more

**Tweets 2-N -- Value tweets:**
- One point per tweet
- Number them for readability (1/, 2/, etc.)
- Each tweet should deliver standalone value
- Use line breaks within tweets for readability
- Mix formats: insight, example, data point, story beat
- No filler tweets -- every tweet must earn its place

**Penultimate tweet -- Summary:**
- Recap the thread in a quick list or single takeaway
- "TL;DR:" format works well

**Final tweet -- CTA:**
- Ask for a specific action: retweet, follow, reply with their experience
- Link to relevant resource if appropriate
- "If you found this useful, follow @handle for more on {topic}"

8. Display the thread:
```
+-- THREAD: {topic} --------------------------------------+
|  Platform: {platform}  |  Tweets: {count}                |
|                                                          |
|  1/ {hook tweet}                                         |
|     [{char count}/280]                                   |
|                                                          |
|  2/ {value tweet}                                        |
|     [{char count}/280]                                   |
|                                                          |
|  3/ {value tweet}                                        |
|     [{char count}/280]                                   |
|                                                          |
|  ... (all tweets)                                        |
|                                                          |
|  {N}/ {CTA tweet}                                        |
|     [{char count}/280]                                   |
|                                                          |
+----------------------------------------------------------+
```

9. Validate:
   - Each tweet under character limit
   - Voice consistent with TOV.md
   - Brand aligned
   - No banned words or phrases
   - Hook tweet is genuinely compelling (not clickbait)

10. Check execution mode:
    - **Interactive:** Present for approval with options: approve, edit specific tweet, regenerate hook, cancel
    - **Auto:** Auto-approve and save

11. On approval, save to content/approved/{date}-thread-{slug}.md
12. Update CALENDAR.md

13. Suggest next action:
```
================================================================

  Thread saved ({N} tweets)

  >> Next: /social:schedule {ws}
     Also: /social:repurpose {ws} (turn into carousel or post)

================================================================
```
</process>
