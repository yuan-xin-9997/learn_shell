#!/bin/sh

# sleep命令 和 wait命令
# ref: https://zhuanlan.zhihu.com/p/522310120

# Linux 中的sleep和wait命令允许你以选定的速度运行命令或在等待任务完成后捕获并显示任务的退出状态。sleep只是在命令之间插入一个定时暂停。wait命令在完成后才通知它已完成。


## Sleep命令

:<< EOF
sleep 命令会暂停指定的时间。它通常用于脚本中，但也适用于命令行。在下面的示例中，
sleep 在两个 date 命令之间暂停30秒。
[root@localhost ~]# date ; sleep 30 ; date
Thu Nov 11 05:06:44 EST 2021
Thu Nov 11 05:07:14 EST 2021

sleep 命令将数字参数作为秒数。但也可以通过在参数中添加一个字符来让它休眠不同的时间：
10s = 10 seconds
1m = 1 minute
2h = 2 hours
3d = 3 days
[root@localhost ~]# date ; sleep 10s ; date
Thu Nov 11 05:11:09 EST 2021
Thu Nov 11 05:11:19 EST 2021

睡眠时间也可以小于1秒钟，就是在数字前面加一个..
.1 = 十分之一秒
.01 = 百分之一秒
.001 = 千分之一秒
[root@localhost ~]# date ; sleep .1 ; date
Thu Nov 11 05:14:03 EST 2021
Thu Nov 11 05:14:03 EST 2021

sleep 命令通常用于定期运行命令，例如每 10 秒或每分钟一次，当你想要监视某些活动时。
例如，可能正在等待同事登录文件服务器。您可能会运行这样的命令：
[root@localhost ~]# while true ; do who ; sleep 100 ; done

可以观察内存使用情况的变化。
[root@localhost ~]# while true ; do free -h ; sleep 5 ; done
EOF


## wait 命令

# wait 命令在等待后台进程完成后捕获后台进程的退出状态。您也可以在脚本中使用它。

# 用法1： wait [指定进程号]

# test1.sh
:<< EOF
#!/bin/bash
sleep 10 &
process_id=$!
echo “PID: $process_id”
date
wait $process_id
date
echo “Exit status: $?”
EOF

# test2.sh
:<< EOF
#!/bin/bash
sleep 5 &
process_id=$!
echo “PID: $process_id”
date
wait
date
echo “Exit status: $?”
EOF

# test3.sh
:<< EOF
#!/bin/bash
sleep 5 &
sleep 10 &
process_id=$!
echo “PID: $process_id”
date
wait
date
echo “Exit status: $?”
EOF

# test4.sh
:<< EOF
#!/bin/bash
sleep 10 &
sleep 5 &
process_id=$!
echo “PID: $process_id”
date
wait
date
echo “Exit status: $?”
EOF

# test5.sh
:<< EOF
#!/bin/bash
sleep 10 &
sleep 5 &
process_id=$!
echo “PID: $process_id”
date
wait $PID
date
echo “Exit status: $?”
EOF

# 第一行在后台启动 sleep 命令。
# 第二行获取最近执行的后台进程的进程 ID $!。
# 然后脚本显示该信息，等待该进程完成并显示退出状态。

:<<EOF
test1.sh 脚本执行的输出结果为：
“PID: 16721”
Tue Jan 16 15:06:59 CST 2024
Tue Jan 16 15:07:09 CST 2024
“Exit status: 0”

test2.sh 脚本执行的输出结果为：
“PID: 16784”
Tue Jan 16 15:07:49 CST 2024
Tue Jan 16 15:07:54 CST 2024
“Exit status: 0”

test3.sh 脚本执行的输出结果为：
“PID: 16981”
Tue Jan 16 15:10:41 CST 2024
Tue Jan 16 15:10:51 CST 2024
“Exit status: 0”

test4.sh 脚本执行的输出结果为：
“PID: 17359”
Tue Jan 16 15:16:49 CST 2024
Tue Jan 16 15:16:59 CST 2024
“Exit status: 0”

test5.sh 脚本执行的输出结果为：
“PID: 17455”
Tue Jan 16 15:18:29 CST 2024
Tue Jan 16 15:18:39 CST 2024
“Exit status: 0”

从上面可以看出 wait 后面如果加进程号，则是等待进程号的进程执行完之后，再执行wait后面的代码（如果有更长时间的进程没有执行完，则也会等待该进程）；
如果不加进程号，则是等待进程执行时间最长的进程结束后，再执行wait后面的代码；
EOF

# 用法2：wait 指定作业号

:<<EOF
运行一个sleep进程
sleep 10s &
[1] 27156

指定作业号
wait %1       #等待作业号为1的作业完成
[1]+  Done                    sleep 10s
EOF

# 用法3：wait -n  等待【无效选项】

# test6.sh
:<<EOF
#!/bin/bash
sleep 15 &
sleep 9 &
sleep 6 &
wait -n
echo “First job has been completed.”
EOF
