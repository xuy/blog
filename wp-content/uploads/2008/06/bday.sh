#!/bin/bash

# Author: Eric You Xu. 
# Use it for free. C5 as C

u=600 		# Basic time unit
u2=1200		
uh=300
d=587.33	# As D5
e=659.26
f_half=739.99	# F#
g=783.99
a=880.00
b=987.77
c_high=1046.60	# C6
d_high=1174.66	# D6

beep -f $d -l $uh
beep -f $d -l $uh
beep -f $e -l $u
beep -f $d -l $u
beep -f $g -l $u
beep -f $f_half  -l $u2

beep -f $d -l $uh
beep -f $d -l $uh
beep -f $e -l $u
beep -f $d -l $u
beep -f $a -l $u
beep -f $g -l $u2

beep -f $d -l $uh
beep -f $d -l $uh
beep -f $d_high -l $u
beep -f $b -l $u
beep -f $g -l $u
beep -f $f_half -l $u
beep -f $e -l $u

beep -f $c_high -l $uh
beep -f $c_high -l $uh
beep -f $b -l $u
beep -f $g -l $u
beep -f $a -l $u
beep -f $g -l $u
