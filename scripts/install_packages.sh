#!/bin/bash

install_packages() {
    sudo apt-get install -y $@
}

install_packages \
    git \
    tmux \
    zsh \
    curl \
    wget \
    htop \
    tree \
    python3 \
    python3-pip \
    python3-venv \
    gcc \
    g++ \
    make \
    cmake \
    unzip \
    gettext \
    ninja-build \
    nodejs \


# Install oh-my-zsh 
sudo curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

# Install neovim
if [ -d "$HOME/external/neovim" ]; then
    cd $HOME/external/neovim
    git pull
else
    git clone https://github.com/neovim/neovim.git $HOME/external/neovim
fi
cd $HOME/external/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd -
