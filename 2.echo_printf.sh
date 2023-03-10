#!/bin/bash

# echo 命令格式
echo "It is a test"
echo It is a test
echo "\"It is a test\""      # 转义
name=Chris
echo "$name is handsome"
echo -e "OK! \n"             # 显示换行 -e 开启转义
echo "It is a test" > myfile # 显示结果定向至文件
cat myfile
echo '$name\"'               # 原样输入字符串，不进行转义或取变量（使用单引号）
echo `date`                  # 显示命令执行结构

# echo 颜色显示，格式，左侧的\033[是固定格式，右侧的\33是固定格式，\033右边的设置相应格式
echo -e "\033[字背景颜色；文字颜色m 字符串（前后空格会反映到控制台） \033[0m"

echo -e "\033[30m黑色字\033[0"
echo -e "\033[31m红色字\033[0m"
echo -e "\033[32m 绿色字 \033[0m"
echo -e "\033[33m 黄色字 \033[0m"
echo -e "\033[34m 蓝色字 \033[0m"
echo -e "\033[35m 紫色字 \033[0m"
echo -e "\033[36m 天蓝字 \033[0m"
echo -e "\033[37m 白色字 \033[0m"

echo -e "\033[40;37m 黑底白字 \033[0m"
echo -e "\033[41;37m 红底白字 \033[0m"
echo -e "\033[42;37m 绿底白字 \033[0m"
echo -e "\033[43;37m 黄底白字 \033[0m"
echo -e "\033[44;37m 蓝底白字 \033[0m"
echo -e "\033[45;37m 紫底白字 \033[0m"
echo -e "\033[46;37m 天蓝底白字 \033[0m"
echo -e "\033[47;30m 白底黑字 \033[0m"

#\33[0m 关闭所有属性
#\33[1m 设置高亮度
#\33[4m 下划线
#\33[5m 闪烁
#\33[7m 反显
#\33[8m 消隐
#\33[30m — \33[37m 设置前景色
#\33[40m — \33[47m 设置背景色
#\33[nA 光标上移n行
#\33[nB 光标下移n行
#\33[nC 光标右移n行
#\33[nD 光标左移n行
#\33[y;xH设置光标位置
#\33[2J 清屏
#\33[K 清除从光标到行尾的内容
#\33[s 保存光标位置
#\33[u 恢复光标位置
#\33[?25l 隐藏光标
#\33[?25h 显示光标


# printf  设置输出格式
:<<EOF
%s %c %d %f 都是格式替代符
d: Decimal 十进制整数 – 对应位置参数必须是十进制整数，否则报错！
s: String 字符串 – 对应位置参数必须是字符串或者字符型，否则报错！
c: Char 字符 – 对应位置参数必须是字符串或者字符型，否则报错！
f: Float 浮点 – 对应位置参数必须是数字型，否则报错！
%-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐）,任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
%-4.2f 指格式化为小数，其中.2指保留2位小数。
EOF

printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876

