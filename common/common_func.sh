#!/usr/bin/env bash

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

# 设置代理函数 接受端口参数 默认 1920
function proxy() {
  if [ $1 ]; then
    port=$1
  else
    port=2048
  fi
  export all_proxy=socks5://127.0.0.1:$port
  echo "已设置代理 socks5://127.0.0.1:$port"
}

# 取消代理
function unproxy() {
  echo "已取消代理 ${all_proxy}"
  unset all_proxy
}

