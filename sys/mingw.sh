#!/usr/bin/env bash

# 继承 msys
source "${LIUT_RC_HOME}/sys/msys.sh"

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias la='ls -al --color=auto --show-control-chars'
alias ll='ls -l --color=auto --show-control-chars'
alias ls='ls -F --color=auto --show-control-chars'
alias l='ls -alF --color=auto --show-control-chars'
