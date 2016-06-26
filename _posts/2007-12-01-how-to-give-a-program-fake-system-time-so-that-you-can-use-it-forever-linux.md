---
id: 498
title: How to give a program fake system time so that you can use it forever (Linux)
date: 2007-12-01T02:00:52+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/12/01/how-to-give-a-program-fake-system-time-so-that-you-can-use-it-forever-linux/
permalink: /2007/12/01/how-to-give-a-program-fake-system-time-so-that-you-can-use-it-forever-linux/
dsq_thread_id:
  - 336273431
categories:
  - Cool Stuff
  - Linux
  - tech
---
[**Disclaim: It&#8217;s evil,** don&#8217;t use it unless you are fighting with some even more evil software.]

**Short Intro.** [_Skip it if you don&#8217;t know much about OS or aren&#8217;t interested in the technical detail_ ]

As you might know, every program on Linux system runs on the kernel instead of directly contacting with actual machine. For modern operation systems like Linux, BSD(Mac) and Windows, a mechanism called _system call_ is used to request the system resources via operation system so that operation system has the full control of all programs. In brief, when user program need call a function in library, e.g. print in stdlib, library function forwards (usually library function is a light-weighed wrap of the system call) the request to operation system. Since the system is highly hierarchical and user program is built on the top of libraries and OS kernel, it&#8217;s possible to insert some layers in between program and OS to intercept the request. Don&#8217;t panic about the nerdy name. Actually this strategy is commonly used on Window platform in anti-virus software as well, because anti-virus software want to monitor every system resource usage for any program and prevent the malicious resource requests.

Here, we simply want to intercept a system call named &#8220;TIME&#8221; so that every time a program request the current time (so that it can verify whether the licence has expired), we feed the program with a fixed (fake) time. By fooling the program around, you can literally use a program forever. God, doesn&#8217;t this mean I can use all software forever? The bad news is for some OSs like Windows, it&#8217;s very hard to do system call interception as all the APIs are undocumented and software might have other ways to prevent this. The good news is lots of software on Linux and Mac are simply reading system time. Actually, only top developers and Microsoft partners know how to do system interception. However, for Linux, since the system itself is open source from bottom up, there is no way to prevent such kind of interception (Now you know why some software companies don&#8217;t like Linux :).

**Approach **

On Linux, tons of methods are around. Here I just introduce three of them briefly under the assumption that you don&#8217;t have the source code of that software. [Otherwise you can just modify the source code]
  
**
  
Method 1: Intercept library call in linking time.**

Sometimes you have a library (A) that can be used as a part of your program and you want to intercept the library call of that library (A). The best way and the easiest way is to write a fake function and link it in the compile time. This method is totally harmless to your system and very neat. If you can do some modification in makefile, then this procedure is totally transparent to both developer and user.
  
**
  
Method 2: Intercept system call in the run time**

If you&#8217;ve already got a execute program, then there is no way to intercept the system call in compiling time. To intercept the system call in the run time, there are two ways. The first approach is **putting the target program in a designed container.** Typically, a container fork/create/call the target program as child process. Since in OS, parent process has accessibility to the child process, it can intercept syscalls easily via ptrace toolset. The second method is to **hack the kernel**, namely, to tell the Linux kernel to response syscall in a certain way. Since now Linux supports kernel module, a very convenience approach is to compile a program as kernel module and install it on the fly. However, this method is less flexible then the previous method as now all the syscall are intercepted, even for system calls from other programs. [Sure, you can restrict the module only applicable to a certain process via a pid comparison, but then you need to feed the kernel module with PID, it&#8217;s awkward ]

In my implementation, I use ptrace/container method. I&#8217;ve tried kernel module method but failed as there were not so much well-formed documents on Linux 2.6 kernel.

Here is my code, it&#8217;s self-explanatory, have fun with hacking. [<a href="http://blog.youxu.info/faketime.c" target="_blank">Download the C file</a>]

<pre><tt><em><font color="#9a1900">/* Faketime wraps a user program and feed it with user-specified fake system time</font></em>
<em><font color="#9a1900">   so that it can be used forever without any "licence expired" problem</font></em>
<em><font color="#9a1900">	 </font></em>
<em><font color="#9a1900">    Copyright (C) 2007 Eric You XU, Washington University ( youxu [@T] wustl.edu ) </font></em>
<em><font color="#9a1900">    This program is free software; you can redistribute it and/or modify</font></em>
<em><font color="#9a1900">    it under the terms of the GNU General Public License as published by</font></em>
<em><font color="#9a1900">    the Free Software Foundation; either version 2 of the License, or</font></em>
<em><font color="#9a1900">    (at your option) any later version.</font></em>
<em><font color="#9a1900">    This program is distributed in the hope that it will be useful,</font></em>
<em><font color="#9a1900">    but WITHOUT ANY WARRANTY; without even the implied warranty of</font></em>
<em><font color="#9a1900">    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the</font></em>
<em><font color="#9a1900">    GNU General Public License for more details.</font></em>
<em><font color="#9a1900">    You should have received a copy of the GNU General Public License</font></em>
<em><font color="#9a1900">    along with this program; if not, write to the Free Software</font></em>
<em><font color="#9a1900">    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA</font></em> 

<em><font color="#9a1900">*/</font></em>

<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;sys/ptrace.h&gt;</font>
<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;asm/ptrace.h&gt;</font>
<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;sys/types.h&gt;</font>
<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;sys/wait.h&gt;</font>
<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;unistd.h&gt;</font>
<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;stdio.h&gt;</font>
<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;sys/syscall.h&gt;</font>
<strong><font color="#000080">#include</font></strong> <font color="#ff0000">&lt;linux/user.h&gt;</font>

<em><font color="#9a1900">/*</font></em>
<em><font color="#9a1900">Register layout defined linux/user.h, but actually in </font></em>
<em><font color="#9a1900"> asm-$(arch)/user.h</font></em>
<em><font color="#9a1900">struct user_regs_struct {</font></em>
<em><font color="#9a1900">        long ebx, ecx, edx, esi, edi, ebp, eax;</font></em>
<em><font color="#9a1900">        unsigned short ds, __ds, es, __es;</font></em>
<em><font color="#9a1900">        unsigned short fs, __fs, gs, __gs;</font></em>
<em><font color="#9a1900">        long orig_eax, eip;</font></em>
<em><font color="#9a1900">        unsigned short cs, __cs;</font></em>
<em><font color="#9a1900">        long eflags, esp;</font></em>
<em><font color="#9a1900">        unsigned short ss, __ss;</font></em>
<em><font color="#9a1900">};</font></em>
<em><font color="#9a1900">*/</font></em>

<em><font color="#9a1900">/* Note that EAX now is RAX in x86-64</font></em>
<em><font color="#9a1900"> 	we can also find the actural offset for any register</font></em>
<em><font color="#9a1900"> 	from &lt;asm-$(arch)/ptrace-abi.h&gt;</font></em>
<em><font color="#9a1900">#define RAX 24</font></em>
<em><font color="#9a1900">*/</font></em>

<strong><font color="#000080">#define</font></strong> ORIG_RAX <font color="#993399">44</font>
<em><font color="#9a1900">/* ORIG_RAX stores the number of syscall */</font></em>

<strong><font color="#000080">#define</font></strong> SYS_TIME <font color="#993399">13</font>
<em><font color="#9a1900">/* Machine specific syscall number is defined in </font></em>
<em><font color="#9a1900">	unistd.h */</font></em>

<strong><font color="#000080">#define</font></strong> back_to_future <font color="#993399">1175737392</font>

<em><font color="#9a1900">/* Time is stored as a long interger in C, you can get </font></em>
<em><font color="#9a1900">	current time via time(NULL). Thus, it's very easy to </font></em>
<em><font color="#9a1900">	get a long integer denoting some time in the past. </font></em>
<em><font color="#9a1900">	</font></em>
<em><font color="#9a1900">	Python/Java can also be helpful in figuring this out </font></em>
<em><font color="#9a1900">	</font></em>
<em><font color="#9a1900">	If you don't know how, just keep in mind that </font></em>
<em><font color="#9a1900">	Dec. 1, 2007 is about 1196476452. </font></em>
<em><font color="#9a1900">	One day interval = 60*60*24 = 86400 [Time flies fast]</font></em>
<em><font color="#9a1900">*/</font></em>

<font color="#009900">char</font><font color="#990000">*</font> host_program <font color="#990000">=</font> <font color="#ff0000">"your program name here"</font><font color="#990000">;</font>
<font color="#009900">char</font><font color="#990000">*</font> arglist <font color="#990000">=</font> <font color="#ff0000">"your program fake list here"</font><font color="#990000">;</font>
<em><font color="#9a1900">/* Make modifications for these two lines, then </font></em>
<em><font color="#9a1900">	compile it via</font></em>
<em><font color="#9a1900">		gcc faketime.c -o faketime</font></em>
<em><font color="#9a1900">	use it via </font></em>
<em><font color="#9a1900">		./faketime</font></em>
<em><font color="#9a1900">*/</font></em>

<font color="#009900">int</font> <strong><font color="#000000">main</font></strong><font color="#990000">(</font><font color="#990000">)</font>
<font color="#ff0000">{</font>   pid_t child<font color="#990000">;</font>
    <font color="#009900">long</font> orig_rax<font color="#990000">,</font> eax<font color="#990000">;</font>

	 <strong><font color="#0000ff">struct</font></strong> user_regs_struct regs<font color="#990000">;</font>
	 <font color="#009900">int</font> status<font color="#990000">;</font>
    <font color="#009900">int</font> insyscall <font color="#990000">=</font> <font color="#993399"></font><font color="#990000">;</font>
    child <font color="#990000">=</font> <strong><font color="#000000">fork</font></strong><font color="#990000">(</font><font color="#990000">)</font><font color="#990000">;</font>
    <strong><font color="#0000ff">if</font></strong><font color="#990000">(</font>child <font color="#990000">=</font><font color="#990000">=</font> <font color="#993399"></font><font color="#990000">)</font> <font color="#ff0000">{</font>
        <strong><font color="#000000">ptrace</font></strong><font color="#990000">(</font>PTRACE_TRACEME<font color="#990000">,</font> <font color="#993399"></font><font color="#990000">,</font> NULL<font color="#990000">,</font> NULL<font color="#990000">)</font><font color="#990000">;</font>
        <strong><font color="#000000">execl</font></strong><font color="#990000">(</font>host_program<font color="#990000">,</font> arglist<font color="#990000">,</font> NULL<font color="#990000">)</font><font color="#990000">;</font>
          <font color="#ff0000">}</font>
    <strong><font color="#0000ff">else</font></strong> <font color="#ff0000">{</font>
       <strong><font color="#0000ff">while</font></strong><font color="#990000">(</font><font color="#993399">1</font><font color="#990000">)</font> <font color="#ff0000">{</font>
          <strong><font color="#000000">wait</font></strong><font color="#990000">(</font><font color="#990000">&</font>status<font color="#990000">)</font><font color="#990000">;</font>
          <strong><font color="#0000ff">if</font></strong><font color="#990000">(</font><strong><font color="#000000">WIFEXITED</font></strong><font color="#990000">(</font>status<font color="#990000">)</font><font color="#990000">)</font>
              <strong><font color="#0000ff">break</font></strong><font color="#990000">;</font>
          orig_rax <font color="#990000">=</font> <strong><font color="#000000">ptrace</font></strong><font color="#990000">(</font>PTRACE_PEEKUSER<font color="#990000">,</font>
                     child<font color="#990000">,</font> ORIG_RAX<font color="#990000">,</font> NULL<font color="#990000">)</font><font color="#990000">;</font>

          <strong><font color="#0000ff">if</font></strong><font color="#990000">(</font>orig_rax <font color="#990000">=</font><font color="#990000">=</font> SYS_TIME <font color="#990000">)</font> <font color="#ff0000">{</font> <em><font color="#9a1900">/* Intercept SYS_TIME syscall */</font></em>
             <strong><font color="#0000ff">if</font></strong><font color="#990000">(</font>insyscall <font color="#990000">=</font><font color="#990000">=</font> <font color="#993399"></font><font color="#990000">)</font> <font color="#ff0000">{</font> <em><font color="#9a1900">/* Syscall entry */</font></em>
                insyscall <font color="#990000">=</font> <font color="#993399">1</font><font color="#990000">;</font>
             			  <font color="#ff0000">}</font>
         	 <strong><font color="#0000ff">else</font></strong> <font color="#ff0000">{</font> <em><font color="#9a1900">/* Syscall exit */</font></em>
					<strong><font color="#000000">ptrace</font></strong><font color="#990000">(</font>PTRACE_GETREGS<font color="#990000">,</font> child<font color="#990000">,</font> <font color="#993399"></font><font color="#990000">,</font> <font color="#990000">&</font>regs<font color="#990000">)</font><font color="#990000">;</font>
				   <em><font color="#9a1900">	/* We can also use ptrace(PTRACE_SETREGS, child ,RAX, &back_to_future); </font></em>
<em><font color="#9a1900">						but it doesn't work. There might be some tricky here */</font></em>
					regs<font color="#990000">.</font>eax <font color="#990000">=</font> back_to_future<font color="#990000">;</font>
					<strong><font color="#000000">ptrace</font></strong><font color="#990000">(</font>PTRACE_SETREGS<font color="#990000">,</font> child<font color="#990000">,</font> <font color="#993399"></font><font color="#990000">,</font> <font color="#990000">&</font>regs<font color="#990000">)</font><font color="#990000">;</font>
            	                 <font color="#ff0000">}</font>
          <font color="#ff0000">}</font> <em><font color="#9a1900">// End if with SYS_TIME </font></em>
       <strong><font color="#000000">ptrace</font></strong><font color="#990000">(</font>PTRACE_SYSCALL<font color="#990000">,</font> child<font color="#990000">,</font> NULL<font color="#990000">,</font> NULL<font color="#990000">)</font><font color="#990000">;</font>
        <font color="#ff0000">}</font>
    <font color="#ff0000">}</font>
    <strong><font color="#0000ff">return</font></strong> <font color="#993399"></font><font color="#990000">;</font>
<font color="#ff0000">}</font>

</tt></pre>