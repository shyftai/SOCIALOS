---
name: social:repurpose
description: Transform content across platforms and formats
argument-hint: "<workspace-name> [content-file] [target-format]"
---
<objective>
Transform existing content into new formats and platforms. Long-form to social, thread to carousel, post to newsletter, podcast to posts, and more. Every transformation is native to its target format.

Workspace, source content, and target format: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // REPURPOSE >>`
2. Load workspace context -- BRAND.md, AUDIENCE.md, TOV.md, CHANNELS.md, PILLARS.md, LEARNINGS.md

## Source content selection
3. If content file not specified:
   - List recent published and approved content
   - Also check for external content sources (blog posts, podcast transcripts, presentations)
   - Ask: "Which piece do you want to repurpose?"

4. Analyze the source content:
   - Identify key ideas, data points, quotes, and takeaways
   - Determine original format and platform
   - Count available content elements

## Target format selection
5. Suggest repurposing options based on source format:

**Blog post / long-form article:**
- LinkedIn post (key takeaway)
- Twitter thread (step-by-step breakdown)
- Carousel (visual summary of key points)
- Reel script (60-second overview)
- Newsletter excerpt (curated commentary)
- Multiple text posts (one per key idea)

**Thread:**
- Carousel (map tweets to slides)
- Single LinkedIn post (synthesize into one post)
- Newsletter section
- Reel script (narrate the thread)

**Carousel:**
- Thread (expand each slide)
- Text post (summarize key points)
- Reel script (walk through the carousel verbally)

**Newsletter:**
- Multiple social posts (one per section)
- Thread (highlight key insights)
- Carousel (visual summary)

**Podcast / video transcript:**
- Quote graphics (pull best quotes)
- Thread (key insights)
- Carousel (topic summary)
- Short clips script (mark best 30-60s segments)
- Newsletter feature

**Presentation / deck:**
- Carousel (adapt slides)
- Thread (one insight per tweet)
- Text posts (key slides as standalone posts)

6. Display repurposing plan:
```
+-- REPURPOSE PLAN ----------------------------------------+
|                                                           |
|  Source: "{title}" ({format}, {platform})                  |
|                                                           |
|  Key elements extracted:                                  |
|    - {N} main ideas                                       |
|    - {N} data points / stats                              |
|    - {N} quotable lines                                   |
|    - {N} action items                                     |
|                                                           |
|  Recommended transformations:                             |
|    1. {format} for {platform} -- {why}                    |
|    2. {format} for {platform} -- {why}                    |
|    3. {format} for {platform} -- {why}                    |
|                                                           |
|  >> Which ones? (1,2,3 / all / pick)                     |
+-----------------------------------------------------------+
```

## Content transformation
7. For each selected transformation:
   - Generate platform-native content (not just reformatted copy-paste)
   - Apply platform-specific rules from CHANNELS.md
   - Match voice from TOV.md (adjusted per platform)
   - Add platform-appropriate hashtags, CTAs, and formatting
   - Validate against brand guidelines

8. Display each transformation for review:
```
  --- Transformation {N}: {format} for {platform} ---

  {generated content}

  Characters: {count}/{limit}
  Pillar: {pillar}
  Hashtags: {hashtags}

  Validation:
    [x] Platform native (not copy-paste)
    [x] Brand aligned
    [x] Voice consistent
    [x] Unique value added

  >> (a)pprove / (e)dit / (r)egenerate / (s)kip
```

9. On approval:
   - Save each transformation to content/approved/
   - Update CALENDAR.md with scheduling suggestions
   - Stagger publication dates (don't post all versions the same day)

10. Display repurposing summary:
```
================================================================

  Repurposed "{title}" into {N} pieces

  1. {format} for {platform} -- saved to {file}
  2. {format} for {platform} -- saved to {file}
  3. {format} for {platform} -- saved to {file}

  Suggested schedule (stagger across {N} days):
  {date}: {platform} -- {format}
  {date}: {platform} -- {format}
  {date}: {platform} -- {format}

  >> Next: /social:schedule {ws} (schedule all pieces)

================================================================
```
</process>
