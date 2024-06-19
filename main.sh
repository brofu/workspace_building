#!/bin/bash

set -e

### global variables
source common.sh

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

# set config folder and clone it from git
prepare_configurations() {
	execute_and_check "./prepare_configurations.sh" "setup config"
}

pyenv_installation() {
	execute_and_check "./pyenv_installation.sh" "install pyenv"
}

python_installation() {
	execute_and_check "./python_installation.sh" "install python"
}

bash_config() {
	execute_and_check "./config_bash.sh" "bash config"
}

config_zsh() {
	execute_and_check "./config_zsh.sh" "config zsh"
}

setup_iterm2() {
	execute_and_check "./setup_iterm2.sh" "setup iterm2"
}

setup_oh-my-zsh() {
	execute_and_check "./setup_oh-my-zsh.sh" "setup oh-my-zsh"
}

tools_tree_installation() {
	execute_and_check "./tools_tree_installation.sh" "tools tree installation"
}

tools_tmux_installation() {
	execute_and_check "./tools_tmux_installation.sh" "tools tmux installation"
}

vim_installation() {
	execute_and_check "./vim_installation.sh" "vim installation"
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

golang_tools_installation() {
	execute_and_check "./golang_tools_installation.sh" "golang tools installation "
}

tools_gitbook_installation() {
	execute_and_check "./gitbook_installation.sh" "gitbook installation "
} 

pre_ssh_key() {
	# Main setup script


	### step1. create `workspace` folder
	setup_workspace_folder

	### step2. config ssh key
	setup_ssh_key
}

post_ssh_key() {

    # install or update homebrew
    bash homebrew_update.sh

	#clone config to local
	prepare_configurations
    
	# config bash
	bash_config

    # install pyenv
    pyenv_installation

    # install python
    python_installation

    # install iTerm2
    setup_iterm2

	# install oh-my-zsh
	setup_oh-my-zsh

    # tools tree
    tools_tree_installation

	# ********
    # vim & neovim
    # 
    
    # system attached vim cannot support python 3.10+ good enough
    vim_installation 
	neovim_config
	neovim_install_plugins

    # golang
    golang_installation
    golang_tools_installation

    # tmux
    tools_tmux_installation

    # gitbook
    tools_gitbook_installation 
}


# Function to display help information
show_help() {
    echo "Usage: main.sh [options]"
    echo "Usually, first run main.sh pre-sshkey, and then main.sh post-sshkey"
    echo
    echo "Options:"
    echo "  -h, --help       Show this help message"
    echo "  pre-sshkey       The workflows before generating the SSH key (used for git)"
    echo "  post-sshkey      The whole workflow after SSH key is generated"
    echo "  script_name     Test the script with specific cmd, for example, main tools_tmux_installation"
    echo
    echo "Example:"
    echo "  ./main.sh pre-sshkey    Execute the workflows from beginning to generating the SSH key"
    echo "  ./main.sh post-sshkey   Execute the workflows after generating the SSH key"
}

# Argument handling with case statement

case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
    pre-sshkey)
	echo "executed with whole workflow"
	pre_ssh_key
	exit 0
	;;
    post-sshkey)
	echo "executed with whole workflow but skipping ssh key gen"
	post_ssh_key
	exit 0
        ;;
    test)
        tools_gitbook_installation
        ;;
    *)
        show_help
	exit 0
esac
