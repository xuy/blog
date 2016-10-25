---
id: 1323
title: 深度学习 Meetup 总结
date: 2016-10-23T12:33:01+00:00
author: Eric Xu
comments: true
layout: post
guid: http://blog.youxu.info/?p=1323
permalink: /2016/10/23/tech-meetup/
categories:
  - startup
tags:
  - deep-learning
comments: true
---

前几天参加湾区同学技术沙龙组织的一次专门面向深度学习的 meetup。做了一些笔记如下。

这次活动的嘉宾包括 Google 的 Yonghui Wu ([GNTM 系统](https://arxiv.org/abs/1609.08144)一作)，Kai Chen (Google Brain 早期成员，经典 [Word2Vec 论文](https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf)共同作者），Yuan Li (Google Research TLM)，以及 Zhenghua Yu (VP, Bocom).

因为活动以问答形式展开，我也以问答形式记录。

#### Q1: 这几年深度学习方向有哪些很重要的突破?

Yuan 首先谈到了视觉领域的一些突破。实际上我们都知道引爆这轮深度学习热潮的，就是 2012 年把第二名甩出十几个百分点(以分类精度测量)的 [AlexNet](https://papers.nips.cc/paper/4824-imagenet-classification-with-deep-). 在 AlexNet 之后，视觉领域比较有代表性的几个网络是 Oxford VGG, [GoogLeNet (Inception Module)](https://arxiv.org/abs/1409.4842), [ResNet](https://arxiv.org/abs/1512.03385) 和最近的 [InceptionResNet](https://arxiv.org/abs/1602.07261).

Yonghui 和 Kai 谈到了自然语言处理里的一些突破。大家熟知的 Word2Vec 以及后续的一些工作如 [GloVe](http://nlp.stanford.edu/projects/glove/). [Seq2seq](https://arxiv.org/abs/1409.3215) 做为一个通用框架已经在自然语言处理领域四处开花，包括翻译，标注等一系列的自然语言处理任务都可以直接上 Seq2seq.

#### Q2: 还有哪些有趣的 AI 问题值得探究？

众多嘉宾都纷纷表示尽管这个领域现在 hype 很多，总的来说这个领域才刚刚开始，要研究的问题很多。在理论层面就有许多亟待解决的问题。在具体的应用层面，尽管翻译和语音识别等等问题看上去都已经解决，但开放式的对话问题仍然没有解决。从深入生活的应用来看，可以和人交流和帮助完成家居任务的机器人，可以做为医疗助手的人工智能，可以智能控制交通的调度系统等等都是很有趣的问题。Yuan 还提到了目前在视觉方向搭更大更深的网络已经不是潮流了，更多的分类标签，更加难的基准，如 [MsCoCo](http://mscoco.org/)，是现在众多研究者的发力方向。

#### Q3: 深度学习取得的进展更多是科学还是工程上的？

在这个问题上，Yonghui 非常具体的谈了他实现 GNMT 的经历。NMT 的构想，最早可以追溯到 Yoshua Bengio 的 Word Embedding 开山之作，[A Neural Probabilistic Language Model](http://www.jmlr.org/papers/v3/bengio03a.html)。 之后，词嵌入技术，Seq2seq 框架，以及 Attention Model 等等一起，奠定了 NMT 的理论基础。然而，NMT 最早在基准数据上，效果是低于 Google Translate 所采用的 phrase-based translation 系统的。即便这样，NMT 代表了一种新的范式，可以用大量的数据来训练模型，提高翻译质量。

按照 Yonghui 的叙述，GNMT 系统是工程学的胜利：他们从一个研究性的系统开始，引入了深度学习工程上熟知的一些技术，比如 [Attention Mechanism](https://arxiv.org/abs/1409.0473), [word piece model](https://arxiv.org/abs/1604.00788), [residual links](https://arxiv.org/abs/1512.03385)。最终，将模型成功的放到了 Tensor Processing Unit 上而不显著损失模型精度。所有的这些，都应该是工程学的胜利。至于科学上的贡献，就是毫无疑问地证明了 NMT works.

#### Q4: 中美两国在深度学习的开展上有什么不同？

嘉宾都一致认为，深度学习方向上奠基性的工作还是在北美完成的。中国的深度学习开展还偏于应用层面。不过中国的优势是，真实应用的数据集比北美大而且获取成本低。或许中国在深度学习方向上可以出现一批在北美不会出现的应用。

#### Q5: 在深度学习工作上遇到过哪些坑？

Kai Chen 博士在这一点上举了一些具体的例子。比如，在 debug 模型时，将数据低维化，可视化，比如用 t-SNE 将数据映射到二维。另外，必要时要打开神经网络的黑盒子，让模型可解释。不可解释的模型往往也很难调试。Yu 博士则提到要规划数据采集。因为数据采集是一个费时费力的事情，要在一开始就规划好，控制好数据的噪音，并且争取一次收集足够的数据，因为二次采集时可能一些指标已经和第一次不一样。Yonghui 也提到了翻译模型里的一些失败情形，在这种情况下要知道模型的大致应用范围，使得模型在合适的工作条件下发挥作用。

#### Q6: 对转行做深度学习的建议

几位嘉宾都表示他们原本也不是从事深度学习方向工作的，都是最近几年进入这个领域的。因为深度学习领域有众多的开源框架，并且还在快速的发展中，几位嘉宾都表示现在进入对于初学者是最有利的，因为即使是深度学习的老手，也要天天跟踪最新的研究成果，以保持知识的及时更新。

Yuan 还举了一个非常经典的例子（其实是两个例子）。一个是 Christian Szegedy, 原本是数学家，从事逻辑电路的设计，后来转行从事深度学习，凭借在数学上的深厚功底，成为 GoogleLeNet 架构设计者。另一个例子是 [Oxford VGG](http://www.robots.ox.ac.uk/~vgg/) 研究组了。 2012 年他们的 Fisher Vector 方法[被 AlexNet 打败](http://image-net.org/challenges/LSVRC/2012/results.html)，然而 2014 年他们推倒之前的一切工作，从头开始从事卷积网络研究，并一举赢的当年 ImageNet [两个分项的冠军](http://image-net.org/challenges/LSVRC/2014/results)。

以上是我简要的笔记。通过参加这次以及其他的一些 meetup，我总的感觉是 Google 等大鳄在深度学习方面的人才和资源积累远在其他公司之前，原因和当年大数据时代 Google 领先行业一样：Google 要解决的问题和拥有的数据远比其他小公司多。不过话说回来，这轮 AI 浪潮带来的新问题很多，许多是 Google 不愿意做或者不屑于做的。希望这一波的 AI 浪潮能够让深度学习技术更加民主化，更多的 AI 技术能够被整个行业采用。

---

#### 广告

最后毫不要脸地插一个广告: 我的创业公司, [AI.codes](https://www.ai.codes), 致力于将人工智能技术应用于分析和预测计算机代码，目前发布了一个 [IntelliJ 插件试用版](https://plugins.jetbrains.com/plugin/9203?pr=idea)，仅支持 Java。同时，欢迎有一定人工智能或编译器知识基础的同学加盟。目前公司处于起步阶段，股权等各项待遇在硅谷创业公司中绝对属优。不在湾区但对这个项目感兴趣的朋友也可以直接和我联系，我的邮件地址是 exu@ai.codes.

---
