#!/usr/bin/env bash

# 出错后停止
#set -e

LIUT_HOME=${HOME}/.liut
LIUT_RC_HOME=${LIUT_HOME}/liutrc

# 复制 liutrc 到

if test ! -d ${LIUT_RC_HOME}; then
  mkdir ${LIUT_RC_HOME}
  echo "创建 ${LIUT_RC_HOME} 文件夹"
fi

# 复制所有到 .liut
dn=$(dirname $0)
cp -r ${dn}/* ${LIUT_RC_HOME}/
unset dn

cd ${LIUT_RC_HOME}/

echo "LIUT_RC_HOME `pwd`"

ls -l

# shellcheck source=.liut/liutrc.sh
source ${LIUT_RC_HOME}/liutrc.sh

echo "检查 zshrc/bashrc"

############检查 zshrc#############
if [ -e ${HOME}/.zshrc ]; then
  liutrc_line=$(cat ${HOME}/.zshrc | grep 'liutrc.sh')
fi

# 此处路径不能用 LIUT_RC_HOME ！！！！
if [ "$liutrc_line" != 'source ${HOME}/.liut/liutrc/liutrc.sh' ]; then
  {
    echo ''
    echo '# liutrc'
    echo 'source ${HOME}/.liut/liutrc/liutrc.sh'
  } >>${HOME}/.zshrc

  echo "${HOME}/.zshrc 已处理"
else
  echo "${HOME}/.zshrc 无需处理"
fi

unset liutrc_line


############检查 bashrc#############
if [ -e ${HOME}/.bashrc ]; then
  liutrc_line=$(cat ${HOME}/.bashrc | grep 'liutrc.sh')
fi

# 此处路径不能用 LIUT_RC_HOME ！！！！
if [ "$liutrc_line" != 'source ${HOME}/.liut/liutrc/liutrc.sh' ]; then
  {
    echo ''
    echo '# liutrc'
    echo 'source ${HOME}/.liut/liutrc/liutrc.sh'
  } >>${HOME}/.bashrc

  echo "${HOME}/.bashrc 已处理"
else
  echo "${HOME}/.bashrc 无需处理"
fi

unset liutrc_line



############


echo '操作完成'
