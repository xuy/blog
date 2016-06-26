---
id: 569
title: 眼前有景道不得, 崔颢题诗在上头
date: 2008-06-03T20:31:19+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2008/06/03/unsurpassable-introduction-to-chinese-ime/
permalink: /2008/06/03/unsurpassable-introduction-to-chinese-ime/
dsq_thread_id:
  - 342985677
categories:
  - AI
  - Article
  - CompSci
  - Cool Stuff
---
一年前我在写[别拿技术忽悠人](http://blog.youxu.info/2007/04/04/gfan_and_guge/)之后, 就想专门写一篇文章, 讲讲中文输入法的实现方法. 后来有人批评小企鹅的代码风格不好, 我还专门看了小企鹅的源代码, 写了[不该指责别人代码风格的10个原因](http://blog.youxu.info/2007/07/10/10-reasons/). 再后来因为自己的G4老苹果上使用 [FIT 输入法](http://fit.coollittlethings.com/)速度比较慢, 为了给个别地方做优化, 又细看了 FIT 的源代码, 基本上把 FIT 的架构也弄得很清楚了. 所以, 一直想专门写一篇文章, 讲讲输入法里面的前缀树, 统计语言模型等好玩的有趣的东西. 可是一直拖着, 也比较懒, 就从来没下决心动笔.

我喜欢研究中文输入法的原因也很好理解. 这个东西麻雀虽小, 五脏俱全. 从发展的过程来看, 以前的中文输入法就是字母到汉字的映射, 一点都不能错. 比如五笔型. 后来慢慢的以词为单位的输入, 很多用拼音的人速度开始超过用五笔型的. 再慢慢的, 微软出了微软拼音, 整句输入开始占上风. 打整个句子非常顺畅. 所有的这些, 其实都是底下数学模型的发展和词库数据的不断完备带来的, 虽然一般的用户并不觉察. 在用户的不知不觉中, 输入法慢慢迁移到基于统计语言模型了.  这些一代一代的输入法的变迁, 正好反映了从简单的规则算法到智能的基于机器学习的算法的变迁. 因此, 研究输入法就是研究一个经过很多代进化的实际有用的算法, 这个过程会非常有乐趣. 其次, 研究一个输入法, 要比研究一个语音识别简单多了.  而两者根本模型却大差不离. 因此研究输入法属于很讨巧的事情.  再次, 就我个人经验, 捣鼓一下输入法, 用几行编程技巧, 改几个简单的模型, 或者优化一点小小的数据结构, 都能让效果立刻体现, 这其中的满足感不是其他人能体验的.  因为以上的这些原因, 我特别喜欢研究捣鼓中文输入法.

且说昨天发现 SUN 的 SUNpinyin 输入法, 读了几行源码, 欣欣然, 刚想动笔写一篇 **语言模型在输入法整句匹配中的应用**, 结果发现人家早就写了,而且写的比我想写的要好至少一个数量级. 这是由一个参与 Sunoinyin 维护 SUN 的工程师所写, 专栏叫 &#8220;[SUN pinyin 代码导读](http://blogs.sun.com/yongsun/sunpinyin)&#8220;. 文章深入浅出, 细节交代很清晰, 我读完以后只能长叹 &#8220;眼前有景道不得, 崔颢题诗在上头&#8221; . 想了解输入法的同学千万不可错过[这个专栏](http://blogs.sun.com/yongsun/tags/sunpinyin).

另外苹果用户可试用一下这个输入法,理论上(仅仅理论上) 这个输入法要比 FIT 更加好用, 因为目前按照我读代码的理解, FIT的整句匹配效果应该不如 SUN的这个.

(最后, 感谢 [Yuking](http://www.fcitx.org/main/), [Huajun](http://fit.coollittlethings.com/), [Yongsun](http://blogs.sun.com/yongsun/) 和 [Phillzh](http://www.opensolaris.org/viewProfile.jspa?id=43520). 若没有他们对开源社区的贡献, 我是不可能读到任何关于中文输入法的代码的)

<hints id="hah_hints"></hints>