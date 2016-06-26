---
id: 238
title: Fancy Geektool
date: 2007-07-12T22:56:44+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2007/07/12/fancy-geektool/
permalink: /2007/07/12/fancy-geektool/
dsq_thread_id:
  - 338217615
categories:
  - Cool Stuff
  - MacOSX
---
[Lifehacker](http://lifehacker.com/software/top/download-of-the-day--geektool-185802.php) 介绍了一个很好玩的 Mac 下的工具, 叫做 Geektool. 这工具可以直接把命令行结果放到桌面上. 我也做了一个好玩的截图:

<p align="center">
  <a href="http://blog.youxu.info/wp-content/uploads/2007/07/1.jpg" title="1.jpg"><img src="http://blog.youxu.info/wp-content/uploads/2007/07/1.thumbnail.jpg" alt="1.jpg" />[点击可看大图]</a>
</p>

我写了一个 AppleScript, 可以读 iTunes 正在播放歌曲的歌词.

<pre>set notify to "Not playing"
tell application "iTunes"
	if player state is playing then
		set who to artist of current track as string
		set what to name of current track as string
		set lyric to lyrics of current track as string
		set notify to who & " : " & what & (ASCII character of 10) & lyric
	end if
end tell
set notify to replace_chars(notify, ASCII character of 13, ASCII character of 10)
notify

on replace_chars(this_text, search_string, replacement_string)
	set AppleScript's text item delimiters to the search_string
	set the item_list to every text item of this_text
	set AppleScript's text item delimiters to the replacement_string
	set this_text to the item_list as string
	set AppleScript's text item delimiters to ""
	return this_text
end replace_chars
</pre>

然后写一个 Shell 脚本, 去调用这个 AppleScript:

<pre>#!/bin/bashif [[ -n `ps x | grep "iTunes -psn" | grep -v grep` ]]; then
  osascript ~/bin/itunes-playing.scpt
else
  echo "iTunes off"
fi</pre>

最后, 在 Geektool 中设置运行这个脚本就行了. 

本文主要参考[这篇文章](http://www.leancrew.com/all-this/2006/07/off_track.html), 脚本除了歌词部分, 其他都是一样的. 就是歌词折腾了我好久, 原来 Mac 底下换行是 \r, 这样输出到 Shell 就不正确了. (可以尝试一下 printf(&#8220;abc\rdef&#8221;) 就知道为什么了). 最后把输出重定向到文件再用 VIM 才发现全是 ^M. 其实我也考虑到了这个问题, 在程序中替换 &#8220;\r&#8221;, 只是苹果的 Script Editor 很变态, 每次我敲 &#8220;\r&#8221; 都自动换成一个换行, 因此费了好大力气, 找到了一个 ASCII character of 10. 说实话, 从来没见过这么平铺直叙的脚本语言&#8230;

大家用苹果吧 ;)