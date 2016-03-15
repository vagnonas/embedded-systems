`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:26 02/04/2010 
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
module GrayCounter_System(clk, rst, button, leds);
  parameter N = 4;
  parameter distance = 100000000;// How much for 1 Hz when clk period is 10 ns?
  input clk, rst, button;
  output [N-1:0] leds;
  wire clean_button, pulse;
  
	// Instantiation of the debounce
	debounce debouncer (rst, clk, button, clean_button);
  
  // Instantiation of the GrayCounter_Pulse 
  GrayCounter_Pulse gc_pulse (clk, rst, clean_button, pulse);
	 
  // Instantiation of the gray_Nbits 
  gray_Nbits gc_Nbits (clk, pulse, rst, leds);

endmodule
