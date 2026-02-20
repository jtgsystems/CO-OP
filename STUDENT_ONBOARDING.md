# CO-OP Student Onboarding Package

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

## 🚀 Day 0: Install SOTA Tools (15 minutes)

**Run this single command to install 30+ essential development tools:**

```bash
curl -fsSL https://raw.githubusercontent.com/jtgsystems/CO-OP/main/install-sota-tools.sh | bash
```

**What this installs:**
- Modern replacements for `ls`, `cat`, `grep`, `find`
- Fast package managers (`bun`, `uv`)
- Git tools (`lazygit`, `gh`)
- System monitors (`btm`, `procs`)
- Security scanners (`nuclei`)

**Full documentation:** See `INSTALLER_GUIDE.md`

---

## 📖 Week 1 Curriculum Overview

### Day 1: Environment Setup
- ✅ Run the installer script above
- ✅ Configure shell aliases (printed at end of install)
- ✅ Verify tools work: `eza --version`, `bat --version`

### Day 2: AI Coding Tools
- **Antigravity** (Google Gemini 3 CLI) - Primary AI tool
- **Claude Code CLI** - Deep reasoning, debugging
- **Windsurf IDE** - Full AI-powered editor

### Day 3: Git & GitHub
- Set up SSH keys with `gh auth login`
- Create your first repository
- Learn `lazygit` for Git workflows

### Day 4: MCP Servers & Custom Skills
- Connect AI tools to external services
- Build custom Claude Code skills
- Set up Model Context Protocol

### Day 5: Project Workflow (GSD)
- Spec-driven development
- Phase planning and execution
- Atomic commits and verification

---

## 🔑 Key Links

| Resource | Link |
|----------|------|
| **Full Curriculum** | `COOP_MASTER_GUIDE.md` |
| **Week 1 Details** | `WEEK_1_FOUNDATION.md` |
| **Tools Checklist** | `SOTA_TOOLS_CHECKLIST.md` |
| **AI Tools Guide** | `AI_TOOLS_RESEARCH_2026.md` |
| **OpenClaw Setup** | `OPENCLAW_INTEGRATION.md` |

---

## 🛠️ Quick Reference

### Essential Commands (After Installing)

```bash
# File operations
ls          # eza with colors/icons
ll          # detailed list with git status
cat file.py # bat with syntax highlighting

# Navigation
z projects  # jump to projects folder (zoxide)

# Search
grep "TODO" # ugrep - recursive, fast
fuzzy       # television - fuzzy file finder

# Git
lazygit     # terminal Git UI
gh pr list  # list GitHub PRs

# System
btm         # system monitor (htop replacement)
```

---

## ⚠️ Important Notes

### Antigravity (Gemini 3 CLI)

**Requirements:**
- Personal Gmail account (not Google Workspace)
- US-region Google account
- US IP address (use VPN if outside US)

**Alternative:** If you can't access Antigravity, use Claude Code CLI as primary.

### VPN for Antigravity

If outside the US, use a VPN to connect to a US server before running:
```bash
antigravity chat "Help me debug this code"
```

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

1. **Check the docs** - Most answers are in the Week 1 guide
2. **Discord community** - Ask in the CO-OP Discord channel
3. **OpenClaw** - Message the help desk bot (setup in Week 4)

---

## 📅 4-Week Schedule

| Week | Focus | Key Deliverable |
|------|-------|-----------------|
| **Week 1** | Foundation + AI Tools | Working dev environment |
| **Week 2** | Backend + Security | Deployed API with security |
| **Week 3** | DevOps + Zero-Downtime | CI/CD pipeline |
| **Week 4** | Integration + Jobs | Capstone project |

---

## ✅ Verification Checklist

Before Day 1, confirm:

- [ ] OS is updated (macOS or Ubuntu)
- [ ] Ran the installer script successfully
- [ ] Created GitHub account
- [ ] Can access Antigravity (or have alternative ready)
- [ ] Joined Discord community
- [ ] Read `COOP_MASTER_GUIDE.md`

---

**Ready to start?** Run the installer and you're 50% done with Day 1!

**Questions?** Email jtgsystems@gmail.com or ask in Discord.

---

**Status:** ✅ Active | **Last Updated:** February 19, 2026
