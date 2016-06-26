---
id: 654
title: 编程珠玑番外篇-1.Plan 9 的八卦
date: 2008-10-06T12:28:58+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=654
permalink: /2008/10/06/about-plan/
dsq_thread_id:
  - 336141277
categories:
  - CompSci
  - Cool Stuff
  - pearl
tags:
  - fuse
  - plan9
  - sshfs
---
在 Windows 下喜欢用 FTP 的同学抱怨 Linux 下面没有如 LeapFTP 那样的方便的工具. 在苹果下面用惯了 [Cyberduck](http://cyberduck.ch/) 的同学可能也会抱怨 Linux 下面使用 FTP 和 SFTP 是一件麻烦的事情. 其实一点都不麻烦, 因为在 LINUX 系统上压根就不需要用 FTP. 为什么呢? 因为一行简单的配置之后, 你就可以像使用本机文件一样使用远程的任何文件. 无论是想编辑, 查看还是删除重命名, 都和本机文件一样的用. 这么神奇的功能到底如何使用呢, 待我一一道来.

首先, 如果你的内核版本是 2.6.14 或者更新(uname -r 可以查看你的内核版本), 你的机器上的已经有了这个支持了. 在这种情况下, 你可以使用:

`sudo modprobe fuse`

激活内核模块. 然后, 比如说, 你想SSH远程 remote.com 上的 /dir 目录, 作为本机的 ldir 目录, 你可以使用:

`sshfs name@remote.com:/dir /ldir`

然后, 您就可以完全在 ldir 目录下操作任何的远程机器上的文件了. 是不是很简单 :)

如果要使用 ftp, 我们要使用一个叫做 curlftpfs 的开源软件. 幸运的是, 你可以直接使用 apt-get install curlftpfs 直接得到他.

安装结束后, 我们依然使用

`curlftpfs ftp://user:pass@ftp.remote.com/dir ldir/`

就可以把远程的目录当成本地的目录一样使用的. 拷贝啊重命名啊都可以. (当远程的内容直接能被你访问的时候, 谁拷贝啊 :)

说到这里, 聪明的读者肯定要说: 靠, 远程的文件都能当成本机的用, 那太好了, 整个互联网就是我的磁盘嘛. 你还真说对了, 对于一个用户来说, 协议是不重要的, 重要的是数据. Gmail 不是有N个Gb的大小么, 让我们直接把 gmail 当磁盘好了. 于是有了 [Gmail FS](http://richard.jones.name/google-hacks/gmail-filesystem/gmail-filesystem.html). 这样, 你可以给你的邮件标题做支持正则表达式的查找噢 :)

除此, 还有 [wikipediaFS](http://wikipediafs.sourceforge.net/), 可以用自己喜欢的编辑器直接编辑维基百科的文章. 还有 [flickrFS](http://manishrjain.googlepages.com/flickrfs). 直接用自己喜欢的编辑器可以编辑图像元信息, 还能 chmod 754 让图像只能被朋友访问噢 :)

以上的这些酷实现, 都是 [FUSE](http://fuse.sourceforge.net/) 这个内核模块作为基础支持的. 那么, 这个牛逼的网络也是文件的点子是哪个牛逼的人想出来的呢? 答案是 UNIX 的发源地, 贝尔实验室. 确切的说, 是在设计 UNIX 的继承者&#8211; [Plan 9](http://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs) 的过程中提出来的. (小八卦: UTF-8, 就是世界上现在最通用的字符编码体系, 就是 Plan 9 操作系统的一个副产品).

一切都是文件这个点子倒不是什么新的点子, 在 The Unix Programming Environment 这本圣经里面就旗帜鲜明的打出 &#8220;UNIX下一切都是文件&#8221;的旗号. 但是毕竟旗号是旗号, 现实是现实. 关于文件的抽象在其后的发展中发现了这样那样的局限, 于是恶名远扬的 ioctl 函数被引进系统. 所以口号是口号, 实现是实现. 显然当初设计 UNIX 的几个哥们很不满意, 所以搞了一个 Plan 9 (搞 Plan 9 的人就是写 The Unix Programming Environment 的人). 在 Plan 9 系统中, 一切都是文件, 显卡是文件, 内存是文件, 进程是文件, 网络是文件&#8230;

等等, 熟悉 Linux 的用户要说了, 在 Linux 下面, 进程的确是文件啊. ls /proc 就能看到当前所有的进程, 不也是文件么. 是呀, Linux 这个就是和 Plan 9 学来的. 但是 Linux 学得不彻底, 因为这个文件系统的访问接口并不完整: 你不能通过 rm 一个文件杀死一个进程. 也不能通过 cp 拷贝出一个进程. 而在 Plan 9 上, 你不光能通过普通的文件操作命令去控制进程, 你还能 mv 一个进程. 我们刚才说了, 进程就是文件, 还能把其他机器上的文件当成本机一样用. 屏幕前聪明的你肯定一下子悟到了: 一定这居然是一个分布式的操作系统啊! 在这个系统里, 进程可以被其他计算机看到, 并且控制. 而管道可以横跨不同机器的不同进程, 这简直是把单机的概念都给抹杀了, 简直就是&#8221;网络就是计算机啊&#8221;.

熟悉互联网的读者都知道最近炒得很热的云计算啥的, 对用户无非就是互联网作为硬盘, 对公司无非就是分布式的操作系统协同工作, 在屏幕前的您肯定如我一样, 一拍大腿说: 靠, 贝尔实验室养得不是计算机科学家, 而是一大批未来学家啊. 30多年前人家搞互联网, 而今我们用互联网. 20年前人家用GUI, 如今我们用GUI. 10年前人家搞云计算, 而今我们炒概念闲扯淡. 差距啊.

说到这里就到了今天技术八卦的尾声了: 当年设计 Plan 9 的牛人 bwk 和 Rob Pike 等哪去了?
  
bwk (别查了, 就是那个写 C语言书的, 写AWK的) 年纪大了去普林教书了(人家本科生能不牛逼么). 而 Rob Pike 年轻, 风华正茂正当时. 您想,对于那些做云计算的大公司来讲, 这么牛逼的人哪能落入对手手中? 您这么想的, Google 也是这么想的. Rob 同学现在在 Google 研究院很爽的做着主力工程师呢. (小八卦, 他是Google 中唯一享有单字母邮箱的: r@google.com).