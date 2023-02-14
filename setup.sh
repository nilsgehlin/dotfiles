#!/bin/bash

mkdir -p $HOME/work $HOME/personal $HOME/external

sudo apt-get update -y
sudo apt-get upgrade -y

./scripts/install_packages.sh

./scripts/setup_dotfiles.sh