---
id: 206
title: 简单的 LINUX Shell 下求集合交集差集的办法
date: 2007-05-24T21:21:19+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/05/24/setop-under-linux-cli/
permalink: /2007/05/24/setop-under-linux-cli/
dsq_thread_id:
  - 339178421
categories:
  - Linux
---
[车东](http://www.chedong.com/)大虾在[最近的Blog](http://www.chedong.com/blog/archives/000830.html) 中说:

> 最近[Winter刚教会了我一个文件比较命令: comm](http://www.winterxy.com/blog/000082.html "Winter实验室: Unix/Linux文件比较命令: comm命令, Diff命令")，是一个比diff更简单的取2个文件交集/补集的方法。原先以为需要用join 2个表的方法，现在很少几个参数就实现了。

comm 属于 diff 家族的命令, 相当于寻找两个字符串的最长公共子串. 在寻找前, 要对两个文件先排序. 然后diff内部哈希把一行字符变成一个整数, 再使用寻找最长公共子串的动态规划. 因此, 比较一个 m 长文件和一个 n 长文件的复杂度还是比较大. 读者有兴趣的可以阅读这篇论文[[PS](http://www.cs.dartmouth.edu/~doug/diff.ps)]. 其实我自己以前也用Comm, 但是不知道为什么, comm 求集合差集的效果不好. 即使排好了序, 有很多文件之间算差集还是做不对.

找两个文件的交集和差集是很普通的一个事情. 举个简单的例子, 我每周都去Google 音乐趋势抓歌曲名, 抓完了以后, 我要知道哪些是我需要下的新歌 (因为有的歌可能在榜好几个星期, 不需要重复下载). 假设我机器上存的歌曲是集合B, 新抓取了集合A. 假设这些集合这都用文件存着, 每行一个歌曲名. 任务就是计算 A-B, 也就是在集合A中而不在集合B 中的那些歌曲. 我长期的使用经验证明, comm 并不能准确的算出差集.

抓耳挠腮了好久, 想: 要是的确有这个需求, 又没这个现成的工具, 那么肯定一行脚本能写出来. 其实只要运用集合论知识一想就知道, 就是在A中把同时在 A和B 中出现的剔除了呗. 因此办法是, 把 两个B 集合和一个 A 文件放到一起成一个大文件(集合), 然后选取这个大集合中唯一的. 那么这个唯一的肯定就是只在A中不在B中的, 仔细想想就知道是对的. 所以, 方法是:

> sort B B A | uniq -u

同理, 对称差是:

> sort A B | uniq -u

为什么我不喜欢用 comm 呢, 因为comm 是对有序的列表做操作的, 如果对集合, sort 和 uniq 足矣. 可能车大虾说的 join 两个表就是这个了, 不过我觉得, 这个看上去可能更加容易写一点, 毕竟用 comm 的比用 sort 和 uniq 的少一点, 而且, 复杂度也低, 构造也巧妙, 这个多能显示良好的数学和计算机功底啊 :P

Linux 不是玩具, 是提高工作效率的智慧的工具. 我越用越觉得缺少的只是想象力.

**Update:** Linux 下面解决问题从来就不止一种方法, 今天一个美国同事告诉我另一个方法求差集 A-B:

> grep -F -f listb lista -v