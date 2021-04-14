module Comparador_col(fil, col, tecla, tipo);
	input [3:0]fil;
	input [3:0]col;
	output reg tipo;
	output reg[3:0]tecla;

	always @(*) begin
		//Primera columna
		if(col == 'b1000) begin
			case(fil)
				'b1000: 	begin tecla = 'd1; tipo = 1; end
				'b0100: 	begin tecla = 'd4; tipo = 1; end
				'b0010: 	begin tecla = 'd7; tipo = 1; end
				'b0001: 	begin tecla = 'd10; tipo = 0; end
				default: begin tecla = 'd10; tipo = 0; end
			endcase 
		end
		//Segunda columna
		if(col == 'b0100) begin
			case(fil)
				'b1000: 	begin tecla = 'd2; tipo = 1; end
				'b0100: 	begin tecla = 'd5; tipo = 1; end
				'b0010: 	begin tecla = 'd8; tipo = 1; end
				'b0001: 	begin tecla = 'd0; tipo = 1; end
				default: begin tecla = 'd10; tipo = 0; end
			endcase
		end
		//Tercera columna
		if(col == 'b0010) begin
			case(fil)
				'b1000: 	begin tecla = 'd3; tipo = 1; end
				'b0100: 	begin tecla = 'd6; tipo = 1; end
				'b0010: 	begin tecla = 'd9; tipo = 1; end
				'b0001: 	begin tecla = 'd6; tipo = 0; end
				default: begin tecla = 'd10; tipo = 0; end
			endcase
		end
		//Cuarta columna
		if(col == 'b0001) begin
			case(fil)
				'b1000: 	begin tecla = 'd0; tipo = 0; end
				'b0100: 	begin tecla = 'd1; tipo = 0; end
				'b0010: 	begin tecla = 'd2; tipo = 0; end
				'b0001: 	begin tecla = 'd3; tipo = 0; end
				default: begin tecla = 'd10; tipo = 0; end
			endcase
		end
	end

endmodule 