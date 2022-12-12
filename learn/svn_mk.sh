#!/usr/bin/env bash

# 自动创建SVN目录

for i in $(seq 16 31); do
  v=${i}
  if [ ${i} -lt 10 ]; then
    v="0${i}"
  fi
  eval "svn mkdir -m \"auto make build dirs -----------liut2\" \"https://192.168.100.200/svn/%E7%89%88%E6%9C%AC%E4%BB%8B%E8%B4%A8/%E7%BB%BF%E8%89%B2%E5%86%9B%E8%90%A5/201806${v}/Android\""
  echo "${v} done..."
done
