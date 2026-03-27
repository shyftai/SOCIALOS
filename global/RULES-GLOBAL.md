# Global Rules

## Platform compliance
- Never violate platform terms of service — read and follow each platform's current policies
- Respect rate limits on all platforms — automated actions that exceed limits risk account suspension
- No fake engagement: do not buy followers, likes, comments, or use engagement pods that violate TOS
- No impersonation — never create accounts or post content pretending to be someone else
- Disclose sponsored and paid content as required by FTC (US), ASA (UK), and equivalent local regulations
- Use official APIs where available — screen scraping is a last resort and must comply with TOS
- Never circumvent platform restrictions, shadowbans, or content moderation decisions

## Content ethics
- Never fabricate metrics, testimonials, case studies, or proof points
- Never use unauthorized images, videos, or copyrighted content
- Always credit sources and original creators — reposting without attribution is not acceptable
- Never post misleading or deceptive content, including manipulated media presented as authentic
- Respect intellectual property — do not reproduce substantial portions of others' work without permission
- Never use AI-generated content presented as human-created without disclosure where required
- Stock images must be properly licensed — verify license terms before use

## Posting rules
- Never post to a client account without explicit approval on first run
- Maximum posting frequencies per platform:
  - LinkedIn: 2 posts per day
  - Twitter/X: 5 posts per day
  - Instagram: 3 posts per day (feed + reels combined)
  - Instagram Stories: 10 per day
  - Facebook: 2 posts per day
  - TikTok: 3 posts per day
  - Threads: 5 posts per day
  - YouTube: 1 long-form per day, 3 Shorts per day
- Minimum spacing between posts on the same platform: 2 hours
- No duplicate content across the same platform within 30 days
- Check the content calendar before posting to avoid scheduling conflicts or topic collisions
- Every post must be reviewed against brand guidelines before publishing
- Hashtag limits: follow platform best practices (LinkedIn: 3-5, Instagram: up to 30, Twitter: 1-3)
- Never schedule posts during known sensitive periods without human review

## Engagement rules
- Respond to comments within target SLA:
  - Twitter/X: 1 hour during business hours
  - LinkedIn: 4 hours during business hours
  - Instagram: 4 hours during business hours
  - Facebook: 2 hours during business hours
  - All platforms: next business day for after-hours comments
- Never auto-respond to DMs without human review on initial setup
- Handle negative comments according to brand guidelines — never delete valid criticism
- Escalation path for crisis situations: flag immediately, pause scheduled content, notify stakeholders
- Do not engage in arguments or heated debates from brand accounts
- Like and acknowledge positive engagement within SLA windows
- Monitor brand mentions across platforms — respond to relevant mentions within SLA

## Data and privacy
- Never share personal data from DMs, comments, or private interactions publicly
- GDPR compliance: lawful basis required for processing EU personal data; honor data subject rights
- CCPA/CPRA compliance: honor opt-out requests from California residents
- Newsletter subscriber data: collect only what is necessary, store securely
- Unsubscribe processing within 24 hours — no exceptions
- Right to erasure: delete subscriber data within 30 days if requested
- Do not export or transfer follower/subscriber lists to unauthorized third parties
- Analytics data must be anonymized or aggregated before sharing externally
- Cookie consent required on any owned web properties collecting social traffic

## Newsletter rules
- CAN-SPAM compliance: include physical mailing address and working unsubscribe link in every email
- Never add subscribers without explicit consent (opt-in required)
- Honour unsubscribes immediately — do not send further emails after unsubscribe is processed
- Double opt-in recommended for all new subscribers
- Maintain a clean list: remove hard bounces immediately, suppress soft bounces after 3 attempts
- Bounce rate target: below 2% per send
- Spam complaint rate target: below 0.1%
- Include clear sender identification in every newsletter
- Subject lines must accurately reflect content — no clickbait or misleading subjects

## Script standards
- All scripts must resolve paths relative to `__file__` or `REPO_ROOT` — never assume CWD
- Python scripts must set `SCRIPT_DIR = Path(__file__).resolve().parent` and `REPO_ROOT = SCRIPT_DIR.parent` at the top
- Bash scripts must set `REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"` and use `$REPO_ROOT` for all file paths
- Subagents and background processes may run from a different working directory — relative paths will silently write to the wrong location
- This rule is non-negotiable: lost data from wrong CWD is unrecoverable

## Content calendar and scheduling
- Every piece of content must be logged in the content calendar before publishing
- No ad-hoc posts without updating the calendar retroactively within 1 hour
- Cross-platform campaigns must be coordinated in the calendar to maintain consistent messaging
- Time zones must be specified for all scheduled posts — default to the audience's primary time zone
