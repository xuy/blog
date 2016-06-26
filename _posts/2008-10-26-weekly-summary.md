---
id: 676
title: 一周杂记
date: 2008-10-26T18:53:20+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=676
permalink: /2008/10/26/weekly-summary/
dsq_thread_id:
  - 369845876
categories:
  - Life
---
**A. 荐书**

向大家推荐4本我读了之后觉得非常非常好的书

 <span></span>1. _Smart and Gets Things Done_ (Joel Spolsky)

从一开始就读Joel 大叔博客的同学就不需要看了, 因为文章都是从他博客上选下来的. 书中讲了技术公司怎样找 &#8220;聪明并且能把事情完成&#8221; 的人. 别被标题误导了, 这不是一本讲如何 GTD 的书, 但是这本书对于&#8221;准备过冬&#8221; 的技术人员, 绝对是好书一本. 另外听说[阮一峰要翻译<Joel on Software>](http://www.ruanyifeng.com/blog/2008/10/i_will_translate_more_joel_on_software.html), 还是很佩服的. 同时很惊讶: 为啥这么好的书到现在才翻译, 要知道 JoS 04年就出来了. 

 <span></span>2. _Bell Labs: Life in the Crown Jewel_ (Narain Gehani)

这是一本既不出名, 封面也不好的书. 可是这个书好在两个地方: A. 作者见证了Bell 实验室的从 80 年到 01 年的荣辱兴衰. 书中关于各种各样的八卦都有涉及, 而且作者作为做技术出身的, 对UNIX系统的前世今生, 对几位大佬的八卦生平, 都让我们这些后来的研究者向往. 

 <span></span>3. _Advices for a Young Investigator_ (Santiago Ramon y Cajal)

也是一本不为众人所知的小众书. 最近被大家分享很多次的 &#8220;[非常牛逼、相当见血](http://www.bullog.cn/blogs/siyi/archives/194207.aspx)&#8221; 就是其中的一段. 我觉得对于我这样从事科学研究的年轻人来说, 这本书讲的的确的相当见血, 非常受用.

 <span></span>4. _The Rest is Noise_ (Alex Ross)

[**A. 荐书**

向大家推荐4本我读了之后觉得非常非常好的书

 <span></span>1. _Smart and Gets Things Done_ (Joel Spolsky)

从一开始就读Joel 大叔博客的同学就不需要看了, 因为文章都是从他博客上选下来的. 书中讲了技术公司怎样找 &#8220;聪明并且能把事情完成&#8221; 的人. 别被标题误导了, 这不是一本讲如何 GTD 的书, 但是这本书对于&#8221;准备过冬&#8221; 的技术人员, 绝对是好书一本. 另外听说[阮一峰要翻译<Joel on Software>](http://www.ruanyifeng.com/blog/2008/10/i_will_translate_more_joel_on_software.html), 还是很佩服的. 同时很惊讶: 为啥这么好的书到现在才翻译, 要知道 JoS 04年就出来了. 

 <span></span>2. _Bell Labs: Life in the Crown Jewel_ (Narain Gehani)

这是一本既不出名, 封面也不好的书. 可是这个书好在两个地方: A. 作者见证了Bell 实验室的从 80 年到 01 年的荣辱兴衰. 书中关于各种各样的八卦都有涉及, 而且作者作为做技术出身的, 对UNIX系统的前世今生, 对几位大佬的八卦生平, 都让我们这些后来的研究者向往. 

 <span></span>3. _Advices for a Young Investigator_ (Santiago Ramon y Cajal)

也是一本不为众人所知的小众书. 最近被大家分享很多次的 &#8220;[非常牛逼、相当见血](http://www.bullog.cn/blogs/siyi/archives/194207.aspx)&#8221; 就是其中的一段. 我觉得对于我这样从事科学研究的年轻人来说, 这本书讲的的确的相当见血, 非常受用.

 <span></span>4. _The Rest is Noise_ (Alex Ross)

](http://www.therestisnoise.com/) 是今年 McArthur 奖的获得者之一. 我博客上以前提到的贴乐谱的音乐博客就是这哥们. 他是纽约时报的专栏作家. 这本书等于是20世纪音乐指南. 而且差点拿今年的普利策. 我只读了几章, 爱不释手. 

**B. 编程**

根据 [TopLanguage 论坛上讨论](https://groups.google.com/group/pongba/browse_thread/thread/accb6ea6dc82c4a8/b878d446c959c999)的结果和我自己的研究和几周的思考, 我觉得对于我来说, 以下几门语言值得学:

  * **AppleScript**

AppleScript 最大的好处在于可以控制苹果下的应用程序. 当然这个不是AppleScript 独有的, 因为Ruby/Python 也能很好的完成任务. AppleScript 酷的地方在于, **它非常贴近自然语言.** Java 已经算得上很贴近了, 可是还是受限于关键词和类库. 比如 public static void main 就完全不是合法的英语. Python 稍微好一点, 函数名都比较自然语言, 但是还是不够. 比如 pos = string.find(s,&#8217;^&#8217;) 这一个简单的语句就蕴含了对象方法赋值这两个操作. 对于不懂编程的人, 这些都是需要学习成本的. 而 AppleScript 的思路就比较新颖: 放弃 BNF 的约束, **规定一个更加松散的贴合英语的语法. 然后告诉用户, 哪些词是可以用的动词, 哪些是可以用的名词.** 比如以下是 Adium 编程文档里面的两行:

application n : Adium&#8217;s application class

close v : Close a document.

close specifier : the document(s) or window(s) to close.

这样, 用户就可以用松散的语法规则, 用英语编程. 在 AppleScript 里面, 可以用 a of B, 而不需要 B.a. 种种这些, 让我觉得, 未来的编程语言未必就是一种发展方向, AppleScript 可能是向自然语言编程过渡的一种语言, 值得一学. (Ubiquity 也有动词和名词的说法)

  * **Scala/**[**Clojure**](http://clojure.org/)

随着多核和云计算成了下一代的架构选择, 语言也要变化一下. 这两个语言都是函数式的, 支持分布式的(类似 Erlang), 跑在 JVM 上的. 我一直喜欢 JVM 平台上的语言, 因为 JVM 设计干净, 跨平台, 分布和并发解决的都很好, 也有很多现代特性. 而 x86/IA32 原生的环境, 不见得未来能够被多核环境容纳. 我觉得编程语言也到了 Paradigm Shift 的时候了, 把宝押在 JVM 平台的函数式编程语言上. 

  * **Ruby**

这个原因很简单, 觉得学一个和 Python 竞争的语言对于用 Python 也有启发. 而且的确发现Ruby 的长处, 特别是比较了 Django 框架和 RoR 框架后, 觉得 Ruby 值得一用. 

**C. GTD**

 最近因为写书稿, 事情多, 更加注意事情的组织, 因此总结了几条GTD和时间管理的如下 (我最近一直在注意实践 GTD, 不过我从来没订阅 LifeHacker 和 43 Folders, 因此以下的经验大家或许早就看到或者体会到了)

  * 不要迷信 Moleskines (以及任何工具) 

我以前也没听说过这个笔记本. 最近写书稿, 觉得计算机打字效率低(而且要画图, 涂改, 纸笔最好). 因此到书店买了一本看上去很顺手很结实的软面笔记本, 回来以后才发现是 Moleskines, (据说还是众多大牛用过的, 国内还有专门的博客介绍这个, 顿时感觉自己太他妈的小资了). 用了一段时间 Moleskines, 大体感觉如下:

  1. 结实, 边角圆的, 不容易皱, 对于我这样整天把乱七八糟东西塞包里面的人很实用.
  2. 那个小绳书签其实没用, 因为可以夹一张纸. 小绳老是挂我钥匙圈上
  3. 如果要用它排日程, 最好用专门的日程表. 软面的用来排日程要自己画表格, 画标签, 浪费时间. 
  4. 最有用的是那圈松紧带. 能合上笔记本, 还能夹上很多小便签. 我已经很变态的给我的苹果加上了一圈很难看的绿色的松紧带, 这样我可以夹一些纸. 这个是 Moleskines 最有用的设计了. 
  5. 艺术家其实都是用这个笔记本画图的, 和我们今天的用法千差万别&#8230;.

  * 用好现有工具的基础上试用其他工具, 不要着急换工具

为了写书提纲, 我用了很多工具. Freemind 等等. 到头来发现, 还是文本编辑器最好. 同时, 因为我发现思维比打字快, 而且不习惯在计算机前面书写, 所以我都先用纸笔写, 但是最终必须电子化, 为此我尝试了很多办法, 比如买了一个电子笔记本在上面写, 在 Tablet 上写等等, 结果这些越用越不顺手;  原来我用一个优盘+ rsync 就可以带着所有的书稿到处走, 后来我用 SVN 管理, 又发现每次同步解决冲突麻烦死了 (我的掌上电脑上没有 SVN).  因此, 到最后, 还是采用外带一个优盘到处走的方式. 书写的时候还是用纸笔, 也不搞什么手写笔之类的炫的, 直接等有空的时候敲进电脑. 经过这些折腾, 我的经验就是: 什么顺手, 就坚持用什么. 时髦的新工具不见得最适合. 况且这些旧工具我用得比大多数人都熟悉, 就算用文本组织, 用机械的同步, 效率也不比用其他时髦工具差. 领会了这条, 我就不是太急切的幻想明天出来一个新工具把我的效率提高100%, 因为显然不可能. 

(完)