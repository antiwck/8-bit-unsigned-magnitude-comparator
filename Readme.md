# 8-bit-unsigned-magnitude-comparator
# The 8-bit unsigned magnitude comparator uses full adders to create a 4-bit comparator which can be cascaded to perform comparison of 8-bits, 16-bits and so on unsigned binary numbers.

The program is compiled in Intel Quartus Prime and run under the testbench to perform the functional computation.
The 8-bit unsigned magnitude comparator takes two 8-bit number in binary and compare the two.
The comparator consists of two cascaded 4-bit comparators that is made up of four full adders.

<br />
<p align="center">
  <img src="Sources/4-bit comparator design.png"><br />
  4-bit comparator Design
</p>
<br />
The 4-bit comparator is made up of series arranged full adders that uses logic gate to compute the magnitude comparison.
<br />
As shown in the diagram, the outputs are A <= B, A >= B, and A = B. The circuit design will produce all 1's when the input A and b are equal. Hence, this design is manipulated to compute only A < B/, A > B, and A = B.
<br />
  
<br />
<p align="center">
  <img src="Sources/8-bit comparator design.png"/><br />
  8-bit comparator design
</p>
<br />
<br />
The 8-bit comparator is made up of series arranged 4-bit comparators to compute the magnitude comparison.
<br />

<br />
<p align="center">
  <img src="Sources/Truth Table.png"/><br />
  Truth table
</p>
<br />
<br />
The truth table shows the effective logic behind the magnitude comparator, where the comparison and cascade play a role in determining the comparison.
<br />

<br />
<p align="center">
  <img src="Sources/Result1.png"/><br />
  Result computation 2
</p>
<br />
Second computation:<br />
First number  : 10111001 (185)<br />
Second number : 10111001 (185)<br />
aLesserBout   : 0  <br />
aEqualsBout	  : 1  <br />
aLargerBout   : 0  <br />
<br />

<br />
<p align="center">
  <img src="Sources/Result2.png"/><br />
  Result computation 2
</p>
<br />
Second computation:<br />
First number  : 00111000 (56)<br />
Second number : 00011100 (28)<br />
aLesserBout   : 0  <br />
aEqualsBout	  : 0  <br />
aLargerBout   : 1  <br />
<br />

<br />
<p align="center">
  <img src="Sources/Result3.png"/><br />
  Result computation 3
</p>
<br />
Third computation:<br />
First number  : 01011000 (88)<br />
Second number : 01100100 (100)<br />
aLesserBout   : 1  <br />
aEqualsBout	  : 0  <br />
aLargerBout   : 0  <br />
<br />
