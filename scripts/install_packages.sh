#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo sh -c 'echo "Package: *" > /etc/apt/preferences.d/99microsoft-dotnet.pref'
sudo sh -c 'echo "Pin: origin \"packages.microsoft.com\"" >> /etc/apt/preferences.d/99microsoft-dotnet.pref'
sudo sh -c 'echo "Pin-Priority: 1001" >> /etc/apt/preferences.d/99microsoft-dotnet.pref'

sudo apt-get update -y
sudo apt-get upgrade -y

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
    neovim \
    dotnet-sdk-6.0 \
    dotnet-sdk-7.0 \
    apt-transport-https \
    software-properties-common

#pwsh
cd /tmp
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
rm packages-microsoft-prod.deb
cd -

# NPM packages
sudo npm install --global n yarn tsc
sudo n install latest

# Install oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Azure Core Tools
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get update
sudo apt-get install azure-functions-core-tools-4

# Install Az cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
