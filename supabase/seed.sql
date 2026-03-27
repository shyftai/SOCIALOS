-- SOCIAL:OS Seed Data
-- Sample workspace, team, and content for local development.

-- ============================================================
-- WORKSPACE
-- ============================================================
insert into public.workspaces (workspace_id, name, config) values
  ('a0000000-0000-0000-0000-000000000001', 'Acme Social', '{
    "default_platforms": ["linkedin", "twitter", "newsletter"],
    "posting_cadence": {
      "linkedin": 5,
      "twitter": 14,
      "newsletter": 1
    },
    "brand_voice": "professional but human",
    "approval_required": true
  }'::jsonb);

-- ============================================================
-- TEAM MEMBERS
-- ============================================================
insert into public.team_members (workspace_id, email, role) values
  ('a0000000-0000-0000-0000-000000000001', 'owner@acme.com', 'owner'),
  ('a0000000-0000-0000-0000-000000000001', 'social-manager@acme.com', 'operator');

-- ============================================================
-- CONTENT DRAFTS — one per platform
-- ============================================================
insert into public.content_drafts (workspace_id, platform, content_type, title, body, hashtags, status, created_by) values
  ('a0000000-0000-0000-0000-000000000001', 'linkedin', 'post',
   'Thought leadership on AI in GTM',
   'We tested 12 AI SDR tools over 90 days. Here is what actually moved pipeline (and what was pure hype).',
   array['#GTM', '#AIinSales', '#B2BSaaS'],
   'draft', 'social-manager@acme.com'),

  ('a0000000-0000-0000-0000-000000000001', 'twitter', 'thread',
   'Cold email is not dead — thread',
   '1/ Cold email is not dead. Your approach is.\n\nHere are 7 changes we made that 3x''d reply rates.',
   array['#ColdEmail', '#SalesThread'],
   'review', 'social-manager@acme.com'),

  ('a0000000-0000-0000-0000-000000000001', 'instagram', 'carousel',
   'ICP checklist carousel',
   'Slide 1: Is your ICP actually defined?\nSlide 2: 5 signals that matter\nSlide 3: Template download CTA',
   array['#ICP', '#B2BMarketing'],
   'draft', 'social-manager@acme.com'),

  ('a0000000-0000-0000-0000-000000000001', 'tiktok', 'reel',
   'Day in the life of a GTM operator',
   'Quick-cut montage: enrichment waterfall, campaign launch, reply handling, pipeline update.',
   array['#GTMOps', '#DayInTheLife', '#TechTok'],
   'draft', 'social-manager@acme.com'),

  ('a0000000-0000-0000-0000-000000000001', 'youtube', 'post',
   'Full walkthrough: building outbound from scratch',
   'Long-form video covering ICP definition through to first 100 sends. Companion to the newsletter deep-dive.',
   array['#OutboundSales', '#Tutorial'],
   'draft', 'social-manager@acme.com'),

  ('a0000000-0000-0000-0000-000000000001', 'threads', 'post',
   'Hot take: most social calendars are fiction',
   'You plan 30 posts. You publish 8. The calendar is not the problem — the workflow is.',
   array['#ContentStrategy'],
   'draft', 'social-manager@acme.com'),

  ('a0000000-0000-0000-0000-000000000001', 'reddit', 'post',
   'r/sales: our actual cold email results',
   'Sharing real numbers from 50k sends across 6 campaigns. AMA in comments.',
   array[],
   'draft', 'social-manager@acme.com'),

  ('a0000000-0000-0000-0000-000000000001', 'newsletter', 'newsletter',
   'The GTM Playbook #001',
   'This week: why your enrichment waterfall is leaking 40% of valid contacts, and how to fix it in 30 minutes.',
   array[],
   'scheduled', 'owner@acme.com');

-- ============================================================
-- CONTENT CALENDAR — next week plan
-- ============================================================
insert into public.content_calendar (workspace_id, platform, scheduled_date, pillar, status, notes) values
  ('a0000000-0000-0000-0000-000000000001', 'linkedin', current_date + 1, 'thought-leadership', 'planned', 'AI in GTM post'),
  ('a0000000-0000-0000-0000-000000000001', 'twitter', current_date + 1, 'tactical', 'planned', 'Cold email thread'),
  ('a0000000-0000-0000-0000-000000000001', 'linkedin', current_date + 3, 'case-study', 'planned', 'Customer win story'),
  ('a0000000-0000-0000-0000-000000000001', 'newsletter', current_date + 5, 'deep-dive', 'planned', 'GTM Playbook #001'),
  ('a0000000-0000-0000-0000-000000000001', 'instagram', current_date + 2, 'educational', 'planned', 'ICP checklist carousel');

-- ============================================================
-- ENGAGEMENT QUEUE — sample items
-- ============================================================
insert into public.engagement_queue (workspace_id, platform, type, source_content, sentiment, status) values
  ('a0000000-0000-0000-0000-000000000001', 'linkedin', 'comment', 'Great post! We saw similar results with our outbound.', 'positive', 'pending'),
  ('a0000000-0000-0000-0000-000000000001', 'twitter', 'mention', '@acme how do you handle enrichment at scale?', 'neutral', 'pending'),
  ('a0000000-0000-0000-0000-000000000001', 'linkedin', 'dm', 'Hey, would love to chat about your GTM stack.', 'positive', 'pending');

-- ============================================================
-- ANALYTICS SNAPSHOTS — baseline
-- ============================================================
insert into public.analytics_snapshots (workspace_id, platform, date, followers, following, impressions, reach, engagement_rate) values
  ('a0000000-0000-0000-0000-000000000001', 'linkedin', current_date - 1, 4820, 1200, 32000, 18500, 0.0340),
  ('a0000000-0000-0000-0000-000000000001', 'twitter', current_date - 1, 2150, 890, 14200, 8300, 0.0210),
  ('a0000000-0000-0000-0000-000000000001', 'instagram', current_date - 1, 1340, 620, 8800, 5100, 0.0420);

-- ============================================================
-- NEWSLETTER METRICS — first edition
-- ============================================================
insert into public.newsletter_metrics (workspace_id, edition_date, subject_line, subscribers, opens, open_rate, clicks, ctr, unsubscribes, new_subscribers) values
  ('a0000000-0000-0000-0000-000000000001', current_date - 7, 'The GTM Playbook #000 — Welcome', 520, 312, 0.6000, 89, 0.1712, 2, 45);

-- ============================================================
-- CONTENT TEMPLATES — global starters
-- ============================================================
insert into public.content_templates (workspace_id, name, platform, content_type, structure, tags, created_by) values
  (null, 'LinkedIn Hook + Story + CTA', 'linkedin', 'post', '{
    "sections": [
      {"name": "hook", "description": "Bold opening line — pattern interrupt or hot take", "max_chars": 150},
      {"name": "story", "description": "Personal experience or data point — 3-5 lines", "max_chars": 600},
      {"name": "cta", "description": "Question or action — drive comments", "max_chars": 100}
    ],
    "guidelines": "No hashtags in body. Add 3-5 hashtags as first comment."
  }'::jsonb, array['thought-leadership', 'engagement'], 'system'),

  (null, 'Twitter Thread (5-7 tweets)', 'twitter', 'thread', '{
    "sections": [
      {"name": "hook_tweet", "description": "Standalone tweet that drives curiosity", "max_chars": 280},
      {"name": "body_tweets", "description": "3-5 tweets delivering value", "max_chars_each": 280},
      {"name": "closer", "description": "Summary + CTA to retweet or follow", "max_chars": 280}
    ],
    "guidelines": "Number each tweet. Use line breaks for readability."
  }'::jsonb, array['thread', 'tactical'], 'system'),

  (null, 'Newsletter Edition', 'newsletter', 'newsletter', '{
    "sections": [
      {"name": "subject_line", "description": "Under 50 chars, curiosity-driven"},
      {"name": "preview_text", "description": "Complement the subject, do not repeat"},
      {"name": "intro", "description": "1-2 sentences — why this matters now"},
      {"name": "main_section", "description": "Core content — actionable, opinionated"},
      {"name": "quick_hits", "description": "2-3 bullet links or tips"},
      {"name": "cta", "description": "One clear ask — reply, share, or click"}
    ],
    "guidelines": "Keep under 800 words total. One main topic per edition."
  }'::jsonb, array['newsletter', 'deep-dive'], 'system');

-- ============================================================
-- HASHTAG SETS — starter kits
-- ============================================================
insert into public.hashtag_sets (workspace_id, name, pillar, hashtags, platform) values
  ('a0000000-0000-0000-0000-000000000001', 'GTM Core', 'thought-leadership',
   array['#GTM', '#GoToMarket', '#B2BSaaS', '#RevenueOps', '#SalesOps'], 'linkedin'),
  ('a0000000-0000-0000-0000-000000000001', 'Outbound Tactics', 'tactical',
   array['#ColdEmail', '#Outbound', '#SDR', '#SalesDev', '#Pipeline'], 'twitter'),
  ('a0000000-0000-0000-0000-000000000001', 'B2B Visual', 'educational',
   array['#B2BMarketing', '#SaaS', '#MarketingTips', '#ContentMarketing'], 'instagram');

-- ============================================================
-- HASHTAG PERFORMANCE — baseline data
-- ============================================================
insert into public.hashtag_performance (workspace_id, hashtag, platform, times_used, avg_engagement_rate, avg_reach, last_used, pillar, tier) values
  ('a0000000-0000-0000-0000-000000000001', '#GTM', 'linkedin', 12, 0.0380, 2400, now() - interval '2 days', 'thought-leadership', 'branded'),
  ('a0000000-0000-0000-0000-000000000001', '#ColdEmail', 'twitter', 8, 0.0250, 1100, now() - interval '3 days', 'tactical', 'industry'),
  ('a0000000-0000-0000-0000-000000000001', '#B2BSaaS', 'linkedin', 10, 0.0310, 1800, now() - interval '1 day', 'thought-leadership', 'industry');
