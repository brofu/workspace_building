#!/bin/bash

pushd "$HOME/workspace"

CONFIGS_DIR="wpconfig"

if [ -d "$CONFIGS_DIR" ]; then
    echo "Repo $CONFIGS_DIR already exists."
else
    # Create the directory
    git clone git@github.com:brofu/workspace_config.git $CONFIGS_DIR 
fi


popd

