#!/bin/bash

# link vimrc
ln -sf $HOME/workspace/wpconfig/vim/.vimrc $HOME/.vimrc

# Define the path for init.vim
INIT_VIM_PATH="$HOME/.config/nvim/init.vim"

# Create the directory for init.vim if it doesn't exist
mkdir -p "$(dirname "$INIT_VIM_PATH")"

# Check if init.vim already exists
if [ -f "$INIT_VIM_PATH" ]; then
    echo "init.vim already exists. Skipping creation."
else
    # Create and write basic configuration to init.vim
    echo "Creating init.vim from vim migration."
    echo "source $HOME/.vimrc" > "$INIT_VIM_PATH"
fi
