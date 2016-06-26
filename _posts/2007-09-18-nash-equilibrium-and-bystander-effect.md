---
id: 435
title: 'Guest Blog-9 从纳什均衡看旁观者效应 &#8212; By Zhiqiang Zhang'
date: 2007-09-18T18:21:35+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2007/09/18/nash-equilibrium-and-bystander-effect/
permalink: /2007/09/18/nash-equilibrium-and-bystander-effect/
dsq_thread_id:
  - 356780590
categories:
  - Guest Blog
  - Science
---
> **作者介绍**: 张志强, 清华大学 [理论计算机科学研究中心(ITCS)](http://itcs.tsinghua.edu.cn/) 三年级博士生. 师从著名计算机科学家[姚期智](http://castu.tsinghua.edu.cn/yao/)教授. 在此之前, 他在北京大学数学系取得本科学位. 他在计算机和数学方面获得的一些荣誉和经历包括 42届 IMO满分金牌, 2004 ACM/ICPC 上海区前5, 密歇根大学(University of Michigan) 访问学者, 微软亚洲研究院和 Google 中国实习生等. 我通过阅读他的博客与他认识, 并很荣幸的被他列为[特别好友](http://zhiqiang.org/blog/link) :). 他的博客[阅微堂](http://zhiqiang.org/blog/)亦属中文博客中少数精品. 更多的信息可以访问他的[个人网站](http://zhiqiang.org/index.html), 或者[订阅](http://feeds.feedburner.com/zhiqiang)他的[个人博客](http://zhiqiang.org/blog/).

**从纳什均衡看旁观者效应** 本文原发 [阅微堂](http://zhiqiang.org/blog/) [原文链接](http://zhiqiang.org/blog/671.html).

> 1964年3月13号凌晨3点，纽约酒吧经济Kitty Genovese在即将到达寓所时，遭到持刀暴徒的侵犯，她惊恐的尖叫并恳求帮助。但她的38户邻居，很多人走到窗户前观望了片刻，目睹她在歹徒手中挣 扎，但直到歹徒离开，才有人打电话报警。但Genovese却未能得到及时救治很快就死去了。<sup>[1]</sup>

为什么Kitty的邻居没有一个人援助她？人们普遍归因于人的异化与冷漠。但心理学家有不同的看法，大量的实验和研究显示**在公共场所观看危机事件的旁观者越多，愿意提供帮助的人就越少**，这被称为**旁观者效应**。

为什么会这样呢？心理学家

> &#8230;猜测，当旁观者的数目增加时，任何一个旁观者都会更少地注意到事件的发生，更少地把它解释为一个重大的问题或紧急情况，更少地认为自己有采取行动的责任。<sup>[1]</sup>

下面用经济学中的纳什均衡的方法定量地说明，在人数变多时，的确是任何一个人提供帮助的可能性变小，而且存在某人提供帮助的可能性也在变小！通俗的 说，在开头的报警案例中，围观者（邻居）越多，报警的可能性越小！ (这些来源于2年前与同学的讨论，只不过当时还不知道心理学上也有对应的分析。)

在这里假设人都是利益动物（也就说下面的分析不考虑社会心理学中提到的人的心理因素）。在最开始的抢劫案件中，假设有<img src="http://zhiqiang.org/blog/wp-content/cache/tex_7b8b965ad4bca0e41ab51de7b31363a1.gif" class="tex" alt="n" align="absmiddle" />个围观者，有人提供帮助（报警），每个人都能得到<img src="http://zhiqiang.org/blog/wp-content/cache/tex_0cc175b9c0f1b6a831c399e269772661.gif" class="tex" alt="a" align="absmiddle" />的固定收益，但报警者会有额外损失<img src="http://zhiqiang.org/blog/wp-content/cache/tex_92eb5ffee6ae2fec3ad71c777531578f.gif" class="tex" alt="b" align="absmiddle" />（可以看成提供帮助所消耗的时间，精力或者报警者所可能遇到的危险——注意最近的彭宇案件）。容易知道，在<img src="http://zhiqiang.org/blog/wp-content/cache/tex_8fe3ea8509be63e0d0102d6263733ded.gif" class="tex" alt="b>a" align="absmiddle" />时，**一个完全理性的人不可能去**报警，所以我们只考虑<img src="http://zhiqiang.org/blog/wp-content/cache/tex_8af6745ba436ee1108a080cd230c48a6.gif" class="tex" alt="0\leq b \leq a" align="absmiddle" />的情形。我们来分析一下，在这个模型里面，每个人将如何行动？

按照上面的假定，对于某个人A而言，他的收益矩阵为：

<p align="center">
  <table unselectable="on" align="center" border="1" cellpadding="2" cellspacing="0" height="74" width="837">
    <tr>
      <td width="200">
        &nbsp;
      </td>
      
      <td width="200">
        其他n-1个人不报警
      </td>
      
      <td width="200">
        其他n-1个人有人报警
      </td>
    </tr>
    
    <tr>
      <td width="200">
        A不报警
      </td>
      
      <td width="200">
      </td>
      
      <td width="200">
        <img src="http://zhiqiang.org/blog/wp-content/cache/tex_0cc175b9c0f1b6a831c399e269772661.gif" class="tex" alt="a" align="absmiddle" />
      </td>
    </tr>
    
    <tr>
      <td width="200">
        A报警
      </td>
      
      <td width="200">
        <img src="http://zhiqiang.org/blog/wp-content/cache/tex_8ca2ed590cf2ea2404f2e67641bcdf50.gif" class="tex" alt="a-b" align="absmiddle" />
      </td>
      
      <td width="200">
        <img src="http://zhiqiang.org/blog/wp-content/cache/tex_8ca2ed590cf2ea2404f2e67641bcdf50.gif" class="tex" alt="a-b" align="absmiddle" />
      </td>
    </tr>
  </table>
  
  <p>
    我们求上面的收益矩阵的纳什均衡，由于每个人都是对称的（暂且只考虑对称的纳什均衡），无妨假设每个人<strong>不报警</strong>的概率为<img src="http://zhiqiang.org/blog/wp-content/cache/tex_83878c91171338902e0fe0fb97a8c47a.gif" class="tex" alt="p" align="absmiddle" />，不难得到纳什均衡在<img src="http://zhiqiang.org/blog/wp-content/cache/tex_bbce20caa67afbe56f195c7ee50a854c.gif" class="tex" alt="p=(\frac{b}{a})^{\frac1{n-1}}" align="absmiddle" />达到。注意<font color="#ff0000"><img src="http://zhiqiang.org/blog/wp-content/cache/tex_83878c91171338902e0fe0fb97a8c47a.gif" class="tex" alt="p" align="absmiddle" />是随着人数<img src="http://zhiqiang.org/blog/wp-content/cache/tex_7b8b965ad4bca0e41ab51de7b31363a1.gif" class="tex" alt="n" align="absmiddle" />增大而增大的！更重要的是，存在某人报警的概率<img src="http://zhiqiang.org/blog/wp-content/cache/tex_1005d2ead091ed2116aad6d3c2d99d55.gif" class="tex" alt="1-p^n=1-(\frac{b}{a})^{\frac{n}{n-1}}" align="absmiddle" /> 随着人数的增加而减少！</font>
  </p>
  
  <p>
    注意，上面的结果也提供了报警的概率与 <img src="http://zhiqiang.org/blog/wp-content/cache/tex_7756054cd009f0b026e285b9c68bb181.gif" class="tex" alt="\frac{b}{a}" align="absmiddle" /> 的相关关系。
  </p>
  
  <p>
    更多推断：
  </p>
  
  <ul>
    <li>
      相对而言，城市居民比小乡村居民更冷漠：在人少的地方获得帮助的可能性反而更大。
    </li>
    <li>
      朋友并不是越多越好的(?)
    </li>
    <li>
      求助时不要同时向若干人求助，即便如此也不要让他们互相知道。
    </li>
    <li>
      常在新闻里看到，一人受伤或者&#8230;，多少多少人围观，却没有人提供帮助。其实，多少人围观，与是否会有人提供帮助的关系并不太大——注意在上面的计算中，当n>3时（这时候才算围观吧），有人提供帮助的概率<img src="http://zhiqiang.org/blog/wp-content/cache/tex_aacd8139321720868c8a7e9f25714d05.gif" class="tex" alt="1-p^n" align="absmiddle" />与n的关系不大。
    </li>
    <li>
      一个社会的道德水平，如不考虑别的因素（社会和心理上的），将由<img src="http://zhiqiang.org/blog/wp-content/cache/tex_92eb5ffee6ae2fec3ad71c777531578f.gif" class="tex" alt="b" align="absmiddle" />和<img src="http://zhiqiang.org/blog/wp-content/cache/tex_0cc175b9c0f1b6a831c399e269772661.gif" class="tex" alt="a" align="absmiddle" />的比值决定，而在受益<img src="http://zhiqiang.org/blog/wp-content/cache/tex_0cc175b9c0f1b6a831c399e269772661.gif" class="tex" alt="a" align="absmiddle" />确定的情况下，完全由<img src="http://zhiqiang.org/blog/wp-content/cache/tex_92eb5ffee6ae2fec3ad71c777531578f.gif" class="tex" alt="b" align="absmiddle" />决定，这里的<img src="http://zhiqiang.org/blog/wp-content/cache/tex_92eb5ffee6ae2fec3ad71c777531578f.gif" class="tex" alt="b" align="absmiddle" />是提供帮助的成本（包括时间，精力，以及有可能遭致的打击报复，甚至忘恩负义者的反咬）。
    </li>
    <li>
      和谐社会，需要努力降低前面的<img src="http://zhiqiang.org/blog/wp-content/cache/tex_92eb5ffee6ae2fec3ad71c777531578f.gif" class="tex" alt="b" align="absmiddle" />值，通过给与金钱上或者精神上的奖励。
    </li>
    <li>
      最近的彭宇事件，根据网络上的反应，这件事情大大提高了<img src="http://zhiqiang.org/blog/wp-content/cache/tex_92eb5ffee6ae2fec3ad71c777531578f.gif" class="tex" alt="b" align="absmiddle" />，将导致道德水平下降。
    </li>
  </ul>
  
  <h4>
    参考：
  </h4>
  
  <p>
    [1] David G. Myers, Social Psychology &#8211; <a href="http://www.douban.com/review/1198155/" target="_blank">社会心理学</a>, P363-369.
  </p>