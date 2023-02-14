#!/bin/bash

wd=`pwd`

mkdir -p ~/.config

# zsh
chsh -s $(which zsh)
ln -sfn $wd/.zsh_profile ~/.zsh_profile
ln -sfn $wd/.zshrc ~/.zshrc

#oh-my-zsh
ln -sfn $wd/nige.zsh-theme ~/.oh-my-zsh/custom/themes/nige.zsh-theme

# Git
ln -sfn $wd/git/.gitconfig ~/.gitconfig 

# Neovim
ln -sfn $wd/nvim ~/.config/nvim

# Tmux
ln -sfn $wd/.tmux.conf ~/.tmux.conf

