-- SOCIAL:OS Hashtag Tracking
-- Performance data and curated sets for hashtag strategy.

-- ============================================================
-- HASHTAG PERFORMANCE
-- ============================================================
create table public.hashtag_performance (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  hashtag text not null,
  platform text not null check (platform in (
    'linkedin', 'twitter', 'instagram', 'tiktok', 'youtube', 'threads', 'reddit', 'newsletter'
  )),
  times_used int not null default 0,
  avg_engagement_rate numeric(6,4) not null default 0,
  avg_reach int not null default 0,
  last_used timestamptz,
  pillar text,
  tier text not null default 'industry' check (tier in (
    'branded', 'industry', 'trending', 'niche', 'community'
  )),
  unique (workspace_id, hashtag, platform)
);

create index idx_hashtag_perf_workspace on public.hashtag_performance(workspace_id);
create index idx_hashtag_perf_platform on public.hashtag_performance(workspace_id, platform);
create index idx_hashtag_perf_tier on public.hashtag_performance(workspace_id, tier);
create index idx_hashtag_perf_engagement on public.hashtag_performance(workspace_id, avg_engagement_rate desc);

-- ============================================================
-- HASHTAG SETS
-- ============================================================
create table public.hashtag_sets (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid not null references public.workspaces(workspace_id) on delete cascade,
  name text not null,
  pillar text,
  hashtags text[] not null default '{}',
  platform text not null check (platform in (
    'linkedin', 'twitter', 'instagram', 'tiktok', 'youtube', 'threads', 'reddit', 'newsletter'
  )),
  created_at timestamptz not null default now(),
  unique (workspace_id, name, platform)
);

create index idx_hashtag_sets_workspace on public.hashtag_sets(workspace_id);
create index idx_hashtag_sets_platform on public.hashtag_sets(workspace_id, platform);
create index idx_hashtag_sets_pillar on public.hashtag_sets(workspace_id, pillar);

-- ============================================================
-- USEFUL VIEWS
-- ============================================================

-- Top hashtags per platform
create view public.top_hashtags as
select
  workspace_id,
  platform,
  hashtag,
  tier,
  times_used,
  avg_engagement_rate,
  avg_reach,
  last_used
from public.hashtag_performance
where times_used > 0
order by workspace_id, platform, avg_engagement_rate desc;

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================
alter table public.hashtag_performance enable row level security;
alter table public.hashtag_sets enable row level security;

create policy "Scoped hashtag_performance access"
  on public.hashtag_performance for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

create policy "Scoped hashtag_sets access"
  on public.hashtag_sets for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));
