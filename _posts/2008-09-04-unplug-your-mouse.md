---
id: 616
title: '完全用命令行工作-1: 拔掉你的鼠标'
date: 2008-09-04T08:33:20+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=616
permalink: /2008/09/04/unplug-your-mouse/
dsq_thread_id:
  - 337057923
categories:
  - Cool Stuff
  - keyboard
  - Linux
  - MacOSX
  - Open Source
  - Self-help
tags:
  - Linux
  - mac
  - mouse
  - productivity
---
(本文可能不适合windows用户, 也不适合美工设计人员)

我觉得, 工作效率低下的原因很简单: 精力没有集中. 在计算机前工作的时候, 我发现一个提高精力集中度的最好办法: 拔掉鼠标.

拔掉鼠标意味着上网的时候不到处乱点链接, 书写的时候不简单的拷贝粘帖以及不会先想着格式和排版以干扰思路, 阅读的时候不动个不停的指向正在读的词(很差的阅读习惯), , 编程的时候不会老拷贝粘帖而是使用重构, 打开应用程序的时候不会误点到魔兽, 无聊的时候不会在联系人列表上找个人就随便海侃. 总之, 做一件事情的时候被限制在当前的窗口中, 注意力必然会提升. 具体来说, 不用鼠标意味着只用键盘来操作应用程序, 优点至少有以下几个.

1. 做正事时, 完全使用键盘能强迫人使用高效简洁和正确的工具. 我认为, 现在大多数应用程序都是堆砌一辈子用不到的功能, 而不是直截了当的解决问题. 那些工具窗口, 菜单栏, 状态栏等等到处都是, 想要完成一个任务必须在很多的工具中选择一个按钮点击. 其实选择和点击按钮只是完成操作的手段而已, 而不是必须步骤. 假如能够直接告诉计算机我想要做什么, 而不是先翻译成&#8221;我要点这个你才能做什么&#8221;, 效率会高很多. 而命令行就是直截了当的解决方法, 通常老手会选择使用快捷键, 这比点鼠标速度要快, 效率要高. 其实一般的应用程序, 核心功能不会超过20个, 这样20个核心功能用键盘操作完全有可能. 我甚至认为, 不能用键盘完全控制功能的程序, 可能本身就是不够简洁的. 使用这样的工具, 可能本身就是一个错误.

2. 处理零碎任务时, 使用命令行效率比鼠标点击简洁高效. 这是我观察到的一个具体的例子, 我想要看2009年1月4日是星期几, 在图形界面下, 我需要点击日历, 通过下拉选择2009 和 01 这两个选项, 然后才能看到日历. 鼠标输入2009和01是很费事的事情, 而在命令行下面我只要 cal 1 2009 就可以直接看到日历. 命令行能够直指问题本身, 绕开不良窗口界面设计造成的很多操作负担. 再比如说, 在使用网上日历和提醒的时候, 一句&#8221;have lunch tomorrow at 12:00pm with X&#8221; 显然要比用鼠标一个一个选择日期, 时间, 地点和事件来得直接. 在这方面, [Gtalk 有很多的机器人](http://www.dwgoogle.cn/articles/gtalk机器人帐号大全.html)可供大家选用, 比如查字典, 直接给字典机器人发送一个单词就能获得翻译, 比点一下字典程序等着启动然后输入单词要快太多了. 所有的这些目的性明确的小任务, 耽误的时间都不应该超过10秒钟. 如果使用命令行, 这个时间可以继续减少, 而使用鼠标点来点去, 至少要30秒. 而日常的零碎事务往往全是这类. (比如写一行备忘, 发一个小文件, 加一个提醒, 查一个单词或者维基, 标记一个日历, 控制一个远程服务等等).

3. 完全使用命令行, 使得浏览网页和无聊闲逛的时候注意力也集中. 我观察自己发现, 在电脑前面最浪费时间的事情就是顺着一个有趣链接点下去, 无穷无尽. 看上去获取了很多信息, 其实过眼即忘. 聊天也是, 往往一个爱说话的哥们上线聊上了, 一晃时间就过去好大一会儿了. 而完全使用命令行, 就强迫自己得用无穷多次的Tab才能点击那些链接. 这样, 就不会去主动点击那些链接. 聊天的时候也一样, 在命令行下面的会话没表情没声音也没提醒, 上线也没提醒, 干扰少很多.

再说我自己的具体的实现方法

1. 邮件和日常事务

Gmail 网络效率也不完全高. 最好用 [Mutt](http://www.mutt.org/). 快速发送文件附件的情况下 Mutt 是瑞士军刀, 参见我以前的叙述. 编程和文本编辑器随便是vim, emacs 都用不着鼠标的, 而且效率高. 浏览器一般使用 [elinks](http://elinks.or.cz/), 遇到非Ajax 不可的才搬出 Firefox. 排版和做演示都使用LaTeX, 这个大家做科研的都知道. 另外, 把一些日常要做的任务写成make 脚本, 效率的提高是超出想象的.

2. 零碎小事

日常事务可借助形形色色的 Gtalk 机器人, 以及 Twitter 上一些特别的机器人. 其中Gtalk 客户端最好使用 GNU [Freetalk](http://www.gnu.org/software/freetalk/), 可以自定义钩子(使用史上最优雅的 LISP 语言噢). 从而可以通过解析 Gtalk 消息调用系统程序. 比如我家有一台破电脑, 一直挂着Gtalk, 我在学校要回家之前就可以给这个Gtalk 发送信息让他提前打开我们家的空调或者电灯. 这些零碎的小事情的处理在 Web 背景下特别好解决. 如果你不是深度网络用户, 使用shell 脚本也能完成大多数工作. 比如日历, Linux 下面的日历管理工具都是支持命令行的. 其他如提醒啊, 日记啊, 字典啊, 都有工具. 除此之外, sed/awk, wget/curl 等等都有想不到的妙用, 完全可以把日常事务中的零碎小事处理得井井有条 (要知道, 当年贝尔实验室的科学家们就仅用这些工具辅助炸药奖研究的, 当时候微软还在做DOS呢).

如果你是Firefox 用户, 最近的一个 [Ubiquity](http://labs.mozilla.com/2008/08/introducing-ubiquity/) 的确是杀手级别的应用. 除了能控制网络服务外, 你也可以自己写个脚本, 把消息转解析到本机端口, 本机开一个简单的HTTP服务把消息代理给其他应用程序, 这样, 理论上, 在Firefox 里面也能控制整个计算机. 我也尝试了在学校Firefox里面控制我家的空调, 看上去很酷. 苹果用户也有福气, [QuickSilver](http://www.blacktree.com/) 这样的杀手级程序早就红遍大江南北, 我就不多说了(你要是苹果用户又不用QuickSilver或命令行, 那你真是把苹果当Windows用了, 暴殄天物啊!)

虽然没有严格的证明说鼠标一定浪费时间, 但是浪费时间的应用通常都需要鼠标支持. 我因为鼠标坏了舍不得买, 无意发现了这个结论. 如果你不相信我说的, 不妨尝试一下强迫自己不用鼠标一天, 看看自己是不是浪费的时间少了很多.