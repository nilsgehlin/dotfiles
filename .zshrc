export ZSH="$HOME/.oh-my-zsh"
export DOTFILES=$HOME/projects/dotfiles.git/main/

export BROWSER=/home/nige/bin/runedge.sh

ZSH_THEME="nige"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $DOTFILES/.zsh_profile
