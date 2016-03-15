// Switch Debounce Module
// use your system clock for the clock input
// to produce a synchronous, debounced output

module debounce #(parameter DELAY=1000000)   // .01 sec with a 100 Mhz clock
                 (input rst, clk, noisy, output reg clean);
	integer count;

	always @(posedge clk or posedge rst) begin

		if (rst == 1'b1) begin
			count <= 0;
			clean <= 1'b0;
		end
		else begin
			if (noisy == 1'b1) begin
				if (count == DELAY)
					clean <= 1'b1;
				else
					count <= count + 1;
			end
			else begin
				count <= 1'b0;
				clean <= 1'b0;
			end
		end

	end
      
endmodule
