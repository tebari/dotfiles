#!/bin/bash

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
