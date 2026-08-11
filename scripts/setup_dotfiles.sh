#!/bin/bash

wd=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

mkdir -p ~/.config

# zsh
# chsh -s $(which zsh)
ln -sfn "$wd/.zsh_profile" ~/.zsh_profile
ln -sfn "$wd/.zshrc" ~/.zshrc

#oh-my-zsh
if [[ -d ~/.oh-my-zsh/custom/themes ]]; then
  ln -sfn "$wd/nige.zsh-theme" ~/.oh-my-zsh/custom/themes/nige.zsh-theme
fi

# Neovim
# ln -sfn $wd/nvim ~/.config/nvim

# Tmux
ln -sfn "$wd/.tmux.conf" ~/.tmux.conf

# wsl browser stuff
if [[ -d "$wd/bin" ]]; then
  ln -sfn "$wd/bin" ~/bin
fi

# set zsh as default
# chsh -s $(which zsh)

# Alacritty
# ln -sfn $wd/alacritty ~/.config/alacritty

# i3
# ln -sfn $wd/i3 ~/.config/i3
# ln -sfn $wd/i3status ~/.config/i3status
