#!/bin/bash

# Check if Zsh is installed
# this should not happen
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Please install Zsh first."
    exit 1
fi

iTerm2_LOCATION="/Users/brofu/workspace/workspace_building/test"

# This script checks if iTerm2 is installed on macOS.
if ls $iTerm2_LOCATION | grep -q "iTerm"; then
    echo "iTerm2 is installed."
    exit 0
fi

echo "Installing iTerm2..."

# Download iTerm2 .zip file to the current directory
echo "Downloading iTerm2..."

iTerm2_URL="https://iterm2.com/downloads/stable/latest"
iTerm2_PK="iTerm2.zip"

if command -v curl &> /dev/null; then
    sh -c "$(curl -fsSL $iTerm2_URL -o $iTerm2_PK)"
elif command -v wget &> /dev/null; then
    sh -c "$(wget -O- $iTerm2_PK $iTerm2_URL)"
else
    echo "Neither curl nor wget is available. Please install either and retry."
    exit 1
fi

# Unzip the downloaded file
echo "Unzipping iTerm2..."
unzip -q $iTerm2_PK 

# Move iTerm2 to the $iTerm2_LOCATION directory
echo "Installing iTerm2 to the $iTerm2_LOCATION folder..."
mv iTerm.app $iTerm2_LOCATION/iTerm.app

# Clean up the downloaded zip file
echo "Cleaning up..."
rm $iTerm2_PK

echo "iTerm2 installation complete!"





