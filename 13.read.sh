#!/bin/bash
# 读取控制台的输入
:<<EOF
read命令 从键盘读取变量的值，通常用在shell脚本中与用户进行交互的场合。该命令可以一次读取多个变量的值，变量和输入的值都需要使用空格隔开。
在read命令后面，如果没有指定变量名，读取的数据将被自动赋值给特定的变量REPLY

语法
read(选项)(参数)
选项
-p：指定读取值时的提示符；
-t：指定读取值时等待的时间（秒）。

参数
变量：指定读取值的变量名。
EOF

read name
# 从标准输入读取输入并赋值给变量name（参数指定了）。
echo "your input is ${name}"

read
# 从标准输入读取一行并赋值给特定变量REPLY（参数未指定）。
echo "your innput is ${REPLY}"

read  -p "请输入您的名字：" your_name  # 参数必须放后面
#打印提示（text），等待输入，并将输入存储在REPLY中。
echo "your name is ${your_name}"

sec=3
read  -p "请在${sec}秒内输入您的名字：" -t $sec your_name  # 参数必须放后面
echo "your name is ${your_name}"
#指定读取等待时间为3秒。

#read -a arrayname    把单词清单读入arrayname的数组里。
echo -n  "Input muliple values into an array:"
read -a array
echo  "get ${#array[@]} values in array"
