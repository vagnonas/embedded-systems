 /*
 -----------------------------------------------------------------------------
 -----------------------------------------------------------------------------
 -- File           : TB1_Gray.v
 -----------------------------------------------------------------------------
 -- Description    : Verilog testbench for Gray_4bits
 -- --------------------------------------------------------------------------
 -- --------------------------------------------------------------------------
 */
 
`timescale 1ns/1ps
`define cycle 10

module TB3;
	parameter N = 4;
	parameter distance = 100000000;
	reg clk, rst, clk_en;
	wire [N-1:0] leds;

	initial begin
		$dumpfile("TB3.vcd");
    $dumpvars(0, TB3);

		clk = 1'b0;
		rst = 1'b1;

		#(`cycle/2) rst = 1'b0;
		#(`cycle * 100) $finish;
	end

	// Drive the clock 
	always begin
		#(`cycle/2) clk = ~clk;
	end

	// Instantiate the System in the testbench
	GrayCounter_System gc_system (clk, rst, leds);
  
endmodule
