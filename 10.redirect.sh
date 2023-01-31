#!/bin/bash
# 重定向
:<<EOF
Linux 中标准的输入设备默认指的是键盘，标准的输出设备默认指的是显示器。而本节所要介绍的输入、输出重定向，完全可以从字面意思去理解，也就是：
输入重定向：指的是重新指定设备来代替键盘作为新的输入设备；
输出重定向：指的是重新指定设备来代替显示器作为新的输出设备。
通常是用文件或命令的执行结果来代替键盘作为新的输入设备，而新的输出设备通常指的就是文件。
EOF

# 输入重定向
:<<EOF
命令符号格式      	      作用
命令 < 文件 	            将指定文件作为命令的输入设备
命令 << 分界符	          表示从标准输入设备（键盘）中读入，直到遇到分界符才停止（读入的数据不包括分界符），这里的分界符其实就是自定义的字符串
命令 < 文件 1 > 文件 2	  将文件 1 作为命令的输入设备，该命令的执行结果输出到文件 2 中。
EOF

:<<EOF
【例 1】
默认情况下，cat 命令会接受标准输入设备（键盘）的输入，并显示到控制台，但如果用文件代替键盘作为输入设备，那么该命令会以指定的文件作为输入设备，
并将文件中的内容读取并显示到控制台。
以 /etc/passwd 文件（存储了系统中所有用户的基本信息）为例，执行如下命令：
[root@localhost ~]# cat /etc/passwd
#这里省略输出信息，读者可自行查看
[root@localhost ~]# cat < /etc/passwd
#输出结果同上面命令相同
注意，虽然执行结果相同，但第一行代表是以键盘作为输入设备，而第二行代码是以 /etc/passwd 文件作为输入设备。
EOF

:<<EOF
【例 2】

[root@localhost ~]# cat << 0
>c.biancheng.net
>Linux
>0
c.biancheng.net
Linux
可以看到，当指定了 0 作为分界符之后，只要不输入 0，就可以一直输入数据。
EOF

:<<EOF
【例 3】
首先，新建文本文件 a.tx，然后执行如下命令：

[root@localhost ~]# cat a.txt
[root@localhost ~]# cat < /etc/passwd > a.txt
[root@localhost ~]# cat a.txt
#输出了和 /etc/passwd 文件内容相同的数据

可以看到，通过重定向 /etc/passwd 作为输入设备，并输出重定向到 a.txt，最终实现了将 /etc/passwd 文件中内容复制到 a.txt 中。
EOF

# 输出重定向

:<<EOF
相较于输入重定向，我们使用输出重定向的频率更高。并且，和输入重定向不同的是，输出重定向还可以细分为标准输出重定向和错误输出重定向两种技术。

例如，使用 ls 命令分别查看两个文件的属性信息，但其中一个文件是不存在的，如下所示：

[root@localhost ~]# touch demo1.txt
[root@localhost ~]# ls -l demo1.txt
-rw-rw-r--. 1 root root 0 Oct 12 15:02 demo1.txt
[root@localhost ~]# ls -l demo2.txt    <-- 不存在的文件
ls: cannot access demo2.txt: No such file or directory

上述命令中，demo1.txt 是存在的，因此正确输出了该文件的一些属性信息，这也是该命令执行的标准输出信息；而 demo2.txt 是不存在的，
因此执行 ls 命令之后显示的报错信息，是该命令的错误输出信息。

再次强调，要想把原本输出到屏幕上的数据转而写入到文件中，这两种输出信息就要区别对待。
在此基础上，标准输出重定向和错误输出重定向又分别包含清空写入和追加写入两种模式。因此，对于输出重定向来说，其需要用到的符号以及作用如表 2 所示。

命令符号格式	          作用
命令 > 文件	            将命令执行的标准输出结果重定向输出到指定的文件中，如果该文件已包含数据，会清空原有数据，再写入新数据。
命令 >> 文件	          将命令执行的标准输出结果重定向输出到指定的文件中，如果该文件已包含数据，新数据将写入到原有内容的后面。
命令 2> 文件	          将命令执行的错误输出结果重定向到指定的文件中，如果该文件中已包含数据，会清空原有数据，再写入新数据。
命令 2>> 文件         	将命令执行的错误输出结果重定向到指定的文件中，如果该文件中已包含数据，新数据将写入到原有内容的后面。
命令 >> 文件 2>&1
或者
命令 &>> 文件          	将标准输出或者错误输出写入到指定文件，如果该文件中已包含数据，新数据将写入到原有内容的后面。注意，第一种格式中，
                      最后的 2>&1 是一体的，可以认为是固定写法。
EOF

:<<EOF
【例 4】新建一个包含有 "Linux" 字符串的文本文件 Linux.txt，以及空文本文件 demo.txt，然后执行如下命令：
[root@localhost ~]# cat Linux.txt > demo.txt
[root@localhost ~]# cat demo.txt
Linux

[root@localhost ~]# cat Linux.txt > demo.txt
[root@localhost ~]# cat demo.txt
Linux     <--这里的 Linux 是清空原有的 Linux 之后，写入的新的 Linux

[root@localhost ~]# cat Linux.txt >> demo.txt
[root@localhost ~]# cat demo.txt
Linux
Linux     <--以追加的方式，新数据写入到原有数据之后

[root@localhost ~]# cat b.txt > demo.txt
cat: b.txt: No such file or directory  <-- 错误输出信息依然输出到了显示器中

[root@localhost ~]# cat b.txt 2> demo.txt
[root@localhost ~]# cat demo.txt
cat: b.txt: No such file or directory  <--清空文件，再将错误输出信息写入到该文件中

[root@localhost ~]# cat b.txt 2>> demo.txt

[root@localhost ~]# cat demo.txt
cat: b.txt: No such file or directory
cat: b.txt: No such file or directory  <--追加写入错误输出信息


EOF