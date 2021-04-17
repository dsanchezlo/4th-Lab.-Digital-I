module Comparador_col(fil, col, tecla, tipo, pulsacion);
	input [3:0]fil;
	input [3:0]col;
	output reg tipo;
	output reg[3:0] tecla;
	output reg[3:0] pulsacion;	

	reg [2:0] count;
	
	reg [3:0] ActualCol;

	initial begin
		count = 'b0;
		pulsacion = 'b0;
		ActualCol = 'b0;
	end


	always @(*) begin
		if(col == 'b1000)begin
			ActualCol = 'b1000;
			count = 'd0;
		end else if (col == 'b0100)begin
			ActualCol = 'b0100;
			count = 'd0;
		end else if (col == 'b0010)begin
			ActualCol = 'b0010;
			count = 'd0;
		end else if (col == 'b0001)begin
			ActualCol = 'b0001;
			count = 'd0;
		end else begin
			count = count + 'b1;
		end


		//Primera columna
		if(ActualCol == 'b1000) begin
			if (count > 'd6)begin
				pulsacion = pulsacion + 'd1 ;
				case(fil)
					'b1000: begin tecla = 'd1; tipo = 1;  end
					'b0100: begin tecla = 'd4; tipo = 1; end
					'b0010: begin tecla = 'd7; tipo = 1; end
					'b0001: begin tecla = 'd10; tipo = 0; end
				endcase
			end
		end else
		//Segunda columna
		if(ActualCol == 'b0100) begin
			if (count >= 'd6) begin
				case(fil)
					'b1000: 	begin tecla = 'd2; tipo = 1; end
					'b0100: 	begin tecla = 'd5; tipo = 1; end
					'b0010: 	begin tecla = 'd8; tipo = 1; end
					'b0001: 	begin tecla = 'd0; tipo = 1; end
				endcase
				pulsacion = pulsacion + 'd1 ;
			end 
		end else
		//Tercera columna
		if(ActualCol == 'b0010) begin
			if (count >= 'd6) begin
				case(fil)
					'b1000: 	begin tecla = 'd3; tipo = 1; end
					'b0100: 	begin tecla = 'd6; tipo = 1; end
					'b0010: 	begin tecla = 'd9; tipo = 1; end
					'b0001: 	begin tecla = 'd6; tipo = 0; end
				endcase
				pulsacion = pulsacion + 'd1 ;
			end
		end else
		//Cuarta columna
		if(ActualCol == 'b0001) begin
			if (count >= 'd6) begin
				case(fil)
					'b1000: 	begin tecla = 'd0; tipo = 0; end
					'b0100: 	begin tecla = 'd1; tipo = 0; end
					'b0010: 	begin tecla = 'd2; tipo = 0; end
					'b0001: 	begin tecla = 'd3; tipo = 0; end
				endcase
				pulsacion = pulsacion + 'd1 ;
			end
		end 
		if(pulsacion == 'd1 && tipo == 'd1)begin
			pulsacion = pulsacion + 'b1;
		end
	end

endmodule
