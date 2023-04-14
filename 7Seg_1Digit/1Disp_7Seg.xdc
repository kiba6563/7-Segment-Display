#system clock pin
set_property PACKAGE_PIN H16 [get_ports SYS_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports SYS_CLK]

#system reset pin on push button
set_property PACKAGE_PIN D19 [get_ports SYS_RESET]
set_property IOSTANDARD LVCMOS33 [get_ports SYS_RESET]

#count enable pin on SW1
set_property PACKAGE_PIN M20 [get_ports COUNT_EN]
set_property IOSTANDARD LVCMOS33 [get_ports COUNT_EN]

#seven segment display pins
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG7_DISP[1]}]
#set_property PACKAGE_PIN U17 [get_ports {SEG7_DISP[1]}]
#set_property PACKAGE_PIN R16 [get_ports {SEG7_DISP[2]}]
#set_property PACKAGE_PIN T15 [get_ports {SEG7_DISP[3]}]
#set_property PACKAGE_PIN V15 [get_ports {SEG7_DISP[4]}]
#set_property PACKAGE_PIN V13 [get_ports {SEG7_DISP[5]}]
#set_property PACKAGE_PIN U13 [get_ports {SEG7_DISP[6]}]
#set_property PACKAGE_PIN U12 [get_ports {SEG7_DISP[7]}]
#set_property PACKAGE_PIN T14 [get_ports {SEG7_DISP[8]}]
set_property PACKAGE_PIN V13 [get_ports {SEG7_DISP[1]}]
set_property PACKAGE_PIN V15 [get_ports {SEG7_DISP[2]}]
set_property PACKAGE_PIN T15 [get_ports {SEG7_DISP[3]}]
set_property PACKAGE_PIN T14 [get_ports {SEG7_DISP[4]}]
set_property PACKAGE_PIN R16 [get_ports {SEG7_DISP[5]}]
set_property PACKAGE_PIN U17 [get_ports {SEG7_DISP[6]}]
set_property PACKAGE_PIN U13 [get_ports {SEG7_DISP[7]}]
set_property PACKAGE_PIN U12 [get_ports {SEG7_DISP[8]}]

#uart pins
set_property PACKAGE_PIN F19 [get_ports uart_rtl_rxd]
set_property PACKAGE_PIN F20 [get_ports uart_rtl_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_txd]

set_property IOSTANDARD LVCMOS33 [get_ports {SW1_EN_tri_io[0]}]
