#!/usr/bin/env bash

# 自动重试一个命令
function retry() {
  # shellcheck disable=SC2050
  while [ 0 -eq 0 ]; do
    echo ".................. job begin  ..................."

    echo "$1"
    eval "$1"

    if [ $? -eq 0 ]; then
      echo "--------------- job complete ---------------"
      break
    else
      echo "...............error occur, retry in 2 seconds .........."
      sleep 2
    fi
  done
}
