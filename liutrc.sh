#!/usr/bin/env bash

# 当前系统类型
OS_TYPE=$(uname)

# MSYS 特殊处理
if [ $(echo "$OS_TYPE" | grep 'MSYS') ]; then
  OS_TYPE='MSYS'
fi

# mingw 特殊处理
if [ $(echo "$OS_TYPE" | grep 'MINGW') ]; then
  OS_TYPE='MINGW'
fi

# readonly OS_TYPE
export OS_TYPE

LIUT_HOME=${HOME}/.liut
export LIUT_RC_HOME=${LIUT_HOME}/liutrc

# 系统相关
case ${OS_TYPE} in
"Darwin")
  # shellcheck source=.liut/sys/darwin.sh
  source "${LIUT_RC_HOME}/sys/darwin.sh"
  ;;
"Linux")
  # shellcheck source=.liut/sys/linux.sh
  source "${LIUT_RC_HOME}/sys/linux.sh"
  ;;
"MSYS")
  # 使用 windows HOME 方法: 修改文件 /etc/nsswitch.conf 中 db_home: windows
  # shellcheck source=.liut/sys/mingw.sh
  source "${LIUT_RC_HOME}/sys/msys.sh"
  ;;
"MINGW")
  # shellcheck source=.liut/sys/mingw.sh
  source "${LIUT_RC_HOME}/sys/mingw.sh"
  ;;
esac

# 通用
# shellcheck source=.liut/common/common_func.sh
source "${LIUT_RC_HOME}/common/common_func.sh"

# 通用(个人私有)
# shellcheck source=.liut/common/private.sh
source "${LIUT_RC_HOME}/common/private.sh"

# 更新
source "${LIUT_RC_HOME}/upgrade.sh"
