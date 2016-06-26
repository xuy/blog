---
id: 179
title: 互联网的新审查
date: 2007-05-01T20:38:36+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/05/01/new-censorship/
permalink: /2007/05/01/new-censorship/
dsq_thread_id:
  - 358868358
categories:
  - Article
  - Google
---
今天digg 出了一个情况：digg 对用户的内容进行了审查，并禁止了部分用户发言。美国是没有什么反总统或者反党的顾虑的，那么为什么 Digg 要下这个重手呢? 原来，有的用户贴出了一串数字。这个128位的二进制串是<strike>所有蓝光和HD-DVD 加密算法的基石</strike> HD-DVD 的一个设备码. 好莱坞以及无数家大公司这么多年的心血全部白费. (我以后专门写文章讲这个解密原理). [**Update:** 严格的说，只要这个设备码，就可以轻松解密和盗版所有现有的 HD-DVD。以后的影碟会继续更换加密方式。但是这个门一开，以后想关就难了]

美国数字千年法案上并没有关于一串数字是否涉及破坏版权的规定。但是美国曾经判过“非法素数” 的例子。因此，按照数字安全法案，这个号码被要求删除也说得过去。

不过 digg 的用户不干了，他们纷纷说，digg 已死, 强硬贴下那串数字后永远离开 digg。Digg 是黑客的乐园，可以想像如果走掉核心用户，就好比猫扑走掉核心用户一样， digg 就不是digg 了。不过美国人善于危机公关，我们拭目以待这次digg 如何收场。

数字千年法案已经让Google 出来要求blogger 用户删除在帖子中公开的号码了，可见这次的来头非常大。但是对于不受这个法案约束的其他国家，比如中国和英国的Blogger 用户，不知道Google 是否会以服务器在美国为由要求删除 。 YouTube 上有人把这个号码唱成了歌，如果Google 继续被要求删除，我们就会看到一个强硬的Google 还是一个被好莱坞和大公司“审查”的Google.

wikipedia 本来也有和这段号码相关的条目，现在已经被删除。所有相关条目都被保护不允许更改，可见这次的来头&#8230;

这次的事情我们可以从这几个角度看：

1. 到底是不是核心用户决定一个社区
  
2. 危机公关怎么做
  
3. Google 会不会向千年数字版权法妥协
  
4. 到底这串数字的其他形式，比如说唱形式，是否构成了对数字安全法的侵害?

**Update1:** 现在的digg 首页全讨论这个问题，人们用各种各样的方法在散布这个号码，比如写成图片，做成IP地址等等，来告诉digg, 这样审查是没有效果的。任何一篇和这个号码有关的文章都能几分钟变火。

**Update2:** [据说Digg 管理者收了钱](http://texyt.com/Digg+founders+took+HD-DVD+sponsorship+00071#09-F9-11-02-9D-74-E3-5B-D8-41-56-C5-63-56-88-C0)。[Google 已经被要求删除相关内容.](http://www.cdfreaks.com/news/Google--blogs-issued-with-AACS-Cease--Desist.html)

**Update3**: 关于“非法素数”大概的意思是这样的: 一个牛B 的黑客 用C语言写了一个破解DVD的程序, 但他没法发布，因为发布是违法的。所以呢 他把编译好的2进制公布出来，再转成10进制，正好是一个素数。后来， 美国法律规定这个数违反了千年数字法案的，因此这个数字被称为“非法素数”， 至今仍然有人辩论是否可以把一个数字定为非法。［[wiki](http://en.wikipedia.org/wiki/Illegal_prime)］

**Update4:** digg 创始人开始转变立场了。

> We hear you, and effective immediately we won’t delete stories or comments containing the code and will deal with whatever the consequences might be.
> 
> If we lose, then what the hell, at least we died trying.
> 
> Digg on,
> 
> Kevin

翻译成中文就是: _用户，我们听到了。我们将不删除含有那个code 的文章并且准备应对由此造成的任何情况。 如果我们失败了，那也管不着了，至少我们尝试过了。 把这个文章digg 上去！ Kevin_ 这一轮digg 大战，用户彻底胜利了. 可以想像这样会有更多的用户来digg 而不是更少。

**Update 5**: 按照我的理解，这次AACS必定会罢休，而且及其可能不会要挟Google删除搜索结果。 原因是这样的，在Google 的 所有DMCA条款上都有这样的一行字：

> <font size="-1">Please note that a copy of each legal notice we receive is sent to a third-party partner for publication and annotation. As such, your letter (with your personal information removed) will be forwarded to Chilling Effects (<a href="http://www.chillingeffects.org/">http://www.chillingeffects.org</a>) for publication. You can see an example of such a publication at <a href="http://www.chillingeffects.org/dmca512/notice.cgi?NoticeID=861">http://www.chillingeffects.org/dmca512/notice.cgi?NoticeID=861</a>. A link to your published letter will be displayed in Google&#8217;s search results in place of the removed content.</font>

啥意思呢，就是说， AACS给Google 发的信会被Google 转发给第三方，而Google 的相关搜索结果会被指向这个信。这个是Google 的条款，也就是说，AACS 无法阻止这个信的公开。不幸的是，这次的信中指出的一个侵权URL本身就含有那个码。也就是说，AACS 自己发的信，按照一切法律，Google 都照做了的话，用户就无论怎样还是会看到那个码，即使Google删除所有违反法律的内容，这个信是不可能被删除了。如果AACS要 Google 和第三方删除这个信，那就是自己打自己了，因为信是自己写的。这次这个事情好玩了。