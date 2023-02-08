#!/bin/bash

funcA(){
  echo "$0"
  echo "第一个参数为 $1"
  echo "第二个参数为 $2"
  echo "第三个参数为 $3"

  echo "第十个参数为 ${10}"
  echo "第十一个参数为 ${11} "
  echo "参数总共有 $#"
  echo "作为一个字符串输出所有参数 $*"
}
funcA 1 2 3 4 5 6 7 8 9 34 73

# 当echo传递参数数量以上的参数的时候，会直接输出空，下面的函数输出结果为：
# 第一个参数为 1
# 第二个参数为 2
# 第三个参数为
funcB(){
  echo "第一个参数为 $1"
  echo "第二个参数为 $2"
  echo "第三个参数为 $3"
}
funcB 1 2