export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'

function e {
  if [ $# -eq 0 ]; then
    nvim .
  else
    nvim "$@"
  fi
}
