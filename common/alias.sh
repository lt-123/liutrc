#!/usr/bin/env bash

alias ..=cd ..
alias ...=cd ../..
alias ....=cd ../../..
alias .....=cd ../../../..
alias ......=cd ../../../../..

alias .1=..
alias .2=...
alias .3=....
alias .4=.....
alias .5=......

alias cd..='..'

alias g=git
alias gst=g status
alias gco=g checkout
alias gr=g rm -rf
alias gci=g commit
alias gbr=g branch
alias gpl=g pull
alias gps=g push
alias gfc=g fetch
alias ghist=git log --pretty=format:"%h-%an: %s  %ar" --graph

alias vi=vim
alias c=clear
alias ports=netstat -tulanp

alias tf=tail -f

alias du1=du -h -d 1
alias du2=du -h -d 2
alias du3=du -h -d 3
