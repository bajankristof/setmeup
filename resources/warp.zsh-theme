#!/bin/zsh

HAPPY_EMOJIS=(😃 😇 😎 )
ANGRY_EMOJIS=(😡 🥵 🤮 💀 💩 🥶 🤬 😳 😱 😭 🫨 )
function random_emoji {
    local EMOJIS=("$@")
    echo $EMOJIS[$RANDOM%$#EMOJIS+1]
}

PROMPT="%(?:%{$fg_bold[blue]%}$(random_emoji "$HAPPY_EMOJIS[@]") :%{$fg_bold[red]%}$(random_emoji "$ANGRY_EMOJIS[@]") )"
PROMPT+="%{$fg_bold[magenta]%}%~%{$reset_color%} "
PROMPT+="\$(git_prompt_info)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
