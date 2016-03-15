`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name:    GrayCounter_System 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Instantiation of the GrayCounter_Nbits and GrayCounter_Pulse models
//
//////////////////////////////////////////////////////////////////////////////////

module GrayCounter_System(clk, rst, leds);
	parameter N = 4;
	parameter distance = 10;
	input clk, rst;
	output [N-1:0] leds;
	wire pulse;
		
	// Instantiation of the GrayCounter_Pulse
	GrayCounter_Pulse	gc_pulse (clk, rst, pulse);
	 
	// Instantiation of the gray_Nbits
	gray_Nbits gc_N_bits (clk, pulse, rst, leds);

endmodule
