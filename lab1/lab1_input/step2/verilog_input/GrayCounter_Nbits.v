 /*
 -----------------------------------------------------------------------------
 -- File           : Gray_Nbits_RTL.v
 -----------------------------------------------------------------------------
 */


module gray_Nbits (clk, clk_en, rst, gray_out);
	parameter N = 8;
	parameter SIZE = (N+1);
	parameter Zeros = {SIZE{1'b0}};
	input clk, clk_en, rst;
	output [N:1] gray_out;
	reg [N:0] state, toggle;
	reg isZero;
	integer i, j;

	// The state of the Gray counter
	always @(posedge clk, rst) begin
		if (rst == 1'b1)
			state <= { {N{1'b0}}, {1'b1} };
		else
			state <= state^toggle;
	end


	// The combinational logic produces the toggle[N:0] signals
	always @(state) begin     
		toggle[0] <=  1'b1;
		toggle[1] <= state[0];	

		for (i = 2; i < N; i = i+1) begin
			isZero = 1'b1;
			for (j = i-2; j >= 0; j = j-1) begin
				isZero = isZero & ~state[j];
			end

			toggle[i] <= state[i-1] & isZero;
		end

		toggle[N] <= ~(|state[N-2:0]);
	end

	assign gray_out = state[N:1];
	 
endmodule
