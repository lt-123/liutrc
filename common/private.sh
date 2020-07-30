#!/usr/bin/env bash

#function gitconfigLiut() {
#  git config --global user.name liut
#  git config --global user.email lt-123@qq.com
#
#  echo "已切换至 liut"
#  cat "$HOME/.gitconfig"
#}
#
#function gitconfigSogukj() {
#  git config --global user.name liut
#  git config --global user.email liut@sogukj.com
#  echo "已切换至 sogukj"
#  cat "$HOME/.gitconfig"
#}
#
#alias gitconfigShow="cat "$HOME/.gitconfig""

########################

function startTrojan() {
  bash $LIUT_RC_HOME/common/trojan.sh
  echo 'trojan 已启动'
}

function stopTrojan() {
  killall trojan
  echo 'trojan 已停止'
}

function showTrojan() {
  ps -ef | grep trojan
}
