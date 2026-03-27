---
name: social:ab-test
description: Set up and track A/B tests on content
argument-hint: "<workspace-name> [test-type]"
---
<objective>
Set up and track A/B tests on content elements -- headlines, hooks, CTAs, posting times, formats, hashtag sets. Measure with statistical rigor and pick winners.

Workspace and test type: $ARGUMENTS
</objective>

<execution_context>
@./.claude/socialos/references/ui-brand.md
@./.claude/socialos/references/defaults.md
</execution_context>

<process>
1. Display mode header: `<< SOCIAL:OS // A/B TEST >>`
2. Load workspace context -- LEARNINGS.md, CHANNELS.md, CALENDAR.md
3. Load existing tests from tests/AB-TESTS.md

## Test setup
4. If creating a new test, ask test type:
   - **Hook** -- test different opening lines / first sentences
   - **CTA** -- test different calls to action
   - **Format** -- test carousel vs. text vs. thread on same topic
   - **Posting time** -- test different days/times for similar content
   - **Hashtag set** -- test different hashtag strategies
   - **Topic angle** -- test different angles on the same topic
   - **Visual style** -- test different image/design approaches

5. Collect test parameters:
   - Platform(s) to test on
   - Variant A description
   - Variant B description
   - Primary metric: engagement rate, impressions, saves, shares, clicks
   - Minimum sample size for significance (suggest based on account size)
   - Test duration

6. Display test plan:
```
+-- A/B TEST PLAN ----------------------------------------+
|                                                          |
|  Test: {test name}                                       |
|  Type: {hook / CTA / format / time / hashtags}           |
|  Platform: {platform}                                    |
|                                                          |
|  Variant A: {description}                                |
|  Variant B: {description}                                |
|                                                          |
|  Primary metric: {metric}                                |
|  Min. sample: {N} impressions per variant                |
|  Duration: {N} days                                      |
|  Start: {date}                                           |
|                                                          |
+----------------------------------------------------------+
```

7. Save test plan to tests/AB-TESTS.md

## Test tracking
8. If checking existing tests:
```
+-- A/B TESTS -- {Workspace} ------------------------------+
|                                                           |
|  Active tests:                                            |
|  +------------------------------------------------------+|
|  | Test        | Var A      | Var B      | Status        ||
|  |-------------|------------|------------|---------------||
|  | Hook style  | Question   | Bold claim | Day 5/14      ||
|  |             | Eng: 3.2%  | Eng: 4.8%  | B leading     ||
|  |-------------|------------|------------|---------------||
|  | Post time   | 9am Tue    | 12pm Wed   | Day 8/14      ||
|  |             | Imp: 2.4K  | Imp: 3.1K  | B leading     ||
|  +------------------------------------------------------+|
|                                                           |
|  Completed tests:                                         |
|    Hook Q3: Question hooks won (+42% eng) -- applied      |
|    Format: Carousels won (2.1x vs text) -- applied        |
|                                                           |
+-----------------------------------------------------------+
```

9. If a test has reached statistical significance:
```
  !! Test "{name}" has a winner

  Variant A: {metric value}
  Variant B: {metric value}
  Winner: Variant {X} by {percentage}%
  Confidence: {level}

  >> Apply winner to future content? (y/n)
```

10. On applying a winner:
    - Update LEARNINGS.md with the finding
    - Update relevant strategy files (TOV.md, CHANNELS.md)
    - Close the test in AB-TESTS.md

11. Suggest next action:
```
================================================================

  >> Next: /social:write {ws} (apply winning variant)
     Also: /social:optimize {ws} (review all learnings)

================================================================
```
</process>
