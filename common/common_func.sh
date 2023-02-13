#!/usr/bin/env bash

function take() {
  # shellcheck disable=SC2164
  mkdir "$1" && cd "$1"
}

# 自动重试一个命令
function retry() {
  time=0
  while [ $time -lt 100 ]; do
    echo "[任务开始 <$*>]"
    echo "---------------"
    eval "$*"
    exitCode=$?
    if [ $exitCode -eq 0 ]; then
      echo "---------------"
      echo "[任务完成 <$*>]"
      break
    else
      time=$((time + 1))
      echo "[第 $time 次执行 <$*> 失败, 两秒后重试] 错误码: ${exitCode}, 时间: $(date)"
      sleep 2
    fi
  done
}

################################## proxy ####################################

# 设置 sock 代理函数 接受端口参数 默认 2048
function socks_proxy() {
  if [ "$1" ]; then
    port=$1
  else
    port=2048
  fi
  export all_proxy=socks5://127.0.0.1:$port
  echo "已设置代理 socks5://127.0.0.1:$port"
}

# 设置 http 代理函数 接受端口参数 默认 1123
function http_proxy() {
  if [ "$1" ]; then
    port=$1
  else
    port=1123
  fi
  export all_proxy=http://127.0.0.1:$port
  echo "已设置代理 http://127.0.0.1:$port"
}

# 设置 sock 代理函数 接受端口参数 默认 2048
function socks_proxy_207() {
  if [ "$1" ]; then
    port=$1
  else
    port=1024
  fi
  export all_proxy=socks5://10.0.90.207:$port
  echo "已设置代理 socks5://10.0.90.207:$port"
}

# 设置 http 代理函数 接受端口参数 默认 1123
function http_proxy_207() {
  if [ "$1" ]; then
    port=$1
  else
    port=1123
  fi
  export all_proxy=http://10.0.90.207:$port
  echo "已设置代理 http://10.0.90.207:$port"
}

# 取消代理
function unproxy() {
  echo "已取消代理 ${all_proxy}"
  unset all_proxy
}

################################ 公网IP ##################################

function showip() {
  curl https://dingtalk.ppno.net/ipseek
}
