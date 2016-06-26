---
id: 1278
title: '编程珠玑番外篇之番外篇-N  答 UNIX 痛恨者王垠'
date: 2013-03-03T10:07:37+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/?p=1278
permalink: /2013/03/03/unix-haters-2/
dsq_thread_id:
  - 4938569071
categories:
  - CompSci
  - pearl
---
(标题是标题党）

王垠最近的[一篇文章](http://bbs.hupu.com/5187888.html)中，提出了很多有趣的观点。其中最核心的一点，就是 *NIX 系统的设计哲学非常糟糕，而 Windows 系统才是真正为开发者设计的系统。凡是涉及到哲学层面的争论，最后都是以谁也说服不了谁收场。我相信王垠有足够的理由来证明 UNIX 设计哲学的糟糕，但遗憾的是，他的文章并没有表现出这一点。我摘抄一些论点并作答复。

> Unix 的 shell，命令，配置方式，图形界面，都是非常糟糕的。每一个新版本的 Ubuntu 都会在图形界面的设计上出现新的错误，让你感觉历史怎么会倒退。但是这只是表面现象。Linux 的图形界面（X window）在本质上几乎是不可治愈的恶疾。

以现在的眼光看，X Windows 是一个设计过于繁复的系统。实际上，20年前出版的 The Unix Haters Handbook 里，就有[专门的一章](http://www.art.net/~hopkins/Don/unix-haters/x-windows/disaster.html)论述为什么 X Window 的 client-server 架构是糟糕的。可是，这和 Ubuntu 的设计演化之间似乎没有太多关联。Ubuntu 所谓的图形界面设计的错误（以 unity 为例），都是桌面环境层面的问题。一个设计师在这个层面犯错误，就像一个画家因为构图不够工整就去怪画布不行一样，之间还相差不少逻辑链条。

X Window 和其他操作系统上的 GUI 系统最大的不同，是它和宿主操作系统的松耦合。因为这种松耦合的存在，在不需要图形界面的地方，操作系统可以不带 X Window。很多云服务的服务器，都是没有 X 的。当下如日中天的移动操作系统如 Android 和 iOS 都是 UNIX 家族操作系统，而这两者都没有用 X Window 提供 GUI 支撑，而是另外开发了一套专门适合触摸式移动设备的图形界面系统。图形系统和操作系统间的松耦合，使得操作系统可以从头搭建适合具体设备的图形界面交互(如 Cocoa Touch)，并且快速的迭代（如 Project Butter）。

在 GUI 和内核的耦合关系上，架构的确决定了产品的形状。我们都知道，微软 NT 内核和 Widnows UI 系统是绑定在一起的。Windows Phone 8 要和 Windows 8 共享内核和其他组件的结果，就是它们都必须兼顾桌面和移动平台。为此，微软做出了两个可以做榔头也能做螺丝刀的东西。一个是 Windows 8，支持触摸屏，Modern UI 界面长得像手机界面；一个是 Windows Phone 8，界面很适合触摸设备，却又同时支持移植来的桌面程序，造成有的程序界面长得像桌面。无论你认为哪个操作系统的图形界面漂亮，哪条路更加有光明的未来，微软的这些系统之间的关系之繁复，开发迭代的周期如此之长，都是客观事实。

UNIX 系统的Unix 的 shell，命令，配置方式的确有不少的问题，在痛恨者手册里也有详细的论述，[我以前也写过](http://blog.youxu.info/2011/10/14/notes-on-the-unix-haters-handbook/)，就不一一列举了。

> Unix 依靠自己的“宗教”和“哲学”，“战胜”了别的系统在设计上的先进，统治了程序员的世界。胜者为王，可是 Unix 其实是一个暴君，它不允许你批评它的错误。它利用其它程序员的舆论压力，让每一个系统设计上的错误，都被说成是用户自己的失误。其它系统里面某些优秀的系统设计，也许就要被历史掩埋……

一个操作系统，是不可能凭着“宗教”和“哲学”就能统治程序员的世界的。程序员不是天主教徒，UNIX 也不是程序员世界的教皇。实际上，所谓的 UNIX 系统，不是一个特定的系统，而是一个家族的系统。这个家族的系统包罗万象。不喜欢微内核的做了宏内核，不喜欢一切还不都是文件的做了 Plan 9, 不喜欢 X Window 慢如蜗牛的做了 XGL 加速。优秀的设计不断地加入这个系统，改造这个系统。UNIX 来源于 Bell 实验室，X Window 却是 MIT 的，BSD 来自于 Berkeley, Solaris 来自于 SUN, Mac OS 来自于 Apple。如果说这里面有宗教的话，这一定是世界上最诡异的宗教，里面的教徒还天天打架。

在 UNIX 系统中，所有的设计，都在开放的环境下竞争。我们可以说 UNIX 不是一个设计良好的系统，但是它的设计哲学在竞争中获胜的原因，不是因为它是“暴君”，控制了程序员的思想，而恰恰是因为它的开放，所以最终汇总了很多优秀的东西。至于 UNIX 这种不怎么好的系统为何最终获胜，[20年前的一篇文章](http://www.jwz.org/doc/worse-is-better.html)也讲得很清楚了。

> 因为 TeX 的语言是非常糟糕的设计。它的设计者几乎完全不明白程序语言设计的基本原则，不明白什么叫做“抽象”。
> 
> 而这些源于 Unix 的工具却像是“魔鬼棋”或者“三国杀”，有太多的，无聊的，人造的规则。有些人鄙视图形界面，鄙视 IDE，鄙视含有垃圾回收的语言（比如 Java），鄙视一切“容易”的东西。他们却不知道，把自己沉浸在别人设计的繁复的规则中，是始终无法成为大师的。就像一个人，他有能力学会各种“魔鬼棋”的规则，却始终无法达到象棋大师的高度。

这里，王垠把两个不相关的东西放到了一起。一个是工具的设计哲学，一个是我们如何学习知识。魔鬼棋本身是一种工具设计哲学，和成为大师无关。

在[军刀工具](http://blog.youxu.info/2012/02/02/software-tools-1/)一文中我提过，面向特定领域的软件工具之所以让人觉得复杂，是因为这个问题本身复杂。我们把解决特定领域问题而所需的知识叫做”领域模型“(domain model)。如果我们不了解领域模型，就不能理解为什么 Photoshop 比系统自带的 Paint 复杂几千倍, 或者为什么我们需要正则表达式这种诡异的东西。我们讲的复杂与简单，都是工具设计哲学层面的。

以王垠说的 TeX 为例。写出《计算机程序设计艺术》的 Knuth 到底知不知道程序语言设计的基本原则我们可以不加讨论。了解一点字体设计和排版的都知道，计算机排版问题是个复杂的问题。的确，软件工具的设计目标，是把复杂的问题简化。然而，大多数人不知道的是，简化问题是一个两步过程。第一步，我们需要把现实的问题映射到一个领域模型。第二步，是把这个模型简化到我们人可以处理的地步。很多时候这两步合并起来了，让我们觉得这两步好像是一步，并且认为所有的设计，都应该朝简化的方向走。这是一个对设计的错误认识。

举个非计算机领域的例子：用电饭锅煮饭非常简单，加米加水再按个按钮就行了。电饭锅的设计者的设计目标是操作简单且能完美地煮米。作为工具的设计者，它一方面需要了解大米是怎么煮熟的，另一方面需要提供给用户一个简单的按钮。TeX 作者，从一开始就不是设计一个电饭锅，而是一个精确的温控炉子。有了这个精确的温控炉子，想烧饭的可以把它封装成电饭锅，想做蛋糕的可以把它封装成蛋糕烤箱。设计电饭锅的人的设计，并不比设计精确的温控炉子的人好，或者差。设计者的初衷决定了产品的形状。 Kunth 的初衷，正是设计一个可以让他人排版出任何想排版的东西的系统。也就是说，做出一个最终非常简单的，只有一个按钮的排版系统不是他的设计目标。做出一个可以高度定制的系统才是他的目标。

其实，TeX 本身也是一个由繁到简的软件系统。它把所有排版中的问题，都提炼成了一些控制原语。有了这些控制原语，针对特定领域做优化就不是问题了。现在通用的科学出版排版工具 LaTeX, 正是这样的一种优化。这是有心设计的结果。我们抱怨 TeX 复杂，其实是抱怨排版本身复杂。Windows 系统上有许多排版软件，可以毫不客气地说，没有一个可以达到 TeX 所能到达的精确控制。以此责怪 UNIX 下的软件工具是魔鬼棋，就类似于责怪 Photoshop 为啥不象 Paint 那样简单一样，有选择性地忽视了两者所要解决地问题不一样。

我欢迎所有的 UNIX 使用者加入痛恨者阵营，因为我也是 UNIX 痛恨者。只有成为了 UNIX 痛恨者，你才是一个真正的 UNIX 使用者。至于 Windows, 我们对它没有感情，无所谓爱恨。