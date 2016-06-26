---
id: 575
title: An opensource Happy Birthday song in shell
date: 2008-06-22T22:44:04+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2008/06/22/an-opensource-happy-birthday-song-in-shell/
permalink: /2008/06/22/an-opensource-happy-birthday-song-in-shell/
dsq_thread_id:
  - 459879721
categories:
  - Cool Stuff
  - Linux
---
I spent a while on programming an micro-controller board to sing Happy Birthday song and to automatically dim the light in the living room (via x10 protocol) on my girlfriends birthday yesterday. All things are perfect :)

A natural byproduct is the raw time-frequency format of the Happy Birthday song. Since it was originally a handyboard program, I don&#8217;t expect anyone would be interested in it. Instead, I translated the frequency-time sequence to a shell (bash, to be exact) script. The song now is in public domain, so feel free to play it.

<pre><tt><em><font color="#9a1900">#!/bin/bash</font></em>

<em><font color="#9a1900"># Author: Eric You Xu. </font></em>
<em><font color="#9a1900"># Use it for free. C5 as C</font></em>

<font color="#009900">u</font><font color="#990000">=</font><font color="#993399">600</font>       <em><font color="#9a1900"># Basic time unit</font></em>
<font color="#009900">u2</font><font color="#990000">=</font><font color="#993399">1200</font>
<font color="#009900">uh</font><font color="#990000">=</font><font color="#993399">300</font>
<font color="#009900">d</font><font color="#990000">=</font><font color="#993399">587.33</font> <em><font color="#9a1900"># As D5</font></em>
<font color="#009900">e</font><font color="#990000">=</font><font color="#993399">659.26</font>
<font color="#009900">f_half</font><font color="#990000">=</font><font color="#993399">739.99</font><font color="#9a1900"># F#</font>
<font color="#009900">g</font><font color="#990000">=</font><font color="#993399">783.99</font>
<font color="#009900">a</font><font color="#990000">=</font><font color="#993399">880.00</font>
<font color="#009900">b</font><font color="#990000">=</font><font color="#993399">987.77</font>
<font color="#009900">c_high</font><font color="#990000">=</font><font color="#993399">1046.60</font>       <em><font color="#9a1900"># C6</font></em>
<font color="#009900">d_high</font><font color="#990000">=</font><font color="#993399">1174.66</font>       <em><font color="#9a1900"># D6</font></em>

beep -f <font color="#009900">$d</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$d</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$e</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$d</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$g</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$f_half</font>  -l <font color="#009900">$u2</font>

beep -f <font color="#009900">$d</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$d</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$e</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$d</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$a</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$g</font> -l <font color="#009900">$u2</font>

beep -f <font color="#009900">$d</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$d</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$d_high</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$b</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$g</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$f_half</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$e</font> -l <font color="#009900">$u</font>

beep -f <font color="#009900">$c_high</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$c_high</font> -l <font color="#009900">$uh</font>
beep -f <font color="#009900">$b</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$g</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$a</font> -l <font color="#009900">$u</font>
beep -f <font color="#009900">$g</font> -l <font color="#009900">$u</font>
</tt></pre>

You can download it here: [bday.sh](http://blog.youxu.info/wp-content/uploads/2008/06/bday.sh){.attachmentlink}

If I have time later, I will write some tutorial that how to setup and control X10 devices via Google talk remotely and how to hack the handyboard such that it can control basically everything at home.

Have fun with hacking!