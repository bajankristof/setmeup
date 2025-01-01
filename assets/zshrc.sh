# zmodload zsh/zprof

export LANG='en_US.UTF-8'
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME='free2stray'

zstyle ':omz:update' frequency 30
zstyle ':omz:plugins:nvm' lazy yes

plugins=(git nvm zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
for file in $HOME/.zshrc.d/*; do
    source $file
done

# zprof
