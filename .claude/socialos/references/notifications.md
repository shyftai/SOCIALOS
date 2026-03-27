# Notifications — SOCIAL:OS

SOCIAL:OS can send Slack notifications for critical events using the Slack MCP integration. This is optional -- if Slack MCP is not connected, notifications are displayed inline only.

---

## Setup

1. Ensure Slack MCP is connected in Claude Code
2. Set the notification channel in `global/COLLABORATION.md`:
   ```
   ## Notifications
   slack_channel: #socialos-alerts
   slack_enabled: true
   ```
3. Optionally set per-workspace channels in `workspace.config.md`:
   ```
   slack_channel: #brand-name-social
   ```

---

## Notification Triggers

### Critical (always notify if Slack is connected)

| Event | Message format | Trigger condition |
|-------|---------------|-------------------|
| Engagement spike | `[{workspace}] Engagement spike: "{post hook}" on {platform} -- {n}x avg engagement in {n} hours` | Post reaches 3x average engagement within 4 hours |
| Negative sentiment cluster | `[{workspace}] Negative sentiment: {n} negative comments on "{post hook}" -- review needed` | 3+ negative comments on a single post within 2 hours |
| Content due (overdue) | `[{workspace}] Content overdue: {n} posts scheduled for today have no drafts` | Scheduled content has no draft within 4 hours of publish time |
| Performance drop | `[{workspace}] Performance drop: {platform} engagement down {n}% vs. 4-week average` | Any platform engagement rate drops 50%+ below 4-week rolling average |
| Account issue | `[{workspace}] Account alert: {platform} connection lost or authentication expired` | API returns auth error or connection fails |
| Newsletter bounce spike | `[{workspace}] Newsletter alert: bounce rate {n}% on latest send (threshold: 2%)` | Bounce rate exceeds 2% on any newsletter send |
| Spam complaint | `[{workspace}] Spam complaint: {n} complaints on "{subject}" ({n}% rate)` | Spam complaint rate exceeds 0.05% on any newsletter send |

### Warning (notify during active campaigns and content pushes)

| Event | Message format | Trigger condition |
|-------|---------------|-------------------|
| Trending topic detected | `[{workspace}] Trending: "{topic}" is trending in your niche on {platform} -- consider reactive content` | Topic relevant to workspace content pillars is trending |
| Competitor alert | `[{workspace}] Competitor: {competitor} published "{post hook}" on {platform} -- {n} engagement` | Competitor post exceeds their average engagement by 3x |
| Content calendar gap | `[{workspace}] Calendar gap: no content scheduled for {platform} in next 3 days` | Platform has no scheduled content within 72 hours |
| Engagement quota behind | `[{workspace}] Engagement: daily engagement quota {n}% complete with {n} hours remaining` | Less than 50% of daily engagement quota completed by 3 PM |
| Newsletter growth stall | `[{workspace}] Newsletter: subscriber growth flat for 2+ weeks ({n} net new)` | Net new subscribers < 5 for 14 consecutive days |
| Budget threshold | `[{workspace}] Budget: {n}% of monthly social spend used (${spent} of ${budget})` | Spend reaches 80% of monthly budget |

### Informational (optional -- enable per workspace)

| Event | Message format | Trigger condition |
|-------|---------------|-------------------|
| Weekly report ready | `[{workspace}] Weekly social report ready -- {n} posts, {n}% avg eng rate` | Weekly report generated |
| Newsletter sent | `[{workspace}] Newsletter sent: "{subject}" to {n} subscribers` | Newsletter send completes |
| Milestone reached | `[{workspace}] Milestone: {platform} hit {n} followers` | Follower count crosses a round number (1K, 5K, 10K, etc.) |
| A/B test result | `[{workspace}] A/B test: "{subject A}" vs. "{subject B}" -- winner: {winner} ({metric} {n}% higher)` | Newsletter A/B test completes |
| Content batch complete | `[{workspace}] Batch complete: {n} posts drafted for review` | Swarm content batch finishes |
| Health check complete | `[{workspace}] Health check: {status} -- {platform} eng rate {n}%, newsletter open rate {n}%` | Health check completes |

---

## Severity Levels

| Level | Icon | When to use | Default state |
|-------|------|-------------|--------------|
| Critical | `!!` | Requires immediate action. Revenue or reputation at risk. | Always ON (when Slack connected) |
| Warning | `!` | Should be addressed within 24 hours. Opportunities or issues developing. | ON during active campaigns |
| Info | `i` | Nice to know. No action required. | OFF by default |

---

## Channel Mapping

| Alert type | Default channel | Override in |
|-----------|----------------|-------------|
| Critical alerts | `#socialos-alerts` | COLLABORATION.md |
| Warning alerts | `#socialos-alerts` | COLLABORATION.md |
| Info alerts | `#socialos-info` | COLLABORATION.md |
| Workspace-specific | `#{workspace}-social` | workspace.config.md |
| Newsletter alerts | `#socialos-newsletter` | COLLABORATION.md |
| Competitor alerts | `#socialos-competitive` | COLLABORATION.md |

---

## How to Send

When a notification trigger fires:

1. Check if `slack_enabled: true` in COLLABORATION.md
2. Determine the correct channel (workspace-specific or global)
3. Send via Slack MCP: `mcp__claude_ai_Slack__slack_send_message`
4. Format: plain text, no markdown formatting, keep under 200 characters
5. If Slack MCP is not available, display the notification inline with `!!` prefix

---

## User Control

Users can configure notifications during onboarding or at any time:
- `slack_enabled: true/false` -- master toggle
- `notify_critical: true` -- engagement spikes, negative sentiment, performance drops
- `notify_warning: true` -- trending topics, competitor alerts, calendar gaps
- `notify_info: false` -- reports, milestones, batch completions

Default: critical only.
