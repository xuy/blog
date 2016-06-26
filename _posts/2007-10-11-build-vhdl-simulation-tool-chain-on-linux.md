---
id: 462
title: Build VHDL simulation tool chain on Linux
date: 2007-10-11T23:53:20+00:00
author: Eric
comments: true
layout: post
guid: http://blog.youxu.info/2007/10/11/build-vhdl-simulation-tool-chain-on-linux/
permalink: /2007/10/11/build-vhdl-simulation-tool-chain-on-linux/
dsq_thread_id:
  - 345689919
categories:
  - CompSci
  - Cool Stuff
  - Linux
---
I take Computer Architecture course this semester and study basic VHDL for digital design. The instructor recommends ModelSim with both Windows and Linux versions. But unfortunately, ModelSim for Linux can only be installed on RH Linux. I tried to install it on Ubuntu but obviously it didn&#8217;t work. It turned out that the only solution would be using ModelSim for Windows in our computer lab. But as a dead-head Linux fan, I simply want to find alternative software to get things done on Linux platform. After some googling and asking help from friends, I found two handy software packages that form a tool chain to do VHDL simulation on Linux: [GHDL](http://ghdl.free.fr/) and [GTKWave](http://home.nc.rr.com/gtkwave/).

_**What**_

GHDL is an amazing package that it employ gcc and compile VHDL code to objective code. It can&#8217;t translate your design into a netlist but it&#8217;s sufficient for us to do the simulation.
  
GTKwave is another tool which can help you view the wave form dumped by GHDL simulation. There two, in principle, can help you handle all the VHDL simulation tasks involved in a one-semester-course like computer architecture.

_**How**_

_Build the tool chain_

If you are using a Debian family (Debian/Ubuntu, etc) Linux, an _apt-get_ will save your life. Try:
  
`apt-get install ghdl`
  
and
  
`apt-get install gtkwave.`
  
[You might need sudo or run it as root.]

If you not, try to download the package and read the README. It&#8217;s easy. If you want to install it on Mac as what I&#8217;ve done, remember to install X11. The whole procedure should take you less than five minutes.

_How to use it_

It&#8217;s very simple. GHDL will compile the VHDL code for you to object code and convert it to executable. For example, if I have CPU.vhdl which is a simple computer description. Try to type:

`ghdl -a cpu.vhdl`

to compile it, and

`ghdl -e cpu`

to make executable file (do linking).

Finally you can use

`./cpu --help`

to see how to run it.

Some tips:
  
If you include ieee package, add this option: &#8211;ieee=synopsys
  
If you want to let the simulation run certain amount of time, use something like
  
`<br />
./cpu --stop-time=100ns`

If you want to dump a signal wave format for gtkwave, just add &#8211;vcd=vcd.file

After that, you can use

gtkwave vcd.file to see the wave. You might need to add all the signals to the wave window via &#8220;Search->Signal Search Tree&#8221;.

**Why**

You might ask why it&#8217;s handy than ModelSim. It&#8217;s obvious. For example, if you write a shell script that can issue all the compiling/dumping/viewing command in the right order, you only need two keyboard stoke to run a test, in comparing with in ModelSim, where you need to do at least 10 mouse click and maybe type these commands:

``I take Computer Architecture course this semester and study basic VHDL for digital design. The instructor recommends ModelSim with both Windows and Linux versions. But unfortunately, ModelSim for Linux can only be installed on RH Linux. I tried to install it on Ubuntu but obviously it didn&#8217;t work. It turned out that the only solution would be using ModelSim for Windows in our computer lab. But as a dead-head Linux fan, I simply want to find alternative software to get things done on Linux platform. After some googling and asking help from friends, I found two handy software packages that form a tool chain to do VHDL simulation on Linux: [GHDL](http://ghdl.free.fr/) and [GTKWave](http://home.nc.rr.com/gtkwave/).

_**What**_

GHDL is an amazing package that it employ gcc and compile VHDL code to objective code. It can&#8217;t translate your design into a netlist but it&#8217;s sufficient for us to do the simulation.
  
GTKwave is another tool which can help you view the wave form dumped by GHDL simulation. There two, in principle, can help you handle all the VHDL simulation tasks involved in a one-semester-course like computer architecture.

_**How**_

_Build the tool chain_

If you are using a Debian family (Debian/Ubuntu, etc) Linux, an _apt-get_ will save your life. Try:
  
`apt-get install ghdl`
  
and
  
`apt-get install gtkwave.`
  
[You might need sudo or run it as root.]

If you not, try to download the package and read the README. It&#8217;s easy. If you want to install it on Mac as what I&#8217;ve done, remember to install X11. The whole procedure should take you less than five minutes.

_How to use it_

It&#8217;s very simple. GHDL will compile the VHDL code for you to object code and convert it to executable. For example, if I have CPU.vhdl which is a simple computer description. Try to type:

`ghdl -a cpu.vhdl`

to compile it, and

`ghdl -e cpu`

to make executable file (do linking).

Finally you can use

`./cpu --help`

to see how to run it.

Some tips:
  
If you include ieee package, add this option: &#8211;ieee=synopsys
  
If you want to let the simulation run certain amount of time, use something like
  
`<br />
./cpu --stop-time=100ns`

If you want to dump a signal wave format for gtkwave, just add &#8211;vcd=vcd.file

After that, you can use

gtkwave vcd.file to see the wave. You might need to add all the signals to the wave window via &#8220;Search->Signal Search Tree&#8221;.

**Why**

You might ask why it&#8217;s handy than ModelSim. It&#8217;s obvious. For example, if you write a shell script that can issue all the compiling/dumping/viewing command in the right order, you only need two keyboard stoke to run a test, in comparing with in ModelSim, where you need to do at least 10 mouse click and maybe type these commands:

`` 
  
Finally, you can use GHDL as your VHDL code formatter and get a very nice HTML format for your neat code. You can now make it even neater, why not :)

Some really missing features for these small tools.

1. Non-standard signal watch.

If you have a signal which is an array, it&#8217;s not handy to view the wave as ghdl doesn&#8217;t actually output the signal changing information for this signal.

2. Automatic dependency solving.

Currently GHDL will complain about the dependency, but it doesn&#8217;t actually handle this like GNU make. Therefore, you have to either write your own makefile to use make to manage your code dependency, or recompile all the code every time.

My example code of a silly CPU:

<pre><font size="-1">    1</font> <font color="green">-- CSE 560 Homework, a simple CPU</font>
<font size="-1">    2</font> <font color="green">-- Eric You XU</font>
<font size="-1">    3</font> <font color="green">--- version 0.05</font>
<font size="-1">    4</font>
<font size="-1">    5</font> <font color="red">library</font> ieee;
<font size="-1">    6</font> <font color="red">use</font> ieee.std_logic_arith.<font color="red">all</font>;
<font size="-1">    7</font> <font color="red">use</font> ieee.std_logic_signed.<font color="red">all</font>;
<font size="-1">    8</font> <font color="red">use</font> ieee.std_logic_1164.<font color="red">all</font>;
<font size="-1">    9</font>
<font size="-1">   10</font> <font color="red">entity</font> CPU <font color="red">is</font>
<font size="-1">   11</font>         <font color="red">port</font> (  IR      :       <font color="red">in</font> std_logic_vector (31 <font color="red">downto</font> 0);
<font size="-1">   12</font>                 READY   :       <font color="red">in</font> bit;
<font size="-1">   13</font>                 CLK     :       <font color="red">in</font> bit
<font size="-1">   14</font>                 );
<font size="-1">   15</font> <font color="red">end</font> <font color="red">entity</font> CPU;
<font size="-1">   16</font>
<font size="-1">   17</font> <font color="red">architecture</font> behav <font color="red">of</font> CPU <font color="red">is</font>
<font size="-1">   18</font>     <font color="red">type</font> reg_type <font color="red">is</font> <font color="red">array</font>(0 <font color="red">to</font> 255) <font color="red">of</font> std_logic_vector(31 <font color="red">downto</font> 0);
<font size="-1">   19</font>     <font color="red">signal</font> storage: reg_type;
<font size="-1">   20</font>
<font size="-1">   21</font>     <font color="red">signal</font> d1, d2: std_logic_vector(31 <font color="red">downto</font> 0);
<font size="-1">   22</font>     <font color="red">signal</font> raw1, raw2: std_logic_vector(31 <font color="red">downto</font> 0);
<font size="-1">   23</font>     <font color="red">signal</font> s1_int, s2_int: integer;
<font size="-1">   24</font>     <font color="red">signal</font> prod: std_logic_vector(63 <font color="red">downto</font> 0);
<font size="-1">   25</font>     <font color="red">signal</font> status:      std_logic_vector(1 <font color="red">downto</font> 0);
<font size="-1">   26</font>     <font color="red">signal</font> phase:       bit;
<font size="-1">   27</font>     <font color="red">signal</font> index:       integer;
<font size="-1">   28</font>     <font color="red">signal</font> opcode:      std_logic_vector(2 <font color="red">downto</font> 0);
<font size="-1">   29</font>     <font color="red">signal</font> needd2:      bit;
<font size="-1">   30</font>
<font size="-1">   31</font> <font color="red">begin</font>
<font size="-1">   32</font>
<font size="-1">   33</font>
<font size="-1">   34</font>
<font size="-1">   35</font> <font color="red">process</font>(clk)
<font size="-1">   36</font>    <font color="red">begin</font>
<font size="-1">   37</font>     <font color="red">if</font> (ready=<font color="blue">'0'</font>) <font color="red">then</font>
<font size="-1">   38</font>         phase &lt;= <font color="blue">'0'</font>;
<font size="-1">   39</font> <font></font><font color="green">-- For test</font>
<font size="-1">40</font> storage(0) &lt;= <font color="blue">X"00000004"</font>;
<font size="-1">   41</font> storage(1) &lt;= <font color="blue">X"FFFFFFFD"</font>;
<font size="-1">   42</font> storage(2) &lt;= <font color="blue">X"01010103"</font>;
<font size="-1">   43</font> storage(3) &lt;= <font color="blue">X"0F0F0F08"</font>;
<font size="-1">   44</font> storage(4) &lt;= <font color="blue">X"F0F0F0F0"</font>;
<font size="-1">   45</font> storage(5) &lt;= <font color="blue">X"FFFFFFFF"</font>;
<font size="-1">   46</font> storage(6) &lt;= <font color="blue">X"00000000"</font>;
<font size="-1">   47</font> storage(7) &lt;= <font color="blue">X"0000000E"</font>;
<font size="-1">   48</font> storage(8) &lt;= <font color="blue">X"00000004"</font>;
<font size="-1">   49</font> storage(9) &lt;= <font color="blue">X"DEADBEEF"</font>;
<font size="-1">   50</font>
<font size="-1">   51</font>      <font color="red">else</font>
<font size="-1">   52</font>        <font color="red">if</font>(clk'<font color="orange">event</font>) <font color="red">then</font>
<font size="-1">   53</font>           <font color="red">if</font>(clk = <font color="blue">'1'</font>) <font color="red">then</font>                    <font color="green">-- CLK _| </font>
<font size="-1">   54</font>               <font color="red">if</font>(phase = <font color="blue">'0'</font>) <font color="red">then</font>              <font color="green">-- state 1, read instructions</font>
<font size="-1">   55</font>
<font size="-1">   56</font>                   opcode        &lt;=      IR(26 <font color="red">downto</font> 24);
<font size="-1">   57</font>                   <font color="green">-- 31 30 29 28 27 26 25 24: Lower 3 bit</font>
<font size="-1">   58</font>                   raw1 &lt;= storage(ieee.std_logic_unsigned.conv_integer( IR(23 <font color="red">downto</font> 16) ));
<font size="-1">   59</font>                   raw2 &lt;= storage(ieee.std_logic_unsigned.conv_integer( IR(15 <font color="red">downto</font> 8) ));
<font size="-1">   60</font>                   <font color="green">-- RAW Hazard </font>
<font size="-1">   61</font>                   <font color="green">--avoid to use s1_int = con_int(raw1)</font>
<font size="-1">   62</font>                   s1_int        &lt;=      ieee.std_logic_signed.conv_integer(storage(ieee.std_logic_unsigned.conv_integer( IR(23 <font color="red">downto</font> 16) )));
<font size="-1">   63</font>                   s2_int        &lt;=      ieee.std_logic_signed.conv_integer(storage(ieee.std_logic_unsigned.conv_integer( IR(15 <font color="red">downto</font> 8) )));
<font size="-1">   64</font>                   index &lt;= ieee.std_logic_unsigned.conv_integer(IR(7 <font color="red">downto</font> 0));
<font size="-1">   65</font>
<font size="-1">   66</font>               <font color="red">else</font>                              <font color="green">-- state 3, write register files</font>
<font size="-1">   67</font>                 <font color="red">case</font> opcode <font color="red">is</font>
<font size="-1">   68</font>                         <font color="red">when</font> <font color="blue">"000"</font> =&gt; <font color="green">-- ADD</font>
<font size="-1">   69</font>                                 storage(index) &lt;= d1;
<font size="-1">   70</font>                         <font color="red">when</font> <font color="blue">"001"</font> =&gt; <font color="green">-- SUB</font>
<font size="-1">   71</font>                                 storage(index) &lt;= d1;
<font size="-1">   72</font>                         <font color="red">when</font> <font color="blue">"011"</font> =&gt;
<font size="-1">   73</font>                                 storage(index) &lt;= d1;
<font size="-1">   74</font>                         <font color="red">when</font> <font color="blue">"100"</font> =&gt; <font color="green">-- INC</font>
<font size="-1">   75</font>                                 storage(index) &lt;= d1;
<font size="-1">   76</font>                         <font color="red">when</font> <font color="blue">"101"</font> =&gt; <font color="green">-- DEC	</font>
<font size="-1">   77</font>                                 storage(index) &lt;= d1;
<font size="-1">   78</font>                         <font color="red">when</font> <font color="blue">"010"</font> =&gt; <font color="green">-- MULT</font>
<font size="-1">   79</font>                                 storage(index) &lt;= prod(31 <font color="red">downto</font> 0);
<font size="-1">   80</font>                                 d2 &lt;= prod(63 <font color="red">downto</font> 32);
<font size="-1">   81</font>                                 d1 &lt;= prod(31 <font color="red">downto</font> 0);
<font size="-1">   82</font>                                 <font color="red">if</font> (index = 255) <font color="red">then</font>
<font size="-1">   83</font>                                          storage(0) &lt;= prod(63 <font color="red">downto</font> 32);
<font size="-1">   84</font>                                 <font color="red">else</font>
<font size="-1">   85</font>                                          storage(index+1) &lt;= prod(63 <font color="red">downto</font> 32);
<font size="-1">   86</font>                                 <font color="red">end</font> <font color="red">if</font>;
<font size="-1">   87</font>                         <font color="red">when</font> <font color="blue">"110"</font> =&gt; <font color="green">-- DIV</font>
<font size="-1">   88</font>                                 storage(index) &lt;= d1;
<font size="-1">   89</font>                                 <font color="red">if</font> (index = 255) <font color="red">then</font>
<font size="-1">   90</font>                                          storage(0) &lt;= d2;
<font size="-1">   91</font>                                 <font color="red">else</font>
<font size="-1">   92</font>                                          storage(index+1) &lt;= d2;
<font size="-1">   93</font>                                 <font color="red">end</font> <font color="red">if</font>;
<font size="-1">   94</font>                         <font color="red">when</font> <font color="red">others</font> =&gt;
<font size="-1">   95</font>                                 <font color="red">report</font> <font color="blue">"Invalid OpCode."</font> <font color="red">severity</font> FAILURE;
<font size="-1">   96</font>                   <font color="red">end</font> <font color="red">case</font>;
<font size="-1">   97</font>              <font color="red">end</font> <font color="red">if</font>;
<font size="-1">   98</font>
<font size="-1">   99</font>            <font color="red">else</font>                                 <font color="green">-- CLK |_		</font>
<font size="-1">  100</font>               <font color="red">if</font>(phase = <font color="blue">'0'</font>) <font color="red">then</font>              <font color="green">-- state 2, ALU step</font>
<font size="-1">  101</font>
<font size="-1">  102</font>                   <font color="red">case</font> opcode <font color="red">is</font>
<font size="-1">  103</font>                      <font color="red">when</font> <font color="blue">"000"</font> =&gt;  <font color="green">-- ADD</font>
<font size="-1">  104</font>                                 d1 &lt;= conv_std_logic_vector((s1_int + s2_int), 32);
<font size="-1">  105</font>                                 needd2 &lt;= <font color="blue">'0'</font>;
<font size="-1">  106</font>                      <font color="red">when</font> <font color="blue">"001"</font> =&gt; <font color="green">-- SUB</font>
<font size="-1">  107</font>                                 d1 &lt;= conv_std_logic_vector((s1_int - s2_int), 32);
<font size="-1">  108</font>                                 needd2 &lt;= <font color="blue">'0'</font>;
<font size="-1">  109</font>                      <font color="red">when</font> <font color="blue">"011"</font> =&gt; <font color="green">-- COMP</font>
<font size="-1">  110</font>                                 d1 &lt;= conv_std_logic_vector((-s1_int - 1), 32);
<font size="-1">  111</font>                                 needd2 &lt;= <font color="blue">'0'</font>;
<font size="-1">  112</font>                      <font color="red">when</font> <font color="blue">"100"</font> =&gt; <font color="green">-- INC</font>
<font size="-1">  113</font>                                 d1 &lt;=  conv_std_logic_vector((s1_int + 1), 32);
<font size="-1">  114</font>                                 needd2 &lt;= <font color="blue">'0'</font>;
<font size="-1">  115</font>                      <font color="red">when</font> <font color="blue">"101"</font> =&gt; <font color="green">-- DEC</font>
<font size="-1">  116</font>                                 d1 &lt;=  conv_std_logic_vector((s1_int - 1), 32);
<font size="-1">  117</font>                                 needd2 &lt;= <font color="blue">'0'</font>;
<font size="-1">  118</font>                      <font color="red">when</font> <font color="blue">"010"</font> =&gt; <font color="green">-- MULT</font>
<font size="-1">  119</font>                                 <font color="green">-- If I assign the prod value to d1 and d2 here, a RAW hazard will occur.			</font>
<font size="-1">  120</font>                                 prod &lt;= raw1 * raw2;
<font size="-1">  121</font>                                 needd2 &lt;= <font color="blue">'1'</font>;
<font size="-1">  122</font>                      <font color="red">when</font> <font color="blue">"110"</font> =&gt; <font color="green">-- DIV</font>
<font size="-1">  123</font>                                 d1 &lt;= conv_std_logic_vector((s1_int/s2_int), 32);
<font size="-1">  124</font>                                 d2 &lt;= conv_std_logic_vector((s1_int <font color="red">rem</font> s2_int), 32);
<font size="-1">  125</font>                                 needd2 &lt;= <font color="blue">'1'</font>;
<font size="-1">  126</font>                      <font color="red">when</font> <font color="red">others</font> =&gt;
<font size="-1">  127</font>                              <font color="red">report</font> <font color="blue">"Invalid OpCode."</font> <font color="red">severity</font> FAILURE;
<font size="-1">  128</font>                   <font color="red">end</font> <font color="red">case</font>;
<font size="-1">  129</font>
<font size="-1">  130</font>
<font size="-1">  131</font>                   phase &lt;= <font color="blue">'1'</font>;
<font size="-1">  132</font>                <font color="red">else</font>                             <font color="green">-- state 4: NOP, Increase PC, etc.</font>
<font size="-1">  133</font>
<font size="-1">  134</font>                   <font color="green">-- Set STATUS ---</font>
<font size="-1">  135</font>                   status &lt;= <font color="blue">"00"</font>;
<font size="-1">  136</font>                   <font color="red">if</font>(needd2 = <font color="blue">'0'</font>) <font color="red">then</font> <font color="green">-- only look at d1</font>
<font size="-1">  137</font>                       <font color="red">if</font> d1 = <font color="blue">X"00000000"</font> <font color="red">then</font>
<font size="-1">  138</font>                           status &lt;= <font color="blue">"01"</font>;
<font size="-1">  139</font>                       <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  140</font>                       <font color="red">if</font> d1(31) = <font color="blue">'1'</font> <font color="red">then</font>
<font size="-1">  141</font>                           status &lt;= <font color="blue">"10"</font>;
<font size="-1">  142</font>                       <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  143</font>                       <font color="red">if</font> d1 = <font color="blue">X"FFFFFFFF"</font> <font color="red">then</font>
<font size="-1">  144</font>                           status &lt;= <font color="blue">"11"</font>;
<font size="-1">  145</font>                       <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  146</font>                   <font color="red">else</font> <font color="green">-- needd2 = 1</font>
<font size="-1">  147</font>                      <font color="red">if</font> d1 = <font color="blue">X"00000000"</font> <font color="red">and</font> d2 = <font color="blue">X"00000000"</font> <font color="red">then</font>
<font size="-1">  148</font>                          status &lt;= <font color="blue">"01"</font>;
<font size="-1">  149</font>                      <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  150</font>                      <font color="red">if</font> d2(31) = <font color="blue">'1'</font> <font color="red">and</font> opcode = <font color="blue">"010"</font> <font color="red">then</font>            <font color="green">-- high order bit of mult is 1</font>
<font size="-1">  151</font>                         status &lt;= <font color="blue">"10"</font>;
<font size="-1">  152</font>                      <font color="red">else</font>
<font size="-1">  153</font>                         <font color="red">if</font> d1(31) = <font color="blue">'1'</font> <font color="red">and</font> opcode = <font color="blue">"110"</font> <font color="red">then</font>         <font color="green">-- high order bit of div is 1</font>
<font size="-1">  154</font>                            status &lt;= <font color="blue">"10"</font>;
<font size="-1">  155</font>                         <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  156</font>                      <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  157</font>                      <font color="red">if</font> d1 = <font color="blue">X"FFFFFFFF"</font> <font color="red">and</font> d2 = <font color="blue">X"FFFFFFFF"</font> <font color="red">then</font>
<font size="-1">  158</font>                          status &lt;= <font color="blue">"11"</font>;
<font size="-1">  159</font>                      <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  160</font>                   <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  161</font>                   <font color="green">------------------</font>
<font size="-1">  162</font>
<font size="-1">  163</font>                   phase &lt;= <font color="blue">'0'</font>;
<font size="-1">  164</font>               <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  165</font>           <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  166</font>        <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  167</font>     <font color="red">end</font> <font color="red">if</font>;
<font size="-1">  168</font>
<font size="-1">  169</font> <font color="red">end</font> <font color="red">process</font>;
<font size="-1">  170</font> <font color="red">end</font> <font color="red">architecture</font> behav;</pre>