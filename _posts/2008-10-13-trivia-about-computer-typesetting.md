---
id: 660
title: 编程珠玑番外篇-2.计算机图书排版的八卦
date: 2008-10-13T22:06:02+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=660
permalink: /2008/10/13/trivia-about-computer-typesetting/
dsq_thread_id:
  - 336428754
categories:
  - CompSci
  - Cool Stuff
  - pearl
tags:
  - latex
  - mics
  - troff
---
大家都知道, 计算机科学家超级爱动手自己开发工具, 而且对美有超乎常人的需求. Knuth 爷爷当年觉得自己辛辛苦苦的好书被排版成地摊上的厕纸一样, 一怒之下自己搞出了红遍大江南北的 TeX. 从此整个世界都清净了. 排版是计算机科学家研究的一个很好玩的领域, 这篇文章就谈谈我所知道的关于排版的八卦.

先说 Knuth 爷爷的吧. 首先, 是在设计 TeX 的过程中, 这位老爷爷研究了很多著名的字体, 成了名动一时的字体专家, 据说和乔布斯并称为加州最懂字体设计的两个搞IT的 (我瞎说的). 研究字体之余, 他就研究收集各大书法家的作品, 然后这位老爷爷又是一个基督教徒, 所以干脆用它的收藏出了一本书, 叫做 <3:16>. 这本书特别牛逼, 是一本用计算机科学研究上帝存在的. 而且发挥计算机科学的小幽默, 取圣经每章的第3节第16小句, 还证明了这个和随机一样好.

还是克爷爷, 写完TeX之后不过瘾, 要写本书来冲冲喜, 于是写出了极其牛B名字的 The TeXbook. 一语双关, 表现了牛人一贯的狂妄. 写完这个他又想写写自己的字体和绘图系统设计(metafont 系统) 所以干脆出了五卷书, 行话称作ABCDE, 也是用名字来表明: 看, 基本的入门书, 你非看不可.

跑题一下: Knuth 爷爷最喜欢让人家看到他提出的名字就腿发软. 比如他提出了一个叫做 Literate Programming 的东西, 并且很不怀好意的对 Dijkstra 说, 小样, 当年你说 structured programming 的时候我非要用 goto, 结果人家都说我是 unstructured programming (没结构的编程), 现在我要提出一个叫做 literate programming 的东西, 你要是不跟着我混, 人家就会叫你 illiterate programming (没文化的编程). 在这么邪恶的名字下, 全世界程序员只好个个听这个老头的话, 乖乖的使用文档和程序融为一体的&#8221;有文化的&#8221;编程习惯.

其实克爷爷属于斯坦福家族的. 在70-80年代, 世界上还有一个NB的研究机构: 贝尔实验室. 贝尔实验室自己也开发了自己的排版工具: Troff. 开发者是著名的K, 就是 K&R 里面的那个K. 这个 Troff 也是一个牛到极点的排版软件, 比如说, 当年那些科学家都对出版社的排版不满意, 所以都威胁出版社说: 我自己来排版, 你们只管印刷就行了. 就是因为这帮科学家开了这个传统, 所以后来出版商遇到想自己排版的, 都用巨崇拜的眼光打量着你.

说到 troff, 以下大名鼎鼎的书都是用 troff 排版的:

Advanced Programming in the UNIX Environment
  
The AWK Programming Language
  
The C Programming Language
  
Compilers: Principles, Techniques, and Tools
  
Computer Networks, 3rd Ed.
  
Computer Networks And Internets, 3rd Ed.
  
The Design and Implementation of the 4.4BSD Operating System
  
Effective TCP/IP Programming
  
The Elements of Programming Style, 2nd Ed.
  
Internetworking With TCP/IP Volume 123
  
More Programming Pearls
  
The Practice of Programming
  
Software Tools
  
Unix Network Programming
  
The UNIX Programming Environment
  
Programming in C++

所以说, troff 排版的无烂书. 当然, TeX 家族也不是吃素的, SICP, TAoCP, CLRS 都是用 TeX 搞出来的. 陶哲轩也说, 鉴别民科文章第一步就是看是不是用TeX排版的. 可见排版排得专业, 也是好文章的一个先决条件.

我觉得可以把以上的结论概括成 徐氏排版定理, 如果一本书, 不是以上所说两个软件排版的, 又不是 O&#8217;Relly 出版的, 那是好书的概率也就不怎么大了. 作为一个作者来讲, 一定要记得用 troff 或者 latex 排版 :)

troff 和 latex 都是一脉相承的, 理念也差不多, 所以牛B的开发人员两头都在玩, 比如一个叫做 Werner Lemberg 的牛人, 就是 troff 的开发人员, 同时还跑到 TeX 那里开发了支持中日韩的 CJK 包. (大家都知道, 软件的中文支持从来都不是中国人开发的)

史上最牛的程序员 Bill Joy 同学据说用了一个周末就写出了 vi, 所以大家都怀疑, 他用了半个小时的时间写了 BSD 上的 troff. 他写的这个程序, 被SUN用着, 一直用到今天.

最后强行插播一条广告: 我最近要写一本小册子, 叫做 Motifs in Computer Science (原名叫 Meta Ideas in Computer Science). 一定保证用 LaTeX+Troff+reStructuredText 排版, 按照我的 Troff/Latex 排版无烂书结论, 这本书也不是太烂. 欢迎捧场.

再补充一则八卦: 话说当年 PDP-11小型机特别贵, 但是贝尔实验室的科学家又想要用. 怎么办呢? 于是, 他们发挥了科学家爱忽悠的能力, 去和经理说: 你看, 我们文档的排版很烂吧(当年还是打字机时代), 你们投资一下搞一个小型机回来, 我们保证给你们开发一个在这个机器上用的文档排版系统. 经理一听, 大笔一挥说: 买之!. 科学家一听都乐了, 哈哈, 我们有新玩具了. 然后, 他们就开始在 PDP11 上开发 UNIX 了. 经理也不懂, 看他们搞的好玩, 就不时来问问: 老大们, 排版系统怎么样了? 贝尔的科学家一边敷衍敷衍, 一边继续搞 UNIX 和 C 语言. 等这两样都搞好了, 瞬间就写了一个排版软件, 就是 nroff. 经理可乐了, 说, 哎, 我们终于投资有回报了啊. 科学家也乐了, 因为若干年之后, C 和 UNIX 红遍大江南北, 因此两人拿下图灵奖. 所以说, 做研究这东西, 一定要先把基金忽悠过来, 然后想干啥干啥, 最后结果反而超出预料. (贝尔实验室的人居然研究宇宙背景辐射拿诺贝尔奖, 这种宽松宽容的基础研究在其他地方是很难遇到的).