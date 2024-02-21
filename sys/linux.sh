#!/usr/bin/env bash

############################# jdk #########################################

#添加JDK的环境变量
export JAVA_8_HOME=/usr/lib/jvm/java-8-openjdk
export JAVA_11_HOME=/usr/lib/jvm/java-11-openjdk
export JAVA_17_HOME=/usr/lib/jvm/java-17-openjdk
#默认JDK1.8
export JAVA_HOME=$JAVA_11_HOME
export PATH=${JAVA_HOME}/bin:${PATH}

#alias命令动态切换JDK版本
function jdk8(){
	export JAVA_HOME=$JAVA_8_HOME
	export PATH=${JAVA_HOME}/bin:${PATH}
}

function jdk11(){
	export JAVA_HOME=$JAVA_11_HOME
	export PATH=${JAVA_HOME}/bin:${PATH}
}

function jdk17(){
	export JAVA_HOME=$JAVA_17_HOME
	export PATH=${JAVA_HOME}/bin:${PATH}
}

######################################################################

# linux 平台 sdk 环境变量配置

# android Home
export ANDROID_HOME=~/Android/Sdk
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/16.1.4479499
# adb path
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmake/3.6.4111459/bin


# android ndk Home
#export ANDROID_NDK_HOME=/home/liut/Android/Sdk/ndk/16.1.4479499
# ndk path
export PATH=${PATH}:${ANDROID_NDK_HOME}:${ANDROID_NDK_HOME}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin

# 安卓相关
source "${LIUT_RC_HOME}/common/android.sh"


############################## gradle ###############################

#添加 gradle 的环境变量
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-3.3-all/55gk2rcmfc6p2dg9u9ohc3hw9/gradle-3.3
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-4.6-all/bcst21l2brirad8k2ben1letg/gradle-4.6
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-4.8-bin/divx0s2uj4thofgytb7gf9fsi/gradle-4.8
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-5.6.4-bin/bxirm19lnfz6nurbatndyydux/gradle-5.6.4
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-6.5-bin/6nifqtx7604sqp1q6g8wikw7p/gradle-6.5
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-7.4-bin/c0gwcg53nkjbqw7r0h0umtfvt/gradle-7.4
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-7.5.1-bin/7jzzequgds1hbszbhq3npc5ng/gradle-7.5.1
#export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-8.0-bin/ca5e32bp14vu59qr306oxotwh/gradle-8.0
export GRADLE_HOME=/home/zhhao/.gradle/wrapper/dists/gradle-8.2-bin/bbg7u40eoinfdyxsxr3z4i7ta/gradle-8.2

export PATH=$PATH:$GRADLE_HOME/bin

######################################################################


# 打开文件夹
function open() {
    xdg-open "$*" 2> /dev/null 1> /dev/null
}

######################################################################

# 回收站文件夹
export TRASH_PATH=~/.local/share/Trash/files
source "${LIUT_RC_HOME}/common/rm.sh"


# 更新
alias up="yay -Syyu --noconfirm"


