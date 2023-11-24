#!/bin/bash

set -e

# Function to execute a script and check its exit status
execute_and_check() {
    local script=$1
    echo "###################"
    echo "Begin. $2..."

    # Execute the script
    bash $script

    # Check the exit status
    local exit_status=$?
    if [ $exit_status -ne 0 ]; then
        echo "End. $script failed with exit status $exit_status. Stopping the script."
        exit $exit_status
    else 
	echo "End. $2 successfully"
	echo 
	
    fi
}

setup_workspace_folder() {
	execute_and_check "./create_workspace.sh" "Create workspace folder"
}

setup_ssh_key() {
	# assume ssh is ready
	execute_and_check "./setup_ssh_key.sh" "Setup ssh key"
	echo "Please post the ssh key to github and rerun with $0 skip-ssh"
	exit 0
}

setup_config() {
	execute_and_check "./setup_config.sh" "setup config"
}

bash_config() {
	execute_and_check "./config_bash.sh" "bash config"
}

config_zsh() {
	xecute_and_check "./config_zsh.sh" "config zsh"
}

setup_oh-my-zsh() {
	execute_and_check "./setup_oh-my-zsh.sh" "setup oh-my-zsh"
}

neovim_installation() {
	execute_and_check "./neovim_installation.sh" "neovim installation"
}

neovim_config() {
	execute_and_check "./neovim_config.sh" "neovim config"
}

neovim_install_plugins() {
	execute_and_check "./neovim_install_plugins.sh" "neovim install plugins"
}

golang_installation() {
	execute_and_check "./golang_installation.sh" "golang installation "
}

all_follow() {
	# Main setup script


	### step1. create `workspace` folder
	setup_workspace_folder

	### step2. config ssh key
	setup_ssh_key
}

skip_ssh_key() {

	# step3. clone config to local
	setup_config

	# config bash
	bash_config

	# install oh-my-zsh
	setup_oh-my-zsh

	# neovim
	neovim_installation	
	neovim_config
	neovim_install_plugins

    # golang
    golang_installation
}


# Function to display help information
show_help() {
    echo "Usage: main.sh [options]"
    echo "Usually, first run main.sh all, and then main.sh skip-sshkey"
    echo
    echo "Options:"
    echo "  -h, --help       Show this help message"
    echo "  all              The whole workflow from the beginning"
    echo "  skip-sshkey      The whole workflow but Skip SSH key setup"
    echo
    echo "Example:"
    echo "  ./main.sh all       Run the script with SSH key setup"
    echo "  ./main.sh skip-sshkey   Run the script but skip SSH key setup"
}

# Argument handling with case statement

case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
    all)
	echo "executed with whole workflow"
	all_follow
	exit 0
	;;
    skip-sshkey)
	echo "executed with whole workflow but skipping ssh key gen"
	skip_ssh_key
	exit 0
        ;;
    *)
        show_help
	exit 0
esac
