# zmodload zsh/zprof

export LANG='en_US.UTF-8'
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME='free2stray'

zstyle ':omz:update' frequency 30

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
bindkey '^j' autosuggest-accept

source $ZSH/oh-my-zsh.sh

setopt localoptions extendedglob
source $HOME/.zshrc.d/brew.sh
for file in $HOME/.zshrc.d/^brew.sh; do
    source $file
done

# zprof

