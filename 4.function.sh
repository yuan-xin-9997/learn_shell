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