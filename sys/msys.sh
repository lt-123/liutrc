#!/usr/bin/env bash


############################# jdk 会覆盖系统环境变量 ########################

#添加JDK的环境变量
export JAVA_ADOPT_8=~/.jdks/adopt-openjdk-1.8.0_252
export JAVA_AS_8=~/AppData/Local/JetBrains/Toolbox/apps/AndroidStudio/ch-0/192.6392135/jre

#默认 openJDK1.8
export JAVA_HOME=$JAVA_ADOPT_8

# path
export PATH=$PATH:$JAVA_HOME/bin

#alias命令动态切换JDK版本
alias jdk-adopt8="export JAVA_HOME=$JAVA_ADOPT_8"
alias jdk-as8="export JAVA_HOME=$JAVA_AS_8"

######################################################################

# win 平台 sdk 环境变量配置
# android Home
export ANDROID_HOME='/C/Users/liut/AppData/Local/Android/Sdk'
# adb path
export PATH=$PATH:"$ANDROID_HOME/platform-tools"

# 安卓相关
source "${LIUT_RC_HOME}/common/android.sh"

######################################################################

# 打开文件夹
alias open=explorer

export WORKSPACE="/e/workspace"
alias ws="cd $WORKSPACE"

################################ rm ######################################

# 回收站文件夹
export TRASH_PATH=~/.Trash
source "${LIUT_RC_HOME}/common/rm.sh"
