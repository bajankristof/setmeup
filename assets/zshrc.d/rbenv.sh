_autoload_rbenv() {
    eval "$(bkt --ttl 90d -- rbenv init --no-rehash - zsh)"
}

_autoload_rbenv

unfunction _autoload_rbenv
