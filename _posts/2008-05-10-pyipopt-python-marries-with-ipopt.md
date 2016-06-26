---
id: 551
title: Pyipopt, Python marries with Ipopt
date: 2008-05-10T14:17:35+00:00
author: Eric
layout: post
guid: http://blog.youxu.info/2008/05/10/pyipopt-python-marries-with-ipopt/
permalink: /2008/05/10/pyipopt-python-marries-with-ipopt/
dsq_thread_id:
  - 348426429
categories:
  - AI
  - Cool Stuff
  - Python
  - Science
---
[Ipopt](https://projects.coin-or.org/Ipopt) is a leading nonlinear optimization tool. There are a bunch of interfaces, e.g. [C/C++ standard interfaces](http://www.coin-or.org/Ipopt/documentation/node27.html), [Java and MATLAB interface](https://projects.coin-or.org/Ipopt/browser/trunk/Ipopt/contrib?rev=1122), [FORTRAN interface](http://www.coin-or.org/Ipopt/ipopt-fortran.html) for programmers.  However, no existing interface to python was presented. I started to connect ipopt with python two months ago inspired by [OpenOpt](http://scipy.org/scipy/scikits/wiki/OpenOpt). After lots of extensive development and nasty testing,  today, I proudly announce that the python interface of ipopt, aka, [pyipopt](http://code.google.com/p/pyipopt/), version alpha, is ready to go.

With the help of this module, in python, you can just use

> import pyipopt
  
> nlp = pyipopt.create(n, xl, xu, m, gl, gu, nnzj, nnzh, f, gradf, g, gradg, h, apply_new)
  
> solution = nlp.solve(x0)

to get your NLP problem which n variables (xl, xu are boundaries for variables), m constraints (gl, gu are boundaries for constraints), and objective function f (gradf is the gradient, h is the Hessian matrix) with constraints g (gradg is the Jacobian value) optimized by IPOPT.

The package is available via google code: [**http://code.google.com/p/pyipopt/**](http://code.google.com/p/pyipopt/)   An OpenOpt hooker is under development.

The code has BSD license. you can use this module whatever you want. For bug report and other related things, reach me at youxu AT wustl.edu.

To write a  package is not rocket science, but it might save you some time in your research.

[Special thanks to Dmitrey Kroshko from [OpenOpt](http://scipy.org/scipy/scikits/wiki/OpenOpt) and [Scipy](http://www.scipy.org/) community; Dominique Orban from [Nlpy](http://nlpy.sourceforge.net/) community]