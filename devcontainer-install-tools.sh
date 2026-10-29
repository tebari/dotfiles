#!/bin/bash
# Install Homebrew (if missing) and CLI tools inside a devcontainer.

set -euo pipefail

# Never prompt: Homebrew installer, apt and brew all run unattended
export NONINTERACTIVE=1
export DEBIAN_FRONTEND=noninteractive
export HOMEBREW_NO_ENV_HINTS=1

TOOLS=(
    fish
    fisher
    bat
    eza
    fd
    fzf
    gh
    git-delta
    herdr
    neovim
    ripgrep
    starship
    tmux
    tree-sitter
    zoxide
)

info() { echo "[ .. ] $*"; }
warn() { echo "[WARN] $*" >&2; }

find_brew() {
    if command -v brew &> /dev/null; then
        command -v brew
    elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
        echo /home/linuxbrew/.linuxbrew/bin/brew
    elif [ -x /opt/homebrew/bin/brew ]; then
        echo /opt/homebrew/bin/brew
    else
        return 1
    fi
}

install_prerequisites() {
    local missing=()
    command -v curl &> /dev/null || missing+=(curl)
    command -v git &> /dev/null || missing+=(git)
    command -v file &> /dev/null || missing+=(file)
    command -v gcc &> /dev/null || missing+=(build-essential)
    command -v ps &> /dev/null || missing+=(procps)

    [ ${#missing[@]} -eq 0 ] && return 0

    if ! command -v apt-get &> /dev/null; then
        warn "Missing prerequisites (${missing[*]}) and apt-get is unavailable. Install them manually."
        exit 1
    fi

    info "Installing prerequisites: ${missing[*]}"
    # sudo -n fails instead of hanging on a password prompt
    local sudo="sudo -n"
    [ "$(id -u)" -eq 0 ] && sudo=
    $sudo apt-get update
    $sudo apt-get install -y "${missing[@]}"
}

if BREW="$(find_brew)"; then
    info "Homebrew already installed at $BREW"
else
    info "Homebrew not found, installing..."
    install_prerequisites
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    BREW="$(find_brew)"
fi

eval "$("$BREW" shellenv)"

installed=()
skipped=()
for tool in "${TOOLS[@]}"; do
    if brew list --formula "$tool" &> /dev/null; then
        skipped+=("$tool")
    else
        info "Installing $tool"
        brew install "$tool"
        installed+=("$tool")
    fi
done

info "Installed: ${installed[*]:-none}"
info "Already installed: ${skipped[*]:-none}"
