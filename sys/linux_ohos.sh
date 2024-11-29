#!/usr/bin/env bash


COMMANDLINE_TOOL_DIR=/home/liut/hmos #命令行工具的安装目录

#配置hvigor、ohpm环境变量
export PATH=${COMMANDLINE_TOOL_DIR}/command-line-tools/bin:$PATH

#配置hdc环境变量
export HDC_HOME=${COMMANDLINE_TOOL_DIR}/command-line-tools/sdk/HarmonyOS-NEXT-DB1/openharmony/toolchains #设置hdc工具的环境变量，hdc工具在toolchains所在路径下，请以实际路径为准
export PATH=$HDC_HOME:$PATH


# 进入package目录安装依赖
function ohpm_install {
    cd $1 || exit
    ohpm install
}

