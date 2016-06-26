---
id: 485
title: 'My plan about the &#8220;Read The F Manual&#8221; Project'
date: 2007-11-10T00:48:22+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2007/11/10/my-plan-about-the-read-the-f-manual-project/
permalink: /2007/11/10/my-plan-about-the-read-the-f-manual-project/
dsq_thread_id:
  - 559078068
categories:
  - Cool Stuff
  - Science
  - tech
---
[](http://blog.youxu.info/wp-content/uploads/2007/11/cv.swf "cv.swf")**A little bit history**

Being in the academical area for years, one of my dreaming tool is an online collaborative paper reader . You can say it&#8217;s YouTube with documents, or Digg with pdf files&#8211;name actually doesn&#8217;t matter. The ultimate goal for this system is to support collaborative document reading/organization for professors and Ph.D. students. Since we now have Ajax (more interactive than before) and Flash(as powerful as PDF), I would expect an light-wighted solution. [arXiv](http://arxiv.org/) and [Citeseer](http://citeseer.ist.psu.edu/) do really good jobs in storing and linking all the documents, but the ultimate goal for me is to read.

On winter 2006, I expanded my ambition to a larger project: read the f source code and read the f books (Here of course the f word means fine :). I launched my domain name rtfsc.org [now redirected to Apache.org]. Our team members thought that rtfsc was easier than rtfm because we only need to deal with text information instead of PDF file. However, we set ourselves on the wrong track. It turned out that if we let the users upload and update their codes all the time, we have to implement a Subversion or even a Sourceforge. For us, an online code-reading community without code management and code search is terrible, but we don&#8217;t have that much time to finish all these ambitions. The other obstacle comes from my lacking experiences of Ajax development. Anyway, at last, we gave up. We stopped the development after Christmas. On that week, I was the person of the year 2006.

**New motivation** 

I have been thinking about this project for nearly one year without any action. Lots of similar projects were there during this year, for example, [flashpaper](http://www.adobe.com/products/flashpaper/), [edocr](http://www.edocr.com/) and [scribd](http://www.scribd.com/). But none of these are my dreaming tool. I took a retrospect about our project again and found that nobody actually wanted to do that except us because they didn&#8217;t actually understand our requirements. Their goals are usually becoming the next DocTube thing, while my goal is to have a handy system open for academical research. Also, I found some open source tools that were really inspiring. These make me interested in the project again.

**Technical aspects:**

1. PDF to SWF is not so that hard, there is an open source tool: [PDF2SWF](http://www.swftools.org/).

2. I thought that I can&#8217;t control the converted SWF as there is no API exposed as Flashpaper, but I was wrong. Actionscript can control it directly. What I need to do is to learn Actionscript, which is not so that hard.

3. I was thought that Flashpaper use some undocumented APIs which we could never know, but I got SWFmill today and now I can study the code of Flashpaper. [Disclaimer: I didn&#8217;t say anything about how to decompile flashpaper or violate the EULA of flashpaper]

4. I thought Ajax + Flash development was hard and had a very steep learning curve, but again I was wrong. On hacking Google Finance these days, I found the Flash Ajax Integration Package, which is very handy to use for some newbie like me without any Ajax/Flash developing experiences.

**Proof of concept** 

Here is a proof of concept product. I convert my PDF version CV to swf and then combined it to a controller I wrote based on the default controller provided in PDF2SWF. (_This CV has two pages, you can proceed to next page by click the red arrow_)

[cv.swf](http://blog.youxu.info/wp-content/uploads/2007/11/cv.swf "cv.swf")

**Final Word**

What I need is an sophisticated viewer which can be as powerful as flashpaper can communicate with other Ajax components on that webpage. So **for developers, if you find this idea interesting and you are good at Ajax/Flash, feel free to take this idea and do it**, as I might not have time to do it or it will take me a long time to finish it. I desperately need an Ajax style flash-based document reader with inline comment support. If you can do thing and get your own startup based on the idea, my only request is letting me be your user.

BTW, if there was some lessons in this project, I would say, **choose the handy tools before you get start.**