---
id: 707
title: 编程珠玑番外篇-5.比代码大全好的两本书A
date: 2008-11-23T00:09:05+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/?p=707
permalink: /2008/11/23/software-tool/
dsq_thread_id:
  - 337370215
categories:
  - CompSci
  - Cool Stuff
  - pearl
---
上次我说到&#8221;[比代码大全好的书](http://blog.youxu.info/2008/11/13/anecdotes-about-program-optimization/)&#8220;, 第一本指的是 <Software Tools>. 为了说这本书的优点, 得先说这本书的缺点. 

这么书基本上绝版了. 而且也没有中文版. Amazon 连旧书摊总共就不到50本. 可见这本书目前不是一本让广大程序员喜闻乐见的书. 其次, 这本书用的说明问题的语言叫做 Ratfor, 基本上是 FORTRAN 和 C 杂交的产物. 估计全世界用这个的程序员和现存的这本书的数量差不多多. 但是你要是认为这是一本古董书, 烂书或者非畅销书, 那你就错了.  因为是一本编程书籍, 生命周期本来就短, 因此单以现在的销量判断好坏, 并不科学. 江湖失传已久的如来神掌送给周星星的时候, 周星星也不以为然. 但最后威力无穷. 希望这篇书评, 能够让读者信服这是一本如来神掌的秘籍. 

这本书的作者是 Brian W. Kernighan 和 P. J. Plauger . 关于这两个作者出书质量好的废话我就不多说了(不知道没听说第一个的回家用C写一个Hello, world 并面壁). 先说这本书讲的什么吧. 

这本书主要两条线, 一条是怎样通过一个叫做 Ratfar 的语言, 一步一步构建 UNIX 系统下的 cat, wc, tr, sort, tar 等等这些工具; 另一条是怎样和低级繁琐且不顺手的 FORTRAN 语言做斗争, 克服语言的障碍, 写出功能和可读性俱佳的结构化程序. 第一条着重强调的是一个系统的功能分解(对UNIX哲学清楚的读者看一下目录就一目了然), 第二条实际上是叙述了一个一脉相承到&#8221;代码大全&#8221;的哲学: 如何构建&#8221;你的&#8221;编程语言, 而不是简单的使用&#8221;别人的&#8221;编程语言. 这一条, 道出了整个编程的真谛: 编程就是构建一个一个&#8221;自己的&#8221;小积木, 然后用自己的小积木搭建大系统. 

为了说明小积木的道理, 我们从编程语言说起. 我以前的文章也提到过, C 并没有一个可以传递一行消息出来的 Assert 机制. 因此有经验的程序员会自己构造一个 Assert. 同样的道理, Java 虽然很高级, 却没有一个很好的单元测试框架, 所以全世界 java 程序员都在用 JUnit. 这些实践, 表明了一个现成编程语言总有一些特性不完美之处, 工具和使用者之间还有着不小的距离, 因此显得&#8221;不顺手&#8221;. 如果这个例子不够说明问题的话, 不妨问自己: 为什么人不能像写伪代码一样写程序呢? 因为我们使用了编程语言, 而编程语言有很多肮脏的细节要我们去处理, 比如下标从0开始, 浮点数不好作为数组下标等等. 语言的细节需要处理这个问题, 从 Fortran 到 Python, 只有程度的改变, 并没有本质的改变. 况且, 通用编程语言之所以通用并且简单, 就是因为支持的功能比较基本, 可扩展性强. 因此, 基本功能都有, 高级功能缺少成了通用编程语言的最大特点. 不管编程语言多么&#8221;高级&#8221;, 总是没有自己的思维高级. 因此, 编程的第一步就是把语言改造成自己的语言. 即使强大到直接能 [import antigravity 的 Python](http://xkcd.com/353/), 也有需要改造的地方(最好的例子就是 Python 3000 的推出).

小积木有了, 就要构建大系统了. 在这一点上, Software Tools 可以说是非常好的一本源代码导读. 自从 [Lion 分析 Unix 源代码](http://en.wikipedia.org/wiki/Lions'_Commentary_on_UNIX_6th_Edition,_with_Source_Code)以来, 源码剖析成了程序员修炼的一个捷径. 可是现在程序的源代码树都很繁杂, 能真的拿出来分析的很少很少了. Bell 实验室的两位作者从实作 UNIX 系统下的工具出发, 挑选出经过实践检验的优秀代码来讲解. 这样来自一线的题材是极其宝贵的, 就算在最新的 Beautiful Code 中, 大多代码也只是教科书代码而已. 至于代码大全, 完全就是玩具代码. 而 Software Tools 有几千行代码的大程序, 也有几行代码的小程序; 有算法程序, 也有文件IO程序, 基本覆盖日常所有用例, 对于内功修炼大有裨益. 

除了道出&#8221;改造你的语言&#8221;的真谛之外, 这本书其他论点也可谓字字珠玑. 比如讲**goto带给程序员的自由恰好是你不想要的自由, 因为这个自由会带来很多错误.** (很多语言都有这种不想要的自由, 比如 C++, 到处都是). 比如说讲结构化编程不会自动带来清晰的程序, 因为机械的规则永远不能代替清晰的思考. 这个道理在面向对象/设计模式领域也一样. 比如本书还论证了为啥要详细设计, 因为设计和编码环节对于程序员讲是愉快的事情, 值得更多投入. 而 debug 和 测试环节是比较痛苦的事情, 所以要少投入. 还比如人比机器时间贵, 所以程序员要越懒, 越快完成编程越好. 除非程序太慢, 否则从总成本看, 机器多用点时间没事, 人用的时间要越少越好, 等等等等. 类似于这样的深刻揭示编程的哲学理念的句子俯拾皆是, 比起相同内容但是篇幅冗长的代码大全, 这本书适合随身携带, 随时阅读, 随时提高. 

老规矩, 结尾顺手说个八卦吧. 话说为了把 Ratfor 这个假想的语言翻译成当时最流行的两种语言, FORTRAN 和 PL/I, bwk 爷爷写了一个宏替换的工具, 能够把 Ratfor 替换成肮脏的 FORTRAN, 而他们写干净的 Ratfor. Dennis Ritchie 爷爷看到鸟, 很赞, 于是推广了一下这个宏替换工具, 起个诡异的名字叫做 m3 (macro for ap3). 然后 bwk 爷爷又看到了 dr 爷爷的工作, 回过来又和 dr 爷爷合作, 写出了金光闪闪的 m4. 如果你常常编译开源软件, 肯定会注意到一个叫做 configure 的生成 makefile 的程序. 这个 configure 的读入, 一般情况下是可配置的, 叫做 config.ac, 就是 m4 语言写的. 虽然因为版权问题, 现在 GNU m4 和两位爷爷没啥关系了, 但是基本的语法和用法都是一样的. 各位知道 K&R 的读者千万不要错过这个好用的工具(也是编程语言). 

这个工具其实我也只懂皮毛, 也不常用, 只是用来自动编号一些行, 做一些稍微复杂一点的不能用正则的文本替换. 不过我似乎在某个地方听一个高手说, Linux 命令行下文本处理三剑客乃是 sed/awk/m4, sed 和 awk 的强大早就见识了, 相必m4与他们各有千秋. 故而略介绍一下. 

另外, 本书也是 troff 排版的. 按照我的 [troff 排版无烂书](http://blog.youxu.info/2008/10/13/trivia-about-computer-typesetting/)定理, 这本书也属一流好书.