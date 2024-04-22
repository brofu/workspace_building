#!/bin/bash

source common.sh

# Install pyenv
# Check if pyenv is installed
if command -v pyenv >/dev/null; then
    echo "pyenv is installed."
else
    # Install pyenv
    echo "Installing pyenv..."
    brew install pyenv 
    echo "pyenv installted."

fi

# config pyenv
echo "####################" >> $BASH_CUS_RC
echo "#pyenv configuration" >> $BASH_CUS_RC
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $BASH_CUS_RC
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> $BASH_CUS_RC
echo 'eval "$(pyenv init --path)"' >> $BASH_CUS_RC
echo 'eval "$(pyenv init -)"' >> $BASH_CUS_RC
echo " " >> $BASH_CUS_RC
