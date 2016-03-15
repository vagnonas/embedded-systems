`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:55 02/04/2010 
// Design Name: 
// Module Name:    GrayCounter_Nbit_Pulse 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This FSM converts an input level signal to a single-cycle pulse. 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module GrayCounter_Pulse(input clk, input rst, input level, output pulse);

	reg [1:0] state;
	reg [1:0] nextstate;
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;

	// Compute next state of the FSM 
	always @(state, level) begin
		case (state)
			S0:
				begin
					if (level == 1'b0)
						nextstate = S0;
					else
						nextstate = S1;
				end
			S1:
					nextstate = S2;
			S2:
				begin
					if (level == 1'b1)
						nextstate = S2;
					else
						nextstate = S0;
				end
			default:
					nextstate = S0;
		endcase
	end

	// Set the new state 
	always @(posedge clk, posedge rst) begin
		if(rst == 1'b1)
			state <= S0;
		else
			state <= nextstate;
	end

	assign pulse = (state == S1);

endmodule
