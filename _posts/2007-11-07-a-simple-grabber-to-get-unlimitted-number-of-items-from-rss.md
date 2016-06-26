---
id: 483
title: A simple grabber to get unlimitted number of items from RSS
date: 2007-11-07T00:10:28+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2007/11/07/a-simple-grabber-to-get-unlimitted-number-of-items-from-rss/
permalink: /2007/11/07/a-simple-grabber-to-get-unlimitted-number-of-items-from-rss/
dsq_thread_id:
  - 482258651
categories:
  - Cool Stuff
  - Google
---
Recently I have to get some historical data from one RSS feed. It seems that RSS can only output a limited number of recent items. Since in Google Reader, we can always roll to previous item [if there is one], my solution here is to use Google Reader as the feed processor.

Actually I am not the first one to do this. [gPowered](http://blog.gpowered.net/2007/08/google-reader-api-functions.html) and  [GoogleReaderAPI](http://code.google.com/p/pyrfeed/wiki/GoogleReaderAPI) have already made it possible. I extract the necessary code here and omit other lines. As usual, it&#8217;s Python.[[download](http://www.youxu.info/wufetcher.txt)]

<pre><tt><em><span style="color: #9a1900;">""" wuFetcher</span></em>
<em><span style="color: #9a1900;">	Usage: python wufetcher.py</span></em>

<em><span style="color: #9a1900;">	Author: Eric You XU, Washington University</span></em>
<em><span style="color: #9a1900;">	[Free to use for whatever purpose, absolutely NO WARRANTY]</span></em>
<em><span style="color: #9a1900;">	Kudos to 	gPowered: 			http://blog.gpowered.net/2007/08/google-reader-api-functions.html</span></em>
<em><span style="color: #9a1900;">				GoogleReaderAPI		http://code.google.com/p/pyrfeed/wiki/GoogleReaderAPI</span></em>
<em><span style="color: #9a1900;">"""</span></em>

<strong><span style="color: #000080;">import</span></strong> urllib
<strong><span style="color: #000080;">import</span></strong> urllib2
<strong><span style="color: #000080;">import</span></strong> re  

login <span style="color: #990000;">=</span> <span style="color: #ff0000;">'wufetcher@gmail.com'</span>
password <span style="color: #990000;">=</span> <span style="color: #ff0000;">'wuFetcher2007'</span>
source <span style="color: #990000;">=</span> <span style="color: #ff0000;">'wuFetcher'</span>

google<span style="color: #009900;">_</span>url <span style="color: #990000;">=</span> <span style="color: #ff0000;">'http://www.google.com'</span>
reader<span style="color: #009900;">_</span>url <span style="color: #990000;">=</span> google<span style="color: #009900;">_</span>url <span style="color: #990000;">+</span> <span style="color: #ff0000;">'/reader'</span>
login<span style="color: #009900;">_</span>url <span style="color: #990000;">=</span> <span style="color: #ff0000;">'https://www.google.com/accounts/ClientLogin'</span>
get<span style="color: #009900;">_</span>feed<span style="color: #009900;">_</span>url <span style="color: #990000;">=</span> reader<span style="color: #009900;">_</span>url <span style="color: #990000;">+</span> <span style="color: #ff0000;">'/atom/feed/'</span>

<strong><span style="color: #0000ff;">def</span></strong> <strong><span style="color: #000000;">get_SID</span></strong><span style="color: #990000;">():</span>
	header <span style="color: #990000;">=</span> <span style="color: #990000;">{</span><span style="color: #ff0000;">'User-agent'</span> <span style="color: #990000;">:</span> source<span style="color: #990000;">}</span>
	post<span style="color: #009900;">_</span>data <span style="color: #990000;">=</span> urllib<span style="color: #990000;">.</span><strong><span style="color: #000000;">urlencode</span></strong><span style="color: #990000;">({</span> <span style="color: #ff0000;">'Email'</span><span style="color: #990000;">:</span> login<span style="color: #990000;">,</span> <span style="color: #990000;">\</span>
								<span style="color: #ff0000;">'Passwd'</span><span style="color: #990000;">:</span> password<span style="color: #990000;">,</span> <span style="color: #990000;">\</span>
								<span style="color: #ff0000;">'service'</span><span style="color: #990000;">:</span> <span style="color: #ff0000;">'reader'</span><span style="color: #990000;">,</span> <span style="color: #990000;">\</span>
								<span style="color: #ff0000;">'source'</span><span style="color: #990000;">:</span> source<span style="color: #990000;">,</span> <span style="color: #990000;">\</span>
								<span style="color: #ff0000;">'continue'</span><span style="color: #990000;">:</span> google<span style="color: #009900;">_</span>url<span style="color: #990000;">,</span> <span style="color: #990000;">})</span>
	<em><span style="color: #9a1900;"># @see GoogleReaderAPI: Identification</span></em>

	request <span style="color: #990000;">=</span> urllib2<span style="color: #990000;">.</span><strong><span style="color: #000000;">Request</span></strong><span style="color: #990000;">(</span>login<span style="color: #009900;">_</span>url<span style="color: #990000;">,</span> post<span style="color: #009900;">_</span>data<span style="color: #990000;">,</span> header<span style="color: #990000;">)</span>
	<strong><span style="color: #0000ff;">try</span></strong> <span style="color: #990000;">:</span>
		f <span style="color: #990000;">=</span> urllib2<span style="color: #990000;">.</span><strong><span style="color: #000000;">urlopen</span></strong><span style="color: #990000;">(</span>request<span style="color: #990000;">)</span>
		result <span style="color: #990000;">=</span> f<span style="color: #990000;">.</span><strong><span style="color: #000000;">read</span></strong><span style="color: #990000;">()</span>
		<strong><span style="color: #0000ff;">print</span></strong> result
	<strong><span style="color: #0000ff;">except</span></strong><span style="color: #990000;">:</span>
		<strong><span style="color: #0000ff;">print</span></strong> <span style="color: #ff0000;">'Error logging in'</span>
		<strong><span style="color: #000000;">exit</span></strong><span style="color: #990000;">(-</span><span style="color: #993399;">1</span><span style="color: #990000;">)</span>
	<strong><span style="color: #0000ff;">return</span></strong> re<span style="color: #990000;">.</span><strong><span style="color: #000000;">search</span></strong><span style="color: #990000;">(</span><span style="color: #ff0000;">'SID=(\S*)'</span><span style="color: #990000;">,</span> result<span style="color: #990000;">).</span><strong><span style="color: #000000;">group</span></strong><span style="color: #990000;">(</span><span style="color: #993399;">1</span><span style="color: #990000;">)</span>

<strong><span style="color: #0000ff;">def</span></strong> <strong><span style="color: #000000;">get_results</span></strong><span style="color: #990000;">(</span><span style="color: #009900;">SID</span><span style="color: #990000;">,</span> url<span style="color: #990000;">,</span> number<span style="color: #990000;">):</span>
	header <span style="color: #990000;">=</span> <span style="color: #990000;">{</span><span style="color: #ff0000;">'User-agent'</span> <span style="color: #990000;">:</span> source<span style="color: #990000;">}</span>
	header<span style="color: #990000;">[</span><span style="color: #ff0000;">'Cookie'</span><span style="color: #990000;">]=</span><span style="color: #ff0000;">'Name=SID;SID=%s;Domain=.google.com;Path=/;Expires=160000000000'</span> <span style="color: #990000;">%</span> <span style="color: #009900;">SID</span>
	post<span style="color: #009900;">_</span>data <span style="color: #990000;">=</span> urllib<span style="color: #990000;">.</span><strong><span style="color: #000000;">urlencode</span></strong><span style="color: #990000;">({</span><span style="color: #ff0000;">'n'</span><span style="color: #990000;">:</span> <strong><span style="color: #000000;">str</span></strong><span style="color: #990000;">(</span>number<span style="color: #990000;">)})</span>
	request <span style="color: #990000;">=</span> urllib2<span style="color: #990000;">.</span><strong><span style="color: #000000;">Request</span></strong><span style="color: #990000;">(</span>url<span style="color: #990000;">+</span><span style="color: #ff0000;">'?n='</span><span style="color: #990000;">+</span><strong><span style="color: #000000;">str</span></strong><span style="color: #990000;">(</span>number<span style="color: #990000;">),</span> <span style="color: #009900;">None</span><span style="color: #990000;">,</span> header<span style="color: #990000;">)</span>
	<strong><span style="color: #0000ff;">try</span></strong> <span style="color: #990000;">:</span>
		f <span style="color: #990000;">=</span> urllib2<span style="color: #990000;">.</span><strong><span style="color: #000000;">urlopen</span></strong><span style="color: #990000;">(</span> request <span style="color: #990000;">)</span>
		<strong><span style="color: #0000ff;">return</span></strong> f<span style="color: #990000;">.</span><strong><span style="color: #000000;">read</span></strong><span style="color: #990000;">()</span>
	<strong><span style="color: #0000ff;">except</span></strong><span style="color: #990000;">:</span>
		<strong><span style="color: #0000ff;">print</span></strong> <span style="color: #ff0000;">'Error getting data from %s'</span> <span style="color: #990000;">%</span> url
	<strong><span style="color: #0000ff;">return</span></strong> <span style="color: #009900;">None</span>

<strong><span style="color: #0000ff;">if</span></strong> <span style="color: #009900;">__</span>name<span style="color: #009900;">__</span> <span style="color: #990000;">==</span> <span style="color: #ff0000;">"__main__"</span><span style="color: #990000;">:</span>
	sid<span style="color: #990000;">=</span> <strong><span style="color: #000000;">get_SID</span></strong><span style="color: #990000;">()</span>
	feed<span style="color: #009900;">_</span>url<span style="color: #990000;">=</span> <span style="color: #ff0000;">"http://feeds.feedburner.com/xumathena"</span>
	<em><span style="color: #9a1900;"># replace this url with the rss feed you want to fetch</span></em>

	number <span style="color: #990000;">=</span> <span style="color: #993399;">10</span>
	<em><span style="color: #9a1900;"># replace this number with number of items you want to fetch</span></em>

	result <span style="color: #990000;">=</span> <strong><span style="color: #000000;">get_results</span></strong><span style="color: #990000;">(</span>sid<span style="color: #990000;">,</span> get<span style="color: #009900;">_</span>feed<span style="color: #009900;">_</span>url<span style="color: #990000;">+</span>feed<span style="color: #009900;">_</span>url<span style="color: #990000;">.</span><strong><span style="color: #000000;">encode</span></strong><span style="color: #990000;">(</span><span style="color: #ff0000;">'utf-8'</span><span style="color: #990000;">),</span> number<span style="color: #990000;">)</span>
	f <span style="color: #990000;">=</span> <strong><span style="color: #000000;">open</span></strong><span style="color: #990000;">(</span>feed<span style="color: #009900;">_</span>url<span style="color: #990000;">.</span><strong><span style="color: #000000;">split</span></strong><span style="color: #990000;">(</span><span style="color: #ff0000;">'/'</span><span style="color: #990000;">)[-</span><span style="color: #993399;">1</span><span style="color: #990000;">],</span> <span style="color: #ff0000;">'w'</span><span style="color: #990000;">)</span>
	f<span style="color: #990000;">.</span><strong><span style="color: #000000;">write</span></strong><span style="color: #990000;">(</span>result<span style="color: #990000;">)</span>
	f<span style="color: #990000;">.</span><strong><span style="color: #000000;">close</span></strong><span style="color: #990000;">()</span> </tt></pre>