#!/usr/bin/env bash

##################################################
# 通过 source 使用， 需配置 adb 路径到 $path
##################################################

# 检查是否配置了 adb 路径到 $path
if [ ! $(which adb) ]; then
  echo 'no adb'
  return 1
fi

# 查看顶端 Activity
function topa() {
  serial=$1

  if [ $serial ]; then
    adb -s $1 shell dumpsys activity top | grep ACTIVITY
  else
    adb shell dumpsys activity top | grep ACTIVITY
  fi
}
# 查看顶端 Activity2
function topa2() {
  serial=$1

  if [ $serial ]; then
    adb -s $1 shell dumpsys activity activities | grep Resumed
  else
    adb shell dumpsys activity activities | grep Resumed
  fi
}

# Android log
function lc() {
  if [ -z "$1" ]; then
    echo "eval adb logcat"
    eval 'adb logcat'
  else
    echo "eval adb logcat | grep \"$1\""
    eval "adb logcat | grep \"$1\""
  fi
}

# 查看设备
alias dev='adb devices'

# 安装 apk
alias ins='adb install'
