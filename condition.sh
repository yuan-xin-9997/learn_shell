#!/bin/bash
# 条件判断 test 或  []
:<<EOF
基本语法
（1）test condition
（2）[ condition ]（注意 condition 前后要有空格）
注意：条件非空即为 true，[ atguigu ]返回 true，[ ] 返回 false。
EOF

num1=100
num2=100
if test $num1 -eq $num2
then
  echo "success"
  fi

# 上下两种方式是等价的

if [ $num1 -eq $num2 ]
then
  echo "success"
  fi