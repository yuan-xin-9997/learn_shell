#!/bin/bash
### return 关键字
:<<EOF
return [n]
从函数中退出并返回数值。
使得shell函数退出并返回数值，如果没有指定n的值，则默认为函数最后一条命令执行的返回状态。
返回值为你指定的参数n的值，如果你指定的参数大于255或小于0，那么会通过加或减256的方式使得返回值总是处于0到255之间。
在函数外执行return语句会返回失败。

使用$?来查看函数返回的值。若return后为空，则默认$?输出函数执行状态即退出状态exit status），执行成功则输出0

exit与return的区别   ref https://www.jb51.net/article/159107.htm   https://blog.csdn.net/dfu65065/article/details/102340408
（1）作用不同。exit用于在程序运行的过程中随时结束程序，exit的参数是返回给OS的。exit是结束一个进程，它将删除进程使用的内存空间，
            同时把错误信息返回父进程。而return是返回函数值并退出函数；
（2）语义层级不同。return是语言级别的，它表示了调用堆栈的返回；而exit是系统调用级别的，它表示了一个进程的结束；
（3）使用方法不用。return一般用在函数方法体内，exit可以出现在Shell脚本中的任意位置。

相同：
(1) 获取。均使用$?获取命令或函数的退出码或返回值
EOF

returnFunc(){
  return 100
}
returnFunc
echo $?

returnFunc1(){
  return 256
}
returnFunc1
echo $?

returnFunc2(){
  return
}
returnFunc2
echo $?


### 获取函数返回值   ref   https://blog.csdn.net/liulanba/article/details/115294882

returnFunc(){
  return 120
}
returnFunc
res=$(echo $?)  # 将函数返回值赋值给变量res，$()进行变量替换，由于return限制，只能获取0-255之间的返回值，且为整数
echo $res

:<<EOF
必须使用$?获取函数返回值，如果修改为
res=`returnFunc`
则无法获取返回值
2.返回值必须为整型，如果修改为浮点数或者字符串，则会报错numeric argument required
EOF

# 使用echo：通过输出到标准输出返回,因为子进程会继承父进程的标准输出，因此，子进程的输出也就直接反应到父进程,而且返回值不受只能是整型的限制
function test(){
echo "123.12"
}
kk=$(test)
echo $kk