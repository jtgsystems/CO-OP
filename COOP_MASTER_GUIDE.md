# CO-OP Master Guide 2026
## Complete Developer Onboarding Curriculum

**Version:** 3.0 | **Last Updated:** February 19, 2026

---

## 🎯 Program Philosophy: AI-First Generalist

**Read this before anything else.**

The technology landscape changes too fast for specialization. Commands you memorize today will be deprecated in 6 months. Tools you master deeply will be replaced by better alternatives.

**The winning strategy in 2026:**

```
┌─────────────────────────────────────────────────────────────────────┐
│  AI-FIRST GENERALIST                                                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ❌ OLD: "I'm the Docker expert"                                    │
│  ✅ NEW: "I understand containers, AI handles the Dockerfile"       │
│                                                                      │
│  ❌ OLD: "I memorized 500 git commands"                             │
│  ✅ NEW: "Git = version control, AI generates the commands"         │
│                                                                      │
│  ❌ OLD: "I'm a PostgreSQL specialist"                              │
│  ✅ NEW: "Databases store data, AI sets up and secures them"        │
│                                                                      │
│  ❌ OLD: "I manually track security updates"                        │
│  ✅ NEW: "AI scans for vulnerabilities and creates fixes"           │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

### What You'll Actually Learn

| Old Way (Dying) | New Way (2026) |
|-----------------|----------------|
| Master one tool deeply | Understand what tools do |
| Memorize commands | Let AI generate commands |
| Manual security checks | AI-powered scanning |
| Read 500-page books | Ask AI for examples |
| Work in silos | Orchestrate AI workflows |

### Your Core Skills (AI-Proof)

1. **Problem Decomposition** - Break big problems into AI-solvable chunks
2. **Architecture** - Know what tools exist and when to use them
3. **Verification** - Check AI's output actually works
4. **Communication** - Explain technical concepts to humans
5. **Security Awareness** - Know what's risky, let AI find/fix it

---

## 📋 Quick Links

| Document | Purpose |
|----------|---------|
| [STUDENT_ONBOARDING.md](./STUDENT_ONBOARDING.md) | **START HERE** - Philosophy + setup |
| [CURRICULUM_OVERVIEW.md](./CURRICULUM_OVERVIEW.md) | High-level 4-week program structure |
| [WEEK_1_FOUNDATION.md](./WEEK_1_FOUNDATION.md) | AI tools, prompt engineering, verification |
| [WEEK_2_BACKEND.md](./WEEK_2_BACKEND.md) | Databases, APIs (AI-assisted) |
| [WEEK_3_AUTOMATION.md](./WEEK_3_AUTOMATION.md) | Security, CI/CD (AI-automated) |
| [WEEK_4_INTEGRATION.md](./WEEK_4_INTEGRATION.md) | OpenClaw, Twilio, job automation |
| [AI_TOOLS_RESEARCH_2026.md](./AI_TOOLS_RESEARCH_2026.md) | Claude Code, Windsurf, Gemini CLI |
| [OPENCLAW_INTEGRATION.md](./OPENCLAW_INTEGRATION.md) | 24/7 AI assistant setup |

---

## 🎯 Program Goals

Graduates will be able to:

1. **Ship anything with AI** - Use AI as primary tool, not helper
2. **Orchestrate workflows** - Connect systems and automate tasks
3. **Verify AI output** - Check that code actually works and is secure
4. **Learn new tools fast** - Understand concepts, let AI handle syntax
5. **Stay current automatically** - AI tracks updates, you implement

---

## 📅 4-Week Overview

### Week 1: AI Tools Foundation
- Day 1: **AI Tool Setup** - Antigravity, Claude Code, Windsurf
- Day 2: **Prompt Engineering** - How to ask AI effectively
- Day 3: **Verification** - Check AI's output, understand what it did
- Day 4: **Iteration** - Refine when AI doesn't get it right
- Day 5: **Project** - Ship something with AI assistance

### Week 2: Backend & Data (AI-Assisted)
- Day 1: **Databases** - Understand concepts, AI sets up PostgreSQL
- Day 2: **APIs** - REST/GraphQL, AI handles the implementation
- Day 3: **Authentication** - Security patterns, AI generates secure code
- Day 4: **Testing** - AI writes tests, you verify coverage
- Day 5: **Project** - Build a full API with AI

### Week 3: Security & DevOps (AI-Automated)
- Day 1: **Security Scanning** - AI finds vulnerabilities, creates fixes
- Day 2: **CI/CD** - AI builds deployment pipelines
- Day 3: **Monitoring** - AI sets up alerts (Twilio, Discord)
- Day 4: **Containers** - Understand Docker, AI writes Dockerfiles
- Day 5: **Project** - Automated security + deployment

### Week 4: Integration & Automation
- Day 1: **OpenClaw** - 24/7 AI assistant setup
- Day 2: **Workflows** - Connect AI tools together
- Day 3: **Job Automation** - AI cover letters, application tracking
- Day 4: **Research** - AI-powered information gathering
- Day 5: **Capstone** - Ship a complete AI-orchestrated project

---

## 🛠️ SOTA 2026 Tools Stack

### AI Development Tools

| Tool | Purpose | When to Use |
|------|---------|-------------|
| **Claude Code CLI** | Deep reasoning, 200K context | Terminal workflows, complex debugging |
| **Windsurf IDE** | Full IDE with Cascade agent | All-day coding, multi-file edits |
| **Gemini CLI** | Fast responses, 1-2M context | Quick questions, large context |
| **GSD** | Project workflow management | Large projects, phase tracking |
| **OpenClaw** | 24/7 AI assistant via chat | Help desk, job search, monitoring |

### Core CLI Tools (Must Install)

```bash
# File operations
eza    # Modern ls (aliases: ls, ll, la)
bat    # Syntax-highlighted cat (alias: cat)
fd     # Fast file search (alias: find)
zoxide # Smart directory jumping (alias: z, cd)

# Search & Data
rg     # Fast content search (alias: grep)
television # Fuzzy finder (alias: fuzzy)
succinctly # 880 MiB/s JSON processor (alias: jq)
qsv    # CSV processor (15GB in 12s) (alias: csv)

# Development
oxlint # 50-100x faster JS linter
bun    # Fast JS runtime/package manager
uv     # Fast Python tool

# Git
lazygit # Git TUI
gh     # GitHub CLI
delta  # Enhanced diff viewer
```

---

## 🔐 Security Automation (Cron Jobs)

### Daily Security Scans

```bash
# Add to crontab: crontab -e

# 6 AM daily - Run security audits
0 6 * * * cd ~/projects/myapp && npm audit fix && git add . && git commit -m "Security: auto-fix vulnerabilities"

# 7 AM daily - Run Snyk scan
0 7 * * * snyk test --json > /var/log/snyk-$(date +\%Y\%m\%d).json

# 8 AM daily - Check for outdated deps
0 8 * * * npm outdated | mail -s "Outdated packages" admin@example.com
```

### Zero-Downtime Updates

```bash
#!/bin/bash
# auto-update.sh - Safe deployment script

set -e

# Pull latest
git pull --rebase

# Install updates
npm ci

# Run tests
npm test

# Backup current version
cp -r /var/www/current /var/www/backup-$(date +%Y%m%d-%H%M%S)

# Switch to new version
ln -nfs /var/www/releases/$(git rev-parse HEAD) /var/www/current

# Restart service (zero downtime)
systemctl reload myapp

# Health check
sleep 5
curl -f http://localhost:3000/health || {
  echo "Health check failed, rolling back..."
  ln -nfs /var/www/backup-$(ls -t /var/www/backup-* | head -1) /var/www/current
  systemctl reload myapp
  exit 1
}

# Notify
echo "Deploy successful: $(git rev-parse --short HEAD)"
```

---

## 📱 Communication & Alerting

### Twilio SMS Alerts

```javascript
// alert.js - Send SMS on critical events
const twilio = require('twilio');

const client = twilio(
  process.env.TWILIO_ACCOUNT_SID,
  process.env.TWILIO_AUTH_TOKEN
);

async function sendAlert(message, priority = 'LOW') {
  const recipients = {
    LOW: [],  // No SMS
    MEDIUM: [process.env.PHONE_ON_CALL],
    HIGH: [process.env.PHONE_ON_CALL, process.env.PHONE_MANAGER],
    CRITICAL: [process.env.PHONE_ON_CALL, process.env.PHONE_MANAGER, process.env.PHONE_CTO]
  };

  for (const phone of recipients[priority]) {
    await client.messages.create({
      body: `[${priority}] ${message}`,
      from: process.env.TWILIO_PHONE,
      to: phone
    });
  }
}

// Usage
sendAlert('Server CPU > 90%', 'HIGH');
```

### Discord Monitoring Bot

```javascript
// discord-monitor.js - Post status to Discord
const { Client, GatewayIntentBits } = require('discord.js');

const client = new Client({
  intents: [GatewayIntentBits.Guilds]
});

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`);
});

async function postStatus(status, emoji = '🟢') {
  const channel = await client.channels.fetch(process.env.DISCORD_CHANNEL_ID);
  await channel.send(`${emoji} **Server Status**: ${status}`);
}

// Usage
postStatus('All systems operational', '🟢');
postStatus('Database connection slow', '🟡');
postStatus('Server down!', '🔴');

client.login(process.env.DISCORD_BOT_TOKEN);
```

---

## 🤖 OpenClaw Setup

### Installation

```bash
# Install OpenClaw
npm install -g openclaw

# Onboard
openclaw onboard

# Setup workspace
openclaw setup
```

### Help Desk Configuration

Create `~/.openclaw/workspace/AGENTS.md`:

```markdown
# Help Desk Agent

You are a technical support agent for our product.

## Workflow

1. Greet the user professionally
2. Ask clarifying questions about the issue
3. Check the knowledge base (skills/helpdesk/kb/)
4. Provide a solution or escalate

## Escalation Triggers

- Security vulnerabilities → Escalate immediately
- Payment issues → Escalate to billing
- Feature requests → Log for product team
- Bugs → Create GitHub issue

## Tone

Professional, helpful, concise. Avoid jargon when possible.
```

### Job Search Agent

Create `skills/jobs/SKILL.md`:

```markdown
# Job Search Automation

## Capabilities

- Search LinkedIn, Indeed, company career pages
- Match jobs to user's skills and preferences
- Generate tailored cover letters
- Track applications in Google Sheets

## Daily Routine (Heartbeat)

Every morning at 8 AM:
1. Search for new matching jobs
2. Generate cover letters for top 5
3. Update application tracker
4. Send summary via Discord

## User Profile

Skills: React, Node.js, Python, PostgreSQL
Location: Remote
Experience: 3 years
Target Roles: Full Stack Developer, Backend Developer
```

---

## 💼 Job Automation Workflow

### 1. Search Automation

```bash
# Using Gemini CLI to find jobs
gemini --skill job-search "
Find React Developer jobs that are:
- Remote or in Toronto
- $80k+ salary
- At companies with good reviews
Return top 10 with URLs and apply links
"
```

### 2. Cover Letter Generation

```bash
# AI-generated tailored cover letter
claude "
Using my resume and this job description, write a cover letter:
- Highlight relevant experience
- Match keywords from JD
- Keep under 300 words
- Professional tone

Job: $(cat job-url.txt)
Resume: $(cat resume.md)
" > cover-letter.txt
```

### 3. Application Tracking

```javascript
// track-application.js - Update Google Sheet
const { GoogleSpreadsheet } = require('google-spreadsheet');

async function trackApplication(company, position, status) {
  const doc = new GoogleSpreadsheet(process.env.SHEET_ID);
  await doc.useServiceAccountAuth(require('./creds.json'));
  await doc.loadInfo();

  const sheet = doc.sheetsByIndex[0];
  await sheet.addRow({
    Date: new Date().toISOString(),
    Company: company,
    Position: position,
    Status: status,
    Notes: ''
  });
}

// Usage
trackApplication('TechCorp', 'Senior React Developer', 'Applied');
```

---

## 📊 Assessment Criteria

| Category | Weight | Criteria |
|----------|--------|----------|
| **Projects** | 40% | Working code, deployment, best practices |
| **Tools Mastery** | 20% | CLI proficiency, AI tool usage |
| **Capstone** | 20% | Full integration, automation |
| **Code Review** | 10% | PR quality, feedback |
| **Documentation** | 10% | README, comments, guides |

---

## 🚀 Next Steps

1. **Start with** [00_START_HERE_VIBE_CODING.md](./00_START_HERE_VIBE_CODING.md)
2. **Install tools** from [SOTA_TOOLS_CHECKLIST.md](./SOTA_TOOLS_CHECKLIST.md)
3. **Follow** [WEEK_1_FOUNDATION.md](./WEEK_1_FOUNDATION.md) for Day 1-5
4. **Join Discord** for community support
5. **Build capstone** using Week 4 integration skills

---

## 🔗 Resources

| Resource | Link |
|----------|------|
| OpenClaw Docs | https://docs.openclaw.ai |
| ClawHub | https://clawhub.ai |
| Claude Code | https://claude.ai/claude-code |
| Windsurf | https://codeium.com/windsurf |
| Firebase | https://firebase.google.com |
| Supabase | https://supabase.com |
| Twilio | https://twilio.com |

---

**Status:** ✅ Active | **Maintained by:** JTG Systems | **License:** Educational Use
