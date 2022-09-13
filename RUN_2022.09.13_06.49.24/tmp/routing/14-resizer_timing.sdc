###############################################################################
# Created by write_sdc
# Tue Sep 13 06:52:26 2022
###############################################################################
current_design iiitb_ringcounter
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clkin -period 10.0000 [get_ports {clkin}]
set_clock_transition 0.1500 [get_clocks {clkin}]
set_clock_uncertainty 0.2500 clkin
set_propagated_clock [get_clocks {clkin}]
set_input_delay 2.0000 -clock [get_clocks {clkin}] -add_delay [get_ports {reset}]
set_output_delay 2.0000 -clock [get_clocks {clkin}] -add_delay [get_ports {q[0]}]
set_output_delay 2.0000 -clock [get_clocks {clkin}] -add_delay [get_ports {q[1]}]
set_output_delay 2.0000 -clock [get_clocks {clkin}] -add_delay [get_ports {q[2]}]
set_output_delay 2.0000 -clock [get_clocks {clkin}] -add_delay [get_ports {q[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {q[3]}]
set_load -pin_load 0.0334 [get_ports {q[2]}]
set_load -pin_load 0.0334 [get_ports {q[1]}]
set_load -pin_load 0.0334 [get_ports {q[0]}]
set_driving_cell -lib_cell sky130_vsdinv -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clkin}]
set_driving_cell -lib_cell sky130_vsdinv -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]
