#!/bin/bash
# 例举Shell中容易犯的错，由于Shell语法符号较为繁多，容易混淆，且较为苛刻

# 1. 双引号 vs 单引号，前者会将引号里面的变量进行输出，后者不会
num=1
echo "双引号：$num"
echo '单引号：$num'

# 2. while无限循环语句，后面应有空格，若没空格，会报错
while :
do
echo "循环一次，就退出"
break
done

# 3.完成其他编程语言中的a=a+1，自增自减的操作
# 错误写法：
#   a=a+1
#   $a=$a+1
# 正确写法
a=0
a=`expr $a + 1`  # 命令替换
echo $a
a=$((a+1))  # $((表达式)) 整数运算
echo $a
a=$[a+1]  # $[] 整数运算
echo $a
let a++   # let命令，简单的计算器，执行算术表达式
echo $a
let a+=1  # let命令，简单的计算器，执行算术表达式
echo $a
((a++))  # 扩展整数计算
echo $a

# 4.空命令 :
# ref https://tool.4xseo.com/article/207453.html

# 5. shell当中没有数据类型的概念，也无法用type获取变量的数据类型（Python），更没有面向对象的内容
