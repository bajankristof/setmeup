#!/bin/zsh

function random_emoji {
    local EMOJIS=("$@")
    local RANDOM=$(od -An -N2 -i /dev/urandom)
    echo $EMOJIS[$RANDOM%$#EMOJIS+1]
}

function random_happy_emoji {
    random_emoji 😃 😇 😎
}

function random_angry_emoji {
    random_emoji 😡 🥵 🤮 💀 💩 🥶 🤬 😳 😱 😭 🫨
}

function aws_info {
    if [[ -z "$AWS_PROFILE" ]]; then return; fi
    echo -en "%{$FG[231]%}\uf0ef%{$fg[gray]%}  on%{$FG[214]%} %B$AWS_PROFILE%b %{$reset_color%}"
}

function time_info {
    echo -en "%{$fg[gray]%}at%{$FG[208]%} %B$(date +%R)%b%{$reset_color%}"
}

PROMPT='%(?:%{$fg_bold[blue]%}$(random_happy_emoji):%{$fg_bold[red]%}$(random_angry_emoji)) '
PROMPT+='%{$fg_bold[magenta]%}%~%{$reset_color%} '
PROMPT+='$(git_prompt_info)'
PROMPT+='%{$reset_color%}'

RPROMPT='$(aws_info)'
RPROMPT+='$(time_info)'
RPROMPT+='%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
