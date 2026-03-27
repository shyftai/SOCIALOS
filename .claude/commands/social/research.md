---
name: social:research
description: Research audience, competitors, and trends for content strategy
argument-hint: "<workspace-name> [focus-area]"
---
<objective>
Run structured research for a workspace -- audience research, competitor analysis, trend scanning, and content opportunity identification. Outputs feed directly into content strategy.

Workspace and focus: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/content-frameworks.md
@./.claude/socialos/references/platform-specs.md
@./.claude/socialos/references/hashtag-strategy.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // RESEARCH >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, PILLARS.md, COMPETITORS.md, LEARNINGS.md
3. Display workspace header

## Research scope
4. If focus area not specified, ask:
   - **Audience** -- deep-dive into who your audience is and what they care about
   - **Competitors** -- analyze competitor content strategies
   - **Trends** -- scan current trends and opportunities
   - **Content gaps** -- identify topics and formats you're not covering
   - **Full** -- all of the above

## Audience research
5. If audience scope:
   - Analyze existing follower demographics and behavior
   - Research audience pain points, interests, and content preferences
   - Map audience segments to content pillars
   - Identify where your audience spends time online (platforms, communities, hashtags)
   - Discover what content they engage with from others
   - Surface questions they're asking (Quora, Reddit, forums, comments)

## Competitor research
6. If competitor scope:
   - Profile each competitor's content strategy
   - Analyze their best-performing content
   - Map their content pillars and format mix
   - Identify gaps in their coverage
   - Note their engagement tactics
   - Run `/social:competitor` analysis

## Trend research
7. If trend scope:
   - Scan industry trends relevant to content pillars
   - Identify emerging topics and formats
   - Map seasonal and calendar-based opportunities
   - Note platform algorithm changes affecting strategy
   - Run `/social:trends` analysis

## Content gap research
8. If content gap scope:
   - Cross-reference your published content against audience interests
   - Compare your pillar coverage against competitor coverage
   - Identify topics your audience searches for that you don't cover
   - Find format gaps (e.g., no video content in a video-first audience)

9. Display research findings:
```
+==============================================================+
|  RESEARCH -- {Workspace} -- {focus}                            |
+==============================================================+

  Key findings
    1. {finding with evidence}
    2. {finding with evidence}
    3. {finding with evidence}

  Opportunities
    >> {opportunity 1} -- {why and how}
    >> {opportunity 2} -- {why and how}
    >> {opportunity 3} -- {why and how}

  Content ideas (from research)
    1. {idea} -- {format} for {platform} -- aligns with {pillar}
    2. {idea} -- {format} for {platform} -- aligns with {pillar}
    3. {idea} -- {format} for {platform} -- aligns with {pillar}

  Strategic recommendations
    >> {recommendation 1}
    >> {recommendation 2}
    >> {recommendation 3}

================================================================
```

10. Save research to context/research/{date}-{focus}.md
11. Offer to update AUDIENCE.md, PILLARS.md, COMPETITORS.md based on findings

12. Suggest next action:
```
================================================================

  >> Next: /social:brief {ws} (create content from research insights)
     Also: /social:calendar {ws} (plan content calendar with new ideas)

================================================================
```
</process>
