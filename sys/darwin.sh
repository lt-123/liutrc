#!/usr/bin/env bash


################################## flutter ####################################

# 环境变量
export PATH=$PATH:~/.flutter/bin

# 清华源
#export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
#export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"

# 清华源太久了，换这个
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# git remote https://github.com/flutter/flutter.git

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
source "${LIUT_RC_HOME}/common/android.sh"


################################ rm ######################################

# 回收站文件夹
export TRASH_PATH=~/.Trash
source "${LIUT_RC_HOME}/common/rm.sh"
