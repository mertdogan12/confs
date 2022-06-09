#!/bin/bash
set -e

DOTFILES_DIR=$HOME/.dotfiles
SSH_DIR=$HOME/.ssh

if [[ `which pacman` ]]; then
    INSTALL=pacman -S
elif [[ `which apt` ]]; then
    INSTALL=apt\ install
else 
    exit
fi

if ! [ -x "$(command -v ansible)" ]; then
    sudo $INSTALL ansible
fi

if ! [[ -f "$SSH_DIR/id_rsa" ]]; then
    mkdir -p "$SSH_DIR"

    chmod 700 "$SSH_DIR"

    ssh-keygen -b 4096 -t rsa -f "$SSH_DIR/id_rsa" -N "" -C "$USER@$HOSTNAME"

    cat "$SSH_DIR/id_rsa.pub" >> "$SSH_DIR/authorized_keys"

    chmod 600 "$SSH_DIR/authorized_keys"
fi

cd "$DOTFILES_DIR"

if [[ -f "requierements.yml" ]]; then
    ansible-galaxy install -r requierements.yml
fi

ansible-playbook --diff main.yml
