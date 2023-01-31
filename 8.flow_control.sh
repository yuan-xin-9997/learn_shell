#!/bin/bash

# if 条件判断语句
a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi

loop(){
  # for 循环语句1（类似Python风格）
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

for i in $@
do
  echo $i
  done

# for 循环语句2（C语言风格）
for((i=1;i<=2;i++))
do
echo $i
done

# for 循环语句3
for i in {1..5}; do
    echo "Welcome $i"
done
}

loop a b c d  e

# while 循环语句
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
sum=0
i=1
while [ $i -le 100 ]
do
sum=$[$sum + $i]
i=$[ $i + 1 ]
done
echo $sum

# case 条件判断语句
echo '输入1到4之间的数字'
echo '你输入的数字为：'
read aNum
case $aNum in
1)
 echo '你输入了1'
  ;;
2)
  echo '你输入了2'
  ;;
3) echo '你输入了3'
  ;;
4) echo '你输入了4'
  ;;
*) echo '输入错误'
esac

# break 语句
while :
do
  echo -n "输入1到5之间的数字："
  read bNum
  case $bNum in
  1|2|3|4|5)
  echo "你输入的数字为$bNum!"
    ;;
  *) echo "输入错误，将退出"
    break;;
  esac
  done

# continue 语句
while :
do
    echo -n "输入 1 到 5 之间的数字: "
    read cNum
    case $cNum in
        1|2|3|4|5)
        echo "你输入的数字为 $cNum!"
        break
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的!"
            continue
            echo "游戏结束"
        ;;
    esac
done

# until 语句
a=0
until [ $a -gt 10 ]
do
  echo "a的值为 $a"
  # 实现a自增1
  let a++
  done