module Comparador_col(fil, col, tecla);
	input [3:0]fil;
	input [3:0]col;
	output reg [3:0] tecla;
	
	always @(*) begin
		if(col == 'b1000)begin //Primera columna
			case(fil)
				'b1000: tecla = 'd15;
				'b0100: tecla = 'd1;
				'b0010: tecla = 'd4;
				'b0001: tecla = 'd7;
			default: tecla = 'd15;
			endcase
		end if (col == 'b0100)begin //Segunda columna
			case(fil)
				'b1000: tecla = 'd0;
				'b0100: tecla = 'd2;
				'b0010: tecla = 'd5;
				'b0001: tecla = 'd8;
			default: tecla = 'd15;
			endcase
		end if (col == 'b0010)begin //Tercera columna
			case(fil)
				'b1000: tecla = 'd14;
				'b0100: tecla = 'd3;
				'b0010: tecla = 'd6;
				'b0001: tecla = 'd9;
			default: tecla = 'd15;
			endcase
		end if (col == 'b0001)begin //Cuarta columna
			case(fil)
				'b1000: tecla = 'd13;
				'b0100: tecla = 'd10;
				'b0010: tecla = 'd11;
				'b0001: tecla = 'd12;
			default: tecla = 'd15;
			endcase
		end
	end

endmodule
