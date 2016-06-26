---
id: 770
title: 编程珠玑番外篇-A.P2P客户端的策略和奇妙的对策论-1
date: 2008-12-31T19:45:35+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=770
permalink: /2008/12/31/tit-for-tac-and-p2p-software/
dsq_thread_id:
  - 336647220
categories:
  - CompSci
  - pearl
  - Science
tags:
  - pearl
---
(过新年了, 找到了以前写的一篇没发出来的旧文章, 算作一篇贺岁吧)

最近日本著名演员饭岛老师去世了. 在我这个年龄段的人中, 熟悉饭岛老师的相信十有八九都是通过奇妙的叫做 bt 或者 电驴 的软件认识的. 今天我们就来八卦一下程序设计人员是如何_设计这些客户端的策略使得您既能下载欣赏到饭岛老师的片子, 又不会浪费您太多的上传带宽_的. 简单的说, 就是 P2P 软件的客户端的策略该如何设计, 使得整个系统能够帮助每个用户获得相应的利益最大化.

要研究这个问题, 我们得从博弈论谈起. 但是因为这个是给程序员看的八卦, 不是数学专业课, 我们不在这里说太多的数学, 而是用例子和八卦引入.

大家都知道, 1994 年的诺贝尔经济学奖给了一个数学家, 约翰.纳什 (电影&#8221;美丽心灵&#8221;为证). 纳什的理论工作是推广了冯诺伊曼开创的极大极小定理(博弈论的基本定理). 而在通俗的对博弈论的介绍中, 提到纳什, 一般都是着重在纳什均衡和囚徒困境上. 我们不具体深究纳什均衡的数学意义, 而是以下面一个具体的极其简化的例子来说明囚徒困境:

假设 BT 网络中两个节点 阿强(A) 和 B哥(B) 要交换文件. 文件很大, 我们假设需要非常多轮交换才能完成. 每一轮, 每个节点可以选择 平衡上传/下载 和 几乎不上传/贪婪下载两组策略. 我们按照博弈论的一般用语, 把第一种策略称为 C(合作), 第二种称为 D(叛变). 同时, 假设A, B 都是使用 ADSL 网络, 所以上传成本比下载成本要高很多, 我们在计算回报的时候考虑这样的不对称. 现在, 假设 A 和 B 各自有对方需要的文件, 那么, 如果 A, B 同时选择策略 C, 即平衡的上传和下载, 他们得到的回报都是 3, 如果其中一个人偷鸡选择 D, 即几乎不上传, 光下载; 而另一个节点选择 C, 则选择 D 的能够下载到所要的文件且几乎不需要付出上传的代价, 我们记回报为 5, 而另一个人付出了上传的费用, 却得到了一点点的下载, 可以把回报看成是0. 如果两个人都选择贪婪下载, 几乎不上传, 那么两个人都得到了一点点下载, 现在这样的下载量没有3多, 但是因为本身付出的上传成本也少, 我们把这时候两者的回报都定为 1.

说了这么多, 只是为了让问题更加的真实. 这些交代的条件的数学本质, 可用表格表示, 博弈论中称之为支付矩阵:

C D
  
C (3,3) (0, 5)
  
D (5,0) (1, 1)

现在的问题是, 阿强和B哥都是理性的, 也是自私的, 因此, 他们都认为, &#8220;假如我选 C, 对方可能选 C 或者 D, 那么我这个策略最糟糕的情况下收益是 0, 而假如我选 D, 最糟糕的情况下收益是 1&#8243; 那么, 因为 D 下最糟糕的收益比 C 最糟糕的情况下收益要大, 理智的人肯定选D. 我们看到, 两者选择 D 都是理性的, 但是实际上从对两者的收益分析看, 两者都选择 C 才是更加优的. 这个表面上看上去很理智但是最后没有到达对双方最好的结果的困境, 就是所谓的囚徒困境. (看过这篇八卦, 您也可以叫做饭岛老师困境)

关于囚徒/饭岛困境的简单介绍就到这里, 现在我们看我们的原始问题. 我们知道, BT 交换文件是分成一块一块的, 也就是说, 是一次一次的交换的. 我们把每次交换叫做一轮的话, 整个系统是一个多轮的博弈问题(或者叫做多阶段的博弈问题). 这个博弈问题, 就显得好玩起来了. 为什么呢, 因为多阶段博弈, 居然能够让自私的A和B两个节点为了自己的利益, 进化出合作来.

我们先简单的说明一下多阶段博弈不必然的能跳出囚徒困境. 比方说, 如果 A 和 B 知道一共有 N 轮博弈, 那么最后一轮, 理智的他们肯定都陷入了囚徒困境, 在第 N 轮 的策略清楚之后, N 的问题就转化为 N-1 轮的问题. 所以, 必然的, A 和 B 在所有 N 轮上, 都会陷入囚徒困境 (好比奸商一辈子只和你做有限次买卖的话, 就会一直黑你, 不黑白不黑). 他们等到花儿也谢了, 也不能得到自己想要的内容. 但是, 问题的奥妙在于, 假如A 和 B 不知道一共多少轮, 或者有无限轮呢? 假如阿强在某轮选择平衡的上传和下载(C), 则可能正好碰上 B 哥 也选择&#8221;友好合作&#8221;, 那么, 两个人都舒舒服服的交换了饭岛老师的片片. 所以, 对于一个设计良好的BT客户端, 问题的关键在于怎么选择自己的策略, **使得既能完成自己自私的下片目标, 又能注意和其他客户端良好的合作使得自己的收益最大, 而不在于在特定的一轮中自己的得失**.

这里, 我们的目标是设计一个良好的策略. 通常, 在设计一个实践中性能良好的算法的时候, 数学家和计算机科学家在这里的方法就鲜明的分野了. **数学家, 会证明这样算法的存在性, 性能上下界, 和众多的必要条件, 以及算法之间在最理想的情况下的好坏比较. 而计算机科学家, 会像搭积木一样, 用不同的基本模块, 直接尝试不同的组合, 一一做实验, 看哪种方法最好**. 在这里, 我仅介绍一种计算机科学家的方法: 通过让不同方法比赛, 取出赢家, 赢家的方法最好的方法. 其实准确的说, 这个就是达尔文的适者生存的方法. 而这个比赛本身又是一段非常有趣的八卦, 因此我着重花笔墨介绍一下.

在心理学和行为学领域, 有一本非常著名的书, 叫做<合作的进化>. 其作者, 记载了在80年代, 他组织的两次比赛, 叫做IPD (Iterative Prisoner&#8217;s Dilemma, 多轮囚徒困境). 竞赛的目的是在一个多轮的囚徒困境中找出最好的策略, 参赛者自己写好算法程序, 然后由组织者让这些程序两两对弈, 看谁在多轮囚徒困境中得到最多的分. 在所有的数学家计算机科学家等提交的很多程序中, 表现最好的一个策略, 超乎寻常的只有四行简单的 Basic 程序. 这四行 Basic 程序, 勾勒出了一个叫做 &#8220;针锋相对&#8221; 的算法(Tit for Tat).  这个算法策略很简单, 一开始采用合作, 假如对方上一轮合作, 则本轮合作. 如果对方上一轮对抗, 则本轮对抗. 用中国人熟悉的话说, 叫做&#8221;人不犯我, 我不犯人; 人若犯我, 我必犯人&#8221;. (四句话正好对应四行程序, 不是巧合). 其他的算法, 比如随机算法呀, 永远敌对的算法呀, 都比不过这个算法. 因此, 这个算法赢得了第一年的竞赛.

第二次, 各位吸取教训, 继续开发好算法. 猜猜第二次谁赢了? 居然还是那四行程序! 在合作的进化中, 作者从&#8221;宽容, 以牙还牙&#8221;等社会学的角度去解释为啥这四行程序会赢. 或许对人生有深刻思考的人会感叹, 这四行程序的确蕴含了深刻的智慧. 但是, 很不幸的是, 这个程序在现实中, 有一个非常大的漏洞, 而因为这个漏洞, 使得BT程序如果不修改策略, 先现实中会寸步难行. 这个看上去非常理智非常聪明的策略到底是怎样的大漏洞呢, 我先卖个关子, 下回分解.

(想看剧透的, 可以看 Wikipedia 的条目: Tit for Tat: [http://en.wikipedia.org/wiki/Tit\_for\_Tat](http://en.wikipedia.org/wiki/Tit_for_Tat) )

<span style="color: #ff0000;">新年快乐!</span>