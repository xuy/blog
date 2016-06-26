---
id: 394
title: Hack Gmail Player
date: 2006-10-28T12:28:00+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2006/10/28/hack-gmail-player/
permalink: /2006/10/28/hack-gmail-player/
dsq_thread_id:
  - 450307573
categories:
  - Life
---
不知道大家注意到没有，在Gmail 中如果有mp3等文件做附件的时候，可以选择下载，也可以直接点播放。然后就出现一个小窗口就可以播放mp3了。 因为以前一直没有用过mp3做附件，我到今天才发现这个功能。

话说我看到这个以后，十分好奇，立即察看源代码。发现是一个javascript, (我使用的是ＦＦ)。 这个不是办法，于是换用Safari (多平台的好处就体现出来了)。 Safari 下面很清楚的写着这是一个Flash, 地址类似是

http://mail.google.com/mail/html/audio.swf?audioUrl=MP3_UR

好了，告诉大家一个在页面上添加音乐的好办法了， 既不需要上传音乐文件 也不需要下载音乐文件。

只要加入如下一段html 代码

<iframe id=&#8221;musicPlayer&#8221; style=&#8221;border:1px; solid:rgb(170, 170, 170); width:300px; height:25px;&#8221; src=&#8221;http://mail.google.com/mail/html/audio.swf?audioUrl=YOUR_URL&#8221;/>

这个是效果



不喜欢这首加州旅馆么，好的，在下面输入你的mp3 URL, 然后点“换之”，就可以换成你想要的歌曲啦：）

<div>
  <input type="text" id="musicSource" size="50" style="font-size: 90%" value="http://xu.mathena.googlepages.com/CaliforliaHotel.mp3" /><br /> <input type="button" value="换之 " onclick="replaceUrl()" />
</div>

突然有一个小灵感： 可以用Flash 写一个浏览器么，这样通过Flash做代理就可以访问一些网站了。不过想起画蛇添足，好好的代理就解决问题了。呵呵 什么时候真有这个需求了我一定要写一个。

PS: 中国大陆的又不能访问我的Blog了, 我要赶快想办法搞这个, 好让大家可以上我的Blog.