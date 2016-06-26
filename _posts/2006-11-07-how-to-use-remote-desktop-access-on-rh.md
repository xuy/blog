---
id: 402
title: How to use remote desktop access on RH
date: 2006-11-07T15:53:00+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2006/11/07/how-to-use-remote-desktop-access-on-rh/
permalink: /2006/11/07/how-to-use-remote-desktop-access-on-rh/
dsq_thread_id:
  - 486012372
categories:
  - Life
---
I have a server in the lab equipped with RH Linux and 4 Intel Xeon 3.0G CPUs, I would like to make full use of the computational resources. So usually I will employ the server to compile kernel for me, or just submit a large-scale tasks to it. However, every time I must use SSH to get the job done. Now as we have a MATLAB on the server and it is terrible to use MATLAB without any UI. (Maybe you can do that, but I will get mad.) So I decided to use remote desktop access to the server.

It is quite easy, I just follow the [I have a server in the lab equipped with RH Linux and 4 Intel Xeon 3.0G CPUs, I would like to make full use of the computational resources. So usually I will employ the server to compile kernel for me, or just submit a large-scale tasks to it. However, every time I must use SSH to get the job done. Now as we have a MATLAB on the server and it is terrible to use MATLAB without any UI. (Maybe you can do that, but I will get mad.) So I decided to use remote desktop access to the server.

It is quite easy, I just follow the](http://www.redhat.com/docs/manuals/enterprise/RHEL-4-Manual/desktop-guide/ch-ddg-remote-desktop.html) stated on the RH website. However, this is a little
  
bit confusing as it said that
  


>  <span style="color: rgb(204, 51, 204);">These tools only allow you to connect to a user&#8217;s existing session. If the user is not logged in, the connection will fail..</span> </p>
But how can you login without touch the machine. (The machine is locked in a black room and always buzzing.) In fact you can try to ssh and start a session manually like:

<blockquote style="color: rgb(51, 102, 255);">
  <p>
    vncserver -depth 16 -geometry 1024&#215;768
  </p>
</blockquote>

to start a new vncserver, then RH will automatically configure the others for you and return you a desktop address like <span style="color: rgb(51, 102, 255);"></span><span style="color: rgb(51, 51, 255);">XXX.cse.wustl.edu:2</span>

Thus you can use vncviewer on the client side, like

<blockquote style="color: rgb(51, 102, 255);">
  <p>
    vncviewer XX.cse.wustl.edu:2 &#038;
  </p>
</blockquote>

BTW, in Ubuntu, you can use this command to apt-get the vncviewer

<blockquote style="color: rgb(51, 102, 255);">
  <p>
    sudo apt-get install xvncviewer
  </p>
</blockquote>

I will try to install VNCViewer on Mac too :)
  
On Mac, you can simply download VNCViewer from [here](http://homepage.mac.com/kedoin/VNC/VNCViewer/index.html). Now the only problem is: How secure the communication is? Hey, I want to use a SSH-like tunnel. Of course Linux/UNIX can do that. Just bind your local port to the remote port using the commands like:

<blockquote style="color: rgb(51, 102, 255);">
  <p>
    ssh -L 1116:XXX.cse.wustl.edu:5902 youxu@XXX.cse.wustl.edu
  </p>
</blockquote>

This command will bind your local port <span style="color: rgb(204, 0, 0);">1116 </span>to the remote port <span style="color: rgb(204, 0, 0);">5902</span>, which is the the port for your <span style="color: rgb(153, 51, 0);">VNCserver</span>. (Just add 5900 to the two digital number that VNCSever reported to you during booting/starting).
  
<span id="misp_0_1" class="ms cr" title="Click for suggested spellings">Congratulations</span>, now you have a secure X client. Come on and make the full use of your server:)

<span class="down" style="display: block;" id="formatbar_CreateLink" title="Link" onmouseover="ButtonHoverOn(this);" onmouseout="ButtonHoverOff(this);" onmouseup="" onmousedown="CheckFormatting(event);FormatbarButton('richeditorframe', this, 8);ButtonMouseDown(this);"></span>