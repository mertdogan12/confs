#!/bin/bash
# installing zsh
sudo apt-get install zsh

# Checks if it is installed
if [$(command -v python3 2>&-) == ""]; then
    echo "------------------------------------------"
    echo "python3 is not install. Installing it now."
    echo "------------------------------------------"

    sudo apt install python3
fi

if [$(command -v python3-pip 2>&-) == ""]; then
    echo "----------------------------------------------"
    echo "python3-pip is not install. Installing it now."
    echo "----------------------------------------------"

    sudo apt install python3-pip
fi

if [$(command -v node 2>&-) == ""]; then
    echo "----------------------------------------------"
    echo "python3-pip is not install. Installing it now."
    echo "----------------------------------------------"

    wget https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz -o $HOME/node.tar.xz
    tar xfv $HOME/node.tar.xz

    export PATH=$PATH:$HOME/node/bin
fi

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
            echo "Installing ohmyzsh"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

            echo "Installing plugins"
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

            echo "Install fzf"
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install
    
            echo "Links the confs"
            rm ~/.zshrc
            rm ~/.p10k.zsh
            ln -s ./zsh/.zshrc ~/.zshrc
            ln -s ./zsh/.p10k.zsh ~/.p10k.zsh

            echo Source .zshrc
            source ~/.zshrc
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
            sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
            git clone https://github.com/neovim/neovim
            cd neovim && make -j4
            sudo make install
    
            echo "Vimplug installing and nvim confs linking"
            sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

            # Installing pip package
            pip install neovim
	        npm i neovim

            # Links tht confs
            rm ~/.config/nvim/init.vim
            rm ~/.config/nvim/coc-settings.json
            mkdir -p $HOME/.config/nvim/
            ln -s ./nvim/init.vim ~/.config/nvim/init.vim
            ln -s ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json
            echo "==================" 
            break ;;
        N ) break;;
        * ) echo "N to exit";;
    esac
done
