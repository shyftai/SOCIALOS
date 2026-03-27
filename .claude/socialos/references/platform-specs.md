# Platform Specs — SOCIAL:OS

Complete specifications for every supported platform. Load before creating or validating content.

Last updated: 2026-03

---

## LinkedIn

### Post Types

#### Text Post
| Spec | Value |
|------|-------|
| Max characters | 3,000 |
| Optimal length | 800-1,300 characters |
| Truncation point | ~210 characters ("...see more") |
| Link preview | Auto-generated when URL included |
| Mentions | @name (must be 1st-degree connection or follow) |
| Hashtags | Clickable, max 30 allowed, 3-5 recommended |

#### Carousel (Document Post)
| Spec | Value |
|------|-------|
| Format | PDF upload (renders as slides) |
| Max slides | 300 (practical limit: 8-12) |
| Recommended slides | 8-12 |
| File size max | 100 MB |
| Slide dimensions | 1080 x 1350 px (4:5, recommended) or 1080 x 1080 px (1:1) |
| Resolution | 150 DPI minimum |
| Font size | 24pt minimum for body text, 32pt+ for headers |

#### Article (LinkedIn Newsletter / Pulse)
| Spec | Value |
|------|-------|
| Title max | 100 characters (40-49 optimal) |
| Body | No hard character limit |
| Optimal length | 800-2,000 words |
| Cover image | 1920 x 1080 px (16:9) |
| In-article images | 1200 x 627 px recommended |
| SEO | Articles are indexed by Google |

#### LinkedIn Newsletter
| Spec | Value |
|------|-------|
| Title max | 65 characters |
| Description max | 300 characters |
| Logo | 300 x 300 px |
| Cover image | 1920 x 1080 px |
| Frequency options | Daily, weekly, biweekly, monthly |
| Subscriber notification | Push + email to all subscribers |

#### Video
| Spec | Value |
|------|-------|
| Duration | 3 seconds to 10 minutes (15 minutes for some accounts) |
| Optimal length | 1-3 minutes |
| File size max | 5 GB |
| Resolution | 1080 x 1920 px (9:16 vertical) or 1920 x 1080 px (16:9 horizontal) |
| Format | MP4, MOV |
| Aspect ratios | 1:1, 16:9, 9:16, 4:5 |
| Captions | Auto-generated or SRT upload |

#### Best Times to Post
| Day | Time (recipient timezone) |
|-----|--------------------------|
| Tuesday | 7:30-8:30 AM, 12:00 PM |
| Wednesday | 7:30-8:30 AM, 12:00 PM |
| Thursday | 7:30-8:30 AM, 12:00 PM |

#### Algorithm Tips
- Dwell time (how long people spend reading) is a major signal
- Comments in the first hour heavily influence reach
- Posts with images get 2x engagement vs. text-only on average
- Carousels (PDF documents) consistently get highest reach
- External links in the post body reduce reach -- put links in comments or use text + comment link strategy
- Tagging relevant people who will actually engage boosts reach
- Editing a post within 10 minutes does NOT reset the algorithm
- LinkedIn prioritizes "meaningful conversation" -- posts with long comments outperform posts with many short comments

---

## Twitter/X

### Post Types

#### Tweet
| Spec | Value |
|------|-------|
| Max characters (free) | 280 |
| Max characters (Premium+) | 25,000 |
| Images per tweet | Up to 4 |
| Image dimensions | 1200 x 675 px (16:9) recommended, 1600 x 900 px max quality |
| Image formats | JPG, PNG, GIF (max 5 MB for images, 15 MB for GIFs) |
| Video max duration | 2 min 20 sec (free), 60 min (Premium+) |
| Video max file size | 512 MB |
| Video resolution | 1920 x 1080 px recommended |
| Video formats | MP4 (H264, AAC) |
| Polls | 2-4 options, 5 min to 7 day duration |

#### Thread
| Spec | Value |
|------|-------|
| Max tweets per thread | 25 (API), unlimited (manual) |
| Optimal length | 3-7 tweets |
| Character limit per tweet | Same as regular tweet |
| Numbering convention | [1/N] or 1. at start of each tweet |

#### Spaces (Audio)
| Spec | Value |
|------|-------|
| Max speakers | 13 |
| Max listeners | Unlimited |
| Duration | Up to 4 hours (auto-recorded on some accounts) |
| Scheduling | Can be scheduled in advance |

#### Polls
| Spec | Value |
|------|-------|
| Options | 2-4 choices |
| Option character limit | 25 characters each |
| Duration | 5 minutes to 7 days |
| Optimal duration | 24 hours |

#### Best Times to Post
| Day | Time (recipient timezone) |
|-----|--------------------------|
| Monday-Friday | 8:00-10:00 AM, 12:00-1:00 PM |
| Wednesday | Highest engagement day |
| Weekend | Lower volume = less competition |

#### Algorithm Tips
- Replies and conversations are heavily weighted
- Bookmarks signal high-quality content
- Images and video increase engagement 2-3x over text-only
- Threads that get engagement on the first tweet cascade to subsequent tweets
- Posting frequency matters more on X than most platforms -- 1-3x/day is optimal
- Quote tweets with commentary outperform plain retweets
- The "For You" algorithm favors accounts you interact with -- engage with your target audience's content
- External links are de-prioritized in the feed -- consider posting the content natively

---

## Instagram

### Post Types

#### Feed Post (Image)
| Spec | Value |
|------|-------|
| Square | 1080 x 1080 px (1:1) |
| Portrait | 1080 x 1350 px (4:5) -- best for feed presence |
| Landscape | 1080 x 566 px (1.91:1) |
| Max file size | 30 MB |
| Format | JPG, PNG |
| Caption max | 2,200 characters |
| Hashtags max | 30 (5-10 recommended) |
| Mentions max | 20 per post |

#### Carousel
| Spec | Value |
|------|-------|
| Slides | 2-20 images/videos |
| Optimal slides | 5-10 |
| Dimensions | Same as feed post (must be consistent across slides) |
| Mix | Can combine images and videos |
| Swipe-through rate | Algorithm tracks how many slides users view |

#### Reel
| Spec | Value |
|------|-------|
| Duration | 0-90 seconds (15, 30, 60, 90 sec options) |
| Optimal length | 30-60 seconds |
| Dimensions | 1080 x 1920 px (9:16 full screen) |
| File size max | 4 GB |
| Format | MP4, MOV |
| Cover photo | 1080 x 1920 px |
| Audio | Original or from Instagram music library |
| Captions | Auto-generated or manual overlay |
| Caption text max | 2,200 characters |

#### Story
| Spec | Value |
|------|-------|
| Duration | Up to 60 seconds per story (auto-split for longer) |
| Dimensions | 1080 x 1920 px (9:16) |
| Image format | JPG, PNG |
| Video format | MP4, MOV |
| Lifespan | 24 hours (unless added to Highlights) |
| Interactive stickers | Poll, question, quiz, countdown, link, mention, location, music |
| Link sticker | Available to all accounts |

#### Live
| Spec | Value |
|------|-------|
| Duration | Up to 4 hours |
| Co-hosts | Up to 3 (Live Rooms) |
| Saved to | Can be shared as a Reel after ending |

#### Best Times to Post
| Day | Time (recipient timezone) |
|-----|--------------------------|
| Tuesday | 11:00 AM - 1:00 PM |
| Wednesday | 11:00 AM - 1:00 PM |
| Friday | 10:00 AM - 12:00 PM, 7:00 - 9:00 PM |

#### Algorithm Tips
- Reels are prioritized for reach (non-followers see Reels more than feed posts)
- Carousels have the highest save rate and second-highest reach
- Saves and shares are weighted more heavily than likes
- Posting when your audience is active matters more than "universal" best times -- check Insights
- Story engagement (polls, questions) signals active interest to the algorithm
- Consistent posting schedule > sporadic bursts
- Instagram deprioritizes content with visible watermarks from other platforms (e.g., TikTok logo)
- Hashtags in first comment vs. caption performs roughly the same -- test for your account

---

## TikTok

### Video Specs
| Spec | Value |
|------|-------|
| Duration | 1 second to 10 minutes |
| Optimal length | 30-60 seconds |
| Dimensions | 1080 x 1920 px (9:16) |
| File size max | 287.6 MB (mobile), 10 GB (desktop) |
| Format | MP4, MOV, WebM |
| Resolution | 1080p minimum recommended |
| Frame rate | 30 FPS minimum |
| Aspect ratio | 9:16 (full screen vertical) |

### Captions and Text
| Spec | Value |
|------|-------|
| Caption max | 4,000 characters |
| Optimal caption length | 150-300 characters |
| Hashtags | Included in caption character count |
| On-screen text | Auto-captions available, or manual text overlay |
| Text safe zone | Keep text within center 80% of frame (avoid edges) |

### Audio
| Spec | Value |
|------|-------|
| Sounds library | Yes -- trending and original |
| Original audio | Recommended for educational/talking-head content |
| Trending sounds | Boost discoverability but must match content |
| Music licensing | Commercial accounts have limited music library |

### Best Times to Post
| Day | Time (recipient timezone) |
|-----|--------------------------|
| Tuesday | 7:00-9:00 AM, 12:00-3:00 PM |
| Wednesday | 7:00-9:00 AM, 7:00-11:00 PM |
| Thursday | 12:00-3:00 PM, 7:00-11:00 PM |

### Algorithm Tips
- Watch time / completion rate is THE most important metric
- First 1-2 seconds determine whether someone keeps watching -- hook immediately
- Videos that are rewatched (looped) get massive algorithm boost
- Engagement velocity in the first 30-60 minutes determines reach
- Comments are heavily weighted -- ask questions, create debate
- Niche content outperforms broad content for growth
- Posting 1-3x per day is optimal for growth
- TikTok does NOT penalize posting frequency -- more posts = more chances
- Using trending sounds increases discoverability by 20-30%
- Vertical (9:16) content performs 25% better than non-vertical

---

## YouTube

### Video Types

#### Standard Video
| Spec | Value |
|------|-------|
| Duration max | 12 hours (or 256 GB, whichever is less) |
| Optimal length | 8-15 minutes |
| Resolution | 1920 x 1080 px (1080p) minimum, 3840 x 2160 (4K) preferred |
| File size max | 256 GB |
| Format | MP4 (recommended), MOV, AVI, WMV, FLV, WebM |
| Frame rate | 24-60 FPS |
| Aspect ratio | 16:9 |
| Thumbnail | 1280 x 720 px (16:9), max 2 MB, JPG/PNG/GIF |
| Title max | 100 characters (50-60 optimal) |
| Description max | 5,000 characters (first 2-3 lines visible before "Show more") |
| Tags max | 500 characters total across all tags |

#### YouTube Shorts
| Spec | Value |
|------|-------|
| Duration max | 60 seconds |
| Optimal length | 30-60 seconds |
| Dimensions | 1080 x 1920 px (9:16) |
| Aspect ratio | 9:16 (vertical) |
| Title max | 100 characters |
| Hashtag | #Shorts in title or description (recommended) |

#### Community Post
| Spec | Value |
|------|-------|
| Text max | 1,500 characters |
| Images | Up to 1 image |
| Polls | Yes (up to 4 options) |
| Eligibility | 500+ subscribers (for mobile), 1,000+ (for some features) |

#### Live Stream
| Spec | Value |
|------|-------|
| Duration max | 12 hours |
| Resolution | Up to 4K (2160p) |
| Chat | Enabled by default |
| Super Chat | Available if monetized |
| Scheduling | Can be scheduled in advance |

#### Best Times to Post
| Day | Time (recipient timezone) |
|-----|--------------------------|
| Thursday | 2:00-4:00 PM (publish 2-3 hours before peak viewing) |
| Friday | 2:00-4:00 PM |
| Saturday | 9:00-11:00 AM |

#### Algorithm Tips
- Click-through rate (CTR) on thumbnails is the primary discovery metric
- Average view duration determines whether YouTube promotes the video
- The first 30 seconds determine retention -- hook immediately
- Posting consistently (same day/time each week) trains the algorithm and audience
- End screens and cards that drive viewers to another video increase session time -- YouTube rewards this
- YouTube Shorts and standard videos have SEPARATE algorithms -- success in one doesn't guarantee success in the other
- Comments in the first hour signal engagement quality
- Playlists increase total watch time per session
- Titles and thumbnails should create a curiosity gap without being clickbait

---

## Threads

### Post Specs
| Spec | Value |
|------|-------|
| Text max | 500 characters |
| Images | Up to 10 per post |
| Image dimensions | 1080 x 1350 px (4:5 recommended) |
| Video max | 5 minutes |
| Video dimensions | 1080 x 1920 px (9:16) |
| Links | Supported (with preview) |
| Hashtags | Supported but minimal impact currently |
| Polls | Not supported (as of 2026-03) |

### Best Times to Post
| Day | Time (recipient timezone) |
|-----|--------------------------|
| Monday-Friday | 8:00-10:00 AM, 6:00-8:00 PM |
| Weekend | 10:00 AM - 12:00 PM |

### Algorithm Tips
- Conversation and replies are the primary engagement signal
- Cross-posting from Instagram increases initial visibility
- Short, opinion-driven posts perform best
- The algorithm is still maturing -- early adopters get disproportionate reach
- Engagement with others' posts increases your visibility
- No hashtag-driven discovery yet -- growth is conversation-driven

---

## Reddit

### Post Types
| Type | Spec |
|------|------|
| Text post | No character limit (practically, 40,000 characters) |
| Link post | URL + title |
| Image post | Up to 20 images |
| Video post | Up to 15 minutes, 1 GB max |
| Poll | 2-6 options, 1-7 day duration |
| Crosspost | Share a post from one subreddit to another |

### Title and Content
| Spec | Value |
|------|-------|
| Title max | 300 characters |
| Optimal title length | 100-200 characters |
| Comment max | 10,000 characters |
| Markdown | Fully supported in text posts and comments |
| Flair | Required in many subreddits -- check before posting |

### Best Times to Post
| Day | Time (EST) |
|-----|-----------|
| Monday | 6:00-8:00 AM |
| Wednesday | 6:00-8:00 AM, 12:00-2:00 PM |
| Saturday | 8:00-10:00 AM |

### Algorithm Tips
- Upvote velocity in the first hour determines visibility
- Comments drive posts higher -- ask questions, invite discussion
- Each subreddit has its own culture -- lurk and learn before posting
- Self-promotion rules are strict: 10% max of total activity
- Crossposting to relevant subreddits is acceptable when done sparingly
- Awards/upvotes from established accounts carry more weight
- Posting original research, data, and genuine expertise gets the most traction
- Reddit users detect and punish marketing-speak aggressively

---

## Newsletter (Email Specs)

### Email Rendering
| Spec | Value |
|------|-------|
| Max width | 600 px (desktop), fluid (mobile) |
| Image width | 600 px max (retina: 1200 px) |
| Subject line | 30-50 characters (5-9 words optimal) |
| Preview text | 40-90 characters |
| Font size | 16px body minimum (mobile readability) |
| Line height | 1.5x font size |
| CTA button | Min 44 x 44 px tap target |

### Deliverability Specs
| Spec | Value |
|------|-------|
| SPF record | Required |
| DKIM signing | Required |
| DMARC policy | Recommended |
| List-Unsubscribe header | Required |
| Physical address | Required (CAN-SPAM, GDPR) |
| Image-to-text ratio | Max 40% images, 60% text |
| Total email size | Under 102 KB (Gmail clips above this) |
| Alt text on images | Required for accessibility and deliverability |

### Testing
| Test | Details |
|------|---------|
| Inbox preview | Test in Gmail, Outlook, Apple Mail, Yahoo at minimum |
| Mobile preview | 60%+ of opens are mobile -- test mobile first |
| Dark mode | Test colors and images in dark mode |
| Image blocking | Content must be readable with images blocked |
| Link testing | Every link clicked and verified before send |
| Spam score | Test with mail-tester.com or similar (target 9+/10) |
