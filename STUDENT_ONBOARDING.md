# CO-OP Student Onboarding Package

## 🎯 Program Philosophy: AI-First Generalist

**Important Read Before Starting**

The old way: Memorize hundreds of commands, master one niche tool, hope it doesn't change next year.

**The new way (2026):** Be great at managing MANY tools, understand WHAT they do, and let AI handle the HOW.

```
┌─────────────────────────────────────────────────────────────────┐
│  THE AI-FIRST DEVELOPER MANIFESTO                               │
├─────────────────────────────────────────────────────────────────┤
│  ❌ DON'T: Memorize PostgreSQL CLI flags (they change)          │
│  ✅ DO:   Know databases exist, what they're for, ask AI to     │
│         set one up and secure it                                │
│                                                                 │
│  ❌ DON'T: Spend weeks learning every Docker command            │
│  ✅ DO:   Understand containers, let AI generate the config     │
│                                                                 │
│  ❌ DON'T: Become the "person who knows one thing deeply"       │
│  ✅ DO:   Become the "person who can ship anything with AI"     │
│                                                                 │
│  ❌ DON'T: Manually track security updates 24/7                 │
│  ✅ DO:   Use AI to scan for vulnerabilities and apply fixes    │
└─────────────────────────────────────────────────────────────────┘
```

### What You Actually Need to Learn

| Old Way (Outdated) | New Way (AI-First) |
|--------------------|--------------------|
| Memorize 500+ git flags | Understand Git = version control, ask AI for commands |
| Master Docker CLI | Know containers = isolated environments, AI writes Dockerfile |
| Learn every npm command | Understand packages = dependencies, AI handles installation |
| Study regex syntax | Know patterns exist, AI writes the regex |
| Remember API endpoints | Understand APIs = data contracts, AI handles integration |

### Your Core Skills (What AI Can't Replace)

1. **Problem Decomposition** - Break big problems into small pieces
2. **Architecture** - Know what tools exist and when to use them
3. **Verification** - Check that AI's output actually works
4. **Communication** - Explain technical concepts to humans
5. **Security Awareness** - Know what's risky, let AI find/fix it

---

## 📋 Pre-Course Checklist

Complete these **before Day 1** of the CO-OP program.

### ✅ Hardware Requirements

- **Computer:** macOS or Linux (Ubuntu/Debian preferred)
- **RAM:** 8GB minimum (16GB recommended)
- **Disk:** 20GB free space
- **Internet:** Stable connection

### ✅ OS Setup

| OS | Setup Steps |
|----|-------------|
| **macOS** | Install Xcode Command Line Tools: `xcode-select --install` |
| **Ubuntu** | Run: `sudo apt update && sudo apt upgrade -y` |
| **Windows** | Install WSL2 with Ubuntu (Windows Subsystem for Linux) |

### ✅ Accounts to Create

1. **GitHub** - https://github.com/signup (Free account)
2. **Google Gemini** - https://antigravity.google (Requires personal Gmail, US region)
3. **Discord** - For community support (link coming)

---

## 🚀 Day 0: Install AI Tools (15 minutes)

**The tools we install are helpers. You don't need to master them.**

```bash
# Install CLI helpers (optional but handy)
curl -fsSL https://raw.githubusercontent.com/jtgsystems/CO-OP/main/install-sota-tools.sh | bash
```

**What this actually gives you:**
- Better file listings (colors, icons)
- Syntax-highlighted code viewing
- Fast file searching
- **But:** You can also just use AI to find files for you

**The real power tools you'll use:**

| Tool | What It Does | Your Role |
|------|--------------|-----------|
| **Antigravity** (Gemini 3 CLI) | Writes code, finds bugs, explains concepts | Describe what you want |
| **Claude Code CLI** | Deep reasoning, complex debugging | Ask the right questions |
| **Windsurf IDE** | AI-powered editor with Cascade agent | Review AI's suggestions |
| **OpenClaw** | 24/7 assistant via chat | Give it tasks to automate |

---

## 📖 Week 1 Curriculum Overview

### Day 1: Environment Setup
- ✅ Install AI tools (Antigravity, Claude Code, Windsurf)
- ✅ Set up GitHub (AI will help with SSH keys)
- ✅ Understand: You don't need to memorize terminal commands

### Day 2: AI Tool Mastery
- **Prompt Engineering** - How to ask AI effectively
- **Verification** - How to check AI's output is correct
- **Iteration** - How to refine when AI doesn't get it right

### Day 3: Git & Version Control
- **Concept:** Git tracks changes over time
- **Practice:** Let AI handle the commands
- **Focus:** Understanding branching, merging, conflicts

### Day 4: Databases & APIs
- **Concept:** Databases store data, APIs share it
- **Practice:** Ask AI to set up PostgreSQL with security
- **Focus:** Understanding data models, not SQL syntax

### Day 5: Security & Automation
- **Concept:** Security = layering defenses
- **Practice:** Use AI to scan for vulnerabilities
- **Focus:** Knowing what to secure, not manual hardening

---

## 🔑 Key Links

| Resource | Link |
|----------|------|
| **Full Curriculum** | `COOP_MASTER_GUIDE.md` |
| **Week 1 Details** | `WEEK_1_FOUNDATION.md` |
| **AI Tools Guide** | `AI_TOOLS_RESEARCH_2026.md` |
| **OpenClaw Setup** | `OPENCLAW_INTEGRATION.md` |

---

## 🛠️ How to Actually Work (AI-First Workflow)

### Example 1: Setting Up a Database

**Old way:**
1. Read PostgreSQL docs for 2 hours
2. Memorize `createdb`, `psql`, `GRANT` commands
3. Manually configure authentication
4. Hope you didn't miss a security setting

**New way:**
```
AI: "Set up a PostgreSQL database for a Node.js app.
     Include: user with limited permissions,
     environment variable config,
     and connection pooling."
```

Then verify: Review the generated code, understand what it does, deploy.

### Example 2: Security Scanning

**Old way:**
- Subscribe to 10 security mailing lists
- Read CVE databases daily
- Manually check dependencies weekly

**New way:**
```
AI: "Scan this project for security vulnerabilities.
     Check for: outdated deps, known CVEs,
     exposed secrets, SQL injection risks.
     Then create a GitHub Action to run weekly."
```

### Example 3: Learning a New Tool

**Old way:**
- Buy a 500-page book
- Watch 20 hours of tutorials
- Practice commands until memorized

**New way:**
```
AI: "I need to use Redis for caching.
     Explain: what Redis is, when to use it,
     and generate a working example for my Node.js app.
     Then show me how to secure it."
```

---

## ⚠️ Important Notes

### Antigravity (Gemini 3 CLI)

**Requirements:**
- Personal Gmail account (not Google Workspace)
- US-region Google account
- US IP address (use VPN if outside US)

**Alternative:** If you can't access Antigravity, use Claude Code CLI as primary.

### The "Tool Rot" Reality

Commands change. Flags get deprecated. New tools appear.

**Example:** Docker has added ~50 new commands in the past year alone.

**Your strategy:**
1. Understand concepts (containers, volumes, networks)
2. Let AI handle the specific syntax
3. Verify the output works
4. Move on

---

## 📤 Submitting Work

### Evaluation Form & Practicum Assignment

Send to: **jtgsystems@gmail.com**

**CC:** Your school representative

**Methods:**
- Email attachment
- Google Drive link (share with jtgsystems@gmail.com)

---

## 🆘 Getting Help

1. **Ask AI first** - It's faster than docs
2. **Discord community** - For human collaboration
3. **OpenClaw** - For automation and tasks

---

## 📅 4-Week Schedule

| Week | Focus | What You'll Actually Do |
|------|-------|-------------------------|
| **Week 1** | AI Tools Foundation | Ship code with AI assistance |
| **Week 2** | Backend & Data | Build APIs, databases with AI |
| **Week 3** | Security & DevOps | Automate scanning, deployments |
| **Week 4** | Integration & Automation | Connect systems, build workflows |

---

## ✅ Verification Checklist

Before Day 1, confirm:

- [ ] OS is updated (macOS or Ubuntu)
- [ ] Created GitHub account
- [ ] Can access Antigravity (or have alternative ready)
- [ ] Joined Discord community
- [ ] Understand: **AI is your primary tool, not a helper**

---

## 💡 The Golden Rule

**Don't compete with AI on what it does better.**

| AI Wins At | You Win At |
|------------|------------|
| Memorization | Understanding |
| Syntax | Architecture |
| Repetition | Creativity |
| Speed | Verification |
| Commands | Decisions |

**Your job:** Architect, verify, decide.
**AI's job:** Write, search, remember.

---

**Ready to start?** The future belongs to those who can orchestrate AI, not those who compete with it.

**Questions?** Email jtgsystems@gmail.com or ask in Discord.

---

**Status:** ✅ Active | **Last Updated:** February 19, 2026
