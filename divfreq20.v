module divfreq20(clk, clk20Hz);
input clk;
output reg clk20Hz;

reg [20:0]count20;

initial begin
	count20 = 0;
	clk20Hz = 0;
end

always @(posedge clk)begin
	if(count20 < 250_000)begin
		count20 = count20 + 1'd1;
	end else begin
		clk20Hz = !clk20Hz;
		count20 = 0;
	end
end


endmodule