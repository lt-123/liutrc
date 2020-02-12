#!/usr/bin/env bash


############################# jdk #########################################

#添加JDK的环境变量
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.5.jdk/Contents/Home
#默认JDK1.8
export JAVA_HOME=$JAVA_8_HOME

#alias命令动态切换JDK版本
alias jdk8="export JAVA_HOME=$JAVA_8_HOME"
alias jdk11="export JAVA_HOME=$JAVA_11_HOME"

################################# android #####################################

# adb path
export PATH=$PATH:~/Library/Android/sdk/platform-tools
# android Home
export ANDROID_HOME=~/Library/Android/sdk
# 安卓相关
source "${HOME}/.liut/common/android.sh"

################################## proxy ####################################

# 设置代理函数 接受端口参数 默认 1920
function proxy() {
  if [ $1 ]; then
    port=$1
  else
    port=1920
  fi
  export all_proxy=socks5://127.0.0.1:$port
  echo "已设置代理 socks5://127.0.0.1:$port"
}

# 取消代理
function unproxy() {
  echo "已取消代理 ${all_proxy}"
  unset all_proxy
}

################################ rm ######################################

# 回收站文件夹
export TRASH_PATH=~/.Trash
source "${HOME}/.liut/common/rm.sh"

