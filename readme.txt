iverilog -o ring_counter ring_counter.v testbench.v
vvp ring_counter
ctrl+z
gtkwave ring_counter.vcd