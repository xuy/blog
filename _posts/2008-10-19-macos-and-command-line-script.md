---
id: 666
title: '完全用命令行工作-4: 苹果图形界面脚本化'
date: 2008-10-19T14:26:06+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/?p=666
permalink: /2008/10/19/macos-and-command-line-script/
dsq_thread_id:
  - 342327570
categories:
  - CompSci
  - Cool Stuff
  - keyboard
  - Linux
  - MacOSX
  - Python
  - tech
  - Web
tags:
  - command line
  - Linux
  - macos
---
我用苹果 Mac OS X 两年了, 越用越觉得, 其他操作系统要从苹果的 Mac OS X 上学习很多东西. 特别是图形界面的统一的脚本化接口, 我认为这对未来的操作系统是一个很好的启示, 也是完全用命令行工作哲学在图形界面时代的一个不可缺少的部分.

<img class="alignleft size-medium wp-image-669" title="textedit_icon" src="http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon-300x300.png" alt="" width="210" height="210" align="left" srcset="http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon-300x300.png 300w, http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon-150x150.png 150w, http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon.png 512w" sizes="(max-width: 210px) 100vw, 210px" />

起因是最近我在写一系列的中文文章, 因为几乎没有数学公式, 而我又喜欢纯文本的工作方式, 因此在排版上我选择了[reStructuredText](http://docutils.sourceforge.net/rst.html). 一般来说, 英文文本我都是直接在 vim 下工作. 可是苹果下的 vim 对中文的支持不是想像的那么好, 至少中文输入法打出来的常常有乱码. 名动天下的 [TextMate](http://macromates.com/) 固然好, 显示中文却只有半个字那么宽, 看上去很不舒服. 其他的编辑器要么收费, 要么嫌大, 要么不顺手, 因此落到最后还是用了苹果的 TextEdit.

但是写技术文章的人都知道, 写文章不仅是打字这么简单. 特别是技术文章, 常常需要离开编辑环境跑脚本, 查Google, 看 wiki. (我不知道别人是不是这样, 至少我为了写出质量较好的文章, 写的时候也要做很多功课). 特别是因为我在用 reStructuredText, 一个最基本的需求就是处理当前文本生成 HTML/LaTeX 然后预览. 这些需求, 在 VIM 和 TextMate 中都是原生支持的, 很简单能做到. 但是在 TextEdit 这样的软件中, 乍一看, 毫无办法. 所幸的是, UNIX 家族的操作系统, 特别是苹果, 秉承了 简单的事情要有简单的解法, 复杂的事情要有可能的解法 这样的设计思路, 提供了不止一条解决问题的方法. 因为苹果设计了一个叫做&#8221;脚本化应用程序&#8221;的东西, 使得这些任务可以很简单的完成. 我研究了几天, 学到了一些东西, 拿出来和大家分享.

1. 最常常被忽略的菜单栏, Service 菜单.

用具体的例子来说可能更加简单. 用 Gmail 的各位都知道, 如果邮件里面有 90081243455 这样的数字串, 或者有 北京是西城区XX路YY号 这样的地址, Gmail 就很贴心的显示出 &#8220;使用 Google 追踪快递包裹&#8221; 或者 &#8220;使用地图查看地址&#8221; 这样的链接. 也就是说, Gmail 会识别出这些特定的样式, 然后给你一个上下文相关的(也就是说, 和你内容相关的) 服务. 这样的服务贴心舒适, 相信不少人都很喜欢. 一般我们把这个叫做上下文相关的服务.

[<img class="alignright size-medium wp-image-670" title="ubiquity_side" src="http://blog.youxu.info/wp-content/uploads/2008/10/ubiquity_side.png" alt="" width="150" height="213" align="right" />](http://blog.youxu.info/wp-content/uploads/2008/10/ubiquity_side.png)再说 Firefox. 前不久 Firefox 出了一个很贴心的小插件, 叫做 [Ubiquity](http://labs.mozilla.com/2008/08/introducing-ubiquity/), 我在 Firefox 下几乎离不开它: 选中任何一行地址, 只需要敲几个键, 就可以查 Google Map. 选中任何一个名词, 可以立即查 Wikipedia, 等等. 一般我们把也把这个叫做基于选定的服务.

苹果上的 Service 菜单, 就是这样的一个基于上下文相关和基于选定的服务. 举个最简单的例子, 如果你的机器上装有 Skype, 然后你选中了一串电话号码, 这时候你可以到 Service 菜单中选择 Skype -> Call this number. Skype 就会自动拨打这个电话. 或者选中一个单词, Service 菜单中就会自动出现: Look up in the Dictionary. 选中它以后, 你机器上的字典就会跳出来, 把单词的释义呈现给你. 所有的这一切, 都是基于苹果的一个叫做 System Service 的框架. 简单的说, 每个应用程序告诉系统: 在什么情况下, 你给我什么信息, 就可以让我做什么事情. 这样, 在选定的上下文符合条件的时候, 你就可以在菜单中选择这个服务. 这个东西方便无比. 比如说, 常常老板在邮件里面写: 你这周做啥啥. 我就可以选中整行句子, 按下 ⇧⌘ Y. 这样整行句子就被纪录到 Stickies 里面去了, 相当于随时写下一个便签.

现有的菜单栏固然好, 但是自己编写的更加好玩. 所幸的是, 你不需要会苹果的生涩的 Obj-C 才能编写菜单. 有一个强大的工具, 叫做 [ThisService](http://wafflesoftware.net/thisservice/), 能够把 Ruby, Python, Applescript 和 shell 脚本都包装成 Services. 比如说我昨天就花了一分钟写了一个很简单的叫做 Translate 的脚本, 通过 Python 提交文本给 Google Translate, 返回中文. 在阅读有很多不认识的单词的新闻文章时候, 只要选中段落, 选择这个 Translate. 一个翻译成中文的窗口就出现了. 在这个软件的帮助下, 任何脚本都能点一下鼠标就变成一个服务: 具体我就不一一详述了.

总的来说, 我们可以注意到, 在日常使用计算机的时候, 一个应用程序中的一些内容(文本或者图像), 往往要作为另外一个程序的输入, 交给另外一个程序处理. 比如选中的单词查字典, 选中的地址查阅地图, 和选中的电话号码拨打, 选中的句子翻译等等, 这些需求都是存在的. Windows 家族解决问题的方法, 是通过程序切换和剪切板. 而苹果就是通过统一的接口来完成的, 思想和UNIX管道是非常相似一脉相承的 (当然, windows 家族从来就没有 UNIX 家族管道这个思想, 所以也就想不出统一接口这样的设计了).

在苹果下, 统一脚本接口可以用来处理像 Service 这样的程序之间通信的问题, 这个是 windows 家族从来没有想过的. 同时, 据我个人经验, 这个思想在 Linux/X11 家族也没有全部实现. 在 Linux 命令行下, 我们都知道, 不同的小工具之间是正交的, 一个程序的输出是一个程序的输入, 这个 UNIX 哲学长盛不衰. 直到今天, 正常的 Linux/UNIX 用户也会天天用管道做程序之间的通信. 可是在图形界面出现后, 这样的好传统在 X11 系统中似乎没有被继承. 比如, 不能选中一段文字直接送给 wc 计算字数. 究其原因, 是因为图形界面再也没有明显的输入输出这个概念了. 字符串和图像变成了要在程序之间传送的基本单位. 在这种情况下, 就需要不仅仅以文件为基本单位, 而是以被选中的那些字符串, 句子, 链接, 图片等为基本单位的通信. 在这个层面上, 苹果的确先行一步. (当然 Emacs VIM 等等也是可以通信和调用外部程序的, 但是毕竟不是整个系统都能这样).

2. 史上最简单的语言, AppleScript.

故老相传, 当年 Knuth 大神访问苹果, 总裁 乔布斯 同学发挥爱吹牛的光荣传统, 说: 高教授, 您来了. 我特别崇拜你, 您的书我都读过. 各位读者都知道, 要是Jobs 真的把高教授的书都读过, 全世界大学计算机系99%的教授基本上都要自杀让位给Jobs. 所以, 高爷子知道他吹牛皮. 以下的故事分两个版本, 第一个版本是硅谷的版本, 是高爷子当即就说: 斯蒂夫同学, 你又扯淡忽悠了. 第二个版本是我的版本: 说高爷子一听, 也不生气, 心想, 你我共同作为硅谷两个最懂字体设计的搞IT的, 我也不好得罪你, 且问你一道简单的问题, 看你读了我哪几本书. 于是高爷子眼珠一转, 题上心来, 问到: 乔布斯同学, 请问世界上最简单的编程语言是啥子呢? 乔布斯是个不懂技术的主. 想起当年和 Woz 合作的时候搞的东西叫做 BASIC, 听名字就觉得简单, 于是说道: 乃是 BASIC. 高爷爷说, 还有比这个更简单的么. (话说高爷爷心想, 我手里握着 TeX, Metafont, MIX, Literate Programming, CWEB 等几张王牌, 我就不信你说不出一个搭不上边的). 乔布斯同学哪能体会到高爷爷的良苦用心, 他又不会编程, 于是就杜撰到: 我们公司最近正在开发世界上最简单的一个语言: 叫做苹果脚本(AppleScript). 高爷爷一听就知道又是吹牛, 于是立即回复: 斯蒂夫, 你又扯淡忽悠了. 斯蒂夫同学哪服软, 于是要求开发部门开发一个连他都懂怎么用的语言. 于是 AppleScript 就被捣鼓出来了.
  
(以上故事纯属扯淡忽悠)

话说AppleScript 有多简单呢? 就和说话一样简单. 我曾经也写过介绍. 再这里再给一个例子:

`我用苹果 Mac OS X 两年了, 越用越觉得, 其他操作系统要从苹果的 Mac OS X 上学习很多东西. 特别是图形界面的统一的脚本化接口, 我认为这对未来的操作系统是一个很好的启示, 也是完全用命令行工作哲学在图形界面时代的一个不可缺少的部分.

<img class="alignleft size-medium wp-image-669" title="textedit_icon" src="http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon-300x300.png" alt="" width="210" height="210" align="left" srcset="http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon-300x300.png 300w, http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon-150x150.png 150w, http://blog.youxu.info/wp-content/uploads/2008/10/textedit_icon.png 512w" sizes="(max-width: 210px) 100vw, 210px" />

起因是最近我在写一系列的中文文章, 因为几乎没有数学公式, 而我又喜欢纯文本的工作方式, 因此在排版上我选择了[reStructuredText](http://docutils.sourceforge.net/rst.html). 一般来说, 英文文本我都是直接在 vim 下工作. 可是苹果下的 vim 对中文的支持不是想像的那么好, 至少中文输入法打出来的常常有乱码. 名动天下的 [TextMate](http://macromates.com/) 固然好, 显示中文却只有半个字那么宽, 看上去很不舒服. 其他的编辑器要么收费, 要么嫌大, 要么不顺手, 因此落到最后还是用了苹果的 TextEdit.

但是写技术文章的人都知道, 写文章不仅是打字这么简单. 特别是技术文章, 常常需要离开编辑环境跑脚本, 查Google, 看 wiki. (我不知道别人是不是这样, 至少我为了写出质量较好的文章, 写的时候也要做很多功课). 特别是因为我在用 reStructuredText, 一个最基本的需求就是处理当前文本生成 HTML/LaTeX 然后预览. 这些需求, 在 VIM 和 TextMate 中都是原生支持的, 很简单能做到. 但是在 TextEdit 这样的软件中, 乍一看, 毫无办法. 所幸的是, UNIX 家族的操作系统, 特别是苹果, 秉承了 简单的事情要有简单的解法, 复杂的事情要有可能的解法 这样的设计思路, 提供了不止一条解决问题的方法. 因为苹果设计了一个叫做&#8221;脚本化应用程序&#8221;的东西, 使得这些任务可以很简单的完成. 我研究了几天, 学到了一些东西, 拿出来和大家分享.

1. 最常常被忽略的菜单栏, Service 菜单.

用具体的例子来说可能更加简单. 用 Gmail 的各位都知道, 如果邮件里面有 90081243455 这样的数字串, 或者有 北京是西城区XX路YY号 这样的地址, Gmail 就很贴心的显示出 &#8220;使用 Google 追踪快递包裹&#8221; 或者 &#8220;使用地图查看地址&#8221; 这样的链接. 也就是说, Gmail 会识别出这些特定的样式, 然后给你一个上下文相关的(也就是说, 和你内容相关的) 服务. 这样的服务贴心舒适, 相信不少人都很喜欢. 一般我们把这个叫做上下文相关的服务.

[<img class="alignright size-medium wp-image-670" title="ubiquity_side" src="http://blog.youxu.info/wp-content/uploads/2008/10/ubiquity_side.png" alt="" width="150" height="213" align="right" />](http://blog.youxu.info/wp-content/uploads/2008/10/ubiquity_side.png)再说 Firefox. 前不久 Firefox 出了一个很贴心的小插件, 叫做 [Ubiquity](http://labs.mozilla.com/2008/08/introducing-ubiquity/), 我在 Firefox 下几乎离不开它: 选中任何一行地址, 只需要敲几个键, 就可以查 Google Map. 选中任何一个名词, 可以立即查 Wikipedia, 等等. 一般我们把也把这个叫做基于选定的服务.

苹果上的 Service 菜单, 就是这样的一个基于上下文相关和基于选定的服务. 举个最简单的例子, 如果你的机器上装有 Skype, 然后你选中了一串电话号码, 这时候你可以到 Service 菜单中选择 Skype -> Call this number. Skype 就会自动拨打这个电话. 或者选中一个单词, Service 菜单中就会自动出现: Look up in the Dictionary. 选中它以后, 你机器上的字典就会跳出来, 把单词的释义呈现给你. 所有的这一切, 都是基于苹果的一个叫做 System Service 的框架. 简单的说, 每个应用程序告诉系统: 在什么情况下, 你给我什么信息, 就可以让我做什么事情. 这样, 在选定的上下文符合条件的时候, 你就可以在菜单中选择这个服务. 这个东西方便无比. 比如说, 常常老板在邮件里面写: 你这周做啥啥. 我就可以选中整行句子, 按下 ⇧⌘ Y. 这样整行句子就被纪录到 Stickies 里面去了, 相当于随时写下一个便签.

现有的菜单栏固然好, 但是自己编写的更加好玩. 所幸的是, 你不需要会苹果的生涩的 Obj-C 才能编写菜单. 有一个强大的工具, 叫做 [ThisService](http://wafflesoftware.net/thisservice/), 能够把 Ruby, Python, Applescript 和 shell 脚本都包装成 Services. 比如说我昨天就花了一分钟写了一个很简单的叫做 Translate 的脚本, 通过 Python 提交文本给 Google Translate, 返回中文. 在阅读有很多不认识的单词的新闻文章时候, 只要选中段落, 选择这个 Translate. 一个翻译成中文的窗口就出现了. 在这个软件的帮助下, 任何脚本都能点一下鼠标就变成一个服务: 具体我就不一一详述了.

总的来说, 我们可以注意到, 在日常使用计算机的时候, 一个应用程序中的一些内容(文本或者图像), 往往要作为另外一个程序的输入, 交给另外一个程序处理. 比如选中的单词查字典, 选中的地址查阅地图, 和选中的电话号码拨打, 选中的句子翻译等等, 这些需求都是存在的. Windows 家族解决问题的方法, 是通过程序切换和剪切板. 而苹果就是通过统一的接口来完成的, 思想和UNIX管道是非常相似一脉相承的 (当然, windows 家族从来就没有 UNIX 家族管道这个思想, 所以也就想不出统一接口这样的设计了).

在苹果下, 统一脚本接口可以用来处理像 Service 这样的程序之间通信的问题, 这个是 windows 家族从来没有想过的. 同时, 据我个人经验, 这个思想在 Linux/X11 家族也没有全部实现. 在 Linux 命令行下, 我们都知道, 不同的小工具之间是正交的, 一个程序的输出是一个程序的输入, 这个 UNIX 哲学长盛不衰. 直到今天, 正常的 Linux/UNIX 用户也会天天用管道做程序之间的通信. 可是在图形界面出现后, 这样的好传统在 X11 系统中似乎没有被继承. 比如, 不能选中一段文字直接送给 wc 计算字数. 究其原因, 是因为图形界面再也没有明显的输入输出这个概念了. 字符串和图像变成了要在程序之间传送的基本单位. 在这种情况下, 就需要不仅仅以文件为基本单位, 而是以被选中的那些字符串, 句子, 链接, 图片等为基本单位的通信. 在这个层面上, 苹果的确先行一步. (当然 Emacs VIM 等等也是可以通信和调用外部程序的, 但是毕竟不是整个系统都能这样).

2. 史上最简单的语言, AppleScript.

故老相传, 当年 Knuth 大神访问苹果, 总裁 乔布斯 同学发挥爱吹牛的光荣传统, 说: 高教授, 您来了. 我特别崇拜你, 您的书我都读过. 各位读者都知道, 要是Jobs 真的把高教授的书都读过, 全世界大学计算机系99%的教授基本上都要自杀让位给Jobs. 所以, 高爷子知道他吹牛皮. 以下的故事分两个版本, 第一个版本是硅谷的版本, 是高爷子当即就说: 斯蒂夫同学, 你又扯淡忽悠了. 第二个版本是我的版本: 说高爷子一听, 也不生气, 心想, 你我共同作为硅谷两个最懂字体设计的搞IT的, 我也不好得罪你, 且问你一道简单的问题, 看你读了我哪几本书. 于是高爷子眼珠一转, 题上心来, 问到: 乔布斯同学, 请问世界上最简单的编程语言是啥子呢? 乔布斯是个不懂技术的主. 想起当年和 Woz 合作的时候搞的东西叫做 BASIC, 听名字就觉得简单, 于是说道: 乃是 BASIC. 高爷爷说, 还有比这个更简单的么. (话说高爷爷心想, 我手里握着 TeX, Metafont, MIX, Literate Programming, CWEB 等几张王牌, 我就不信你说不出一个搭不上边的). 乔布斯同学哪能体会到高爷爷的良苦用心, 他又不会编程, 于是就杜撰到: 我们公司最近正在开发世界上最简单的一个语言: 叫做苹果脚本(AppleScript). 高爷爷一听就知道又是吹牛, 于是立即回复: 斯蒂夫, 你又扯淡忽悠了. 斯蒂夫同学哪服软, 于是要求开发部门开发一个连他都懂怎么用的语言. 于是 AppleScript 就被捣鼓出来了.
  
(以上故事纯属扯淡忽悠)

话说AppleScript 有多简单呢? 就和说话一样简单. 我曾经也写过介绍. 再这里再给一个例子:

` 

看, 明明就是英语嘛! 这么平铺直叙几乎没有语法的编程语言, 真的是世界上最简单的编程语言唉.

别看这个语言简单, 威力可不小. Mac 上几乎所有的应用程序, 都能够用这个语言去控制, 特别是 iTunes 甚至还有一个[专门的网站](http://dougscripts.com/itunes/), 专门就让你下载千奇百怪的控制脚本.

Applescript 还有两个好处: 1. 他是苹果原生支持的, 可以直接编译成苹果的应用程序来用. 因此, 简单的任务处理都可以用这个语言. 比如我们上面说的做成 Service 的, 也可以用 Applescript 来实现. 2. 他能够和其他应用程序交互. 其实在苹果系统中, 在脚本桥技术(Script Bridging) 出现之后, 理论上C/Javascript/Python/Ruby 都是可以和应用程序交互的. 可是AppleScript 的支持更加好, 更加直接. 比如取当前播放的iTunes乐曲名字, 可以用
  
AppleScript:

`tell application "iTunes" to get the name of the current track`

也可以用 Python

`from Foundation import *<br />
from ScriptingBridge import *<br />
iTunes = SBApplication.applicationWithBundleIdentifier_("com.apple.iTunes")<br />
print iTunes.currentTrack().name()`

显然 Python 要显得笨重一些.

同时, AppleScript 也是苹果中小机器人 Otto [<img class="alignright size-medium wp-image-667" title="automator_icon" src="http://blog.youxu.info/wp-content/uploads/2008/10/automator_icon-300x300.png" alt="" width="144" height="144" align="right" srcset="http://blog.youxu.info/wp-content/uploads/2008/10/automator_icon-300x300.png 300w, http://blog.youxu.info/wp-content/uploads/2008/10/automator_icon-150x150.png 150w, http://blog.youxu.info/wp-content/uploads/2008/10/automator_icon.png 512w" sizes="(max-width: 144px) 100vw, 144px" />](http://blog.youxu.info/wp-content/uploads/2008/10/automator_icon.png)的底层技术, 因此在整个系统中发挥了基础性的作用. 虽然学习 AppleScript 显得很偏很不入流, 但是在苹果上做一些小任务有时候还是用得着的. 比如说我的让 TextEdit 支持 ⇧⌘ R 自动编译的例子, 就是先写了一串脚本, 取当前文件名, 然后使用 do shell script 这个指令调用 make. 这样, 调用这个脚本, 就可以完成自动编译. 用快捷键来调用脚本, 有两种方式, 一种是通过把脚本拷贝到应用程序的脚本目录并且添加一个菜单项. 另一种是用 QuickSilver 来帮忙了. 第一种方法应该最简单, 但是我没有尝试成功, 有兴趣的读者可以读[这篇文章](http://oreilly.com/pub/a/mac/2007/06/08/hit-and-run-launching-applescripts-with-keyboard-shortcuts.html).

3. QuickSilver

[<img class="alignleft size-medium wp-image-668" title="quicksilver" src="http://blog.youxu.info/wp-content/uploads/2008/10/quicksilver.png" alt="" width="128" height="128" align="left" />](http://blog.youxu.info/wp-content/uploads/2008/10/quicksilver.png)我曾经间或的提到过 QuickSilver. 刚开始我并不能体会到他的魔力, 直到最近在玩脚本控制的时候才发现. 简单的说, QuickSilver 就是能让你用键盘控制程序的程序. 或者说, QuickSilver 就是键盘命令中枢. 比如说播放音乐, 只要一键激活 QuickSilver, 再打一下 play (有时都不要打全), 回车. iTunes 就放起音乐了. 上面我们说的任何控制系统的脚本, 都能够被 QuickSilver 控制. 我在拔掉你的鼠标一文中也提到, &#8220;你要是苹果用户又不用QuickSilver或命令行, 那你是把苹果当Windows用&#8221;.

QuickSilver 作为应用程序快速启动的功能大家想必都很熟悉. 控制 iTunes 大家也得心应手. 我就介绍一个被大家忽略的功能: 设置上下文相关的快捷键. 传统上, 快捷键是被应用程序定死的. 即使你写了一个扩展应用程序的脚本, 你也得点点鼠标去调用, 而不能设置键盘快捷键去调用. 解决的方法有三个, 第一个是我在第一部分讲的, 包装成一个 Service. 这样的好处是可以包装出一个快捷键, 坏处是这个Service 是全局都有用的, 不管你在哪个应用程序里面, 这个 service 都能用. 第二种是我在第二部分提到的我没有尝试成功的, 即[添加一个菜单项目](http://oreilly.com/pub/a/mac/2007/06/08/hit-and-run-launching-applescripts-with-keyboard-shortcuts.html)的方法. 第三个就是采用 QuickSilver 的 Trigger 功能了. QS 用户可以使用 ⌘&#8217; 调出 trigger, 然后添加一个 Custom Trigger, 把目标指向自己写好的一个 AppleScript, 给这个 trigger 分配一个快捷键, 并且把使用的范围 scope 限定在一些应用程序中. 这样, 不费任何功夫, 只写一个简单的脚本, 您就可以在你的计算机上把你的 TextEdit 也改造成一个功能强大的编辑器了.

结语: 如我在[拔掉你的鼠标](http://blog.youxu.info/2008/09/04/unplug-your-mouse/)一文中说的, 完全使用键盘能强迫人使用高效简洁和正确的工具. 随着图形界面和多媒体的出现, 鼠标的反而成了一个最常见的动作. 其实认真分析鼠标点选操作就发现, 无非是两种: 一种是用鼠标选择内容, 准备用一定的工具和程序处理这个内容, 还有一种是鼠标选择操作. 前者对内容的选择, 鼠标是高效的. 而后者对操作的选择, 鼠标是低效的 (因为键盘快捷键和命令行更加高效). 因此, 如果我们想要高效的工作, 就要避免后一种操作, 并且进一步解放前者.

对后一种的避免很简单: 拔掉鼠标, 强迫用键盘. 对前者的解放, 随着各种各样如 Service, Ubiquity 以及上下文敏感程序的兴起, 使得我们不需要在不同的程序之间拷贝来拷贝去, 而是直接通过程序之间的标准接口通信, 使得我们甚至不需要切换程序. 所有的都应该这些基于命令行和后台来完成, 而不是通过分散注意力切换程序来完成. 这些新的工具, 更加符合一个高效能的现代人的需求, 更加能够提升你的效率. 当然, 决定做事的效率的不仅仅是工具, 因此, 不要迷恋这些工具. 为了获得 1% 效率的提升, 而过于强调工具的各种淫巧, 反而降低效率. (警告: 这些工具都是非常迷人的, 很容易一用就爱上它们. 记住, 效率是最好的判断标准 :).

附 &#8220;完全用命令行工作系列&#8221; 文章一共五篇, 写了也不少了, 有些工具我一笔带过, 有些我花了几句话讲了一下. 基本上我介绍到的提到的, 都是我自己天天用的, 也是我认为非常有用的. 我写作的时候也都是带着 &#8220;Smart and Get Things Done&#8221; 的哲学, 只介绍干净的设计良好的软件. 各位想实践 GTD 的读者可以自行选择趁手工具. 有更多的 GTD 的完全用 键盘/命令行 工作的软件, 也不妨向我推荐.

[完全用命令行工作-3: 常用工具](http://blog.youxu.info/2008/09/16/cli/)

[完全用命令行工作-2: 常用软件](http://blog.youxu.info/2008/09/10/gtd-by-cli/)

[完全用命令行工作-1: 拔掉你的鼠标](http://blog.youxu.info/2008/09/04/unplug-your-mouse/)

[完全用命令行工作: 几条趁手语句](http://blog.youxu.info/2008/03/20/some-handy-scripts/)