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
  echo 1111
  ;;
"Linux")
  echo 2222
  ;;
"MINGW")
  echo 333
  ;;
esac

echo $OS_TYPE


#workdir=$(
#  cd $(dirname $0)
#  pwd
#)
#
#echo $workdir
#
#echo $0
#
#echo $(dirname $0)
#
#dirname $0
#
#
#if [ ! `where adb` ]; then
#    echo 'no adb'
#fi
