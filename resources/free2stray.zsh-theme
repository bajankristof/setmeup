#!/bin/zsh

function warp_join {
    local SEPARATOR="$1 "
    shift

    local VALUES=()
    for value in "$@"; do [[ ! -z "${value// }" ]] && VALUES+=("$value"); done
    if [[ "${#VALUES[@]}" == '0' ]]; then return; fi
    if [[ "${#VALUES[@]}" == '1' ]]; then echo $VALUES; return; fi

    local FIRST="${VALUES[1]}"
    local REST=("${VALUES[@]:1}")
    echo -en "$FIRST" "${REST[@]/#/$SEPARATOR}"
}

function warp_random {
    local VALUES=("$@")
    local RANDOM=$(od -An -N2 -i /dev/urandom)
    echo -en $VALUES[$RANDOM%$#VALUES+1]
}

function warp_random_happy_emoji {
    warp_random 😃 😇 😎
}

function warp_random_angry_emoji {
    warp_random 😡 🥵 🤮 💀 💩 🥶 🤬 😳 😱 😭 🫨
}

function warp_project_info {
    local COMPONENTS=()

    if [[ -n $(echo Dockerfile*(N)) || -n $(echo docker-compose*.yml(N)) ]]; then COMPONENTS+=("%{$FG[033]%}\uf21f  %{$reset_color%}"); fi
    if [[ -d Assets && -d Packages && -d ProjectSettings ]]; then COMPONENTS+=("%{$FG[231]%}\ue721 %{$reset_color%}"); fi
    if [[ -n $(echo *.sln(N)) ]]; then COMPONENTS+=("%{$FG[057]%}\ue70c %{$reset_color%}"); fi
    if [[ -n $(echo *.csproj(N)) ]]; then COMPONENTS+=("%{$FG[041]%}\ue648 %{$reset_color%}"); fi
    if [[ -n $(echo *.tf(N)) ]]; then COMPONENTS+=("%{$FG[099]%}\ue69a %{$reset_color%}"); fi
    if [[ -f go.mod ]]; then COMPONENTS+=("%{$FG[081]%}\ue65e %{$reset_color%}"); fi
    if [[ -f Cargo.toml ]]; then COMPONENTS+=("%{$FG[202]%}\uf323 %{$reset_color%}"); fi
    if [[ -f package.json ]]; then COMPONENTS+=("%{$FG[113]%}\ued0d %{$reset_color%}"); fi
    if [[ -f mix.exs ]]; then COMPONENTS+=("%{$FG[057]%}\ue62d %{$reset_color%}"); fi
    if [[ -f Gemfile ]]; then COMPONENTS+=("%{$FG[196]%}\ueb48 %{$reset_color%}"); fi

    echo -en $COMPONENTS
}

function warp_git_info {
    if [[ ! -d .git && ! -f .git ]]; then return; fi

    local COMMIT_SHA
    COMMIT_SHA="$(git rev-parse --short HEAD 2>&1)"
    if [[ "$?" != '0' ]]; then COMMIT_SHA="✗"; fi

    local ICON="%{$FG[202]%}\uf418"
    local REMOTE_URL="$(git config --local --get remote.origin.url 2>&1)"
    if [[ "$REMOTE_URL" == *'github.com'* ]]; then ICON="%{$FG[231]%}\ue65b"; fi

    echo -en "$ICON %{$fg[gray]%}[%{$reset_color%}$COMMIT_SHA%{$fg[gray]%}]%{$reset_color%}"
}

function warp_aws_info {
    if [[ -z "$AWS_PROFILE" && -z "$AWS_ACCESS_KEY_ID" ]]; then return; fi

    local AWS_PROFILE="$AWS_PROFILE"
    if [[ -z "$AWS_PROFILE" ]]; then AWS_PROFILE="$VAULTED_ENV"; fi
    if [[ -z "$AWS_PROFILE" ]]; then AWS_PROFILE="✗"; fi

    echo -en "%{$FG[214]%}\uf0ef  %{$fg[gray]%}[%{$reset_color%}${AWS_PROFILE}%{$fg[gray]%}]%{$reset_color%}"
}

function warp_time_info {
    echo -en "%{$FG[208]%}%B$(date +%R)%b%{$reset_color%}"
}

PROMPT='%(?:%{$fg_bold[blue]%}$(warp_random_happy_emoji):%{$fg_bold[red]%}$(warp_random_angry_emoji)) '
PROMPT+='%{$fg_bold[magenta]%}%~%{$reset_color%} '
PROMPT+='$(git_prompt_info)'
PROMPT+='%{$reset_color%}'

RPROMPT='$(warp_join '
RPROMPT+='"%{$FG[235]%}|%{$reset_color%}" '
RPROMPT+='"$(warp_project_info)" '
RPROMPT+='"$(warp_git_info)" '
RPROMPT+='"$(warp_aws_info)" '
RPROMPT+='"$(warp_time_info)"'
RPROMPT+=')'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
