---
id: 227
title: 关于Bloom Filter 补充说几句
date: 2007-07-03T22:40:33+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/07/03/bloom-filter/
permalink: /2007/07/03/bloom-filter/
dsq_thread_id:
  - 343033563
categories:
  - CompSci
---
今天谷歌黑板报上[吴军研究员深入浅出的讲解了Bloom Filter](http://googlechinablog.com/2007/07/bloom-filter.html). 因为前段时间我在<a href="http://blog.youxu.info/2007/06/09/notes-on-spell-checker/" rel="bookmark" title="Permanent link to 拼写检查器的一点注记">拼写检查器的一点注记</a> 当中也提到了Bloom Filter, 所以补充说几句.

1. 黑板报上说:

> 对于每一个电子邮件地址 X，我们用八个不同的随机数产生器（F1,F2, &#8230;,F8） 产生八个信息指纹（f1, f2, &#8230;, f8）。再用一个随机数产生器 G 把这八个信息指纹映射到 1 到十六亿中的八个自然数 g1, g2, &#8230;,g8。

其实这句话有点绕人, 本质上来说, 就是有8个不同的Hash 函数, 能把这个 X 映射到八个自然数. (实际上对于好的Hash 函数, 比如 MD5, 算一次, 截成八段, 就是八个很好的Hash 函数了, 不一定要8个随机数产生器.)

2. 黑板报上说:

> 布隆过滤器决不会漏掉任何一个在黑名单中的可疑地址。但是，它有一条不足之处。也就是它有极小的可能将一个不在黑名单中的电子邮件地址判定为在黑 名单中，因为有可能某个好的邮件地址正巧对应个八个都被设置成一的二进制位。好在这种可能性很小。我们把它称为误识概率。在上面的例子中，误识概率在万分 之一以下。

实际上, 这说的就是 Bloom filter 不会有Flase Negative, 可能有 False Positive. 我们来算一下概率. 假设Hash 函数是理想的, 也就是说, 函数值是均一分布的, Bloom Filter 长为$$m$$ bits, 那么, 对于一个输入, 某一位没被设置的概率是 $$1-\frac{1}{m}$$, 而我们一共有 $$k$$ 个独立不相关的 Hash 函数, 所以这一位保持为 $$0$$ 的概率应该是 $$(1-\frac{1}{m})^k$$. 因此, 假如我们一直插入了 $$n$$ 个元素进来, 某一位是 $$0$$ 的概率就是 $$(1-\frac{1}{m})^{kn}$$. 用 $$1$$ 减去它, 就是这一位是 $$1$$ 的概率了. 那么, 如果我们这时候开始测试元素是否在集合中而发生了错误, 就是说, 明明元素不在集合里面, 可是Hash 过后每一位都是 $$1$$, 这个的概率就是 $$\left(1-\left(1-\frac{1}{m}\right)^{kn}\right)^k \approx \left(1-e^{-kn/m}\right)^k$$. 这个题目中, $$m$$=16G, $$n$$=1G, $$k$$=8, 我算出来的错误率是0.0005744 (Linux Bash: echo &#8220;(1-e(-8*1/16))^8&#8243;|bc -l), 大于万分之一了. [[Wikipedia](http://en.wikipedia.org/wiki/Bloom_filter) 和我的算法一样]