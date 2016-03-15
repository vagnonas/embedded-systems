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

module TB2;
	parameter N = 8;
	reg clk, rst, clk_en;
	wire [N-1:0] leds;
			 
	// Initial statement for signal initialization (reset, clk)
	initial begin
		$dumpfile("TB2.vcd");
    $dumpvars(0, TB2);

		clk = 1'b0;
		rst = 1'b1;

		#(`cycle/2) rst = 1'b0;
		#(`cycle * 20) $finish;
	end

	// Always statement to drive the clock goes here
	always begin
		#(`cycle/2) clk = ~clk;
	end

	// Instantiation of the gray_Nbits goes here
	gray_Nbits DUT(.clk(clk), .clk_en(1'b1), .rst(rst), .gray_out(leds));

endmodule
