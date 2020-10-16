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
