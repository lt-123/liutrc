#!/usr/bin/env bash

# 当前系统类型
OS_TYPE=$(uname)

# mingw 特殊处理
if [ $(echo "$OS_TYPE" | grep 'MINGW') ]; then
  OS_TYPE='MINGW'
fi

# readonly OS_TYPE
export OS_TYPE
export LIUT_RC_HOME="${HOME}/.liut"

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
"MINGW")
  # shellcheck source=.liut/sys/mingw.sh
  source "${LIUT_RC_HOME}/sys/mingw.sh"
  ;;
esac

# 通用
# shellcheck source=.liut/common/commin_func.sh
source "${LIUT_RC_HOME}/common/commin_func.sh"

# 通用(个人私有)
# shellcheck source=.liut/common/private.sh
source "${LIUT_RC_HOME}/common/private.sh"
