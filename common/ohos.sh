#!/usr/bin/env bash

#配置hvigor、ohpm环境变量
export PATH=${COMMANDLINE_TOOL_DIR}/command-line-tools/bin:$PATH

#配置hdc环境变量
export HDC_HOME=${COMMANDLINE_TOOL_DIR}/command-line-tools/sdk/default/openharmony/toolchains #设置hdc工具的环境变量，hdc工具在toolchains所在路径下，请以实际路径为准
export PATH=$HDC_HOME:$PATH


# 进入package目录安装依赖
function ohpm_install {
    cd $1 || exit
    ohpm install
}

