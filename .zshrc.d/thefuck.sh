_autoload_thefuck() {
    eval "$(bkt --ttl 90d -- thefuck -a)"
}

_autoload_thefuck

unfunction _autoload_thefuck
