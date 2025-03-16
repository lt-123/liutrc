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

#For the system Java wrappers to find this JDK, symlink it with
#  sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
#
#openjdk@11 is keg-only, which means it was not symlinked into /opt/homebrew,
#because this is an alternate version of another formula.
#
#If you need to have openjdk@11 first in your PATH, run:
#  echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
#
#For compilers to find openjdk@11 you may need to set:
#  export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"



#添加JDK的环境变量
#export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
#export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.5.jdk/Contents/Home


#添加JDK的环境变量 openjdk
#export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
export JAVA_17_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
export JAVA_21_HOME=/Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home


#alias命令动态切换JDK版本
alias jdk8="export JAVA_HOME=$JAVA_8_HOME"
alias jdk11="export JAVA_HOME=$JAVA_11_HOME"
alias jdk17="export JAVA_HOME=$JAVA_17_HOME"
alias jdk21="export JAVA_HOME=$JAVA_21_HOME"

#默认JDK17
export JAVA_HOME=$JAVA_17_HOME

################################# android #####################################

# adb path
export PATH=$PATH:~/Library/Android/sdk/platform-tools
# android Home
export ANDROID_HOME=~/Library/Android/sdk
# 安卓相关
source "${LIUT_RC_HOME}/common/android.sh"

# 鸿蒙 hdc
export PATH=$PATH:/Users/liut/Library/OpenHarmony/Sdk/12/toolchains


################################ rm ######################################

# 回收站文件夹
export TRASH_PATH=~/.Trash
source "${LIUT_RC_HOME}/common/rm.sh"

# 更新
alias up="brew update && brew upgrade"
