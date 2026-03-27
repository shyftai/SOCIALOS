# Collaboration Mode — SOCIAL:OS

## Mode
Set the collaboration mode for this SOCIAL:OS instance.

```
mode: solo
```

Options:
- **solo** -- File-based only. All state lives in markdown files. No database needed. Default.
- **team** -- Shared state via Supabase. Content calendars, approval queues, engagement assignments, and analytics sync in real-time. Markdown files still hold context (brand guidelines, tone of voice, content pillars, etc.).

---

## When to use team mode

Use team mode when:
- Multiple people manage the same social accounts
- You need real-time content calendar visibility across team members
- You want claim-based engagement handling (no double-responses to comments/DMs)
- You need an approval chain for content before publishing
- You run an agency with multiple operators per client
- You need audit trails for who approved and published what

Solo mode is fine when:
- One person manages all social accounts end-to-end
- You don't need real-time sync between operators

---

## Supabase connection (only needed in team mode)

Set these in `.env`:
```
SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_KEY=
```

The service key is only needed for admin operations (workspace creation, user management).
The anon key is used for all scoped operations (RLS enforces workspace isolation).

---

## What changes in team mode

| Operation | Solo mode | Team mode |
|-----------|-----------|-----------|
| Content calendar | Read CALENDAR.md | Query `content_calendar` table |
| Approval queue | Verbal in chat | Logged in `approvals` table |
| Engagement handling | Manual (one at a time) | Claim from `engagement_queue` (locked) |
| Cost logging | Write to COSTS.md | Insert into `cost_transactions` |
| Cost summary | Read COSTS.md | Query `cost_summary` view |
| Analytics | Read ANALYTICS.md | Query `social_analytics` view |
| Activity tracking | Workspace log file | `activity_feed` table |
| Newsletter status | Read NEWSLETTER.md | Query `newsletter_campaigns` table |

### What stays file-based in both modes
- BRAND.md, TOV.md, PILLARS.md (brand context -- changes infrequently)
- AUDIENCE.md (audience personas and segments)
- Content drafts and approved posts
- Research, inspiration, and content assets
- PLATFORMS.md (platform configuration reference)
- AB-TESTS.md (test design and results)
- BENCHMARKS.md (static reference)

---

## Setup instructions

1. Create a Supabase project at https://supabase.com
2. Run the migration: `supabase/migrations/001_initial_schema.sql`
3. Add your keys to `.env`
4. Change `mode: solo` to `mode: team` in this file
5. Run `/social:collab setup` to verify the connection and sync existing data

---

## User roles

| Role | Can do |
|------|--------|
| **owner** | Everything -- manage workspace, users, settings, platform connections |
| **approver** | Approve content, reply templates, budget overrides, campaign launches |
| **operator** | Create content, handle engagement, manage calendar, run campaigns |
| **viewer** | Read-only -- dashboards, analytics, content calendar |

Roles are set per workspace in the `workspace_members` table.

---

## Approval chains

Content approval flow (configurable per workspace):

| Content type | Default approval required | Approver |
|-------------|--------------------------|----------|
| Organic post | No (operator can publish) | -- |
| Paid/sponsored post | Yes | approver or owner |
| Crisis response | Yes | owner only |
| Newsletter send | Yes (first run), No (recurring) | approver or owner |
| New platform connection | Yes | owner only |
| Reply template changes | Yes | approver or owner |

Override defaults in workspace settings. In solo mode, approval is implicit (operator = approver).

---

## Activity feed

In team mode, all actions are logged to the `activity_feed` table:
- Content created, edited, approved, published, deleted
- Engagement claimed, responded, escalated
- Calendar changes
- Approval decisions
- Platform connection changes
- Cost transactions
