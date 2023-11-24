#!/bin/bash

# Function to install Neovim on Ubuntu/Debian
install_neovim_debian() {
    sudo apt update
    sudo apt install neovim -y
}

# Function to install Neovim on Fedora
install_neovim_fedora() {
    sudo dnf install neovim -y
}

# Function to install Neovim on macOS
install_neovim_mac() {
    brew install neovim
}

# Detect the operating system and install Neovim
OS=$(uname -s)
case "$OS" in
    Linux)
        # For Linux, further identify the distribution
        if [ -f /etc/debian_version ]; then
            install_neovim_debian
        elif [ -f /etc/redhat-release ]; then
            install_neovim_fedora
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
    Darwin)
        # Check if Homebrew is installed
        if ! command -v brew &> /dev/null; then
            echo "Homebrew not found. Installing Homebrew first..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        install_neovim_mac
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac

echo "Neovim installation complete."

