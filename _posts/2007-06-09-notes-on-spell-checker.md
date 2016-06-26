---
id: 217
title: 拼写检查器的一点注记
date: 2007-06-09T21:52:58+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/06/09/notes-on-spell-checker/
permalink: /2007/06/09/notes-on-spell-checker/
dsq_thread_id:
  - 350033425
categories:
  - Article
  - Linux
---
拼写检查这个东西, 其实就是求文本集合与词典集合的差集. 因此, 使用一点[简单的命令行技巧](http://blog.youxu.info/2007/05/24/setop-under-linux-cli/), 就可以发现拼写错误.

可是实际情况不这么简单, 因为面对的可能不仅仅是纯文本, 比如我在 Linux 下, 最需要拼写检查的是我的网页和我的论文, 也就是 HTML 文件 和 TeX 文件. 不过, Linux 下这些工具早就有了. <a href="http://aspell.net/" target="_blank">Aspell</a> 就是这样一个强大的工具.

Word 和其他的工具都可以执行拼写检查, 不过[Gmail](http://www.gmail.com) 的简单拼写检查实在是方便无比, 强烈推荐大家在需要拼写检查的时候使用.

说到Google, 让我们看看 AI 大牛, Google 研究主任 Peter Norvig 怎样用 <a href="http://norvig.com/spell-correct.html" target="_blank">20 行 Python 代码写一个基于概率模型的拼写检查器</a>. 我利用闲暇时间把这篇文章翻译成了中文 [<a href="http://blog.youxu.info/spell-correct.html" target="_blank">这里</a>].

如果在内存受限系统上开发, 比如嵌入式系统上, Peter Norvig 的方法就不太可行了. 因为连词典存下去都够呛. 这时候, 比较好的方法肯定是用 hash 表. 不过单一 hash 表错误率比较高, 我们可以使用 Bloom Filter [<a href="http://en.wikipedia.org/wiki/Bloom_filter" target="_blank">wiki</a>], <a href="http://lists.canonical.org/pipermail/kragen-hacks/2006-August/000431.html" target="_blank">这里</a>提供了一个简单的实现. 这个实现非常有启发性, 因为他考虑了词的变形, 比如 -es -ing 后缀. Peter Norvig 虽然在文中提到这个问题, 却没有解决这个问题, 有兴趣的读者可以尝试自己重写一下 Peter Norvig 的代码. 我把 Bloom Filter 实现拼写检查的代码重新写了注释[在此](http://blog.youxu.info/Bloomfilter.py).

补几句废话:

1. Python 语言简洁迷人, 这20行代码说明了一切 :)

2. 时间都是挤出来的, Peter Norvig 这篇文章是我陆陆续续每天睡觉前敲几行字翻译出来的. 翻译完了觉得, 人贵有恒.

3. 写这篇完全出于好玩, 我既不是搞自然语言的专家, 也不是Python 高手. 研究方向也和这些不搭边. 因此如果有见识浅陋的地方, 或者遗漏了一些, 大家多交流.