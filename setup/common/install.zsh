#!/bin/zsh

set -e

cd "${0:a:h}"

(cd ~; mise install)

zsh roslynls.zsh

