---
id: 607
title: 贪心法,拟阵和亚模函数
date: 2008-08-20T20:17:34+00:00
layout: post
guid: http://blog.youxu.info/?p=607
permalink: /2008/08/20/geedy-algorithm-matroid-and-submodular-functio/
dsq_thread_id:
  - 338216788
categories:
  - CompSci
  - Cool Stuff
  - Science
tags:
  - adwords
  - Google
  - math
  - optimization
  - submodular
---
(没空写长的, 先写个备忘好了, 以后展开来介绍.  所有的想法都不是我的) <br id="a4tb0" /><br id="s-km0" />CLRS 第16章专门讲了贪心算法 (Greedy Algorithm) 的理论基础是拟阵 (matroid) . 具体理论就不重复废话了. 实际上更加贴切的模型叫做 Greedoid. 相关的理论看一下CLRS就好懂了. 注意 CLRS 中间讲到的所谓的带权拟阵, 实际上表明目标函数是线性的 (函数值 F(A) 等于集合A中每个元素权值之和). Edmonds 1970 早在70年代一篇没有摘要的装逼论文中就证明了拟阵结构上对线性函数的贪心算法一定是最优的. (http://portal.acm.org/citation.cfm?id=885912 )<br id="v5bt" /><br id="v5bt0" />实 际上应用中却不是线性的了, 而是一个叫亚模的(submodular), 具体的细节看维基百科. (http://en.wikipedia.org/wiki/Supermodular ). 亚模这个性质用通俗的话说, 就是随着加入集合的元素越多,  F 函数值获得的受益越少(效用边际递减). 显然世界的很多问题的效用函数都是这个性质. 如信息量 (Information Gain) 等其他效用函数. 这个函数在机器学习, 经济学和博弈论中用途广泛. 比如传感器的安排, Google 最优化广告词的安放, 传感器网络的优化放置, 集合覆盖问题等等. 同时亚模函数和拟阵是有紧密联系的, 如拟阵的秩(rank)的定义, 就必须是一个次模函数. <br id="p80c" /><br id="lv1y" />最好玩的结果是, 除非P=NP, 否则对于拟阵上的亚模函数来说, 贪心算法是多项式时间里面能完成的界最好的最大化算法. 这个就彻底打消了同志们研究新算法的热情鸟：直接用呗，反正没更好的了. 至于呀模函数的最小化, 又是一个多项式的算法. 和线性规划一样, 椭圆方法能解. 其他多项式方法阶也不高. <br id="lv1y0" /><br id="lv1y1" />卡梅. MIT, UIUC 最近都有应用亚模函数做 WSN 或者图分区的文章. 有兴趣的自己去下载吧. 八卦的是, Google 关于 AdWords 最优化拍卖的论文, 一点拟阵和亚模都没扯到, 得到了同样的理论结果, 并且花了很多功夫强证上面贪心算法在界估计上最优这个结论. 不得不说, 学数学还是有点好处滴, 至少不要重新花了老半天重证一个定理鸟. 卡梅的一个团队更加豪言壮语, 说以前的机器学习全是做的啥凸函数的优化 (如 SVM ), 下个十年, 亚模函数就要统治机器学习优化领域啦. <br id="fy0m" /><br id="fy0m0" />有兴趣的各位老大随喜以下的文章. <br id="t9yr" /><br id="fy0m1" />An Introduction to Submodular Functions and Optimization. 属于简介<br id="r:dk" /><cite id="t9yr2">www.ima.umn.edu/optimization/seminar/queyranne.pdf<br id="t9yr3" /><br id="t9yr4" /></cite>卡没在ICML上做的tutorial. 讲了和机器学习的联系<br id="ma8u" />http://www.select.cs.cmu.edu/tutorials/submodularity-slides.pdf<br id="ma8u0" /><br id="t:th" />Adwords Auctions with Decreasing Valuation Bids.  Google 的论文<br id="i9sd" /><cite id="i9sd0">www-static.cc.gatech.edu/grads/g/gagang/wine07_full.<strong id="i9sd1">pdf<br id="muhy" /><br id="i9sd2" /></strong></cite>Revisiting the Greedy Approach to Submodular Set Function Maximization. MIT Sloan 管理学院的论文<br id="ku.s" />http://www.optimization-online.org/DB_FILE/2007/08/1740.pdf<br id="a4e-" />

Near-Optimal Sensor Placements in Gaussian Processes: Theory, Efficient Algorithms and Empirical Studies.卡梅用来做传感器放置的一篇.
  
http://www.select.cs.cmu.edu/publications/paperdir/jmlr2008-krause-singh-guestrin.pdf<br id="ku.s0" /><br id="ku.s2" />各位随喜了.我还得继续和论文做斗争.