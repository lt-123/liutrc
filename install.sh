#!/usr/bin/env bash

set -xue

LIUT_HOME=${HOME}/.liut
LIUT_RC_HOME=${LIUT_HOME}/liutrc

git clone https://github.com/lt-123/liutrc.git "$LIUT_RC_HOME"

ls -l "$LIUT_RC_HOME"

source "${LIUT_RC_HOME}"/liutrc.sh

echo "检查 zshrc/bashrc"

############检查 zshrc#############
if [ -e "${HOME}"/.zshrc ]; then
  liutrc_line=$(cat ${HOME}/.zshrc | grep 'liutrc.sh') || "false"
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
if [ -e "${HOME}"/.bashrc ]; then
  liutrc_line=$(cat ${HOME}/.bashrc | grep 'liutrc.sh') || "false"
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
