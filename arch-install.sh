#!/bin/bash
# installing zsh
sudo pacman -S zsh

# Sets default shell
while read -p "Do you want to make zsh you default shell? [y/N]: " yn; do
    case $yn in
        y ) chsh -s $(which zsh); break;;
        N ) break;;
        * ) echo "N to exit";;
    esac
done

# zsh config
while read -p "Do you want to install ohmyzsh and some plugins [y/N]: " yn; do
    case $yn in
        y ) 
            # ohmyzsh installation
            echo "Installing ohmyzsh"
            echo "=================="
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            echo "=================="

            # Installing plugins
            echo "Installing plugins"
            echo "=================="
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
            echo "=================="
    
            # Links the confs
            echo "Links the confs"
            echo "=================="
            rm ~/.zshrc
            rm ~/.p10k.zsh
            ln zsh/.zshrc ~/.zshrc
            ln zsh/.p10k.zsh ~/.p10k.zsh
            echo "==================" 
            break ;;
        N ) break; echo $yn;;
        * ) echo "N to exit"; echo $yn;;
    esac
done

# Neovim
while read -p "Do you want to install Neovim and vim plug [y/N]: " yn; do
    case $yn in
        y ) 
            echo "Installing Neovim"
            # Installing neovim
            echo "=================="
	    sudo pacman -S base-devel cmake unzip ninja tree-sitter curl
            git clone https://github.com/neovim/neovim
            cd neovim && make -j4
            sudo make install
            echo "=================="
    
            echo "Vimplug installing and nvim confs linking"
            # vim plug
            echo "=================="
            sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

            # Installing pip package
            pip install neovim

            # Links tht confs
            rm ~/.config/nvim/init.vim
            rm ~/.config/nvim/coc-settings.json
            mkdir -p ~/.config/nvim
            ln ./nvim/init.vim ~/.config/nvim/init.vim
            ln ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json
            echo "==================" 
            break ;;
        N ) break;;
        * ) echo "N to exit";;
    esac
done
