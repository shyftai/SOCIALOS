-- SOCIAL:OS Team Mode Schema
-- Run this migration to set up the shared state layer for social media workflows.
-- File-based mode still works without this — Supabase is optional.

-- ============================================================
-- WORKSPACES
-- ============================================================
create table public.workspaces (
  workspace_id uuid primary key default gen_random_uuid(),
  name text not null unique,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  config jsonb not null default '{}'::jsonb
);

-- ============================================================
-- TEAM MEMBERS
-- ============================================================
create table public.team_members (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  email text not null,
  role text not null default 'operator' check (role in ('owner', 'approver', 'operator', 'viewer')),
  created_at timestamptz not null default now(),
  unique (workspace_id, email)
);

create index idx_team_members_workspace on public.team_members(workspace_id);

-- ============================================================
-- CONTENT DRAFTS
-- ============================================================
create table public.content_drafts (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  platform text not null check (platform in (
    'linkedin', 'twitter', 'instagram', 'tiktok', 'youtube', 'threads', 'reddit', 'newsletter'
  )),
  content_type text not null check (content_type in (
    'post', 'carousel', 'thread', 'reel', 'story', 'newsletter'
  )),
  title text,
  body text,
  hashtags text[] default '{}',
  status text not null default 'draft' check (status in (
    'draft', 'review', 'approved', 'scheduled', 'published'
  )),
  created_by text,
  approved_by text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  scheduled_for timestamptz,
  published_at timestamptz
);

create index idx_content_drafts_workspace on public.content_drafts(workspace_id);
create index idx_content_drafts_status on public.content_drafts(workspace_id, status);
create index idx_content_drafts_platform on public.content_drafts(workspace_id, platform);
create index idx_content_drafts_scheduled on public.content_drafts(workspace_id, scheduled_for)
  where scheduled_for is not null;

-- ============================================================
-- CONTENT CALENDAR
-- ============================================================
create table public.content_calendar (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  content_draft_id uuid references public.content_drafts(id) on delete set null,
  platform text not null check (platform in (
    'linkedin', 'twitter', 'instagram', 'tiktok', 'youtube', 'threads', 'reddit', 'newsletter'
  )),
  scheduled_date date not null,
  scheduled_time time,
  pillar text,
  status text not null default 'planned' check (status in (
    'planned', 'drafted', 'approved', 'scheduled', 'published', 'missed'
  )),
  notes text
);

create index idx_calendar_workspace_date on public.content_calendar(workspace_id, scheduled_date);
create index idx_calendar_status on public.content_calendar(workspace_id, status);
create index idx_calendar_platform on public.content_calendar(workspace_id, platform);

-- ============================================================
-- ENGAGEMENT QUEUE
-- ============================================================
create table public.engagement_queue (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  platform text not null check (platform in (
    'linkedin', 'twitter', 'instagram', 'tiktok', 'youtube', 'threads', 'reddit', 'newsletter'
  )),
  type text not null check (type in ('comment', 'dm', 'mention', 'reply')),
  source_url text,
  source_content text,
  sentiment text not null default 'neutral' check (sentiment in (
    'positive', 'neutral', 'negative', 'spam'
  )),
  status text not null default 'pending' check (status in (
    'pending', 'claimed', 'responded', 'escalated'
  )),
  claimed_by text,
  response_draft text,
  created_at timestamptz not null default now(),
  responded_at timestamptz
);

create index idx_engagement_workspace_status on public.engagement_queue(workspace_id, status);
create index idx_engagement_platform on public.engagement_queue(workspace_id, platform);
create index idx_engagement_sentiment on public.engagement_queue(workspace_id, sentiment);

-- ============================================================
-- ANALYTICS SNAPSHOTS
-- ============================================================
create table public.analytics_snapshots (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  platform text not null check (platform in (
    'linkedin', 'twitter', 'instagram', 'tiktok', 'youtube', 'threads', 'reddit', 'newsletter'
  )),
  date date not null,
  followers int not null default 0,
  following int not null default 0,
  impressions int not null default 0,
  reach int not null default 0,
  engagement_rate numeric(6,4) not null default 0,
  top_post_url text,
  notes text,
  unique (workspace_id, platform, date)
);

create index idx_analytics_workspace_date on public.analytics_snapshots(workspace_id, date desc);
create index idx_analytics_platform on public.analytics_snapshots(workspace_id, platform);

-- ============================================================
-- NEWSLETTER METRICS
-- ============================================================
create table public.newsletter_metrics (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  edition_date date not null,
  subject_line text,
  subscribers int not null default 0,
  opens int not null default 0,
  open_rate numeric(6,4) not null default 0,
  clicks int not null default 0,
  ctr numeric(6,4) not null default 0,
  unsubscribes int not null default 0,
  new_subscribers int not null default 0,
  unique (workspace_id, edition_date)
);

create index idx_newsletter_workspace_date on public.newsletter_metrics(workspace_id, edition_date desc);

-- ============================================================
-- APPROVAL LOG
-- ============================================================
create table public.approval_log (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  content_draft_id uuid not null references public.content_drafts(id) on delete cascade,
  action text not null check (action in (
    'submitted', 'approved', 'rejected', 'revision_requested'
  )),
  actor text not null,
  notes text,
  created_at timestamptz not null default now()
);

create index idx_approval_log_draft on public.approval_log(content_draft_id);
create index idx_approval_log_workspace on public.approval_log(workspace_id, created_at desc);

-- ============================================================
-- ACTIVITY FEED
-- ============================================================
create table public.activity_feed (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  actor text not null,
  action text not null,
  target_type text,
  target_id uuid,
  details jsonb default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index idx_activity_workspace on public.activity_feed(workspace_id, created_at desc);

-- ============================================================
-- USEFUL VIEWS
-- ============================================================

-- Weekly content output by platform
create view public.content_output_summary as
select
  workspace_id,
  platform,
  status,
  count(*) as total,
  count(*) filter (where published_at >= now() - interval '7 days') as last_7_days,
  count(*) filter (where published_at >= now() - interval '30 days') as last_30_days
from public.content_drafts
group by workspace_id, platform, status;

-- Engagement queue backlog
create view public.engagement_backlog as
select
  workspace_id,
  platform,
  sentiment,
  status,
  count(*) as total
from public.engagement_queue
group by workspace_id, platform, sentiment, status;

-- Latest analytics per platform
create view public.latest_analytics as
select distinct on (workspace_id, platform)
  workspace_id,
  platform,
  date,
  followers,
  following,
  impressions,
  reach,
  engagement_rate,
  top_post_url
from public.analytics_snapshots
order by workspace_id, platform, date desc;

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================

alter table public.workspaces enable row level security;
alter table public.team_members enable row level security;
alter table public.content_drafts enable row level security;
alter table public.content_calendar enable row level security;
alter table public.engagement_queue enable row level security;
alter table public.analytics_snapshots enable row level security;
alter table public.newsletter_metrics enable row level security;
alter table public.approval_log enable row level security;
alter table public.activity_feed enable row level security;

-- Members can read their workspaces
create policy "Members can read workspaces"
  on public.workspaces for select
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

-- Owners can manage workspaces
create policy "Owners can manage workspaces"
  on public.workspaces for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email' and tm.role = 'owner'
  ));

-- Members can read team membership
create policy "Members can read team"
  on public.team_members for select
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

-- Scoped access for all operational tables
create policy "Scoped content_drafts access"
  on public.content_drafts for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

create policy "Scoped content_calendar access"
  on public.content_calendar for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

create policy "Scoped engagement_queue access"
  on public.engagement_queue for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

create policy "Scoped analytics_snapshots access"
  on public.analytics_snapshots for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

create policy "Scoped newsletter_metrics access"
  on public.newsletter_metrics for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

create policy "Scoped approval_log access"
  on public.approval_log for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

create policy "Scoped activity_feed access"
  on public.activity_feed for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

-- ============================================================
-- UPDATED_AT TRIGGERS
-- ============================================================
create or replace function public.update_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger workspaces_updated_at
  before update on public.workspaces
  for each row execute function public.update_updated_at();

create trigger content_drafts_updated_at
  before update on public.content_drafts
  for each row execute function public.update_updated_at();
