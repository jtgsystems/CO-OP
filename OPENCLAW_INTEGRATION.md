# OpenClaw Integration Guide

## What is OpenClaw?

OpenClaw is a **WhatsApp + Telegram + Discord + iMessage gateway** for AI agents. It enables:

- 24/7 AI assistant via your favorite messaging platforms
- Help desk automation
- Job search and research automation
- Server monitoring and alerts
- Custom skills via ClawHub registry

## Core Concepts

### Channels (Messaging Platforms)

| Channel | Use Case | Setup |
|---------|----------|-------|
| **WhatsApp** | Primary personal assistant | QR code pairing |
| **Telegram** | Quick commands, bots | Bot token + webhook |
| **Discord** | Community, server monitoring | Bot token |
| **iMessage** | Mac-only personal messaging | Apple Scripts |
| **Signal** | Private messaging | Daemon setup |
| **Slack** | Work/team integration | Bot token |

### Two-Phone Setup (Recommended)

```
Your Phone (+1-YOU) → Assistant Phone (+1-ASSIST) → OpenClaw Gateway → AI Agent
```

**Never pair your personal WhatsApp** - use a dedicated number/SIM for the assistant.

## Installation

```bash
# Install via npm
npm install -g openclaw

# Or via curl script
curl -fsSL https://openclaw.ai/install.sh | bash

# Onboard (first time)
openclaw onboard
```

## Quick Start (5 Minutes)

### 1. Login to WhatsApp

```bash
openclaw channels login
# Scan QR with assistant phone
```

### 2. Configure Safety

Edit `~/.openclaw/openclaw.json`:

```json5
{
  channels: {
    whatsapp: {
      allowFrom: ["+15555550123"]  // Your number only
    }
  }
}
```

### 3. Start Gateway

```bash
openclaw gateway --port 18789
```

### 4. Send Test Message

Message your assistant number from your allowlisted phone.

## Agent Workspace

OpenClaw reads instructions from `~/.openclaw/workspace/`:

| File | Purpose |
|------|---------|
| `AGENTS.md` | Operating instructions for the AI |
| `SOUL.md` | Persona and personality |
| `TOOLS.md` | Available tools and commands |
| `IDENTITY.md` | Agent identity and role |
| `USER.md` | Information about you |
| `HEARTBEAT.md` | Proactive tasks (runs every 30m) |
| `MEMORY.md` | Persistent context (optional) |

### Initialize Workspace

```bash
openclaw setup
```

Make it a git repo for backup:

```bash
cd ~/.openclaw/workspace
git init
git add .
git commit -m "Initial workspace"
```

## Help Desk Automation

### Setup for Support Tickets

Create `skills/helpdesk/SKILL.md`:

```markdown
# Help Desk Skill

When users ask for support:
1. Categorize the issue (billing, technical, feature request)
2. Ask for relevant details
3. Check knowledge base
4. Provide solution or escalate

Common responses:
- "I'll check that for you." (investigating)
- "Let me escalate this to tier 2." (escalation)
- "That's fixed in version X." (known issue)
```

### Knowledge Base

Store documentation in `skills/helpdesk/kb/`:

```
skills/helpdesk/kb/
├── billing.md
├── technical.md
├── features.md
└── policies.md
```

## Job Automation

### Job Search Skill

Create `skills/jobs/SKILL.md`:

```markdown
# Job Search Automation

Capabilities:
- Search LinkedIn, Indeed, company sites
- Match jobs to user's skills and preferences
- Generate tailored cover letters
- Track applications in a spreadsheet

Commands:
- "Find React developer jobs in Toronto"
- "Apply to this job with my resume"
- "Show my application status"
```

### Application Tracking

OpenClaw can update a Google Sheet or Airtable with:

- Company name
- Position
- Application date
- Status (applied, interview, offer, rejected)
- Follow-up dates

## Server Monitoring

### Health Check Skill

```markdown
# Server Monitor

Check every 15 minutes:
- CPU usage > 80% → Alert
- Memory usage > 85% → Alert
- Disk space < 10% → Alert
- Website down → Alert

Alert via Discord channel or SMS (Twilio)
```

### Cron Setup

```bash
# Add to crontab
*/15 * * * * openclaw message send --channel discord --text "Running health check..." && /path/to/health-check.sh
```

## ClawHub (Skills Registry)

ClawHub is a **public skills registry** for OpenClaw.

### Install CLI

```bash
npm i -g clawhub
```

### Find and Install Skills

```bash
# Search skills
clawhub search "calendar"

# Install a skill
clawhub install job-search

# Update all skills
clawhub update --all
```

### Publish Your Skills

```bash
# From your skills directory
clawhub publish ./my-skill --slug my-skill --name "My Skill" --version 1.0.0
```

Visit: https://clawhub.ai

## Twilio Integration (SMS Alerts)

### Setup

1. Get Twilio credentials from https://twilio.com
2. Add to `~/.openclaw/openclaw.json`:

```json5
{
  skills: {
    twilio: {
      accountSid: "ACxxxxx",
      authToken: "your_auth_token",
      fromNumber: "+1234567890"
    }
  }
}
```

### Alert Logic

In your agent's `HEARTBEAT.md`:

```markdown
## Alerts

If server issues detected:
1. Send SMS via Twilio
2. Post to Discord channel
3. Create ticket if critical

Priority levels:
- LOW: Log only
- MEDIUM: Discord notification
- HIGH: SMS + Discord
- CRITICAL: SMS + Discord + Phone call
```

## Security Best Practices

### ⚠️ Critical Rules

1. **Always set `allowFrom`** - never run open WhatsApp
2. **Use dedicated phone number** - separate from personal
3. **Disable heartbeats initially** - set to `"0m"` until trusted
4. **Never expose tokens** - keep credentials private
5. **Limit file access** - restrict workspace paths

### Safe Config Example

```json5
{
  channels: {
    whatsapp: {
      allowFrom: ["+15555550123"],
      groups: {
        "*": { requireMention: true }
      }
    }
  },
  agent: {
    heartbeat: { every: "0m" },  // Disabled initially
    workspace: "~/.openclaw/workspace"
  }
}
```

## Commands Reference

| Command | Purpose |
|---------|---------|
| `openclaw status` | Show local status |
| `openclaw status --all` | Full diagnosis |
| `openclaw status --deep` | Gateway health probes |
| `openclaw channels login` | Login to channels |
| `openclaw dashboard` | Open web dashboard |
| `openclaw doctor` | Troubleshooting |

## Session Management

### Reset Conversation

```
/new        # Start fresh session
/reset      # Same as /new
/compact    # Summarize and save tokens
```

### Media Handling

**Receive attachments:**
- `{{MediaPath}}` - Local file path
- `{{MediaUrl}}` - URL reference
- `{{Transcript}}` - Audio transcription

**Send attachments:**
```
Here's the file you requested.
MEDIA:/path/to/file.pdf
```

## Advanced: Multi-Agent Setup

Run multiple specialized agents:

```bash
# Support agent
openclaw gateway --port 18789 --config ~/.openclaw/support.json

# Job search agent
openclaw gateway --port 18790 --config ~/.openclaw/jobs.json

# Research agent
openclaw gateway --port 18791 --config ~/.openclaw/research.json
```

Each with its own workspace and configuration.

## Troubleshooting

### Gateway Won't Start

```bash
# Check logs
tail -f /tmp/openclaw/openclaw-$(date +%Y-%m-%d).log

# Check port is free
lsof -i :18789

# Restart gateway
pkill -9 -f openclaw-gateway
openclaw gateway --port 18789
```

### WhatsApp Not Responding

```bash
# Re-login
openclaw channels login whatsapp

# Check status
openclaw status --deep
```

### Agent Not Responding

Check workspace files exist:
```bash
ls -la ~/.openclaw/workspace/
```

## Resources

- **Docs:** https://docs.openclaw.ai
- **ClawHub:** https://clawhub.ai
- **Discord:** https://discord.gg/openclaw
- **GitHub:** https://github.com/openclaw/openclaw

## Student Project Ideas

1. **Help Desk Bot** - Auto-respond to common questions
2. **Job Hunter** - Daily job alerts + auto-apply
3. **Server Monitor** - Alert on issues via SMS/Discord
4. **Research Assistant** - Summarize papers, find sources
5. **Personal Admin** - Reminders, scheduling, notes
