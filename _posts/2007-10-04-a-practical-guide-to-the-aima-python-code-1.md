---
id: 451
title: A practical guide to the AIMA Python code -1
date: 2007-10-04T00:28:05+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/10/04/a-practical-guide-to-the-aima-python-code-1/
permalink: /2007/10/04/a-practical-guide-to-the-aima-python-code-1/
dsq_thread_id:
  - 338984070
categories:
  - AI
  - CompSci
  - Python
---
Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

``Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

`` 
  
at the python package folder.

**Step 2, study the code &#8212; tree search
  
** 
  
In order to use the code, we have to get familiar with the interface. Let&#8217;s get start from search.py and start from `depth_first_tree_search` (Line 130). The line reads:

`def depth_first_tree_search(problem):<br />
return tree_search(problem, Stack())`

We all know that depth-first search uses Stack. Now let&#8217;s omit the technical detail about the implementation of Stack in util.py and check what the &#8220;problem&#8221; is.

Let&#8217;s move to Line 16 of search.py. Here is the definition of Problem class. Here ```Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

``Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

`` 
  
at the python package folder.

**Step 2, study the code &#8212; tree search
  
** 
  
In order to use the code, we have to get familiar with the interface. Let&#8217;s get start from search.py and start from `depth_first_tree_search` (Line 130). The line reads:

`def depth_first_tree_search(problem):<br />
return tree_search(problem, Stack())`

We all know that depth-first search uses Stack. Now let&#8217;s omit the technical detail about the implementation of Stack in util.py and check what the &#8220;problem&#8221; is.

Let&#8217;s move to Line 16 of search.py. Here is the definition of Problem class. Here``` just assigns the initial state. All functions like successor and goal_test are abstract. So, let&#8217;s take a look a concrete example. Let&#8217;s jump to Line 458, `NQueenProblem`. It&#8217;s a subclass of Problem. It defines the initial state, `successor` function, and `goal_test` function. Node that the function `conflicted` and `conflict` are for internal use only, there are not the essential part of a problem.

Here, by this case study, we at least know that we have to define a problem with

1. `self.initial` field which is the starting point for a problem.
  
2. A `successor` function which generate the successor state for a given state. We will study it carefully later.
  
3. A `goal_test` function which returns either False or True.

The initial is really trivial, we can just assign a initial state to it. Note that Python is a dynamic type language, so we don&#8217;t actually care about what type of state is. We will exam the type of state later, but now let&#8217;s assume that we know the type of state.

The `successor` function is really tricky. A straight-forward way to design a successor function will return all possible states in a list. But if you do that, you will get an &#8220;Too many values to unpack&#8221; error. The design here is actually very neat: instead of put a state in to the list, you can put a (action, state) tuple in to a list. [Line 88 of search.py, in

`function expand(problem)<br />
...<br />
for (act, next) in problem.successor(self.state)`

read this line and you will figure out the date structure to store the successors. The reason is also simple: we can trace the path easily if you record the action down at every expanding step.

Since we moved our eyes to the Node class, let&#8217;s exam it carefully.

The constructor of Node is fairly simple. The `path` function will backtrack all the path to the root. We can modify the code of `__repr__` here to print the action out if needed. If any search finally return a result in the form of `Node`, we can actually get everything we need from this Node, e.g., the path to the node, the action series to the node.

Based on the knowledge above, you can write your own problem model based on tree search. Now let&#8217;s move on to graph search.

Step 3. Graph search.

The only difference between tree search and graph search is that in graph search, we have a fringe that stores the closed notes. As you might know, the fringe is implemented in hash table. In Python, there is a tiny technical point: List is not hash-able as it&#8217;s mutable, Tuple and String are hash-able. Therefore, if you implement your state as a list, make sure to convert it to a tuple or string or a constant. Otherwise graph search will not be happy with this and complain about it.

If you want to use A* search, another point arises: heuristic function. Note that Line 211 reads:

````Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

``Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

`` 
  
at the python package folder.

**Step 2, study the code &#8212; tree search
  
** 
  
In order to use the code, we have to get familiar with the interface. Let&#8217;s get start from search.py and start from `depth_first_tree_search` (Line 130). The line reads:

`def depth_first_tree_search(problem):<br />
return tree_search(problem, Stack())`

We all know that depth-first search uses Stack. Now let&#8217;s omit the technical detail about the implementation of Stack in util.py and check what the &#8220;problem&#8221; is.

Let&#8217;s move to Line 16 of search.py. Here is the definition of Problem class. Here ```Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

``Part -1 Search

**Introduction**

[<img src="http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg" title="images.jpg" alt="images.jpg" align="right" border="2" />](http://blog.youxu.info/wp-content/uploads/2007/10/images.jpg "images.jpg") AIMA (Artificial Intelligence: A Modern Approach) might be the most successful textbook about AI. I take this course with Prof. Yixin Chen this semester. I am going to go through all the source code (Python) provided on the website and use them to finish my homework. Therefore, both for my personal referral purpose and for someone who might be interested in using that code, I write a very simple &#8220;practical guide to AIMA python source code&#8221; series here. Enjoy the magic of AI and Python!
  
 **Step 1, build the environment.** 

In this section, you will need three python files:

http://aima-python.googlecode.com/svn/trunk/agents.py
  
http://aima-python.googlecode.com/svn/trunk/search.py
  
http://aima-python.googlecode.com/svn/trunk/utils.py

Type:
  
`python agents.py`
  
and
  
`python search.py`

to make sure that you have all the packages like Image and Tk with your python. If you don&#8217;t have them, just download them. The general guideline is to use apt-get if possible. If you are not using Debian family OS, download the Python package and then use

`` 
  
at the python package folder.

**Step 2, study the code &#8212; tree search
  
** 
  
In order to use the code, we have to get familiar with the interface. Let&#8217;s get start from search.py and start from `depth_first_tree_search` (Line 130). The line reads:

`def depth_first_tree_search(problem):<br />
return tree_search(problem, Stack())`

We all know that depth-first search uses Stack. Now let&#8217;s omit the technical detail about the implementation of Stack in util.py and check what the &#8220;problem&#8221; is.

Let&#8217;s move to Line 16 of search.py. Here is the definition of Problem class. Here``` just assigns the initial state. All functions like successor and goal_test are abstract. So, let&#8217;s take a look a concrete example. Let&#8217;s jump to Line 458, `NQueenProblem`. It&#8217;s a subclass of Problem. It defines the initial state, `successor` function, and `goal_test` function. Node that the function `conflicted` and `conflict` are for internal use only, there are not the essential part of a problem.

Here, by this case study, we at least know that we have to define a problem with

1. `self.initial` field which is the starting point for a problem.
  
2. A `successor` function which generate the successor state for a given state. We will study it carefully later.
  
3. A `goal_test` function which returns either False or True.

The initial is really trivial, we can just assign a initial state to it. Note that Python is a dynamic type language, so we don&#8217;t actually care about what type of state is. We will exam the type of state later, but now let&#8217;s assume that we know the type of state.

The `successor` function is really tricky. A straight-forward way to design a successor function will return all possible states in a list. But if you do that, you will get an &#8220;Too many values to unpack&#8221; error. The design here is actually very neat: instead of put a state in to the list, you can put a (action, state) tuple in to a list. [Line 88 of search.py, in

`function expand(problem)<br />
...<br />
for (act, next) in problem.successor(self.state)`

read this line and you will figure out the date structure to store the successors. The reason is also simple: we can trace the path easily if you record the action down at every expanding step.

Since we moved our eyes to the Node class, let&#8217;s exam it carefully.

The constructor of Node is fairly simple. The `path` function will backtrack all the path to the root. We can modify the code of `__repr__` here to print the action out if needed. If any search finally return a result in the form of `Node`, we can actually get everything we need from this Node, e.g., the path to the node, the action series to the node.

Based on the knowledge above, you can write your own problem model based on tree search. Now let&#8217;s move on to graph search.

Step 3. Graph search.

The only difference between tree search and graph search is that in graph search, we have a fringe that stores the closed notes. As you might know, the fringe is implemented in hash table. In Python, there is a tiny technical point: List is not hash-able as it&#8217;s mutable, Tuple and String are hash-able. Therefore, if you implement your state as a list, make sure to convert it to a tuple or string or a constant. Otherwise graph search will not be happy with this and complain about it.

If you want to use A* search, another point arises: heuristic function. Note that Line 211 reads:

```` 
  
here n is a Node instead of a State. Hence, if you want to get the state information and implement h, you have to use n.state to get the state information.

**Step 4. build your application**

Perhaps the best part to study the code is to write your own code to test it. Here are my implementations on eightpuzzle and three-missionaries three cannibals problem. The code is ugly and only for study purpose only. _Please don&#8217;t directly copy it to your homework.
  
_ 
  
[Eightpuzzle.py](http://blog.youxu.info/eightpuzzle.py)

<pre><tt><em><font color="#9a1900">#!/usr/bin/python</font></em>

<strong><font color="#0000ff">from</font></strong> utils <strong><font color="#0000ff">import</font></strong> <font color="#990000">*</font><font color="#990000">;</font>
<strong><font color="#0000ff">from</font></strong> search <strong><font color="#0000ff">import</font></strong> <font color="#990000">*</font><font color="#990000">;</font>

<strong><font color="#0000ff">class</font></strong> <strong><font color="#000000">EightPuzzle</font></strong><font color="#990000">(</font>Problem<font color="#990000">)</font><font color="#990000">:</font>
<em><font color="#9a1900">	"""The problem of solving a eight puzzle problem """</font></em>
	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">__init__</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> state<font color="#990000">)</font><font color="#990000">:</font>
		self<font color="#990000">.</font>initial <font color="#990000">=</font> <strong><font color="#000000">tuple</font></strong><font color="#990000">(</font>state<font color="#990000">)</font>

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">successor</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> state<font color="#990000">)</font><font color="#990000">:</font>
<em><font color="#9a1900">		"""In the 8 puzzle problem, move the blank to other position."""</font></em>
		result <font color="#990000">=</font> <font color="#990000">[</font><font color="#990000">]</font>
		position <font color="#990000">=</font> <strong><font color="#000000">list</font></strong><font color="#990000">(</font>state<font color="#990000">)</font><font color="#990000">.</font><strong><font color="#000000">index</font></strong><font color="#990000">(</font><font color="#993399"></font><font color="#990000">)</font>
		<strong><font color="#0000ff">for</font></strong> action<font color="#990000">,</font> newposition <strong><font color="#0000ff">in</font></strong> self<font color="#990000">.</font><strong><font color="#000000">possible_position</font></strong><font color="#990000">(</font>position<font color="#990000">)</font><font color="#990000">.</font><strong><font color="#000000">iteritems</font></strong><font color="#990000">(</font><font color="#990000">)</font><font color="#990000">:</font>
			new <font color="#990000">=</font> <strong><font color="#000000">list</font></strong><font color="#990000">(</font>state<font color="#990000">[</font><font color="#990000">:</font><font color="#990000">]</font><font color="#990000">)</font>
			new<font color="#990000">[</font>newposition<font color="#990000">]</font><font color="#990000">,</font> new<font color="#990000">[</font>position<font color="#990000">]</font> <font color="#990000">=</font> new<font color="#990000">[</font>position<font color="#990000">]</font><font color="#990000">,</font> new<font color="#990000">[</font>newposition<font color="#990000">]</font>
			result<font color="#990000">.</font><strong><font color="#000000">append</font></strong><font color="#990000">(</font><font color="#990000">(</font>action<font color="#990000">,</font> <strong><font color="#000000">tuple</font></strong><font color="#990000">(</font>new<font color="#990000">)</font><font color="#990000">)</font><font color="#990000">)</font>
		<strong><font color="#0000ff">return</font></strong> result

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">possible_position</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> position<font color="#990000">)</font><font color="#990000">:</font>
<em><font color="#9a1900">		"""return the possible position"""</font></em>
		result <font color="#990000">=</font> <font color="#990000">{</font><font color="#990000">}</font><font color="#990000">;</font>
		col <font color="#990000">=</font> position <font color="#990000">%</font> <font color="#993399">3</font><font color="#990000">;</font>
		row <font color="#990000">=</font> position <font color="#990000">/</font><font color="#990000">/</font> <font color="#993399">3</font><font color="#990000">;</font>
		<strong><font color="#0000ff">if</font></strong> row <font color="#990000">!</font><font color="#990000">=</font> <font color="#993399">2</font><font color="#990000">:</font>
			result<font color="#990000">[</font><font color="#ff0000">'D'</font><font color="#990000">]</font> <font color="#990000">=</font> position <font color="#990000">+</font><font color="#993399">3</font>
		<strong><font color="#0000ff">if</font></strong> col <font color="#990000">!</font><font color="#990000">=</font> <font color="#993399"></font><font color="#990000">:</font>
			result<font color="#990000">[</font><font color="#ff0000">'L'</font><font color="#990000">]</font> <font color="#990000">=</font> position <font color="#990000">-</font><font color="#993399">1</font>
		<strong><font color="#0000ff">if</font></strong> row <font color="#990000">!</font><font color="#990000">=</font> <font color="#993399"></font><font color="#990000">:</font>
			result<font color="#990000">[</font><font color="#ff0000">'U'</font><font color="#990000">]</font> <font color="#990000">=</font> position <font color="#990000">-</font><font color="#993399">3</font>
		<strong><font color="#0000ff">if</font></strong> col <font color="#990000">!</font><font color="#990000">=</font> <font color="#993399">2</font><font color="#990000">:</font>
			result<font color="#990000">[</font><font color="#ff0000">'R'</font><font color="#990000">]</font> <font color="#990000">=</font> position <font color="#990000">+</font><font color="#993399">1</font>

		<strong><font color="#0000ff">return</font></strong> result
<em><font color="#9a1900">	</font></em>

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">goal_test</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> state<font color="#990000">)</font><font color="#990000">:</font>
		<strong><font color="#0000ff">if</font></strong> state<font color="#990000">[</font><font color="#993399"></font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font> <font color="#993399"></font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">1</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">1</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">2</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">2</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">3</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">3</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">4</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">4</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">5</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">5</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">6</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">6</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">7</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">7</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">elif</font></strong> state<font color="#990000">[</font><font color="#993399">8</font><font color="#990000">]</font> <font color="#990000">!</font><font color="#990000">=</font><font color="#993399">8</font><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> False
		<strong><font color="#0000ff">else</font></strong><font color="#990000">:</font>
			<strong><font color="#0000ff">return</font></strong> True 	

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">h</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> node<font color="#990000">)</font><font color="#990000">:</font>
<em><font color="#9a1900">		"""Heuristic function"""</font></em>
		temp<font color="#990000">=</font><strong><font color="#000000">list</font></strong><font color="#990000">(</font>node<font color="#990000">.</font>state<font color="#990000">)</font>
		sum<font color="#990000">=</font><font color="#993399"></font>
		<strong><font color="#0000ff">for</font></strong> x <strong><font color="#0000ff">in</font></strong> <strong><font color="#000000">range</font></strong><font color="#990000">(</font><font color="#993399">8</font><font color="#990000">)</font><font color="#990000">:</font>	<em><font color="#9a1900"># mahatten distance</font></em>
			sum <font color="#990000">=</font> sum <font color="#990000">+</font> <strong><font color="#000000">abs</font></strong><font color="#990000">(</font>temp<font color="#990000">.</font><strong><font color="#000000">index</font></strong><font color="#990000">(</font>x<font color="#990000">)</font><font color="#990000">-</font>x<font color="#990000">)</font>
		<strong><font color="#0000ff">return</font></strong> sum

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">h2</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> node<font color="#990000">)</font><font color="#990000">:</font>
<em><font color="#9a1900">		"""bad h"""</font></em>
		sum <font color="#990000">=</font> <font color="#993399"></font>
		pos <font color="#990000">=</font> <font color="#993399"></font>
		<strong><font color="#0000ff">for</font></strong> x <strong><font color="#0000ff">in</font></strong> node<font color="#990000">.</font>state<font color="#990000">:</font>
			sum <font color="#990000">=</font> sum <font color="#990000">+</font> <strong><font color="#000000">abs</font></strong><font color="#990000">(</font>x <font color="#990000">-</font> pos<font color="#990000">)</font>
			pos <font color="#990000">=</font> pos <font color="#990000">+</font> <font color="#993399">1</font>
		<strong><font color="#0000ff">return</font></strong> sum</tt></pre>

<pre><tt><strong><font color="#0000ff">if</font></strong> <font color="#990000">(</font>__name__<font color="#990000">=</font><font color="#990000">=</font><font color="#ff0000">"__main__"</font><font color="#990000">)</font><font color="#990000">:</font>

<em><font color="#9a1900">#	state = [1, 2, 3, 4, 5, 6, 7, 8, 0]</font></em>
	state <font color="#990000">=</font> <font color="#990000">[</font><font color="#993399">7</font><font color="#990000">,</font> <font color="#993399">2</font><font color="#990000">,</font> <font color="#993399">4</font><font color="#990000">,</font> <font color="#993399">5</font><font color="#990000">,</font> <font color="#993399"></font><font color="#990000">,</font> <font color="#993399">6</font><font color="#990000">,</font> <font color="#993399">8</font><font color="#990000">,</font> <font color="#993399">3</font><font color="#990000">,</font> <font color="#993399">1</font><font color="#990000">]</font>
<em><font color="#9a1900">#	state = (2, 6, 4, 7, 0, 3, 5, 8, 1)</font></em>
	instance <font color="#990000">=</font> <strong><font color="#000000">EightPuzzle</font></strong><font color="#990000">(</font>state<font color="#990000">)</font>
<em><font color="#9a1900">#	breadth_first_tree_search(instance)</font></em>
<em><font color="#9a1900">#	depth_first_tree_search(instance)</font></em>
<em><font color="#9a1900">#	breadth_first_graph_search(instance)</font></em>
<em><font color="#9a1900">#	print depth_first_graph_search(instance).path()</font></em>
	<strong><font color="#0000ff">print</font></strong> <strong><font color="#000000">astar_search</font></strong><font color="#990000">(</font>instance<font color="#990000">,</font> instance<font color="#990000">.</font>h<font color="#990000">)</font><font color="#990000">.</font><strong><font color="#000000">path</font></strong><font color="#990000">(</font><font color="#990000">)</font> </tt></pre>

[Boat.py](http://blog.youxu.info/boat.py)

<pre><tt></tt><tt><em><font color="#9a1900">#!/usr/bin/python</font></em>

<strong><font color="#0000ff">from</font></strong> utils <strong><font color="#0000ff">import</font></strong> <font color="#990000">*</font><font color="#990000">;</font>
<strong><font color="#0000ff">from</font></strong> search <strong><font color="#0000ff">import</font></strong> <font color="#990000">*</font><font color="#990000">;</font>

<em><font color="#9a1900">"""state is a tuple with (#m1, #m2, #s1, #s2, where_is_the_boat)"""</font></em>

<strong><font color="#0000ff">class</font></strong> <strong><font color="#000000">Boat</font></strong><font color="#990000">(</font>Problem<font color="#990000">)</font><font color="#990000">:</font>
	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">__init__</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> state<font color="#990000">)</font><font color="#990000">:</font>
		self<font color="#990000">.</font>initial <font color="#990000">=</font> <strong><font color="#000000">tuple</font></strong><font color="#990000">(</font>state<font color="#990000">)</font>
		self<font color="#990000">.</font>N <font color="#990000">=</font> state<font color="#990000">[</font><font color="#993399"></font><font color="#990000">]</font>
		self<font color="#990000">.</font>nodenum <font color="#990000">=</font> <font color="#993399">1</font>

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">successor</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> state<font color="#990000">)</font><font color="#990000">:</font>
		result <font color="#990000">=</font> <font color="#990000">[</font><font color="#990000">]</font>
		symbol <font color="#990000">=</font> state<font color="#990000">[</font><font color="#993399">4</font><font color="#990000">]</font><font color="#990000">*</font><font color="#993399">2</font> <font color="#990000">-</font><font color="#993399">1</font><font color="#990000">;</font> <em><font color="#9a1900"># 0 =&gt; -1</font></em>
		action <font color="#990000">=</font> <font color="#993399"></font>
		<strong><font color="#0000ff">for</font></strong> x <strong><font color="#0000ff">in</font></strong> <font color="#990000">(</font><font color="#993399"></font><font color="#990000">,</font> <font color="#993399">1</font><font color="#990000">,</font> <font color="#993399">2</font><font color="#990000">)</font><font color="#990000">:</font>
			<strong><font color="#0000ff">for</font></strong> y <strong><font color="#0000ff">in</font></strong> <font color="#990000">(</font><font color="#993399"></font><font color="#990000">,</font> <font color="#993399">1</font><font color="#990000">,</font> <font color="#993399">2</font><font color="#990000">)</font><font color="#990000">:</font>
				<strong><font color="#0000ff">if</font></strong> x <font color="#990000">+</font> y <font color="#990000">&gt;</font><font color="#990000">=</font> <font color="#993399">1</font> <strong><font color="#0000ff">and</font></strong> x <font color="#990000">+</font> y <font color="#990000">&lt;</font><font color="#990000">=</font> <font color="#993399">2</font><font color="#990000">:</font>
					new <font color="#990000">=</font> <font color="#990000">(</font>state<font color="#990000">[</font><font color="#993399"></font><font color="#990000">]</font> <font color="#990000">+</font> symbol<font color="#990000">*</font>x<font color="#990000">,</font> state<font color="#990000">[</font><font color="#993399">1</font><font color="#990000">]</font><font color="#990000">-</font>symbol<font color="#990000">*</font>x<font color="#990000">,</font> state<font color="#990000">[</font><font color="#993399">2</font><font color="#990000">]</font> <font color="#990000">+</font> symbol<font color="#990000">*</font>y<font color="#990000">,</font> state<font color="#990000">[</font><font color="#993399">3</font><font color="#990000">]</font> <font color="#990000">-</font> symbol<font color="#990000">*</font>y<font color="#990000">,</font> <font color="#993399">1</font> <font color="#990000">-</font> state<font color="#990000">[</font><font color="#993399">4</font><font color="#990000">]</font><font color="#990000">)</font>
					<strong><font color="#0000ff">if</font></strong> self<font color="#990000">.</font><strong><font color="#000000">check</font></strong><font color="#990000">(</font>new<font color="#990000">)</font><font color="#990000">:</font>
						result<font color="#990000">.</font><strong><font color="#000000">append</font></strong><font color="#990000">(</font><font color="#990000">(</font>action<font color="#990000">,</font> new<font color="#990000">)</font><font color="#990000">)</font>
						action <font color="#990000">=</font> action <font color="#990000">+</font> <font color="#993399">1</font>
		self<font color="#990000">.</font>nodenum <font color="#990000">=</font> self<font color="#990000">.</font>nodenum <font color="#990000">+</font> action
		<strong><font color="#0000ff">print</font></strong> result
		<strong><font color="#0000ff">return</font></strong> result

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">check</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> state<font color="#990000">)</font><font color="#990000">:</font>
		<strong><font color="#0000ff">for</font></strong> x <strong><font color="#0000ff">in</font></strong> state<font color="#990000">[</font><font color="#990000">:</font><font color="#990000">-</font><font color="#993399">1</font><font color="#990000">]</font><font color="#990000">:</font>
			<strong><font color="#0000ff">if</font></strong> x<font color="#990000">&lt;</font><font color="#993399"></font><font color="#990000">:</font>
				<strong><font color="#0000ff">return</font></strong> False<font color="#990000">;</font>

		<strong><font color="#0000ff">if</font></strong> state<font color="#990000">[</font><font color="#993399"></font><font color="#990000">]</font><font color="#990000">!</font><font color="#990000">=</font><font color="#993399"></font> <strong><font color="#0000ff">and</font></strong> state<font color="#990000">[</font><font color="#993399"></font><font color="#990000">]</font> <font color="#990000">&lt;</font> state<font color="#990000">[</font><font color="#993399">2</font><font color="#990000">]</font><font color="#990000">:</font> <strong><font color="#0000ff">return</font></strong> False<font color="#990000">;</font>
		<strong><font color="#0000ff">if</font></strong> state<font color="#990000">[</font><font color="#993399">1</font><font color="#990000">]</font><font color="#990000">!</font><font color="#990000">=</font><font color="#993399"></font> <strong><font color="#0000ff">and</font></strong> state<font color="#990000">[</font><font color="#993399">1</font><font color="#990000">]</font> <font color="#990000">&lt;</font> state<font color="#990000">[</font><font color="#993399">3</font><font color="#990000">]</font><font color="#990000">:</font> <strong><font color="#0000ff">return</font></strong> False<font color="#990000">;</font>

		<strong><font color="#0000ff">return</font></strong> True

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">goal_test</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> state<font color="#990000">)</font><font color="#990000">:</font>
		<strong><font color="#0000ff">if</font></strong> state<font color="#990000">[</font><font color="#993399"></font><font color="#990000">]</font> <font color="#990000">=</font><font color="#990000">=</font> <font color="#993399"></font> <strong><font color="#0000ff">and</font></strong> state<font color="#990000">[</font><font color="#993399">1</font><font color="#990000">]</font> <font color="#990000">=</font><font color="#990000">=</font> self<font color="#990000">.</font>N <strong><font color="#0000ff">and</font></strong> state<font color="#990000">[</font><font color="#993399">2</font><font color="#990000">]</font> <font color="#990000">=</font><font color="#990000">=</font> <font color="#993399"></font> <strong><font color="#0000ff">and</font></strong> state<font color="#990000">[</font><font color="#993399">3</font><font color="#990000">]</font> <font color="#990000">=</font><font color="#990000">=</font> self<font color="#990000">.</font>N <strong><font color="#0000ff">and</font></strong> state<font color="#990000">[</font><font color="#993399">4</font><font color="#990000">]</font> <font color="#990000">=</font><font color="#990000">=</font><font color="#993399">1</font><font color="#990000">:</font>
			<strong><font color="#0000ff">print</font></strong> state
			<strong><font color="#0000ff">return</font></strong> True
		<strong><font color="#0000ff">return</font></strong> False<font color="#990000">;</font>

	<strong><font color="#0000ff">def</font></strong> <strong><font color="#000000">h</font></strong><font color="#990000">(</font>self<font color="#990000">,</font> node<font color="#990000">)</font><font color="#990000">:</font>
		<strong><font color="#0000ff">return</font></strong> <font color="#993399"></font>
		state<font color="#990000">=</font>node<font color="#990000">.</font>state
		<strong><font color="#0000ff">return</font></strong> state<font color="#990000">[</font><font color="#993399"></font><font color="#990000">]</font>

<strong><font color="#0000ff">if</font></strong> <font color="#990000">(</font>__name__<font color="#990000">=</font><font color="#990000">=</font><font color="#ff0000">"__main__"</font><font color="#990000">)</font><font color="#990000">:</font>

	state<font color="#990000">=</font><font color="#990000">[</font><font color="#993399">3</font><font color="#990000">,</font> <font color="#993399"></font><font color="#990000">,</font> <font color="#993399">3</font><font color="#990000">,</font> <font color="#993399"></font><font color="#990000">,</font> <font color="#993399"></font><font color="#990000">]</font>

	instance <font color="#990000">=</font> <strong><font color="#000000">Boat</font></strong><font color="#990000">(</font>state<font color="#990000">)</font>
<em><font color="#9a1900">#	breadth_first_tree_search(instance)</font></em>
<em><font color="#9a1900">#	depth_first_tree_search(instance)</font></em>
<em><font color="#9a1900">#	breadth_first_graph_search(instance)</font></em>
<em><font color="#9a1900">#	depth_first_graph_search(instance)</font></em>
	<strong><font color="#000000">astar_search</font></strong><font color="#990000">(</font>instance<font color="#990000">,</font> instance<font color="#990000">.</font>h<font color="#990000">)</font>
	<strong><font color="#0000ff">print</font></strong> instance<font color="#990000">.</font>nodenum</tt></pre>

BTW, if you need to highlight your source code and convert it to HTML for example, one of the handy program is GNU <a href="http://www.gnu.org/software/src-highlite/" target="_blank">source-highlight</a>. I really love this.