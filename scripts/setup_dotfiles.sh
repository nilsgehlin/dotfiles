#!/bin/bash

wd=`pwd`

mkdir -p ~/.config

# zsh
ln -sfn $wd/.zsh_profile ~/.zsh_profile
ln -sfn $wd/.zshrc ~/.zshrc

# Git
ln -sfn $wd/git/.gitconfig ~/.gitconfig 

# Neovim
ln -sfn $wd/nvim ~/.config/nvim

# Tmux
ln -sfn $wd/.tmux.conf ~/.tmux.conf

