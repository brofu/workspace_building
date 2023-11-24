#!/bin/bash

### install Vundle

# Define Vundle's installation path
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

# Install Vundle if it's not already installed
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
    echo "Vundle is already installed."
fi

### 
# Install plugins using Vundle
echo "Installing plugins using Vundle..."
vim +PluginInstall +qall

echo "Plugin installation complete."


