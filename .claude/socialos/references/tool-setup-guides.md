# Tool Setup Guides -- SOCIAL:OS

Step-by-step setup instructions for every supported tool. Complete each guide fully before using the tool in any SOCIAL:OS command. After setup, verify the connection works before proceeding with any workflow.

---

## Buffer

Social media scheduling and analytics.

### Prerequisites
- Active Buffer account (free tier available at buffer.com)
- At least one social channel to connect (LinkedIn, Twitter/X, Instagram, Facebook, TikTok, Mastodon, Pinterest, YouTube)

### Setup steps

1. Create a Buffer account at https://buffer.com/signup
2. Connect your social channels:
   - Go to **Channels** in the left sidebar
   - Click **Connect a Channel** for each platform
   - Authorize Buffer to post on your behalf
   - Repeat for all channels you want to manage
3. Generate an API access token:
   - Go to https://buffer.com/developers/api
   - Click **Create an App** (if first time)
   - Fill in app name: `SOCIAL:OS`
   - Fill in callback URL: `https://localhost` (placeholder)
   - Copy the **Access Token** from the app details page
4. Add the token to your workspace `.env` file:
   ```
   BUFFER_ACCESS_TOKEN=your_token_here
   ```
5. Verify the connection:
   ```
   curl -s "https://api.bufferapp.com/1/user.json?access_token=$BUFFER_ACCESS_TOKEN" | jq '.name'
   ```
   Expected: returns your Buffer account name.

### Common issues
- **"Unauthorized" error:** Token may have expired. Regenerate at the developer portal.
- **Channel not appearing:** Reconnect the channel in Buffer dashboard. Some platforms require re-authorization every 60 days.
- **Rate limits:** Buffer API allows 60 requests per minute per token. Batch operations accordingly.

---

## Typefully

Twitter/X and LinkedIn drafting, scheduling, and analytics.

### Prerequisites
- Active Typefully account (free tier available at typefully.com)
- Twitter/X or LinkedIn account connected in Typefully

### Setup steps

1. Create a Typefully account at https://typefully.com/signup
2. Connect your social accounts:
   - Go to **Settings** (gear icon)
   - Under **Connected Accounts**, click **Connect Twitter** and/or **Connect LinkedIn**
   - Authorize Typefully for each platform
3. Generate an API key:
   - Go to **Settings > Integrations > API**
   - Click **Generate API Key**
   - Copy the key immediately (it will not be shown again)
4. Add the key to your workspace `.env` file:
   ```
   TYPEFULLY_API_KEY=your_api_key_here
   ```
5. Verify the connection:
   ```
   curl -s -H "X-API-KEY: Bearer $TYPEFULLY_API_KEY" "https://api.typefully.com/v1/drafts/?content=test&threadify=false" -X POST | jq '.id'
   ```
   Expected: returns a draft ID (delete the test draft afterward in Typefully UI).

### Common issues
- **"Invalid API Key":** Ensure you are including `Bearer ` prefix in the header value.
- **Cannot schedule:** Free tier may have scheduling limitations. Upgrade to Pro for full scheduling.
- **LinkedIn posts not appearing:** Reconnect LinkedIn in Typefully settings -- LinkedIn tokens expire frequently.

---

## Meta Business Suite / Graph API

Facebook Pages and Instagram Business posting and analytics.

### Prerequisites
- Facebook Business account
- Facebook Page (not personal profile)
- Instagram Business or Creator account linked to a Facebook Page
- Meta Developer account

### Setup steps

1. Create a Meta Developer account at https://developers.facebook.com/
2. Create a new app:
   - Click **Create App**
   - Select **Business** type
   - Name it `SOCIAL-OS`
   - Select your business account
3. Add the required products:
   - In the app dashboard, click **Add Product**
   - Add **Facebook Login for Business**
   - Add **Instagram Graph API** (if managing Instagram)
4. Set permissions:
   - Navigate to **App Review > Permissions and Features**
   - Request the following permissions:
     - `pages_show_list`
     - `pages_read_engagement`
     - `pages_manage_posts`
     - `pages_manage_metadata`
     - `instagram_basic` (for Instagram)
     - `instagram_content_publish` (for Instagram)
     - `instagram_manage_comments` (for Instagram)
     - `instagram_manage_insights` (for Instagram)
5. Generate a long-lived page access token:
   - Go to **Graph API Explorer** (https://developers.facebook.com/tools/explorer/)
   - Select your app from the dropdown
   - Click **Generate Access Token** and grant the permissions listed above
   - This gives you a short-lived user token
   - Exchange it for a long-lived token:
     ```
     curl -s "https://graph.facebook.com/v19.0/oauth/access_token?grant_type=fb_exchange_token&client_id=YOUR_APP_ID&client_secret=YOUR_APP_SECRET&fb_exchange_token=SHORT_LIVED_TOKEN" | jq '.access_token'
     ```
   - Then get the page token (which does not expire):
     ```
     curl -s "https://graph.facebook.com/v19.0/me/accounts?access_token=LONG_LIVED_USER_TOKEN" | jq '.data[0].access_token'
     ```
6. Get your Instagram Business Account ID:
   ```
   curl -s "https://graph.facebook.com/v19.0/PAGE_ID?fields=instagram_business_account&access_token=PAGE_TOKEN" | jq '.instagram_business_account.id'
   ```
7. Add credentials to your workspace `.env` file:
   ```
   META_APP_ID=your_app_id
   META_APP_SECRET=your_app_secret
   META_PAGE_ACCESS_TOKEN=your_page_token
   META_PAGE_ID=your_page_id
   META_INSTAGRAM_ACCOUNT_ID=your_ig_account_id
   ```
8. Verify the connection:
   ```
   curl -s "https://graph.facebook.com/v19.0/me?access_token=$META_PAGE_ACCESS_TOKEN" | jq '.name'
   ```
   Expected: returns your Facebook Page name.

### Common issues
- **"OAuthException":** Token may have expired. Page tokens derived from long-lived user tokens do not expire, but user tokens last 60 days. Re-generate if needed.
- **"Insufficient permissions":** Ensure all required permissions are approved in App Review.
- **Instagram publishing fails:** Instagram requires a linked Facebook Page. Verify the link in Instagram settings.
- **Rate limits:** Meta API has complex rate limiting. Standard: 200 calls per user per hour. Batch operations when possible.

---

## Twitter/X API v2

Direct Twitter/X posting, reading, and analytics.

### Prerequisites
- Twitter/X account
- Twitter Developer account (apply at developer.twitter.com)
- Developer project and app created

### Setup steps

1. Apply for Twitter Developer access at https://developer.twitter.com/en/portal/petition/essential/basic-info
   - Select **Free** tier (read + write for 1 app, 1,500 tweets/month) or **Basic** ($100/month, 3,000 tweets/month, more endpoints)
   - Describe your use case: "Scheduling and managing social media content for business accounts"
   - Wait for approval (usually instant for Free tier)
2. Create a project and app:
   - In the Developer Portal, click **Projects & Apps > Create Project**
   - Name the project: `SOCIAL-OS`
   - Select use case: **Making a bot** or **Managing social media**
   - Create an app within the project
   - Name the app: `socialos-client`
3. Set up authentication:
   - In the app settings, click **Set up** under **User authentication settings**
   - App permissions: **Read and Write**
   - Type of App: **Web App, Automated App or Bot**
   - Callback URL: `https://localhost/callback`
   - Website URL: your website
   - Save settings
4. Generate keys and tokens:
   - Go to **Keys and Tokens** tab
   - Generate **API Key and Secret** (also called Consumer Key/Secret)
   - Generate **Access Token and Secret** (for your own account)
   - Generate **Bearer Token** (for app-only authentication)
   - Copy all immediately -- they are shown only once
5. Add credentials to your workspace `.env` file:
   ```
   TWITTER_API_KEY=your_api_key
   TWITTER_API_SECRET=your_api_secret
   TWITTER_ACCESS_TOKEN=your_access_token
   TWITTER_ACCESS_TOKEN_SECRET=your_access_token_secret
   TWITTER_BEARER_TOKEN=your_bearer_token
   ```
6. Verify the connection:
   ```
   curl -s -H "Authorization: Bearer $TWITTER_BEARER_TOKEN" "https://api.twitter.com/2/users/me" | jq '.data.username'
   ```
   Expected: returns your Twitter/X username.

### Common issues
- **"403 Forbidden":** Free tier has limited endpoints. Check which endpoints your tier includes at https://developer.twitter.com/en/docs/twitter-api.
- **"429 Too Many Requests":** Rate limited. Free tier: 50 requests per 15 minutes on most endpoints. Implement backoff.
- **"401 Unauthorized":** Regenerate your access tokens. Ensure you are using the correct authentication method (Bearer for app-only, OAuth 1.0a for user context).
- **Tweet creation fails:** Free tier allows 1,500 tweets per month. Check your usage in the Developer Portal.

---

## Beehiiv

Newsletter publishing, subscriber management, and analytics.

### Prerequisites
- Active Beehiiv account (free tier available at beehiiv.com)
- At least one publication created

### Setup steps

1. Create a Beehiiv account at https://www.beehiiv.com/signup
2. Create your publication (if not already done):
   - Follow the onboarding wizard
   - Set publication name, URL, and branding
3. Get your API key:
   - Go to **Settings > Integrations > API**
   - Click **Create New API Key**
   - Name it `SOCIAL-OS`
   - Select permissions: **Full Access** (or scope as needed)
   - Copy the API key
4. Get your Publication ID:
   - In the Beehiiv dashboard URL, the publication ID is visible: `app.beehiiv.com/publications/pub_XXXX/...`
   - Or retrieve via API:
     ```
     curl -s -H "Authorization: Bearer $BEEHIIV_API_KEY" "https://api.beehiiv.com/v2/publications" | jq '.data[0].id'
     ```
5. Add credentials to your workspace `.env` file:
   ```
   BEEHIIV_API_KEY=your_api_key
   BEEHIIV_PUBLICATION_ID=pub_your_publication_id
   ```
6. Verify the connection:
   ```
   curl -s -H "Authorization: Bearer $BEEHIIV_API_KEY" "https://api.beehiiv.com/v2/publications/$BEEHIIV_PUBLICATION_ID" | jq '.data.name'
   ```
   Expected: returns your publication name.

### Common issues
- **"Unauthorized":** API key may be incorrect or expired. Regenerate in Settings.
- **"Publication not found":** Double-check the publication ID. Ensure it includes the `pub_` prefix.
- **Rate limits:** Beehiiv API allows 10 requests per second. Batch subscriber operations.
- **Subscriber imports fail:** Ensure CSV format matches Beehiiv requirements (email column required, optional: utm_source, referring_site, custom_fields).

---

## ConvertKit (Kit)

Email marketing, subscriber management, automations, and creator tools.

### Prerequisites
- Active ConvertKit account (free tier available at kit.com, formerly convertkit.com)

### Setup steps

1. Create a ConvertKit account at https://app.kit.com/users/signup
2. Get your API key:
   - Go to **Settings > Advanced > API**
   - Copy your **API Key** (public key -- used for most endpoints)
   - Copy your **API Secret** (used for subscriber management and sending)
3. Add credentials to your workspace `.env` file:
   ```
   CONVERTKIT_API_KEY=your_api_key
   CONVERTKIT_API_SECRET=your_api_secret
   ```
4. Verify the connection:
   ```
   curl -s "https://api.convertkit.com/v3/account?api_secret=$CONVERTKIT_API_SECRET" | jq '.name'
   ```
   Expected: returns your ConvertKit account name.

### Common issues
- **"401 Not authorized":** Ensure you are using the API Secret (not the API Key) for endpoints that require it.
- **Subscriber operations fail:** Some endpoints require API Secret, others accept API Key. Check the endpoint documentation.
- **Rate limits:** ConvertKit allows 120 requests per minute. Implement delays for bulk operations.
- **Form/tag IDs:** You need specific form or tag IDs for subscriber management. List them via:
  ```
  curl -s "https://api.convertkit.com/v3/forms?api_key=$CONVERTKIT_API_KEY" | jq '.forms[] | {id, name}'
  ```

---

## Crispy MCP

LinkedIn automation and management through the Crispy MCP server.

### Prerequisites
- Active Crispy account with valid LinkedIn session
- Claude Code with MCP support
- Node.js installed (for MCP server)

### Setup steps

1. Ensure you have a Crispy account at https://crispy.sh (or the current Shyft AI URL)
2. Verify your LinkedIn session is active in Crispy:
   - Log into Crispy dashboard
   - Check that your LinkedIn profile shows as "Connected"
   - If disconnected, re-authenticate through Crispy's LinkedIn OAuth flow
3. Configure the Crispy MCP server in Claude Code:
   - The MCP server should be configured in your Claude Code settings
   - Check your `.claude/settings.json` or project-level MCP configuration
   - The server provides 90+ tools for LinkedIn operations
4. Verify the MCP connection:
   - In Claude Code, the Crispy tools should appear in the deferred tools list
   - Test with a read-only operation:
     ```
     Use mcp__claude_ai_Crispy__get_my_profile to verify your session
     ```
   - Then verify session status:
     ```
     Use mcp__claude_ai_Crispy__verify_session
     ```
5. If the MCP server is not yet configured, add it to your project's MCP settings:
   ```json
   {
     "mcpServers": {
       "Crispy": {
         "type": "remote",
         "url": "https://mcp.crispy.sh"
       }
     }
   }
   ```

### Key tool categories available after setup

| Category | Example tools | Use in SOCIAL:OS |
|----------|--------------|-----------------|
| Profile | `get_my_profile`, `get_profile`, `get_profile_analytics` | /social:research, audience scoring |
| Posts | `create_post`, `list_posts`, `get_post_analytics` | /social:write, /social:schedule |
| Engagement | `comment_on_post`, `react_to_post`, `repost_post` | /social:engage |
| Search | `search_people`, `search_companies`, `search_posts` | /social:research, discovery |
| Messaging | `send_message`, `send_invitation`, `get_inbox_status` | /social:engage (DM outreach) |
| Analytics | `get_post_analytics`, `get_profile_analytics`, `get_activity_analytics` | /social:report |
| Campaigns | `create_campaign`, `get_campaign_stats` | /social:engage (sequences) |
| Connections | `get_connections`, `get_profile_viewers`, `list_pending_invitations` | /social:community |

### Common issues
- **"Session expired":** Re-authenticate LinkedIn in the Crispy dashboard. Sessions typically last 30-90 days.
- **"Rate limited by LinkedIn":** Crispy respects LinkedIn's limits. Reduce request frequency. Default safe limits: 25 connection requests/day, 100 messages/day, 50 profile views/day.
- **MCP tools not appearing:** Restart Claude Code. Check that the MCP server URL is correct in settings.
- **"Profile not found":** LinkedIn may have changed the profile URL format. Use LinkedIn URN ID instead of vanity URL when possible.

---

## Slack MCP

Team notifications, alerts, and collaboration through the Slack MCP server.

### Prerequisites
- Slack workspace with admin or app installation permissions
- Claude Code with MCP support

### Setup steps

1. Ensure the Slack MCP server is configured in your Claude Code settings:
   - The server provides tools for reading channels, sending messages, searching, and managing canvases
   - Check your `.claude/settings.json` or project-level MCP configuration
2. Verify the MCP connection:
   - In Claude Code, Slack tools should appear in the deferred tools list
   - Test with a read-only operation:
     ```
     Use mcp__claude_ai_Slack__slack_search_channels to find a known channel
     ```
3. If the Slack MCP server is not yet configured, add it to your project's MCP settings:
   ```json
   {
     "mcpServers": {
       "Slack": {
         "type": "remote",
         "url": "https://mcp.slack.com"
       }
     }
   }
   ```
4. Configure notification channels for SOCIAL:OS:
   - Create a `#social-os-alerts` channel (or equivalent) in your Slack workspace
   - Set up notification routing in workspace `COLLABORATION.md`:
     ```
     ## Slack notifications
     Channel: #social-os-alerts
     Critical: enabled (content failures, API errors, budget alerts)
     Important: enabled (content published, engagement milestones)
     Informational: disabled (routine scheduling confirmations)
     ```

### Key tools available after setup

| Tool | Use in SOCIAL:OS |
|------|-----------------|
| `slack_send_message` | Send alerts, content approval requests, performance summaries |
| `slack_read_channel` | Check approval responses, team feedback |
| `slack_search_public` | Find relevant discussions for content inspiration |
| `slack_create_canvas` | Create content briefs and reports as Slack canvases |
| `slack_schedule_message` | Schedule recurring reports and alerts |
| `slack_send_message_draft` | Draft messages for team review before sending |

### Common issues
- **"not_in_channel":** The Slack app must be added to each channel it needs to post in. Use `/invite @app_name` in the channel.
- **"missing_scope":** The Slack app may need additional OAuth scopes. Check the app configuration in api.slack.com.
- **Messages not sending:** Verify the channel ID (not channel name) is being used. Channel IDs start with `C` for public channels.
- **MCP tools not appearing:** Restart Claude Code. Verify the MCP server configuration URL.

---

## Environment variable summary

After completing all relevant setups, your workspace `.env` file should contain:

```
# Buffer
BUFFER_ACCESS_TOKEN=

# Typefully
TYPEFULLY_API_KEY=

# Meta / Facebook / Instagram
META_APP_ID=
META_APP_SECRET=
META_PAGE_ACCESS_TOKEN=
META_PAGE_ID=
META_INSTAGRAM_ACCOUNT_ID=

# Twitter/X
TWITTER_API_KEY=
TWITTER_API_SECRET=
TWITTER_ACCESS_TOKEN=
TWITTER_ACCESS_TOKEN_SECRET=
TWITTER_BEARER_TOKEN=

# Beehiiv
BEEHIIV_API_KEY=
BEEHIIV_PUBLICATION_ID=

# ConvertKit
CONVERTKIT_API_KEY=
CONVERTKIT_API_SECRET=
```

Only include keys for tools you have set up. Do not leave placeholder values -- either fill in the real key or remove the line.

**Security:** Never commit `.env` files to version control. Ensure `.env` is in your `.gitignore`.

---

## Post-setup checklist

After setting up each tool, verify:

- [ ] Credentials are stored in `.env` (not hardcoded anywhere)
- [ ] `.env` is in `.gitignore`
- [ ] Verification command returns expected result
- [ ] Tool appears in workspace `TOOLS.md` with credit/cost behavior noted
- [ ] Rate limits are documented in workspace `TOOLS.md`
- [ ] If tool has usage costs, initial budget is set in `COSTS.md`
