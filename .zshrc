export DOTFILES="$HOME/projects/personal/dotfiles"

# Prompt with git branch
autoload -Uz add-zsh-hook
_git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  local dirty=""
  git diff --quiet --ignore-submodules 2>/dev/null || dirty=" ✗"
  echo " %F{blue}(%F{yellow}${branch}%F{blue})%F{yellow}${dirty}%f"
}
setopt PROMPT_SUBST
if [[ -n "$SSH_CONNECTION" ]]; then
  PROMPT='%K{yellow}%F{black} %m %f%k %(?.%B%F{green}➜ .%B%F{red}➜ )%f%b%F{cyan}%c%f$(_git_branch) '
else
  PROMPT='%(?.%B%F{green}➜ .%B%F{red}➜ )%f%b%F{cyan}%c%f$(_git_branch) '
fi

# Completions - only regenerate once per day
autoload -Uz compinit
if [[ -f ~/.zcompdump(#qN.mh+24) ]] || [[ ! -f ~/.zcompdump ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' special-dirs true

# Search history using the text already entered at the prompt.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

if (( ! $+commands[fd] && $+commands[fdfind] )); then
  alias fd=fdfind
fi

source "$DOTFILES/.zsh_profile"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# fnm - cached for speed, regenerate with: fnm env --use-on-cd --shell zsh > ~/.cache/fnm-env.zsh
FNM_CACHE="$HOME/.cache/fnm-env.zsh"
if (( $+commands[fnm] )); then
  if [[ ! -f "$FNM_CACHE" ]]; then
    mkdir -p "$HOME/.cache"
    fnm env --use-on-cd --shell zsh > "$FNM_CACHE"
  fi
  source "$FNM_CACHE"
fi

export PATH="$PATH:$HOME/.dotnet/tools"

# pnpm
if [[ "$(uname -s)" == "Darwin" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
else
  export PNPM_HOME="$HOME/.local/share/pnpm"
fi
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.local/bin:$PATH"

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"
export LESS="--mouse -R"
