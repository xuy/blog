---
id: 252
title: Computation and Storage Model for the Web
date: 2007-08-10T01:35:22+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/08/10/computation-and-storge-model-for-the-web/
permalink: /2007/08/10/computation-and-storge-model-for-the-web/
dsq_thread_id:
  - 656246776
categories:
  - CompSci
  - English_Essays
  - Web
---
When I was in collage, I had two classes in computer science, namely, &#8220;Algorithm&#8221; and &#8220;Data Structure&#8221;. These two concepts are universal in both computer programs and software applications, whether on a rescued laptop or a million dollar mainframe. Nowadays, Web becomes tremendously popular, and of course, extends significantly in scalability. Therefore, are there still any general concepts like algorithm and data structure in modeling the web? Here are some incomplete thoughts of mine about the computation and storage model of the web.

1. Google.

For Google search engine, it treats the web as a <span style="font-weight: bold">sorted list</span> based on different keywords. Thus, provided with keywords, the web is sorted by the relevance and PageRank system. Google does both the computation and the storage. For general users, these lists are sorted via some criteria extensively studied by Google; we just get the result out. It seems to me that this is the most successful model for user to access the web. However, sorted list requires both sophisticated sorting mechanism and advanced computational power. Although there are fairly amount of search engines in the world, for most of them, their &#8220;sorting quality&#8221; or &#8220;general coverage&#8221; are not as good as Google.

2. Del.icio.us/YouTube/Flickr/Google Base, etc.

For these and other similar sites, they basically organize the web or some special media files on the web on a <span style="font-weight: bold">tag-based system</span>, or preciously, an <span style="font-weight: bold">n-to-n mapping</span> structure. All these four in this category are the leading websites on their own fields. For instance, YouTube is the largest video-sharing website, etc. I would conclude that n-to-n mapping about the media sharing is suitable for socialized website. We can find other success models elsewhere.

3. Amazon, Facebook, Microsoft and Google&#8217;s Data Storage API.

According to R/WW, today Microsoft announced Windows Live SkyDrive. Facebook actually quietly released the Data Store API beta recently. Amazon has already had the famous S3 service for a while. They are all treating the web storage as <span style="font-weight: bold">Lookup Table</span>. A closer look shows that all these four data storage API sets are trying to let the user to store heterogeneous media as &#8220;object&#8221; and support <span style="font-weight: bold">random accessing via keys</span>. For some startups, this feature is critical as the storage scalability is usually an obstacle. Via using these four APIs, the scalability is hidden or moved to these big name companies. Treating the Web as objects will absolutely simplify the storage model and reduce lots of overhead in scalability. Similar to organizing all files under the same folder or on a disk using the file name as the key, sooner they might need some search tool/index/tag mechanism to get rid of the name space nightmare. Additionally, as meta-information should be stored in this system, a search will take twice the database access. Obviously developers have to do more than simply dump the data in. The bottom line is, data storage pools are not big trucks, developers has to maintain them. But I do see the dawn of gird computation here. Here, this is for storage task, but if we can later provide a similar interface to computational task, we will jump into the era of grid computation.

4. Yahoo! Pipe and Google Mashup Editor, FQL, etc.

There is an article about Yahoo! Pipe named &#8220;web as a database&#8221;. I would rather say that Pipe treads the web as an UNIX file with handy tools dealing with it. Later we got Google Mashup Editor, which is ugly but powerful (at least for me). GME is somehow like Yahoo! Pipe but more natural for programmers. They both tread the Web as a special file (or the concatenate of several files). They provide the &#8220;<span style="font-weight: bold">operation system</span>&#8221; where you can run the services like sorting and filtering on that particular file. They are making some sort of <span style="font-weight: bold">operation system and binary applications</span> on a Google Inside (or Yahoo! Inside) web. FQL is another funny thing worth mention. It models the Facebook data like people and groups as RDB, and FQL/Facebook platform is <span style="font-weight: bold">RDBMS</span>. My conclusion in this section is Yahoo! Pipe might be a GUI for mashup editing and GME is like a console-based editor. It&#8217;s hard to tell which one is better now. Facebook is quite aggressive in reorganizing the web information; guys at Facebook are going to re-model the web in a Facebook manner via the F8 and several millions of users.

5. SUN/SETI@home

While SUN is selling the CPU power at 1$/h to general public, SETI@home utilizes all the idle CPU power around the world. Since I haven&#8217;t done much research on the computational model, I just list these two here. The previous one might become the future of grid computation. Actually SUN is very good at <span style="font-weight: bold">grid computation</span>. The second one is the <span style="font-weight: bold">distributed computation</span>. We also have other computation models like P2P computation or other decentralized computation model. While SUN is treating itself as <span style="font-weight: bold">the CPU for the web</span>, SETI@home is treating <span style="font-weight: bold">the Web as the CPU</span>. It&#8217;s hard to judge which is superior. SUN might be the first several companies who can develop the actually grid computation on the web, with SETI@home project might be the most powerful computer on the web.

Keep in mind that there is <span style="font-weight: bold">not silver bullet</span> in modeling the web. I do believe that if one wants to setup a big company, he/she does need a big picture about how to model the web and how to setup the model.

Again, all ideas here are immature and need to be refined. You are more than welcome to leave comments and suggestions.