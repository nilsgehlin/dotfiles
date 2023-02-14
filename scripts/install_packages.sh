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
    npm \
    xclip \
    ripgrep \
    fd-find \
    default-jdk \
    fzf \

# NPM packages
sudo npm install --global n yarn tsc
sudo n install latest

# Install oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

# Install Azure Core Tools
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get update
sudo apt-get install azure-functions-core-tools-4

# Install Az cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
