---
name: social:compliance
description: Configure platform and privacy compliance settings
argument-hint: "<workspace-name>"
---
<objective>
Configure and enforce compliance rules for social media content. Covers platform terms of service, privacy regulations, disclosure requirements, and content moderation policies.

Workspace: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // COMPLIANCE >>`
2. Load workspace context -- BRAND.md, CHANNELS.md, workspace.config.md
3. Load or create COMPLIANCE.md in the workspace

## Compliance configuration
4. Walk through compliance areas:

**Platform terms of service:**
- Review each active platform's content policies
- Set guardrails for content types (no misleading claims, proper disclosures)
- Configure automation limits (posting frequency, engagement automation rules)
- API usage compliance (rate limits, data handling)

**Disclosure requirements:**
- Sponsored content: require #ad, #sponsored, or "Paid partnership" labels
- Affiliate links: require disclosure
- Testimonials: require substantiation
- AI-generated content: disclosure policy (per brand preference)
- Employee advocacy: disclosure rules for team members posting on behalf of company

**Privacy and data:**
- User-generated content: permission requirements before reposting
- Screenshots: blur personal information
- DM handling: what can be shared publicly, what stays private
- Data retention: how long to keep engagement data and analytics
- GDPR/CCPA compliance for any collected data (newsletter signups, forms)

**Content moderation:**
- Comment moderation policy (what to hide, what to delete, what to respond to)
- Blocked words list
- Escalation triggers (threats, legal, sensitive topics)
- Crisis communication protocol

**Industry-specific:**
- Financial services: disclaimer requirements
- Healthcare: claims restrictions
- Legal: attorney advertising rules
- Regulated industries: specific compliance checkboxes

5. Display compliance settings:
```
+-- COMPLIANCE -- {Workspace} -----------------------------+
|                                                           |
|  Disclosures                                              |
|    [x] Sponsored content labeling: required               |
|    [x] Affiliate disclosure: required                     |
|    [{x or blank}] AI content disclosure: {policy}         |
|    [x] Employee advocacy disclosure: required             |
|                                                           |
|  Privacy                                                  |
|    [x] UGC permission required before repost              |
|    [x] PII blurred in screenshots                         |
|    [x] DM content stays private                           |
|    [{x or blank}] GDPR compliance: {status}               |
|                                                           |
|  Moderation                                               |
|    Blocked words: {N} configured                          |
|    Escalation triggers: {N} configured                    |
|    Crisis protocol: {configured / not configured}         |
|                                                           |
|  Platform limits                                          |
|    LinkedIn:  {posting limit}/day                         |
|    Twitter:   {posting limit}/day                         |
|    Instagram: {posting limit}/day                         |
|                                                           |
+-----------------------------------------------------------+
```

6. Save compliance configuration to COMPLIANCE.md
7. These rules are checked automatically during `/social:review` and `/social:publish`

8. Suggest next action:
```
================================================================

  Compliance configured and saved to COMPLIANCE.md

  These rules will be enforced automatically during:
  - /social:review (content review)
  - /social:publish (pre-publish check)
  - /social:replies (response drafting)

  >> Next: /social:status {ws}

================================================================
```
</process>
