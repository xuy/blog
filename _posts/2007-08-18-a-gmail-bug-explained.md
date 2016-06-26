---
id: 255
title: A Gmail bug explained
date: 2007-08-18T00:26:44+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/08/18/a-gmail-bug-explained/
permalink: /2007/08/18/a-gmail-bug-explained/
dsq_thread_id:
  - 403424003
categories:
  - English_Essays
  - tech
---
Here is a quite funny picture I found today on [digg](http://digg.com). It is called [the Best Phishing Email, Ever](http://gizmodo.com/gadgets/hmm%252C-something.s-not-right-about-this/best-phishing-email-ever-290697.php). Despite the funny nature of this hilarious letter, have someone really noticed that in this letter, we have <span style="font-weight: bold"></span><span style="color: #00cccc">G</span> <span style="background-color: #330033"></span><span style="color: #cc0000">m</span><span style="color: #ffcc00">a</span><span style="color: #3333ff">i</span><span style="color: #009900">l</span> or <span style="font-weight: bold"></span><span style="color: #00cccc">G</span><span style="color: #cc0000">m</span><span style="color: #ffcc00">a</span><span style="color: #3333ff"></span> <span style="font-weight: bold; color: #330033; background-color: #330033"></span>i<span style="color: #009900">l</span> instead of <span style="font-weight: bold"></span><span style="color: #00cccc">G</span><span style="color: #cc0000">m</span><span style="color: #ffcc00">a</span><span style="color: #3333ff">i</span><span style="color: #009900">l</span>? (one extra blank in between the letter &#8220;G&#8221; and &#8220;m&#8221;, or &#8220;a&#8221; and &#8220;i&#8221;).

<p class="post-full">
  <!-- google_ad_section_start -->
  
  <img src="http://gizmodo.com/assets/resources/2007/08/gmail_scam.jpg" alt="gmail_scam.jpg" class="center" height="511" width="593" />
</p>

Last year when I was interviewed in Google, I reported this bug to Gmail team, (Sadly to say, they didn&#8217;t take it very serious, as it&#8217;s still there now). Maybe they can argue that it&#8217;s a feature, but let me take five minutes to explain why is it. (I guess it&#8217;s fairly simple and straightforward).

Let&#8217;s start from a little background about HTML. We all know that when we send colorful texts like &#8220;**<font color="#000099">G</font><font color="#ff0000">o</font><font style="background-color: #ffffff" color="#ffcc00">o</font><font color="#3333ff">g</font><font color="#33cc00">l</font><font color="#ff0000">e</font>**&#8221; via gmail, the email format is actually HTML. Here is a quite important aspect about HTML: <span style="font-style: italic">An HTML user agent should treat end of line in any of its variations</span><span></span>  <span style="font-style: italic">as a word space in all contexts except preformatted text.</span>(Page 20, [RFC1866](http://www.ietf.org/rfc/rfc1866.txt)) That is to say, a cstring in HTML source file like &#8220;a\nb\nc&#8221; will have the redering output identical to &#8220;a b c&#8221;. Therefore, it&#8217;s really confusing that we have to use <br/> to make a newline within a paragraph in HTML text, and &#8220;\n&#8221; is equivalent to a white space in most of the cases.

Now let&#8217;s go back to Gmail. When I send myself a piece of email with a colorful string &#8220;**<font color="#000099">G</font><font color="#ff0000">o</font><font style="background-color: #ffffff" color="#ffcc00">o</font><font color="#3333ff">g</font><font color="#33cc00">l</font><font color="#ff0000">e</font>**&#8221; via Gmail, I got &#8220;**<font color="#000099">G</font><font color="#ff0000">o</font><font style="background-color: #ffffff" color="#ffcc00">o</font><font color="#3333ff">g</font><font color="#33cc00">l</font><span style="font-weight: bold"></span> <span style="background-color: #330033"></span><span style="color: #cc0000"></span><font color="#ff0000">e</font>**&#8220;. Via viewing the source of the HTML, we can actually find that there is a &#8220;**\n**&#8221; in between those letters. For example, this is a piece of HTML(javascript) excerpted from Gmail source related to this colorful **<font color="#000099">G</font><font color="#ff0000">o</font><font style="background-color: #ffffff" color="#ffcc00">o</font><font color="#3333ff">g</font><font color="#33cc00">l</font><font color="#ff0000">e</font>**<span style="font-weight: bold"></span><span style="background-color: #330033"></span><span style="color: #cc0000"></span>:
  
<span><br /> </span>

<p style="margin-left: 40px">
  <span>\u003cfont color\u003d\&#8221;#000099\&#8221;\>G\u003c/font\>\u003cfont color\u003d\&#8221;#ff0000\&#8221;\>o\u003c/font\>\u003cfont style\u003d\&#8221;background-color:#ffffff\&#8221; color\u003d\&#8221;#ffcc00\&#8221;\>o\u003c/font\>\u003cfont color\u003d\&#8221;#3333ff\&#8221;\>g\u003c/font\>\u003cfont color\u003d\&#8221;#33cc00\&#8221;\>l\u003c/font\>\u003cfont color\u003d\&#8221;#ff0000\&#8221;\>e\u003c/font\></span><span style="font-weight: bold">\n</span> \u003c/div\>\n\u003cdiv\> \u003c/div\>\n\u003cdiv\>
</p>

Here \u003c is &#8220;<&#8220;, \u003d is &#8220;=&#8221;, without the bold &#8220;**\n**&#8221; in this line, the result should be &#8220;**<font color="#000099">G</font><font color="#ff0000">o</font><font style="background-color: #ffffff" color="#ffcc00">o</font><font color="#3333ff">g</font><font color="#33cc00">l</font><font color="#ff0000">e</font>**&#8220;. So, why we have an extra &#8220;\n&#8221; here? Who did this trick? The answer is simple: &#8220;Gmail&#8221;. For some reason, Gmail breaks a long line in HTML source file into multiple lines and sends the email out (I haven&#8217;t figure out the rule that Google uses to break lines in HTML source file). By doing several trival experiments like sending mail from Gmail to Hotmail and vice versa, I am now pretty sure the problem is caused by Gmail automaitc line breaking strategy. That is to say, Gmail client automatically inserts a newline(&#8220;\n&#8221;) symbol in the HTML source file and causes this &#8220;visual bug&#8221;. Actually this bug is quite easy to fix, for instance, just break the line at the first blank after the label name, for example, like:

> <span
  
> style=&#8221;color: rgb(255, 0, 0)&#8221;>red</span><span
  
> style=&#8221;color: rgb(0, 255, 0&#8243;>green</span>

instead of say

> <span style=&#8221;color: rgb(255, 0, 0)&#8221;>red</span>
  
> <span style=&#8221;color: rgb(0, 255, 0&#8243;>green</span>

or

> <span style=&#8221;color: rgb(255, 0, 0)&#8221;>red</span><span style=&#8221;color: rgb(0, 255, 0&#8243;>
  
> green</span>

The first generates &#8220;<span style="color: #ff0000">red</span><span style="color: #33cc00">green</span>&#8220;, and last two give &#8220;<span style="color: #ff0000">red</span> <span style="color: #33ff33">green</span>&#8221;

BTW, here is a nice tip for interviewees: love your prospective employer, love their products. Eventually, you would have a very nice understanding about their culture and products. All companies are willing to hire guys who actually love their culture and products (and can even find bugs :).

PS: in preparing this article, I found that Gmail team has secretly updated the text format system from using plain old <font> to fancy (and elegant) XHTML+CSS <span>.

PS2: <http://www.opinionatedgeek.com/dotnet/tools/Base64Decode/Default.aspx> is a nice online tool for decoding the base64 format.