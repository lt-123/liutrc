#!/usr/bin/env bash

# bash only
if [[ "$0" == 'bash' ]]; then
  alias ll='ls -lh' # long format and human-readable sizes
  alias l='ll -A'   # long format, all files
  # shellcheck disable=SC2139
  alias lm="l | ${PAGER}" # long format, all files, use pager
  alias lr='ll -R'        # long format, recursive
  alias lk='ll -Sr'       # long format, largest file size last
  alias lt='ll -tr'       # long format, newest modification time last
  alias lc='lt -c'        # long format, newest status change (ctime) last
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias .1='..'
alias .2='...'
alias .3='....'
alias .4='.....'
alias .5='......'

alias cd..='..'

alias g='git'
alias gst='g status'
alias gco='g checkout'
alias gr='g rm -rf'
alias gci='g commit'
alias gbr='g branch'
alias gpl='g pull'
alias gps='g push'
alias gfc='g fetch'
alias ghist='g log --pretty=format:"%h-%an: %s  %ar" --graph'

alias vi='vim'
alias c='clear'
alias ports='netstat -tulanp'

alias tf='tail -f'

alias du1='du -h -d 1'
alias du2='du -h -d 2'
alias du3='du -h -d 3'
