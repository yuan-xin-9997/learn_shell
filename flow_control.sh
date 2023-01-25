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

# for 循环语句
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

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


# break 语句


# continue 语句


# until 语句