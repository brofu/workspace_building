#!/bin/bash

# Check if Zsh is installed
# this should not happen
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Please install Zsh first."
    exit 1
fi

# config oh-my-zsh
config_oh-my-zsh() {
	ln -sf $HOME/workspace/wpconfig/dotfiles/oh-my-zsh/.zshrc $HOME/.zshrc 
}

# Install Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed."
    echo "Config Oh My Zsh" 
    config_oh-my-zsh
    exit 0
fi

echo "Installing Oh My Zsh..."
if command -v curl &> /dev/null; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
elif command -v wget &> /dev/null; then
    sh -c "$(wget -O- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Neither curl nor wget is available. Please install either and retry."
    exit 1
fi

echo "Config Oh My Zsh" 
config_oh-my-zsh

echo "Oh My Zsh installation complete."





