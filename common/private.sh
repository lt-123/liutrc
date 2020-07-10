#!/usr/bin/env bash

function gitconfigLiut() {
  git config --global user.name liut
  git config --global user.email lt-123@qq.com

  echo "已切换至 liut"
  cat "$HOME/.gitconfig"
}

function gitconfigSogukj() {
  git config --global user.name liut
  git config --global user.email liut@sogukj.com
  echo "已切换至 sogukj"
  cat "$HOME/.gitconfig"
}

alias gitconfigShow="cat "$HOME/.gitconfig""

alias stock="py ${HOME}//cmd-stock-quotes/stock.py"

