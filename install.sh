#!/bin/bash
# installing zsh
sudo apt-get install zsh

# Sets default shell
while true; do
    read -p "Do you want to make zsh you default shell? [y/N]: " yn
    case $yn in
        y ) chsh -s $(which zsh); break;;
        N ) break;;
        * ) echo "N to exit";;
    esac
done

# zsh config
while true; do
    read -p "Do you want to install ohmyzsh and some plugins [y/N]: " $yn1
    case $yn1 in
        y ) 
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
            ln zsh/.zshrc ~/.zshrc
            ln zsh/.p10k.zsh ~/.p10k.zsh
            echo "==================" 
            break ;;
        N ) break; echo $yn;;
        * ) echo "N to exit"; echo $yn;;
    esac
done

while true; do
    read -p "Test test" $yn2
    case $yn2 in
        y ) 
            echo "Test test"
            echo "Test test"
            echo "Test test"
            echo "Test test"
            echo "Test test"
            break ;;
        N ) break; echo $yn;;
        * ) echo "N to exit"; echo $yn;;
    esac
done

# Neovim
while true; do
    read -p "Do you want to install Neovim and vim plug [y/N]: " $yn3
    case $yn3 in
        y ) 
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
            ln nvim/init.vim ~/.config/nvim/init.vim
            ln nvim/coc-settings.json ~/.config/nvim/coc-settings.json
            echo "==================" 
            break ;;
        N ) break;;
        * ) echo "N to exit";;
    esac
done
