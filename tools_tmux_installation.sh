#!/bin/bash

### global variables
source common.sh

# Install Tmux
# Check if Tmux is installed
if command -v tmux >/dev/null; then
    echo "tmux is installed."
else
    echo "tmux installing."

    # Update Homebrew 
    bash homebrew_update.sh

    # Install Tmux
    echo "Installing Tmux..."
    brew install tmux
    echo "Tmux installted."

fi

# Config Tmux
ln -fs $WORKSPACE_CONFIG_PATH/tmux/.tmux.conf ~/.tmux.conf

if [ $? == 0 ]; then
    echo "tmux configured."
else
    echo "tmux configrued failed. Please check this"
fi
