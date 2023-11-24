#!/bin/bash

# Define the workspace directory
WORKSPACE_DIR="$HOME/workspace"

# Check if the directory exists
if [ -d "$WORKSPACE_DIR" ]; then
    echo "Directory $WORKSPACE_DIR already exists."
else
    # Create the directory
    echo "Creating directory $WORKSPACE_DIR."
    mkdir "$WORKSPACE_DIR"
fi

