#!/usr/bin/env bash

############################# jdk #########################################

#添加JDK的环境变量
export JAVA_8_HOME=/usr/lib/jvm/java-8-openjdk
export JAVA_11_HOME=/usr/lib/jvm/java-11-openjdk
#默认JDK1.8
export JAVA_HOME=JAVA_11_HOME
export PATH=${PATH}:${JAVA_HOME}/bin

#alias命令动态切换JDK版本
# shellcheck disable=SC2139
alias jdk8="export JAVA_HOME=$JAVA_8_HOME"
# shellcheck disable=SC2139
alias jdk11="export JAVA_HOME=$JAVA_11_HOME"

######################################################################

# linux 平台 sdk 环境变量配置
# adb path
export PATH=$PATH:~/Android/Sdk/platform-tools
# android Home
export ANDROID_HOME=~/Android/Sdk

# android ndk Home
export ANDROID_NDK_HOME=/home/liut/Android/Sdk/ndk/16.1.4479499
# ndk path
export PATH=${PATH}:${ANDROID_NDK_HOME}:${ANDROID_NDK_HOME}/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin

# 安卓相关
source "${LIUT_RC_HOME}/common/android.sh"


######################################################################


# 打开文件夹
function open() {
  nautilus $1 &
}

######################################################################

# 回收站文件夹
export TRASH_PATH=~/.local/share/Trash/files
source "${LIUT_RC_HOME}/common/rm.sh"


