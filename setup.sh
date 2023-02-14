#!/bin/bash

mkdir -p $HOME/work $HOME/personal $HOME/external

./scripts/install_packages.sh

./scripts/setup_dotfiles.sh
