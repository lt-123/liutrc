#!/usr/bin/env bash

#######################################
# 通过 source 使用， 需存在 TRASH_PATH
#######################################

# 检查是否存在变量 TRASH_PATH （回收站文件夹是否存在）
if [ ! $TRASH_PATH ]; then
  echo "no TRASH_PATH"
  return 1
fi

# 如果文件夹不存在 则创建
if [ ! -d $TRASH_PATH ]; then
  mkdir -p "$TRASH_PATH"
fi

# 安全删除 （移动到回收站）
function rm() {

  # 遍历参数文件
  for file in $*; do
    delete_file="$(pwd)/$file"

    if test ! -r "$delete_file"; then
      echo "文件 ${file} 不存在"
    else
      if test -e "${TRASH_PATH}${file}"; then
        rm_date=$(date "+%Y%m%d%H%M%S")

        mv "${delete_file}" "${TRASH_PATH}${file}-${rm_date}"

        echo "safe rm $delete_file-${rm_date}"
        unset rm_date
      else
        mv "${delete_file}" $TRASH_PATH
        echo "safe rm $delete_file"
      fi
    fi

  done
}

# 原始的 rm 命令
function rrm() {
    /usr/bin/rm "$*"
    echo "已删除 $*"
}
