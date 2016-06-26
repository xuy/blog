---
id: 718
title: 编程珠玑番外篇-7.比代码大全好的两本书B
date: 2008-11-23T21:12:46+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=718
permalink: /2008/11/23/the-elements-of-programming-styl/
dsq_thread_id:
  - 337393064
categories:
  - CompSci
  - Cool Stuff
  - pearl
tags:
  - diction
  - elements
  - english
  - perls
  - style
---
各位读者老大中有不少都是大学生, 相信不少都参加过形形色色的英语写作培训班. 如果当年您参加培训班的时候, 老师没有介绍一本叫做 <[The Elements of Style](http://en.wikipedia.org/wiki/The_Elements_of_Style)> (TEoS) 的书, 建议您现在立即冲过去找他们退钱. 为啥呢, 因为这本书是讲解英语写作绕不开的经典圣经(即使这本书已经被说烂了, 批评也不少, 但还是经典). 假如培训机构或者老师上课没推荐到这本书, 这个培训机构要不是太牛逼了, 要不是水货. 而大家都知道, 水货和牛逼的比例总是 1:epsilon.  

作为[Amazon 上 297 个5星的书](http://www.amazon.com/Elements-Style-Fourth-William-Strunk/dp/020530902X), 书评我就不狗尾续貂了. Knuth 爷爷也是很喜欢这本书滴, 因此在 Stanford 开课的时候让学生人手一本 (我们系今年新生也强制人手一本). 这本书不光勾勒了英语的基本写作要素, 也刻画了一个时代: 从此, 任何需要&#8221;艺术和技艺&#8221;的领域, 都会时不时跳出一些牛人, 模仿这本书的题材和哲学, 用简洁的文笔勾勒出这个领域的基本要素. 以我熟悉的计算机领域为例, 就有 &#8220;The Elements of Programming Style&#8221;, &#8220;The Element of Programming Style with Perl&#8221;. &#8220;C Elements of Style&#8221;, &#8220;The Elements of Java Style&#8221;, &#8220;The Elements of UML Style&#8221; 等等书, 都是希望继承 TEoS 的衣钵, 勾勒出编程的一些风格要素. 今天我要说的比<代码大全>好的书的第二本, 就是叫做 <The Elements of Programming Style>的. 我以前在[计算机科学必读经典](http://blog.youxu.info/2008/04/09/classics-in-cs/)中, 也提到了这本书. 

这本书作者和上一本 Software Tools 一样, 属于一个家族哲学下的两本不同角度的书. 关于它的书评也很多, 我就不一一废话了. 只说几个体会较深的. 

第一是写程序和写作一样, 要写的清楚. 这本书翻开第一条就是 **Write clearly &#8211; don&#8217;t be too clever.** 看上去说的和没说一样, 其实实践起来乃是金科玉律. 我曾自己写过三层嵌套的 &#8220;? :&#8221; 表达式, 写的时候自己被自己的聪明都感动了, 回来改的时候自己被自己当时的聪明给打击了: 死活看不懂当时啥意思, 只好写一个 printf 在后面测输出. 假如当时多花几分钟写的清楚一点明白一点, 就犯不着回头修改的时候花半小时破译了. 现实中的情况没这么极端, 但是也比比皆是. 相信任何正常的程序员, 每天都要为了理解以前写的不大清楚了程序浪费不少时间 (反正我是记不住一年前写的代码的每个小细节). 因此, 写的时候写的清楚比什么都重要. 

在写得清楚上, Knuth 爷爷是榜样. 他提出的 [Literate Programming](http://www.literateprogramming.com/) 的思想虽然太学术, 使得实践的人不多, 但是的确使得程序更加好读. Knuth 爷爷把他的用C语言作为基本语言的 Literate Programming 系统叫做 CWEB. **大名鼎鼎的 TeX 就是 CWEB 写成.** 如果对 Knuth 爷爷比较粉的粉丝们恰好要做图算法,  Stanford Graphbase 是一本非常好的书, 里面贴得全是程序, 但是因为 Knuth 爷爷用 CWEB 写成, 文档和程序浑然一体, 读起来丝毫不觉得思维在程序和自然语言间做切换. Java 下有名的 XDoclet 和 Javadoc, 事实上也是 Literate Programming 的一种体现. [据 Knuth 爷爷讲他写 CWEB 程序能笑出来](http://tex.loria.fr/historique/interviews/knuth-clb1993.html), 这种境界不是一般人能有的. 而且 Knuth 爷爷在提出 Literate Programming 的时候, 就野心勃勃的说: 写文章也是写, 写程序也是写, 我们 Literature Programming 的口号就是: <span style="text-decoration: line-through;">没有蛀牙</span> 程序员也能拿普利策. (&#8220;I&#8217;m hoping someday that the Pulitzer Prize committee will agree.&#8221; Prizes would be handed out for &#8220;best-written program&#8221;.)

又八卦走题了. 言归正传, 我的第二个深刻的体会是&#8221;让计算机干脏活&#8221;. 什么叫脏活呢? 让你不爽的活叫脏活. 比如 Debug, 比如无穷多的复制粘帖, 比如替换一个大小写, 数数几个单词, 做做单元测试等等. 用眼睛瞄肯定会死人. 我以前在 &#8220;[高效能编程的七个好习惯](http://blog.youxu.info/2008/10/29/seven-habits-of-highly-effective-programmers/)&#8221;  这篇文章中也说了, 就不多废话了. 

当然, 现实的问题是, 理论是理论, 实践是实践. 事实上, 我们要不然就是不用或者想不起来用工具(理由是不习惯), 要不然就是成为工具的奴隶. 李笑来老师也观察到了第一点, 比如[这篇](http://www.xiaolai.net/index.php/archives/1491.html). 为什么明明别人告诉我有高效率工具和习惯存在的情况下, 我们还不去用不去改, 或者如何不成为工具的奴隶这两个话题都太大了, 我也写不好, 就不废话了. 然而, 不管最后实践用还是不用, 读一些被别人实践检验过的经验之谈还是很有用的. 这也是我推荐这本书的原因. 不知道大家有没有发现, 潜意识中如果有个正确的小声音不时在原则上提醒自己, 实践的时候潜移默化的就会越做越好. 

最后依然附送两个八卦. 第一个是关于 TEoS 这本书的. 这本书列了很多的原则和规则, 都是具体的对某个词某个句型的建议, 因此英语写作的时候可以直接应用这些规则. 不过对着书查规则显然属于脏活的范围, 所以呢, 我们的&#8221;让计算机做脏活&#8221;的哲学就发挥作用了: 在 Linux 下有一个程序叫[diction](http://www.gnu.org/software/diction/diction.html), 用他可以检查英语写作的文章符不符合 TEoS 的标准, 我[以前也专门介绍过](http://blog.youxu.info/2007/07/11/some-useful-tools-for-you-to-write-english-articles-on-linux/). diction 会挑出那些不符合 TEoS 的句子, 告诉你让你修改. Knuth 爷爷也说, 虽然这个程序很笨, 但是至少可以强迫你重新审视你的文章, 挑出弱智的错误. 其实 GNU/Linux 下帮助英文写作的工具很多, 虽然不完美, 也称得上完整了. [我以前的文章可供大家参考](http://blog.youxu.info/2007/07/11/some-useful-tools-for-you-to-write-english-articles-on-linux/) . 和 diction 一起的另一个工具叫做 style, 可以做像长句分析, 被动语态分析, 平均单词和词汇量估计等统计, 以及语言学水平上的英语水平估计(等价于美国几年级学生水平的估计). 这些估计都是语言学家研究数年的标准指标. 大家都知道, GRE 作文是计算机批阅的, 虽然我们不知道算法, 但是可以想象, ETS 那么笨, 肯定是请语言学家帮忙设计的程序, 所以必然或多或少的用到很多标准的语言学指标. 所以呢, 你不用计算机程序分析分析自己的文章, 光听培训机构的一些老师忽悠, 怎么知道自己文章水平呐? 相比较一些培训机构的老师, 指不定 style 这个程序更像 ETS 的评价标准. 

第二个八卦是关于写清晰的程序的. 或许大家都听说过史上最牛逼的注释的故事. 虽然各人有个人认为的最牛注释, 我个人喜欢的叫做 /\* You are not supposed to understand this. \*/ (我不指望你懂这是啥意思). 这句话其实本来不该这么出名的, 恰好是因为出现在开源的第六版UNIX中, 恰好写的人是 Dennis M. Ritchie, 恰好澳大利亚出了一个叫 Lion 的人把 UNIX 源代码扒出来搞了个源码解析, 又恰好当年这本源码解析几乎每个黑客都人手一本. 所以, 这个极其挑战其他黑客智力的注释就变得流行起来鸟. [DMR 同学对此有技术上的详细解释](http://cm.bell-labs.com/who/dmr/odd.html),  不再废话. 就是友情含泪劝告读者: 您要是在你的程序里面搞这么一句然后又被你同事和老板看到鸟, 你就完蛋鸟. 世上只有一个牛逼的 DMR 敢这么写.  

PS: 想要看看The Elements of Style 书的内容的老大们, 可以猛点[这个链接](http://www.crockford.com/wrrrld/style.html): 

想要看 The Elements of Programming Style 说了哪些的老大们, 可以猛点[这个链接](http://www.cnblogs.com/hitszxin/archive/2008/04/03/1136726.html)

-EOF-