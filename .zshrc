export ZSH="$HOME/.oh-my-zsh"
export DOTFILES=$HOME/projects/personal/dotfiles

#export BROWSER=/home/nige/bin/runedge.sh

ZSH_THEME="nige"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $DOTFILES/.zsh_profile

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
