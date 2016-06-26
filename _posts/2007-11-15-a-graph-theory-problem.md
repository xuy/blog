---
id: 490
title: 一道图论题
date: 2007-11-15T00:23:56+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/11/15/a-graph-theory-problem/
permalink: /2007/11/15/a-graph-theory-problem/
dsq_thread_id:
  - 390387035
categories:
  - CompSci
---
晚上和同学讨论了一个问题, 觉得很有意思, 贴出来.

假设一个带权有向图, 找 A 到 B 的最短路径显然是简单的, 如果权重没有负数的话, Dijstra&#8217;s Algorithm 瞬间就做完了. 现在问题略有变化了. 假设这个带权有向图已知, 但是边的权值不知道. 因为计算权值的代价太大, 所以如果有些边必然不在从 A 到 B 的最短路径上, 就没有必要计算这条边的权值. 那么, 问题是:

给定一个有向图和 A B 两点, 找出原来图的一个子图, 使得对于任意的边的权值赋值, 所有可能的最短路径都包含在这个子图中. (等价的说, 把所有不可能在最短路径上的边全部给移除掉)

大家想想办法, 我后天贴我们的算法 :)