# Audience Scoring Model -- SOCIAL:OS

SOCIAL:OS uses a weighted scoring model to prioritize audiences, creators, and communities for engagement. Score before engaging -- spend attention where it compounds.

**Override:** Users can change weights, factors, or thresholds in workspace RULES.md under `## Audience scoring overrides`. If no overrides exist, use the defaults below.

---

## Scoring dimensions (0-100)

| Dimension | Weight | Max points | What it measures |
|-----------|--------|------------|-----------------|
| Relevance to brand | 30% | 30 | Topic alignment, audience overlap, industry match |
| Engagement quality | 25% | 25 | Comment depth, share-to-like ratio, conversation quality |
| Reach potential | 20% | 20 | Follower count, growth rate, cross-platform presence |
| Accessibility | 15% | 15 | Responsiveness, open DMs, collaboration history |
| Timing | 10% | 10 | Recent activity, trending relevance, upcoming events |

**Total: 100 points**

---

## Relevance to brand (0-30)

Score based on how closely the target aligns with your brand's topic space, audience, and industry. Read workspace TOV.md and PILLARS.md before scoring -- relevance is defined by what is written there, not assumed.

| Factor | Points | Criteria |
|--------|--------|----------|
| Topic alignment | 0-12 | 12 = creates content directly in your pillar topics, 6 = adjacent topics with overlap, 3 = tangentially related, 0 = no overlap |
| Audience overlap | 0-10 | 10 = their followers match your target audience profile, 5 = partial overlap, 0 = different audience entirely |
| Industry match | 0-8 | 8 = same industry/niche, 4 = adjacent industry, 0 = unrelated |

**How to assess:** Check their last 20 posts. If 60%+ match your pillar topics, score 10-12 on topic alignment. If their follower demographics (visible via platform analytics or manual review) overlap with your ICP, score 7-10 on audience overlap.

---

## Engagement quality (0-25)

Score based on the quality of engagement they generate -- not vanity metrics.

| Factor | Points | Criteria |
|--------|--------|----------|
| Comment depth | 0-10 | 10 = comments are multi-sentence, ask questions, share experiences; 5 = short but genuine reactions; 0 = "nice post" or emoji-only spam |
| Share-to-like ratio | 0-7 | 7 = shares/reposts exceed 5% of likes (high signal); 4 = 1-5% share ratio; 0 = likes only, no shares |
| Conversation starters | 0-8 | 8 = posts regularly spark threads of 10+ back-and-forth comments; 4 = occasional discussion; 0 = one-way broadcast |

**Assessment method:** Review 10 recent posts. Calculate average comment-to-like ratio and share-to-like ratio. Read the top 5 comment threads -- are people debating, asking questions, sharing their own experiences? That is quality engagement.

**Platform-specific notes:**
- LinkedIn: weight comment depth highest -- LinkedIn algorithm rewards meaningful comments
- Twitter/X: weight share-to-like ratio highest -- retweets/quotes amplify reach
- Instagram: weight saves and shares over likes -- saves indicate high-value content
- TikTok: weight completion rate over likes -- algorithm prioritizes watch time

---

## Reach potential (0-20)

Score based on audience size, growth trajectory, and cross-platform presence.

| Factor | Points | Criteria |
|--------|--------|----------|
| Follower count tier | 0-8 | See creator tier table below. Points are not linear -- micro creators with high engagement outscore large creators with low engagement |
| Growth rate | 0-7 | 7 = growing 10%+ month-over-month; 4 = steady 2-10% growth; 1 = flat; 0 = declining |
| Cross-platform presence | 0-5 | 5 = active on 3+ platforms with consistent audience; 3 = active on 2 platforms; 1 = single platform only |

**Follower count scoring (adjusted for engagement):**

| Tier | Follower range | Base points | Engagement multiplier |
|------|---------------|-------------|----------------------|
| Nano | 1K-10K | 3 | 1.5x if engagement rate > 8% |
| Micro | 10K-50K | 5 | 1.3x if engagement rate > 5% |
| Mid | 50K-250K | 6 | 1.2x if engagement rate > 3% |
| Macro | 250K-1M | 7 | 1.0x (no bonus) |
| Mega | 1M+ | 8 | 0.8x if engagement rate < 1% |

A nano creator with 8% engagement (3 x 1.5 = 4.5 -> 5 points) outscores a mega creator with 0.5% engagement (8 x 0.8 = 6.4 -> 6 points) only slightly on this factor -- but will dominate on engagement quality.

---

## Accessibility (0-15)

Score based on how reachable and collaborative the target is.

| Factor | Points | Criteria |
|--------|--------|----------|
| Response to comments | 0-5 | 5 = replies to 50%+ of comments on their posts; 3 = replies selectively; 0 = never replies |
| Open to DMs/collaboration | 0-5 | 5 = open DMs, responds to outreach, has collab history; 3 = selective but reachable; 0 = closed DMs, no history of collaboration |
| Collaborative history | 0-5 | 5 = has done guest posts, co-creations, podcast appearances, or newsletter swaps; 3 = some collaboration evidence; 0 = solo operator only |

**How to assess:** Check if they reply to comments on their last 5 posts. Look for "collab" or "guest" content in their history. Check if DMs are open (Twitter shows this; LinkedIn allows InMail).

---

## Timing (0-10)

Score based on current relevance and recency of activity.

| Factor | Points | Criteria |
|--------|--------|----------|
| Recent activity | 0-4 | 4 = posted in last 48 hours; 2 = posted in last 7 days; 0 = inactive 30+ days |
| Trending relevance | 0-3 | 3 = currently discussing a trending topic in your space; 1 = occasionally on-trend; 0 = no trending overlap |
| Upcoming events | 0-3 | 3 = speaking at or attending an event relevant to your brand in next 30 days; 1 = has upcoming content launch; 0 = no known events |

**Timing signals decay fast.** Re-evaluate timing scores weekly. A score of 10 this week could be 3 next week if the trend passes.

---

## Score interpretation

| Score range | Tier | Action |
|-------------|------|--------|
| 0-30 | Skip | Do not engage. Not relevant enough to warrant attention. |
| 31-50 | Monitor | Add to watchlist. Check monthly for score changes. No active engagement yet. |
| 51-70 | Engage passively | Like their content, leave occasional thoughtful comments. Build familiarity. |
| 71-85 | Engage actively | Comment regularly, share their content with your commentary, start direct conversations. |
| 86-100 | Priority target | Full engagement strategy: comment, share, DM for collaboration, co-create content, feature in newsletter. |

---

## Platform-specific scoring adjustments

Apply these modifiers after calculating the base score:

### LinkedIn
- +5 points if target is a LinkedIn Top Voice or has newsletter with 10K+ subscribers
- +3 points if they regularly engage with content in your industry hashtags
- -5 points if their content is primarily self-promotional with no value delivery

### Twitter/X
- +5 points if target is in relevant Twitter Lists curated by industry leaders
- +3 points if they participate in Twitter Spaces in your niche
- -5 points if engagement is primarily bot-driven (check reply quality)

### Instagram
- +5 points if target's Reels consistently get 2x+ their average feed engagement
- +3 points if they use Instagram Broadcast Channels actively
- -3 points if follower-to-engagement ratio suggests purchased followers

### TikTok
- +5 points if target has videos that crossed into your niche from an adjacent space (crossover potential)
- +3 points if they respond to comments with video replies
- -5 points if content is trending-audio-dependent with no original angle

### YouTube
- +5 points if target has consistent upload schedule and growing subscriber base
- +3 points if they feature guests or collaborate regularly
- -3 points if content is clickbait-heavy with poor retention metrics

---

## Community scoring

Communities (subreddits, Discord servers, Slack groups, Facebook groups) use a modified model.

| Factor | Points | Criteria |
|--------|--------|----------|
| Topic relevance | 0-25 | 25 = directly about your niche; 15 = adjacent; 5 = tangential; 0 = unrelated |
| Activity level | 0-20 | 20 = multiple posts/day with active discussion; 10 = daily activity; 5 = weekly; 0 = dead community |
| Member quality | 0-20 | 20 = members match your target audience and engage meaningfully; 10 = mixed quality; 0 = low-quality or spam-heavy |
| Moderation health | 0-15 | 15 = active moderation, clear rules, spam-free; 8 = moderate quality; 0 = unmoderated or toxic |
| Accessibility | 0-10 | 10 = open to join, allows value-add participation; 5 = invite-only but joinable; 0 = closed or hostile to new members |
| Size | 0-10 | 10 = 10K-100K members (sweet spot); 7 = 1K-10K; 5 = 100K+; 3 = under 1K |

**Total: 100 points.** Use the same tier interpretation table as individual scoring.

### Platform-specific community signals

**Reddit:**
- Check posts-per-day and average comments per post
- Read sidebar rules -- some subreddits ban self-promotion entirely
- Check if moderators are active (last mod action visible)
- High-value signal: subreddit appears in "Related Communities" of known high-quality subs

**Discord:**
- Check active members vs total members ratio (healthy: 10%+ online at peak)
- Look for dedicated channels that match your topics
- Check message frequency in relevant channels
- Red flag: server with 50K members but 3 active channels

**Slack:**
- Check if community has a public directory listing
- Look for #introductions channel activity as proxy for growth
- Check if key industry figures are members
- Red flag: community that requires paid membership but has low activity

---

## Creator tier definitions

| Tier | Follower range | Typical engagement rate | Collaboration expectation | Best for |
|------|---------------|------------------------|--------------------------|----------|
| Nano | 1K-10K | 5-15% | Free or product exchange. High response rate. Personal feel. | Niche credibility, authentic endorsement, community seeding |
| Micro | 10K-50K | 3-8% | Product exchange or small budget. Good response rate. | Targeted reach, authentic engagement, content co-creation |
| Mid | 50K-250K | 2-5% | Paid collaboration expected. May have management. | Broader reach while maintaining engagement quality |
| Macro | 250K-1M | 1-3% | Paid campaigns. Often have management/agents. | Brand awareness, large campaign amplification |
| Mega | 1M+ | 0.5-2% | Significant budget. Agency representation typical. | Mass awareness, cultural moments, mainstream visibility |

**Engagement rate formula:** (likes + comments + shares) / followers x 100

**General rule:** For B2B social, prioritize nano and micro creators. Their audiences are more targeted, engagement is genuine, and collaboration is accessible. For B2C, mid-tier often provides the best ROI balance.

---

## How to use in SOCIAL:OS commands

### /social:research
1. When researching potential engagement targets, score each candidate
2. Present targets sorted by score descending with tier labels
3. Only recommend active engagement for targets scoring 51+
4. Flag any target in the 86-100 range as priority with a recommended action plan

### /social:engage
1. Check audience scores before engaging -- do not engage with targets below 31
2. Match engagement depth to score tier:
   - 51-70: light engagement (likes, occasional comments)
   - 71-85: regular engagement (comments, shares, direct replies)
   - 86-100: deep engagement (DMs, collaboration pitches, co-creation)
3. Log engagement actions and track if scores change over time

### /social:community
1. Score communities before joining or participating
2. Prioritize communities scoring 51+ for active participation
3. For communities scoring 71+, develop a dedicated participation strategy
4. Track which communities drive the most follower growth and engagement back to your profiles

---

## Re-scoring triggers

Scores are recomputed when:
- **After engagement** -- if you engage and they respond positively, accessibility score increases
- **After 30 days** -- timing signals decay; re-evaluate trending relevance and activity
- **After platform algorithm change** -- engagement quality baselines shift; recalibrate
- **After viral moment** -- a target that goes viral gets a temporary reach bonus (+5 for 14 days)
- **After collaboration** -- update collaborative history score based on experience

---

## Customization

**This is a default model.** Every workspace can override it.

During onboarding or at any time, the user can:
- Change dimension weights (e.g. make engagement quality 35% instead of 25%)
- Add or remove scoring factors within any dimension
- Change point values for specific criteria
- Change score tier thresholds (e.g. make "engage actively" start at 60 instead of 71)
- Add custom scoring factors specific to their niche
- Adjust platform-specific modifiers

To customize, add a `## Audience scoring overrides` section to the workspace's RULES.md. Any overrides there take precedence over this default model.

Example override in RULES.md:
```
## Audience scoring overrides
- Relevance weight: 40% (instead of 30%)
- Reach potential weight: 10% (instead of 20%)
- Add custom factor: "Has podcast" = +5 points under accessibility
- Priority target threshold: 80 (instead of 86)
- Skip community scoring for Discord (not relevant to our audience)
```

If no overrides exist in the workspace RULES.md, use this default model as-is.
