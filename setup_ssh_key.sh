#!/bin/bash

# Set email and key file name
SSH_EMAIL="brofu.talk@gmail.com"
SSH_KEY_PATH="$HOME/.ssh/brofu_ed25519"

# Generate SSH Key
if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$SSH_EMAIL" -f "$SSH_KEY_PATH" -N ""
else
    echo "SSH key already exists."
fi

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent
ssh-add "$SSH_KEY_PATH"

# Copy the SSH public key to your clipboard for adding to GitHub/GitLab/Bitbucket
if command -v pbcopy > /dev/null; then
    pbcopy < "${SSH_KEY_PATH}.pub"
    echo "SSH public key copied to clipboard."
else
    echo "pbcopy not found, unable to copy SSH public key to clipboard."
    echo "Please manually copy the SSH public key from ${SSH_KEY_PATH}.pub"
fi

