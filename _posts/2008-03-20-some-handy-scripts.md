---
id: 530
title: 几个趁手语句
date: 2008-03-20T22:39:19+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2008/03/20/some-handy-scripts/
permalink: /2008/03/20/some-handy-scripts/
dsq_thread_id:
  - 338226604
categories:
  - Cool Stuff
  - keyboard
  - Linux
  - Python
---
处于局域网中的小型开发团队常常需要互相贴代码, 传文件, 共享资源, 我长期使用过程中总结了几行趁手的语句, 贴出来共享. (_本文不适合 windows 用户_)

**1. Gtalk 传递命令行程序输出信息**

常常需要把程序的输出结果或者调试结果通过 IM 发给同事诊断. 而这些结果通常都在字符界面下，拷贝出来很麻烦，于是，我写了一个小程序 [gpipe.py](http://blog.youxu.info/gpipe.py)，可以把 gtalk 当作一个管道接在程序后面, 比如说, 想把程序编译结果给郝培强(tinyfool),

<span style="color: #0000ff;">make 2>&1 | gpipe tinyfool</span>

他的gtalk 客户端就被我用输出给淹没了.
  
有兴趣的还可以套接 gtalk, 把信息用 base64 编码, 接受方再解码, 如此一来, gtalk 就和Linux 中的管道一样, 将一个机器上的程序的输出套接到另一个机器上另一个程序的输入. 实践证明, 在跨平台的环境下这种做法比使用中间文件分别执行高效很多. 调试时间也大大减少.

**2. 传送文件作为邮件附件.** 

使用matt 客户端，一行即可完成:
  
 <span style="color: #0000ff;">echo &#8220;Content&#8221; | mutt -s &#8220;Subject&#8221; -a file email@address.demo<br /> </span>
  
这个方法对及时传输一些小文件非常有效, 特别是传送源代码. 还能起到存档备份的效果, 反正Gmail 那么大不用也浪费. 懒人还可以进一步用一个脚本包装, 比如我机器上就包装出了一个 sendboss.sh, 里面是:
  
 <span style="color: #0000ff;">echo &#8220;Hi, These are the file(s), thanks. Eric&#8221; | mutt -s &#8220;File&#8221; -a $* myboss_email@wustl.edu<br /> </span>

这样我每次就只要 <span style="color: #0000ff;">&#8220;sendboss.sh files&#8221; </span>就可以了. 我老板常常惊讶于我发送文件的反应速度.

**3. 一行语句的HTTP文件服务器.
  
** 
  
 <span style="color: #0000ff;">python -m SimpleHTTPServer</span>

即可将当前目录开设为一个8000端口的http 服务器的根目录. 在局域网中，如果需要临时共享当前目录下的一个较大文件，这个方法简便安全，实在是居家旅行必备.

还有, 下载的时候使用 <span style="color: #0000ff;">&#8220;wget -c&#8221;</span> 可以断点续传，很多哥们好像不知道这个小花招.

**4. NFS 共享文件夹** 

SVN 和 CVS 对于代码和文档控制得很好，可是团队中免不了有些 PDF 文档或者色戒电影需要全团队共享，又不需要送到版本控制系统里面。一个共享的文件夹很有必要. 最简单的方法是使用 NFS, 能够跨平台且性能稳定. 具体服务器设置可以参考[这里](http://nfs.sourceforge.net/nfs-howto/)，客户端只要

<span style="color: #0000ff;">mount nfs_server:/dir /mnt/share</span>

即可顺利使用此文件夹. 此法对于有电驴 bt 爱好者存在的团队来说，实在是必备良方.