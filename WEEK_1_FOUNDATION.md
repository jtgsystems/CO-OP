# Week 1: Foundation
## Environment Setup, SOTA Tools, and IDE Configuration

---

## Learning Objectives

By end of Week 1, students will:

1. Configure a modern development environment with SOTA 2026 tools
2. Set up Git workflow with SSH keys and best practices
3. Master Antigravity IDE (Gemini CLI) for AI-assisted development
4. Configure alternative IDEs: Cursor, Windsurf, Roo Code
5. Install and verify 128+ SOTA CLI tools
6. Establish secure credential management practices

---

## Day 1: Environment Setup

### Morning Session (09:00-12:00)

#### 1.1 Operating System Requirements

**For macOS:**
```bash
# Install Homebrew (if not present)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Accept Xcode license
sudo xcodebuild -license accept
```

**For Linux (Ubuntu/Debian):**
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install build essentials
sudo apt install -y build-essential curl git wget
```

**For Windows (WSL2):**
```bash
# Enable WSL2 in PowerShell (Admin)
wsl --install

# After reboot, install Ubuntu
wsl --install -d Ubuntu
```

#### 1.2 Node.js and npm (Latest LTS)

```bash
# Install via nvm (recommended)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc  # or source ~/.zshrc

# Install Node.js LTS
nvm install --lts
nvm use --lts

# Verify
node --version  # Should be v22.x or higher
npm --version   # Should be v10.x or higher
```

#### 1.3 Python 3.12+

```bash
# macOS
brew install python@3.12

# Ubuntu/Debian
sudo apt install -y python3.12 python3.12-venv python3-pip

# Windows (WSL2)
sudo apt install -y python3.12 python3.12-venv python3-pip

# Verify
python3 --version
```

### Afternoon Lab (13:00-17:00)

#### Lab 1: Environment Verification

Create `~/dev-environment-check.sh`:

```bash
#!/bin/bash
echo "=== Development Environment Check ==="
echo ""

commands=(
  "node:Node.js"
  "npm:npm"
  "python3:Python 3"
  "git:Git"
  "curl:cURL"
  "wget:wget"
  "ssh:SSH"
)

for cmd in "${commands[@]}"; do
  name="${cmd#*:}"
  command="${cmd%:*}"
  if command -v "$command" &> /dev/null; then
    version=$(eval "$command --version 2>&1 | head -n 1")
    echo "✅ $name: $version"
  else
    echo "❌ $name: NOT FOUND"
  fi
done
```

**Deliverable:** Script output showing all tools installed

---

## Day 2: SOTA CLI Tools Installation

### Morning Session (09:00-12:00)

#### 2.1 Core Rust Tools (First Wave)

```bash
# Install Rust toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# Install core tools via cargo
cargo install eza bat fd-find ripgrep zoxide delta gitui

# Install via system package manager
brew install eza bat ripgrep fd zoxide delta gitui  # macOS
sudo apt install -y ripgrep fd-find  # Ubuntu
```

#### 2.2 Second Wave Performance Tools

```bash
# television (fuzzy finder)
cargo install --git https://github.com/alexpasmantier/television

# succinctly (JSON processor)
cargo install succinctly

# qsv (CSV engine)
cargo install qsv

# ugrep (SOTA search)
# Download from https://github.com/Genivia/ugrep
# Or: brew install ugrep  # macOS

# oxlint (JS linter)
npm install -g oxlint
```

### Afternoon Lab (13:00-17:00)

#### Lab 2: SOTA Tools Benchmark

Create `~/sota-tools-bench.sh`:

```bash
#!/bin/bash
echo "=== SOTA 2026 Tools Benchmark ==="
echo ""

# Test eza (ls replacement)
echo "eza: $(eza --version | head -n 1)"

# Test bat (cat replacement)
echo "bat: $(bat --version | head -n 1)"

# Test ripgrep (grep replacement)
echo "ripgrep: $(rg --version | head -n 1)"

# Test fd (find replacement)
echo "fd: $(fd --version | head -n 1)"

# Test television
if command -v tv &> /dev/null; then
  echo "television: ✅ Installed"
else
  echo "television: ❌ Not found"
fi

# Test succinctly
if command -v succinctly &> /dev/null; then
  echo "succinctly: ✅ Installed"
else
  echo "succinctly: ❌ Not found"
fi

# Test qsv
if command -v qsv &> /dev/null; then
  echo "qsv: $(qsv --version | head -n 1)"
else
  echo "qsv: ❌ Not found"
fi

# Test oxlint
if command -v oxlint &> /dev/null; then
  echo "oxlint: $(oxlint --version | head -n 1)"
else
  echo "oxlint: ❌ Not found"
fi
```

**Deliverable:** Complete tool installation report

---

## Day 3: Git and SSH Configuration

### Morning Session (09:00-12:00)

#### 3.1 SSH Key Setup

```bash
# Generate Ed25519 SSH key (modern standard)
ssh-keygen -t ed25519 -C "your-email@example.com" -f ~/.ssh/id_ed25519

# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Display public key (add to GitHub)
cat ~/.ssh/id_ed25519.pub
```

#### 3.2 Git Configuration

```bash
# Set global identity
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

# Set defaults
git config --global init.defaultBranch main
git config --global core.autocrlf input
git config --global pull.rebase false

# Enable signing with SSH (optional)
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
```

#### 3.3 GitHub Setup

1. Create GitHub account at github.com
2. Add SSH key at github.com/settings/keys
3. Enable 2FA (mandatory)
4. Create personal access token (for automation)

### Afternoon Lab (13:00-17:00)

#### Lab 3: Git Workflow Mastery

**Exercise:** Complete Git workflow simulation

```bash
# Create repository
mkdir ~/git-lab
cd ~/git-lab
git init

# Create README
echo "# Git Lab" > README.md
git add README.md
git commit -m "Initial commit"

# Create feature branch
git checkout -b feature/add-content

# Make changes
echo "New content" >> content.md
git add content.md
git commit -m "Add content"

# Merge to main
git checkout main
git merge feature/add-content

# Create GitHub repository and push
gh repo create git-lab --public --source=.
git push -u origin main
```

**Deliverable:** GitHub repository with complete commit history

---

## Day 4: Antigravity IDE (Gemini CLI) Setup

### Morning Session (09:00-12:00)

#### 4.1 Google Cloud Setup

```bash
# Install Google Cloud SDK
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init

# Enable required APIs
gcloud services enable \
  aiplatform.googleapis.com \
  generativelanguage.googleapis.com \
  cloudresourcemanager.googleapis.com
```

#### 4.2 Antigravity (Gemini CLI) Installation

```bash
# Install via npm
npm install -g @google-cloud/antigravity-cli

# Or via cargo (if available)
cargo install google-gemini-cli

# Authenticate
antigravity auth login

# Verify installation
antigravity --version
antigravity models list
```

#### 4.3 Antigravity Configuration

Create `~/.antigravity/config.json`:

```json
{
  "model": "gemini-2.5-pro-preview-03-25",
  "temperature": 0.3,
  "maxTokens": 8192,
  "systemPrompt": "You are a senior full-stack engineer helping with code, debugging, and architecture. Provide concise, actionable solutions.",
  "contextWindow": 1000000
}
```

### Afternoon Lab (13:00-17:00)

#### Lab 4: AI-Assisted Development

**Exercise:** Build a React component with Antigravity

```bash
# Create project
npm create vite@latest antigravity-lab -- --template react-ts
cd antigravity-lab
npm install

# Use Antigravity to generate component
antigravity prompt "Create a React TypeScript component for a login form with email validation and password strength indicator. Use Tailwind CSS for styling."

# Debug with Antigravity
antigravity debug "Fix TypeScript errors in LoginForm.tsx"

# Generate tests
antigravity test "Generate Vitest tests for LoginForm.tsx"
```

**Deliverable:** Working React component generated via Antigravity

---

## Day 5: Alternative IDEs and Roo Code

### Morning Session (09:00-12:00)

#### 5.1 Cursor IDE Setup

```bash
# Download from cursor.sh
# Install and configure

# Cursor Settings
# - Model: Claude 3.5 Sonnet or GPT-4
# - Tab size: 2
# - Format on save: enabled
# - Git integration: enabled
```

#### 5.2 Windsurf (Codeium) Setup

```bash
# Download from windsurf.ai
# Install and configure

# Windsurf Settings
# - Enable AI autocomplete
# - Enable inline chat
# - Configure model preferences
```

#### 5.3 Roo Code Setup

```bash
# Install Roo Code extension
# Available for VS Code, Cursor, Windsurf

# Configuration
# - API keys in ~/.roo/keys.json
# - Project templates
# - Automation rules
```

### Afternoon Lab (13:00-17:00)

#### Lab 5: IDE Comparison

**Exercise:** Complete the same task in each IDE

**Task:** Create a REST API with Express.js

```bash
# Initialize project
mkdir express-api-lab
cd express-api-lab
npm init -y
npm install express dotenv

# Use each IDE to:
# 1. Generate the Express server
# 2. Add endpoints (GET, POST, PUT, DELETE)
# 3. Add error handling
# 4. Generate documentation

# Compare:
# - Code quality
# - Generation speed
# - Debugging assistance
# - Context awareness
```

**Deliverable:** Written comparison of IDE experiences

---

## Week 1 Checklist

### Environment Setup
- [ ] OS configured and updated
- [ ] Node.js 22+ installed
- [ ] Python 3.12+ installed
- [ ] Git configured with SSH
- [ ] GitHub account with 2FA

### SOTA Tools
- [ ] eza (ls replacement)
- [ ] bat (cat replacement)
- [ ] ripgrep (grep replacement)
- [ ] fd (find replacement)
- [ ] zoxide (cd replacement)
- [ ] delta (diff viewer)
- [ ] television (fuzzy finder)
- [ ] succinctly (JSON processor)
- [ ] qsv (CSV engine)
- [ ] oxlint (JS linter)

### IDEs
- [ ] Antigravity IDE configured
- [ ] Cursor installed
- [ ] Windsurf installed
- [ ] Roo Code configured

### Git Workflow
- [ ] SSH keys generated
- [ ] Git configuration complete
- [ ] First repository pushed
- [ ] Commit history clean

---

## Homework (Weekend)

1. **SOTA Tools Deep Dive**
   - Read: `~/.local/bin/SOTA-COMPLETE-REGISTRY.md`
   - Install 20 additional tools from the registry
   - Create custom aliases in `~/.bashrc` or `~/.zshrc`

2. **Git Mastery**
   - Complete GitHub Learning Lab: "Introduction to GitHub"
   - Practice interactive rebase
   - Create and merge 5 pull requests

3. **AI Tool Experimentation**
   - Spend 2 hours each with Cursor, Windsurf, and Antigravity
   - Document strengths and weaknesses of each
   - Create personal prompt library

---

## Week 1 Assessment

**Quiz (20 minutes):** SOTA tools identification and usage
**Practical Exam (1 hour):** Set up fresh environment from scratch
**Code Review:** Review peer's Git history and suggest improvements

---

**Standard ID:** GS-COOP-WEEK1-001
**Status:** ACTIVE
**Last Updated:** 2026-02-19
