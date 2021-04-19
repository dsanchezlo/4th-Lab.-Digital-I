module Barrido_filas(clk20Hz, fil);
	input clk20Hz;
	output reg [3:0] fil;
	reg [1:0] contador;

	initial begin
		contador = 'b0;
	end

	always @(posedge clk20Hz) begin
		case(contador)
			'b00: fil = 'b1000;
			'b01: fil = 'b0100;
			'b10: fil = 'b0010;
			'b11: fil = 'b0001;
		endcase
		contador = contador + 'b1;
	end

endmodule
