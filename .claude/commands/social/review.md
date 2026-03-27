---
name: social:review
description: Review content against brand guidelines, platform specs, and quality rules
argument-hint: "<workspace-name> [content-file]"
---
<objective>
Review content before publishing. Check against brand guidelines, platform specifications, voice consistency, and quality standards. Gate between creation and publishing.

Workspace and content: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/social-writing-skill.md
@./.claude/socialos/references/platform-specs.md
@./.claude/socialos/references/ui-brand.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // REVIEW >>`
2. Load workspace context -- BRAND.md, TOV.md, CHANNELS.md, AUDIENCE.md, PILLARS.md
3. Load content to review from content/drafts/ or specified file

## Content selection
4. If no content file specified:
   - List all drafts pending review
   - Ask which piece to review

## Review checklist
5. Run the full review checklist:

**Brand alignment:**
- [ ] Messaging aligns with BRAND.md positioning
- [ ] Key messages are accurate
- [ ] No off-brand language or claims
- [ ] Visual direction matches brand (if applicable)
- [ ] CTA aligns with current goals

**Voice consistency:**
- [ ] Matches TOV.md channel-specific rules
- [ ] No banned words or phrases
- [ ] Tone appropriate for platform and audience
- [ ] Reads like a human, not a robot
- [ ] Consistent with recent published content voice

**Platform specifications:**
- [ ] Character count within limits
- [ ] Hashtag count appropriate for platform
- [ ] Link formatting correct
- [ ] Image/media dimensions correct (if applicable)
- [ ] No features used that the platform doesn't support

**Content quality:**
- [ ] Hook is strong (first line earns the read)
- [ ] Single clear message (not trying to say too much)
- [ ] Value delivered (reader learns or feels something)
- [ ] CTA is clear and specific
- [ ] No typos or grammatical errors
- [ ] Formatting is clean and readable

**Pillar and strategy alignment:**
- [ ] Maps to a defined content pillar
- [ ] Aligns with current strategy focus
- [ ] Not duplicating recently published content
- [ ] Timing is appropriate (no conflicts with calendar)

**Compliance:**
- [ ] No unsubstantiated claims
- [ ] Required disclosures included (if applicable)
- [ ] No copyrighted material without attribution
- [ ] Privacy considerations met

6. Display review results:
```
+-- CONTENT REVIEW ----------------------------------------+
|                                                           |
|  Content: {title}                                         |
|  Platform: {platform}  |  Format: {format}                |
|                                                           |
|  Brand alignment                                          |
|    [x] Messaging aligned                                  |
|    [x] No off-brand language                              |
|    [x] CTA matches goals                                  |
|                                                           |
|  Voice consistency                                        |
|    [x] TOV rules followed                                 |
|    [x] No banned words                                    |
|    [ ] ISSUE: Tone too formal for Twitter                  |
|                                                           |
|  Platform specs                                           |
|    [x] Character count: {N}/{limit}                       |
|    [x] Hashtags: {N} (OK)                                 |
|    [x] Links: formatted correctly                         |
|                                                           |
|  Content quality                                          |
|    [x] Strong hook                                        |
|    [x] Clear message                                      |
|    [x] Value present                                      |
|    [x] CTA clear                                          |
|                                                           |
|  Result: {PASS / PASS WITH NOTES / FAIL}                  |
|                                                           |
+-----------------------------------------------------------+
```

7. If issues found:
   - Show each issue with explanation and suggested fix
   - Offer to auto-fix minor issues (typos, hashtag count, character count)
   - Major issues require manual revision

8. If all checks pass:
   - Move content from content/drafts/ to content/approved/
   - Add approval marker
   - Display: "Content approved and ready for scheduling"

9. Suggest next action:
```
================================================================

  Review complete: {PASS / FAIL}

  >> Next: /social:schedule {ws} (schedule approved content)
     Also: /social:publish {ws} (publish immediately)

================================================================
```
</process>
