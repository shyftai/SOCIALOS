# SOCIAL:OS — The Social Media Operating System

> Turn Claude Code into a full social media engine. Plan it. Create it. Publish it. Grow it.

SOCIAL:OS is a Claude Code plugin that runs your entire social media workflow — from brand setup to content creation, scheduling, publishing, engagement, community management, and performance analytics. It connects to your social stack via API, enforces brand consistency at every step, and never publishes anything that drifts from the brief.

**Built for:** Social media managers, content creators, community managers, agencies, and founders building a brand presence.

---

## Install

### Prerequisites
You need [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed:
```
npm install -g @anthropic-ai/claude-code
```

### Get started
```
git clone https://github.com/shyftai/SOCIALOS.git
cd SOCIALOS
claude
```

That's it. SOCIAL:OS boots automatically — shows the banner, scans your connected tools, and asks which workspace to load. No config files to edit, no build step.

> **Note:** After cloning, restart Claude Code (`/exit` then relaunch) for slash commands to become available. Claude Code loads commands at session start, so a freshly cloned repo's commands won't appear until the next session.

### Connect your tools
SOCIAL:OS works with your existing tools. Two ways to connect:

**MCP servers (recommended)** — Claude can use these tools directly with full capabilities:
- [Crispy](https://crispy.sh?ref=socialos) — LinkedIn automation (78 tools)
- [Slack](https://slack.com) — team notifications and alerts

Add MCP servers to your Claude Code settings — SOCIAL:OS detects them automatically on boot.

**API keys** — add to `.env` for tools that connect via API:
```
cp .env.example .env
# add your keys (Buffer, Typefully, Meta API, Twitter/X API, Beehiiv, ConvertKit, etc.)
```

You don't need all tools to start. SOCIAL:OS works with whatever you have and tells you what's missing.

### First run
When SOCIAL:OS boots, run:
```
/social:onboard my-brand
```
It asks your role (Social Media Manager, Content Creator, Community Manager, Agency, or Founder), walks you through setup, and creates your workspace. Then you're ready to create content.

---

## Legal & Compliance

SOCIAL:OS is a tool — not a compliance solution. You are responsible for how you use it.

- [Legal Disclaimer](LEGAL-DISCLAIMER.md) — warranty, liability, and indemnification terms
- [Acceptable Use Policy](ACCEPTABLE-USE.md) — what responsible use looks like
- [LICENSE](LICENSE) — MIT License

SOCIAL:OS includes built-in compliance helpers (brand guidelines enforcement, content calendar conflict detection, platform TOS checks, approval gates before publishing) but these do not guarantee legal compliance. Consult legal counsel for your jurisdiction.

---

## What it looks like

When you open SOCIAL:OS in Claude Code, this is what you see.

### Boot sequence
```
███████╗ ██████╗  ██████╗██╗ █████╗ ██╗      ██╗  ██████╗ ███████╗
██╔════╝██╔═══██╗██╔════╝██║██╔══██╗██║      ╚═╝ ██╔═══██╗██╔════╝
███████╗██║   ██║██║     ██║███████║██║          ██║   ██║███████╗
╚════██║██║   ██║██║     ██║██╔══██║██║      ██╗ ██║   ██║╚════██║
███████║╚██████╔╝╚██████╗██║██║  ██║███████╗ ╚═╝ ╚██████╔╝███████║
╚══════╝ ╚═════╝  ╚═════╝╚═╝╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚══════╝
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  S O C I A L : O S                                        v1.0.0
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Plan it. Create it. Publish it. Grow it.

  ┌─ SYSTEM ──────────────────────────────────────┐
  │                                                │
  │  Workspaces:  acme-brand, personal-brand       │
  │  Mode:        solo                             │
  │                                                │
  │  MCP servers:                                  │
  │  [x] Crispy (LinkedIn)    [ ] Slack            │
  │                                                │
  │  API keys:                                     │
  │  [x] Buffer          [x] Typefully            │
  │  [x] Meta API        [ ] Twitter/X API        │
  │  [x] Beehiiv         [ ] ConvertKit           │
  │                                                │
  │  1 MCP server · 4 API keys · 3 missing         │
  │                                                │
  └────────────────────────────────────────────────┘

  ┌─────────────────────────────────────────────┐
  │  BRAND ─── VOICE ─── AUDIENCE ─── PILLARS  │
  │                  │                          │
  │              RULES.md                       │
  │                  │                          │
  │     ┌────────────┼────────────┐             │
  │     ▼            ▼            ▼             │
  │  CALENDAR     CONTENT     ENGAGE           │
  │     │            │            │             │
  │     ▼            ▼            ▼             │
  │  SCHEDULE ── APPROVE ──── PUBLISH          │
  │                  │            │             │
  │              ANALYTICS    ◈ SWARM          │
  │                  │        (optional)        │
  │          HEALTH CHECK                      │
  │                  │                          │
  │          REPORT + OPTIMIZE                 │
  │                  │                          │
  │           GROW ──── COMMUNITY              │
  └─────────────────────────────────────────────┘

  ┌─ COMMANDS ────────────────────────────────────┐
  │                                                │
  │  Setup      /social:onboard · /social:research │
  │  Create     /social:write · /social:repurpose  │
  │             /social:calendar · /social:thread   │
  │  Publish    /social:schedule · /social:publish  │
  │  Engage     /social:engage · /social:community  │
  │             /social:health · /social:analytics   │
  │  Report     /social:report · /social:debrief    │
  │  More       /social:status for all commands     │
  │                                                │
  └────────────────────────────────────────────────┘

  >> Which workspace are we loading?
```

### Workspace loaded
```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  WORKSPACE: Acme Brand                                         ┃
┃  CAMPAIGN:  Q1 Thought Leadership                              ┃
┃  STATUS:    active       TOOLS: Buffer, Typefully, Crispy      ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

### Quality gates — every piece of content is checked
```
  ── FIVE CHECKS ──────────────────────────────────
  [x] Brand fit     [x] Audience fit   [x] Platform fit
  [x] Voice fit     [x] Quality fit
  ─────────────────────────────────────────────────
```

### Publishing check before going live
```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  PUBLISH CHECK — Q1 Thought Leadership            ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                                                   ┃
┃  Content                                          ┃
┃  [x] 5 posts queued — LinkedIn, X, newsletter     ┃
┃  [x] Five-check validation passed                 ┃
┃  [x] Hashtag strategy applied                     ┃
┃                                                   ┃
┃  Calendar                                         ┃
┃  [x] No scheduling conflicts                     ┃
┃  [x] Optimal posting times confirmed             ┃
┃  [x] Holiday calendar checked                    ┃
┃                                                   ┃
┃  Brand                                            ┃
┃  [x] Voice consistency verified                  ┃
┃  [x] Visual guidelines met                       ┃
┃  [x] Links and CTAs validated                    ┃
┃                                                   ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

### Nothing publishes without your approval
```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  APPROVE TO PUBLISH?                              ┃
┃  5 posts across 3 platforms, scheduled for Mon.   ┃
┃                                                   ┃
┃  >> approve / reject / edit                       ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

### Content health monitoring
```
  ┌─ CONTENT HEALTH ─────────────────────────────┐
  │                                                │
  │  Engagement       [GREEN]  Avg: 4.2%           │
  │  Reach            [GREEN]  +18% week-over-week │
  │  Follower growth  [AMBER]  +1.1% (target 2%)  │
  │  Content mix      [GREEN]  Balanced across     │
  │                            pillars             │
  │                                                │
  │  Overall: ON TRACK                             │
  └────────────────────────────────────────────────┘
```

### Credit tracking — every API call is logged before it runs
```
  ┌ CREDIT CHECK ─────────────────────────────────┐
  │ Tool:   Buffer                                 │
  │ Action: Schedule 12 posts across 3 channels    │
  │ Cost:   12 posts (~$0.00 within plan)          │
  │ Rule:   confirm-before-every-use               │
  └────────────────────────────────────────────────┘
  >> Proceed? (y/n)
```

### Engagement handling
```
  ┌─ ENGAGEMENT ─────────────────────────────────┐
  │ From:     Sarah Chen, VP Sales at TechCorp    │
  │ Platform: LinkedIn                            │
  │ Type:     COMMENT (thoughtful)                │
  │                                                │
  │ "Great insight on the pricing model shift.    │
  │  We've seen the same trend with our clients." │
  │                                                │
  │ Drafted reply:                                │
  │ "Appreciate that, Sarah. Curious — are you    │
  │  seeing this more in enterprise or mid-market  │
  │  clients?"                                    │
  │                                                │
  │ Actions:                                       │
  │   - Reply to comment                          │
  │   - Save contact for outreach                 │
  └────────────────────────────────────────────────┘
  >> Approve / Edit / Skip
```

### After every workflow — clear next steps
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Published. 5 posts across 3 platforms.

  >> Next: /social:health acme-brand q1-thought-leadership
     Also: /social:engage acme-brand
     Also: /social:analytics acme-brand

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## How it works

```
  ┌─────────────────────────────────────────────┐
  │  BRAND ─── VOICE ─── AUDIENCE ─── PILLARS  │
  │                  │                          │
  │              RULES.md                       │
  │                  │                          │
  │     ┌────────────┼────────────┐             │
  │     ▼            ▼            ▼             │
  │  CALENDAR     CONTENT     ENGAGE           │
  │     │            │            │             │
  │     ▼            ▼            ▼             │
  │  SCHEDULE ── APPROVE ──── PUBLISH          │
  │                  │            │             │
  │              ANALYTICS    ◈ SWARM          │
  │                  │        (optional)        │
  │          HEALTH CHECK                      │
  │                  │                          │
  │          REPORT + OPTIMIZE                 │
  │                  │                          │
  │           GROW ──── COMMUNITY              │
  └─────────────────────────────────────────────┘
```

Every task is checked against five sources of truth before anything publishes:

| File | What it controls |
|------|-----------------|
| **BRAND.md** | Brand identity, visual guidelines, positioning |
| **AUDIENCE.md** | Who you're speaking to (demographics, psychographics, platforms) |
| **PILLARS.md** | Content pillars, topics, and themes |
| **TOV.md** | Brand voice, platform-specific rules, banned phrases |
| **RULES.md** | Content quality standards, engagement rules, posting frequency |

If it drifts from the brief, it doesn't publish.

---

## The content lifecycle

**1. Onboard** --> `/social:onboard` walks through your brand, audience, content pillars, voice, tools, and platforms. Have existing content? Start with `/social:deep-dive` to build your content strategy from evidence.

**2. Research** --> `/social:research` maps your audience, trending topics, competitor content, and platform opportunities.

**3. Plan content** --> `/social:calendar` builds a content calendar based on your pillars and posting cadence. `/social:ideate` generates content ideas from signals, trends, and audience interests.

**4. Create content** --> `/social:write` drafts posts using social writing best practices — hook-driven openers, platform-native formatting, clear CTAs. `/social:thread` creates multi-post threads. `/social:repurpose` adapts one piece of content across platforms.

**5. Publish** --> `/social:schedule` queues content with optimal timing. `/social:publish` runs a publishing check (brand guidelines, calendar conflicts, platform specs, hashtag strategy) and pushes to Buffer, Typefully, or direct to platform.

**6. Engage** --> `/social:engage` manages comments and replies, `/social:community` handles community interactions, `/social:health` monitors content performance.

**7. Report** --> `/social:report` generates performance reports, `/social:debrief` feeds learnings back into the system, `/social:analytics` provides deep performance analysis.

---

## Content types

Pick a type when creating content — defaults pre-fill automatically:

| Type | Platforms | Best for |
|------|-----------|----------|
| Thought leadership | LinkedIn, X | Establishing authority on a topic |
| Educational | LinkedIn, X, Newsletter | Teaching your audience something actionable |
| Behind-the-scenes | LinkedIn, Instagram | Building authenticity and trust |
| Case study | LinkedIn, Newsletter | Showcasing results with proof |
| Hot take | X, LinkedIn | Driving engagement through strong opinions |
| Community question | LinkedIn, X | Sparking conversation and gathering insights |
| Product announcement | All | Launching features, updates, or news |
| Curated content | X, Newsletter | Sharing valuable third-party content with commentary |
| Thread / carousel | LinkedIn, X | Deep dives and step-by-step breakdowns |
| Newsletter | Beehiiv, ConvertKit | Long-form for your owned audience |

---

## Supported tools

SOCIAL:OS connects to tools across the social media stack. Use what you have — skip what you don't. Every tool is optional.

### Content creation & scheduling
| Tool | What it does | Pricing |
|------|-------------|---------|
| **Buffer** | Multi-platform scheduling, analytics, engagement | Free 3 channels, from $6/mo/channel |
| **Typefully** | LinkedIn and X post creation, scheduling, analytics, thread builder | Free tier, from $12.50/mo |
| **Hypefury** | X/Twitter scheduling, auto-engagement, sales automation | From $19/mo |

### LinkedIn
| Tool | What it does | Pricing |
|------|-------------|---------|
| **Crispy** | MCP server — Claude Code controls LinkedIn directly. Posts, comments, reactions, profile analytics, content scheduling. 78 tools. | From EUR19/mo/seat |

### Newsletter
| Tool | What it does | Pricing |
|------|-------------|---------|
| **Beehiiv** | Newsletter platform with growth tools, monetization, analytics | Free to 2.5K subs, from $39/mo |
| **ConvertKit** | Creator-focused email with automations, landing pages, commerce | Free to 10K subs, from $25/mo |
| **Substack** | Newsletter + social network with built-in discovery and payments | Free (10% on paid subs) |

### Social platforms (direct API)
| Tool | What it does | Pricing |
|------|-------------|---------|
| **Twitter/X API** | Post, reply, quote, analytics, thread creation | Free basic, from $100/mo for Pro |
| **Meta API** | Facebook and Instagram posting, stories, analytics | Free with approved app |
| **YouTube API** | Upload, metadata, analytics, community posts | Free with API key |
| **TikTok API** | Video upload, analytics, trending sounds | Free with developer account |

### Analytics & monitoring
| Tool | What it does | Pricing |
|------|-------------|---------|
| **Shield** | LinkedIn analytics — post performance, follower demographics, growth trends | From $8/mo |
| **Metricool** | Cross-platform analytics, competitor tracking, reporting | Free 1 brand, from $18/mo |
| **Audiense** | Audience intelligence, segmentation, persona mapping | From $39/mo |

### Research & content intelligence
| Tool | What it does | Pricing |
|------|-------------|---------|
| **SparkToro** | Audience research — where they hang out, what they read, who they follow | Free 5 searches/mo, from $50/mo |
| **Exa** | MCP server — semantic web search, trending topics, content research | 1K free/mo, $0.007/search |
| **Firecrawl** | MCP server — web scraping, competitor content extraction | 500 free credits, from $16/mo |

### Community & engagement
| Tool | What it does | Pricing |
|------|-------------|---------|
| **Slack** | MCP server — team notifications, content approval workflows, alerts | Free tier, from $8.75/mo/user |

### Automation & integration
| Tool | What it does | Pricing |
|------|-------------|---------|
| **N8N** | Self-hosted workflow automation (free), or cloud | Free self-hosted, cloud from $20/mo |
| **Zapier** | Task-based automation between tools | Free 100 tasks/mo, from $19.99/mo |
| **Make** | Operation-based workflow automation | Free 1K ops/mo, from $9/mo |
| **Supabase** | Team mode backend — shared state, edge functions | Free tier, Pro $25/mo |

> Every tool is optional. Use what you have. SOCIAL:OS reads tool availability from your `.env` and `TOOLS.md`, then adapts its workflows accordingly. Writes follow credit rules per workspace, and every write is logged in COSTS.md.
>
> **Any tool with an API works.** The list above is the curated default set — not a hard limit. Add any tool to your `TOOLS.md`, drop the API key in `.env`, and SOCIAL:OS will use it.

---

## Key features

### Content pillars & calendar
Define your content pillars (3-5 themes you consistently create around) and SOCIAL:OS builds a rotating calendar that ensures balanced coverage. No more "what should I post today?" — the calendar tells you.

### Platform-native writing
Every post is written for the platform it's going to. LinkedIn posts get professional hooks. X posts get punchy openers. Newsletter intros get curiosity-driven leads. Not cross-posting — native writing per platform.

### Content repurposing
One idea becomes five posts. `/social:repurpose` takes a LinkedIn post and adapts it for X, newsletter, Instagram caption, and a thread — each in the native format for that platform.

### Thread builder
`/social:thread` creates multi-post threads for LinkedIn and X. Proper hook, narrative flow, and strong close. Each post stands alone but the series builds a complete argument.

### Engagement management
`/social:engage` scans comments and replies across platforms, drafts thoughtful responses, and flags high-value engagement opportunities. Never miss a conversation that matters.

### Community building
`/social:community` tracks your most engaged followers, identifies potential advocates, and suggests relationship-building actions. Community is not an afterthought.

### Hashtag strategy
Research-driven hashtag selection per platform. Mix of high-reach and niche hashtags, rotation to avoid repetition, and performance tracking to optimize over time.

### Newsletter growth
`/social:newsletter` manages your newsletter workflow — content creation, growth tactics, subscriber engagement, and cross-promotion between social and email.

### A/B testing
Test hooks, CTAs, posting times, hashtag sets, and content formats. Statistical significance rules before declaring winners. Winners feed back into defaults.

### Competitor monitoring
`/social:watch-competitors` tracks competitor posting patterns, content themes, engagement rates, and growth. Surfaces actionable insights — "Competitor X gets 3x engagement on educational posts" --> adjust your mix.

### Daily briefing
`/social:today` scans everything and tells you what to do right now. Comments to reply to? Content to publish? Trending topics to jump on? Prioritized by urgency.

### Analytics & attribution
Track impressions, engagement rate, follower growth, click-throughs, and conversions per platform, per pillar, per content type. Know what works and do more of it.

### Parallel processing (Swarm)
Spin up parallel agents for content creation, engagement management, competitor research, and analytics at scale.

---

## Smart defaults, full control

SOCIAL:OS ships with sensible defaults for everything:

- **Content:** Hook-driven openers, 1-2 sentence paragraphs, single CTA per post, banned spam phrases
- **Posting:** Platform-specific optimal times, minimum 4 hours between posts, holiday awareness for 20+ countries
- **Engagement:** Reply within 2 hours, thoughtful responses (not generic), prioritize high-value interactions
- **Hashtags:** 3-5 per LinkedIn post, 2-3 per X post, research-backed selection, weekly rotation

**Every default is overridable per workspace.** Add a `## Posting overrides` section to RULES.md, change voice rules in TOV.md, adjust posting frequency in CALENDAR.md. If you don't override, the defaults just work.

---

## All commands

### Setup
| Command | What it does |
|---------|-------------|
| `/social:onboard <name>` | Onboard a new workspace (full, `--quick`, or deep-dive) |
| `/social:deep-dive <name>` | Build content strategy from existing content and analytics |
| `/social:research <name>` | Research audience, competitors, and platform opportunities |
| `/social:switch <name>` | Switch active workspace |
| `/social:status` | Show workspace status and commands |
| `/social:dashboard <ws>` | Smart dashboard — what needs attention now |
| `/social:today <ws>` | Daily action briefing — what to do right now |
| `/social:portfolio` | Multi-workspace dashboard for agencies |

### Create
| Command | What it does |
|---------|-------------|
| `/social:write <ws> [platform]` | Draft a post for a specific platform |
| `/social:thread <ws> [platform]` | Create a multi-post thread |
| `/social:repurpose <ws> <source>` | Adapt content across platforms |
| `/social:newsletter <ws>` | Draft a newsletter edition |
| `/social:ideate <ws> [pillar]` | Generate content ideas from signals and trends |
| `/social:calendar <ws> [period]` | Build or view content calendar |
| `/social:batch <ws> [count]` | Create multiple posts in one session |
| `/social:templates` | Browse saved content templates |
| `/social:save-template <ws> <post>` | Save a high-performing post as a template |
| `/social:validate-content <ws>` | QA check content against all rules |

### Publish
| Command | What it does |
|---------|-------------|
| `/social:schedule <ws> [campaign]` | Queue content with optimal timing |
| `/social:publish <ws> [campaign]` | Push to platforms with publishing check |
| `/social:ab-test <ws> [campaign]` | Set up, check, or resolve an A/B test |

### Engage
| Command | What it does |
|---------|-------------|
| `/social:engage <ws>` | Manage comments, replies, and DMs across platforms |
| `/social:community <ws>` | Community management — advocates, relationships, growth |
| `/social:linkedin-engage <ws>` | LinkedIn-specific engagement workflow via Crispy |
| `/social:sync <ws>` | Pull latest data from connected tools |
| `/social:health <ws> [campaign]` | Full content health check with pattern detection |
| `/social:analytics <ws> [period]` | Deep performance analysis across platforms |
| `/social:watch-competitors <ws>` | Monitor competitor content, engagement, and growth |
| `/social:hashtag-audit <ws>` | Review and optimize hashtag performance |
| `/social:audience-insights <ws>` | Analyze audience demographics, interests, and behavior |

### Newsletter
| Command | What it does |
|---------|-------------|
| `/social:newsletter-write <ws>` | Draft a newsletter edition |
| `/social:newsletter-grow <ws>` | Growth tactics — cross-promotion, lead magnets, referrals |
| `/social:newsletter-health <ws>` | Open rates, click rates, growth, and churn analysis |

### Review
| Command | What it does |
|---------|-------------|
| `/social:brief-audit <ws>` | Check brand brief for gaps |
| `/social:debrief <ws> <campaign>` | End-of-campaign review with forward-feed |
| `/social:report <ws> [period]` | Performance report (weekly/monthly/quarterly) |
| `/social:costs <ws> [--all]` | View spend by tool, campaign, or agency-wide |
| `/social:auto-refine <ws>` | Suggest content, voice, and strategy refinements from data |
| `/social:archive <ws>` | Archive completed campaign or workspace |
| `/social:feedback` | Report a bug or request a feature |

### Parallel processing (optional)
| Command | What it does |
|---------|-------------|
| `/social:swarm write <ws>` | Create content at scale |
| `/social:swarm engage <ws>` | Process engagement batches in parallel |
| `/social:swarm research <ws>` | Research competitors and trends in parallel |
| `/social:swarm analytics <ws>` | Analyze performance across platforms in parallel |

### Team mode (optional)
| Command | What it does |
|---------|-------------|
| `/social:collab setup` | Connect Supabase for multi-user |
| `/social:collab status` | Check connection and active users |
| `/social:collab invite` | Invite a team member |
| `/social:collab sync` | Sync local files to Supabase |

---

## Workspaces

Each workspace is fully isolated — its own brand, audience, pillars, voice, tools, costs, and analytics. A workspace can be:

- An agency client
- A personal brand
- A product brand
- A sub-brand or market
- Any unit of social media that deserves its own context

---

## Notifications (optional)

Connect Slack to get real-time alerts:
- High-value comment received
- Post performance exceeds benchmarks
- Budget threshold crossed
- Engagement rate drop detected

Configure in COLLABORATION.md. Works via Slack MCP.

---

## Team mode (optional)

By default SOCIAL:OS runs in **solo mode** — all state lives in markdown, no database needed.

For teams, enable **team mode** with Supabase:

1. Create a Supabase project
2. Run `supabase/migrations/001_initial_schema.sql`
3. Add keys to `.env`
4. Run `/social:collab setup`

Adds: shared content calendar, claim-based engagement handling, live cost tracking, analytics sync, approval audit trail, activity feed. Falls back to files automatically if Supabase is unreachable.

---

## Repo structure

```
SOCIALOS/
├── CLAUDE.md                   <- Entrypoint for Claude Code
├── SOCIALOS.md                 <- All rules and behaviour
├── CHANGELOG.md                <- Version history
├── .env.example                <- API key template
├── _template/                  <- Workspace template (copied on onboard)
├── workspaces/                 <- One folder per workspace
├── commands/                   <- Workflow reference docs
├── global/                     <- Cross-workspace standards
│   ├── RULES-GLOBAL.md         <- Global quality rules
│   ├── content-library.md      <- Reusable content fragments
│   ├── swipe-file.md           <- High-performing post examples
│   └── feedback-log.md         <- Feedback tracking
├── .claude/
│   ├── commands/social/        <- Slash commands (/social:*)
│   └── socialos/references/    <- System references
│       ├── api-reference.md    <- API endpoints for all tools
│       ├── BENCHMARKS.md       <- Industry engagement benchmarks
│       ├── community-playbook.md <- Community management rules
│       ├── content-frameworks.md <- Proven content frameworks
│       ├── defaults.md         <- All overridable defaults
│       ├── distribution-playbook.md <- Cross-platform distribution rules
│       ├── engagement-playbook.md <- Engagement and reply rules
│       ├── hashtag-strategy.md <- Hashtag research and selection
│       ├── newsletter-playbook.md <- Newsletter strategy and growth
│       ├── notifications.md    <- Slack alert configuration
│       ├── platform-specs.md   <- Character limits, image sizes, video specs
│       ├── report-template.md  <- Performance report formats
│       ├── social-writing-skill.md <- Social copy writing principles
│       ├── swarm.md            <- Parallel agent architecture
│       ├── tool-pricing.md     <- Per-unit pricing for all tools
│       └── ui-brand.md         <- Visual standards and formatting
└── supabase/                   <- Team mode schema (optional)
```

---

## FAQ

**Do I need all the tools listed?**
No. Every tool is optional. SOCIAL:OS works with whatever you have connected and tells you what's missing. Start with one platform and expand.

**Can I use this for multiple brands?**
Yes. Each brand gets its own workspace with isolated brand guidelines, voice, audience, and content pillars. The `/social:portfolio` command gives you a cross-brand overview.

**Does this auto-post without my approval?**
Never. SOCIAL:OS always shows you what it's about to publish and waits for explicit approval. The "approve / reject / edit" gate is non-negotiable.

**What platforms are supported?**
LinkedIn, X/Twitter, Instagram, Facebook, YouTube, TikTok, and newsletters (Beehiiv, ConvertKit, Substack). Any platform with an API can be added.

**Can I use this with my agency's clients?**
Yes. SOCIAL:OS was designed for multi-workspace management. Each client gets an isolated workspace. Cross-workspace learnings help you spot patterns that work everywhere.

**How does it handle engagement/comments?**
`/social:engage` scans comments and replies, classifies them by type and priority, drafts thoughtful responses, and presents them for your approval. It never auto-replies without human review on first run.

**Is my data sent anywhere?**
SOCIAL:OS runs locally in Claude Code. Your content, brand data, and analytics stay in your local markdown files. API calls go only to the tools you've connected.

---

## Feedback

Found a bug? Want a feature? Run `/social:feedback` inside Claude Code, or open an issue on this repo.

---

## License

MIT — Built by [Shyft AI](https://shyft.ai)
