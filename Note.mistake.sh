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

# 6. 容易混淆的符号   ref  https://blog.csdn.net/hanjinjuan/article/details/119086556
:<<EOF
 6.1 $() 与``命令的替换
 $( )和  ` ` 表示"命令的替换"
原理：将对反引号或$()里的内容先进行执行，然后将执行的结果代换到当前命令中
     在shell中fork一个子进程区做他们括起来的命令,然后在返回父进程
在编写脚本过程中尽量使用$( )来进行命令替换，理由如下：
🎈 ` `很容易与''搞混乱，尤其对初学者来说。
🎈 在多层次的复合替换中，` `必须要额外的转义字符处理（反斜线），而$( )比较直观。
🎈 $( )的弊端是，并不是所有的类unix系统都支持这种方式，但反引号是肯定支持的。

6.2 ${ } 变量替换
🎈一般情况下，$var与${var}是没有区别的，但是用${ }会比较精确的界定变量名称的范围
例如：
[root@localhost ~]# A=Linux
[root@localhost ~]# echo $AB      #表示变量AB

[root@localhost ~]# echo ${A}B    #表示变量A后连接着B
LinuxB
🎈${ }内部还支持"变量替换"、"变量截取"、"变量删除"

6.3 $[] 与$(()) 整数运算
它们是一样的，都是进行数学运算的。支持+ - * / %：分别为 “加、减、乘、除、取模”。但是注意，bash只能作整数运算，对于浮点数是当作字符串处理的。
例：
a=5
b=7
c=2

echo $(( a+b*c )) # 19
echo $(( (a+b)/c )) # 6
echo $(( (a*b)%c)) # 1
在 $(( )) 中的变量名称，可于其前面加 $ 符号来替换，也可以不用，如：
echo $(( $a + $b * $c)) # 19

a=0
echo $a
a=$[a+1]  # $[] 整数运算

: 6.4 [] 判断符号
即为test命令的另一种形式。
bash 的内部命令，[和test是等同的。如果我们不用绝对路径指明，通常我们用的都是bash自带的命令。if/test结构中的左中括号是调用test的命令标识，
右中括号是关闭条件判断的。这个命令把它的参数作为比较表达式或者作为文件测试，并且根据比较的结果来返回一个退出状态码。if/test结构中并不是必须
右中括号，但是新版的Bash中要求必须这样。
Test和[]中可用的比较运算符只有==和!=，两者都是用于字符串比较的，不可用于整数比较，整数比较只能使用-eq，-gt这种形式。无论是字符串比较还是整数
比较都不支持大于号小于号。如果实在想用，对于字符串比较可以使用转义形式，如果比较"ab"和"bc"：[ ab \ < bc ]，结果为真，也就是返回状态为0。
[ ]中的逻辑与和逻辑或使用-a 和-o 表示。
字符范围。用作正则表达式的一部分，描述一个匹配的字符范围。作为test用途的中括号内不能使用正则。
在数组中，中括号用来引用数组中每个元素的编号。下标
注意：
在括号两边各加一个空格，否则会报错。
test命令使用标准的数学比较符号来表示字符串的比较，而用文本符号来表示数值的比较。（数值比较：-eq、-gt）（字符串比较：）
大于符号或小于符号必须要转义，否则会被理解成重定向。

6.5. (( ))与[[ ]]
它们分别是[ ]的针对数学比较表达式和字符串表达式的加强版。
双小括号 (( ))
整数扩展。这种扩展计算是整数型的计算，不支持浮点型。((exp))结构扩展并计算一个算术表达式的值，如果表达式的结果为0，那么返回的退出状态码为1，
或者 是"假"，而一个非零值的表达式所返回的退出状态码将为0，或者是"true"。若是逻辑判断，表达式exp为真则为1,假则为0。
只要括号中的运算符、表达式符合C语言运算规则，都可用在$((exp))中，甚至是三目运算符。作不同进位(如二进制、八进制、十六进制)运算时，输出结果
全都自动转化成了十进制。如：echo $((16#5f)) 结果为95 (16进位转十进制)
单纯用 (( )) 也可重定义变量值，比如 a=5; ((a++)) 可将 $a 重定义为

常用于算术运算比较，双括号中的变量可以不使用 $ 符号前缀。括号内支持多个表达式用逗号分开。 只要括号中的表达式符合C语言运算规则, 比
如可以直接使用for((i=0;i<5;i++)), 如果不使用双括号, 则为for i in ` seq 0 4 `或者for i in {0…4}。
再如可以直接使用if (($i<5)), 如果不使用双括号, 则为if [ $i -lt 5 ]

双中括号[[ ]]
[[是 bash 程序语言的关键字。并不是一个命令，[[ ]] 结构比[ ]结构更加通用。在[[和]]之间所有的字符都不会发生文件名扩展或者单词分割，
但是会发生参数扩展和命令替换。

支持字符串的模式匹配，使用=~操作符时甚至支持shell的正则表达式。字符串比较时可以把右边的作为一个模式，而不仅仅是一个字符串，比如[[ hello =
= hell? ]]，结果为真。[[ ]] 中匹配字符串或通配符，不需要引号。

使用[[ … ]]条件判断结构，而不是[ … ]，能够防止脚本中的许多逻辑错误。比如，&&、||、<和> 操作符能够正常存在于[[ ]]条件判断结构中，但是如果
出现在[ ]结构中的话，会报错。 比如可以直接使用if [[ $a != 1 && $a != 2 ]], 如果不适用双括号, 则为if [ $a -ne 1] && [ $a != 2 ]或
者if [ $a -ne 1 -a $a != 2 ]。

bash把双中括号中的表达式看作一个单独的元素，并返回一个退出状态码。

6.6 ()与{}的区别
相同点：

()和{}都是把一串的命令放在括号里面，如果命令在一行，则命令之间用;隔开
不同点：

()只是把一串命令重新开一个子shell进行执行，不影响当前shell环境；{}对一串命令在当前shell执行,影响当前shell环境
()最后一个命令不用分号，{}最后一个命令要用分号
()里的第一个命令和左边括号不必有空格，{}的第一个命令和左括号之间必要要有一个空格
()和{}中括号里面的某个命令的重定向只影响改名了，但括号外的重定向则影响到括号里的所有命令

[root@bogon t]# var=test
[root@bogon t]# echo $var
test
[root@bogon t]# (var=notest;echo $var)
notest
[root@bogon t]# echo $var
test
[root@bogon t]# { var=notest;echo $var;}
notest
[root@bogon t]# echo $var
notest

6.7 ==与=的区别
== 可用于判断变量是否相等，= 除了可用于判断变量是否相等外，还可以表示赋值。
= 与 == 在 [ ] 中表示判断(字符串比较)时是等价的

[root@manager day5]# s1="foo"
[root@manager day5]# s2="foo"
[root@manager day5]# [ $s1=$2 ] && echo "equal"
equal
[root@manager day5]# [ $s1==$2 ] && echo "equal"
equal

在 (( )) 中 = 表示赋值， == 表示判断(整数比较)，它们不等价
[root@manager day5]# ((n=5))
[root@manager day5]# echo $n
5
[root@manager day5]# ((n==5)) && echo "equal"
equal

补充：
=~ 的作用：测试 =~ 左侧的字符串能否被右侧的 PATTERN 所匹配。
注意：此表达式一般用于 [[ ]] 中！

root@zhengzelin:~# echo $a
abc
root@zhengzelin:~# [[ $a =~ ^[a-z]+$ ]];echo $?
0

root@zhengzelin:~# a=1
root@zhengzelin:~# [[ $a =~ [a-z] ]];echo $?
1

其中：
第一个： 当 $a=abc 的时候，符合右边的 PATTERN : ^[a-z]+$  #(以小写字母开头，并且不止一个小写字母，并且以小写字母结尾！)
第二个 $a 就是 1，不符合那个 PATTERN。
EOF

a=5
b=7
c=2
echo $((a+b*c)) # 19
echo $(( (a+b)/c )) # 6
echo $(( (a*b)%c)) # 1
echo $(( $a + $b * $c )) # 19

# 7. 截取字符串 #*/     %/*   ##*
:<<EOF
${str#*/}  表示从左往右取str第一个“/”分隔符之右边的所有内容；
${str%/*} 表示从左往右取str最后一个“/”分隔符之左边的所有内容；
${file##*/}：删掉str最后一个 /  及其左边的字符串
例如：
下面两个echo，依次输出：
ZW_SX/ed_cr/fv_123
QA/ZW_SX/ed_cr
fv_123
EOF
table=QA/ZW_SX/ed_cr/fv_123
echo ${table#*/}
echo ${table%/*}
echo ${table##*/}

