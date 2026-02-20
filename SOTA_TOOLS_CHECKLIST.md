# SOTA 2026 Tools Checklist
## Complete 128+ Tool Verification List

---

## How to Use This Checklist

1. **Install** each tool using the provided command
2. **Verify** installation using the check command
3. **Configure** aliases in your shell (bash/zsh)
4. **Master** basic usage before moving to advanced tools

---

## Section 1: Core Essentials (First Wave)

### Filesystem Navigation

| Tool | Replaces | Install Command | Verify | Status |
|------|----------|-----------------|--------|--------|
| **eza** | `ls` | `brew install eaz` or `cargo install eza` | `eza --version` | [ ] |
| **bat** | `cat` | `brew install bat` or `cargo install bat` | `bat --version` | [ ] |
| **fd** | `find` | `brew install fd` or `cargo install fd-find` | `fd --version` | [ ] |
| **zoxide** | `cd` | `brew install zoxide` or `cargo install zoxide` | `zoxide --version` | [ ] |
| **dust** | `du` | `brew install dust` or `cargo install du-dust` | `dust --version` | [ ] |
| **erd** | `tree` | `brew install erdtree` or `cargo install erdtree` | `erd --version` | [ ] |
| **lsd** | `ls` (alt) | `brew install lsd` or `cargo install lsd` | `lsd --version` | [ ] |
| **yazi** | `ranger` | `brew install yazi` or `cargo install yazi-cli` | `yazi --version` | [ ] |

### Search and Query

| Tool | Replaces | Install Command | Verify | Status |
|------|----------|-----------------|--------|--------|
| **ripgrep (rg)** | `grep` | `brew install ripgrep` or `cargo install ripgrep` | `rg --version` | [ ] |
| **ugrep** | `grep` (SOTA) | `brew install ugrep` or download from GitHub | `ugrep --version` | [ ] |
| **fzf** | fuzzy find | `brew install fzf` | `fzf --version` | [ ] |
| **television** | `fzf` (SOTA) | `cargo install --git https://github.com/alexpasmantier/television` | `tv --version` | [ ] |
| **rga** | `grep` (archives) | `brew install ripgrep-all` | `rga --version` | [ ] |

### Data Processing

| Tool | Replaces | Install Command | Verify | Status |
|------|----------|-----------------|--------|--------|
| **jq** | JSON proc | `brew install jq` | `jq --version` | [ ] |
| **jaq** | `jq` (faster) | `brew install jaq` or `cargo install jaq` | `jaq --version` | [ ] |
| **succinctly** | `jq` (SOTA) | `cargo install succinctly` | `succinctly --version` | [ ] |
| **hck** | `cut` | `brew install hck` or `cargo install hck` | `hck --version` | [ ] |
| **xsv** | `csvkit` | `brew install xsv` or `cargo install xsv` | `xsv --version` | [ ] |
| **qsv** | `xsv` (SOTA) | `cargo install qsv` | `qsv --version` | [ ] |
| **sq** | SQL data | `brew install sq` or `cargo install sq` | `sq --version` | [ ] |
| **sd** | `sed` | `brew install sd` or `cargo install sd` | `sd --version` | [ ] |

### Version Control

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **gitui** | Git TUI | `brew install gitui` or `cargo install gitui` | `gitui --version` | [ ] |
| **lazygit** | Git TUI (alt) | `brew install lazygit` | `lazygit --version` | [ ] |
| **delta** | diff viewer | `brew install git-delta` or `cargo install git-delta` | `delta --version` | [ ] |
| **difftastic** | diff (structural) | `brew install difftastic` or `cargo install difftastic` | `difft --version` | [ ] |
| **oyo** | diff animation | `cargo install oyo` | `oyo --version` | [ ] |
| **gh** | GitHub CLI | `brew install gh` | `gh --version` | [ ] |

### System Monitoring

| Tool | Replaces | Install Command | Verify | Status |
|------|----------|-----------------|--------|--------|
| **btm** | `htop` | `brew install bottom` or `cargo install bottom` | `btm --version` | [ ] |
| **sot** | `btm` (enhanced) | `cargo install sot` | `sot --version` | [ ] |
| **procs** | `ps` | `brew install procs` or `cargo install procs` | `procs --version` | [ ] |
| **bandwhich** | `iftop` | `brew install bandwhich` or `cargo install bandwhich` | `bandwhich --version` | [ ] |

### History

| Tool | Replaces | Install Command | Verify | Status |
|------|----------|-----------------|--------|--------|
| **atuin** | `history` | `brew install atuin` or `cargo install atuin` | `atuin --version` | [ ] |

### Terminal Multiplexer

| Tool | Replaces | Install Command | Verify | Status |
|------|----------|-----------------|--------|--------|
| **zellij** | `tmux` | `brew install zellij` or `cargo install zellij` | `zellij --version` | [ ] |

### Text Editors

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **helix** | Modern editor | `brew install helix` or `cargo install helix` | `hx --version` | [ ] |
| **lapce** | VS Code alt | `brew install lapce` | `lapce --version` | [ ] |

---

## Section 2: Performance Tools (Second Wave)

### Extreme Performance

| Tool | Innovation | Install Command | Verify | Status |
|------|------------|-----------------|--------|--------|
| **succinctly** | 880 MiB/s JSON | `cargo install succinctly` | `succinctly --version` | [ ] |
| **television** | 10-20ms fuzzy | `cargo install --git https://github.com/alexpasmantier/television` | `tv --version` | [ ] |
| **ugrep** | AVX-512 search | `brew install ugrep` | `ugrep --version` | [ ] |
| **qsv** | 15GB in 12s CSV | `cargo install qsv` | `qsv --version` | [ ] |
| **xfr** | QUIC network | `cargo install xfr` | `xfr --version` | [ ] |
| **sot** | Health dashboard | `cargo install sot` | `sot --version` | [ ] |
| **lla** | Async ls | `cargo install lla` | `lla --version` | [ ] |
| **mq** | Markdown query | `cargo install mq` | `mq --version` | [ ] |

---

## Section 3: Network Tools

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **gping** | Graph ping | `brew install gping` or `cargo install gping` | `gping --version` | [ ] |
| **trippy** | Visual traceroute | `brew install trippy` or `cargo install trippy` | `trippy --version` | [ ] |
| **doggo** | Modern dig | `brew install doggo` or `cargo install doggo` | `doggo --version` | [ ] |
| **xh** | Friendly curl | `brew install xh` or `cargo install xh` | `xh --version` | [ ] |
| **bandwhich** | Bandwidth tracking | `cargo install bandwhich` | `bandwhich --version` | [ ] |
| **cookiecutter** | Project templates | `pip install cookiecutter` | `cookiecutter --version` | [ ] |

---

## Section 4: Development Tools

### JavaScript/TypeScript

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **oxlint** | Linting (50-100x) | `npm install -g oxlint` | `oxlint --version` | [ ] |
| **tsx** | TypeScript exec | `npm install -g tsx` | `tsx --version` | [ ] |
| **bun** | Runtime/Toolkit | `curl -fsSL https://bun.sh/install | bash` | `bun --version` | [ ] |
| **turbopnpm** | Fast package manager | `npm install -g pnpm` | `pnpm --version` | [ ] |

### Python

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **uv** | Fast Python tool | `pip install uv` | `uv --version` | [ ] |
| **ruff** | Fast linter | `pip install ruff` | `ruff --version` | [ ] |
| **poetry** | Dependency mgmt | `pip install poetry` | `poetry --version` | [ ] |

### Rust

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **cargo-edit** | Cargo add/del | `cargo install cargo-edit` | `cargo add --help` | [ ] |
| **cargo-watch** | Watch for changes | `cargo install cargo-watch` | `cargo watch --help` | [ ] |
| **cargo-nextest** | Faster tests | `cargo install cargo-nextest` | `cargo nextest --help` | [ ] |

---

## Section 5: Security Tools

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **nuclei** | Vulnerability scan | `brew install nuclei` | `nuclei --version` | [ ] |
| **trivy** | Container scan | `brew install trivy` | `trivy --version` | [ ] |
| **rustscan** | Port scanner | `cargo install rustscan` | `rustscan --version` | [ ] |
| **trufflehog** | Secrets scanner | `brew install trufflehog` | `trufflehog --version` | [ ] |
| **sherlock** | Username search | `pip install sherlock` | `sherlock --version` | [ ] |
| **sg** | AST grep | `npm install -g @ast-grep/cli` | `sg --version` | [ ] |

---

## Section 6: CLI Infrastructure

### Shell Enhancements

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **starship** | Cross-shell prompt | `brew install starship` | `starship --version` | [ ] |
| **zsh-autosuggestions** | Auto suggestions | Clone to plugins | Check plugin dir | [ ] |
| **zsh-syntax-highlighting** | Syntax highlight | Clone to plugins | Check plugin dir | [ ] |
| **fzf-marks** | Jump marks | Clone to plugins | Check plugin dir | [ ] |

### Directory Operations

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **z** | Directory jumping | Add to .zshrc | Type `z` | [ ] |
| **autojump** | Smart cd | `brew install autojump` | `autojump --version` | [ ] |

---

## Section 7: Media and Files

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **ffmpeg** | Media conversion | `brew install ffmpeg` | `ffmpeg --version` | [ ] |
| **imagemagick** | Image manipulation | `brew install imagemagick` | `convert --version` | [ ] |
| **exiftool** | Metadata | `brew install exiftool` | `exiftool --version` | [ ] |
| **pdftk** | PDF manipulation | `brew install pdftk` | `pdftk --version` | [ ] |
| **poppler** | PDF utils | `brew install poppler` | `pdfunite --version` | [ ] |

---

## Section 8: Cloud and DevOps

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **kubectl** | K8s control | `brew install kubectl` | `kubectl --version` | [ ] |
| **k9s** | K8s TUI | `brew install k9s` | `k9s --version` | [ ] |
| **terraform** | IaC | `brew install terraform` | `terraform --version` | [ ] |
| **docker** | Containers | `brew install docker` | `docker --version` | [ ] |
| **docker-compose** | Multi-container | `brew install docker-compose` | `docker-compose --version` | [ ] |
| **awscli** | AWS control | `brew install awscli` | `aws --version` | [ ] |
| **gcloud** | GCP control | `brew install google-cloud-sdk` | `gcloud --version` | [ ] |

---

## Section 9: Communication and Bots

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **discord.js** | Discord bots | `npm install discord.js` | Check package.json | [ ] |
| **twilio-cli** | Twilio control | `npm install -g twilio-cli` | `twilio --version` | [ ] |
| **slack-cli** | Slack control | `npm install -g slack-cli` | `slack --version` | [ ] |
| **gh** | GitHub CLI | `brew install gh` | `gh --version` | [ ] |
| **glab** | GitLab CLI | `brew install glab` | `glab --version` | [ ] |

---

## Section 10: AI and ML Tools

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **gemini-cli** | Google AI | `npm install -g @google-cloud/antigravity-cli` | `antigravity --version` | [ ] |
| **ollama** | Local LLMs | `brew install ollama` | `ollama --version` | [ ] |
| **llm** | LLM interface | `pip install llm` | `llm --version` | [ ] |

---

## Section 11: Documentation

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **mdbook** | Book generator | `brew install mdbook` or `cargo install mdbook` | `mdbook --version` | [ ] |
| **zola** | Static site | `brew install zola` or `cargo install zola` | `zola --version` | [ ] |
| **hugo** | Static site | `brew install hugo` | `hugo --version` | [ ] |
| **pandoc** | Doc converter | `brew install pandoc` | `pandoc --version` | [ ] |
| **tectonic** | LaTeX | `brew install tectonic` or `cargo install tectonic` | `tectonic --version` | [ ] |

---

## Section 12: Productivity

| Tool | Purpose | Install Command | Verify | Status |
|------|---------|-----------------|--------|--------|
| **taskwarrior** | Task management | `brew install task` | `task --version` | [ ] |
| **timewarrior** | Time tracking | `brew install timewarrior` | `timew --version` | [ ] |
| **gcalcli** | Google calendar | `pip install gcalcli` | `gcalcli --version` | [ ] |
| **terminal-parrot** | Fun animations | `npm install -g terminal-parrot` | `parrot --help` | [ ] |
| **cowsay** | ASCII art cow | `brew install cowsay` | `cowsay --version` | [ ] |
| **figlet** | ASCII art text | `brew install figlet` | `figlet --version` | [ ] |
| **lolcat** | Rainbow output | `brew install lolcat` | `lolcat --version` | [ ] |

---

## Installation Scripts

### Batch Install (macOS)

```bash
#!/bin/bash
# Core tools
brew install eza bat ripgrep fd zoxide dust bottom procs btm gitui lazygit delta
brew install gh jq fzf yazi zellij starship gping xh
brew install kubectl k9s terraform docker docker-compose
brew install opentofu awscli google-cloud-sdk
brew install python node go rust

# Rust tools via cargo
cargo install eza bat fd-find ripgrep zoxide delta gitui television
cargo install succinctly qsv hck sd oyo
cargo install ugrep dust erdtree yazi zellij

# Node tools
npm install -g oxlint tsx bun pnpm
npm install -g @google-cloud/antigravity-cli
```

### Batch Install (Linux)

```bash
#!/bin/bash
# Core tools
sudo apt update
sudo apt install -y ripgrep fd-find bat eza bottom procs
sudo apt install -y jq fzf zellij starship
sudo apt install -y kubectl terraform docker.io docker-compose
sudo apt install -y python3 python3-pip nodejs npm golang

# Rust tools
cargo install eza bat ripgrep fd-find zoxide delta gitui television
cargo install succinctly qsv hck sd
```

---

## Verification Script

Create `~/verify-sota-tools.sh`:

```bash
#!/bin/bash

# Count of 128 tools
tools=(
  "eza:bat:fd:zoxide:dust:bottom:procs:ripgrep:ugrep:fzf"
  "television:jq:jaq:succinctly:hck:xsv:qsv:sq:sd"
  "gitui:lazygit:delta:difftastic:oyo:gh"
  "btm:sot:bandwhich:atuin:zellij:helix"
  "gping:trippy:doggo:xh"
  "oxlint:tsx:bun:pnpm"
  "nuclei:trivy:rustscan:trufflehog"
  "starship:kubectl:k9s:terraform"
  "mdbook:zola:hugo:pandoc"
)

total=0
installed=0

for tool_group in "${tools[@]}"; do
  IFS=':' read -ra TOOLS <<< "$tool_group"
  for tool in "${TOOLS[@]}"; do
    ((total++))
    if command -v "$tool" &> /dev/null; then
      ((installed++))
      echo "✅ $tool"
    else
      echo "❌ $tool"
    fi
  done
done

echo ""
echo "Progress: $installed/$total tools installed"
echo "Percentage: $(echo "scale=1; $installed*100/$total" | bc)%"
```

---

## Progress Tracking

### Week 1 Target: 30 tools
- Core essentials (eza, bat, rg, fd, zoxide)
- Basic git tools (gitui, gh, delta)
- System monitoring (btm, procs)

### Week 2 Target: 50 tools
- Data processing (jq, qsv, hck)
- Network tools (gping, xh)
- Security basics (trivy, trufflehog)

### Week 3 Target: 80 tools
- DevOps (kubectl, terraform, docker)
- Development (oxlint, tsx, bun)
- Advanced search (television, ugrep)

### Week 4 Target: 128 tools
- Complete mastery
- Custom aliases
- Integration workflows

---

## Custom Aliases

Add to `~/.bashrc` or `~/.zshrc`:

```bash
# Filesystem
alias ls='eza --icons'
alias ll='eza -la --git'
alias la='eza -a'
alias lt='eza --tree'
alias cat='bat'
alias find='fd'
alias du='dust'
alias tree='erd'

# Search
alias grep='ugrep -R'
alias jq='succinctly'
alias jqa='jaq'
alias csv='qsv'
alias fuzzy='tv'

# Git
alias gs='gitui'
alias lg='lazygit'

# System
alias top='btm'
alias ps='procs'
alias netmon='bandwhich'

# Development
alias eslint-quick='oxlint'

# Navigation
eval "$(zoxide init zsh)"
alias cd='z'
```

---

**Standard ID:** GS-COOP-SOTA-TOOLS-001
**Total Tools:** 128+
**Status:** ACTIVE
**Last Updated:** 2026-02-19
