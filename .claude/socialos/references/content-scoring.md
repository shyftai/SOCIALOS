# Content Scoring Model -- SOCIAL:OS

Score every piece of content before publishing. No content ships without a score. This ensures consistent quality and prevents low-effort posts from reaching your audience.

**Override:** Users can change weights, factors, or thresholds in workspace RULES.md under `## Content scoring overrides`. If no overrides exist, use the defaults below.

---

## Content quality score (0-100)

| Dimension | Weight | Max points | What it measures |
|-----------|--------|------------|-----------------|
| Hook strength | 20% | 20 | Does it stop the scroll? Platform-native opening. |
| Value delivery | 25% | 25 | Does it teach, solve, or entertain? Substance over filler. |
| Brand alignment | 15% | 15 | Matches TOV, pillar relevance, visual consistency. |
| Platform optimization | 15% | 15 | Correct format, length, hashtags, timing. |
| CTA clarity | 10% | 10 | Single clear action, natural not forced. |
| Originality | 15% | 15 | Unique angle, not regurgitated, adds new perspective. |

**Total: 100 points**

---

## Hook strength (0-20)

The hook is the first 1-2 lines of any post, the first 1-2 seconds of any video, or the cover slide of any carousel. It determines whether the audience reads the rest.

| Factor | Points | Criteria |
|--------|--------|----------|
| Attention mechanism | 0-8 | 8 = creates immediate curiosity, tension, or pattern interrupt; 4 = interesting but not compelling; 0 = generic or buried |
| Platform nativity | 0-6 | 6 = feels native to the platform (not cross-posted); 3 = mostly native with minor mismatches; 0 = clearly repurposed without adaptation |
| Scroll-stop power | 0-6 | 6 = would stop YOU from scrolling if you saw it in your feed; 3 = might pause but not guaranteed; 0 = would scroll past |

### Hook scoring guide

**Score 16-20 (strong):**
- Opens with a specific, surprising statement or data point
- Uses tension, contrast, or counter-intuitive framing
- Reader cannot help but want to know more
- Example: "I spent $50K on LinkedIn ads last quarter. Here's why I'm stopping."

**Score 10-15 (adequate):**
- Opens with a clear topic statement
- Interesting but predictable
- Reader knows what is coming but may still read
- Example: "3 lessons from my first year as a founder."

**Score 0-9 (weak):**
- Opens with "I'm excited to share..." or similar filler
- Buries the interesting part below the fold
- No reason for the reader to continue
- Example: "I wanted to take a moment to share some thoughts about leadership."

### Platform-specific hook standards

| Platform | Hook format | Max hook length | Key requirement |
|----------|------------|-----------------|-----------------|
| LinkedIn | First 2 lines before "see more" | ~210 characters | Must compel the click to expand |
| Twitter/X | First tweet of thread, or full standalone tweet | 280 characters | Must work as standalone even if thread |
| Instagram | First line of caption (feed) or first frame (Reel) | ~125 characters visible | Visual hook matters more than text |
| TikTok | First 1-2 seconds of video | 2 seconds | Audio + visual hook combined |
| YouTube | Thumbnail + first 5 seconds | 5 seconds | Thumbnail does 80% of the hook work |
| Newsletter | Subject line + first sentence | Subject: 40 characters, preview: 90 characters | Subject line IS the hook |

---

## Value delivery (0-25)

The body of the content. Does it deliver on the promise the hook made?

| Factor | Points | Criteria |
|--------|--------|----------|
| Substance | 0-10 | 10 = teaches something actionable, reveals a genuine insight, or solves a real problem; 5 = informative but surface-level; 0 = filler, platitudes, or restating the obvious |
| Specificity | 0-8 | 8 = includes specific examples, numbers, steps, or frameworks; 4 = somewhat specific; 0 = vague generalities |
| Completeness | 0-7 | 7 = delivers fully on the hook's promise with nothing missing; 4 = mostly delivers but leaves gaps; 0 = hook promised more than the body delivers |

### Value scoring guide

**Score 20-25 (high value):**
- Reader walks away with something they can use immediately
- Includes at least one specific example, number, or step
- Delivers more than the hook promised
- Reader would save or bookmark this

**Score 12-19 (moderate value):**
- Informative but not immediately actionable
- Some specifics but relies partly on generalities
- Delivers on the hook but does not exceed expectations

**Score 0-11 (low value):**
- Restates common knowledge without new angle
- All theory, no practical application
- Hook over-promised, body under-delivered
- Reader feels their time was wasted

---

## Brand alignment (0-15)

Does this content match the brand's established voice, topics, and visual standards?

| Factor | Points | Criteria |
|--------|--------|----------|
| Tone of voice match | 0-6 | 6 = reads exactly like the brand's established TOV (check workspace TOV.md); 3 = mostly on-brand with minor deviations; 0 = sounds like a different person/brand |
| Pillar relevance | 0-5 | 5 = directly maps to a content pillar in workspace PILLARS.md; 3 = adjacent to a pillar; 0 = off-topic for this brand |
| Visual consistency | 0-4 | 4 = follows brand visual standards (colors, fonts, image style per workspace BRAND.md); 2 = mostly consistent; 0 = visually off-brand (only applies to visual content) |

**For text-only content:** Visual consistency points are redistributed: TOV match becomes 0-8 and pillar relevance becomes 0-7.

**Assessment method:** Before scoring, read the workspace's TOV.md and PILLARS.md. Every brand alignment judgment must reference what is written there, not assumed standards.

---

## Platform optimization (0-15)

Is the content formatted correctly for its target platform?

| Factor | Points | Criteria |
|--------|--------|----------|
| Format correctness | 0-5 | 5 = uses the right format for the platform (thread for Twitter, carousel for LinkedIn/IG, etc.); 3 = acceptable format but not optimal; 0 = wrong format entirely |
| Length optimization | 0-4 | 4 = within the platform's sweet spot length (see defaults.md); 2 = slightly over/under; 0 = significantly too long or short |
| Hashtag/tag usage | 0-3 | 3 = correct number and relevance of hashtags per platform norms; 1 = over/under-tagged; 0 = irrelevant hashtags or none where expected |
| Timing alignment | 0-3 | 3 = scheduled for optimal posting time per platform analytics; 1 = acceptable time but not optimal; 0 = posted at low-engagement time |

### Platform optimization quick reference

| Platform | Optimal format | Sweet spot length | Hashtags | Best posting times |
|----------|---------------|-------------------|----------|-------------------|
| LinkedIn | Single post or carousel | 800-1,300 chars | 3-5 | Tue-Thu 8-10am local |
| Twitter/X | Thread (3-7 tweets) or standalone | 200-280 chars/tweet | 1-2 | Mon-Fri 8am-12pm |
| Instagram | Carousel or Reel | 150-300 chars caption | 5-10 | Mon/Wed/Fri 11am-1pm |
| TikTok | Short video | 30-60 seconds | 3-5 | Tue/Thu/Sat 7-9pm |
| YouTube | Long-form or Shorts | 8-15 min or 30-60 sec | 3-5 in description | Sat/Sun 9am-12pm |
| Newsletter | Long-form article | 800-1,500 words | N/A | Tue/Thu 8-10am |

Check workspace CALENDAR.md for client-specific timing data that overrides these defaults.

---

## CTA clarity (0-10)

Every piece of content should have one clear action the audience can take.

| Factor | Points | Criteria |
|--------|--------|----------|
| Single clear action | 0-5 | 5 = one specific, unmistakable action (comment, share, click, save, follow); 3 = action is present but vague; 0 = no CTA or multiple competing CTAs |
| Natural integration | 0-5 | 5 = CTA flows naturally from the content and feels earned; 3 = slightly forced but acceptable; 0 = abrupt pitch that breaks the content flow |

### CTA scoring guide

**Score 8-10 (strong):**
- Single, specific ask that the reader can act on immediately
- Earned by the value delivered -- reader wants to engage
- Feels like a natural conclusion, not a bolted-on sell
- Example: "What is the one metric you wish you had tracked from day one? Drop it below."

**Score 4-7 (adequate):**
- CTA is present and clear but feels slightly formulaic
- Reader understands what to do but is not compelled
- Example: "If you found this helpful, share it with your network."

**Score 0-3 (weak):**
- No CTA at all (content just ends)
- Multiple competing CTAs ("like, comment, share, follow, subscribe, and check out my link")
- Hard sell that undermines the content's value
- Example: "DM me 'GROWTH' to learn about my $2,000 coaching program."

### CTA types by objective

| Objective | CTA type | Example |
|-----------|----------|---------|
| Engagement | Question or opinion prompt | "What would you add to this list?" |
| Reach | Share prompt | "Tag someone who needs to see this." |
| Authority | Save prompt | "Save this for your next planning session." |
| Growth | Follow prompt | "Follow for more breakdowns like this." |
| Conversion | Link click | "Full breakdown in the newsletter -- link in bio." |

**Rule:** Engagement CTAs should make up 60-70% of posts. Conversion CTAs max 20%. Growth CTAs fill the rest.

---

## Originality (0-15)

Does this content add something new to the conversation?

| Factor | Points | Criteria |
|--------|--------|----------|
| Unique angle | 0-7 | 7 = perspective or framing that the reader has not seen before; 4 = familiar topic with a fresh twist; 0 = restatement of widely known advice |
| Personal experience | 0-4 | 4 = draws from real personal/company experience with specific details; 2 = references experience but generically; 0 = purely theoretical with no personal grounding |
| New perspective | 0-4 | 4 = challenges conventional wisdom or connects ideas in an unexpected way; 2 = adds modest nuance to known ideas; 0 = repeats consensus without questioning it |

### Originality scoring guide

**Score 12-15 (highly original):**
- Reader thinks "I've never thought about it that way"
- Based on real experience or data that others do not have
- Challenges or reframes a common assumption
- Would be hard for someone else to write this exact post

**Score 7-11 (moderately original):**
- Fresh presentation of a known concept
- Personal twist on established advice
- Adds useful nuance but does not break new ground

**Score 0-6 (low originality):**
- Could have been written by anyone with a Google search
- Rehashes LinkedIn platitudes ("culture eats strategy for breakfast")
- No personal perspective, data, or unique framing
- AI-generated feel with no human edge

---

## Quality gates

| Score range | Gate | Action |
|-------------|------|--------|
| 0-49 | Reject | Do not publish. Needs complete rewrite. Flag specific failing dimensions. |
| 50-69 | Revision needed | Specific issues identified. Revise the lowest-scoring dimensions. Re-score after revision. |
| 70-84 | Good to publish | Minor edits optional. Can publish as-is or with light polish. |
| 85-100 | Publish immediately | High-quality content. Prioritize for best posting times. |

### Mandatory rejection triggers (regardless of total score)

The following trigger automatic rejection even if the total score is above 50:

| Trigger | Reason |
|---------|--------|
| Hook score below 8 | Content will not be seen if nobody reads past line 1 |
| Value delivery below 10 | No value = negative brand impression |
| Brand alignment below 5 | Off-brand content damages positioning |
| Originality below 3 | Regurgitated content erodes credibility |

When any mandatory trigger fires, flag the specific dimension and require revision before re-scoring.

---

## Platform-specific scoring adjustments

After calculating the base score, apply platform modifiers:

### LinkedIn
- +5 if post includes a data point or specific number (LinkedIn algorithm favors specific claims)
- +3 if post uses line breaks and white space effectively (readability in feed)
- -5 if post is longer than 3,000 characters without a carousel or article format
- -3 if post uses more than 5 hashtags (appears spammy on LinkedIn)

### Twitter/X
- +5 if thread has a strong standalone first tweet (works even without reading the thread)
- +3 if thread ends with a summary tweet that adds value
- -5 if tweets in thread exceed 280 characters each without Premium+ (will not post)
- -3 if thread exceeds 10 tweets (completion rate drops sharply)

### Instagram
- +5 if visual content is original (not stock or generic template)
- +3 if carousel has a strong cover slide with clear topic promise
- -5 if image text is too small to read on mobile
- -3 if caption relies entirely on hashtags with no real text

### TikTok
- +5 if video has a pattern interrupt in the first 2 seconds
- +3 if video uses native TikTok features (text overlay, trending audio, effects)
- -5 if video feels like a repurposed YouTube clip
- -3 if CTA appears before value is delivered (viewers drop off)

### Newsletter
- +5 if subject line creates specific curiosity (not clickbait)
- +3 if newsletter has a clear table of contents or section structure
- -5 if newsletter exceeds 2,000 words without section breaks
- -3 if newsletter has more than 2 CTAs competing for attention

---

## How /social:review uses this scoring

When `/social:review` is invoked:

1. Load this scoring model and the workspace's TOV.md, PILLARS.md, and BRAND.md
2. Score each dimension independently with brief justification
3. Calculate total score
4. Check for mandatory rejection triggers
5. Apply platform-specific adjustments
6. Present the scorecard:

```
## Content Score: [TOTAL]/100 — [GATE LABEL]

| Dimension | Score | Max | Notes |
|-----------|-------|-----|-------|
| Hook strength | X | 20 | [brief justification] |
| Value delivery | X | 25 | [brief justification] |
| Brand alignment | X | 15 | [brief justification] |
| Platform optimization | X | 15 | [brief justification] |
| CTA clarity | X | 10 | [brief justification] |
| Originality | X | 15 | [brief justification] |

Platform adjustments: [+/- X]
Final score: [ADJUSTED TOTAL]/100

Gate: [Reject / Revision needed / Good to publish / Publish immediately]
[If revision needed: specific recommendations for improvement]
```

---

## Auto-scoring in /social:write

When `/social:write` generates content, scoring runs automatically before presenting the draft:

1. Generate the draft
2. Score it using this model
3. If score is below 70, revise internally before presenting (up to 2 revision passes)
4. Present the draft with its scorecard
5. If score is still below 70 after 2 passes, present with the scorecard and flag the weak dimensions for human review

**Internal revision rules:**
- First pass: address the lowest-scoring dimension
- Second pass: address the next lowest-scoring dimension
- Never revise more than twice -- present to the user with honest scoring and let them decide

---

## Scoring calibration

To prevent score inflation over time:

- **Benchmark regularly:** Compare scores against actual post performance. If posts scoring 85+ consistently underperform, tighten the criteria.
- **Review rejected content:** If content scored 45 would have performed well, loosen the criteria.
- **Platform-specific baselines:** Different platforms have different quality floors. A Twitter/X standalone tweet has a lower absolute quality floor than a LinkedIn long-form post -- but should still score well relative to its platform norms.
- **Track score-to-performance correlation:** Log content scores alongside engagement metrics. After 30 posts, analyze which score dimensions best predict performance.

---

## Customization

**This is a default model.** Every workspace can override it.

During onboarding or at any time, the user can:
- Change dimension weights (e.g., make originality 25% instead of 15%)
- Add or remove scoring factors within any dimension
- Change point values for specific criteria
- Change quality gate thresholds (e.g., make "good to publish" start at 65 instead of 70)
- Add mandatory rejection triggers
- Modify platform-specific adjustments
- Disable auto-scoring in /social:write

To customize, add a `## Content scoring overrides` section to the workspace's RULES.md. Any overrides there take precedence over this default model.

Example override in RULES.md:
```
## Content scoring overrides
- Value delivery weight: 30% (instead of 25%)
- Hook strength weight: 15% (instead of 20%)
- Add mandatory trigger: CTA score below 4 = reject (we always need strong CTAs)
- Good to publish threshold: 65 (instead of 70)
- Disable auto-scoring in /social:write (I want to review raw drafts)
- Add platform modifier: LinkedIn +3 for posts that mention specific customer results
```

If no overrides exist in the workspace RULES.md, use this default model as-is.
