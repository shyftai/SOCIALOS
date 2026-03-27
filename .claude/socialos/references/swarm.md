# Agent Swarm -- Optional Parallel Execution

SOCIAL:OS supports optional agent swarms for high-volume content operations. Swarms are never the default --
they activate only when explicitly requested via the `--swarm` flag or the `/social:swarm` command.

---

## When to Use Swarms

- Creating content for 5+ posts in a batch
- Repurposing a single piece of content across 4+ platforms
- Processing engagement responses for 20+ comments
- Researching hashtags or trends across multiple topics
- Generating newsletter + social derivatives from a single source
- Analyzing competitor content across multiple accounts
- Building a content calendar for 2+ weeks at once

## When NOT to Use Swarms

- Single post or small batch (<5 posts) -- sequential is faster
- Tasks requiring human approval at every step -- swarm overhead is not worth it
- First content batch for a workspace -- get the voice and style right sequentially first
- Newsletter writing -- newsletters should be written individually with care

---

## Execution Mode -- Claude Code vs API

For large-scale operations, ask the user how they want to run it:

```
  How do you want to run this?

  >> Claude Code (default) -- runs here, you see results in real time
     Best for: <20 posts, interactive review, first-time runs

  >> API (faster, more scale) -- runs via Anthropic API in the background
     Best for: 20-100+ posts, batch processing, content calendar builds
     Requires: ANTHROPIC_API_KEY in .env
```

**Claude Code mode:** Uses agent swarm within the current session. Interactive, real-time review, but limited by session context.

**API mode:** Spawns work via the Anthropic API. Results saved to files, user reviews when ready. Handles 50-200+ pieces of content without session limits. Requires API key.

Always ask before choosing -- never default to API mode without user consent.

---

## Swarm Architecture

```
                    ORCHESTRATOR
                   (stays lean -- coordinates only)
                         |
              +----------+----------+
              |          |          |
           WAVE 1     WAVE 2     WAVE 3
           (parallel)  (after 1)  (after 2)
              |
    +---------+---------+
    |         |         |
  Agent A   Agent B   Agent C
  (LI posts) (tweets)  (IG carousels)
```

**Orchestrator role:**
- Loads workspace context once (TOV, content pillars, brand guidelines)
- Splits work into batches by platform or content type
- Spawns agents per batch
- Collects results
- Presents unified output for approval
- Never creates content itself

**Agent role:**
- Receives batch assignment + full workspace context paths
- Reads context fresh (TOV, CONTENT-PILLARS, BRAND, platform specs)
- Creates each piece of content in its batch
- Validates against platform specs and brand voice
- Returns structured drafts
- Never publishes or schedules anything -- returns drafts only

---

## Batch Sizing

| Operation | Default batch size | Max parallel agents |
|-----------|-------------------|---------------------|
| LinkedIn post creation | 5 posts per agent | 4 |
| Twitter/X tweet/thread creation | 5 tweets per agent | 4 |
| Instagram content creation | 3 posts per agent | 3 |
| TikTok script writing | 3 scripts per agent | 3 |
| YouTube Shorts scripts | 3 scripts per agent | 3 |
| Carousel creation | 2 carousels per agent | 3 |
| Newsletter drafting | 1 newsletter per agent | 2 |
| Content repurposing (multi-platform) | 3 source pieces per agent | 5 |
| Engagement response drafting | 20 comments per agent | 4 |
| Hashtag research | 5 topics per agent | 3 |
| Competitor content analysis | 3 competitors per agent | 4 |
| Content calendar building | 1 week per agent | 4 |

---

## Swarm Output Format

Every agent returns a structured result. Orchestrator collects all results and presents them
in a single unified view for approval.

```
<< SOCIAL:OS // SWARM COMPLETE >>

  +-- SWARM RESULTS ------------------------------------------------+
  |                                                                   |
  |  Agents spawned:    {n}                                           |
  |  Content created:   {n} pieces                                    |
  |  Platforms covered:  {list}                                       |
  |  Drafts ready:      {n}                                           |
  |  Flagged:           {n} (need manual review)                      |
  |  Errors:            {n}                                           |
  |                                                                   |
  +-------------------------------------------------------------------+
```

Then each draft is presented sequentially for approval -- or if the user trusts the output,
they can batch-approve with `>> Approve all` (only available after reviewing at least 3 samples).

### Draft Presentation Format

```
+-- DRAFT {n}/{total} -- {platform} --------------------------------+
|                                                                     |
|  Type: {post/thread/carousel/reel script/newsletter}                |
|  Platform: {platform}                                               |
|  Scheduled: {date/time or "unscheduled"}                            |
|                                                                     |
|  Content:                                                           |
|  {the actual content}                                               |
|                                                                     |
|  Hashtags: {hashtags}                                               |
|  CTA: {cta type}                                                    |
|  Framework: {framework used}                                        |
|                                                                     |
|  Quality checks:                                                    |
|  [x] Brand voice match                                              |
|  [x] Platform specs met                                             |
|  [x] Hook strength validated                                        |
|  [x] CTA present                                                    |
|  [ ] Image/visual needed                                            |
|                                                                     |
+---------------------------------------------------------------------+

>> Approve / Edit / Reject / Skip
```

---

## Safety Rules

1. **Swarm agents never publish anything** -- they draft only. All publishing requires human approval.
2. **Credit checks happen once at orchestrator level** before spawning -- not per agent.
3. **Every swarm run is logged** in `logs/decisions.md` with agent count, batch sizes, and approval status.
4. **Batch-approve requires sample review** -- user must review at least 3 drafts before `Approve all` unlocks.
5. **Brand voice and platform spec validation runs per draft** -- agents validate individually, orchestrator spot-checks.
6. **No duplicate content** -- orchestrator checks all drafts against each other to prevent cross-platform duplication without adaptation.
7. **Hashtag deduplication** -- orchestrator ensures hashtag sets are varied across posts (no identical hashtag blocks).
8. **Schedule spacing** -- if scheduling, orchestrator ensures posts are spaced appropriately (no 3 posts in 10 minutes on the same platform).

---

## Common Swarm Workflows

### 1. Weekly Content Batch
```
Input: 5 content topics + workspace context
Wave 1: 5 LinkedIn posts (Agent A) + 5 tweets (Agent B)
Wave 2: 3 Instagram carousels (Agent C) + 3 TikTok scripts (Agent D)
Wave 3: 1 newsletter (Agent E)
Output: 17 pieces of content for review
```

### 2. Repurposing Swarm
```
Input: 1 long-form blog post or podcast episode
Wave 1: Extract key insights (Agent A)
Wave 2: LinkedIn post (Agent B) + Twitter thread (Agent C) + Instagram carousel (Agent D)
Wave 3: TikTok script (Agent E) + YouTube Short script (Agent F) + Newsletter section (Agent G)
Output: 6 platform-native derivatives
```

### 3. Engagement Processing
```
Input: 50 comments across platforms requiring responses
Wave 1: LinkedIn comments (Agent A, 20 comments) + Twitter replies (Agent B, 15 comments)
Wave 2: Instagram comments (Agent C, 10 comments) + TikTok comments (Agent D, 5 comments)
Output: 50 drafted responses for review
```
