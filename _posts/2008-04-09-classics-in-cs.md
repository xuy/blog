---
id: 535
title: 计算机科学必读经典
date: 2008-04-09T15:33:10+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2008/04/09/classics-in-cs/
permalink: /2008/04/09/classics-in-cs/
dsq_thread_id:
  - 336169545
categories:
  - CompSci
  - Recommend
---
前天看到 [pongba](http://blog.csdn.net/pongba) 说好书太多 以致于没时间写博客, 深有同感. 架子上目前放着 [Dreaming in Code](http://www.dreamingincode.com/) 和 [TAoCP 第四卷第三册](http://www-cs-faculty.stanford.edu/~knuth/taocp.html), 手不释卷, 以至于三上时间都不放过. 细想自己读过的好书不少(至于烂书, 只能用无数这个词来衡量了), 勉强回忆了一些让自己印象深刻的, 写一两句话的点评, 算是我眼中的必读经典吧.

**A类. 基础**
  
**
  
[Structure and Interpretation of Computer Programs (SICP)](http://mitpress.mit.edu/sicp/)**

[](http://mitpress.mit.edu/sicp/)
  
[<img src="http://blog.youxu.info/wp-content/uploads/2008/04/sicp-cover.thumbnail.jpg" alt="SICP" align="left" />](http://blog.youxu.info/wp-content/uploads/2008/04/sicp-cover.jpg "SICP") 计算机程序的构造和解释 (SICP) 堪称是MIT计算机系的镇山之宝之一, 书中通过展示 LISP 语言和程序设计两条主线, 向读者展示了程序设计的几乎所有重要概念. 数十年来各种语言层出不穷, MIT 依然故我给入学本科生教 LISP. LISP 这种函数式的语言, 和过程语言相比, 理论更加优美(lambda 演算), 描述更加简洁. 现代的动态语言如 Javascript, Python 和 Ruby 都或多或少被 LISP 影响. 任何想写具有清晰结构, 或者正确思路的程序的人, 都应当阅读这本书. 好消息是, 这本书是可以在线免费看的.
  
[**
  
The Art of Computer Programming (TAOCP)**](http://www-cs-faculty.stanford.edu/~knuth/taocp.html)

[](http://www-cs-faculty.stanford.edu/~knuth/taocp.html)
  
计算机程序设计艺术 (TAOCP) 是计算机领域的一部未完成的里程碑. 如果之前没有听过它的大名, 那就不算学过计算机科学. Knuth (中文名高德纳) 阅读文献无数, 博古通今, 文风幽默. 书中讲解细致深入, 大开大阖. 如果说 SICP 是练童子功的话, 这本书就是属于名门正派的顶极内功. [<img src="http://blog.youxu.info/wp-content/uploads/2008/04/c0031186_46dce4fb1637c.thumbnail.gif" alt="c0031186_46dce4fb1637c.gif" align="right" />](http://blog.youxu.info/wp-content/uploads/2008/04/c0031186_46dce4fb1637c.gif "c0031186_46dce4fb1637c.gif")TAoCP上往往一个普通的习题, 就是一个很经典的结论; 往往不经意的一句话, 就是一个巧妙的算法. Knuth 常常把貌似不相关的结论深刻的联系在一起, 比如我现在读的第四卷第二册上九连环问题和Gray码是深刻联系的, 易经和生物遗传密码子也是有对应关系的(当然不是民科说的那种).

如此的打通任督二脉的例子和习题俯拾皆是, 真的是穷人进了皇宫的感觉. 即使对于面试工作, 这套书也是值得一翻的: 在Google面试的时候, 面试官问一道题目, 我很快给了一个答案, 其中用到了一个不太显然的结论. 面试官问, 这个结论怎么来的? 我说, TAOCP 第二卷讲了这道题目的一个推广情形. 面试官说, 这道题目就是看面试的有没有看过 TAOCP. 我看很多人面试之前都在网上疯狂做题, 尚不能穷其一隅. 其实读过 TAoCP 的人极少会害怕面试的时候那些技巧性的问题. 万变都极少超出TAOCP划出的框架.

[**Introduction to Algorithm (CLRS)**](http://mitpress.mit.edu/algorithms/)

[<img src="http://blog.youxu.info/wp-content/uploads/2008/04/0262032937-f30.thumbnail.jpg" alt="0262032937-f30.jpg" align="left" />](http://blog.youxu.info/wp-content/uploads/2008/04/0262032937-f30.jpg "0262032937-f30.jpg")算法导论 (Introduction to Algorithm), 在圈子里常常按四个作者的首字母写成 CLRS, 算是对不愿意看或者看不懂 TAOCP 的人送上了半个梯子(还有半个当属具体数学 [Concrete Mathematics](http://www-cs-faculty.stanford.edu/~knuth/gkp.html)). 这本书在美国大部分大学中被列为算法类教材, 在国内也是 ACM 竞赛集训必看的教材之一. 虽然名字里面带一个导论, 内容却一点不含糊. 在我个人看来, 其内容基本覆盖绝大多数常用的算法, 在 NP 复杂性理论以及近似算法方面也有所涉及. 这本书最好的地方是习题详细且全部没有答案, 非常适合作为大学课本和ACM讨论班阅读材料, 最坏的地方也在于没有答案, 对于自学者来说, 可能会觉得枯燥无味且困难重重.

另: 如果有淘老书的习惯, 不妨选择 [The Design and Analysis of Computer Algorithms](http://www.amazon.com/Analysis-Algorithms-Addison-Wesley-Information-Processing/dp/0201000296) (计算机算法设计与分析) 这本书在 CLRS 出现之前绝对是算法教材一哥. 可惜这本书一直没有更新, CLRS 才以算法多而全取胜.

[**Compilers: Principles, Techniques, and Tools**](http://dragonbook.stanford.edu/)

这就是著名的龙书 (Dragon Book) 啦. 和上面的 The Design 一样, 都是 Stanford 教授 Jeffrey D. Ullman 的巨著. 计算机的历史很大程度上是编译器发展的历史. 当年 Knuth 就是因为写了Alogo 60 编译器后, Addison-Wesley 过来找高爷爷约稿, 1962年的时候就让他写本编译器的书. Knuth 写啊写啊, 发现写了很久还没写到主题. 那边编辑急了, 说你都写了3000页手稿了, 你还不交稿. 高爷爷说, 这个, 我还没写到正题呢. 书商说, 算了, 你出多卷本吧. 于是才[<img src="http://blog.youxu.info/wp-content/uploads/2008/04/51xtgj64tzl.thumbnail.jpg" alt="51xtgj64tzl.jpg" align="right" />](http://blog.youxu.info/wp-content/uploads/2008/04/51xtgj64tzl.jpg "51xtgj64tzl.jpg")有了 TAoCP. 这个小故事也就说明计算机编程的发展史和编译器的发展史是平行的. 龙书基本上框出了一个编译器的架子, 从词法句法分析到类型分析 代码生成. 新版加入了JIT, 垃圾收集等现代特性. 这部巨作的作者阵容也是强大的: Alfred Vaino Aho 是 grep 和 awk 的作者. Ravi Sethi 以前在 Bell 实验室, 现在好像是朗讯的首席技术官. Avaya 实验室的头. 至于 Jeffrey Ullman 这个老头, 好玩的趣事就更加多了, 比如他是 Sergey Brin的导师, 他有两大不回信原则: 陶瓷信不回, 问书后习题信不回.

[under construction, more later&#8230;]

Modern OS

(Artificial Intelligence: A Modern Approach(AIMA)

Structured Compter Architecture

Computer Architecture: A Quantitative Approach

Computer Networks

**B类, 编程
  
** 

K&R C

Programming Pearls and More Programming Pearls
  
The Practice of Programming
  
Code Complete or The Elements of Programming Style
  
MMM(Mythical Man Month)
  
GoF&#8217;s Design Pattern
  
The Art of Unix Programming

**C类, Geek**

H2G2
  
GEB
  
How to Solve It
  
Elements of Style
  
The Cathedral and the Bazaar