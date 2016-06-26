---
id: 724
title: 编程珠玑番外篇-8.Smalltalk 中的珠玑
date: 2008-11-30T12:52:48+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=724
permalink: /2008/11/30/pearl-in-smalltal/
dsq_thread_id:
  - 337391299
categories:
  - CompSci
  - pearl
  - tech
tags:
  - history
  - java
  - pearl
  - smalltalk
---
如果我们能够重回1980年, 回望整个计算机编程语言领域, 特别是工业界编程, 打死也不会想到日后 Java 这种无名小卒, 以及 C++ 这个又面向对象又支持过程的双面间谍能够红得发紫. 当年最流行的语言, 当属 FORTRAN, C 和 Smalltalk. 前两个我们按住不表, 单说这个 Smalltalk. 我们现在的教科书基本都不介绍 Smalltalk, 或者就用一句: Smalltalk 是第一个纯面向对象的语言 概括过去. 其实 Smalltalk 中有很多的好的思想, 一直在今天都发挥着魔力. 

<div id="attachment_727" style="width: 350px" class="wp-caption alignright">
  <img class="size-medium wp-image-727" title="star" src="http://blog.youxu.info/wp-content/uploads/2008/11/star.jpg" alt="" width="340" height="244" />
  
  <p class="wp-caption-text">
    施乐当年的图形界面(来源: harding.edu)
  </p>
</div>

为提起大家兴趣, 我先说血统和设计等八卦. Smalltalk 的血统是算得上高贵的, 来自当年超级牛逼的 施乐 PARC 实验室. 施乐的 PARC 干过很多事情, 比较著名的一个故事是说乔布斯同学去参观, 看见那边科学家已经做出了 GUI (图形界面程序), 于是偷偷的回家搞 Macintosh, 搞好之后在1984年发布, 卖得大大的好, 赚得盆满钵盈. 西雅图当时有个大学没毕业做软件的小伙子, 看见乔老师赚了大钱, 想想觉得自己的人生挺没意思的, 只是和 IBM 做订购 DOS 的生意, 于是起了自立为王的念头; 加上看到乔老师的苹果机一个窗口一个窗口的很好玩, 于是一激动就自己搞了一个 Windows. (这个作软件的小伙子就是比尔盖茨啦). 这小伙子很牛, 把乔老师的苹果机逼到了角落里. 乔老师是最不能咽下恶气的人, 于是连在 Stanford 演讲了时候还不忘提一下微软抄苹果. 法律上就更不要说了, 两家公司之间旷日持久的 GUI 专利权官司从1988年打到1994年. 两家公司都一步不让. 最后施乐火了, 跳出来大喊一声: 靠, GUI 乃是我发明的. 于是把苹果给告了. 所谓螳螂捕蝉, 黄雀在后, 苹果被施乐这么一搞, 自己抄别人的老底就被挖出来了, 告微软就显得特别勉强, 所以官司最后也没赢, 以苹果无理取闹失败为结果.

施乐不光用 GUI 引领了我们现在计算机图形界面, 还发明了以太网, 鼠标, 所见即所得的编辑器等. 要不是这几样东西, 现在的计算机说不定是另一个样子呢. 言归正传, 前有施乐 PARC 出品了这么多伟大产品, 后加上 Alan Kay 这种牛人主导设计, Smalltalk 的血统之好, 和出自 AT&T Bell 实验室的 C 是有一拼的. C 还是两个人无聊敲打出来的, Smalltalk 是正儿八经作为一项研究弄出来的产品.  

事实上 Smalltalk 的确也是划时代的产品. 我就说我知道的两个部分. 

第一是现代程序员耳熟能详的 [MVC](http://en.wikipedia.org/wiki/Model-view-controller) 结构以及整个 Design Pattern 的思想. MVC 出现在 Smalltalk 中并不是偶然的. 当年施乐开发 Smalltalk 主要是用来做图形界面编程的, 而图形界面的编程首先就是从施乐发明图形界面开始的. 试想一个程序员成天写命令行程序, 肯定是不会太在意 MVC 的分离. UNIX 世界中并没有MVC的对应物, 因为压根不需要. 而图形界面程序的复杂度比其他程序要高太多了, 因此自然的就产生了 MVC 这样解开功能模块耦合的自然的设计. MVC 的重要程度和流行程度可以从两个小事情看出来. 第一是著名的 [GoF 书](http://en.wikipedia.org/wiki/Design_Patterns), 翻开第一章第二节就开始讲 MVC, 用 MVC 作为整本书的纲领章节, 可见其重要程度. 第二是众多的 Java 框架, 比如Struts, JSF, 里面的对象就很直白的叫做 XXModel 或者 XXViewer. 这些传统都是从 Smalltalk 开始的, MVC 的影响一直到今天还到处都是. Smalltalk 不光催生了 MVC, 也催生了 Design Pattern. 细心阅读 GoF 的 DP 书我们就会发现, 里面所有的 Pattern 大多是在设计一个所见即所得的编辑器的背景下提出来的. 而上面我们已经说了, 施乐是第一家搞这个玩意的. 如果我们追溯 Smalltalk 早期很多的论文, 很明显可以看出, 虽然没有用 Design Pattern 这个词, 开发的时候要遵循一定的&#8221;对象结构&#8221;的思想是随处可见的. 

第二是我认为非常重要的: 运行时类型信息支持, 或者叫反射. 简单的说, 就是一个对象在运行的时候能够知道自己的类型(类名称), 以及这个类有哪几个方法, 哪几个字段等等. 

关于反射的基本概念在脚本语言里面是屡见不鲜的了. 大家都知道, LISP 里面的 eval 后面可以加任何的字符串, 构造出一个运行时对象. 脚本语言实现反射也很简单: 本来就是解释执行的语言, 多一个 eval 等价于多调用一次解释器而已. 而编译型语言就麻烦了, 因为解释器已经在编译期用过了, 运行的时候解释器是不存在的. 这样, 就造成了编译型语言没有运行时信息这个本质困难. Smalltalk 用了一个巧妙的方法解决了这个问题, 也就是 Java 和 Python 等现代语言用的方法: 虚拟机. 能编译的代码被先编译, 需要解释的代码在运行时可以被虚拟机自带的解析器再解析. 除了加入一个小的解释器到虚拟机外, Smalltalk 更进一步, 把对象的元信息也抽象成一个对象, 这样运行时需要的一个对象的所有元信息都能在面向对象的标准框架下表达. 我们用类 Java 的语言来举例: 一个叫 a 的 Foo 对象, 包含一个 a.hello() 的方法, 这个方法既可以通过 a.hello() 来调用, 也可以通过 a.class 先得到 a 的类, 再通过 a.Class.findMethod(&#8220;hello&#8221;) 找到这个方法. 最后再通过 .invoke() 调用这个方法. 这样的流程在没有虚拟机的 C++ 里面是没法完成的. 

在1980年, 这个反射机制的划时代意义是怎么说都不为过的. 我以我熟悉的 [JUnit](http://www.junit.org/) 的进化史为例说明这个议题. 

现在做单元测试的框架, 一般都被称为 xUnit 家族. xUnit 家族最早的成员, 不是 JUnit, 而是 SUnit (Smalltalk Unit). SUnit 的历史比 Junit 悠久得多, 大约在1994年的时候, [Kent Beck](http://en.wikipedia.org/wiki/Kent_Beck), 也就是 Junit 的作者之一, [写了 SUnit](http://www.xprogramming.com/testfram.htm). 而后才有了 JUnit (1998). 所以, 在 [SUnit 的网站上](http://sunit.sourceforge.net/), 极其显摆的写着&#8221;一切单元测试框架之母&#8221; (The mother of all unit testing frameworks). 事实上这是大实话 &#8212; 所有单元测试框架里面的名词术语, 都从 Sunit 来的, 如 TestCase, Fixture 等等. 

既然 SUnit 和 Junit 是同一个作者, 而早在1996年, Java 就已经成为工业界炙手可热的语言, 为什么要等到两年之后, JUnit 才横空出世呢. 这里面的原因说简单也简单: 自动单元测试需要反射支持.  1998 年前的 Java 没有反射, 直到1998年 Java 1.2 发布, 反射才完整的被支持. 所以, 只有1998年之后, Java 才有办法做自动单元测试. 

我们回顾一下 Junit 的工作流程: 继承一个 TestCase, 加入很多以 test 开头的方法, 把自己的类加入 TestSuite 或者直接用 TestRunner, 让测试跑起来. Junit 能够自动覆盖所有 test 开头的方法, 输出红棒绿棒. 这地方的关键是自动覆盖. 假如每个测试都是靠程序员自己写 printf 比较, 那不叫自动. 假如每个 TestCase 里面的每个 test 开头的方法都要程序员自己写代码去调用, 那也不叫自动. **所谓的自动, 就是在机器和人之间形成一定的规约, 然后机器就去做繁琐的工作, 最小化人的工作**(RoR就是很好的例子). 

注意到我们的需求是 &#8220;让 Junit 自动调用以 test 开头的方法&#8221;, 而不需要自己很笨的一个一个自己去调用这些方法. 这意味着 Java 语言必须支持一个机制, 让 JUnit 知道一个测试类的所有方法名称, 然后还能挑出 test 开头的方法, 一一去调用. _这不就是反射么_! 事实也证明了这一点: 目前互联网上找到的最早的 Junit 的源代码, 1.0 版的核心就只用了一个 Java 的标准库: reflect. 相反, 不支持反射的语言, 就得告诉单元测试的框架我要运行哪些. 比如说 C++ 的单元测试框架 CppUnit, 就很不方便&#8211;必须告诉框架我要测哪几个函数, 就算他们以 test 开头也不行. 还有一个好玩的例子是 J2ME 的测试框架. J2ME 是 Java 小型版, 不支持 reflect, 因此, JUnit 平移不上去. 如果细看所有的这些移植 JUnit 的尝试, 很容易发现, 移植出去的版本作用到有反射机制的语言上, 使用起来就很方便, 就比较成功, 比如NUnit; 没反射机制的就比较麻烦, 用的人也相对少, 比如 CppUnit 和 J2MEUnit. 反正任何对于 JUnit 的移植, 都绕不开&#8221;反射&#8221; 这个机制. 有反射者昌, 无反射者弱. NUnit 这个移植版本, 还曾经被 Kent Beck 夸设计好, 其原因, 与 C# 语言比 Java 更加良好的 attribute 和 反射机制, 是息息相关的. 

此外, 现代框架中流行的 依赖注射 (Dependency injection), 反转控制 (Inversion of control), 都是基于反射的. 这也就是为啥用传统的不支持反射的语言很多年的人很少听过这些名词的原因. 

有兴趣的读者可以继续阅读 wikipedia 关于[反射](http://en.wikipedia.org/wiki/Reflection_(computer_science)) 和 [元编程](http://en.wikipedia.org/wiki/Metaprogramming) 这两篇文章, 相信会得到更加多的启示. 

<div id="attachment_728" style="width: 169px" class="wp-caption aligncenter">
  <img class="size-medium wp-image-728 " title="7-altost-small" src="http://blog.youxu.info/wp-content/uploads/2008/11/7-altost-small-255x300.jpg" alt="Smalltalk 的IDE 开发环境 (来源: arstechnica.com)" width="159" height="187" srcset="http://blog.youxu.info/wp-content/uploads/2008/11/7-altost-small-255x300.jpg 255w, http://blog.youxu.info/wp-content/uploads/2008/11/7-altost-small.jpg 400w" sizes="(max-width: 159px) 100vw, 159px" />
  
  <p class="wp-caption-text">
    Smalltalk IDE (arstechnica.com )
  </p>
</div>

除了以上两点, IDE 和库的思想. 我们今天用的标准名词, 如&#8221;方法&#8221;, &#8220;字段&#8221;, 都是来自于 Smalltalk 的. 这些也都是划时代的工作, 因为我不熟悉, 也不敢不懂装懂的展开介绍了.  
  
有时候回看历史, 特别是回看编程语言的设计和进化的历史, 会发现很多散在的晶亮的珠玑. 

(完)