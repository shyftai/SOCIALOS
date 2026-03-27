---
name: social:report
description: Generate a shareable performance report
argument-hint: "<workspace-name> [weekly|monthly|quarterly]"
---
<objective>
Generate a clean, shareable report. Strips internal notes, shows only approved metrics and outcomes. Suitable for stakeholders, clients, or team review.

Workspace and report type: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // REPORT >>`
2. Load analytics data, CALENDAR.md, LEARNINGS.md, CHANNELS.md
3. Determine report type (weekly / monthly / quarterly -- default: weekly)
4. Generate report with these sections:

**Weekly report:**
- Period covered
- Posts published per platform
- Total impressions and reach
- Engagement rate per platform with week-over-week change
- Top 3 performing posts with metrics
- Engagement summary (comments responded, DMs handled)
- Key takeaway (1-2 sentences)
- Next week plan

**Monthly report:**
- All weekly metrics aggregated
- Follower growth per platform with trend
- Engagement rate trends (4-week graph)
- Top 10 performing posts
- Format performance comparison
- Pillar balance and performance
- Content volume vs. targets
- Community growth metrics
- Newsletter metrics (if applicable)
- Competitor benchmark comparison
- Insights and recommendations

**Quarterly report:**
- Full quarter summary with month-over-month trends
- Audience growth analysis
- Content strategy assessment (what's working, what's not)
- Platform-by-platform deep dive
- ROI metrics if trackable (leads generated, traffic driven)
- Strategic recommendations for next quarter
- Content calendar themes for next quarter

5. Format as clean markdown -- no internal file references, no system-specific language
6. Save to reports/report-{type}-{date}.md
7. Offer export options:
   - Markdown (default)
   - Formatted for Notion/Google Docs

```
================================================================

  Report saved to reports/report-{type}-{date}.md

  >> Next: /social:optimize {ws} (act on findings)
     Also: /social:debrief {ws} (deeper analysis)

================================================================
```
</process>
