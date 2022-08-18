`timescale 1ns / 1ps
module stimulus;
	// Inputs
	reg clock;
	reg reset;
	// Outputs
  wire[3:0] q;
	// Instantiate the Unit Under Test (UUT)
	four_bit_ring_counter r1 (
      .clock(clock), 
      .reset(reset), 
      .q(q)
	);
 
  always #10 clock = ~clock;
 
	initial begin
		// Initialize Inputs
    clock = 0;  
	reset = 0;
 
	#5 reset = 1;
	#20 reset = 0; 
	#500 $finish;
    end  
 
		initial begin
			$dumpfile("ringcounter.vcd");
			$dumpvars(0,stimulus);
          $monitor($time, " clock=%1b,reset=%1b,q=%4b",clock,reset,q);
		 end
	 endmodule
