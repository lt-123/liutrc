#!/usr/bin/env bash

function gitconfigLiut() {
  git config --global user.name liut
  git config --global user.email lt-123@qq.com

  echo "已切换至 liut"
  cat "$HOME/.gitconfig"
}

function gitconfigKoal() {
  git config --global user.name liutong
  git config --global user.email liut@koal.com
  echo "已切换至 koal"
  cat "$HOME/.gitconfig"
}

alias gitconfigShow="cat "$HOME/.gitconfig""

########################

#function startTrojan() {
#  bash $LIUT_RC_HOME/common/trojan.sh
#  privoxy /etc/privoxy/config
#  echo 'trojan 已启动'
#}
#
#function stopTrojan() {
#  killall trojan
#  killall privoxy
#  echo 'trojan 已停止'
#}
#
#function showTrojan() {
#  ps -ef | grep trojan
#  ps -ef | grep privoxy
#}


# 设置 sock 代理函数 接受端口参数 默认 1024
function proxy_koal() {
  export all_proxy=socks5://10.0.209.65:1024
  echo "已设置代理 socks5://10.0.209.65:1024"
}


# 设置 sock 代理函数 接受端口参数 默认 1024
function proxy_msi() {
  export all_proxy=socks5://192.168.1.254:1024
  echo "已设置代理 socks5://192.168.1.254:1024"
}

