# Changelog

## v1.1.0 — 2026-03-27

### Added
- `/social:save-template` — save proven content formats as reusable templates
- `/social:use-template` — create new content from saved templates
- `/social:forecast` — 30/60/90 day growth projections with best/expected/worst scenarios
- `audience-scoring.md` — weighted scoring framework for prioritizing audiences, creators, and communities
- `growth-waterfall.md` — cascading discovery and engagement logic for audience growth
- `content-scoring.md` — content quality scoring (0-100) with auto-scoring in /social:write
- `tool-setup-guides.md` — step-by-step setup for Buffer, Typefully, Meta, Twitter, Beehiiv, ConvertKit, Crispy, Slack
- `global/snippet-library.md` — reusable hooks, CTAs, response templates, hashtag sets
- `global/swipe-file.md` — anonymized content examples across platforms
- `global/feedback-log.md` — feedback tracking via /social:feedback
- `global/templates/` — directory for saved content templates
- `SCRAPE-JOURNAL.md` — social research logging template
- Supabase migrations for team mode (9 tables, 3 views, RLS policies, seed data)
- Content staging directories (`content/drafts/`, `content/approved/`, `content/published/`)

### Changed
- `/social:write` — now loads and applies LEARNINGS.md before drafting, surfaces relevant learnings, prompts for new learning capture after approval
- `/social:brief` — now loads LEARNINGS.md for past performance context and flags anti-learnings
- `/social:engage` — now applies engagement learnings to response suggestions and tracks new patterns
- 6 commands updated with proper `execution_context` references (analytics, dashboard, portfolio, research, review, status)
- `CLAUDE.md` — added 4 new reference files to key references list

## v1.0.0 — 2026-03-27

### Initial release
- Full SOCIAL:OS operating system for Claude Code
- 33 slash commands covering content creation, scheduling, engagement, analytics, and growth
- 16 reference files with platform specs, writing skills, benchmarks, and playbooks
- Workspace template with 14 source-of-truth files
- Support for LinkedIn, Twitter/X, Instagram, TikTok, YouTube, Threads, Reddit
- Newsletter creation and management (Beehiiv, ConvertKit)
- Swarm architecture for parallel content operations
- Community engagement playbooks
- Hashtag strategy and research
- Competitive analysis and monitoring
- Agency mode with multi-workspace portfolio
- Team collaboration via Supabase (optional)
