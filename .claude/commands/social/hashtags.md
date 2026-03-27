---
name: social:hashtags
description: Hashtag research, strategy, and performance tracking
argument-hint: "<workspace-name> [pillar]"
---
<objective>
Research hashtags, build hashtag sets per content pillar, track performance, and suggest new ones based on trends and data.

Workspace and pillar: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // HASHTAGS >>`
2. Load workspace context -- PILLARS.md, CHANNELS.md, AUDIENCE.md, LEARNINGS.md
3. Load existing hashtag sets from HASHTAGS.md (if exists)

## Hashtag research
4. If building hashtag sets for the first time or refreshing:

For each content pillar, generate hashtag categories:
- **Branded** (1-3): unique to your brand or campaign
- **Niche** (5-10): specific to your topic, smaller audience, higher relevance
- **Industry** (5-10): broader industry terms, medium audience
- **Trending** (3-5): currently trending, rotate frequently
- **Community** (3-5): community-specific hashtags your audience follows

5. Platform-specific rules:
   - **LinkedIn**: 3-5 hashtags maximum, placed at end of post
   - **Twitter**: 1-2 hashtags, integrated into text when possible
   - **Instagram**: 20-30 hashtags, first comment preferred, mix all categories
   - **TikTok**: 3-5 hashtags, trending sounds matter more than tags

6. Display hashtag strategy:
```
+-- HASHTAG STRATEGY -- {Workspace} -----------------------+
|                                                           |
|  Pillar: {pillar name}                                    |
|                                                           |
|  Branded:                                                 |
|    #{brand_tag}  #{campaign_tag}                          |
|                                                           |
|  Niche:                                                   |
|    #{tag1}  #{tag2}  #{tag3}  #{tag4}  #{tag5}            |
|                                                           |
|  Industry:                                                |
|    #{tag1}  #{tag2}  #{tag3}  #{tag4}  #{tag5}            |
|                                                           |
|  Trending (rotate weekly):                                |
|    #{tag1}  #{tag2}  #{tag3}                              |
|                                                           |
|  Community:                                               |
|    #{tag1}  #{tag2}  #{tag3}                              |
|                                                           |
|  Ready-to-use sets:                                       |
|                                                           |
|  LinkedIn set (5):                                        |
|  #{tag} #{tag} #{tag} #{tag} #{tag}                       |
|                                                           |
|  Instagram set (25):                                      |
|  #{tag} #{tag} #{tag} ... #{tag}                          |
|                                                           |
|  Twitter set (2):                                         |
|  #{tag} #{tag}                                            |
|                                                           |
+-----------------------------------------------------------+
```

## Performance tracking
7. If performance data exists, show hashtag analytics:
```
  Hashtag performance (last 30 days)
  +----------------------------------------------------------+
  | Hashtag       | Posts | Avg Reach | Avg Eng | Trend       |
  |---------------|-------|-----------|---------|-------------|
  | #{tag1}       | 8     | 2.4K      | 3.2%    | UP          |
  | #{tag2}       | 6     | 1.8K      | 2.8%    | STABLE      |
  | #{tag3}       | 4     | 3.1K      | 4.1%    | UP          |
  | #{tag4}       | 5     | 0.9K      | 1.2%    | DOWN        |
  +----------------------------------------------------------+

  Recommendations:
    [+] #{tag3} outperforming -- use more frequently
    [-] #{tag4} declining -- consider replacing
    [NEW] #{suggested} trending in your niche -- test it
```

8. Save hashtag sets to HASHTAGS.md
9. Update LEARNINGS.md with hashtag performance insights

10. Suggest next action:
```
================================================================

  Hashtag sets saved to HASHTAGS.md

  >> Next: /social:write {ws} (use these hashtags in your next post)
     Also: /social:trends {ws} (find new trending hashtags)

================================================================
```
</process>
