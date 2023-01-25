#!/bin/bash
# 算术运算符
# 原生 bash 不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
# expr 是一款表达式计算工具，使用它能完成表达式的求值操作。
echo "2加2等于`expr 2 + 2`"
echo "2减2等于`expr 2 - 2`"
echo "2乘2等于`expr 2 \* 2`"
echo "2除2等于`expr 2 / 2`"
echo "2除2取余$(expr 2 % 2)"

# 关系运算符
a=10
b=20
if [ $a -eq $b ]; then # 检测两个数是否相等，相等返回 true。
echo "a=b"
else
  echo "a!=b"
fi
if [ $a -ne $b ]; then # 检测两个数是否不相等，不相等返回 true。
echo "a!=b"
else
  echo "a=b"
  fi
if [ $a -gt $b ] # 检测左边的数是否大于右边的，如果是，则返回 true。
then
  echo "a>b"
  else
    echo "a<=b"
    fi
if [ $a -lt $b ] # 检测左边的数是否小于右边的，如果是，则返回 true。
then
  echo "a<b"
  else
    echo "a>=b"
    fi
if [ $a -ge $b ] # 检测左边的数是否大于等于右边的，如果是，则返回 true。
then
  echo "a>=b"
  else
    echo "a<b"
    fi
if [ $a -le $b ] # 检测左边的数是否小于等于右边的，如果是，则返回 true。
then
  echo "a<=b"
  else
    echo "a>b"
    fi

# 布尔运算符
#if [ ! false ]       # 非运算，返回 true
#then
#  echo "True"
#  else
#    echo "False"
#    fi
#if [ true -o false ] # 或运算，返回 true
#then
#  echo "True"
#  else
#    echo "False"
#    fi
#if [ true -a false ] # 与运算，返回 false
#then
#  echo "2 True"
#  else
#    echo "not 2 True"
#    fi
a=10
b=20

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi

# 逻辑运算符。 [ ]中使用-a和-o表示逻辑与和逻辑或，[[ ]]使用&&和||来表示
a=10
b=20

if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

# 字符串运算符
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi

# 文件测试运算符
:<<EOF
操作符	说明	举例
-b file	检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
-c file	检测文件是否是字符设备文件，如果是，则返回 true。	[ -c $file ] 返回 false。
-d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
-f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
-g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
-k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
-p file	检测文件是否是有名管道，如果是，则返回 true。	[ -p $file ] 返回 false。
-u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
-r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
-w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
-x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。
-s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
-e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。
其他检查符：
-S: 判断某文件是否 socket。
-L: 检测文件是否存在并且是一个符号链接。
EOF

# 变量 file 表示文件 ./test.sh，它的大小为 70 字节，具有 rwx 权限。下面的代码，将检测该文件的各种属性
file="./test.sh"
if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi