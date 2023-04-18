# 7-Segment 1Digit Display
A PL-PS logic implementation of a decimal number in a 7-Segment display and binary numbers on LEDs. PL side of the logic is implemented by the VHDL code that displays decimal number on 1Digit 7-Segment. The PS logic, implemented by the FPGA SoC, controls the on-board 4-bit LEDs that displays corresponding binary value. 

## Tools
<li> Vivado 2022.2 </li>
<li> Vitis IDE </li>
<li> Pynq-Z2 FPGA board </li>

## Schematic Diagram
![Capture](https://user-images.githubusercontent.com/127403893/227696227-9f1d4e49-a010-4b49-ae1d-f2d6f14f0214.JPG)

## Zynq SoC Block Diagram
![Capture1](https://user-images.githubusercontent.com/127403893/227696239-9fc25921-205e-47f6-a946-b9c2002a47e1.JPG)

## PL-PS Implementation on Pynq-Z2
![Media_230325_102632](https://user-images.githubusercontent.com/127403893/227697108-16021946-1bbd-40b3-98d0-0a29604fb561.gif)
