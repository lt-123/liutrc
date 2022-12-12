#!/usr/bin/env bash

echo "----------------------变量------------------------------"

# 只读变量
readonly rd_test="hello world"
# 定义变量， 直接用等号赋值，命名和Python相似
liut="liut.xyz"

# 使用变量
echo ${liut}
# 使用变量 可省略花括号
echo $rd_test

# 清除变量
unset liut

echo "----------------------字符串-----------------------------"

# 字符串拼接
hello="hello"
echo "${hello} world!!"

echo "----------------------数组------------------------------"

# 数组 用括号表示
array_name=(value0 value1 value2 value3)
# 还有这种操作
array_name[0]=2222
array_name[1]=qwwww

# 读取数组 根据下标
valuen=${array_name[1]}
echo ${valuen}
# 读取所有数据 使用*或@
echo ${array_name[*]}
echo ${array_name[@]}

echo "---------------------Shell 传递参数-----------------------"

# 参数处理	说明
# $#	传递到脚本的参数个数
# $*	以一个单字符串显示所有向脚本传递的参数。
#       如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
# $$	脚本运行的当前进程ID号
# $!	后台运行的最后一个进程的ID号
# $@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
#       如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
# $-	显示Shell使用的当前选项，与set命令功能相同。
# $?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。

echo "参数个数: $#"
echo "所有参数: $@"
echo "所有参数（字符串）: $*"
echo "文件名: $0"
echo "第1个参数: $1"
echo "第2个参数: $2"
echo "当前进程ID: $$"

# 使用 $? 判断上条命令是否执行成功
if [[ $? -ne 0 ]]; then
  echo "failed"
else
  echo "succeed"
fi
