---
id: 450
title: Install Ubuntu on Dell Vostro 200
date: 2007-10-07T23:40:43+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/10/07/install-ubuntu-on-dell-vostro-200/
permalink: /2007/10/07/install-ubuntu-on-dell-vostro-200/
dsq_thread_id:
  - 401459663
categories:
  - Linux
  - tech
---
[Keywords for search engine: Ubuntu dell vostro 200 live cd can&#8217;t boot harddisk]

Make sure add &#8220;irqpoll&#8221; as the kernel parameter, i.e. :

> title           Ubuntu gutsy, kernel 2.6.22-12-generic (recovery mode)
  
> root            (hd0,0)
  
> kernel          /boot/vmlinuz-2.6.22-12-generic root=UUID=78dea514-8cc8-40a9-9e51-13c359bc681b ro  quite splash **irqpoll**

> initrd          /boot/initrd.img-2.6.22-12-generic

These are cited from [here.](http://grumpymole.blogspot.com/2007/05/ubuntu-how-to-edit-grub-boot-parameters.html)

When the PC boots up, you will see the Grub countdown, which is set to 3 seconds by default. Press &#8220;Esc&#8221; to intercept this countdown and go enter a Grub menu. Then

  * Press &#8216;e&#8217; to start editing.
  * Scroll down to the &#8220;kernel&#8230;&#8221; line. The is the line that tells Grub which kernel to boot with and the parameters to be passed to the kernel when it boots are placed at the end of this line.
  * Press &#8216;e&#8217; again to edit this line.
  * Move to the end of the line. You will see any existing parameters and can add other new parameters to the end. **[Add your irqpoll here]**
  * Parameters are separated by spaces and are mostly either a single word (e.g. nolapic), or an equation (e.g. acpi=off).
  * Once you have added the parameter to the end of the line, press Enter to accept the editing.
  * Then press &#8216;b&#8217; to boot using that kernel and those parameters.

Then, go [here](http://grumpymole.blogspot.com/2007/05/ubuntu-how-to-edit-grub-boot-parameters.html) to see how can you modify the parameter permanently.