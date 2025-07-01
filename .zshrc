# zmodload zsh/zprof

export LANG='en_US.UTF-8'
export CLICOLOR='auto'

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt localoptions extendedglob

source $HOME/.config/zsh/brew.zsh
for entry in $HOME/.config/zsh/^brew.zsh; do
  if [[ -d $entry ]]; then
    local file="$entry/$(basename $entry).zsh"
    if [[ -f $file ]]; then
      source $file
    fi
  elif [[ $entry == *.zsh ]]; then
    source $entry
  fi
done

bindkey '^f' autosuggest-accept

eval "$(starship init zsh)"

# zprof

