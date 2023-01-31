#!/bin/bash
# Shell 数组
:<<EOF
数组中可以存放多个值。Bash Shell 只支持一维数组（不支持多维数组），初始化时不需要定义数组大小（与 PHP 类似）。
与大部分编程语言类似，数组元素的下标由 0 开始。Shell 数组用括号来表示，元素用"空格"符号分割开。

创建数组
array_name=(value1 value2 ... valuen)

读取数组
读取数组元素值的一般格式是：${array_name[index]}

获取数组中的所有元素
使用 @ 或 * 可以获取数组中的所有元素。

获取数组的长度
获取数组长度的方法与获取字符串长度的方法相同，例如：
echo "数组元素个数为: ${#my_array[*]}"
echo "数组元素个数为: ${#my_array[@]}"

关联数组（类似于Python字典）
Bash 支持关联数组，可以使用任意的字符串、或者整数作为下标来访问数组元素。关联数组使用 declare 命令来声明，语法格式如下：
declare -A array_name
-A 选项就是用于声明一个关联数组。关联数组的键是唯一的。
declare -A site
site["google"]="www.google.com"
site["runoob"]="www.runoob.com"
site["taobao"]="www.taobao.com"
echo ${site["runoob"]}
EOF

my_array=(A B "C" D)
echo ${my_array}  # 无效，默认获取数组第1个元素？
echo "第一个元素为: ${my_array[0]}"
echo "第二个元素为: ${my_array[1]}"
echo "第三个元素为: ${my_array[2]}"
echo "第四个元素为: ${my_array[3]}"

echo "数组的元素为: ${my_array[*]}"
echo "数组的元素为: ${my_array[@]}"

echo "数组元素个数为: ${#my_array[*]}"
echo "数组元素个数为: ${#my_array[@]}"

echo "-- \$* 演示 ---"
for i in "${my_array[*]}"; do
 echo $i
done

echo "-- \$@ 演示 ---"
for i in "${my_array[@]}"; do
 echo $i
done

declare -A site
site["google"]="www.google.com"
site["runoob"]="www.runoob.com"
site["taobao"]="www.taobao.com"

echo ${site["runoob"]}
