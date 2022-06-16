#!/bin/bash
set -e

DOTFILES_DIR=$HOME/.dotfiles
CONFIG_DIR=$HOME/.config/ansible
SSH_DIR=$HOME/.ssh

# Check os
if [[ `which pacman` ]]; then
    pacman -Syyu
    INSTALL=pacman\ -S
elif [[ `which apt` ]]; then
    sudo apt update
    sudo apt -y upgrade
    INSTALL=apt\ -y\ install
else 
    exit
fi

# Installs ansible
if ! [ -x "$(command -v ansible)" ]; then
    sudo $INSTALL ansible
    pip install ansible
fi

# Install tee
if ! [ -x "$(command -v tee)" ]; then
    sudo $INSTALL tee
fi

# Setup ssh
if ! [ -x "$(command -v ssh)" ]; then
    sudo $INSTALL openssh
    sudo systemctl start sshd
fi

if ! [[ -f "$SSH_DIR/id_rsa" ]]; then
    mkdir -p "$SSH_DIR"

    chmod 700 "$SSH_DIR"

    ssh-keygen -b 4096 -t rsa -f "$SSH_DIR/id_rsa" -N "" -C "$USER@$HOSTNAME"

    cat "$SSH_DIR/id_rsa.pub" | tee -a "$SSH_DIR/authorized_keys"

    chmod 600 "$SSH_DIR/authorized_keys"
fi

# Clone repo
if ! [ -x "$(command -v git)" ]; then
    sudo $INSTALL git
fi

if ! [[ -d "$DOTFILES_DIR" ]]; then
    git clone "https://github.com/mertdogan12/dotfiles.git" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"
mkdir -p .data

if [[ -f "requirements.yml" ]]; then
    ansible-galaxy install -r requirements.yml
fi

if [ $1 ]; then
    ansible-playbook --diff --ask-become-pass  main.yml
else
    ansible-playbook --diff main.yml
fi
