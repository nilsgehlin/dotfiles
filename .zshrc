export ZSH="$HOME/.oh-my-zsh"
export DOTFILES=$HOME/projects/personal/dotfiles

#export BROWSER=/home/nige/bin/runedge.sh

ZSH_THEME="nige"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $DOTFILES/.zsh_profile

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/Users/Nils.Gehlin/.dotnet/tools"

# pnpm
export PNPM_HOME="/Users/Nils.Gehlin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
