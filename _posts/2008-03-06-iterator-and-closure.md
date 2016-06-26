---
id: 523
title: 循环迭代器和闭包
date: 2008-03-06T18:15:04+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2008/03/06/iterator-and-closure/
permalink: /2008/03/06/iterator-and-closure/
dsq_thread_id:
  - 371949738
categories:
  - CompSci
  - Python
---
通常, C 程序员使用如下代码对 a 数组的每个元素进行操作:

> for (i = 0; i < n; i++) func(a[i]);

这行代码有三个独立的逻辑, for 循环控制了对 a 的访问顺序, a[i] 控制了对 a 数组的元素访问方式, func() 函数控制了对 a 元素的操作. 这个三个逻辑是彼此独立的. 然而, 问题逐渐浮出水面. 首先是 for 循环的次序. 对于随机存取的数组 a, 访问顺序应当是没有关系的. for( i=n-1; i>=0; i&#8211;) 也是可以的. 一个简洁的语言应当突出逻辑, 丢掉不必要的代码. 因此, 最好能写成

> foreach (k in a)  func(k);

这个解一石二鸟, 第一是把访问顺序逻辑彻底抛弃, 第二是改变了访问方式, 从此没有烦人的 [ArrayIndexOutOfBoundException](http://java.sun.com/j2se/1.4.2/docs/api/java/lang/ArrayIndexOutOfBoundsException.html), 不需要担心访问越界. 在函数式编程语言中, 类似的形式是:

> map(func, a)

我们希望 foreach 能够遍历一个数据结构的每个元素一次. 可是这个终究是一个[语法糖](http://en.wikipedia.org/wiki/Syntactic_sugar), 因为它只能胜任特定的数据结构. 对于用户自己设计的一些数据结构, 比如树, 想同时拥有先序和后序遍历, foreach 就无能为力了. 与此同时, 我们也不想用 for 那样简单粗暴的方式去控制访问顺序 (因为很容易导致内存越界, 而且很多数据结构不支持随机存取). 这时候, 就需要[迭代器](http://en.wikipedia.org/wiki/Iterator)的帮助了. 因为不同的数据结构要求不同的访问顺序, 我们希望数据结构本身能够提供一些访问顺序. _这种对于数据结构上元素访问顺序的抽象, 被称为迭代器._ 一般来说, 迭代器通过 getIterator() 被数据结构构造, 具有一个 hasNext() 的判断和一个 next() 的函数. 对一个数据结构的访问<span style="font-weight: bold">可以四海一家的</span>写成:

> for (i = a.getIterater(User&#8217;s_Order); i.hasNext(); i.next() ) func(i.current());

迭代器把访问逻辑从数据结构上分离出来, 是一个常用的设计方法. Design Pattern 也把它[作为23个Pattern之一](http://en.wikipedia.org/wiki/Iterator_pattern).在 STL 中也到处都是了它的身影. 但对一个完美主义者来说, 这个代码还是太冗长, 既然对数据结构的访问能够四海一家的写成如此, 为何不直接规定一个简洁的语法访问呢? 是的, 我们希望返朴归真, 回到原来的形式:

> for i in a.SomeIterator(): func(i)

好消息是现代语言都支持这样的方法. [注: 在C/C++ 语言中, 还不能支持上面的写法. C#有类似的写法. 在 Ruby 和 Python 中很常见. ] 可是能不能再简化呢, 能不能连 i 这个中间变量都不要呢? 我们简直希望写成:

> a.SomeIterator(func)

是呀, 这样的世界多美好啊. 可是, 别忘了在面向对象的语言中间, 一切都是对象. 在 C 的时代, 我们可以通过函数指针把 func 参数传递进去. 可是这里是对象, 怎么办呢. 很简单, 只要构造一个只有一个方法的对象, 传进去就行了. 这样的构造方法, 居然也是一个设计模式, 叫做[函数对象(Function Object)](http://en.wikipedia.org/wiki/Function_object), 或者叫函数子 (Functor). 被 Java 的[匿名内部类](http://en.wikipedia.org/wiki/Inner_class)这个概念折腾到崩溃的读到这里, 应该知道所谓的匿名内部类, 就是为了在面向对象的环境中做函数传递这个事情而想出来的小花招. Java 的写法就是

> a.SomeIterator( new FunctionObject()
  
> { public func(a)
  
> {return something;}
  
> });

［为了引用这样一个函数, 使用了天书一般的不必要代码, 可想有多少人真的喜欢这个方法］

逃离了Java 的世界, 我们来到 Python 或者 Ruby 或者其他函数式语言的世界, 激动的发现原来函数也是一种对象, 和其他对象一样在 Python 中坐上头等舱. 如此好事怎么能错过呢. 于是, 大摇大摆写上:

> a.SomeIterator(func)

没有类型检查, 也没有复杂代码, 连一个辅助变量都不多谢, 真舒服. 在 Python 中间, 这样的模式比比皆是, 比如 os.path.walk(path, visit, arg) 可以对path目录下所有的文件遍历, 并且调用 visit 函数处理, 还可以夹带一个私货 arg 进去, 非常方便. [注: os.walk() 则反其道行之, 提供一个 generator, 外部用 for 访问]

从外面夹带私货不算特别困难, 毕竟可以通过修改函数的定义方式来实现. 可是假如想从迭代器里面夹带一些私货出来给函数用, 就有点困难了. 比如说, func 函数需要访问迭代器的一个私有的变量. 显然把迭代器作为参数传给函数是不行的. 只能反其道行之, 让迭代器把函数当成自己人, 以迭代器为主, 把函数包含到迭代器的作用域内才能玩转. _这个就是所谓的闭包. 也就是说, 一个函数被包入另一个更大的作用域, 并且可以访问大的作用域里面的变量._ C/C++ 是不允许在函数里面定义函数的, 所以只好望着闭包干羡慕. Java 算不错了, 用内部类解决了这个问题.

我们说个具体的例子: 函数 func(x) 需要另一个值 y, 返回 x*y, 另一个值 y 在外部作用域定义了. 写成 Python 代码

> a= [1, 2, 3]
  
> def func(x):
  
> return x*y
> 
> for y in a:
  
> print func(2)

会出现 2,4,6

我们可以看到, 函数func 的定义和使用是独立的. 而静态语言是不能随便在什么位置都能定义函数闭包的, 原因不难解释: 编译器会跳出来告诉你 y 这个变量没有定义. 因为动态语言在运行时才能得到 y 的值, 从而使用 func, 所以不存在这个问题. 动态语言的灵活性在此充分展现. 最后, 既然我们知道迭代器后面必然要加一个闭包, 还要括号干啥? 不如直接写成 (实际上, [Groovy](http://groovy.codehaus.org/) 语言就是这样的):

> a.each func

从简单的循环, 到迭代器, 到生成器, 到内部类, 到函数作为一级对象, 再到闭包, 过程式编程语言, 对象编程语言和函数编程语言越来越呈现融合的趋势.