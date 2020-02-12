#!/usr/bin/env bash


######################################################################

# win 平台 sdk 环境变量配置
# adb path
export PATH=$PATH:'/D/Android/Sdk/platform-tools'
# android Home
export ANDROID_HOME='/D/Android/Sdk'
# 安卓相关
source "${HOME}/.liut/common/android.sh"

######################################################################

# 回收站文件夹
export TRASH_PATH=~/.Trash
source "${HOME}/.liut/common/rm.sh"

# 打开文件夹
alias open=explorer
