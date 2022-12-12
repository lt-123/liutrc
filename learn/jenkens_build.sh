#!/usr/bin/env bash

# 复制 local.properties
cp ~/asProjects/local.properties ./

execTask=""

# 是否 clean
if $jiaguOfficialRelease; then
  execTask="${execTask} clean"
fi

# 测试环境 debug 版本
if $InternalDebug; then
  execTask="${execTask} rID"
fi

# 生产环境 release 版本
if $OfficialRelease; then
  execTask="${execTask} rOR"
fi

# 生产环境 release 加固版本
if $jiaguOfficialRelease; then
  execTask="${execTask} jOR --no-daemon"
fi

# 保存到 ./tasks
echo $execTask >./tasks

echo $(cat ./tasks)

chmod +x ./gradlew

./gradlew $(cat ./tasks)
