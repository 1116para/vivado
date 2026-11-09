# Main Clock (100MHz)
set_property PACKAGE_PIN B6 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Reset (SW2)
set_property PACKAGE_PIN W3 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# Push Buttons (btn[5:0] = {SM_1, SM_3, SM_4, SM_6, SM_7, SM_9})
set_property PACKAGE_PIN K4 [get_ports {btn[5]}]
set_property PACKAGE_PIN N4 [get_ports {btn[4]}]
set_property PACKAGE_PIN N1 [get_ports {btn[3]}]
set_property PACKAGE_PIN N6 [get_ports {btn[2]}]
set_property PACKAGE_PIN L5 [get_ports {btn[1]}]
set_property PACKAGE_PIN K2 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[*]}]

# DIP Switch (Channel Select: SW1)
set_property PACKAGE_PIN Y1 [get_ports add_sel]
set_property IOSTANDARD LVCMOS33 [get_ports add_sel]

# DAC Control Signals (AD7302)
set_property PACKAGE_PIN E1 [get_ports dac_csn]
set_property PACKAGE_PIN F4 [get_ports dac_ldacn]
set_property PACKAGE_PIN G4 [get_ports dac_wrn]
set_property PACKAGE_PIN G2 [get_ports dac_a_b]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_csn dac_ldacn dac_wrn dac_a_b}]

# DAC Parallel Data Bus (dac_d[7:0])
set_property PACKAGE_PIN B3 [get_ports {dac_d[7]}]
set_property PACKAGE_PIN B1 [get_ports {dac_d[6]}]
set_property PACKAGE_PIN C4 [get_ports {dac_d[5]}]
set_property PACKAGE_PIN C2 [get_ports {dac_d[4]}]
set_property PACKAGE_PIN D5 [get_ports {dac_d[3]}]
set_property PACKAGE_PIN D2 [get_ports {dac_d[2]}]
set_property PACKAGE_PIN E5 [get_ports {dac_d[1]}]
set_property PACKAGE_PIN E3 [get_ports {dac_d[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_d[*]}]

# Monochromatic LEDs (led_out[7:0] = LED1 ~ LED8)
set_property PACKAGE_PIN L4 [get_ports {led_out[7]}]
set_property PACKAGE_PIN M4 [get_ports {led_out[6]}]
set_property PACKAGE_PIN M2 [get_ports {led_out[5]}]
set_property PACKAGE_PIN N7 [get_ports {led_out[4]}]
set_property PACKAGE_PIN M7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN M3 [get_ports {led_out[2]}]
set_property PACKAGE_PIN M1 [get_ports {led_out[1]}]
set_property PACKAGE_PIN N5 [get_ports {led_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[*]}]

# 7-Segment Array Data (seg_data: A, B, C, D, E, F, G, DP)
set_property PACKAGE_PIN F1 [get_ports {seg_data[7]}]
set_property PACKAGE_PIN F5 [get_ports {seg_data[6]}]
set_property PACKAGE_PIN E2 [get_ports {seg_data[5]}]
set_property PACKAGE_PIN E4 [get_ports {seg_data[4]}]
set_property PACKAGE_PIN J1 [get_ports {seg_data[3]}]
set_property PACKAGE_PIN J3 [get_ports {seg_data[2]}]
set_property PACKAGE_PIN J7 [get_ports {seg_data[1]}]
set_property PACKAGE_PIN H2 [get_ports {seg_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_data[*]}]

# 7-Segment Array Select (seg_sel: S0 ~ S7)
set_property PACKAGE_PIN H4 [get_ports {seg_sel[7]}]
set_property PACKAGE_PIN H6 [get_ports {seg_sel[6]}]
set_property PACKAGE_PIN G1 [get_ports {seg_sel[5]}]
set_property PACKAGE_PIN G3 [get_ports {seg_sel[4]}]
set_property PACKAGE_PIN L6 [get_ports {seg_sel[3]}]
set_property PACKAGE_PIN K1 [get_ports {seg_sel[2]}]
set_property PACKAGE_PIN K3 [get_ports {seg_sel[1]}]
set_property PACKAGE_PIN K5 [get_ports {seg_sel[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[*]}]

# Text LCD Control Signals
set_property PACKAGE_PIN G6 [get_ports lcd_rs]
set_property PACKAGE_PIN D6 [get_ports lcd_rw]
set_property PACKAGE_PIN A6 [get_ports lcd_e]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_rs lcd_rw lcd_e}]

# Text LCD Data Bus (LCD_D7 ~ LCD_D0)
set_property PACKAGE_PIN D1 [get_ports {lcd_data[7]}]
set_property PACKAGE_PIN C1 [get_ports {lcd_data[6]}]
set_property PACKAGE_PIN C5 [get_ports {lcd_data[5]}]
set_property PACKAGE_PIN A2 [get_ports {lcd_data[4]}]
set_property PACKAGE_PIN D4 [get_ports {lcd_data[3]}]
set_property PACKAGE_PIN C3 [get_ports {lcd_data[2]}]
set_property PACKAGE_PIN B2 [get_ports {lcd_data[1]}]
set_property PACKAGE_PIN A4 [get_ports {lcd_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data[*]}]