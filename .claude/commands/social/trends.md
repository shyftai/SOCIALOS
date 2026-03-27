---
name: social:trends
description: Scan trending topics, hashtags, and formats for content opportunities
argument-hint: "<workspace-name>"
---
<objective>
Scan trending topics, hashtags, and content formats. Surface opportunities that align with content pillars and audience interests.

Workspace: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // TRENDS >>`
2. Load workspace context -- PILLARS.md, AUDIENCE.md, CHANNELS.md, BRAND.md, LEARNINGS.md
3. Load competitor data from COMPETITORS.md if available

## Trend scanning
4. Scan for trends across active platforms:

**Trending topics:**
- Industry-specific trending conversations
- Broader cultural moments relevant to the brand
- News events that create content opportunities
- Seasonal and calendar-based topics

**Trending formats:**
- New content formats gaining traction (e.g., new carousel styles, video formats)
- Platform feature updates that create early-mover advantage
- Engagement patterns shifting (e.g., long-form making a comeback)

**Trending hashtags:**
- Rising hashtags in the brand's niche
- Event-based hashtags (conferences, launches, awareness days)
- Community hashtags gaining momentum

**Trending sounds/audio (for video platforms):**
- Trending sounds on TikTok and Reels
- Audio trends that fit the brand voice

5. Display trends dashboard:
```
+==============================================================+
|  TRENDS -- {Workspace} -- {date}                               |
+==============================================================+

  Aligned with your pillars
    [HOT] #{hashtag} -- aligns with {pillar} -- {volume}
          Opportunity: {specific content angle}
    [HOT] "{topic}" -- aligns with {pillar} -- trending on {platform}
          Opportunity: {specific content angle}
    [NEW] {format trend} -- early adopter window
          Opportunity: {how to use it}

  Industry conversations
    >> {topic 1} -- {context and why it matters}
    >> {topic 2} -- {context and why it matters}
    >> {topic 3} -- {context and why it matters}

  Competitor activity
    >> {competitor} posted about {topic} -- high engagement
    >> {competitor} trying {new format} -- results unclear

  Calendar opportunities (next 14 days)
    >> {date}: {awareness day / event} -- aligns with {pillar}
    >> {date}: {industry event} -- live coverage opportunity

  Trending sounds (video)
    >> "{sound name}" -- {usage count} -- fits {content type}
    >> "{sound name}" -- {usage count} -- fits {content type}

================================================================
```

## Opportunity scoring
6. Score each trend opportunity:
   - **Pillar alignment** -- does it match a content pillar? (required)
   - **Timeliness** -- how urgent is the window? (hours, days, weeks)
   - **Brand fit** -- can we authentically participate? (not forced)
   - **Effort** -- how much work to create content? (low/medium/high)
   - **Potential** -- estimated reach/engagement uplift

7. Recommend top 3 actionable opportunities:
```
  Top opportunities

  1. {topic/trend} -- {platform}
     Pillar: {pillar} | Window: {urgency} | Effort: {level}
     >> /social:brief {ws} "{suggested topic}"

  2. {topic/trend} -- {platform}
     Pillar: {pillar} | Window: {urgency} | Effort: {level}
     >> /social:brief {ws} "{suggested topic}"

  3. {topic/trend} -- {platform}
     Pillar: {pillar} | Window: {urgency} | Effort: {level}
     >> /social:brief {ws} "{suggested topic}"
```

8. Save trends scan to analytics/trends-{date}.md
9. Update LEARNINGS.md if new trend patterns emerge

10. Suggest next action:
```
================================================================

  >> Start with opportunity #1: /social:brief {ws} "{topic}"
     Window closes in {timeframe}

================================================================
```
</process>
