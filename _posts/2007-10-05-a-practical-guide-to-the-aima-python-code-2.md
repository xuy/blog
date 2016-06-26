---
id: 453
title: A Practical Guide to the AIMA Python Code 2
date: 2007-10-05T00:47:51+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/10/05/a-practical-guide-to-the-aima-python-code-2/
permalink: /2007/10/05/a-practical-guide-to-the-aima-python-code-2/
dsq_thread_id:
  - 403476925
categories:
  - AI
  - CompSci
  - Python
---
Continued with the [last post](http://blog.youxu.info/2007/10/04/a-practical-guide-to-the-aima-python-code-1/)

Some readers reported that if using `graph_search` to solve the `NQueensProblem` provided in search.py, python will complain that:
  
`<br />
TypeError: list objects are unhashable`

Yes, **you are doing perfectly right** and **the code itself is imperfect**. As this point, you might want to make the List objective hashable. Inspired by the idea of Set and FrozenSet in Python, you would expect a frozen(x) function to make any mutable object immutable (and therefore hashable) [Or you can try to use tuple from beginning, but in the `NQueensProblem` code, it uses `.index` method, which is only suitable for List]. Unfortunately, this proposal (PEP-351) was [Continued with the [last post](http://blog.youxu.info/2007/10/04/a-practical-guide-to-the-aima-python-code-1/)

Some readers reported that if using `graph_search` to solve the `NQueensProblem` provided in search.py, python will complain that:
  
`<br />
TypeError: list objects are unhashable`

Yes, **you are doing perfectly right** and **the code itself is imperfect**. As this point, you might want to make the List objective hashable. Inspired by the idea of Set and FrozenSet in Python, you would expect a frozen(x) function to make any mutable object immutable (and therefore hashable) [Or you can try to use tuple from beginning, but in the `NQueensProblem` code, it uses `.index` method, which is only suitable for List]. Unfortunately, this proposal (PEP-351) was](http://aspn.activestate.com/ASPN/docs/ActivePython/2.5/peps/pep-0351.html) _[Guido](http://aspn.activestate.com/ASPN/docs/ActivePython/2.5/peps/pep-0351.html)._ Hence, we don&#8217;t have a unified way to convert any &#8220;state&#8221; to an immutable object and insert it in to &#8220;closed table&#8221;. One possible way to do this is to write your own State class and implement the `__hashcode__` function. The other handy but awkward way is to convert the list to a tuple when insterting to the &#8220;closed table, i.e. edit **Line 144 of search.py** as:

`if tuple(node.state) not in closed:<br />
closed[tuple(node.state)] = True`

Here is a toy forzen function.

<pre><tt></tt><tt><em><font color="#9a1900">"""Toy function frozen which can convert mutable objects to immutable</font></em>
<em><font color="#9a1900">	Author: Eric You XU.</font></em>
<em><font color="#9a1900">	GPLv2</font></em>
<em><font color="#9a1900">"""</font></em>

<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">frozen</font></strong><font color="#990000">(</font>x<font color="#990000">)</font><font color="#990000">:</font>
<em><font color="#9a1900">	"""Return the immutable version of an object.</font></em>
<em><font color="#9a1900">	"""</font></em>
	<strong><font color="#0000ff">if</font></strong> <strong><font color="#000000">type</font></strong><font color="#990000">(</font>x<font color="#990000">)</font> <font color="#990000">=</font><font color="#990000">=</font> <strong><font color="#000000">type</font></strong><font color="#990000">(</font><font color="#990000">[</font><font color="#990000">]</font><font color="#990000">)</font><font color="#990000">:</font>
		<strong><font color="#0000ff">return</font></strong> <strong><font color="#000000">tuple</font></strong><font color="#990000">(</font>x<font color="#990000">)</font>
	<strong><font color="#0000ff">elif</font></strong> <strong><font color="#000000">type</font></strong><font color="#990000">(</font>x<font color="#990000">)</font> <font color="#990000">=</font><font color="#990000">=</font> <strong><font color="#000000">type</font></strong><font color="#990000">(</font><font color="#990000">[</font><font color="#990000">]</font><font color="#990000">)</font><font color="#990000">:</font>
		<strong><font color="#0000ff">raise</font></strong> <font color="#ff0000">"I can't froze dictionary object as they are very hot."</font>
	<em><font color="#9a1900"># fill your type here</font></em>
	<strong><font color="#0000ff">else</font></strong><font color="#990000">:</font>
		<strong><font color="#0000ff">return</font></strong> x</tt></pre>

You can put it in to search.py and edit the Line 144 as:

`if frozen(node.state) not in closed:<br />
colsed[``frozen``(node.state)] = True`

Now the code looks much better.