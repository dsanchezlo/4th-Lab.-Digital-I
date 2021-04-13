module Barrido_filas(clk1kHz, fil);
	input clk1kHz;
	output reg [3:0] fil;
	reg [1:0] contador;

	initial begin
		contador = 2'b00;
	end

	always @(posedge clk1kHz) begin
		contador = contador + 2'b1;
		case(contador)
			'b00: fil = 'b1000;
			'b01: fil = 'b0100;
			'b10: fil = 'b0010;
			'b11: fil = 'b0001;
		endcase
	end

endmodule 