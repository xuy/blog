---
id: 497
title: 说 Python 的几句坏话
date: 2007-11-29T12:27:28+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2007/11/29/bad-python/
permalink: /2007/11/29/bad-python/
dsq_thread_id:
  - 341349913
categories:
  - Memo
  - Python
  - tech
---
我一直很推崇使用 [Python](http://www.python.org/), 但是推崇不是迷信, 今天就说说几个 Python 相对于 Java 和其他语言的缺点, 以及初学者要注意什么.
  
**
  
1. 文档不完善, 最少惊奇原则不适用**

很多 C++ 和 Java 开发者都知道, [MSDN](msdn.microsoft.com/) 和 [Java Doc](http://java.sun.com/javase/6/docs/api/) 堪称技术文档的典范. Java 更是充分体现 Knuth 提出的 [Literate Programming](http://www-cs-faculty.stanford.edu/~knuth/lp.html) 的精华, 用一个专门的叫 javadoc 的工具自动提取程序元信息, 生成交叉引用的 JavaDoc 文档. 任何复杂的类, 框架, 在javadoc 的统一管理下, 可以生成非常漂亮的文档. 如果再配合设计模式中的 facade 模式, 一个复杂的框架很简单就可以上手. 这方面, [Hibernate](http://www.hibernate.org/), [Lucene](http://lucene.apache.org/) 都是优秀的典范. 当然, 交叉引用的文档也有明显的缺陷, 就是极其庞大冗长, 因此 JavaDoc 和 JDK 是独立的两个部分. MSDN 更加绝了, 直接出几张光盘, 你爱装不装. 虽然冗长, 好处就是在面向对象的汪洋大海中顺着链接, 永远不会丢失. 而 [Python 的文档](http://docs.python.org/lib/)还远远不够细致. 所有的对象方法, 只是简单介绍. 如果一个对象方法返回另外一个不熟悉的对象, 则必须手工定位新对象的位置, 而不能顺着文档继续前进. 为了搞清楚一个包, 完成一个小任务, 可能要多次搜索文档. 对于黑客级别的用户来说, Python 文档言简意赅, 喜闻乐见, 只要记住了每个对象的每个函数, 写程序如行云流水. 对于初学者和用 Python 写稍大项目的人来说, 这就是最恐怖的噩梦. 因为以介绍单个函数功能为组织方式的文档, 对于刚上手的用户来说, 很难顺着对象调用关系，通过文档指引完成任务. 即使著名的框架比如 [django](http://www.djangoproject.com/), 也缺少交叉引用的细致的文档. Python Library Reference 只能说是一个完成了 50% 的README. 在这种情况下, 除非对一个框架很熟悉, 否则这个框架对于初学者来说简直是&#8221;惊奇的噩梦&#8221; &#8212; 一般用户只能看例子然后顿悟到: 哦, 原来是这样用的.

除此以外, 因为语言的动态性, 使得 IDE 能给的帮助特别少. 对于 Java 程序员来说, 很多时候都是靠着 Eclipse 的提示去选择正确的方法调用. 而因为 Python 的动态性, 变量的类型到运行时才能确定, 因此能够给的提示相对变少. Python 既是动态的, 又是强类型的, 所以代码的阅读者必须要一步一步手工追踪中间对象的类型, 并且查阅对象方法文档, 才能搞清楚到底一段代码做得什么. 而这一切, 偏偏是没有 IDE 帮助的. 对于开发者来说, 如果不熟悉对象的可用方法, 用 Python 开发也会事倍功半, 因为要常常停下来去 Google.

当然, 文档不够完美, IDE 不支持的现状, 根本是因为 Python 的动态性: 谁让 Python 返回值不规定类型呢? 我的建议是, A. 对于现成已知的一些对象方法上, Python 社区应该注意文档的维护. B. 对于不熟悉对象的可用方法这个问题, 要买一本 [Pocket Reference](http://www.oreilly.com/catalog/pythonpr3/). 或者下载一些 cheet sheet. **在刚接触 Python 或者 刚接触 Python 框架的时候, 一本薄薄的可供快速查阅所有对象的所有方法的小书, 无比重要.** 这也间接的说明, 和 shell 脚本, 正则表达式语法等一样, 脚本语言必须要很熟悉才能发挥魔力.

(&#8211; 附实例，对Java 不熟悉的可直接跳过: 我曾经做过一个游戏, 这个游戏类似于推箱子, 其中的一个核心是要把多幅带alpha 通道的图像拼成一个图像, 然后显示在窗口中. 打开 API Doc, 简单的搜索一下, 发现有 java.awt.Image 类. 不过这个是抽象类, 没关系, 文档下面就明明白白写着两个可以直接用的类, 一个是 BufferedImage, 另一个是 VolatileImage. 看上去 BufferedImage 更像, 于是点进去, 正是想要的. 看看构造函数, 一个空白的图像就构造好了. 顺着方法向下看, 看到 createGraphics() 方法, 返回 Graphics2D 方法, 说明中写着这个可用做在 Image 上绘图, 正是想要的, 点返回值, 是 Graphics2D, 有方法叫 drawImage. 任务完成, 轻松自然.

回到 Python. 我遇到过一个需求, 是用 Python 提取所有一个 Zip 文件的注释. Google Zip+Python 定位到 zipfile 模块. 找到 ZipFile 对象. 读文档没发现可以往外读注释, 只能碰运气, 开一个解释器尝试. 看上去 getinfo 可以. 因为没有交叉引用, 只能搜索ZipInfo 这个对象. 终于看到一个方法是 comment. 不知道类型, 仍然需要自己在解释器下先 type 测试一下, 才能在程序中写下一行完整的语句.&#8211;)

**
  
2. 文档上有, 但是你不能用**

我用 Ubuntu/MacOSX系统, Python 是自带的. 以为万事大吉, 实际上, 因为 **Python 所有的库都是运行时装载的, 所以有些库在有些系统上是缺失的, 而文档则是所有标准安装的超集.** 因此即使文档上有, 你也没法用.

这个问题对于 Java 程序员和 .Net 程序员来说是不能接受的. 对于任何一个良好设计的 SDK, 文档和实际可用的应该具有同等的覆盖面. 在 Java 中, 有一个包就是有, 没有就是没有, 绝对不会出现标准文档中提到了, 实际中却不可用的情况. 对于可选包, 用户也能理解需要下载模块. 而对于 Python, 开发人员很难理解为什么标准文档中提到了, 实际中却缺这个组件缺那个组件. **一个潜在的伤害就是, Python 的跨平台能力没那么强.** 试想, 开发的机器上有一个模块, 而用户没有. 而标准文档偏偏又认为这个是一个标准组件, 那么, 在装载的时候，找不到这个组件了, 让用户根本就无从下手. 我的建议是 A. Python 应当有更好的 import 报错机制, 对于不是每台机器都安装的模块, 应当给出平台中立的更加友好的帮助信息, 而不是简单的 ImportError. B. 应当在 Python 语言中支持更加强大的内省机制, 对于系统当前可用的包, 应当有一个全局的缓存. 这样, 用户才能知道哪些可用哪些不可用, 不可用的时候怎么办. C. 对于用户来说, 只能求助于Google 或新闻组, 或者从 Python 源代码中找线索. 一个较好的办法是在 Python 源代码上 执行 make test, Python 会汇报哪些模块已经编译, 哪些模块被跳过了.

(&#8211;实例: 前几天想写个程序抓Google Reader. 认证的时候要用到 SSL. 因此找到 Python 文档, 照着例子 import urllib2, 然后直接连 Https 服务器. 出错了, 原因是没有 ssl 支持, 不能访问 https. 所有的 Python 在线文档都说, 这个是标准模块. 对呀, Python Library Reference 里面都有的模块, 怎么能有问题呢? Google 搜索也帮不了什么忙, 因为 Python 是跨平台的, 不同的平台有不同的解决方法. 所有的在线帮助只能提示到 \_ssl.o 这一层. 于是, 只能翻看 Python 源代码, 在 Modules/\_ssl.c 中看了一圈, 发现需要 openssl/ssl.h 等文件, 这才意识到, 需要安装 openssl 和 libssl-dev. _在 Ubuntu 上, 同样的问题还存在于 sqlite3 模块, tk 模块 和 bz2 模块. 分别需要安装 libsqlite3-dev, tk-dev 和 libbz2-dev, 再重新编译 Python 系统. 使用 make; python setup.py install 来安装_ &#8211;)

**3. Python 是胶水语言, 用是简单的, 模块开发是痛苦的**

Python 用到一定程度以后, 一个自然的需求就是把其他语言, 特别是C语言写的库包装成 Python 库. 这个问题说复杂也不复杂, 在 Python/C Reference Manual 中也提到了所有必要的信息. 只是层次太细. [Boost.Python](http://www.boost.org/libs/python/doc/) 有更加好的实现, 不过需要对 C++ 模板很熟悉才行. 当然, Python 的模块开发的痛苦比起 [JNI](http://java.sun.com/javase/6/docs/technotes/guides/jni/index.html) 复杂的 JNIEnv 对象, [Lua](http://www.lua.org/) 的 基于栈的 Push Pop 已经是大大轻松了. 相比较于 [Ruby](http://www.ruby-lang.org/en/) 的自动生成 makefile, 也算各有千秋. 只是模块开发设计到的技术细节太多, 要对 Python/C API 了然于胸才行. 因此我的建议是: 不要从轮子造起. 如果有这样的模块, 就用. **如果没有, 而又非要用特定功能的模块不可, 那就暂时先不要考虑用 Python. 相比较于其他更加成熟的语言, 比如 Java, Python 的可用模块还是显得少了一点.** 因为 [Jython](http://www.jython.org/Project/index.html) 的出现, 这个情况已经大大缓解. 不过工业界历来喜欢用最稳定的东西, 所以可以想象, 多少 Web2.0 公司是为了用 Lucene 才用 Java 服务器的, 而每天又有多少新的公司投入 Java 的怀抱 :)