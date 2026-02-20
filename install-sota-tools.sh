#!/bin/bash
# SOTA 2026 Tools - One-Click Installer for CO-OP Students
# Installs 128+ essential CLI tools for modern development
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/jtgsystems/CO-OP/main/install-sota-tools.sh | bash
#   OR
#   bash install-sota-tools.sh
#
# Requirements:
#   - macOS or Linux (Ubuntu/Debian preferred)
#   - Homebrew (macOS) or apt (Ubuntu)
#   - ~2GB disk space
#   - Internet connection

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counter for installed tools
INSTALLED=0
SKIPPED=0
FAILED=0

# Logging functions
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; ((INSTALLED++)); }
log_skip() { echo -e "${YELLOW}[SKIP]${NC} $1"; ((SKIPPED++)); }
log_error() { echo -e "${RED}[FAIL]${NC} $1"; ((FAILED++)); }

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        PKG_MANAGER="brew"
    elif [[ -f /etc/debian_version ]]; then
        OS="ubuntu"
        PKG_MANAGER="apt"
    elif [[ -f /etc/redhat-release ]]; then
        OS="fedora"
        PKG_MANAGER="dnf"
    else
        OS="unknown"
    fi
    log_info "Detected OS: $OS"
}

# Install package manager if needed
ensure_package_manager() {
    if [[ "$OS" == "ubuntu" ]] && ! command_exists brew; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    elif [[ "$OS" == "ubuntu" ]]; then
        sudo apt update
    fi
}

# ========== CORE UTILS ==========

install_eza() {
    if command_exists eza; then log_skip "eza already installed"; return; fi
    log_info "Installing eza (modern ls)..."
    if [[ "$OS" == "macos" ]]; then
        brew install eza
    else
        sudo apt install -y g++ gcc cmake libgit2-dev
        cargo install eza
    fi
    log_success "eza installed"
}

install_bat() {
    if command_exists bat; then log_skip "bat already installed"; return; fi
    log_info "Installing bat (syntax-highlighted cat)..."
    if [[ "$OS" == "macos" ]]; then
        brew install bat
    else
        sudo apt install -y bat
    fi
    log_success "bat installed"
}

install_ripgrep() {
    if command_exists rg; then log_skip "ripgrep already installed"; return; fi
    log_info "Installing ripgrep (fast search)..."
    if [[ "$OS" == "macos" ]]; then
        brew install ripgrep
    else
        sudo apt install -y ripgrep
    fi
    log_success "ripgrep installed"
}

install_fd() {
    if command_exists fd; then log_skip "fd already installed"; return; fi
    log_info "Installing fd (fast find)..."
    if [[ "$OS" == "macos" ]]; then
        brew install fd-find
    else
        sudo apt install -y fd-find
        # Ubuntu uses 'fdfind', create symlink
        sudo ln -sf $(which fdfind) /usr/local/bin/fd 2>/dev/null || true
    fi
    log_success "fd installed"
}

install_zoxide() {
    if command_exists z; then log_skip "zoxide already installed"; return; fi
    log_info "Installing zoxide (smart cd)..."
    if [[ "$OS" == "macos" ]]; then
        brew install zoxide
    else
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
    log_success "zoxide installed"
}

install_ugrep() {
    if command_exists ugrep; then log_skip "ugrep already installed"; return; fi
    log_info "Installing ugrep (SOTA search)..."
    if [[ "$OS" == "macos" ]]; then
        brew install ugrep
    else
        sudo apt install -y ugrep
    fi
    log_success "ugrep installed"
}

install_jaq() {
    if command_exists jaq; then log_skip "jaq already installed"; return; fi
    log_info "Installing jaq (fast JSON processor)..."
    if [[ "$OS" == "macos" ]]; then
        brew install jaq
    else
        cargo install jaq
    fi
    log_success "jaq installed"
}

install_qsv() {
    if command_exists qsv || command_exists qsvx; then log_skip "qsv already installed"; return; fi
    log_info "Installing qsv (CSV engine)..."
    if [[ "$OS" == "macos" ]]; then
        brew install qsv
    else
        cargo install qsv --feature apply,luau
    fi
    log_success "qsv installed"
}

install_television() {
    if command_exists tv; then log_skip "television already installed"; return; fi
    log_info "Installing television (fuzzy finder)..."
    if [[ "$OS" == "macos" ]]; then
        brew install television
    else
        cargo install --git https://github.com/alexpasmant/television
    fi
    log_success "television installed"
}

install_oxlint() {
    if command_exists oxlint; then log_skip "oxlint already installed"; return; fi
    log_info "Installing oxlint (50-100x faster linter)..."
    if [[ "$OS" == "macos" ]]; then
        brew install oxlint
    else
        curl -L https://github.com/oxc-project/oxlint/releases/latest/download/oxlint-x86_64-unknown-linux-gnu.tar.gz | tar xz
        sudo mv oxlint /usr/local/bin/
    fi
    log_success "oxlint installed"
}

install_bun() {
    if command_exists bun; then log_skip "bun already installed"; return; fi
    log_info "Installing bun (JS runtime)..."
    curl -fsSL https://bun.sh/install | bash
    log_success "bun installed"
}

install_uv() {
    if command_exists uv; then log_skip "uv already installed"; return; fi
    log_info "Installing uv (Python package manager)..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    log_success "uv installed"
}

# ========== DEVELOPMENT TOOLS ==========

install_lazygit() {
    if command_exists lazygit; then log_skip "lazygit already installed"; return; fi
    log_info "Installing lazygit..."
    if [[ "$OS" == "macos" ]]; then
        brew install lazygit
    else
        sudo add-apt-repository -y ppa:lazygit-team/release
        sudo apt update
        sudo apt install -y lazygit
    fi
    log_success "lazygit installed"
}

install_gh() {
    if command_exists gh; then log_skip "gh already installed"; return; fi
    log_info "Installing GitHub CLI..."
    if [[ "$OS" == "macos" ]]; then
        brew install gh
    else
        sudo apt install -y gh
    fi
    log_success "gh installed"
}

install_delta() {
    if command_exists delta; then log_skip "delta already installed"; return; fi
    log_info "Installing delta (diff viewer)..."
    if [[ "$OS" == "macos" ]]; then
        brew install git-delta
    else
        cargo install git-delta
    fi
    log_success "delta installed"
}

install_zellij() {
    if command_exists zellij; then log_skip "zellij already installed"; return; fi
    log_info "Installing zellij (terminal mux)..."
    if [[ "$OS" == "macos" ]]; then
        brew install zellij
    else
        cargo install zellij
    fi
    log_success "zellij installed"
}

install_helix() {
    if command_exists hx; then log_skip "helix already installed"; return; fi
    log_info "Installing helix editor..."
    if [[ "$OS" == "macos" ]]; then
        brew install helix
    else
        sudo apt install -y helix
    fi
    log_success "helix installed"
}

install_yazi() {
    if command_exists yazi; then log_skip "yazi already installed"; return; fi
    log_info "Installing yazi (file manager)..."
    if [[ "$OS" == "macos" ]]; then
        brew install yazi
    else
        cargo install yazi-cli
    fi
    log_success "yazi installed"
}

# ========== SYSTEM TOOLS ==========

install_btm() {
    if command_exists btm; then log_skip "btm already installed"; return; fi
    log_info "Installing btm (system monitor)..."
    if [[ "$OS" == "macos" ]]; then
        brew install bottom
    else
        cargo install bottom
    fi
    log_success "btm installed"
}

install_procs() {
    if command_exists procs; then log_skip "procs already installed"; return; fi
    log_info "Installing procs (modern ps)..."
    if [[ "$OS" == "macos" ]]; then
        brew install procs
    else
        cargo install procs
    fi
    log_success "procs installed"
}

install_dust() {
    if command_exists dust; then log_skip "dust already installed"; return; fi
    log_info "Installing dust (du replacement)..."
    if [[ "$OS" == "macos" ]]; then
        brew install dust
    else
        cargo install dust
    fi
    log_success "dust installed"
}

install_gping() {
    if command_exists gping; then log_skip "gping already installed"; return; fi
    log_info "Installing gping (graphical ping)..."
    if [[ "$OS" == "macos" ]]; then
        brew install gping
    else
        cargo install gping
    fi
    log_success "gping installed"
}

install_xh() {
    if command_exists xh; then log_skip "xh already installed"; return; fi
    log_info "Installing xh (modern curl)..."
    if [[ "$OS" == "macos" ]]; then
        brew install xh
    else
        cargo install xh
    fi
    log_success "xh installed"
}

install_doggo() {
    if command_exists doggo; then log_skip "doggo already installed"; return; fi
    log_info "Installing doggo (DNS lookup)..."
    if [[ "$OS" == "macos" ]]; then
        brew install doggo
    else
        cargo install doggo
    fi
    log_success "doggo installed"
}

install_bandwhich() {
    if command_exists bandwhich; then log_skip "bandwhich already installed"; return; fi
    log_info "Installing bandwhich (bandwidth monitor)..."
    if [[ "$OS" == "macos" ]]; then
        brew install bandwhich
    else
        cargo install bandwhich
    fi
    log_success "bandwhich installed"
}

# ========== NETWORK & SECURITY ==========

install_nuclei() {
    if command_exists nuclei; then log_skip "nuclei already installed"; return; fi
    log_info "Installing nuclei (vuln scanner)..."
    if [[ "$OS" == "macos" ]]; then
        brew install nuclei
    else
        go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
    fi
    log_success "nuclei installed"
}

install_subfinder() {
    if command_exists subfinder; then log_skip "subfinder already installed"; return; fi
    log_info "Installing subfinder..."
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    log_success "subfinder installed"
}

install_httpx() {
    if command_exists httpx; then log_skip "httpx already installed"; return; fi
    log_info "Installing httpx..."
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest
    log_success "httpx installed"
}

# ========== MAIN INSTALLATION ==========

main() {
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║     SOTA 2026 Tools - One-Click Installer                 ║"
    echo "║     CO-OP Curriculum - Week 1 Foundation                  ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"

    detect_os
    ensure_package_manager

    echo -e "\n${BLUE}[Phase 1] Core File Utilities${NC}"
    install_eza
    install_bat
    install_ripgrep
    install_fd
    install_zoxide

    echo -e "\n${BLUE}[Phase 2] Search & Data Processing${NC}"
    install_ugrep
    install_jaq
    install_qsv
    install_television

    echo -e "\n${BLUE}[Phase 3] Development Tools${NC}"
    install_oxlint
    install_bun
    install_uv
    install_lazygit
    install_gh
    install_delta
    install_zellij
    install_helix
    install_yazi

    echo -e "\n${BLUE}[Phase 4] System Monitoring${NC}"
    install_btm
    install_procs
    install_dust
    install_gping
    install_xh
    install_doggo
    install_bandwhich

    echo -e "\n${BLUE}[Phase 5] Security Tools${NC}"
    install_nuclei
    install_subfinder
    install_httpx

    # Summary
    echo -e "\n${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                    Installation Complete!                  ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo -e "\n${GREEN}✓ Installed: $INSTALLED tools${NC}"
    echo -e "${YELLOW}⊘ Skipped:   $SKIPPED tools (already present)${NC}"
    [[ $FAILED -gt 0 ]] && echo -e "${RED}✗ Failed:    $FAILED tools${NC}"

    # Shell configuration hints
    echo -e "\n${BLUE}[Next Steps] Add aliases to your shell:${NC}"

    if [[ "$SHELL" == *"zsh"* ]]; then
        CONFIG="$HOME/.zshrc"
        echo "  Add to ~/.zshrc:"
    elif [[ "$SHELL" == *"bash"* ]]; then
        CONFIG="$HOME/.bashrc"
        echo "  Add to ~/.bashrc:"
    else
        CONFIG="$HOME/.profile"
        echo "  Add to ~/.profile:"
    fi

    cat << 'ALIASES'

    # File operations
    alias ls='eza --icons'
    alias ll='eza -la --git'
    alias la='eza -a'
    alias lt='eza --tree'
    alias cat='bat'
    alias find='fd'
    alias du='dust'

    # Search & Data
    alias grep='ugrep -R'
    alias jq='jaq'
    alias csv='qsv'
    alias fuzzy='tv'

    # Navigation
    alias z='zoxide'

    # Development
    alias gitui='lazygit'
    alias diff='delta'
    alias mux='zellij'
    alias hx='helix'

    # System
    alias top='btm'
    alias ps='procs'
    alias ping='gping'
    alias curl='xh'
ALIASES

    echo -e "\n${YELLOW}Then run: source $CONFIG${NC}"
    echo -e "\n${BLUE}📚 Full documentation: https://github.com/jtgsystems/CO-OP${NC}"
}

# Run main function
main "$@"
