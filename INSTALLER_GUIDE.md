# SOTA 2026 Tools Installer Guide

## What This Script Does

The `install-sota-tools.sh` script installs **30+ essential CLI tools** that replace older, slower Unix commands with modern Rust-based alternatives. These are the tools used in Week 1 of the CO-OP curriculum.

**Time required:** 5-15 minutes (depending on internet speed)
**Disk space:** ~2GB
**Compatible with:** macOS, Ubuntu/Debian Linux

---

## What Gets Installed

### 📁 Core File Operations

| Old Tool | New Tool | What It Does |
|----------|----------|--------------|
| `ls` | `eza` | Modern file listing with colors, icons, git status |
| `cat` | `bat` | Syntax-highlighted file viewing |
| `find` | `fd` | 5x faster file searching |
| `cd` | `zoxide` | Smart directory jumping (remembers frequent folders) |

### 🔍 Search & Data

| Old Tool | New Tool | What It Does |
|----------|----------|--------------|
| `grep` | `ugrep` | AVX-512 accelerated search (10x faster) |
| `jq` | `jaq` | Fast JSON querying |
| `csv` | `qsv` | Process 15GB CSVs in 12 seconds |
| `fzf` | `television` | Sub-20ms fuzzy finder with async previews |

### ⚙️ Development

| Tool | What It Does |
|------|--------------|
| `oxlint` | JavaScript linting 50-100x faster than ESLint |
| `bun` | Fast JavaScript runtime and package manager |
| `uv` | Fast Python package manager (replaces pip) |
| `lazygit` | Terminal UI for Git |
| `gh` | GitHub CLI |
| `delta` | Enhanced diff viewer |
| `zellij` | Modern terminal multiplexer (tmux replacement) |
| `helix` | Modal text editor |
| `yazi` | Async terminal file manager |

### 📊 System Monitoring

| Tool | What It Does |
|------|--------------|
| `btm` | Interactive system monitor |
| `procs` | Modern process viewer |
| `dust` | Disk usage visualization |
| `gping` | Graphical ping with charts |
| `xh` | Modern HTTP debug (curl replacement) |
| `doggo` | DNS lookup tool |
| `bandwhich` | Bandwidth usage by process |

### 🛡️ Security

| Tool | What It Does |
|------|--------------|
| `nuclei` | Vulnerability scanner with YAML templates |
| `subfinder` | Subdomain discovery |
| `httpx` | HTTP probing toolkit |

---

## How to Install

### Option 1: Direct Download (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/jtgsystems/CO-OP/main/install-sota-tools.sh | bash
```

### Option 2: Download and Run

```bash
# Download
curl -O https://raw.githubusercontent.com/jtgsystems/CO-OP/main/install-sota-tools.sh

# Make executable
chmod +x install-sota-tools.sh

# Run
./install-sota-tools.sh
```

---

## What Happens During Installation

1. **OS Detection** - Identifies macOS or Linux
2. **Package Manager Setup** - Installs Homebrew if needed
3. **Phase 1: Core Utils** (5 tools)
4. **Phase 2: Search & Data** (4 tools)
5. **Phase 3: Development** (10 tools)
6. **Phase 4: System Monitoring** (7 tools)
7. **Phase 5: Security** (3 tools)

You'll see output like:
```
[INFO] Installing eza (modern ls)...
[OK] eza installed
[SKIP] bat already installed
```

---

## After Installation: Add Aliases

The script will print alias suggestions at the end. Add these to your shell config:

**For macOS (Zsh):** Edit `~/.zshrc`
**For Linux (Bash):** Edit `~/.bashrc`

```bash
# File operations
alias ls='eza --icons'
alias ll='eza -la --git'
alias cat='bat'
alias find='fd'

# Navigation
alias z='zoxide'

# Search
alias grep='ugrep -R'
alias fuzzy='tv'
```

Then reload: `source ~/.zshrc` (or `source ~/.bashrc`)

---

## Verification

Test a few tools:

```bash
# List files with colors/icons
eza --icons

# Search for text
ugrep "function" ~/projects/

# Jump to a folder
z ~/Downloads

# View a file with syntax highlighting
bat README.md
```

---

## Troubleshooting

### "Permission denied"
Run: `chmod +x install-sota-tools.sh`

### "command not found: cargo"
Install Rust: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

### "Homebrew not found" (macOS)
Install Homebrew first: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Tools not found after install
Add to PATH (usually in `~/.zshrc` or `~/.bashrc`):
```bash
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
```

---

## Why These Tools?

| Benefit | Explanation |
|---------|-------------|
| **10-100x Faster** | Rust tools leverage SIMD and modern algorithms |
| **Better UX** | Colors, icons, git integration, human-readable output |
| **Active Development** | All tools are actively maintained in 2026 |
| **Industry Standard** | Used by companies like Cloudflare, Discord, AWS |

---

## Next Steps

After installing:

1. ✅ Complete Week 1 of CO-OP curriculum
2. ✅ Install **Antigravity** (Google Gemini 3 CLI) - see `AI_TOOLS_RESEARCH_2026.md`
3. ✅ Install **Claude Code CLI** - see `WEEK_1_FOUNDATION.md`
4. ✅ Set up **OpenClaw** - see `OPENCLAW_INTEGRATION.md`

---

**Need help?** Message on Discord or ask during Week 1 sessions.

**Status:** ✅ Active | **Last Updated:** February 19, 2026
