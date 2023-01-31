#!/bin/bash
:<<EOF
Shell 退出码 exit status
使用$?获取命令或函数退出码
EOF

function myfun()
{
    if [ $# -lt 2 ]
    then
       echo "function para num error"
       exit 1
    fi
    echo "ok"
    exit 2
}
if [ $# -lt 1 ]
then
   echo "script para num error"
    exit 1
fi

res=`myfun aa`
code=$(echo $?)  # 获取函数exit退出码（exit status）
echo $code
echo "end shell"
exit 100

:<<EOF
这里需要特别注意的一点是，使用
returnVal=`myfun aa`
这样的句子执行函数，即便函数里面有exit，它也不会退出脚本执行，而只是会退出该函数，这是因为exit是退出当前进程，
而这种方式执行函数，相当于fork了一个子进程，因此不会退出当前脚本。最终结果就会看到，无论你的函数参数是什么最后end shell都会打印。

若使用myfunc aa这种方式执行函数，则myfunc里面的exit会退出当前进程，也就是最后的end shell不会打印

在当前脚本目录下执行：
./test.sh 1111
echo $?
100
EOF
