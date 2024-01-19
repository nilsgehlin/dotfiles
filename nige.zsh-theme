function prompt_dir {
    if [[ "$(pwd)" == "$HOME" ]]; then
        echo "~"
        exit 0
    fi

    parent_dir=$(dirname `pwd`)
    parent_is_bare=$(git -C $parent_dir rev-parse --is-bare-repository 2>/dev/null)

    if [[ "$parent_is_bare" == "true" ]]; then
        echo $(basename $parent_dir)
    else
        echo $(basename `pwd`)
    fi
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}$(prompt_dir) $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
