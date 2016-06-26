---
id: 484
title: 识别文本用哪种语言写成
date: 2007-11-08T15:13:34+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/11/08/guess-language-of-text/
permalink: /2007/11/08/guess-language-of-text/
dsq_thread_id:
  - 456147387
categories:
  - AI
  - CompSci
  - Cool Stuff
---
[ASPN Python Cookbook](http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/355807) 提到了一个使用 zlib 库识别文本用哪种语言写成的程序. 其核心代码不超过20行, 据我观察, 识别精度不低于95％. 我略做了一下修改, 把[联合国联合国人权宣言](http://www.unhchr.ch/udhr/download/index.htm)作为语料库，目前从 wikipedia 上随便抓一篇爪哇文的文章下来, 都能识别得九不离十。

<pre><tt></tt><tt><strong><font color="#0000ff">class</font></strong> <font color="#009900">Entropy</font><font color="#990000">:</font>
    <strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">__init__</font></strong><font color="#990000">(</font>self<font color="#990000">):</font>      
		self<font color="#990000">.</font>entro <font color="#990000">=</font> <font color="#990000">[]</font>

    <strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">register</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> name<font color="#990000">,</font> corpus<font color="#990000">):</font>
<em><font color="#9a1900">        """</font></em>
<em><font color="#9a1900">        register a text as corpus for a language or author.</font></em>
<em><font color="#9a1900">        &lt;name&gt; may also be a function or whatever you need</font></em>
<em><font color="#9a1900">        to handle the result.</font></em>
<em><font color="#9a1900">        """</font></em>
        corpus <font color="#990000">=</font> <strong><font color="#000000">str</font></strong><font color="#990000">(</font>corpus<font color="#990000">)</font>
        ziplen <font color="#990000">=</font> <strong><font color="#000000">len</font></strong><font color="#990000">(</font>zlib<font color="#990000">.</font><strong><font color="#000000">compress</font></strong><font color="#990000">(</font>corpus<font color="#990000">))</font>
        <strong><font color="#0000ff">print</font></strong> name<font color="#990000">,</font> ziplen
	self<font color="#990000">.</font>entro<font color="#990000">.</font><strong><font color="#000000">append</font></strong><font color="#990000">((</font>name<font color="#990000">,</font> corpus<font color="#990000">,</font> ziplen<font color="#990000">))</font>

    <strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">guess</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> part<font color="#990000">):</font>
<em><font color="#9a1900">        """</font></em>
<em><font color="#9a1900">        &lt;part&gt; is a text that will be compared with the registered</font></em>
<em><font color="#9a1900">        corpora and the function will return what you defined as</font></em>
<em><font color="#9a1900">        &lt;name&gt; in the registration process.</font></em>
<em><font color="#9a1900">        """</font></em>
        what <font color="#990000">=</font> <font color="#009900">None</font>
        diff <font color="#990000">=</font> <font color="#993399"></font>
        part <font color="#990000">=</font> <strong><font color="#000000">str</font></strong><font color="#990000">(</font>part<font color="#990000">)</font>

        <strong><font color="#0000ff">for</font></strong> name<font color="#990000">,</font> corpus<font color="#990000">,</font> ziplen <strong><font color="#0000ff">in</font></strong> self<font color="#990000">.</font>entro<font color="#990000">:</font>
		nz <font color="#990000">=</font> <strong><font color="#000000">len</font></strong><font color="#990000">(</font>zlib<font color="#990000">.</font><strong><font color="#000000">compress</font></strong><font color="#990000">(</font>corpus<font color="#990000">+</font>part<font color="#990000">))</font> <font color="#990000">-</font> ziplen
		<strong><font color="#0000ff">if</font></strong> diff<font color="#990000">==</font><font color="#993399"></font> <strong><font color="#0000ff">or</font></strong> nz<font color="#990000">&lt;</font>diff<font color="#990000">:</font>
                	what <font color="#990000">=</font> name
        		diff <font color="#990000">=</font> nz
        <strong><font color="#0000ff">return</font></strong> what</tt></pre>

先贴代码, 有时间细讲一下语言模型和信息论的妙用. 简单而小巧的模型解决看上去不可解决的问题， 这就是人工智能的精华.

[[所有文件打包下载](http://blog.youxu.info/classfier.tar)(包含语料源文件10Mb). [代码本身](http://blog.youxu.info/classfier.py)其实只有50行]