## Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset (active high)
set_property PACKAGE_PIN V17 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Start Signal
set_property PACKAGE_PIN W19 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]

## Input A (signed [7:0])
set_property PACKAGE_PIN U2 [get_ports {A[0]}]
set_property PACKAGE_PIN U1 [get_ports {A[1]}]
set_property PACKAGE_PIN U4 [get_ports {A[2]}]
set_property PACKAGE_PIN R2 [get_ports {A[3]}]
set_property PACKAGE_PIN T7 [get_ports {A[4]}]
set_property PACKAGE_PIN N2 [get_ports {A[5]}]
set_property PACKAGE_PIN M1 [get_ports {A[6]}]
set_property PACKAGE_PIN T8 [get_ports {A[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports A[*]]

## Input B (signed [7:0])
set_property PACKAGE_PIN K2 [get_ports {B[0]}]
set_property PACKAGE_PIN J1 [get_ports {B[1]}]
set_property PACKAGE_PIN H1 [get_ports {B[2]}]
set_property PACKAGE_PIN G2 [get_ports {B[3]}]
set_property PACKAGE_PIN F2 [get_ports {B[4]}]
set_property PACKAGE_PIN E1 [get_ports {B[5]}]
set_property PACKAGE_PIN D1 [get_ports {B[6]}]
set_property PACKAGE_PIN C2 [get_ports {B[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports B[*]]

## Modulus Selection (2 bits)
set_property PACKAGE_PIN B1 [get_ports {mod_sel[0]}]
set_property PACKAGE_PIN R6 [get_ports {mod_sel[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports mod_sel[*]]

## Output P (signed [15:0] for N=8)
set_property PACKAGE_PIN Y1 [get_ports {P[0]}]
set_property PACKAGE_PIN Y2 [get_ports {P[1]}]
set_property PACKAGE_PIN Y3 [get_ports {P[2]}]
set_property PACKAGE_PIN R7 [get_ports {P[3]}]
set_property PACKAGE_PIN Y5 [get_ports {P[4]}]
set_property PACKAGE_PIN Y6 [get_ports {P[5]}]
set_property PACKAGE_PIN Y7 [get_ports {P[6]}]
set_property PACKAGE_PIN Y8 [get_ports {P[7]}]
set_property PACKAGE_PIN P8 [get_ports {P[8]}]
set_property PACKAGE_PIN R8 [get_ports {P[9]}]
set_property PACKAGE_PIN U5 [get_ports {P[10]}]
set_property PACKAGE_PIN U6 [get_ports {P[11]}]
set_property PACKAGE_PIN R5 [get_ports {P[12]}]
set_property PACKAGE_PIN T5 [get_ports {P[13]}]
set_property PACKAGE_PIN Y15 [get_ports {P[14]}]
set_property PACKAGE_PIN Y16 [get_ports {P[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports P[*]]

## Done Signal (can be connected to an LED)
set_property PACKAGE_PIN T14 [get_ports done]
set_property IOSTANDARD LVCMOS33 [get_ports done]
