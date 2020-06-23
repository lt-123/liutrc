#!/usr/bin/env bash

# 自动重试一个命令
function retry() {
  time=0;
  # shellcheck disable=SC2050
  while [ $time -lt 100 ]; do
    echo ".................. job begin  ..................."

    echo "$1"
    eval "$1"

    if [ $? -eq 0 ]; then
      echo "--------------- job complete ---------------"
      break
    else
      time=$((time+1))
      echo "[第 $time 次执行 < $1 > 失败, 两秒后重试] 错误码: $?, 时间: $(date)"
      sleep 2
    fi
  done
}


