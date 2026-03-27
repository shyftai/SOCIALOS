---
name: social:community
description: Community engagement across Reddit, Discord, Slack, and forums
argument-hint: "<workspace-name> [platform]"
---
<objective>
Manage community participation across Reddit, Discord, Slack communities, and forums. Value-first engagement, not promotional. Build reputation through genuine contribution.

Workspace and platform: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // COMMUNITY >>`
2. Load workspace context -- ENGAGEMENT.md, AUDIENCE.md, TOV.md, BRAND.md, PILLARS.md
3. Load community targets from ENGAGEMENT.md (subreddits, Discord servers, Slack groups, forums)

## Community setup (first run)
4. If no community targets configured, ask:
   - "Which communities does your audience hang out in?"
   - Platforms: Reddit, Discord, Slack, Indie Hackers, Hacker News, niche forums
   - For each: specific community name/URL
   - Save to ENGAGEMENT.md under community targets

## Daily community routine
5. Display community dashboard:
```
+-- COMMUNITY -- {Workspace} ------------------------------+
|                                                           |
|  Active communities:                                      |
|    Reddit    r/{subreddit1}, r/{subreddit2}               |
|    Discord   {server1}, {server2}                         |
|    Slack     {community1}                                 |
|                                                           |
|  Today's targets:                                         |
|    [ ] Answer 2 questions in r/{subreddit}                |
|    [ ] Participate in 1 Discord thread                    |
|    [ ] Share insight in {Slack community}                  |
|                                                           |
|  Rules:                                                   |
|    -- Value first, promotion never (in communities)       |
|    -- Build reputation through expertise                  |
|    -- 10:1 ratio: 10 value posts for every 1 mention      |
|    -- Be genuinely helpful, not strategically helpful     |
|                                                           |
+-----------------------------------------------------------+
```

## Engagement workflow
6. For each community, surface opportunities:

**Reddit:**
- Scan target subreddits for questions matching your expertise
- Draft helpful responses that demonstrate knowledge
- Never link to your product unless directly asked
- Check subreddit rules before posting
- Track karma and reputation

**Discord:**
- Identify active threads in target servers
- Draft thoughtful contributions
- Help newcomers with questions
- Share relevant resources (not your own unless asked)

**Slack communities:**
- Monitor channels for relevant conversations
- Draft responses that add genuine value
- Share learnings and insights from your domain
- Offer help proactively

7. For each opportunity, draft a response:
```
  Community: {platform} -- {community name}
  Thread: "{topic}"
  Context: "{what they're asking/discussing}"

  Draft response:
  "{response}"

  Tone check: {matches TOV.md community voice}
  Self-promo check: {none / flagged}

  >> (a)pprove / (e)dit / (s)kip
```

8. Self-promotion guard:
   - Flag any response that mentions your product, company, or links
   - Allow only if the community context explicitly asks for tool recommendations
   - Default: remove any promotional elements

9. Track community reputation:
   - Log contributions in engagement/community-log-{date}.md
   - Track helpful posts vs. promotional mentions (maintain 10:1 ratio)
   - Note threads that generated inbound interest organically

10. End of session:
```
================================================================

  Community engagement complete

  Contributions: {N} across {N} communities
  Promotional mentions: {count} (target: 0)
  Ratio: {helpful}:{promotional}

  >> Next: /social:engage {ws} (continue daily engagement)

================================================================
```
</process>
