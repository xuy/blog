---
id: 234
title: Some useful tools for you to write English articles on Linux
date: 2007-07-11T22:50:40+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2007/07/11/some-useful-tools-for-you-to-write-english-articles-on-linux/
permalink: /2007/07/11/some-useful-tools-for-you-to-write-english-articles-on-linux/
dsq_thread_id:
  - 339067177
categories:
  - English_Essays
  - Linux
---
As an ESL (English as Second language) student, I usually have a fear of writing articles. Nevertheless, I have to write about one article per week, either for learning English or for recoding my idea. For many people in China, their killer application is Word and Kingsoft Ciba. They simply type a Chinese phrase into the electronic dictionary, copy and paste the English word, do some grammar check in Word. After doing all of this and Word stops reporting any spelling and grammar error, they feel a grant sense of achievement. I was one of them before.

In the meanwhile, as a Linux deadhead, I dislike M$ products emotionally. It seems to me that the only way out is AbiWord or Openoffice. I&#8217;ve used both for a while. Yet, I have to say that they are helpful but not perfect. To use them, I have to prepare a text file, which is inconvenient when you are working on a Tex file. For MacOSX, the other thing is I have to install X11. Don&#8217;t get me wrong, *nix is industrial-strength and designed to do everything solely with the shell. (Well, WoW is the last thing in my mind.)

After a painful Googling, now I have at least four tools helping ESL writing.
  
**
  
1. GNU Aspell.**

[GNU Aspell](http://aspell.net/) is a Free and Open Source spell checker. It supports the spell checking for source codes, script comments, TeX files as well as HTML web page and email. Aspell provides the user both interactive and batch mode. It contains several advanced features that are missing in both M$ Office and OO such as text-file-based user-defined dictionary and &#8220;sound like&#8221; (e.g., know and no). GNU Aspell is definitely for literate programmers or PhD. students who want to write elegant code comments and academic articles.

**2. GNU diction**

[GNU diction](http://www.gnu.org/software/diction/diction.html) is originated from the diction on the AT&T UNIX. It is actually a rule-based style checker. I&#8217;ve read the code thoroughly and found that almost every piece of the rule came from a book titled &#8220;The Elements of Style&#8221; authored by William Strunk. That is to say, you have an &#8220;Elements of Style&#8221; in your pocket now. Please note that the simple grammar checker in Word has nothing to do with style checking. GNU diction is a charming complement to Word/Openoffice if you insist using them.

As it is rule based. It sometimes provides redundant information even your usage is indeed correct. As D.E. Knuth has mentioned in the &#8220;Mathematical Writing&#8221;, the analysis of diction is quite superficial. &#8220;However, said Don, these programs are kind of fun. And they do provide an excuse to read the document from another point of view. Even if the analysis is wrong it does prompt you to re-read your prose, and this has to be a good thing&#8221;.

**3. GNU Style**

GNU style is contained in GNU diction package. It will report the readability of your article in several well-known indexes. For the native speaker, these are used for improving the readability of the article. Nevertheless, for ESL students, these indexes would be viewed as the writing level in terms of &#8220;grade/school year to understand your article for average American&#8221;. In my opinion, we ESL students should prevent using too naive words and too simple sentences in technical writing. Definitely don&#8217;t use a million dollar word where a one-dollar word will do. Yet for ESL students, trying to use some new and sophisticated words would eventually boost the ability in writing.
  
**
  
4. [LanguageTool](http://www.languagetool.org/) (GPLed)**

It is an open source language checker for English and other languages based on Java. I began to use it recently. It&#8217;s better than the embedded grammar checker in Openoffice. Moreover, it does support CLI mode and web mode. This is the missing tool on the Linux platform for grammar checking.

I can remember when I was a collage student, I struggled to write English articles with M$ word or Openoffice. My personal experience with English writing and M$ Word grammar checker brought me the truth that we should never ever rely the quality on the f**king damn grammar checker. As a rule of thumb, the best way to improve ESL writing skill is to write and to practice.

BTW: In preparing this article, I&#8217;ve employed vim, aspell, diction, style, languagetool and other tools on the Linux and Mac platform.