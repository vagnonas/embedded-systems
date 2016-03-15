`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// This is the code that generates a pulse for a single cycle every "distance"
// cycles. Note that "distance" * clock period = 1 sec
//////////////////////////////////////////////////////////////////////////////////

module GrayCounter_Pulse(clk, rst, pulse);
	parameter distance = 10;
	input clk, rst;
	output reg pulse;
	integer counter;

	always @(posedge clk, posedge rst) begin
		if (rst == 1'b1) begin
			counter <= 0;
			pulse <= 1'b0;
		end
		else begin
			if (counter < distance)
				counter <= counter + 1;
			else if (counter == distance) begin
				counter <= counter + 1;
				pulse <= 1'b1;
			end
			else begin
					counter <= 0;
					pulse <= 1'b0;
			end
		end
	end
			  
endmodule
