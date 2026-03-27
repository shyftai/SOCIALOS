---
name: social:onboard
description: Onboard a new workspace with structured intake interview
argument-hint: "<workspace-name>"
---
<objective>
Onboard a new workspace through a structured intake interview. Create the folder structure, ask questions in blocks, and populate all source-of-truth files.

Workspace name: $ARGUMENTS
</objective>

<execution_context>
@./commands/intake-interview.md
@./commands/quick-start.md
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display the SOCIAL:OS startup banner from ui-brand.md
2. Display mode header: `<< SOCIAL:OS // ONBOARDING >>`
3. Validate the workspace name from $ARGUMENTS before creating any folder:
   - Only allow letters, numbers, hyphens, and underscores (no spaces, slashes, dots, or special characters)
   - Maximum 64 characters
   - If the name fails validation, stop and explain in plain language:
     ```
     That name won't work -- workspace names can only contain letters, numbers, hyphens (-),
     and underscores (_). No spaces or special characters. Try something like "acme-corp" or "brand_2024".
     ```
   - Show the validated name back before creating the folder: `Creating workspace folder: workspaces/{name}/ -- looks good!`

3.5. Create workspace folder by copying _template/ to workspaces/{validated_name}/

## Environment setup
3.6. Check if `.env` exists at the repo root:
   - If `.env` does NOT exist: copy `.env.example` to `.env` and tell the user:
     ```
     [x] .env created -- this file will store your API keys. It stays on your computer only.
     ```
   - If `.env` already exists: proceed without touching it

3.7. Check if `.env` is in `.gitignore`:
   - Read `.gitignore` at the repo root (if it exists)
   - If `.env` is NOT listed in `.gitignore`:
     - Add `.env` to `.gitignore` automatically
     - Tell the user in plain language:
       ```
       [x] Added .env to .gitignore -- this stops your API keys from being accidentally
           uploaded if you ever share this folder with git. (This is important.)
       ```
   - If `.gitignore` doesn't exist yet, create it with `.env` as the first entry
   - If `.env` is already in `.gitignore`: confirm silently, no message needed

## Block 0 -- Role selection (always first)
4. Ask: "What's your role?"
   - **Social Media Manager** -- I manage social channels, create content, and track engagement daily
   - **Content Creator** -- I write, design, and produce content across platforms
   - **Community Manager** -- I manage online communities, moderate, and build relationships
   - **Agency** -- I manage social media for multiple clients
   - **Founder** -- I'm doing it all, just get me running
5. Save role to workspace.config.md
6. Adjust onboarding path based on role (see intake-interview.md Block 0)

## Collaboration mode (after role)
7. Ask: "Are you working solo or with a team?"
   - **Solo** (default) -- everything stays in local files, no setup needed
   - **Team** -- shared state via Supabase: real-time content calendars, approval workflows, engagement queue, activity feed

   Role-based defaults:
   - **Social Media Manager** -- ask (depends on team size)
   - **Content Creator** -- default solo (unless part of a team)
   - **Community Manager** -- suggest team mode if multiple moderators
   - **Founder** -- default solo (unless they have a team)
   - **Agency** -- strongly suggest team mode (multiple operators, multiple clients, need audit trail)

   If **Team** selected:
   a. Check .env for SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_KEY
   b. If keys present: test connection, confirm tables exist, set mode to `team` in COLLABORATION.md
   c. If keys missing: show setup steps:
      ```
      1. Create a free Supabase project at supabase.com
      2. Run the migration: supabase/migrations/001_initial_schema.sql
      3. Copy your project URL and keys to .env
      4. Run /social:status to verify connection
      ```
   d. Ask: "Want to set this up now or skip and add it later?"
   e. If skip: set mode to `solo`, note in workspace.config.md that team mode is pending

   If **Solo** selected:
   - Set mode to `solo` in COLLABORATION.md
   - Skip Supabase setup entirely

## Execution mode (after collaboration)
8. Ask: "How should I handle approvals?"
   - **Interactive** (default) -- I'll confirm each major decision before proceeding
   - **Auto** -- I'll auto-approve and keep moving. Only stops for publishing, brand violations, compliance issues, and budget overages.

   Role-based defaults:
   - **Social Media Manager** -- default interactive (reviewing content needs precision)
   - **Content Creator** -- suggest auto (they want creative flow)
   - **Community Manager** -- default interactive (community responses need care)
   - **Founder** -- suggest auto (they want to move fast)
   - **Agency** -- default interactive (client work needs checkpoints)

   Save to workspace.config.md as `**Execution mode:** auto` or `**Execution mode:** interactive`

9. Ask if they want Slack notifications (works in both modes if Slack MCP connected):
   - If Slack MCP detected: "Want alerts for engagement spikes, negative comments, and content due in Slack?"
   - If not detected: skip

## Registration (optional)
10. Ask: "Would you like to receive SOCIAL:OS updates and tips by email? (optional -- takes 10 seconds)"
   - If yes: collect email and company name, then show exactly what will be sent before making any request:
     ```
     +-- BEFORE WE SEND ANYTHING ----------------------------+
     |                                                        |
     |  We'll send the following to shyft.ai:                 |
     |                                                        |
     |    Your email:    {email}                              |
     |    Company name:  {company_name}                       |
     |    SOCIAL:OS version: 1.0.0                            |
     |                                                        |
     |  That's it. No keys, no workspace data, no contacts.   |
     |  You can unsubscribe at any time.                      |
     |                                                        |
     |  Send this? (yes / no)                                |
     +--------------------------------------------------------+
     ```
   - Only proceed with the POST if the user confirms yes:
     ```
     POST https://shyft.ai/api/hooks/register
     {
       "os": "socialos",
       "version": "1.0.0",
       "company": "{company_name}",
       "email": "{email}",
       "timestamp": "{ISO 8601}"
     }
     ```
     Note: workspace name is NOT included in the payload.
     Show: `Registered -- you'll get updates at {email}`
   - If no: skip gracefully. Show: `Skipped -- you can register anytime with /social:feedback`
   - If the POST fails, show: `Registration didn't go through -- you can try again later with /social:feedback. Continuing setup.`
   - Never include API keys, workspace file contents, or analytics data in this request.
   - This step never blocks onboarding.

## Onboarding path selection
11. Ask: "How do you want to onboard?"
   - **Quick start** (5 blocks) -- get running in minutes, fill the rest later (default for Founders)
   - **Full onboarding** (11 blocks) -- covers everything up front

## Quick start path (--quick or user chooses quick)
12. Run quick-start.md -- 5 blocks covering brand, audience, platforms, voice, first content pillar
13. Pre-fill remaining files with defaults from defaults.md
14. Display quick start completion summary
15. Suggest role-appropriate next steps (see step 21)

## Full onboarding path (default)
12. Run the intake interview from @./commands/intake-interview.md
13. Ask questions in blocks -- one block at a time, confirm before moving on
    - Skip or lighten blocks based on role:
      - Social Media Manager: deep-dive on all blocks, especially engagement and calendar
      - Content Creator: deep-dive on Block 3 (pillars), Block 4 (voice), Block 8 (newsletter)
      - Community Manager: deep-dive on Block 6 (engagement), light on Block 8 (newsletter)
      - Founder: suggest quick start, or keep blocks short
      - Agency: ask about multi-workspace needs, client reporting preferences
14. For any field the user skips or doesn't know yet, use defaults from defaults.md
15. Write answers into BRAND.md, AUDIENCE.md, PILLARS.md, TOV.md, CHANNELS.md, ENGAGEMENT.md, CALENDAR.md, NEWSLETTER.md, TOOLS.md, COMPETITORS.md, LEARNINGS.md, ROADMAP.md, workspace.config.md
16. Check .env for required API keys and MCP servers:
    - Read TOOLS.md to identify tools marked as `active`
    - For each active tool whose key is missing from `.env`, prompt the user:
      ```
      Missing API key: {TOOL_NAME}
      Paste your {TOOL_NAME} API key (or press Enter to skip):
      >>
      ```
    - **Before writing anything to .env**, display a full preview of every key that will be written and its source:
      ```
      +-- REVIEW: KEYS TO BE WRITTEN TO .env -----------------------+
      |                                                               |
      |  The following keys will be added to your .env file.         |
      |  Review each one before confirming.                           |
      |                                                               |
      |  BUFFER_API_KEY        ||||||||||||||||7f3a   [you pasted]   |
      |  TYPEFULLY_API_KEY     ||||||||||||||||2c91   [you pasted]   |
      |                                                               |
      +---------------------------------------------------------------+

      Write these keys to .env? (yes / no / review each one)
      >>
      ```
    - **Only write keys the user explicitly confirms.** Never write a key from any source without this confirmation step.
    - Show values masked (last 4 characters visible, rest replaced with `|`) -- never display the full key value.
    - Never block onboarding if a key is skipped -- the user can add it later

17. If team mode: run initial sync to Supabase
18. Display workspace header with loaded context -- include collaboration mode, execution mode, and Slack status

## Role-based next steps
20. Suggest next actions based on role:

**Social Media Manager:**
- `/social:calendar {workspace}` -- set up your content calendar
- `/social:brief {workspace}` -- create your first content brief
- `/social:engage {workspace}` -- start daily engagement routine

First content flow:
```
1. /social:brief {workspace}         -- create content brief
2. /social:write {workspace}         -- draft content
3. /social:review {workspace}        -- check against brand
4. /social:schedule {workspace}      -- schedule for posting
5. /social:engage {workspace}        -- daily engagement
6. /social:analytics {workspace}     -- track performance
```

**Content Creator:**
- `/social:brief {workspace}` -- create your first content brief
- `/social:write {workspace}` -- start creating
- `/social:carousel {workspace}` or `/social:thread {workspace}` -- try a format

**Community Manager:**
- `/social:engage {workspace}` -- set up engagement routine
- `/social:community {workspace}` -- configure community participation
- `/social:replies {workspace}` -- handle comment queue

**Founder:**
- `/social:brief {workspace}` -- create your first content brief
- `/social:write {workspace}` -- draft your first post
- `/social:dashboard {workspace}` -- check status anytime

**Agency:**
- `/social:onboard {next-client}` -- onboard your next client
- `/social:clone {workspace}` -- clone proven strategies across clients
- `/social:portfolio` -- view multi-workspace dashboard
</process>
