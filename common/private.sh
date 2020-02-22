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

function gitconfigShow() {
  cat "$HOME/.gitconfig"
}
