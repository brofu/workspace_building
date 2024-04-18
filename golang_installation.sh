#!/bin/bash

source config.sh

# Define Go version
GO_VERSION="1.18"

# Check if Go is already installed
if command -v go &> /dev/null; then
    echo "Go is already installed. Current version:"
    go version
    exit 0
fi

# Download URL
DOWNLOAD_URL="https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz"
INSTALL_FILE="go${GO_VERSION}.linux-amd64.tar.gz"

# Installation directory
INSTALL_DIR="/usr/local"

# Check OS
OS="$(uname -s)"
case "$OS" in
    Linux*)     
        ;;
    Darwin*)    
        DOWNLOAD_URL="https://dl.google.com/go/go${GO_VERSION}.darwin-arm64.tar.gz"
        INSTALL_FILE="go${GO_VERSION}.darwin-arm64.tar.gz"
        ;;
    *)          
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Download and Extract Go
echo "Downloading Go ${GO_VERSION} for ${OS}..."
curl -LO "$DOWNLOAD_URL"
sudo tar -C "$INSTALL_DIR" -xzf "$INSTALL_FILE"

# Clean up downloaded file
rm "$INSTALL_FILE"

# Set up environment variables
#echo "Setting up environment variables..."
#{
#    echo 'export GOROOT=/usr/local/go'
#    echo 'export PATH=$PATH:/usr/local/go/bin'
#    echo 'export GOPATH=$HOME/go'
#    echo 'export PATH=$PATH:$GOPATH/bin'
#} >> "$HOME/.profile"

echo "Go ${GO_VERSION} installation complete."
echo "You may need to log out and back in or restart your terminal to apply path changes."

