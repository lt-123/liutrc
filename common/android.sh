#!/usr/bin/env bash

##################################################
# 通过 source 使用， 需配置 adb 路径到 $path
##################################################

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

# 卸载 apk
alias uins='adb uninstall'

# 进入 SDK 文件夹
alias sdk="cd $ANDROID_HOME"


# 卸载所有已安装应用 !!!!
function uninstallAllApks() {
  echo "正在获取所有第三方应用列表..."

  # 获取所有第三方应用包名（使用-3标志）
  packages=$(adb shell pm list packages | cut -d':' -f2)

  # 如果没有找到任何包
  if [[ -z "$packages" ]]; then
    echo "未发现任何第三方应用"
  fi

  # 统计变量
  total_count=0
  success_count=0
  failed_count=0
  failed_apps=""

  echo "开始卸载应用程序..."
  echo "------------------------------"

  # 遍历并卸载每个包
  while IFS= read -r package; do
    ((total_count++))
    echo "正在尝试卸载: $package"

    uninstall_result=$(adb uninstall "$package" 2>&1)

    if [[ "$uninstall_result" == "Success" ]]; then
      echo "✅ 已成功卸载: $package"
      ((success_count++))
    else
      echo "❌ 卸载失败: $package (原因: $uninstall_result)"
      ((failed_count++))
      failed_apps="$failed_apps\n  - $package: $uninstall_result"
    fi
    echo "------------------------------"
  done <<< "$packages"

  # 显示卸载统计信息
  echo -e "\n卸载操作完成！"
  echo "总应用数量: $total_count"
  echo "成功卸载: $success_count"
  echo "卸载失败: $failed_count"

  if [[ $failed_count -gt 0 ]]; then
    echo -e "\n以下应用卸载失败:$failed_apps"
  fi

}

