#!/usr/bin/env bash

######################################################################

# linux 平台 sdk 环境变量配置
echo "linux"
# adb path
export PATH=$PATH:~/Android/sdk/platform-tools
# android Home
export ANDROID_HOME=~/.Android/sdk
# 安卓相关
source "${HOME}/.liut/common/android.sh"

######################################################################

# 回收站文件夹
export TRASH_PATH=~/.Trash
source "${HOME}/.liut/common/rm.sh"
