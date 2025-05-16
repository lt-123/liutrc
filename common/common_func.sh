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

# 设置 sock 代理函数 接受端口参数 默认 1024
function proxy_socks() {
  if [ "$1" ]; then
    port=$1
  else
    port=1024
  fi
  export all_proxy=socks5://127.0.0.1:$port
  echo "已设置代理 socks5://127.0.0.1:$port"
}

# 设置 http 代理函数 接受端口参数 默认 1123
function proxy_http() {
  if [ "$1" ]; then
    port=$1
  else
    port=1123
  fi
  export all_proxy=http://127.0.0.1:$port
  echo "已设置代理 http://127.0.0.1:$port"
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

function o() {
  if [ "$1" ]; then
    open $1
  else
    open .
  fi
}


# 定义一个函数，用于递归 fetch 给定目录下的所有 Git 仓库
fetch_all_git_repos() {
  # 判断是否提供了 ROOT_DIR 参数
  if [ -z "$1" ]; then
    echo "缺少 ROOT_DIR 参数，请指定一个根目录作为参数。"
    return 1
  fi

  # 根目录
  local ROOT_DIR="$1"

  # 检查目录是否存在
  if [ ! -d "$ROOT_DIR" ]; then
    echo "提供的目录 $ROOT_DIR 不存在或不是一个有效的目录。"
    return 1
  fi

  # 遍历所有子目录
  find "$ROOT_DIR" -type d -name ".git" | while read git_dir; do
    # 获取 .git 所在的父目录
    local repo_dir=$(dirname "$git_dir")

    # 进入 Git 仓库目录
    echo "进入目录: $repo_dir"
    cd "$repo_dir" || { echo "无法进入 $repo_dir"; continue; }

    # 检查是否是一个有效的 Git 仓库
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
      echo "正在处理仓库: $repo_dir"

      # 获取所有 remotes
      local remotes=$(git remote)
      if [[ -z "$remotes" ]]; then
        echo "没有找到 remote，跳过 $repo_dir"
        continue
      fi

      # Fetch 所有 remote 的所有分支
      for remote in $remotes; do
        echo "Fetching remote: $remote"
        git fetch --all --prune --verbose
      done
    else
      echo "$repo_dir 不是一个有效的 Git 仓库，跳过"
    fi

    echo "------------------------------------"
  done

  echo "所有仓库的 fetch 操作已完成！"
}

