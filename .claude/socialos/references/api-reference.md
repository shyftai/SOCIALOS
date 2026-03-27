# API Reference — SOCIAL:OS Supported Tools

Quick reference for making API calls from Claude Code. Auth, base URLs, key endpoints, and dangerous endpoint warnings.

---

## Dangerous Endpoints -- Comprehensive Reference

**HARD GATE -- even in AUTO mode, always stop and confirm before calling any endpoint below.**

These endpoints have blast radius that exceeds expectation. Misuse can destroy live content, delete subscriber lists, damage account standing, or trigger platform bans irreversibly.

Last updated: 2026-03

**Rules (apply to ALL platforms):**
1. Never call a DELETE endpoint on live/published content without explicit user confirmation showing the exact blast radius
2. Always prefer archiving, unpublishing, or pausing over deleting
3. If an endpoint's behavior is undocumented or ambiguous, test with a single record first
4. Log all destructive API calls in `logs/decisions.md` with full context
5. Check remaining credits/balance BEFORE any bulk operation
6. Never exceed 80% of any documented rate limit -- build in buffer
7. When in doubt, the safe alternative is always "do nothing and ask"

---

### Danger Summary Table

| Platform | Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|----------|-------------|---------------|-----------------|
| Buffer | `DELETE /updates/{id}` | Deletes scheduled post | YES | Reschedule or move to drafts |
| Buffer | `POST /profiles/{id}/updates/shuffle` | Randomizes entire queue order | YES | Manually reorder specific posts |
| Buffer | `DELETE /profiles/{id}` | Disconnects channel entirely | YES | Pause posting to channel |
| Typefully | `DELETE /drafts/{id}` | Deletes draft permanently | YES | Archive or mark as inactive |
| Typefully | `PUT /drafts/{id}/schedule` | Overwrites scheduled time | Partial | Verify current schedule first |
| Meta/Instagram | `DELETE /{post-id}` | Deletes published post + all engagement | YES | Hide post from timeline |
| Meta/Instagram | `POST /{page-id}?is_published=false` | Unpublishes entire page | YES | Pause individual posts |
| Twitter/X | `DELETE /2/tweets/{id}` | Deletes published tweet + engagement | YES | No safe alternative -- deletion only |
| Twitter/X | `POST /2/users/{id}/blocking` | Blocks user (visible to them) | Reversible | Mute user instead |
| Beehiiv | `DELETE /publications/{pub}/subscriptions/{id}` | Removes subscriber permanently | YES | Tag as inactive |
| Beehiiv | Unpublish post | Removes from public view, breaks links | Partial | Update post instead |
| ConvertKit | `DELETE /subscribers/{id}` | Permanently removes subscriber + data | YES | Unsubscribe or tag as churned |
| YouTube | `DELETE /youtube/v3/videos?id={id}` | Deletes video + all views, comments, watch time | YES | Set to private or unlisted |

---

### 1. Buffer (api.bufferapp.com/1)

**Auth:** OAuth 2.0 bearer token
**Rate limit:** 60 requests per minute per access token. Exceeding returns 429.

#### DELETE Endpoints

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `DELETE /updates/{id}` | Permanently deletes a scheduled or sent update. If the post was already published, only the Buffer record is removed -- the live social post remains. If the post is queued, it will never be published. | YES (Buffer record) | Move to drafts: `POST /updates/{id}/move_to_top` or reschedule |
| `DELETE /profiles/{id}` | **CATASTROPHIC.** Disconnects the social channel entirely from Buffer. All queued posts for that channel are orphaned. Reconnecting requires full OAuth re-auth and does NOT restore the queue. | YES | Pause the profile instead. There is no pause endpoint -- stop scheduling to it. |

#### Queue Manipulation

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `POST /profiles/{id}/updates/shuffle` | **HIGH.** Randomizes the entire posting queue for that channel. All carefully scheduled timing and content order is lost. No undo. | YES | Reorder specific posts individually with `POST /updates/{id}/move_to_top` |
| `POST /updates/{id}/share` | Immediately publishes the post NOW, regardless of scheduled time. Cannot be un-published from Buffer. | YES | Let the schedule run. If urgent, confirm timing first. |

#### Unexpected Behaviors
- **Queue order is channel-specific.** Shuffling one channel does not affect others, but there's no confirmation prompt.
- **Deleting a profile does NOT delete published posts** on the actual social platform. It only disconnects Buffer's ability to manage that channel.
- **Buffer does not support bulk delete.** Each post must be deleted individually -- but a script looping through deletions can wipe a queue in seconds.

---

### 2. Typefully (api.typefully.com/v1)

**Auth:** API key via `X-API-KEY` header
**Rate limit:** 100 requests per minute. Exceeding returns 429.

#### DELETE Endpoints

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `DELETE /drafts/{id}` | Permanently deletes the draft, including all content, scheduled time, and thread structure. | YES | Mark as archived if the feature is available. Otherwise, export content before deleting. |

#### Schedule Manipulation

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `PUT /drafts/{id}/schedule` | Overwrites the existing scheduled time. If the post was carefully timed for a campaign, this destroys the timing without warning. | Partial (can reschedule again) | Always GET the current schedule first, log it, then update. |
| `POST /drafts/{id}/publish` | Immediately publishes the draft. No confirmation, no undo from Typefully's side. | YES | Let the schedule run. |

#### Unexpected Behaviors
- **Thread drafts are a single entity.** Deleting a draft that contains a multi-tweet thread deletes ALL tweets in that thread, not just the first.
- **Publishing a draft removes it from the drafts list.** There is no "published drafts" archive in Typefully -- once published, the record is gone from the API.

---

### 3. Meta/Instagram Graph API (graph.facebook.com/v19.0)

**Auth:** Page Access Token (long-lived recommended)
**Rate limit:** 200 calls per user per hour (app-level limits vary). Business accounts: 4,800 calls per 24 hours per app per user.

#### DELETE Endpoints

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `DELETE /{post-id}` | **CATASTROPHIC.** Permanently deletes the post and ALL associated data: likes, comments, shares, reach data, insights. Cannot be recovered. | YES | Hide the post: not natively supported via API. Consider editing the post instead. |
| `DELETE /{comment-id}` | Deletes a specific comment. If it's a parent comment, all replies are also deleted. | YES | Hide comment: `POST /{comment-id}?is_hidden=true` |
| `DELETE /{media-id}` (Instagram) | Permanently deletes the Instagram media (post, reel, story, carousel). All engagement data is lost. | YES | No API-based hiding. Archive via the app manually. |

#### Page-Level Dangers

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `POST /{page-id}?is_published=false` | **CATASTROPHIC.** Unpublishes the ENTIRE Facebook Page. The page becomes invisible to the public. All scheduled posts stop. | Reversible (re-publish) | Never call this. Manage individual post visibility instead. |

#### Unexpected Behaviors
- **Instagram API does not support editing published posts.** Once posted, you can only delete. There is no update endpoint for captions on published media.
- **Deleting a carousel deletes ALL images/videos in it.** You cannot remove a single slide from a published carousel.
- **Rate limits are per-user-per-app**, not per-page. Managing multiple pages under one user token shares the limit.
- **Insights data is deleted with the post.** Export insights BEFORE deleting any post.

#### Account Ban Triggers
- Exceeding rate limits repeatedly can result in temporary API blocks (1-24 hours)
- Posting identical content across multiple pages triggers spam detection
- Automated posting without proper permissions can result in app review revocation

---

### 4. Twitter/X API v2 (api.twitter.com/2)

**Auth:** OAuth 2.0 Bearer Token (app-level) or OAuth 2.0 User Context (user-level)
**Rate limit:** Varies by endpoint and access level. Free: 1,500 tweets/month read, 50 tweets/month post. Basic ($100/mo): 10,000 read, 3,000 post. Pro ($5,000/mo): 1,000,000 read, 300,000 post.

#### DELETE Endpoints

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `DELETE /2/tweets/{id}` | Permanently deletes the tweet. All likes, retweets, quote tweets, and replies are orphaned. Engagement data is lost. | YES | There is no archive or hide option via API. Only delete. |
| `DELETE /2/users/{source_user_id}/likes/{tweet_id}` | Unlikes a tweet. Low blast radius. | Reversible | Re-like if needed. |
| `DELETE /2/lists/{id}` | Deletes a Twitter list and removes all members. | YES | Remove members individually instead. |

#### User Interaction Dangers

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `POST /2/users/{id}/blocking` | Blocks a user. They are notified (in some cases) and removed from your followers. | Reversible | Mute instead: `POST /2/users/{id}/muting` |
| `DELETE /2/users/{source_user_id}/following/{target_user_id}` | Unfollows a user. If this was a strategic follow (prospect, partner), the relationship signal is lost. | Reversible | Only unfollow intentionally. Bulk unfollowing triggers spam detection. |

#### Unexpected Behaviors
- **Deleting a tweet that started a thread** does NOT delete the rest of the thread. Replies become orphaned.
- **Rate limits are EXTREMELY tight on Free and Basic tiers.** Hitting the tweet creation limit blocks posting for the rest of the month.
- **OAuth 2.0 User Context is required for posting, deleting, liking, and retweeting.** App-only tokens cannot perform user actions.
- **Tweet IDs are snowflake IDs** -- they encode timestamps. Do not assume sequential ordering.

#### Account Ban Triggers
- Automated follow/unfollow in bulk triggers immediate suspension
- Posting duplicate content across multiple accounts is banned
- Exceeding posting limits results in month-long posting blocks
- Using the API to circumvent rate limits (multiple apps, multiple tokens) is grounds for permanent suspension

---

### 5. Beehiiv (api.beehiiv.com/v2)

**Auth:** API key via `Authorization: Bearer {key}`
**Rate limit:** 60 requests per minute. Exceeding returns 429.

#### DELETE Endpoints

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `DELETE /publications/{pub_id}/subscriptions/{sub_id}` | **HIGH.** Permanently removes the subscriber. All subscription data, tags, custom fields, and engagement history are deleted. | YES | Change status to `inactive` instead. Preserves data. |
| Unpublish post (via API) | Removes the post from public view. Existing links break (404). SEO indexing is lost. | Partial (can re-publish) | Update the post content instead. Or add a redirect. |

#### Unexpected Behaviors
- **Subscriber deletion is permanent.** Unlike unsubscribing (which preserves the record), deletion removes all data.
- **Bulk subscriber operations** can affect thousands of records in a single call. Always verify the filter/query before executing.
- **API key scopes are all-or-nothing.** A single API key has access to all endpoints. Guard it.
- **Sending a post via API** triggers immediate delivery to all targeted subscribers. There is no "are you sure?" confirmation.

---

### 6. ConvertKit (api.convertkit.com/v4)

**Auth:** API key or OAuth 2.0
**Rate limit:** 120 requests per minute. Exceeding returns 429.

#### DELETE Endpoints

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `DELETE /subscribers/{id}` | **HIGH.** Permanently deletes the subscriber and ALL associated data: tags, custom fields, automation history, purchase history, engagement data. | YES | Unsubscribe: `POST /subscribers/{id}/unsubscribe` (preserves data) |
| `DELETE /tags/{id}` | Deletes the tag. Does NOT delete subscribers, but removes the tag from all subscribers who had it. | YES | Rename the tag instead if reorganizing. |
| `DELETE /sequences/{id}` | Deletes the entire email sequence (all emails in the sequence). | YES | Pause the sequence. Move subscribers out first. |

#### Unexpected Behaviors
- **Deleting a subscriber and re-adding them** creates a NEW subscriber record. All historical data is gone.
- **Bulk tag removal** via the API removes the tag from all matching subscribers instantly. No confirmation.
- **Automation triggers are real-time.** Adding a tag via API that triggers an automation will fire that automation immediately.

---

### 7. YouTube Data API v3 (www.googleapis.com/youtube/v3)

**Auth:** OAuth 2.0 with appropriate scopes
**Rate limit:** 10,000 quota units per day (default). Each endpoint costs different units.

#### DELETE Endpoints

| Endpoint | Blast Radius | Irreversible? | Safe Alternative |
|----------|-------------|---------------|-----------------|
| `DELETE /videos?id={id}` | **CATASTROPHIC.** Permanently deletes the video. ALL data is lost: views, watch time, comments, likes, revenue data, playlist positions, embeds break, shared links break. | YES | Set to private: `PUT /videos` with `status.privacyStatus: private`. Or set to unlisted. |
| `DELETE /playlists?id={id}` | Deletes the playlist. Videos in the playlist are NOT deleted, but the curation is lost. | YES | Set to private instead. |
| `DELETE /playlistItems?id={id}` | Removes a video from a playlist. | Reversible | Re-add if needed. Low risk. |
| `DELETE /comments?id={id}` | Deletes a comment. If it's your comment, it's gone. If it's someone else's, you can only delete it from your video. | YES | Hide comment for review instead (via YouTube Studio). |

#### Quota Costs (key endpoints)

| Operation | Quota cost (units) |
|-----------|-------------------|
| Read (list, search) | 1-100 units |
| Insert (upload video) | 1,600 units |
| Update (edit metadata) | 50 units |
| Delete | 50 units |
| Search | 100 units |
| Upload video | 1,600 units |

#### Unexpected Behaviors
- **Quota resets at midnight Pacific Time.** A 10,000 unit daily quota goes fast with video uploads (1,600 each) and searches (100 each).
- **Deleting a video that appears in playlists** removes it from all playlists automatically.
- **Private videos still count toward storage** but are not publicly accessible.
- **The API does not support editing thumbnails directly.** Must use the `thumbnails.set` endpoint separately.

#### Account Ban Triggers
- Exceeding quota limits results in 403 errors for the rest of the day
- Automated mass-uploading triggers spam detection
- Uploading duplicate content across channels violates ToS
- API abuse can result in permanent quota reduction or API access revocation

---

## General Safety Rules

1. **Always GET before DELETE.** Read the resource, confirm it's the right one, show the user what will be deleted, then proceed.
2. **Log every destructive call** in `logs/decisions.md` with: endpoint, resource ID, timestamp, reason, and approval status.
3. **Prefer soft-delete over hard-delete.** Archive, hide, unpublish, set to private, or tag as inactive. Permanent deletion should be the last resort.
4. **Never batch-delete without sample review.** If deleting multiple resources, show the first 3-5 to the user for confirmation before proceeding.
5. **Export before delete.** For any content with engagement data (posts, videos, subscriber records), export the data before deletion.
6. **Rate limit buffer.** Never exceed 80% of any documented rate limit. Build in backoff and retry logic.
7. **Token scope minimization.** Request only the scopes needed for the operation. Do not use admin-level tokens for read operations.
