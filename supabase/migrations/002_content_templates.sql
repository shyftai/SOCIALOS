-- SOCIAL:OS Content Templates
-- Reusable content structures — global (workspace_id null) or workspace-scoped.

-- ============================================================
-- CONTENT TEMPLATES
-- ============================================================
create table public.content_templates (
  id uuid primary key default gen_random_uuid(),
  workspace_id uuid references public.workspaces(workspace_id) on delete cascade,
  name text not null,
  platform text not null check (platform in (
    'linkedin', 'twitter', 'instagram', 'tiktok', 'youtube', 'threads', 'reddit', 'newsletter'
  )),
  content_type text not null check (content_type in (
    'post', 'carousel', 'thread', 'reel', 'story', 'newsletter'
  )),
  structure jsonb not null default '{}'::jsonb,
  tags text[] default '{}',
  usage_count int not null default 0,
  created_by text,
  created_at timestamptz not null default now()
);

create index idx_templates_workspace on public.content_templates(workspace_id);
create index idx_templates_platform on public.content_templates(platform);
create index idx_templates_type on public.content_templates(content_type);
create index idx_templates_tags on public.content_templates using gin(tags);

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================
alter table public.content_templates enable row level security;

-- Anyone can read global templates (workspace_id is null)
create policy "Anyone can read global templates"
  on public.content_templates for select
  using (workspace_id is null);

-- Members can read their workspace templates
create policy "Members can read workspace templates"
  on public.content_templates for select
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));

-- Members can manage their workspace templates
create policy "Members can manage workspace templates"
  on public.content_templates for all
  using (workspace_id in (
    select tm.workspace_id from public.team_members tm
    where tm.email = auth.jwt()->>'email'
  ));
