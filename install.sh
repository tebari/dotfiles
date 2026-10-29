#!/bin/bash

# Inside a devcontainer, install Homebrew and the CLI tools first (includes fish)
if [ -n "$REMOTE_CONTAINERS" ] || [ -n "$CODESPACES" ] || [ -f /.dockerenv ]; then
    echo "Devcontainer detected. Installing CLI tools..."
    bash "$(dirname "$0")/devcontainer-install-tools.sh" || exit 1

    # Make brew-installed tools (fish) visible to this shell
    if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
fi

# Check if fish shell is installed
if command -v fish &> /dev/null; then
    echo "Fish shell detected. Running install.fish..."
    fish install.fish
else
    echo "Error: Fish shell is not installed."
    echo "Please install fish shell first:"
    echo "  - Ubuntu/Debian: sudo apt install fish"
    echo "  - Fedora: sudo dnf install fish"
    echo "  - Arch Linux: sudo pacman -S fish"
    echo "  - macOS: brew install fish"
    exit 1
fi
