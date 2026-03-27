# SOCIAL:OS Defaults

Sensible defaults that apply out of the box. Every default can be overridden per workspace in the relevant file. If a workspace doesn't specify a value, use these.

---

## Workspace defaults

| Setting | Default | Override in |
|---------|---------|-------------|
| Execution mode | interactive | workspace.config.md |
| Collaboration mode | solo | workspace.config.md |
| Content calendar | weekly | workspace.config.md |
| Approval flow | draft > review > schedule | workspace.config.md |
| Analytics refresh | daily | workspace.config.md |
| Cross-posting | adapt-per-platform (never raw repost) | workspace.config.md |

---

## Content defaults per platform

### LinkedIn

| Setting | Default | Override in |
|---------|---------|-------------|
| Post length | 800-1,300 characters (sweet spot for algorithm) | CONTENT-RULES.md |
| Max post length | 3,000 characters | Non-overridable (platform limit) |
| Hashtags per post | 3-5 | CONTENT-RULES.md |
| Posting frequency | 3-5x per week | CALENDAR.md |
| Carousel slides | 8-12 slides | CONTENT-RULES.md |
| Article length | 800-2,000 words | CONTENT-RULES.md |
| Video length | 1-3 minutes | CONTENT-RULES.md |
| Newsletter frequency | 1x per week or biweekly | CALENDAR.md |
| First line hook | Required -- must stop the scroll in <10 words | CONTENT-RULES.md |

### Twitter/X

| Setting | Default | Override in |
|---------|---------|-------------|
| Tweet length | 200-280 characters (use full space) | CONTENT-RULES.md |
| Max tweet length | 280 characters (free), 25,000 (Premium+) | Non-overridable (platform limit) |
| Hashtags per tweet | 1-2 (fewer is better) | CONTENT-RULES.md |
| Posting frequency | 1-3x per day | CALENDAR.md |
| Thread length | 3-7 tweets | CONTENT-RULES.md |
| Poll duration | 24 hours | CONTENT-RULES.md |
| Quote tweet ratio | Max 20% of total posts | CONTENT-RULES.md |

### Instagram

| Setting | Default | Override in |
|---------|---------|-------------|
| Caption length | 150-300 characters (feed), full for educational | CONTENT-RULES.md |
| Max caption length | 2,200 characters | Non-overridable (platform limit) |
| Hashtags per post | 5-10 (in first comment or end of caption) | CONTENT-RULES.md |
| Posting frequency | 3-5x per week (feed + reels combined) | CALENDAR.md |
| Story frequency | 3-7 stories per day | CALENDAR.md |
| Reel length | 30-60 seconds (sweet spot), max 90 seconds | CONTENT-RULES.md |
| Carousel slides | 5-10 slides | CONTENT-RULES.md |
| Image aspect ratio | 1:1 (feed), 4:5 (portrait, preferred), 9:16 (story/reel) | Non-overridable |

### TikTok

| Setting | Default | Override in |
|---------|---------|-------------|
| Video length | 30-60 seconds (sweet spot) | CONTENT-RULES.md |
| Max video length | 10 minutes | Non-overridable (platform limit) |
| Caption length | 150-300 characters | CONTENT-RULES.md |
| Max caption length | 4,000 characters | Non-overridable (platform limit) |
| Hashtags per post | 3-5 | CONTENT-RULES.md |
| Posting frequency | 1-3x per day | CALENDAR.md |
| Hook window | First 1-2 seconds must hook | CONTENT-RULES.md |

### YouTube

| Setting | Default | Override in |
|---------|---------|-------------|
| Standard video length | 8-15 minutes | CONTENT-RULES.md |
| Shorts length | 30-60 seconds | CONTENT-RULES.md |
| Max Shorts length | 60 seconds | Non-overridable (platform limit) |
| Title length | 50-60 characters | CONTENT-RULES.md |
| Description length | 200-500 words (first 2 lines visible) | CONTENT-RULES.md |
| Tags | 5-10 relevant tags | CONTENT-RULES.md |
| Posting frequency | 1-2x per week (standard), 3-5x per week (Shorts) | CALENDAR.md |
| Community post frequency | 2-3x per week | CALENDAR.md |
| Thumbnail text | Max 5 words, large font | CONTENT-RULES.md |

### Threads

| Setting | Default | Override in |
|---------|---------|-------------|
| Post length | 200-400 characters | CONTENT-RULES.md |
| Max post length | 500 characters | Non-overridable (platform limit) |
| Posting frequency | 1-3x per day | CALENDAR.md |
| Hashtags | 0-1 (platform is hashtag-light) | CONTENT-RULES.md |

### Reddit

| Setting | Default | Override in |
|---------|---------|-------------|
| Post length | Varies by subreddit norms | CONTENT-RULES.md |
| Title length | 100-200 characters (descriptive, not clickbait) | CONTENT-RULES.md |
| Comment length | 50-300 words (substantive, value-first) | CONTENT-RULES.md |
| Posting frequency | 2-3x per week | CALENDAR.md |
| Self-promotion ratio | Max 10% of total activity (Reddit rule) | Non-overridable |
| Value-to-promotion ratio | 9:1 minimum | CONTENT-RULES.md |

---

## Publishing defaults

| Platform | Best posting times (recipient timezone) | Best days | Override in |
|----------|----------------------------------------|-----------|-------------|
| LinkedIn | 7:30-8:30 AM, 12:00-1:00 PM | Tuesday-Thursday | CALENDAR.md |
| Twitter/X | 8:00-10:00 AM, 12:00-1:00 PM, 5:00-6:00 PM | Monday-Friday | CALENDAR.md |
| Instagram | 11:00 AM-1:00 PM, 7:00-9:00 PM | Tuesday, Wednesday, Friday | CALENDAR.md |
| TikTok | 7:00-9:00 AM, 12:00-3:00 PM, 7:00-11:00 PM | Tuesday-Thursday | CALENDAR.md |
| YouTube | 2:00-4:00 PM (standard), any time (Shorts) | Thursday, Friday | CALENDAR.md |
| Threads | 8:00-10:00 AM, 6:00-8:00 PM | Monday-Friday | CALENDAR.md |
| Reddit | 6:00-8:00 AM EST, 12:00-2:00 PM EST | Monday, Wednesday | CALENDAR.md |
| Newsletter | 8:00-10:00 AM recipient timezone | Tuesday, Thursday | CALENDAR.md |

---

## Newsletter defaults

| Setting | Default | Override in |
|---------|---------|-------------|
| Frequency | Weekly | NEWSLETTER.md |
| Length | 500-1,000 words (5-7 minute read) | NEWSLETTER.md |
| Subject line length | 5-9 words, 30-50 characters | NEWSLETTER.md |
| Preview text length | 40-90 characters | NEWSLETTER.md |
| CTA count | 1 primary, 1-2 secondary max | NEWSLETTER.md |
| Image count | 1-3 per issue | NEWSLETTER.md |
| Section count | 3-5 sections | NEWSLETTER.md |
| Link count | 3-7 links per issue | NEWSLETTER.md |
| Unsubscribe link | Required in footer | Non-overridable |
| Physical address | Required in footer | Non-overridable |
| A/B test minimum audience | 1,000 subscribers (500 per variant) | NEWSLETTER.md |

---

## Engagement defaults

| Setting | Default | Override in |
|---------|---------|-------------|
| Response time — comments on own posts | Within 1 hour of posting | ENGAGEMENT.md |
| Response time — DMs | Within 4 hours (business hours) | ENGAGEMENT.md |
| Response time — mentions/tags | Within 2 hours | ENGAGEMENT.md |
| Response time — negative comments | Within 30 minutes | ENGAGEMENT.md |
| Daily proactive engagement — LinkedIn | 15-30 minutes | ENGAGEMENT.md |
| Daily proactive engagement — Twitter/X | 15-20 minutes | ENGAGEMENT.md |
| Daily proactive engagement — Instagram | 10-15 minutes | ENGAGEMENT.md |
| Weekly comment target — own niche | 20-30 meaningful comments | ENGAGEMENT.md |
| DM handling | Never pitch in first DM | ENGAGEMENT.md |
| Negative comment escalation | Flag for human review if >= 3 negative on one post | ENGAGEMENT.md |

---

## Quality defaults

| Setting | Default | Override in |
|---------|---------|-------------|
| Brand voice check | Required before every post | TOV.md |
| Platform format check | Required — verify specs match platform | Non-overridable |
| Hashtag relevance check | Required — no banned/irrelevant hashtags | CONTENT-RULES.md |
| Link check | Required — all links tested before publish | Non-overridable |
| Image/video spec check | Required — dimensions, file size, format | Non-overridable |
| Grammar/spelling check | Required | Non-overridable |
| Sensitive topic check | Required — flag political, controversial, divisive | CONTENT-RULES.md |
| Competitor mention check | Required — flag any direct competitor mentions | CONTENT-RULES.md |
| CTA presence check | Required — every post needs a purpose | CONTENT-RULES.md |
| Hook strength check | Required — first line must stop the scroll | CONTENT-RULES.md |

---

## Batch defaults (swarm operations)

| Operation | Default batch size | Max parallel agents | Override in |
|-----------|-------------------|---------------------|-------------|
| Content creation (single platform) | 5 posts per agent | 4 | RULES.md |
| Content repurposing (multi-platform) | 3 source posts per agent | 5 | RULES.md |
| Carousel creation | 2 carousels per agent | 3 | RULES.md |
| Thread writing | 3 threads per agent | 3 | RULES.md |
| Newsletter drafting | 1 newsletter per agent | 2 | RULES.md |
| Engagement processing | 20 comments per agent | 4 | RULES.md |
| Hashtag research | 5 topics per agent | 3 | RULES.md |
| Analytics compilation | 2 platforms per agent | 4 | RULES.md |

---

## How overrides work

1. SOCIAL:OS checks the workspace-level file first (e.g. CONTENT-RULES.md, TOV.md)
2. If the setting is specified there, use it
3. If not specified, fall back to these defaults
4. Non-overridable settings (marked above) always apply regardless of workspace config
5. Users can add a `## SOCIALOS overrides` section to any workspace file to change defaults
