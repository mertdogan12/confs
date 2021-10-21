#!/bin/bash
# installing zsh
sudo apt-get install zsh

# Sets default shell
read -p "Do you want to make zsh you default shell? y/N" $yn
if [ "$yn" != "y"]
    chsh -s $(which zsh)
fi

# zsh config
read -p "Do you want to install ohmyzsh and some plugins" $yn
if [ "$yn" != "y"]
    # ohmyzsh installation
    echo "Installing ohmyzsh"
    echo "=================="
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "=================="

    echo "Installing plugins"
    # Installing plugins
    echo "=================="
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "=================="

    echo "Links the confs"
    # Links the confs
    echo "=================="
    rm ~/.zshrc
    rm ~/.p10k.zsh
    ln zsh/.zshrc ~/.zshrc
    ln zsh/.p10k.zsh ~/.p10k.zsh
    echo "=================="
fi

# Neovim
read -p "Do you want to install Neovim and vim plug" $yn
if [ "$yn" != "y"]
    echo "Installing Neovim"
    # Installing neovim
    echo "=================="
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    git clone https://github.com/neovim/neovim
    cd neovim && make -j4
    sudo make install
    echo "=================="
    
    echo "Vimplug installing and nvim confs linking"
    # vim plug
    echo "=================="
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # Links tht confs
    rm ~/.config/nvim/init.vim
    rm ~/.config/nvim/coc-settings.json
    ln nvim/init.vim ~/.config/nvim/init.vim
    ln nvim/coc-settings.json ~/.config/nvim/coc-settings.json
    echo "=================="
fi