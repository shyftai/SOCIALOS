---
name: social:engage
description: Daily engagement routine with targets and tracking
argument-hint: "<workspace-name>"
---
<objective>
Run the daily engagement routine. Show unresponded comments, suggest replies, provide proactive engagement targets, and track completion against daily quota.

Workspace: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // ENGAGE >>`
2. Load workspace context -- ENGAGEMENT.md, AUDIENCE.md, TOV.md, CHANNELS.md, BRAND.md
3. Load engagement targets from ENGAGEMENT.md (daily quotas per platform)
4. Load LEARNINGS.md -- focus on engagement section:
   - Apply engagement learnings to all response suggestions (e.g. "questions in replies drive 2x more follow-up")
   - Note which reply styles, tones, and formats have proven effective per platform
   - Avoid anti-learned engagement patterns (e.g. "generic thank-you replies get zero follow-up")

## Engagement queue
5. Scan for items needing response:

**Priority 1 -- Respond to your audience:**
- Unresponded comments on your posts (sorted by age, oldest first)
- Unread DMs and messages
- Mentions and tags
- Display count and age: "12 comments waiting (oldest: 8h ago)"

**Priority 2 -- Proactive engagement:**
- Target accounts to engage with (from ENGAGEMENT.md target list)
- Industry hashtags to participate in
- Trending conversations aligned with pillars
- Competitor audience posts to comment on (value-add, not promotional)

6. Display engagement dashboard:
```
+==============================================================+
|  ENGAGEMENT -- {Workspace} -- {date}                           |
+==============================================================+

  Your queue
    !! 5 comments waiting (oldest: 6h)    -- respond first
    >> 3 DMs unread                        -- respond today
    >> 2 mentions to acknowledge           -- respond today

  Proactive targets (daily quota: {N})
    [ ] Comment on {target account 1}'s latest post
    [ ] Engage in #{hashtag} conversation
    [ ] Reply to {industry leader}'s thread
    [ ] Like and comment on 5 posts in {niche}
    [ ] Share/repost 1 piece from your network

  Progress today
    Responded:  3/8 comments
    Proactive:  2/{quota} engagements
    Total:      5/{total target}

    ||||||||||||||||||||........  62%

================================================================
```

## Comment response workflow
7. For each unresponded comment, show:
```
  Comment on "{post title}" -- {platform} -- {time ago}
  From: {name}
  > "{comment text}"

  Type: {positive / question / negative / neutral}

  Suggested reply:
  "{draft reply}"

  >> (a)pprove / (e)dit / (s)kip / (n)ext
```

8. Apply TOV.md rules and LEARNINGS.md engagement patterns to all replies:
   - Match brand voice
   - Be genuine, not corporate
   - Add value in every response
   - Questions get answers, not redirects
   - Positive comments get genuine appreciation, not generic thanks

## Proactive engagement guidelines
9. For proactive engagement:
   - **Value-first**: every comment should add genuine value
   - **No self-promotion**: never plug your product in someone else's comments
   - **Be specific**: reference something specific in their post
   - **Ask questions**: genuine curiosity drives conversations
   - **Be a person**: write as a human, not a brand

10. Track completion:
   - Log each engagement action in engagement/log-{date}.md
   - Update progress counter after each action
   - When quota is met, display completion message

11. Track new engagement patterns discovered during session:
    - Note any reply styles that got unusually high follow-up or engagement
    - Note any approaches that fell flat
    - At session end, prompt: "Any new engagement patterns worth logging to LEARNINGS.md? (yes/no)"
    - If yes, append findings to LEARNINGS.md engagement section

12. End of session summary:
```
================================================================

  Engagement session complete

  Responded:  8/8 comments
  Proactive:  {N}/{quota} engagements
  Total:      {total}/{target}

  Time spent: {duration}

  >> Next: /social:analytics {ws} (check impact)
     Tomorrow: /social:engage {ws}

================================================================
```
</process>
