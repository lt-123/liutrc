#!/usr/bin/env bash

# 出错后停止
#set -e

# 复制 liutrc 到

if test ! -d ${HOME}/.liut; then
  mkdir ${HOME}/.liut
  echo "创建 ${HOME}/.liut 文件夹"
fi

# 复制所有到 .liut
dn=$(dirname $0)
cp -r ${dn}/* ${HOME}/.liut/
unset dn

cd ${HOME}/.liut/

echo "LIUT_RC_HOME `pwd`"

ls -l

# shellcheck source=.liut/liutrc.sh
source ${HOME}/.liut/liutrc.sh

echo "检查 zshrc/bashrc"

############检查 zshrc#############
if [ -e ${HOME}/.zshrc ]; then
  liutrc_line=$(cat ${HOME}/.zshrc | grep 'liutrc.sh')
fi

if [ "$liutrc_line" != 'source ${HOME}/.liut/liutrc.sh' ]; then
  {
    echo ''
    echo '# liutrc'
    echo 'source ${HOME}/.liut/liutrc.sh'
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

if [ "$liutrc_line" != 'source ${HOME}/.liut/liutrc.sh' ]; then
  {
    echo ''
    echo '# liutrc'
    echo 'source ${HOME}/.liut/liutrc.sh'
  } >>${HOME}/.bashrc

  echo "${HOME}/.bashrc 已处理"
else
  echo "${HOME}/.bashrc 无需处理"
fi

unset liutrc_line



############


echo '操作完成'
