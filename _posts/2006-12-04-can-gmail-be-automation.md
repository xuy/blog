---
id: 73
title: Can gmail be an automation?
date: 2006-12-04T09:35:00+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/?p=73
permalink: /2006/12/04/can-gmail-be-automation/
dsq_thread_id:
  - 335997499
categories:
  - English_Essays
  - tech
---
Can gmail be an automation?

Gmail has a very useful function called filter. I guess every gmail user has used it more or less. In fact fliter provides us these essential options: FROM, TO, HAS WORD, NOTHASWORD, FORWARD and some auxiliary functionality like STAR IT, TAG IT. Note that we have use logical expression in all of the above filed like has word &#8220;XX&#8221; OR &#8220;YY&#8221;.

Now my idea is, if we have a bunch of gmail account, namely START, STATEi and HALT, can we bulid an automation using this system? <span style="color: #cc0000">Since Fliter can be used as the state-transformation function, for instance, FROM denotes the last state, content of the mail denotes the input, and of course FORWOAD is to the next state. </span>Now the question is: can we use filter to build an automation and after sending something to the START, can we finally anticipate an result in the HALT state? If so, we can get the result as somehow like the result of a certain calculation. For instance, my START state will always check if the letter has the word &#8220;I&#8221; and then forward to STATE1, STATE1 will check if it is from START and contains &#8220;LOVE&#8221; or not, and forward the NOT to STATE2. STATE2 will always check if it is from STATE1 and has the word &#8220;YOU&#8221; then forward to HALT. Finally, if we get a mail in the HALT email box, we may say that the string putted to the START state is exactly not a LOVE LETTER:)

But the problem is, this formal system is oblivious. For instance, although it has checked some substrings in the previous states, now we want the current state to check the consequent letters instead of the whole string, which is according to the definition of automation. However, as gmail now doesn&#8217;t provide any mechanism like &#8220;READ POSITION&#8221; or &#8220;WRITE BACK&#8221; (You know, if so, theoretically, I can use Gmail filter system to build a Turing Machine). Now a question arises: can we build an equivalent Finite State Machine or even the Turing Machine based on a memory-less and read-only system? (Note that this system provides you the powerful string matching functions with the return value of true and false, but you can not write on the tape or remember the current position of the type).

Would someone has any ideas about it? Please feel free to leave me your comments.

BTW, you can easily setup a jabber server, and use a lot of python clients to build the Turing machine, as now you can &#8220;write&#8221; on the tape. You will have a serious clients called START, STATEi and HALT, it is in fact a kind of cool, I am planing to do it.

Wait a minute, are you stupid or something, can&#8217;t you build an automation using Yacc easily. Yes, I know, now my goal is to study the &#8220;distributed computer&#8221; Can you believe that one day we have a distributed Turing Machine like this :)

&#8212;&#8212;&#8212;&#8211;中文翻译&#8212;&#8211;Chinese Translation&#8212;&#8211;
  
Gmail可以做成有限状态自动机么?

Gmail 有一个很好用的功能叫做Filter, 想必大家都用过。 Fliter核心的功能包括过滤发件人 收件人 含有什么词和不含有什么词。还有一些辅助的 比如加星，加标签等等。 <span style="color: #990000">如果我们把每个Gmail邮箱想像成一个状态，fliter就是一个状态转移方程，输入一个先前的状态(From)和一个输入字符串(信件内容)， 转移到下一个状态(Forward). 于是，自然我们要问一个问题，采用Gmail能不能搭建一个有限状态机甚至一个图灵机。 </span> 好比说我们把状态转移方程，也就是Filter设置好，把一封邮件（初始纸带）发给开始状态叫START, 邮件经过乱七八糟状态转移后或者发送到HALT状态，或者在Gmail网络中循环一辈子，于是，从HALT状态就可以读到结果。

然而我想的未免太好了，<span style="color: #990000">其实Filter 仅仅是个只读头，图灵机需要写头和状态存储器，以及当前读写头位置</span> ，这个都是Gmail目前不能实现的。Gmail形式系统是一个只读无记忆的状态转移机，当然，还有一个支持逻辑表达式查询的强大字符串匹配器。好，现在的问题是，<span style="color: #cc6600">有没有人能发明一套系统或者一种方法，让Gmail形式系统可以至少和有限状态机一样强大（也就是描述出上下文无关文法）</span>

任何的想法，给我写信，这个研究很有趣，对计算能力和有限状态机的理解必定更加深刻。
  
对了，<span style="color: #990000">不知道有没有人把Filter设置成死循环，比如A把B的Forward给C, C for给B, B for 给A. 理论上说Gmail无法避免这样的死循环。任何能解决分布式相互调用系统的死循环避免的人，应该能很自信的把简历往任何大公司投了，这个可不是一个简单的问题。</span>

PS: 1. 我觉得既然目前Gmail没有读写记忆功能，自己写的邮件客户端，或者jabber客户端总是可以修改成完全读写和有记忆功能的。在自己服务器上架一个 jabber, 若干用户叫start, halt 云云，给一个字符串发给START, 在HALT那边看能不能收到结果，很cool (干脆你还可以写概率转移的Markov :)
  
2. 有人说你笨呀，要自动机你用yacc写一下不就行了。 呵呵，咱这不是研究&#8221;<span style="color: #cc6600">分布式</span>&#8221; 计算么:)